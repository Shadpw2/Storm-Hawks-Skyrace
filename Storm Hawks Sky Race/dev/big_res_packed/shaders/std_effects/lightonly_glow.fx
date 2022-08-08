#include "stdinclude.fxh"

// Auto variables
float4x4 worldViewProj : WorldViewProjection;

// Exposed artist editable variables.

float  glowFactor 
< 
	bool artistEditable = true; 
	string UIName = "Glow Factor";
	string UIDesc = "The scalar factor to scale the glow map by";
	float UIMin = 0;
	float UIMax = 2;
	int UIDigits = 1;
> = 1;

texture glowMap 
<
	bool artistEditable = true;
	string UIName = "Glow Map";
	string UIDesc = "The glow map for the material";
>;

texture diffuseMap 
< 
	bool artistEditable = true; 
	string UIName = "Diffuse Map";
	string UIDesc = "The diffuse map for the material";
>;

float selfIllumination
< 
	bool artistEditable = true;
	string UIName = "Self Illumination";
	string UIDesc = "The self illumination factor for the material";
	float UIMin = 0;
	float UIMax = 1;
	int UIDigits = 1;
> = 0.0;

bool doubleSided
<
	bool artistEditable = true;
	string UIName = "Double Sided";
	string UIDesc = "Whether the material is draw on both sides";
> = false;

BW_ARTIST_EDITABLE_ALPHA_TEST
BW_ARTIST_EDITABLE_LIGHT_ENABLE

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

#ifdef IN_GAME
bool staticLighting : StaticLighting = false;
float fogStart : FogStart = 0.0;
float fogEnd : FogEnd = 1.0;
float4 fogColour : FogColour = {0,0,0,0};

// Define the lighting type used in this shader
BW_SKY_LIGHT_MAP_OBJECT_SPACE
DIFFUSE_LIGHTING_OBJECT_SPACE


OutputDiffuseLighting vs_main( VertexXYZNUV input, 
	uniform int nDirectionals, 
	uniform int nPoints, 
	uniform int nSpots )
{
	OutputDiffuseLighting o = (OutputDiffuseLighting)0;

	o.pos = mul(input.pos, worldViewProj);
	o.tc = input.tc;	
	
	BW_SKY_MAP_COORDS_OBJECT_SPACE( o, input.pos )	
	
	o.diffuse = ambientColour + selfIllumination;
	
	for (int i = 0; i < nDirectionals; i++)
	{
		o.diffuse.xyz += directionalLight( input.normal, osDirectionalLights[i] );
	}

	for (int i = 0; i < nPoints; i++)
	{
		o.diffuse.xyz += pointLight( input.pos, input.normal, osPointLights[i] );
	}

	for (int i = 0; i < nSpots; i++)
	{
		o.diffuse.xyz += spotLight( input.pos, input.normal, osSpotLights[i] );
	}
	
#ifdef MOD2X
	o.diffuse.xyz *= 0.5 * (1 + diffuseLightExtraModulation);
#endif

	float2 fogging = float2((-1.0 / (fogEnd - fogStart)), (fogEnd / (fogEnd - fogStart)));
	o.fog = o.pos.w * fogging.x + fogging.y;

	return o;
}

OutputDiffuseLighting vs_mainStaticLighting( VertexXYZNUV_D input, 
	uniform int nDirectionals, 
	uniform int nPoints, 
	uniform int nSpots )
{
	OutputDiffuseLighting o = (OutputDiffuseLighting)0;

	o.pos = mul(input.pos, worldViewProj);
	o.tc = input.tc;	
	
	o.diffuse = input.diffuse + selfIllumination;
	
	for (int i = 0; i < nDirectionals; i++)
	{
		o.diffuse.xyz += directionalLight( input.normal, osDirectionalLights[i] );
	}

	for (int i = 0; i < nPoints; i++)
	{
		o.diffuse.xyz += pointLight( input.pos, input.normal, osPointLights[i] );
	}

	for (int i = 0; i < nSpots; i++)
	{
		o.diffuse.xyz += spotLight( input.pos, input.normal, osSpotLights[i] );
	}
	
#ifdef MOD2X
	o.diffuse.xyz *= 0.5 * (1 + diffuseLightExtraModulation);
#endif

	float2 fogging = float2((-1.0 / (fogEnd - fogStart)), (fogEnd / (fogEnd - fogStart)));
	o.fog = o.pos.w * fogging.x + fogging.y;

	return o;
}

