#include "stdinclude.fxh"

// Auto variables
float4x4 worldViewProj : WorldViewProjection;

#ifdef IN_GAME
float3 osCameraPos : CameraPosObjectSpace;
float fogStart : FogStart = 0.0;
float fogEnd : FogEnd = 1.0;
float4 fogColour : FogColour = {0,0,0,0};
#endif

// Exposed artist editable variables.

texture diffuseMap 
< 
	bool artistEditable = true; 
	string UIName = "Diffuse Map";
	string UIDesc = "The diffuse map for the material";
>;

texture otherMap
<
	bool artistEditable = true;
	string UIName = "Reflection Map";
	string UIDesc = "The reflection map for the material";
>;

bool doubleSided
<
	bool artistEditable = true;
	string UIName = "Double Sided";
	string UIDesc = "Whether the material is draw on both sides";
> = false;

float3 uTransform
<
	bool artistEditable = true;
	string UIName = "U Transform";
	string UIDesc = "The U-transform vector for the material";
	string UIWidget = "Spinner";
	float UIMax = 100;
	float UIMin = -100;
> = {1,0,0};

float3 vTransform
<
	bool artistEditable = true;
	string UIName = "V Transform";
	string UIDesc = "The V-transform vector for the material";
	string UIWidget = "Spinner";
	float UIMax = 100;
	float UIMin = -100;
> = {0,1,0};

float selfIllumination
< 
	bool artistEditable = true;
	string UIName = "Self Illumination";
	string UIDesc = "The self illumination factor for the material";
	float UIMin = 0;
	float UIMax = 1;
	int UIDigits = 1;
> = 0.0;

float reflectionAmount
< 
	bool artistEditable = true;
	string UIName = "Reflection Amount";
	string UIDesc = "A scaling factor for the reflection";
	float UIMin = 0;
	float UIMax = 1.0;
	int UIDigits = 2;
> = 1.0;

BW_ARTIST_EDITABLE_FRESNEL
BW_ARTIST_EDITABLE_ALPHA_TEST

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
BW_ARTIST_EDITABLE_LIGHT_ENABLE

BW_ARTIST_EDITABLE_TEXTURE_OP

#ifdef IN_GAME

bool staticLighting : StaticLighting = false;

// Define the lighting type used in this shader
DIFFUSE_LIGHTING_OBJECT_SPACE
BW_SKY_LIGHT_MAP_OBJECT_SPACE


