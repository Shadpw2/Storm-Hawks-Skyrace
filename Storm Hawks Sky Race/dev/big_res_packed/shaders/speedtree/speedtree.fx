#include "speedtree_utils.fxh"

texture g_diffuseMap;
float4  g_material[2];
float4  g_sun[3];

bool    g_texturedTrees = true;
bool    g_cullEnabled   = true;

float4   g_bbAlphaRefs[64];
float	   g_bbAlphaRef;

float4x4 g_viewProj;
float4	g_cameraDir;
float2   g_UVScale;

float    g_leafLightAdj;

// used by BW_BLENDING_SOLID
bool alphaTestEnable = true;
int  alphaReference = 0;
bool lightEnable;


struct Output
{
	float4 pos     : POSITION;
	float2 uv      : TEXCOORD0;
	float4 diffuse : COLOR0;
	float fog      : FOG;
};


sampler diffuseSampler = sampler_state
{
	Texture = (g_diffuseMap);
	ADDRESSU = WRAP;
	ADDRESSV = WRAP;
	ADDRESSW = WRAP;
	MAGFILTER = LINEAR;
	MINFILTER = LINEAR;
	MIPFILTER = LINEAR;
	MAXMIPLEVEL = 0;
	MIPMAPLODBIAS = 0;
};

//----------------------------------------------------------------------------
// Branches
//----------------------------------------------------------------------------

OutputDiffuseLighting vs_branches(const VS_INPUT input)
{
	OutputDiffuseLighting output = calcBranchVertex(input);
		
	float3 normal = mul(input.normal, g_world);
	normal = normalize(normal);
	float ndotl = dot(normal, g_sun[0]);
	float4 diffuse = g_material[0] * g_sun[1];
	float4 ambient = g_material[1] * g_sun[2];
	output.diffuse.xyz = saturate(ndotl*diffuse + ambient);
	output.diffuse.w = 1.0f;
	
	return output;
};

technique branches
{
	pass Pass_0
	{
		BW_FOG		
		BW_BLENDING_SOLID		
		DESTBLEND   = ZERO;
		
		BW_TEXTURESTAGE_DIFFUSEONLY(0, g_diffuseMap)
		COLOROP[0]  = (g_texturedTrees ? 4 : 3);
		
		BW_TEXTURESTAGE_CLOUDMAP(CLOUDMAP_STAGE)
		BW_TEXTURESTAGE_TERMINATE(CLOUDMAP_STAGE_PLUS1)		
		CULLMODE    = (g_cullEnabled ? 2 : 1);
				
		VertexShader= compile vs_1_1 vs_branches();
		PixelShader = NULL;
	}
}

//----------------------------------------------------------------------------
// Billboards
//----------------------------------------------------------------------------

struct VS_INPUT_BB
{
    float4 pos         : POSITION;
    float3 lightNormal : NORMAL;
    float3 alphaNormal : TEXCOORD0;
    float2 texCoords   : TEXCOORD1;
};	

OutputDiffuseLighting vs_billboards(const VS_INPUT_BB v)
{
	OutputDiffuseLighting o = (OutputDiffuseLighting) 0;
	o.tc.xy = v.texCoords.xy;
	
	o.pos = mul(v.pos, g_worldViewProj);
	
	float2 fogging = float2(
		(-1.0 / (fogEnd - fogStart)), 
		(fogEnd / (fogEnd - fogStart)));
	o.fog = o.pos.w * fogging.x + fogging.y;

	float3 lightNormal = mul(v.lightNormal, g_world);
	lightNormal = normalize(lightNormal);
	float ndotl = dot(lightNormal, g_sun[0].xyz);
	float4 diffuse = g_sun[1];
	float4 ambient = g_sun[2];
	o.diffuse.xyz = saturate(ndotl*diffuse + ambient);

	// sky light map (clouds shadow)
	float4 worldPos = mul(v.pos, g_world);
	BW_SKY_MAP_COORDS_WORLD_SPACE( o, worldPos )

	float3 alphaNormal = mul(v.alphaNormal, g_world);
	alphaNormal = normalize(alphaNormal);
	float cameraDim = abs(dot(alphaNormal, g_cameraDir.xyz));
	o.diffuse.w = 1.0f - ((1.0f-g_bbAlphaRef)*cameraDim);

	return o;
};

technique billboards
{
	pass Pass_0
	{
		BW_FOG
		BW_BLENDING_SOLID
		
		COLOROP[0]       = (g_texturedTrees ? 4 : 3);
		COLORARG1[0]     = TEXTURE;
		COLORARG2[0]     = DIFFUSE;
		ALPHAOP[0]       = SUBTRACT;
		ALPHAARG1[0]     = TEXTURE;
		ALPHAARG2[0]     = DIFFUSE;
		Texture[0]       = (g_diffuseMap);
		ADDRESSU[0]      = WRAP;
		ADDRESSV[0]      = WRAP;
		ADDRESSW[0]      = WRAP;
		MAGFILTER[0]     = LINEAR;
		MINFILTER[0]     = LINEAR;
		MIPFILTER[0]     = LINEAR;
		MAXMIPLEVEL[0]   = 0;
		MIPMAPLODBIAS[0] = 0;
		TexCoordIndex[0] = 0;
			
		BW_TEXTURESTAGE_CLOUDMAP(CLOUDMAP_STAGE)
		BW_TEXTURESTAGE_TERMINATE(CLOUDMAP_STAGE_PLUS1)		
		CULLMODE = CW;
		
		VertexShader = compile vs_1_1 vs_billboards();		
		PixelShader = NULL;
	}
}

