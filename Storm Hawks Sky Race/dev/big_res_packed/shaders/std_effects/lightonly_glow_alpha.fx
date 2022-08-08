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
BW_ARTIST_EDITABLE_ALPHA_BLEND
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

#endif

struct TwoTexCoords
{
	float4 pos:     POSITION;
	float2 tc:      TEXCOORD0;
	float2 tc2:     TEXCOORD1;
	float4 diffuse: COLOR;
	float  fog: FOG;
};

#ifdef IN_GAME

TwoTexCoords vs_ff( VertexXYZNUV input, 
	uniform int nDirectionals, 
	uniform int nPoints, 
	uniform int nSpots )
{
	TwoTexCoords o = (TwoTexCoords)0;

	o.pos = mul(input.pos, worldViewProj);
	o.tc = input.tc;	
	o.tc2 = input.tc;
		
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

TwoTexCoords vs_ffStaticLighting( VertexXYZNUV_D input, 
	uniform int nDirectionals, 
	uniform int nPoints, 
	uniform int nSpots )
{
	TwoTexCoords o = (TwoTexCoords)0;

	o.pos = mul(input.pos, worldViewProj);
	o.tc = input.tc;
	o.tc2 = input.tc;
	
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

sampler diffuseSampler = sampler_state
{
	Texture = (diffuseMap);
	ADDRESSU = WRAP;
	ADDRESSV = WRAP;
	ADDRESSW = WRAP;
	MAGFILTER = LINEAR;
	MINFILTER = LINEAR;
	MIPFILTER = LINEAR;
	MAXMIPLEVEL = 0;
	MIPMAPLODBIAS = 0;
};

sampler glowSampler = sampler_state
{
	Texture = (glowMap);
	ADDRESSU = WRAP;
	ADDRESSV = WRAP;
	ADDRESSW = WRAP;
	MAGFILTER = LINEAR;
	MINFILTER = LINEAR;
	MIPFILTER = LINEAR;
	MAXMIPLEVEL = 0;
	MIPMAPLODBIAS = 0;
};

BW_SKY_LIGHT_MAP_SAMPLER

float4 ps_main( OutputDiffuseLighting i ) : COLOR0
{	
	float4 diffuseMap = tex2D( diffuseSampler, i.tc );
	float3 glowMap = tex2D( glowSampler, i.tc );
	float3 diffuseColour = i.diffuse;
	float skyMap = SAMPLE_SKY_MAP(i);	
	float3 glowAmount = glowMap * glowFactor;
	
	float4 colour;
#ifdef MOD2X
	colour.xyz = (skyMap * diffuseColour * diffuseMap.xyz * (1 + diffuseLightExtraModulation) ) + glowAmount;
#else
	colour.xyz = (skyMap * diffuseColour * diffuseMap.xyz) + glowAmount;
#endif
	colour.w = diffuseMap.w;

	return colour;
}

VertexShader vertexShaders[180] =
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
	compile vs_1_1 vs_mainStaticLighting(2,4,2),
	
	compile vs_1_1 vs_ff(0,0,0),
	compile vs_1_1 vs_ff(1,0,0),
	compile vs_1_1 vs_ff(2,0,0),
	compile vs_1_1 vs_ff(0,1,0),
	compile vs_1_1 vs_ff(1,1,0),
	compile vs_1_1 vs_ff(2,1,0),
	compile vs_1_1 vs_ff(0,2,0),
	compile vs_1_1 vs_ff(1,2,0),
	compile vs_1_1 vs_ff(2,2,0),
	compile vs_1_1 vs_ff(0,3,0),
	compile vs_1_1 vs_ff(1,3,0),
	compile vs_1_1 vs_ff(2,3,0),
	compile vs_1_1 vs_ff(0,4,0),
	compile vs_1_1 vs_ff(1,4,0),
	compile vs_1_1 vs_ff(2,4,0),
	compile vs_1_1 vs_ff(0,0,1),
	compile vs_1_1 vs_ff(1,0,1),
	compile vs_1_1 vs_ff(2,0,1),
	compile vs_1_1 vs_ff(0,1,1),
	compile vs_1_1 vs_ff(1,1,1),
	compile vs_1_1 vs_ff(2,1,1),
	compile vs_1_1 vs_ff(0,2,1),
	compile vs_1_1 vs_ff(1,2,1),
	compile vs_1_1 vs_ff(2,2,1),
	compile vs_1_1 vs_ff(0,3,1),
	compile vs_1_1 vs_ff(1,3,1),
	compile vs_1_1 vs_ff(2,3,1),
	compile vs_1_1 vs_ff(0,4,1),
	compile vs_1_1 vs_ff(1,4,1),
	compile vs_1_1 vs_ff(2,4,1),
	compile vs_1_1 vs_ff(0,0,2),
	compile vs_1_1 vs_ff(1,0,2),
	compile vs_1_1 vs_ff(2,0,2),
	compile vs_1_1 vs_ff(0,1,2),
	compile vs_1_1 vs_ff(1,1,2),
	compile vs_1_1 vs_ff(2,1,2),
	compile vs_1_1 vs_ff(0,2,2),
	compile vs_1_1 vs_ff(1,2,2),
	compile vs_1_1 vs_ff(2,2,2),
	compile vs_1_1 vs_ff(0,3,2),
	compile vs_1_1 vs_ff(1,3,2),
	compile vs_1_1 vs_ff(2,3,2),
	compile vs_1_1 vs_ff(0,4,2),
	compile vs_1_1 vs_ff(1,4,2),
	compile vs_1_1 vs_ff(2,4,2),
	compile vs_1_1 vs_ffStaticLighting(0,0,0),
	compile vs_1_1 vs_ffStaticLighting(1,0,0),
	compile vs_1_1 vs_ffStaticLighting(2,0,0),
	compile vs_1_1 vs_ffStaticLighting(0,1,0),
	compile vs_1_1 vs_ffStaticLighting(1,1,0),
	compile vs_1_1 vs_ffStaticLighting(2,1,0),
	compile vs_1_1 vs_ffStaticLighting(0,2,0),
	compile vs_1_1 vs_ffStaticLighting(1,2,0),
	compile vs_1_1 vs_ffStaticLighting(2,2,0),
	compile vs_1_1 vs_ffStaticLighting(0,3,0),
	compile vs_1_1 vs_ffStaticLighting(1,3,0),
	compile vs_1_1 vs_ffStaticLighting(2,3,0),
	compile vs_1_1 vs_ffStaticLighting(0,4,0),
	compile vs_1_1 vs_ffStaticLighting(1,4,0),
	compile vs_1_1 vs_ffStaticLighting(2,4,0),
	compile vs_1_1 vs_ffStaticLighting(0,0,1),
	compile vs_1_1 vs_ffStaticLighting(1,0,1),
	compile vs_1_1 vs_ffStaticLighting(2,0,1),
	compile vs_1_1 vs_ffStaticLighting(0,1,1),
	compile vs_1_1 vs_ffStaticLighting(1,1,1),
	compile vs_1_1 vs_ffStaticLighting(2,1,1),
	compile vs_1_1 vs_ffStaticLighting(0,2,1),
	compile vs_1_1 vs_ffStaticLighting(1,2,1),
	compile vs_1_1 vs_ffStaticLighting(2,2,1),
	compile vs_1_1 vs_ffStaticLighting(0,3,1),
	compile vs_1_1 vs_ffStaticLighting(1,3,1),
	compile vs_1_1 vs_ffStaticLighting(2,3,1),
	compile vs_1_1 vs_ffStaticLighting(0,4,1),
	compile vs_1_1 vs_ffStaticLighting(1,4,1),
	compile vs_1_1 vs_ffStaticLighting(2,4,1),
	compile vs_1_1 vs_ffStaticLighting(0,0,2),
	compile vs_1_1 vs_ffStaticLighting(1,0,2),
	compile vs_1_1 vs_ffStaticLighting(2,0,2),
	compile vs_1_1 vs_ffStaticLighting(0,1,2),
	compile vs_1_1 vs_ffStaticLighting(1,1,2),
	compile vs_1_1 vs_ffStaticLighting(2,1,2),
	compile vs_1_1 vs_ffStaticLighting(0,2,2),
	compile vs_1_1 vs_ffStaticLighting(1,2,2),
	compile vs_1_1 vs_ffStaticLighting(2,2,2),
	compile vs_1_1 vs_ffStaticLighting(0,3,2),
	compile vs_1_1 vs_ffStaticLighting(1,3,2),
	compile vs_1_1 vs_ffStaticLighting(2,3,2),
	compile vs_1_1 vs_ffStaticLighting(0,4,2),
	compile vs_1_1 vs_ffStaticLighting(1,4,2),
	compile vs_1_1 vs_ffStaticLighting(2,4,2)
};


//--------------------------------------------------------------//
// Technique Section for shader model 1.4 and higher
//
// This technique supports cloud shadows + glow
//--------------------------------------------------------------//
technique shader_1_4
<
	string channel = "internalSorted";
>
{
	pass Pass_0
	{
		BW_BLENDING_ALPHA
		BW_FOG
		CULLMODE = (doubleSided ? 1 : 3);
		
		VertexShader = (vertexShaders[nDirectionalLights + (nPointLights * 3) + (nSpotLights * 15) + int(staticLighting) * 45 ]);
		PixelShader = compile ps_1_4 ps_main();
	}
};


//--------------------------------------------------------------//
// Technique Section for non-shader hardware
//
// This technique does not support cloud shadowing
//--------------------------------------------------------------//
technique standard
<
	string channel = "internalSorted";
>
{
	pass Pass_0
	{
		BW_BLENDING_ALPHA
		BW_FOG
		TEXTUREFACTOR = (float4(glowFactor, glowFactor, glowFactor, glowFactor));
		BW_TEXTURESTAGE_DIFFUSEONLY(0, diffuseMap)	
		BW_TEXTURESTAGE_ADD(1,glowMap)
		COLOROP[1] = MULTIPLYADD;
		COLORARG0[1] = CURRENT;
		COLORARG1[1] = TFACTOR;
		COLORARG2[1] = TEXTURE;		
		BW_TEXTURESTAGE_TERMINATE(2)
		CULLMODE = (doubleSided ? 1 : 3);
		
		VertexShader = (vertexShaders[nDirectionalLights + (nPointLights * 3) + (nSpotLights * 15) + int(staticLighting) * 45 + 90]);
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

TwoTexCoords vs_max( VertexXYZNUV i )
{
	TwoTexCoords o = (TwoTexCoords)0;
	o.pos = mul( i.pos, worldViewProj );
	o.tc = i.tc;
	o.tc2 = i.tc;
	
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
	pass max_pass
	{
		BW_BLENDING_ALPHA
		TEXTUREFACTOR = (float4(glowFactor, glowFactor, glowFactor, glowFactor));
		BW_TEXTURESTAGE_DIFFUSEONLY(0, diffuseMap)
		BW_TEXTURESTAGE_ADD(1,glowMap)
		COLOROP[1] = MULTIPLYADD;
		COLORARG0[1] = CURRENT;
		COLORARG1[1] = TFACTOR;
		COLORARG2[1] = TEXTURE;		
		BW_TEXTURESTAGE_TERMINATE(2)
		CULLMODE = (doubleSided ? 1 : 2);
		
		VertexShader = compile vs_1_1 vs_max();
		PixelShader = NULL;
	}
}

#endif