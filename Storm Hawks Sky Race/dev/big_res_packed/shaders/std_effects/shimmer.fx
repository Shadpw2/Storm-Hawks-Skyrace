#define ADDITIVE_EFFECT 1
#include "stdinclude.fxh"
#ifdef IN_GAME

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

float opacity
<
	bool artistEditable = true;
	string UIName = "Opacity";
	string UIDesc = "The opacity level of the shimmer";
	float UIMin = 0;
	float UIMax = 2;
	int UIDigits = 1;
> = 1.0;

BW_ARTIST_EDITABLE_ALPHA_TEST
BW_NON_EDITABLE_ADDITIVE_BLEND
BW_NON_EDITABLE_LIGHT_ENABLE

OutputDiffuseLighting vs_main( VertexXYZNUV input )
{
	OutputDiffuseLighting o = (OutputDiffuseLighting)0;

	o.pos = mul(input.pos, worldViewProj);
	o.tc = input.tc;
	o.diffuse = float4(opacity,opacity,opacity,opacity);
	return o;
}

//--------------------------------------------------------------//
// Technique Section for standard
//--------------------------------------------------------------//
technique standard
<
	string channel = "shimmer";
>
{
	pass Pass_0
	{
		BW_BLENDING_ADD
		BW_TEXTURESTAGE_DIFFUSEONLY(0, diffuseMap)
		ALPHAOP[0] = MODULATE;
		ALPHAARG1[0] = TEXTURE;
		ALPHAARG2[0] = DIFFUSE;
		BW_TEXTURESTAGE_TERMINATE(1)
		CULLMODE = (doubleSided ? 1 : 3);

		VertexShader = compile vs_1_1 vs_main();
		PixelShader = NULL;
	}
}
#else
#include "lightonly_add.fx"
#endif //IN_GAME