//----------------------------------------------------------------------------
// Billboards optimised
//----------------------------------------------------------------------------

struct VS_INPUT_BB_OPT
{
    float4 pos         : POSITION;
    float3 lightNormal : NORMAL;
    float3 alphaNormal : TEXCOORD0;
    float2 texCoords   : TEXCOORD1;
    float  alphaIndex  : TEXCOORD2;
    float4 alphaMask   : TEXCOORD3;
};

OutputDiffuseLighting vs_billboards_opt(const VS_INPUT_BB_OPT v)
{
	OutputDiffuseLighting o = (OutputDiffuseLighting) 0;
	o.tc.xy = v.texCoords.xy * g_UVScale.xy;
	
	o.pos = mul(v.pos, g_viewProj);
	
	float2 fogging = float2(
		(-1.0 / (fogEnd - fogStart)), 
		(fogEnd / (fogEnd - fogStart)));
	o.fog = o.pos.w * fogging.x + fogging.y;

	float ndotl = dot(v.lightNormal, g_sun[0].xyz);
	float4 diffuse = g_sun[1];
	float4 ambient = g_sun[2];
	o.diffuse.xyz = saturate(ndotl*diffuse + ambient);

	// sky light map (clouds shadow)
	BW_SKY_MAP_COORDS_WORLD_SPACE( o, v.pos )

	float cameraDim = abs(dot(v.alphaNormal, g_cameraDir.xyz));
	float bbAlphaRef = dot(g_bbAlphaRefs[v.alphaIndex], v.alphaMask);
	o.diffuse.w = 1.0f - ((1.0f-bbAlphaRef)*cameraDim);
	
	return o;
};

technique billboards_opt
{
	pass Pass_0
	{
		BW_FOG		
		BW_BLENDING_SOLID

		COLOROP[0]       = (g_texturedTrees ? 4 : 3);
		COLORARG1[0]     = TEXTURE;
		COLORARG2[0]     = DIFFUSE;
		ALPHAOP[0]       = SUBTRACT;
		ALPHAARG1[0]     = TEXTURE;
		ALPHAARG2[0]     = DIFFUSE;
		Texture[0]       = (g_diffuseMap);
		ADDRESSU[0]      = CLAMP;
		ADDRESSV[0]      = CLAMP;
		ADDRESSW[0]      = CLAMP;
		MAGFILTER[0]     = LINEAR;
		MINFILTER[0]     = LINEAR;
		MIPFILTER[0]     = LINEAR;
		MAXMIPLEVEL[0]   = 0;
		MIPMAPLODBIAS[0] = 0;
		TexCoordIndex[0] = 0;
				
		BW_TEXTURESTAGE_CLOUDMAP(CLOUDMAP_STAGE)
		BW_TEXTURESTAGE_TERMINATE(CLOUDMAP_STAGE_PLUS1)		
		CULLMODE = CW;
		
		VertexShader = compile vs_1_1 vs_billboards_opt();		
		PixelShader = NULL;
	}
}

//----------------------------------------------------------------------------
// Leaves
//----------------------------------------------------------------------------

OutputDiffuseLighting vs_leaves( const VS_INPUT_LEAF input )
{
	OutputDiffuseLighting o = (OutputDiffuseLighting)0;
	
	float4 outPosition = calcLeafVertex(input);
	o.pos = mul(outPosition, g_projection);
	
	// sky light map (clouds shadow)
	float4 worldPos = mul(input.pos, g_world);
	BW_SKY_MAP_COORDS_WORLD_SPACE( o, worldPos )
	
	// pass through other texcoords 
	// exactly as they were received
	o.tc = input.texCoords;
	
	float2 fogging = float2(
		(-1.0 / (fogEnd - fogStart)), 
		(fogEnd / (fogEnd - fogStart)));
	o.fog = o.pos.w * fogging.x + fogging.y;
	
	float3 normal = mul(input.normal, g_world);
	normal = normalize(normal);
	float ndotl  = max(dot(normal, g_sun[0]), g_leafLightAdj);
	float4 diffuse = g_material[0] * g_sun[1];
	float4 ambient = g_material[1] * g_sun[2];
	o.diffuse.xyz = saturate(ndotl*diffuse + ambient);

	return o;
}

technique leaves
{
	pass Pass_0
	{
		BW_FOG		
		BW_BLENDING_SOLID
		DESTBLEND   = ZERO;
		
		BW_TEXTURESTAGE_DIFFUSEONLY(0, g_diffuseMap)
		COLOROP[0]  = (g_texturedTrees ? 4 : 3);
		
		BW_TEXTURESTAGE_CLOUDMAP(CLOUDMAP_STAGE)
		BW_TEXTURESTAGE_TERMINATE(CLOUDMAP_STAGE_PLUS1)		
		CULLMODE = CW;
				
		VertexShader= compile vs_2_0 vs_leaves();
		PixelShader = NULL;
	}
}