VertexShader vertexShaders[90] =
{
	compile vs_1_1 vs_main(0,0,0),
	compile vs_1_1 vs_main(1,0,0),
	compile vs_1_1 vs_main(2,0,0),
	compile vs_1_1 vs_main(0,1,0),
	compile vs_1_1 vs_main(1,1,0),
	compile vs_1_1 vs_main(2,1,0),
	compile vs_1_1 vs_main(0,2,0),
	compile vs_1_1 vs_main(1,2,0),
	compile vs_1_1 vs_main(2,2,0),
	compile vs_1_1 vs_main(0,3,0),
	compile vs_1_1 vs_main(1,3,0),
	compile vs_1_1 vs_main(2,3,0),
	compile vs_1_1 vs_main(0,4,0),
	compile vs_1_1 vs_main(1,4,0),
	compile vs_1_1 vs_main(2,4,0),
	compile vs_1_1 vs_main(0,0,1),
	compile vs_1_1 vs_main(1,0,1),
	compile vs_1_1 vs_main(2,0,1),
	compile vs_1_1 vs_main(0,1,1),
	compile vs_1_1 vs_main(1,1,1),
	compile vs_1_1 vs_main(2,1,1),
	compile vs_1_1 vs_main(0,2,1),
	compile vs_1_1 vs_main(1,2,1),
	compile vs_1_1 vs_main(2,2,1),
	compile vs_1_1 vs_main(0,3,1),
	compile vs_1_1 vs_main(1,3,1),
	compile vs_1_1 vs_main(2,3,1),
	compile vs_1_1 vs_main(0,4,1),
	compile vs_1_1 vs_main(1,4,1),
	compile vs_1_1 vs_main(2,4,1),
	compile vs_1_1 vs_main(0,0,2),
	compile vs_1_1 vs_main(1,0,2),
	compile vs_1_1 vs_main(2,0,2),
	compile vs_1_1 vs_main(0,1,2),
	compile vs_1_1 vs_main(1,1,2),
	compile vs_1_1 vs_main(2,1,2),
	compile vs_1_1 vs_main(0,2,2),
	compile vs_1_1 vs_main(1,2,2),
	compile vs_1_1 vs_main(2,2,2),
	compile vs_1_1 vs_main(0,3,2),
	compile vs_1_1 vs_main(1,3,2),
	compile vs_1_1 vs_main(2,3,2),
	compile vs_1_1 vs_main(0,4,2),
	compile vs_1_1 vs_main(1,4,2),
	compile vs_1_1 vs_main(2,4,2),
	compile vs_1_1 vs_mainStaticLighting(0,0,0),
	compile vs_1_1 vs_mainStaticLighting(1,0,0),
	compile vs_1_1 vs_mainStaticLighting(2,0,0),
	compile vs_1_1 vs_mainStaticLighting(0,1,0),
	compile vs_1_1 vs_mainStaticLighting(1,1,0),
	compile vs_1_1 vs_mainStaticLighting(2,1,0),
	compile vs_1_1 vs_mainStaticLighting(0,2,0),
	compile vs_1_1 vs_mainStaticLighting(1,2,0),
	compile vs_1_1 vs_mainStaticLighting(2,2,0),
	compile vs_1_1 vs_mainStaticLighting(0,3,0),
	compile vs_1_1 vs_mainStaticLighting(1,3,0),
	compile vs_1_1 vs_mainStaticLighting(2,3,0),
	compile vs_1_1 vs_mainStaticLighting(0,4,0),
	compile vs_1_1 vs_mainStaticLighting(1,4,0),
	compile vs_1_1 vs_mainStaticLighting(2,4,0),
	compile vs_1_1 vs_mainStaticLighting(0,0,1),
	compile vs_1_1 vs_mainStaticLighting(1,0,1),
	compile vs_1_1 vs_mainStaticLighting(2,0,1),
	compile vs_1_1 vs_mainStaticLighting(0,1,1),
	compile vs_1_1 vs_mainStaticLighting(1,1,1),
	compile vs_1_1 vs_mainStaticLighting(2,1,1),
	compile vs_1_1 vs_mainStaticLighting(0,2,1),
	compile vs_1_1 vs_mainStaticLighting(1,2,1),
	compile vs_1_1 vs_mainStaticLighting(2,2,1),
	compile vs_1_1 vs_mainStaticLighting(0,3,1),
	compile vs_1_1 vs_mainStaticLighting(1,3,1),
	compile vs_1_1 vs_mainStaticLighting(2,3,1),
	compile vs_1_1 vs_mainStaticLighting(0,4,1),
	compile vs_1_1 vs_mainStaticLighting(1,4,1),
	compile vs_1_1 vs_mainStaticLighting(2,4,1),
	compile vs_1_1 vs_mainStaticLighting(0,0,2),
	compile vs_1_1 vs_mainStaticLighting(1,0,2),
	compile vs_1_1 vs_mainStaticLighting(2,0,2),
	compile vs_1_1 vs_mainStaticLighting(0,1,2),
	compile vs_1_1 vs_mainStaticLighting(1,1,2),
	compile vs_1_1 vs_mainStaticLighting(2,1,2),
	compile vs_1_1 vs_mainStaticLighting(0,2,2),
	compile vs_1_1 vs_mainStaticLighting(1,2,2),
	compile vs_1_1 vs_mainStaticLighting(2,2,2),
	compile vs_1_1 vs_mainStaticLighting(0,3,2),
	compile vs_1_1 vs_mainStaticLighting(1,3,2),
	compile vs_1_1 vs_mainStaticLighting(2,3,2),
	compile vs_1_1 vs_mainStaticLighting(0,4,2),
	compile vs_1_1 vs_mainStaticLighting(1,4,2),
	compile vs_1_1 vs_mainStaticLighting(2,4,2)
};


