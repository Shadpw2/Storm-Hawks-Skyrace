#define ADDITIVE_EFFECT 1
#include "stdinclude.fxh"

// Auto variables
float4x4 viewProj : ViewProjection;
float4x4 world : World;
float4x4 view : View;
float3 cameraPos : CameraPos;

// Exposed artist editable variables.

texture diffuseMap 
< 
	bool artistEditable = true; 
	string UIName = "Diffuse Map";
	string UIDesc = "The diffuse map for the material";
>;

bool doubleSided
<
	bool artistEditable = true;
	string UIName = "Double Sided";
	string UIDesc = "Whether the material is drawn on both sides";
> = false;

BW_ARTIST_EDITABLE_ALPHA_TEST
BW_ARTIST_EDITABLE_ADDITIVE_BLEND

bool lightEnable = false;


#ifdef IN_GAME
float fogStart : FogStart = 0.0;
float fogEnd : FogEnd = 1.0;
float4 fogColour : FogColour = {0,0,0,0};

OutputDiffuseLighting vs_main( VertexXYZNUV input)
{
	OutputDiffuseLighting o = (OutputDiffuseLighting)0;
	
	float4x4 w = world;
	
	float3 up = w[1].xyz;
	float3 ahead = normalize(w[3].xyz - cameraPos);
	float3 side = normalize(cross( up, ahead));
	ahead = normalize(cross( side, up ));
	
	float aheadScale = length(w[2].xyz);
	float sideScale = length(w[0].xyz);
	
	float4x4 newWorld = float4x4( float4(side * sideScale,0), float4(up,0), float4(ahead * aheadScale,0), float4(w[3].xyz,1) );

	float3 pos = mul( input.pos, newWorld );
	
	
	o.pos = mul(float4(pos,1), viewProj);
	o.tc = input.tc;
	
	BW_SKY_MAP_COORDS_OBJECT_SPACE( o, input.pos )		
	
	o.diffuse = float4(1,1,1,1);

	float2 fogging = float2((-1.0 / (fogEnd - fogStart)), (fogEnd / (fogEnd - fogStart)));
	o.fog = o.pos.w * fogging.x + fogging.y;

	return o;
}

//--------------------------------------------------------------//
// Technique Section for standard
//--------------------------------------------------------------//
technique standard
<
	string channel = "sorted";
>
{
	pass Pass_0
	{
		BW_BLENDING_ADD
		BW_FOG_ADD
		BW_TEXTURESTAGE_DIFFUSEONLY(0, diffuseMap)
		ADDRESSU[0] = CLAMP;
		ADDRESSV[0] = CLAMP;
		ADDRESSW[0] = CLAMP;
		
		BW_TEXTURESTAGE_TERMINATE(1)
		CULLMODE = (doubleSided ? 1 : 3);
		
		VertexShader = compile vs_1_1 vs_main();
		PixelShader = NULL;
	}
}

#else

float4x4 viewInverse : ViewI;
float4x4 projection : Projection;

OutputDiffuseLighting vs_max( VertexXYZNUV input )
{
	OutputDiffuseLighting o = (OutputDiffuseLighting)0;
	
	float4x4 w = world;
	
	float3 up = w[2].xyz;
	float3 ahead = normalize(w[3].xyz - viewInverse[3].xyz);
	float3 side = normalize(cross( ahead, up));
	ahead = normalize(cross( up, side ));
	
	float aheadScale = length(w[2].xyz);
	float sideScale = length(w[0].xyz);
	
	float4x4 newWorld = float4x4( float4(side * sideScale,0), float4(ahead * aheadScale,0), float4(up,0), float4(w[3].xyz,1) );

	float3 pos = mul( input.pos, newWorld );
	
	
	o.pos = mul(float4(pos,1), mul(view, projection));
	o.tc = input.tc;
	
	o.diffuse = float4(1,1,1,1);

	return o;
}

technique max_preview
{
	pass max_pass
	{
		BW_BLENDING_ADD		
		BW_TEXTURESTAGE_DIFFUSEONLY(0, diffuseMap)
		BW_TEXTURESTAGE_TERMINATE(1)
		CULLMODE = (doubleSided ? 1 : 2);
		VertexShader = compile vs_1_1 vs_max();
		PixelShader = NULL;
	}
}

#endif

#undef ADDITIVE_EFFECT