OutputDiffuseLighting2 vs_main( VertexXYZNUV input, 
	uniform int nDirectionals, 
	uniform int nPoints, 
	uniform int nSpots )
{
	OutputDiffuseLighting2 o = (OutputDiffuseLighting2)0;

	o.pos = mul(input.pos, worldViewProj);
	o.tc = input.tc;
	float3 tc = float3(input.tc, 1);
	
	BW_SKY_MAP_COORDS_OBJECT_SPACE(o, input.pos)

	// calculate eye reflected around normal
	float3 eye = osCameraPos - input.pos;
	float d = dot( eye, input.normal );
	float3 eNormal = input.normal * d;
	float4 rEye = float4((eNormal - eye) + eNormal, 1);
	rEye.xyz = normalize( rEye.xyz );

	//transform eye reflected around normal to the coordinate system we want
	float4 ut = float4(mul( world, uTransform ).xyz, 1) * 0.5;
	float4 vt = float4(mul( world, -vTransform).xyz, 1) * 0.5;
	
	// output to extra texture coordinate
	o.tc2.x = dot( ut, rEye );
	o.tc2.y = dot( vt, rEye );
	
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

OutputDiffuseLighting3 vs_mainFresnel( VertexXYZNUV input, 
	uniform int nDirectionals, 
	uniform int nPoints, 
	uniform int nSpots )
{
	OutputDiffuseLighting3 o = (OutputDiffuseLighting3)0;

	o.pos = mul(input.pos, worldViewProj);
	o.tc = o.tc3 = input.tc;
	float3 tc = float3(input.tc, 1);
	
	BW_SKY_MAP_COORDS_OBJECT_SPACE(o, input.pos)

	// calculate eye reflected around normal
	float3 eye = osCameraPos - input.pos;
	float d = dot( eye, input.normal );
	float3 eNormal = input.normal * d;
	float4 rEye = float4((eNormal - eye) + eNormal, 1);
	rEye.xyz = normalize( rEye.xyz );

	//transform eye reflected around normal to the coordinate system we want
	float4 ut = float4(mul( world, uTransform ).xyz, 1) * 0.5;
	float4 vt = float4(mul( world, -vTransform).xyz, 1) * 0.5;
	
	// output to extra texture coordinate
	o.tc2.x = dot( ut, rEye );
	o.tc2.y = dot( vt, rEye );
	
	o.diffuse = ambientColour + selfIllumination;
	
	o.diffuse.a = fresnel( -normalize(eye), normalize(input.normal), fresnelExp, fresnelConstant ) * 2.0 * reflectionAmount;
	
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

OutputDiffuseLighting2 vs_mainStaticLighting( VertexXYZNUV_D input, 
	uniform int nDirectionals, 
	uniform int nPoints, 
	uniform int nSpots )
{
	OutputDiffuseLighting2 o = (OutputDiffuseLighting2)0;

	o.pos = mul(input.pos, worldViewProj);
	o.tc = input.tc;
	float3 tc = float3(input.tc, 1);

	// calculate eye reflected around normal
	float3 eye = osCameraPos - input.pos;
	float d = dot( eye, input.normal );
	float3 eNormal = input.normal * d;
	float4 rEye = float4((eNormal - eye) + eNormal, 1);
	rEye.xyz = normalize( rEye.xyz );

	//transform eye reflected around normal to the coordinate system we want
	float4 ut = float4(mul( world, uTransform ).xyz, 1) * 0.5;
	float4 vt = float4(mul( world, -vTransform).xyz, 1) * 0.5;
	
	// output to extra texture coordinate
	o.tc2.x = dot( ut, rEye );
	o.tc2.y = dot( vt, rEye );
	
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

OutputDiffuseLighting3 vs_mainStaticLightingFresnel( VertexXYZNUV_D input, 
	uniform int nDirectionals, 
	uniform int nPoints, 
	uniform int nSpots )
{
	OutputDiffuseLighting3 o = (OutputDiffuseLighting3)0;

	o.pos = mul(input.pos, worldViewProj);
	o.tc = o.tc3 = input.tc;
	float3 tc = float3(input.tc, 1);

	// calculate eye reflected around normal
	float3 eye = osCameraPos - input.pos;
	float d = dot( eye, input.normal );
	float3 eNormal = input.normal * d;
	float4 rEye = float4((eNormal - eye) + eNormal, 1);
	rEye.xyz = normalize( rEye.xyz );

	//transform eye reflected around normal to the coordinate system we want
	float4 ut = float4(mul( world, uTransform ).xyz, 1) * 0.5;
	float4 vt = float4(mul( world, -vTransform).xyz, 1) * 0.5;
	
	// output to extra texture coordinate
	o.tc2.x = dot( ut, rEye );
	o.tc2.y = dot( vt, rEye );
	
	o.diffuse = input.diffuse + selfIllumination;
		
	o.diffuse.a = fresnel( -normalize(eye), normalize(input.normal), fresnelExp, fresnelConstant ) * 2.0 * reflectionAmount;
	
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


VertexShader vertexShaders_2_0[90] =
{
	compile vs_2_0 vs_mainFresnel(0,0,0),
	compile vs_2_0 vs_mainFresnel(1,0,0),
	compile vs_2_0 vs_mainFresnel(2,0,0),
	compile vs_2_0 vs_mainFresnel(0,1,0),
	compile vs_2_0 vs_mainFresnel(1,1,0),
	compile vs_2_0 vs_mainFresnel(2,1,0),
	compile vs_2_0 vs_mainFresnel(0,2,0),
	compile vs_2_0 vs_mainFresnel(1,2,0),
	compile vs_2_0 vs_mainFresnel(2,2,0),
	compile vs_2_0 vs_mainFresnel(0,3,0),
	compile vs_2_0 vs_mainFresnel(1,3,0),
	compile vs_2_0 vs_mainFresnel(2,3,0),
	compile vs_2_0 vs_mainFresnel(0,4,0),
	compile vs_2_0 vs_mainFresnel(1,4,0),
	compile vs_2_0 vs_mainFresnel(2,4,0),
	compile vs_2_0 vs_mainFresnel(0,0,1),
	compile vs_2_0 vs_mainFresnel(1,0,1),
	compile vs_2_0 vs_mainFresnel(2,0,1),
	compile vs_2_0 vs_mainFresnel(0,1,1),
	compile vs_2_0 vs_mainFresnel(1,1,1),
	compile vs_2_0 vs_mainFresnel(2,1,1),
	compile vs_2_0 vs_mainFresnel(0,2,1),
	compile vs_2_0 vs_mainFresnel(1,2,1),
	compile vs_2_0 vs_mainFresnel(2,2,1),
	compile vs_2_0 vs_mainFresnel(0,3,1),
	compile vs_2_0 vs_mainFresnel(1,3,1),
	compile vs_2_0 vs_mainFresnel(2,3,1),
	compile vs_2_0 vs_mainFresnel(0,4,1),
	compile vs_2_0 vs_mainFresnel(1,4,1),
	compile vs_2_0 vs_mainFresnel(2,4,1),
	compile vs_2_0 vs_mainFresnel(0,0,2),
	compile vs_2_0 vs_mainFresnel(1,0,2),
	compile vs_2_0 vs_mainFresnel(2,0,2),
	compile vs_2_0 vs_mainFresnel(0,1,2),
	compile vs_2_0 vs_mainFresnel(1,1,2),
	compile vs_2_0 vs_mainFresnel(2,1,2),
	compile vs_2_0 vs_mainFresnel(0,2,2),
	compile vs_2_0 vs_mainFresnel(1,2,2),
	compile vs_2_0 vs_mainFresnel(2,2,2),
	compile vs_2_0 vs_mainFresnel(0,3,2),
	compile vs_2_0 vs_mainFresnel(1,3,2),
	compile vs_2_0 vs_mainFresnel(2,3,2),
	compile vs_2_0 vs_mainFresnel(0,4,2),
	compile vs_2_0 vs_mainFresnel(1,4,2),
	compile vs_2_0 vs_mainFresnel(2,4,2),
	compile vs_2_0 vs_mainStaticLightingFresnel(0,0,0),
	compile vs_2_0 vs_mainStaticLightingFresnel(1,0,0),
	compile vs_2_0 vs_mainStaticLightingFresnel(2,0,0),
	compile vs_2_0 vs_mainStaticLightingFresnel(0,1,0),
	compile vs_2_0 vs_mainStaticLightingFresnel(1,1,0),
	compile vs_2_0 vs_mainStaticLightingFresnel(2,1,0),
	compile vs_2_0 vs_mainStaticLightingFresnel(0,2,0),
	compile vs_2_0 vs_mainStaticLightingFresnel(1,2,0),
	compile vs_2_0 vs_mainStaticLightingFresnel(2,2,0),
	compile vs_2_0 vs_mainStaticLightingFresnel(0,3,0),
	compile vs_2_0 vs_mainStaticLightingFresnel(1,3,0),
	compile vs_2_0 vs_mainStaticLightingFresnel(2,3,0),
	compile vs_2_0 vs_mainStaticLightingFresnel(0,4,0),
	compile vs_2_0 vs_mainStaticLightingFresnel(1,4,0),
	compile vs_2_0 vs_mainStaticLightingFresnel(2,4,0),
	compile vs_2_0 vs_mainStaticLightingFresnel(0,0,1),
	compile vs_2_0 vs_mainStaticLightingFresnel(1,0,1),
	compile vs_2_0 vs_mainStaticLightingFresnel(2,0,1),
	compile vs_2_0 vs_mainStaticLightingFresnel(0,1,1),
	compile vs_2_0 vs_mainStaticLightingFresnel(1,1,1),
	compile vs_2_0 vs_mainStaticLightingFresnel(2,1,1),
	compile vs_2_0 vs_mainStaticLightingFresnel(0,2,1),
	compile vs_2_0 vs_mainStaticLightingFresnel(1,2,1),
	compile vs_2_0 vs_mainStaticLightingFresnel(2,2,1),
	compile vs_2_0 vs_mainStaticLightingFresnel(0,3,1),
	compile vs_2_0 vs_mainStaticLightingFresnel(1,3,1),
	compile vs_2_0 vs_mainStaticLightingFresnel(2,3,1),
	compile vs_2_0 vs_mainStaticLightingFresnel(0,4,1),
	compile vs_2_0 vs_mainStaticLightingFresnel(1,4,1),
	compile vs_2_0 vs_mainStaticLightingFresnel(2,4,1),
	compile vs_2_0 vs_mainStaticLightingFresnel(0,0,2),
	compile vs_2_0 vs_mainStaticLightingFresnel(1,0,2),
	compile vs_2_0 vs_mainStaticLightingFresnel(2,0,2),
	compile vs_2_0 vs_mainStaticLightingFresnel(0,1,2),
	compile vs_2_0 vs_mainStaticLightingFresnel(1,1,2),
	compile vs_2_0 vs_mainStaticLightingFresnel(2,1,2),
	compile vs_2_0 vs_mainStaticLightingFresnel(0,2,2),
	compile vs_2_0 vs_mainStaticLightingFresnel(1,2,2),
	compile vs_2_0 vs_mainStaticLightingFresnel(2,2,2),
	compile vs_2_0 vs_mainStaticLightingFresnel(0,3,2),
	compile vs_2_0 vs_mainStaticLightingFresnel(1,3,2),
	compile vs_2_0 vs_mainStaticLightingFresnel(2,3,2),
	compile vs_2_0 vs_mainStaticLightingFresnel(0,4,2),
	compile vs_2_0 vs_mainStaticLightingFresnel(1,4,2),
	compile vs_2_0 vs_mainStaticLightingFresnel(2,4,2)
};


//--------------------------------------------------------------//
// Technique Section for standard
//--------------------------------------------------------------//
technique standard2
{
	pass Pass_0
	{
		BW_BLENDING_SOLID
		BW_FOG
		BW_TEXTURESTAGE_DIFFUSEONLY_ALPHA(0, diffuseMap)
		BW_TEXTURESTAGE_CLOUDMAP_MULALPHA(CLOUDMAP_STAGE)
		BW_TEXTURESTAGE_TEXTUREOP(CLOUDMAP_STAGE_PLUS1, otherMap)
		BW_TEXTURESTAGE_ALPHAONLY(CLOUDMAP_STAGE_PLUS2, diffuseMap)	
		BW_TEXTURESTAGE_TERMINATE(CLOUDMAP_STAGE_PLUS3)
		CULLMODE = (doubleSided ? 1 : 3);

		VertexShader = (vertexShaders_2_0[nDirectionalLights + (nPointLights * 3) + (nSpotLights * 15) + int(staticLighting) * 45 ]);
		PixelShader = NULL;
	}
}

technique standard
{
	pass Pass_0
	{
		BW_BLENDING_SOLID
		BW_FOG
		BW_TEXTURESTAGE_DIFFUSEONLY(0, diffuseMap)
		BW_TEXTURESTAGE_CLOUDMAP(CLOUDMAP_STAGE)
		BW_TEXTURESTAGE_TEXTUREOP(CLOUDMAP_STAGE_PLUS1, otherMap)
		BW_TEXTURESTAGE_TERMINATE(CLOUDMAP_STAGE_PLUS2)
		CULLMODE = (doubleSided ? 1 : 3);
		
		VertexShader = (vertexShaders[nDirectionalLights + (nPointLights * 3) + (nSpotLights * 15) + int(staticLighting) * 45 ]);
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
float4x4 viewInverse  : ViewI;
float4x4 world : World;
float4x4 worldViewInverse : WorldViewI;

OutputDiffuseLighting3 vs_main( VertexXYZNUV input )
{
	OutputDiffuseLighting3 o = (OutputDiffuseLighting3)0;

	o.pos = mul(input.pos, worldViewProj);
	o.tc = o.tc3 = input.tc;
	float3 tc = float3(input.tc, 1);

	// calculate eye reflected around normal
	float3 cameraPos = worldViewInverse[3].xyz;
	float3 eye = normalize(cameraPos - input.pos);

	float d = dot( eye, input.normal );
	float3 eNormal = input.normal * d;
	float4 rEye = float4((eNormal - eye) + eNormal, 1);
	rEye.xyz = normalize( rEye.xyz );

	//transform eye reflected around normal to the coordinate system we want
	float4 ut = float4(mul( world, uTransform ).xyz, 1) * 0.5;
	float4 vt = float4(mul( world, -vTransform).xyz, 1) * 0.5;
	
	// output to extra texture coordinate
	o.tc2.x = dot( ut, rEye );
	o.tc2.y = dot( vt, rEye );
	
	o.diffuse.xyz =  float3(0.1, 0.1, 0.1) + selfIllumination;
	o.diffuse.a = fresnel( -normalize(eye), normalize(input.normal), fresnelExp, fresnelConstant ) * 2.0 * reflectionAmount;

	DirectionalLight dLight;
	dLight.colour = lightColour;
	dLight.direction = normalize(mul( lightDir.xyz, worldInverse ));

	o.diffuse.xyz += directionalLight( input.normal, dLight );

#ifdef MOD2X
	o.diffuse.xyz *= 0.5 * (1 + diffuseLightExtraModulation);
#endif
	return o;
}


//--------------------------------------------------------------//
// Technique Section for standard
//--------------------------------------------------------------//
technique standard
{
	pass Pass_0
	{
		BW_BLENDING_SOLID
		BW_TEXTURESTAGE_DIFFUSEONLY_ALPHA(0, diffuseMap)
		BW_TEXTURESTAGE_TEXTUREOP(1, otherMap)
		BW_TEXTURESTAGE_ALPHAONLY(2, diffuseMap)	
		BW_TEXTURESTAGE_TERMINATE(3)
		CULLMODE = (doubleSided ? 1 : 2);

		
		VertexShader = compile vs_2_0 vs_main();
		PixelShader = NULL;
	}
}

// This value is there so that the bool check boxes work properly.
string ParamID = "0x0001";
#endif