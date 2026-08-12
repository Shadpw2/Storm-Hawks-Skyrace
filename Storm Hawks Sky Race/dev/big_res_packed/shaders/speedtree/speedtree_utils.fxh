#include "stdinclude.fxh"

// Set ENABLE_MATRIX_OPT to 0 to disable the matrix array
// optimisaton. Don't forget to do the same in speedtree.fx
#define ENABLE_MATRIX_OPT 1

// for optimisation sake, we're using an array of 
// matrices instead of uploading each matrix at a time.
#if ENABLE_MATRIX_OPT
	float4x4 g_matrices[6];
	#define  g_world                  g_matrices[0]
	#define  g_rotation               g_matrices[1]
	#define  g_projection             g_matrices[2]
	#define  g_worldViewProj          g_matrices[3]
	#define  g_scaleTranslateView     g_matrices[4]
	#define  g_scaleTranslateViewProj g_matrices[5]
#else
	float4x4 g_world;
	float4x4 g_rotation; 
	float4x4 g_projection;
	float4x4 g_worldViewProj;
	float4x4 g_scaleTranslateView;
	float4x4 g_scaleTranslateViewProj;
#endif

float    g_treeScale;
float    g_LeafRockFar;
float4x4 g_windMatrices[4];
float4   g_leafAngles[64];
float4   g_leafAngleScalars;
float4x4 g_leafUnitSquare =                 
	{                                   
		 float4(0.5f, 0.5f, 0.0f, 0.0f), 
		 float4(-0.5f, 0.5f, 0.0f, 0.0f), 
		 float4(-0.5f, -0.5f, 0.0f, 0.0f), 
		 float4(0.5f, -0.5f, 0.0f, 0.0f)
	};

float    fogStart   : FogStart = 0.0;
float    fogEnd     : FogEnd = 1.0;
float4   fogColour  : FogColour = {0,0,0,0};

BW_SKY_LIGHT_MAP_WORLD_SPACE

//--------------------------------------------------------------//
// Utility functions
//--------------------------------------------------------------//

float3x3 calcRotationMatrixZ(float fAngle)
{
    float2 vSinCos;
    sincos(fAngle, vSinCos.x, vSinCos.y);    
    return float3x3(vSinCos.y, -vSinCos.x, 0.0f, 
                    vSinCos.x, vSinCos.y, 0.0f, 
                    0.0f, 0.0f, 1.0f);
}

float3x3 calcRotationMatrixY(float fAngle)
{
    float2 vSinCos;
    sincos(fAngle, vSinCos.x, vSinCos.y);
    return float3x3(vSinCos.y, 0.0f, vSinCos.x,
                    0.0f, 1.0f, 0.0f,
                    -vSinCos.x, 0.0f, vSinCos.y);
}

float3x3 calcRotationMatrixX(float fAngle)
{
    float2 vSinCos;
    sincos(fAngle, vSinCos.x, vSinCos.y);
    return float3x3(1.0f, 0.0f, 0.0f,
                    0.0f, vSinCos.y, -vSinCos.x,
                    0.0f, vSinCos.x, vSinCos.y);
}

//----------------------------------------------------------------------------
// Branches
//----------------------------------------------------------------------------

struct VS_INPUT
{
    float4 pos       : POSITION;
    float3 normal    : NORMAL;
    float2 texCoords : TEXCOORD0;
    float2 windInfo  : TEXCOORD1;
};

OutputDiffuseLighting calcBranchVertex( const VS_INPUT input )
{
	OutputDiffuseLighting output = (OutputDiffuseLighting) 0;
	
	output.tc = input.texCoords;
	
	// interpolate between original 
	// position and full wind-blown 
	// position using the wind weight
	int windMatrixIndex  = input.windInfo.x;
	float windWeight     = input.windInfo.y;
	float4 rotatedPoint  = mul(input.pos, g_rotation);
	float4 fullWindPoint = mul(rotatedPoint, g_windMatrices[windMatrixIndex]);
	float4 centerPoint   = lerp(rotatedPoint, fullWindPoint, windWeight);
	float4 windyPoint    = mul(centerPoint, g_scaleTranslateViewProj);
	output.pos           = windyPoint;
	
	// sky light map (clouds shadow)
	float4 worldPos = mul(input.pos, g_world);
	BW_SKY_MAP_COORDS_WORLD_SPACE( output, worldPos )
	
	float2 fogging = float2(
		(-1.0 / (fogEnd - fogStart)), 
		(fogEnd / (fogEnd - fogStart)));
	output.fog = output.pos.w * fogging.x + fogging.y;
	
	return output;
}

//----------------------------------------------------------------------------
// Leaves
//----------------------------------------------------------------------------

struct VS_INPUT_LEAF
{
    float4 pos       : POSITION;
    float3 normal    : NORMAL;
    float2 texCoords : TEXCOORD0;
    float2 windInfo  : TEXCOORD1;
    float2 rotInfo   : TEXCOORD2;
    float2 extraInfo : TEXCOORD3;
    float2 geomInfo  : TEXCOORD4;
    float2 pivotInfo : TEXCOORD5;
};	

float4 calcLeafVertex( const VS_INPUT_LEAF input )
{
	// interpolate between original 
	// position and full wind-blown 
	// position using the wind weight
	int windMatrixIndex  = input.windInfo.x;
	float windWeight     = input.windInfo.y;
	float4 rotatedPoint  = mul(input.pos, g_rotation);
	float4 fullWindPoint = mul(rotatedPoint, g_windMatrices[windMatrixIndex]);
	float4 centerPoint   = lerp(rotatedPoint, fullWindPoint, windWeight);
	centerPoint          = mul(centerPoint, g_scaleTranslateView);
	
	// compute rock and rustle values
	int leafAnglesIndex      = input.extraInfo.x;
	float2 leafRockAndRustle = 
		g_leafAngleScalars.xy * 
		g_leafAngles[leafAnglesIndex].xy;
	
	leafRockAndRustle = leafRockAndRustle * (1-saturate(centerPoint.z/g_LeafRockFar));
	
	// orient, rock, and rustle the leaf card
	float rotAngleX  = input.rotInfo.x;
	float rotAngleY  = input.rotInfo.y;
	float3x3 matRotation = calcRotationMatrixY(rotAngleX + leafRockAndRustle.y);
	matRotation = mul(matRotation, calcRotationMatrixZ(rotAngleY));
	matRotation = mul(matRotation, calcRotationMatrixX(leafRockAndRustle.x));
	
	// access leafUnitSquare matrix 
	// with corner index and apply scales
	int leafUnitSquareIndex = input.extraInfo.y;
	float3 pivotedPoint = g_leafUnitSquare[leafUnitSquareIndex].xyz * g_treeScale;
	
	// adjust by pivot point so rotation occurs around the correct point
	//float2 pivotPoint = input.pivotInfo.xy;
	//pivotedPoint.xy += pivotPoint;
	float3 corner = pivotedPoint * input.geomInfo.xyx;
	
	// apply composite rotation (billboard
	// + rock/rustle) to scaled corner
	centerPoint.xyz += mul(matRotation, corner);
	return centerPoint;
}
