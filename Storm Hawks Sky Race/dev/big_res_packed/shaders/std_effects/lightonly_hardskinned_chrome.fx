#ifdef IN_GAME
#include "stdinclude.fxh"

float4x4 viewProj : ViewProjection;
float4 world[51] : WorldPalette;
float fogStart : FogStart = 0.0;
float fogEnd : FogEnd = 1.0;
float4 fogColour : FogColour = {0,0,0,0};
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
float3 cameraPos : CameraPos;
BW_ARTIST_EDITABLE_ALPHA_TEST
BW_SKY_LIGHT_MAP_WORLD_SPACE
DIFFUSE_LIGHTING_WORLD_SPACE
BW_ARTIST_EDITABLE_LIGHT_ENABLE

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

bool doubleSided
<
	bool artistEditable = true;
	string UIName = "Double Sided";
	string UIDesc = "Whether the material is draw on both sides";
> = false;

float3 transformPos( float4 pos, int index )
{
	float3 ret = {	dot( world[index], pos ),
					dot( world[index + 1], pos ),
					dot( world[index + 2], pos ) };
	return ret;
}

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
BW_ARTIST_EDITABLE_TEXTURE_OP

float3 transformNormaliseVector( float3 v, int index )
{
	float3 ret;
	ret.x = dot( world[index + 0].xyz, v  );
	ret.y = dot( world[index + 1].xyz, v );
	ret.z = dot( world[index + 2].xyz, v );
	return normalize( ret );
}

OutputDiffuseLighting2 vs_main( VertexXYZNUVI input, 
	uniform int nDirectionals, 
	uniform int nPoints, 
	uniform int nSpots )
{
	OutputDiffuseLighting2 o = (OutputDiffuseLighting2)0;

	float4 worldPos = float4(transformPos( input.pos, input.index ), 1);
	
	o.pos = mul(worldPos, viewProj);

	float3 worldNormal = transformNormaliseVector( input.normal, input.index );

	o.tc = input.tc;
	
	o.diffuse = ambientColour;
	
	for (int i = 0; i < nDirectionals; i++)
	{
		o.diffuse.xyz += directionalLight( worldNormal, directionalLights[i] );
	}

	for (int i = 0; i < nPoints; i++)
	{
		o.diffuse.xyz += pointLight( worldPos, worldNormal, pointLights[i] );
	}

	for (int i = 0; i < nSpots; i++)
	if (nSpotLights > 0)
	{
		o.diffuse.xyz += spotLight( worldPos, worldNormal, spotLights[i] );
	}
	
	// calculate eye reflected around normal
	float3 eye = cameraPos - worldPos;
	float d = dot( eye, worldNormal );
	float3 eNormal = worldNormal * d;
	float4 rEye = float4((eNormal - eye) + eNormal, 1);
	rEye.xyz = normalize( rEye.xyz );

	// output to extra texture coordinate
	o.tc2.x = dot( uTransform, rEye );
	o.tc2.y = dot( vTransform, rEye );

	BW_SKY_MAP_COORDS_WORLD_SPACE( o, worldPos )
	
#ifdef MOD2X
	o.diffuse.xyz *= 0.5 * (1 + diffuseLightExtraModulation);
#endif

	float2 fogging = float2((-1.0 / (fogEnd - fogStart)), (fogEnd / (fogEnd - fogStart)));
	o.fog = o.pos.w * fogging.x + fogging.y;

	return o;
}

OutputDiffuseLighting3 vs_mainFresnel( VertexXYZNUVI input, 
	uniform int nDirectionals, 
	uniform int nPoints, 
	uniform int nSpots )
{
	OutputDiffuseLighting3 o = (OutputDiffuseLighting3)0;

	float4 worldPos = float4(transformPos( input.pos, input.index ), 1);
	
	o.pos = mul(worldPos, viewProj);

	float3 worldNormal = transformNormaliseVector( input.normal, input.index );

	o.tc = o.tc3 = input.tc;
	
	o.diffuse = ambientColour;
	
	for (int i = 0; i < nDirectionals; i++)
	{
		o.diffuse.xyz += directionalLight( worldNormal, directionalLights[i] );
	}

	for (int i = 0; i < nPoints; i++)
	{
		o.diffuse.xyz += pointLight( worldPos, worldNormal, pointLights[i] );
	}

	for (int i = 0; i < nSpots; i++)
	if (nSpotLights > 0)
	{
		o.diffuse.xyz += spotLight( worldPos, worldNormal, spotLights[i] );
	}
	
	// calculate eye reflected around normal
	float3 eye = cameraPos - worldPos;
	float d = dot( eye, worldNormal );
	float3 eNormal = worldNormal * d;
	float4 rEye = float4((eNormal - eye) + eNormal, 1);
	rEye.xyz = normalize( rEye.xyz );

	o.diffuse.a = fresnel( -normalize(eye), worldNormal, fresnelExp, fresnelConstant ) * 2.0 * reflectionAmount;
	
	// output to extra texture coordinate
	o.tc2.x = dot( uTransform, rEye );
	o.tc2.y = dot( vTransform, rEye );

	BW_SKY_MAP_COORDS_WORLD_SPACE( o, worldPos )
	
#ifdef MOD2X
	o.diffuse.xyz *= 0.5 * (1 + diffuseLightExtraModulation);
#endif

	float2 fogging = float2((-1.0 / (fogEnd - fogStart)), (fogEnd / (fogEnd - fogStart)));
	o.fog = o.pos.w * fogging.x + fogging.y;

	return o;
}

VertexShader vertexShaders[45] =
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
	compile vs_1_1 vs_main(2,4,1)
};

VertexShader vertexShaders_2_0[45] =
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
	compile vs_2_0 vs_mainFresnel(2,4,1)
};
//--------------------------------------------------------------//
// Technique Section for standard
//--------------------------------------------------------------//
technique standard2
<
	bool skinned = true;
>
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

		VertexShader = (vertexShaders_2_0[nDirectionalLights + (nPointLights * 3) + (nSpotLights * 15) ]);
		PixelShader = NULL;
	}
}

technique standard
<
	bool skinned = true;
>
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
		
		VertexShader = (vertexShaders[nDirectionalLights + (nPointLights * 3) + (nSpotLights * 15) ]);
		PixelShader = NULL;
	}
}
#else
#include "lightonly_chrome.fx"
#endif