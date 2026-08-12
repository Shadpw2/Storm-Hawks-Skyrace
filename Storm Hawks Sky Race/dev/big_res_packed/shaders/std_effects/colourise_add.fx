#include "stdinclude.fxh"

// Auto variables
float4x4 worldViewProj : WorldViewProjection;

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
	string UIDesc = "Whether the material is draw on both sides";
> = false;

float4 colour
<
	bool artistEditable = true;
	string UIWidget = "Color";
	string UIName = "Colour";
	string UIDesc = "The colour tint of the colorisation";
> = {1,1,1,1};

#ifdef MOD2X
float diffuseLightExtraModulation 
< 
	bool artistEditable = true;
	string UIName = "Diffuse Light Extra Modulation";
	string UIDesc = "The diffuse light extra modulation factor"; 
	float UIMin = 0;
	float UIMax = 2;
	int UIDigits = 1;
> = 1.0;
#endif

BW_ARTIST_EDITABLE_ALPHA_TEST
BW_NON_EDITABLE_ADDITIVE_BLEND
BW_NON_EDITABLE_LIGHT_ENABLE

#ifdef IN_GAME

struct OutputVertex
{
	float4 pos:     POSITION;
	float2 tc:      TEXCOORD0;
	float fog: 	FOG;
};

float fogStart : FogStart = 0.0;
float fogEnd : FogEnd = 1.0;
float4 fogColour : FogColour = {0,0,0,0};

OutputVertex vs_main( VertexXYZNUV input )
{
	OutputVertex o = (OutputVertex)0;

	o.pos = mul(input.pos, worldViewProj);
	o.tc = input.tc;
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
		TEXTUREFACTOR = (colour);
		BW_TEXTURESTAGE_DIFFUSEONLY(0, diffuseMap)
		COLOROP[0] = MODULATE;
		COLORARG1[0] = TEXTURE;
		COLORARG2[0] = TFACTOR;
		ALPHAOP[0] = MODULATE;
		ALPHAARG1[0] = TEXTURE;
		ALPHAARG2[0] = TFACTOR;
		BW_TEXTURESTAGE_TERMINATE(1)
		CULLMODE = (doubleSided ? 1 : 3);
		
		VertexShader = compile vs_1_1 vs_main();
		PixelShader = NULL;
	}
}

#else

struct OutputVertex
{
	float4 pos:     POSITION;
	float2 tc:      TEXCOORD0;
};

OutputVertex vs_max( VertexXYZNUV input )
{
	OutputVertex o = (OutputVertex)0;

	o.pos = mul(input.pos, worldViewProj);
	o.tc = input.tc;
	return o;
}

technique max_preview
{
	pass Pass_0
	{
		BW_BLENDING_ADD
		TEXTUREFACTOR = (colour);
		BW_TEXTURESTAGE_DIFFUSEONLY(0, diffuseMap)
		COLOROP[0] = MODULATE;
		COLORARG1[0] = TEXTURE;
		COLORARG2[0] = TFACTOR;
		ALPHAOP[0] = MODULATE;
		ALPHAARG1[0] = TEXTURE;
		ALPHAARG2[0] = TFACTOR;
		BW_TEXTURESTAGE_TERMINATE(1)
		CULLMODE = (doubleSided ? 1 : 2);
		
		VertexShader = compile vs_1_1 vs_max();
		PixelShader = NULL;
	}
}

#endif