//--------------------------------------------------------------//
// Technique Section for standard
//--------------------------------------------------------------//
technique standard
{
	pass Pass_0
	{
		BW_BLENDING_SOLID
		BW_FOG						
		BW_TEXTURESTAGE_DIFFUSEONLY(0, diffuseMap)		
		BW_TEXTURESTAGE_CLOUDMAP(CLOUDMAP_STAGE)
		BW_TEXTURESTAGE_TERMINATE(CLOUDMAP_STAGE_PLUS1)
		CULLMODE = (doubleSided ? 1 : 3);
		
		VertexShader = (vertexShaders[nDirectionalLights + (nPointLights * 3) + (nSpotLights * 15) + int(staticLighting) * 45 ]);
		PixelShader = NULL;
	}
	
	pass Pass_1
	{							
		BW_TEXTURESTAGE_DIFFUSEONLY(0, glowMap)		
		BW_TEXTURESTAGE_TERMINATE(1)		
		
		COLOROP[0] = MODULATE;
		COLORARG1[0] = TEXTURE;
		COLORARG2[0] = TFACTOR;
		TEXTUREFACTOR = (float4(glowFactor, glowFactor, glowFactor, glowFactor));
		ALPHABLENDENABLE = TRUE;
		SRCBLEND = ONE;
		DESTBLEND = ONE;
		ZWRITEENABLE = FALSE;
		LIGHTING = FALSE;
		BW_FOG_ADD
		
		VertexShader = (vertexShaders[int(staticLighting) * 45 ]);
		PixelShader = NULL;
	}
}

#else

// 3d studio max lighting values
float4 lightDir : Direction 
<
string UIName = "Light Direction";
string Object = "TargetLight";
int RefID = 0;
> = {-0.577, -0.577, 0.577,1.0};

float4 lightColour : LightColor 
<
int LightRef = 0;
> = float4( 1.0f, 1.0f, 1.0f, 1.0f );    // diffuse

float4x4 worldInverse : WorldI;

OutputDiffuseLighting vs_max( VertexXYZNUV i )
{
	OutputDiffuseLighting o = (OutputDiffuseLighting)0;
	o.pos = mul( i.pos, worldViewProj );
	o.tc = i.tc;
	
	float3 lDir = normalize(mul( lightDir, worldInverse ));

	o.diffuse = float4(0.1, 0.1, 0.1, 1) + selfIllumination;
	
#ifdef MOD2X
	o.diffuse += saturate(dot( lDir, i.normal )) * lightColour * 0.5 * (1 + diffuseLightExtraModulation);
#else
	o.diffuse += saturate(dot( lDir, i.normal )) * lightColour;
#endif
	o.diffuse.w = 1;
	return o;
}

technique max_preview
{
	pass Pass_0
	{
		BW_BLENDING_SOLID
		BW_TEXTURESTAGE_DIFFUSEONLY(0, diffuseMap)		
		BW_TEXTURESTAGE_TERMINATE(1)
		CULLMODE = (doubleSided ? 1 : 2);
		
		VertexShader = compile vs_1_1 vs_max();
		PixelShader = NULL;
	}
	
	pass Pass_1
	{							
		BW_TEXTURESTAGE_DIFFUSEONLY(0, glowMap)		
		BW_TEXTURESTAGE_TERMINATE(1)		
		
		COLOROP[0] = MODULATE;
		COLORARG1[0] = TEXTURE;
		COLORARG2[0] = TFACTOR;
		TEXTUREFACTOR = (float4(glowFactor, glowFactor, glowFactor, glowFactor));
		ALPHABLENDENABLE = TRUE;
		SRCBLEND = ONE;
		DESTBLEND = ONE;
		ZWRITEENABLE = FALSE;
		LIGHTING = FALSE;
		
		VertexShader = compile vs_1_1 vs_max();
		PixelShader = NULL;
	}
}

#endif