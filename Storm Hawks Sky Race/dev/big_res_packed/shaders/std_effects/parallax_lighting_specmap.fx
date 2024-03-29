#include "stdinclude.fxh"

float4x4 worldViewProj : WorldViewProjection;

#ifdef IN_GAME
float3 osCameraPos : CameraPosObjectSpace;
texture normalisationMap : NormalisationMap;
float fogStart : FogStart = 0.0;
float fogEnd : FogEnd = 1.0;
float4 fogColour : FogColour = {0,0,0,0};
bool staticLighting : StaticLighting = false;
#endif

int graphicsSetting
<
	string label = "BUMPED_RENDERING";
>;

texture diffuseMap 
< 
	bool artistEditable = true; 
	string UIName = "Diffuse Map";
	string UIDesc = "The diffuse map for the material";
>;

texture normalMap 
<
	bool artistEditable = true; 
	string UIName = "Normal Map";
	string UIDesc = "The normal map for the material";
>;

texture specularMap 
<
	bool artistEditable = true; 
	string UIName = "Specular Map";
	string UIDesc = "The specular map for the material";
>;

texture heightMap
<
	bool artistEditable = true;
	string UIName = "Height Map";
	string UIDesc = "The height map for the material";
	
>;

float parallaxScale
<
	bool artistEditable = true;
	string UIName = "Parallax Scale";
	string UIDesc = "The parallax scale factor for the material";
	float UIMin = 0;
	float UIMax = 1;
	int UIDigits = 3;
> = 0.042;

float parallaxAspectRatio
<
	bool artistEditable = true;
	string UIName = "Parallax Aspect Ratio";
	string UIDesc = "The parallax aspect ratio for the material";
	float UIMin = 1;
	float UIMax = 2;
	int UIDigits = 1;
> = 1.0;

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

bool useSpecularMap
<
	bool artistEditable = true;
	string UIName = "Use specular map";
	string UIDesc = "Whether to use a specular map"; 
> = true;

float4 specularColour
<
	bool artistEditable = true;
	string UIWidget = "Color";
	string UIName = "Specular Colour";
	string UIDesc = "The specular colour tint for the material";
> = float4(1.f,1.f,1.f,1.f);

bool doubleSided
<
	bool artistEditable = true;
	string UIName = "Double Sided";
	string UIDesc = "Whether the material is draw on both sides";
> = false;

BW_ARTIST_EDITABLE_ALPHA_TEST

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

sampler normalSampler = sampler_state
{
	Texture = (normalMap);
	ADDRESSU = WRAP;
	ADDRESSV = WRAP;
	ADDRESSW = WRAP;
	MAGFILTER = LINEAR;
	MINFILTER = LINEAR;
	MIPFILTER = LINEAR;
	MAXMIPLEVEL = 0;
	MIPMAPLODBIAS = 0;
};

sampler specularSampler = sampler_state
{
	Texture = (specularMap);
	ADDRESSU = WRAP;
	ADDRESSV = WRAP;
	ADDRESSW = WRAP;
	MAGFILTER = LINEAR;
	MINFILTER = LINEAR;
	MIPFILTER = LINEAR;
	MAXMIPLEVEL = 0;
	MIPMAPLODBIAS = 0;
};

sampler heightSampler = sampler_state
{
	Texture = (heightMap);
	ADDRESSU = WRAP;
	ADDRESSV = WRAP;
	ADDRESSW = WRAP;
	MAGFILTER = LINEAR;
	MINFILTER = LINEAR;
	MIPFILTER = LINEAR;
	MAXMIPLEVEL = 0;
	MIPMAPLODBIAS = 0;
};

float2 parallax( float2 uv, float3 eye, float height, float disp)
{
	float3 eyeVect = normalize(eye.xyz);
	float offset = (height*disp)-(disp/2);
	return uv+float2(eyeVect.x * offset, eyeVect.y * (-offset) * parallaxAspectRatio);
}

#ifdef IN_GAME

// Define the lighting type used in this shader
DIFFUSE_LIGHTING_OBJECT_SPACE
SPECULAR_LIGHTING_OBJECT_SPACE
BW_SKY_LIGHT_MAP_OBJECT_SPACE
BW_NON_EDITABLE_LIGHT_ENABLE

OutputParallaxLighting parallaxLighting_vs2( VertexXYZNUVTB i,
	uniform int nDirectionals, 
	uniform int nPoints, 
	uniform int nSpecularDirectionals, 
	uniform int nSpecularPoints )
{
	OutputParallaxLighting o = (OutputParallaxLighting)0;

	o.pos = mul(i.pos, worldViewProj);
	
	BW_SKY_MAP_COORDS_OBJECT_SPACE( o, i.pos )

	float2 fogging = float2((-1.0 / (fogEnd - fogStart)), (fogEnd / (fogEnd - fogStart)));
	o.fog = o.pos.w * fogging.x + fogging.y;

	float3x3 tsMatrix = {i.tangent, i.binormal, i.normal };

	int nPointBump = min( nPoints, 2 );
	int nDirBump = min(2 - nPointBump, min(2, nDirectionals) );
	int nPoint = min( max(nPoints - nPointBump, 0), 2);
	int nDir = min(max(nDirectionals - nDirBump, 0), 2 );

	o.tc = i.tc;
	o.diffuse = ambientColour;

	if (nDir > 0)
		o.diffuse.xyz += directionalLight( i.normal, osDirectionalLights[nDirBump] );
	if (nDir > 1)
		o.diffuse.xyz += directionalLight( i.normal, osDirectionalLights[nDirBump + 1] );

	if (nPoint > 0)
		o.diffuse.xyz += pointLight( i.pos, i.normal, osPointLights[2] );
	if (nPoint > 1)
		o.diffuse.xyz += pointLight( i.pos, i.normal, osPointLights[3] );

	if (nDirBump > 1)
		o.attenuation.x = directionalBumpLight( tsMatrix, osDirectionalLights[1], o.dLight1.xyz );
	else if (nPointBump > 0)
		o.attenuation.x = pointBumpLight( i.pos, tsMatrix, osPointLights[0], o.dLight1.xyz );
	else
		o.attenuation.x = 0;

	if (nDirBump > 0)
		o.attenuation.y = directionalBumpLight( tsMatrix, osDirectionalLights[0], o.dLight2.xyz );
	else if (nPointBump > 1)
		o.attenuation.y = pointBumpLight( i.pos, tsMatrix, osPointLights[1], o.dLight2.xyz );
	else
		o.attenuation.y = 0;

	float3 eye = normalize(osCameraPos - i.pos);
	o.eye = mul( tsMatrix, eye );

	int nPointSpecBump = min( nSpecularPoints, 2 );
	int nDirSpecBump = min(2 - nPointSpecBump, min(2, nSpecularDirectionals) );

	if (nDirSpecBump > 1)
		o.attenuation.z = directionalSpecBumpLight( eye, tsMatrix, osSpecularDirectionalLights[1], o.sLight1.xyz );
	else if (nPointSpecBump > 0)
		o.attenuation.z = pointSpecBumpLight( i.pos, eye, tsMatrix, osSpecularPointLights[0], o.sLight1.xyz );
	else
		o.attenuation.z = 0;

	if (nDirSpecBump > 0)
		o.attenuation.w = directionalSpecBumpLight( eye, tsMatrix, osSpecularDirectionalLights[0], o.sLight2.xyz );
	else if (nPointSpecBump > 1)
		o.attenuation.w = pointSpecBumpLight( i.pos, eye, tsMatrix, osSpecularPointLights[1], o.sLight2.xyz );
	else
		o.attenuation.w = 0;
	return o;
}

OutputParallaxLightingSpot parallaxLightingSpot_vs2( VertexXYZNUVTB i,
	uniform int nDirectionals, 
	uniform int nPoints, 
	uniform int nSpecularDirectionals, 
	uniform int nSpecularPoints )
{
	OutputParallaxLightingSpot o = (OutputParallaxLightingSpot)0;

	o.pos = mul(i.pos, worldViewProj);
	
	BW_SKY_MAP_COORDS_OBJECT_SPACE( o, i.pos )

	float2 fogging = float2((-1.0 / (fogEnd - fogStart)), (fogEnd / (fogEnd - fogStart)));
	o.fog = o.pos.w * fogging.x + fogging.y;

	float3x3 tsMatrix = {i.tangent, i.binormal, i.normal };

	int nPointBump = min( nPoints, 1 );
	int nDirBump = min(1 - nPointBump, min(2, nDirectionals) );
	
	int nPoint = min( max(nPoints - nPointBump, 0), 3);
	int nDir = min(max(nDirectionals - nDirBump, 0), 2 );
	int nSpot = min( max(nSpotLights - 1, 0), 2 );

	o.tc = i.tc;
	o.diffuse = ambientColour;
	
	if (nSpot > 0)
		o.diffuse.xyz += spotLight( i.pos, i.normal, osSpotLights[1] );

	if (nDir > 0)
		o.diffuse.xyz += directionalLight( i.normal, osDirectionalLights[nDirBump] );
	if (nDir > 1)
		o.diffuse.xyz += directionalLight( i.normal, osDirectionalLights[nDirBump + 1] );

	if (nPoint > 0)
		o.diffuse.xyz += pointLight( i.pos, i.normal, osPointLights[1] );
	if (nPoint > 1)
		o.diffuse.xyz += pointLight( i.pos, i.normal, osPointLights[2] );
	if (nPoint > 2)
		o.diffuse.xyz += pointLight( i.pos, i.normal, osPointLights[3] );

	if (nDirBump > 0)
		o.attenuation.y = directionalBumpLight( tsMatrix, osDirectionalLights[0], o.dLight2.xyz );
	else if (nPointBump > 0)
		o.attenuation.y = pointBumpLight( i.pos, tsMatrix, osPointLights[0], o.dLight2.xyz );
	else
		o.attenuation.y = 0;

	float3 eye = normalize(osCameraPos - i.pos);
	o.eye = mul( tsMatrix, eye );

	int nPointSpecBump = min( nSpecularPoints, 2 );
	int nDirSpecBump = min(2 - nPointSpecBump, min(2, nSpecularDirectionals) );

	o.attenuation.x = o.attenuation.z = spotSpecBumpLight2( i.pos, i.normal, eye, tsMatrix, osSpotLights[0], o.dLight1.xyz, o.sLight1.xyz, o.spotDir.xyz );
	
	if (nDirSpecBump > 0)
		o.attenuation.w = directionalSpecBumpLight( eye, tsMatrix, osSpecularDirectionalLights[0], o.sLight2.xyz );
	else if (nPointSpecBump > 0)
		o.attenuation.w = pointSpecBumpLight( i.pos, eye, tsMatrix, osSpecularPointLights[0], o.sLight2.xyz );
	else
		o.attenuation.w = 0;
	return o;
}

OutputParallaxLighting parallaxStaticLighting_vs2( VertexXYZNUVTB_D i,
	uniform int nDirectionals, 
	uniform int nPoints, 
	uniform int nSpecularDirectionals, 
	uniform int nSpecularPoints )
{
	OutputParallaxLighting o = (OutputParallaxLighting)0;

	o.pos = mul(i.pos, worldViewProj);

	float2 fogging = float2((-1.0 / (fogEnd - fogStart)), (fogEnd / (fogEnd - fogStart)));
	o.fog = o.pos.w * fogging.x + fogging.y;

	float3x3 tsMatrix = {i.tangent, i.binormal, i.normal };

	int nPointBump = min( nPoints, 2 );
	int nDirBump = min(2 - nPointBump, min(2, nDirectionals) );
	int nPoint = min( max(nPoints - nPointBump, 0), 2);
	int nDir = min(max(nDirectionals - nDirBump, 0), 2 );

	o.tc = i.tc;
	o.diffuse = i.diffuse;

	if (nDir > 0)
		o.diffuse.xyz += directionalLight( i.normal, osDirectionalLights[nDirBump] );
	if (nDir > 1)
		o.diffuse.xyz += directionalLight( i.normal, osDirectionalLights[nDirBump + 1] );

	if (nPoint > 0)
		o.diffuse.xyz += pointLight( i.pos, i.normal, osPointLights[2] );
	if (nPoint > 1)
		o.diffuse.xyz += pointLight( i.pos, i.normal, osPointLights[3] );

	if (nDirBump > 1)
		o.attenuation.x = directionalBumpLight( tsMatrix, osDirectionalLights[1], o.dLight1.xyz );
	else if (nPointBump > 0)
		o.attenuation.x = pointBumpLight( i.pos, tsMatrix, osPointLights[0], o.dLight1.xyz );
	else
		o.attenuation.x = 0;

	if (nDirBump > 0)
		o.attenuation.y = directionalBumpLight( tsMatrix, osDirectionalLights[0], o.dLight2.xyz );
	else if (nPointBump > 1)
		o.attenuation.y = pointBumpLight( i.pos, tsMatrix, osPointLights[1], o.dLight2.xyz );
	else
		o.attenuation.y = 0;

	float3 eye = normalize(osCameraPos - i.pos);
	
	o.eye = mul( tsMatrix, eye );

	int nPointSpecBump = min( nSpecularPoints, 2 );
	int nDirSpecBump = min(2 - nPointSpecBump, min(2, nSpecularDirectionals) );

	if (nDirSpecBump > 1)
		o.attenuation.z = directionalSpecBumpLight( eye, tsMatrix, osSpecularDirectionalLights[1], o.sLight1.xyz );
	else if (nPointSpecBump > 0)
		o.attenuation.z = pointSpecBumpLight( i.pos, eye, tsMatrix, osSpecularPointLights[0], o.sLight1.xyz );
	else
		o.attenuation.z = 0;

	if (nDirSpecBump > 0)
		o.attenuation.w = directionalSpecBumpLight( eye, tsMatrix, osSpecularDirectionalLights[0], o.sLight2.xyz );
	else if (nPointSpecBump > 1)
		o.attenuation.w = pointSpecBumpLight( i.pos, eye, tsMatrix, osSpecularPointLights[1], o.sLight2.xyz );
	else
		o.attenuation.w = 0;
	return o;
}

OutputParallaxLightingSpot parallaxStaticLightingSpot_vs2( VertexXYZNUVTB_D i,
	uniform int nDirectionals, 
	uniform int nPoints, 
	uniform int nSpecularDirectionals, 
	uniform int nSpecularPoints )
{
	OutputParallaxLightingSpot o = (OutputParallaxLightingSpot)0;

	o.pos = mul(i.pos, worldViewProj);

	float2 fogging = float2((-1.0 / (fogEnd - fogStart)), (fogEnd / (fogEnd - fogStart)));
	o.fog = o.pos.w * fogging.x + fogging.y;

	float3x3 tsMatrix = {i.tangent, i.binormal, i.normal };

	int nPointBump = min( nPoints, 1 );
	int nDirBump = min(1 - nPointBump, min(1, nDirectionals) );
	
	int nPoint = min( max(nPoints - nPointBump, 0), 3);
	int nDir = min(max(nDirectionals - nDirBump, 0), 2 );
	int nSpot = min( max(nSpotLights - 1, 0), 2 );

	o.tc = i.tc;
	o.diffuse = i.diffuse;
	
	if (nSpot > 0)
		o.diffuse.xyz += spotLight( i.pos, i.normal, osSpotLights[1] );

	if (nDir > 0)
		o.diffuse.xyz += directionalLight( i.normal, osDirectionalLights[nDirBump] );
	if (nDir > 1)
		o.diffuse.xyz += directionalLight( i.normal, osDirectionalLights[nDirBump + 1] );

	if (nPoint > 0)
		o.diffuse.xyz += pointLight( i.pos, i.normal, osPointLights[1] );
	if (nPoint > 1)
		o.diffuse.xyz += pointLight( i.pos, i.normal, osPointLights[2] );
	if (nPoint > 2)
		o.diffuse.xyz += pointLight( i.pos, i.normal, osPointLights[3] );

	if (nDirBump > 0)
		o.attenuation.y = directionalBumpLight( tsMatrix, osDirectionalLights[0], o.dLight2.xyz );
	else if (nPointBump > 0)
		o.attenuation.y = pointBumpLight( i.pos, tsMatrix, osPointLights[0], o.dLight2.xyz );
	else
		o.attenuation.y = 0;

	float3 eye = normalize(osCameraPos - i.pos);
	
	o.eye = mul( tsMatrix, eye );

	int nPointSpecBump = min( nSpecularPoints, 2 );
	int nDirSpecBump = min(2 - nPointSpecBump, min(2, nSpecularDirectionals) );

	o.attenuation.x = o.attenuation.z = spotSpecBumpLight2( i.pos, i.normal, eye, tsMatrix, osSpotLights[0], o.dLight1.xyz, o.sLight1.xyz, o.spotDir.xyz );
	
	if (nDirSpecBump > 0)
		o.attenuation.w = directionalSpecBumpLight( eye, tsMatrix, osSpecularDirectionalLights[0], o.sLight2.xyz );
	else if (nPointSpecBump > 0)
		o.attenuation.w = pointSpecBumpLight( i.pos, eye, tsMatrix, osSpecularPointLights[0], o.sLight2.xyz );
	else
		o.attenuation.w = 0;
	return o;
}
struct PS_INPUT
{
	float2 tc:      TEXCOORD0;
	float3 dLight1: TEXCOORD1;
	float3 dLight2: TEXCOORD2;
	float3 sLight1: TEXCOORD3;
	float3 sLight2: TEXCOORD4;
	float4 attenuation : TEXCOORD5;
	float3 eye : TEXCOORD6;
	float4 skyLightMap : TEXCOORD7;
	float4 diffuse: COLOR;
};

BW_SKY_LIGHT_MAP_SAMPLER

float4 parallaxLighting_ps2( PS_INPUT i ) : COLOR0
{
	float4 height = tex2D( heightSampler, i.tc );
	float2 tc = parallax( i.tc, i.eye, height.x, parallaxScale );
	float4 diffuseMap = tex2D( diffuseSampler, tc );
	float3 normal = (tex2D( normalSampler, tc ) * 2 ) - 1;
	float3 specularMap = useSpecularMap ? tex2D( specularSampler, tc ) : specularColour.xyz;
	float3 diffuseColour = i.diffuse;

	float3 diffuse1Colour = float3(0,0,0);
	float3 diffuse2Colour = float3(0,0,0);
	float3 specular1Colour = float3(0,0,0);
	float3 specular2Colour = float3(0,0,0);

	if (nPointLights > 0)
		diffuse1Colour = osPointLights[0].colour.xyz;
	else
		diffuse1Colour = osDirectionalLights[1].colour.xyz;

	if (nPointLights > 1)
		diffuse2Colour = osPointLights[1].colour.xyz;
	else
		diffuse2Colour = osDirectionalLights[0].colour.xyz;

	if (nSpecularPointLights > 0)
		specular1Colour = osSpecularPointLights[0].colour.xyz;
	else
		specular1Colour = osSpecularDirectionalLights[1].colour.xyz;

	if (nSpecularPointLights > 1)
		specular2Colour = osSpecularPointLights[1].colour.xyz;
	else
		specular2Colour = osSpecularDirectionalLights[0].colour.xyz;
		
	float4 attenuation;
	attenuation.x = saturate( dot( normalize(i.dLight1.xyz), normal ) );
	attenuation.y = saturate( dot( normalize(i.dLight2.xyz), normal ) );
	attenuation.z = pow( saturate( dot( normalize(i.sLight1.xyz), normal ) ), 32 );
	attenuation.w = pow( saturate( dot( normalize(i.sLight2.xyz), normal ) ), 32 );
	attenuation *= i.attenuation;

	diffuseColour +=  attenuation.x * diffuse1Colour;
	diffuseColour +=  attenuation.y * diffuse2Colour;

	float3 specularColour = attenuation.z * specular1Colour;
	specularColour += attenuation.w * specular2Colour;
	specularColour *= specularMap;

	float skyMap = SAMPLE_SKY_MAP(i)
	float4 colour;
#ifdef MOD2X	
	colour.xyz = (skyMap * diffuseColour * diffuseMap.xyz * (1 + diffuseLightExtraModulation) ) + specularColour;
#else
	colour.xyz = (skyMap * diffuseColour * diffuseMap.xyz) + specularColour;
#endif
	colour.w = diffuseMap.w;

	return colour;
}

float4 parallaxLightingSpot_ps2( OutputParallaxLightingSpot i ) : COLOR0
{
	float4 height = tex2D( heightSampler, i.tc );
	float2 tc = parallax( i.tc, i.eye, height.x, parallaxScale );
	float4 diffuseMap = tex2D( diffuseSampler, tc );
	float3 normal = (tex2D( normalSampler, tc ) * 2 ) - 1;
	float3 specularMap = useSpecularMap ? tex2D( specularSampler, tc ) : specularColour.xyz;
	float3 diffuseColour = i.diffuse;

	float3 diffuse1Colour = float3(0,0,0);
	float3 diffuse2Colour = float3(0,0,0);
	float3 specular1Colour = float3(0,0,0);
	float3 specular2Colour = float3(0,0,0);

	diffuse1Colour = osSpotLights[0].colour.xyz;

	if (nPointLights > 0)
		diffuse2Colour = osPointLights[0].colour.xyz;
	else
		diffuse2Colour = osDirectionalLights[0].colour.xyz;

	specular1Colour = osSpotLights[0].colour.xyz;

	if (nSpecularPointLights > 0)
		specular2Colour = osSpecularPointLights[0].colour.xyz;
	else
		specular2Colour = osSpecularDirectionalLights[0].colour.xyz;
		
	float4 attenuation;
	attenuation.x = saturate( dot( normalize(i.dLight1.xyz), normal ) );
	attenuation.y = saturate( dot( normalize(i.dLight2.xyz), normal ) );
	attenuation.z = pow( saturate( dot( normalize(i.sLight1.xyz), normal ) ), 32 );
	attenuation.w = pow( saturate( dot( normalize(i.sLight2.xyz), normal ) ), 32 );

	// NOTE: the only free input register was COLOR1, this made precision a problem for the spotlight
	// but its only really noticable for really really small cone angles
	float spotEffect = saturate( dot( normalize((i.spotDir*2.0)-float3(1,1,1)), osSpotLights[0].direction.xyz  ) - osSpotLights[0].attenuation.z) /  ( 1 - osSpotLights[0].attenuation.z );
	
	attenuation.xz *= spotEffect;
	attenuation *= i.attenuation;

	diffuseColour +=  attenuation.x * diffuse1Colour;
	diffuseColour +=  attenuation.y * diffuse2Colour;

	float3 specularColour = attenuation.z * specular1Colour;
	specularColour += attenuation.w * specular2Colour;
	specularColour *= specularMap;

	float skyMap = SAMPLE_SKY_MAP(i)
	float4 colour;
#ifdef MOD2X	
	colour.xyz = (skyMap * diffuseColour * diffuseMap.xyz * (1 + diffuseLightExtraModulation) ) + specularColour;
#else
	colour.xyz = (skyMap * diffuseColour * diffuseMap.xyz) + specularColour;
#endif
	colour.w = diffuseMap.w;

	return colour;
}

VertexShader vertexShaders_vs2[360] =
{
	compile vs_2_0 parallaxLighting_vs2(0,0,0,0),
	compile vs_2_0 parallaxLighting_vs2(1,0,0,0),
	compile vs_2_0 parallaxLighting_vs2(2,0,0,0),
	compile vs_2_0 parallaxLighting_vs2(0,1,0,0),
	compile vs_2_0 parallaxLighting_vs2(1,1,0,0),
	compile vs_2_0 parallaxLighting_vs2(2,1,0,0),
	compile vs_2_0 parallaxLighting_vs2(0,2,0,0),
	compile vs_2_0 parallaxLighting_vs2(1,2,0,0),
	compile vs_2_0 parallaxLighting_vs2(2,2,0,0),
	compile vs_2_0 parallaxLighting_vs2(0,3,0,0),
	compile vs_2_0 parallaxLighting_vs2(1,3,0,0),
	compile vs_2_0 parallaxLighting_vs2(2,3,0,0),
	compile vs_2_0 parallaxLighting_vs2(0,4,0,0),
	compile vs_2_0 parallaxLighting_vs2(1,4,0,0),
	compile vs_2_0 parallaxLighting_vs2(2,4,0,0),
	compile vs_2_0 parallaxLighting_vs2(0,0,1,0),
	compile vs_2_0 parallaxLighting_vs2(1,0,1,0),
	compile vs_2_0 parallaxLighting_vs2(2,0,1,0),
	compile vs_2_0 parallaxLighting_vs2(0,1,1,0),
	compile vs_2_0 parallaxLighting_vs2(1,1,1,0),
	compile vs_2_0 parallaxLighting_vs2(2,1,1,0),
	compile vs_2_0 parallaxLighting_vs2(0,2,1,0),
	compile vs_2_0 parallaxLighting_vs2(1,2,1,0),
	compile vs_2_0 parallaxLighting_vs2(2,2,1,0),
	compile vs_2_0 parallaxLighting_vs2(0,3,1,0),
	compile vs_2_0 parallaxLighting_vs2(1,3,1,0),
	compile vs_2_0 parallaxLighting_vs2(2,3,1,0),
	compile vs_2_0 parallaxLighting_vs2(0,4,1,0),
	compile vs_2_0 parallaxLighting_vs2(1,4,1,0),
	compile vs_2_0 parallaxLighting_vs2(2,4,1,0),
	compile vs_2_0 parallaxLighting_vs2(0,0,2,0),
	compile vs_2_0 parallaxLighting_vs2(1,0,2,0),
	compile vs_2_0 parallaxLighting_vs2(2,0,2,0),
	compile vs_2_0 parallaxLighting_vs2(0,1,2,0),
	compile vs_2_0 parallaxLighting_vs2(1,1,2,0),
	compile vs_2_0 parallaxLighting_vs2(2,1,2,0),
	compile vs_2_0 parallaxLighting_vs2(0,2,2,0),
	compile vs_2_0 parallaxLighting_vs2(1,2,2,0),
	compile vs_2_0 parallaxLighting_vs2(2,2,2,0),
	compile vs_2_0 parallaxLighting_vs2(0,3,2,0),
	compile vs_2_0 parallaxLighting_vs2(1,3,2,0),
	compile vs_2_0 parallaxLighting_vs2(2,3,2,0),
	compile vs_2_0 parallaxLighting_vs2(0,4,2,0),
	compile vs_2_0 parallaxLighting_vs2(1,4,2,0),
	compile vs_2_0 parallaxLighting_vs2(2,4,2,0),
	compile vs_2_0 parallaxLighting_vs2(0,0,0,1),
	compile vs_2_0 parallaxLighting_vs2(1,0,0,1),
	compile vs_2_0 parallaxLighting_vs2(2,0,0,1),
	compile vs_2_0 parallaxLighting_vs2(0,1,0,1),
	compile vs_2_0 parallaxLighting_vs2(1,1,0,1),
	compile vs_2_0 parallaxLighting_vs2(2,1,0,1),
	compile vs_2_0 parallaxLighting_vs2(0,2,0,1),
	compile vs_2_0 parallaxLighting_vs2(1,2,0,1),
	compile vs_2_0 parallaxLighting_vs2(2,2,0,1),
	compile vs_2_0 parallaxLighting_vs2(0,3,0,1),
	compile vs_2_0 parallaxLighting_vs2(1,3,0,1),
	compile vs_2_0 parallaxLighting_vs2(2,3,0,1),
	compile vs_2_0 parallaxLighting_vs2(0,4,0,1),
	compile vs_2_0 parallaxLighting_vs2(1,4,0,1),
	compile vs_2_0 parallaxLighting_vs2(2,4,0,1),
	compile vs_2_0 parallaxLighting_vs2(0,0,1,1),
	compile vs_2_0 parallaxLighting_vs2(1,0,1,1),
	compile vs_2_0 parallaxLighting_vs2(2,0,1,1),
	compile vs_2_0 parallaxLighting_vs2(0,1,1,1),
	compile vs_2_0 parallaxLighting_vs2(1,1,1,1),
	compile vs_2_0 parallaxLighting_vs2(2,1,1,1),
	compile vs_2_0 parallaxLighting_vs2(0,2,1,1),
	compile vs_2_0 parallaxLighting_vs2(1,2,1,1),
	compile vs_2_0 parallaxLighting_vs2(2,2,1,1),
	compile vs_2_0 parallaxLighting_vs2(0,3,1,1),
	compile vs_2_0 parallaxLighting_vs2(1,3,1,1),
	compile vs_2_0 parallaxLighting_vs2(2,3,1,1),
	compile vs_2_0 parallaxLighting_vs2(0,4,1,1),
	compile vs_2_0 parallaxLighting_vs2(1,4,1,1),
	compile vs_2_0 parallaxLighting_vs2(2,4,1,1),
	compile vs_2_0 parallaxLighting_vs2(0,0,0,2),
	compile vs_2_0 parallaxLighting_vs2(1,0,0,2),
	compile vs_2_0 parallaxLighting_vs2(2,0,0,2),
	compile vs_2_0 parallaxLighting_vs2(0,1,0,2),
	compile vs_2_0 parallaxLighting_vs2(1,1,0,2),
	compile vs_2_0 parallaxLighting_vs2(2,1,0,2),
	compile vs_2_0 parallaxLighting_vs2(0,2,0,2),
	compile vs_2_0 parallaxLighting_vs2(1,2,0,2),
	compile vs_2_0 parallaxLighting_vs2(2,2,0,2),
	compile vs_2_0 parallaxLighting_vs2(0,3,0,2),
	compile vs_2_0 parallaxLighting_vs2(1,3,0,2),
	compile vs_2_0 parallaxLighting_vs2(2,3,0,2),
	compile vs_2_0 parallaxLighting_vs2(0,4,0,2),
	compile vs_2_0 parallaxLighting_vs2(1,4,0,2),
	compile vs_2_0 parallaxLighting_vs2(2,4,0,2),
	
	compile vs_2_0 parallaxLightingSpot_vs2(0,0,0,0),
	compile vs_2_0 parallaxLightingSpot_vs2(1,0,0,0),
	compile vs_2_0 parallaxLightingSpot_vs2(2,0,0,0),
	compile vs_2_0 parallaxLightingSpot_vs2(0,1,0,0),
	compile vs_2_0 parallaxLightingSpot_vs2(1,1,0,0),
	compile vs_2_0 parallaxLightingSpot_vs2(2,1,0,0),
	compile vs_2_0 parallaxLightingSpot_vs2(0,2,0,0),
	compile vs_2_0 parallaxLightingSpot_vs2(1,2,0,0),
	compile vs_2_0 parallaxLightingSpot_vs2(2,2,0,0),
	compile vs_2_0 parallaxLightingSpot_vs2(0,3,0,0),
	compile vs_2_0 parallaxLightingSpot_vs2(1,3,0,0),
	compile vs_2_0 parallaxLightingSpot_vs2(2,3,0,0),
	compile vs_2_0 parallaxLightingSpot_vs2(0,4,0,0),
	compile vs_2_0 parallaxLightingSpot_vs2(1,4,0,0),
	compile vs_2_0 parallaxLightingSpot_vs2(2,4,0,0),
	compile vs_2_0 parallaxLightingSpot_vs2(0,0,1,0),
	compile vs_2_0 parallaxLightingSpot_vs2(1,0,1,0),
	compile vs_2_0 parallaxLightingSpot_vs2(2,0,1,0),
	compile vs_2_0 parallaxLightingSpot_vs2(0,1,1,0),
	compile vs_2_0 parallaxLightingSpot_vs2(1,1,1,0),
	compile vs_2_0 parallaxLightingSpot_vs2(2,1,1,0),
	compile vs_2_0 parallaxLightingSpot_vs2(0,2,1,0),
	compile vs_2_0 parallaxLightingSpot_vs2(1,2,1,0),
	compile vs_2_0 parallaxLightingSpot_vs2(2,2,1,0),
	compile vs_2_0 parallaxLightingSpot_vs2(0,3,1,0),
	compile vs_2_0 parallaxLightingSpot_vs2(1,3,1,0),
	compile vs_2_0 parallaxLightingSpot_vs2(2,3,1,0),
	compile vs_2_0 parallaxLightingSpot_vs2(0,4,1,0),
	compile vs_2_0 parallaxLightingSpot_vs2(1,4,1,0),
	compile vs_2_0 parallaxLightingSpot_vs2(2,4,1,0),
	compile vs_2_0 parallaxLightingSpot_vs2(0,0,2,0),
	compile vs_2_0 parallaxLightingSpot_vs2(1,0,2,0),
	compile vs_2_0 parallaxLightingSpot_vs2(2,0,2,0),
	compile vs_2_0 parallaxLightingSpot_vs2(0,1,2,0),
	compile vs_2_0 parallaxLightingSpot_vs2(1,1,2,0),
	compile vs_2_0 parallaxLightingSpot_vs2(2,1,2,0),
	compile vs_2_0 parallaxLightingSpot_vs2(0,2,2,0),
	compile vs_2_0 parallaxLightingSpot_vs2(1,2,2,0),
	compile vs_2_0 parallaxLightingSpot_vs2(2,2,2,0),
	compile vs_2_0 parallaxLightingSpot_vs2(0,3,2,0),
	compile vs_2_0 parallaxLightingSpot_vs2(1,3,2,0),
	compile vs_2_0 parallaxLightingSpot_vs2(2,3,2,0),
	compile vs_2_0 parallaxLightingSpot_vs2(0,4,2,0),
	compile vs_2_0 parallaxLightingSpot_vs2(1,4,2,0),
	compile vs_2_0 parallaxLightingSpot_vs2(2,4,2,0),
	compile vs_2_0 parallaxLightingSpot_vs2(0,0,0,1),
	compile vs_2_0 parallaxLightingSpot_vs2(1,0,0,1),
	compile vs_2_0 parallaxLightingSpot_vs2(2,0,0,1),
	compile vs_2_0 parallaxLightingSpot_vs2(0,1,0,1),
	compile vs_2_0 parallaxLightingSpot_vs2(1,1,0,1),
	compile vs_2_0 parallaxLightingSpot_vs2(2,1,0,1),
	compile vs_2_0 parallaxLightingSpot_vs2(0,2,0,1),
	compile vs_2_0 parallaxLightingSpot_vs2(1,2,0,1),
	compile vs_2_0 parallaxLightingSpot_vs2(2,2,0,1),
	compile vs_2_0 parallaxLightingSpot_vs2(0,3,0,1),
	compile vs_2_0 parallaxLightingSpot_vs2(1,3,0,1),
	compile vs_2_0 parallaxLightingSpot_vs2(2,3,0,1),
	compile vs_2_0 parallaxLightingSpot_vs2(0,4,0,1),
	compile vs_2_0 parallaxLightingSpot_vs2(1,4,0,1),
	compile vs_2_0 parallaxLightingSpot_vs2(2,4,0,1),
	compile vs_2_0 parallaxLightingSpot_vs2(0,0,1,1),
	compile vs_2_0 parallaxLightingSpot_vs2(1,0,1,1),
	compile vs_2_0 parallaxLightingSpot_vs2(2,0,1,1),
	compile vs_2_0 parallaxLightingSpot_vs2(0,1,1,1),
	compile vs_2_0 parallaxLightingSpot_vs2(1,1,1,1),
	compile vs_2_0 parallaxLightingSpot_vs2(2,1,1,1),
	compile vs_2_0 parallaxLightingSpot_vs2(0,2,1,1),
	compile vs_2_0 parallaxLightingSpot_vs2(1,2,1,1),
	compile vs_2_0 parallaxLightingSpot_vs2(2,2,1,1),
	compile vs_2_0 parallaxLightingSpot_vs2(0,3,1,1),
	compile vs_2_0 parallaxLightingSpot_vs2(1,3,1,1),
	compile vs_2_0 parallaxLightingSpot_vs2(2,3,1,1),
	compile vs_2_0 parallaxLightingSpot_vs2(0,4,1,1),
	compile vs_2_0 parallaxLightingSpot_vs2(1,4,1,1),
	compile vs_2_0 parallaxLightingSpot_vs2(2,4,1,1),
	compile vs_2_0 parallaxLightingSpot_vs2(0,0,0,2),
	compile vs_2_0 parallaxLightingSpot_vs2(1,0,0,2),
	compile vs_2_0 parallaxLightingSpot_vs2(2,0,0,2),
	compile vs_2_0 parallaxLightingSpot_vs2(0,1,0,2),
	compile vs_2_0 parallaxLightingSpot_vs2(1,1,0,2),
	compile vs_2_0 parallaxLightingSpot_vs2(2,1,0,2),
	compile vs_2_0 parallaxLightingSpot_vs2(0,2,0,2),
	compile vs_2_0 parallaxLightingSpot_vs2(1,2,0,2),
	compile vs_2_0 parallaxLightingSpot_vs2(2,2,0,2),
	compile vs_2_0 parallaxLightingSpot_vs2(0,3,0,2),
	compile vs_2_0 parallaxLightingSpot_vs2(1,3,0,2),
	compile vs_2_0 parallaxLightingSpot_vs2(2,3,0,2),
	compile vs_2_0 parallaxLightingSpot_vs2(0,4,0,2),
	compile vs_2_0 parallaxLightingSpot_vs2(1,4,0,2),
	compile vs_2_0 parallaxLightingSpot_vs2(2,4,0,2),
	
	compile vs_2_0 parallaxStaticLighting_vs2(0,0,0,0),
	compile vs_2_0 parallaxStaticLighting_vs2(1,0,0,0),
	compile vs_2_0 parallaxStaticLighting_vs2(2,0,0,0),
	compile vs_2_0 parallaxStaticLighting_vs2(0,1,0,0),
	compile vs_2_0 parallaxStaticLighting_vs2(1,1,0,0),
	compile vs_2_0 parallaxStaticLighting_vs2(2,1,0,0),
	compile vs_2_0 parallaxStaticLighting_vs2(0,2,0,0),
	compile vs_2_0 parallaxStaticLighting_vs2(1,2,0,0),
	compile vs_2_0 parallaxStaticLighting_vs2(2,2,0,0),
	compile vs_2_0 parallaxStaticLighting_vs2(0,3,0,0),
	compile vs_2_0 parallaxStaticLighting_vs2(1,3,0,0),
	compile vs_2_0 parallaxStaticLighting_vs2(2,3,0,0),
	compile vs_2_0 parallaxStaticLighting_vs2(0,4,0,0),
	compile vs_2_0 parallaxStaticLighting_vs2(1,4,0,0),
	compile vs_2_0 parallaxStaticLighting_vs2(2,4,0,0),
	compile vs_2_0 parallaxStaticLighting_vs2(0,0,1,0),
	compile vs_2_0 parallaxStaticLighting_vs2(1,0,1,0),
	compile vs_2_0 parallaxStaticLighting_vs2(2,0,1,0),
	compile vs_2_0 parallaxStaticLighting_vs2(0,1,1,0),
	compile vs_2_0 parallaxStaticLighting_vs2(1,1,1,0),
	compile vs_2_0 parallaxStaticLighting_vs2(2,1,1,0),
	compile vs_2_0 parallaxStaticLighting_vs2(0,2,1,0),
	compile vs_2_0 parallaxStaticLighting_vs2(1,2,1,0),
	compile vs_2_0 parallaxStaticLighting_vs2(2,2,1,0),
	compile vs_2_0 parallaxStaticLighting_vs2(0,3,1,0),
	compile vs_2_0 parallaxStaticLighting_vs2(1,3,1,0),
	compile vs_2_0 parallaxStaticLighting_vs2(2,3,1,0),
	compile vs_2_0 parallaxStaticLighting_vs2(0,4,1,0),
	compile vs_2_0 parallaxStaticLighting_vs2(1,4,1,0),
	compile vs_2_0 parallaxStaticLighting_vs2(2,4,1,0),
	compile vs_2_0 parallaxStaticLighting_vs2(0,0,2,0),
	compile vs_2_0 parallaxStaticLighting_vs2(1,0,2,0),
	compile vs_2_0 parallaxStaticLighting_vs2(2,0,2,0),
	compile vs_2_0 parallaxStaticLighting_vs2(0,1,2,0),
	compile vs_2_0 parallaxStaticLighting_vs2(1,1,2,0),
	compile vs_2_0 parallaxStaticLighting_vs2(2,1,2,0),
	compile vs_2_0 parallaxStaticLighting_vs2(0,2,2,0),
	compile vs_2_0 parallaxStaticLighting_vs2(1,2,2,0),
	compile vs_2_0 parallaxStaticLighting_vs2(2,2,2,0),
	compile vs_2_0 parallaxStaticLighting_vs2(0,3,2,0),
	compile vs_2_0 parallaxStaticLighting_vs2(1,3,2,0),
	compile vs_2_0 parallaxStaticLighting_vs2(2,3,2,0),
	compile vs_2_0 parallaxStaticLighting_vs2(0,4,2,0),
	compile vs_2_0 parallaxStaticLighting_vs2(1,4,2,0),
	compile vs_2_0 parallaxStaticLighting_vs2(2,4,2,0),
	compile vs_2_0 parallaxStaticLighting_vs2(0,0,0,1),
	compile vs_2_0 parallaxStaticLighting_vs2(1,0,0,1),
	compile vs_2_0 parallaxStaticLighting_vs2(2,0,0,1),
	compile vs_2_0 parallaxStaticLighting_vs2(0,1,0,1),
	compile vs_2_0 parallaxStaticLighting_vs2(1,1,0,1),
	compile vs_2_0 parallaxStaticLighting_vs2(2,1,0,1),
	compile vs_2_0 parallaxStaticLighting_vs2(0,2,0,1),
	compile vs_2_0 parallaxStaticLighting_vs2(1,2,0,1),
	compile vs_2_0 parallaxStaticLighting_vs2(2,2,0,1),
	compile vs_2_0 parallaxStaticLighting_vs2(0,3,0,1),
	compile vs_2_0 parallaxStaticLighting_vs2(1,3,0,1),
	compile vs_2_0 parallaxStaticLighting_vs2(2,3,0,1),
	compile vs_2_0 parallaxStaticLighting_vs2(0,4,0,1),
	compile vs_2_0 parallaxStaticLighting_vs2(1,4,0,1),
	compile vs_2_0 parallaxStaticLighting_vs2(2,4,0,1),
	compile vs_2_0 parallaxStaticLighting_vs2(0,0,1,1),
	compile vs_2_0 parallaxStaticLighting_vs2(1,0,1,1),
	compile vs_2_0 parallaxStaticLighting_vs2(2,0,1,1),
	compile vs_2_0 parallaxStaticLighting_vs2(0,1,1,1),
	compile vs_2_0 parallaxStaticLighting_vs2(1,1,1,1),
	compile vs_2_0 parallaxStaticLighting_vs2(2,1,1,1),
	compile vs_2_0 parallaxStaticLighting_vs2(0,2,1,1),
	compile vs_2_0 parallaxStaticLighting_vs2(1,2,1,1),
	compile vs_2_0 parallaxStaticLighting_vs2(2,2,1,1),
	compile vs_2_0 parallaxStaticLighting_vs2(0,3,1,1),
	compile vs_2_0 parallaxStaticLighting_vs2(1,3,1,1),
	compile vs_2_0 parallaxStaticLighting_vs2(2,3,1,1),
	compile vs_2_0 parallaxStaticLighting_vs2(0,4,1,1),
	compile vs_2_0 parallaxStaticLighting_vs2(1,4,1,1),
	compile vs_2_0 parallaxStaticLighting_vs2(2,4,1,1),
	compile vs_2_0 parallaxStaticLighting_vs2(0,0,0,2),
	compile vs_2_0 parallaxStaticLighting_vs2(1,0,0,2),
	compile vs_2_0 parallaxStaticLighting_vs2(2,0,0,2),
	compile vs_2_0 parallaxStaticLighting_vs2(0,1,0,2),
	compile vs_2_0 parallaxStaticLighting_vs2(1,1,0,2),
	compile vs_2_0 parallaxStaticLighting_vs2(2,1,0,2),
	compile vs_2_0 parallaxStaticLighting_vs2(0,2,0,2),
	compile vs_2_0 parallaxStaticLighting_vs2(1,2,0,2),
	compile vs_2_0 parallaxStaticLighting_vs2(2,2,0,2),
	compile vs_2_0 parallaxStaticLighting_vs2(0,3,0,2),
	compile vs_2_0 parallaxStaticLighting_vs2(1,3,0,2),
	compile vs_2_0 parallaxStaticLighting_vs2(2,3,0,2),
	compile vs_2_0 parallaxStaticLighting_vs2(0,4,0,2),
	compile vs_2_0 parallaxStaticLighting_vs2(1,4,0,2),
	compile vs_2_0 parallaxStaticLighting_vs2(2,4,0,2),
	
	compile vs_2_0 parallaxStaticLightingSpot_vs2(0,0,0,0),
	compile vs_2_0 parallaxStaticLightingSpot_vs2(1,0,0,0),
	compile vs_2_0 parallaxStaticLightingSpot_vs2(2,0,0,0),
	compile vs_2_0 parallaxStaticLightingSpot_vs2(0,1,0,0),
	compile vs_2_0 parallaxStaticLightingSpot_vs2(1,1,0,0),
	compile vs_2_0 parallaxStaticLightingSpot_vs2(2,1,0,0),
	compile vs_2_0 parallaxStaticLightingSpot_vs2(0,2,0,0),
	compile vs_2_0 parallaxStaticLightingSpot_vs2(1,2,0,0),
	compile vs_2_0 parallaxStaticLightingSpot_vs2(2,2,0,0),
	compile vs_2_0 parallaxStaticLightingSpot_vs2(0,3,0,0),
	compile vs_2_0 parallaxStaticLightingSpot_vs2(1,3,0,0),
	compile vs_2_0 parallaxStaticLightingSpot_vs2(2,3,0,0),
	compile vs_2_0 parallaxStaticLightingSpot_vs2(0,4,0,0),
	compile vs_2_0 parallaxStaticLightingSpot_vs2(1,4,0,0),
	compile vs_2_0 parallaxStaticLightingSpot_vs2(2,4,0,0),
	compile vs_2_0 parallaxStaticLightingSpot_vs2(0,0,1,0),
	compile vs_2_0 parallaxStaticLightingSpot_vs2(1,0,1,0),
	compile vs_2_0 parallaxStaticLightingSpot_vs2(2,0,1,0),
	compile vs_2_0 parallaxStaticLightingSpot_vs2(0,1,1,0),
	compile vs_2_0 parallaxStaticLightingSpot_vs2(1,1,1,0),
	compile vs_2_0 parallaxStaticLightingSpot_vs2(2,1,1,0),
	compile vs_2_0 parallaxStaticLightingSpot_vs2(0,2,1,0),
	compile vs_2_0 parallaxStaticLightingSpot_vs2(1,2,1,0),
	compile vs_2_0 parallaxStaticLightingSpot_vs2(2,2,1,0),
	compile vs_2_0 parallaxStaticLightingSpot_vs2(0,3,1,0),
	compile vs_2_0 parallaxStaticLightingSpot_vs2(1,3,1,0),
	compile vs_2_0 parallaxStaticLightingSpot_vs2(2,3,1,0),
	compile vs_2_0 parallaxStaticLightingSpot_vs2(0,4,1,0),
	compile vs_2_0 parallaxStaticLightingSpot_vs2(1,4,1,0),
	compile vs_2_0 parallaxStaticLightingSpot_vs2(2,4,1,0),
	compile vs_2_0 parallaxStaticLightingSpot_vs2(0,0,2,0),
	compile vs_2_0 parallaxStaticLightingSpot_vs2(1,0,2,0),
	compile vs_2_0 parallaxStaticLightingSpot_vs2(2,0,2,0),
	compile vs_2_0 parallaxStaticLightingSpot_vs2(0,1,2,0),
	compile vs_2_0 parallaxStaticLightingSpot_vs2(1,1,2,0),
	compile vs_2_0 parallaxStaticLightingSpot_vs2(2,1,2,0),
	compile vs_2_0 parallaxStaticLightingSpot_vs2(0,2,2,0),
	compile vs_2_0 parallaxStaticLightingSpot_vs2(1,2,2,0),
	compile vs_2_0 parallaxStaticLightingSpot_vs2(2,2,2,0),
	compile vs_2_0 parallaxStaticLightingSpot_vs2(0,3,2,0),
	compile vs_2_0 parallaxStaticLightingSpot_vs2(1,3,2,0),
	compile vs_2_0 parallaxStaticLightingSpot_vs2(2,3,2,0),
	compile vs_2_0 parallaxStaticLightingSpot_vs2(0,4,2,0),
	compile vs_2_0 parallaxStaticLightingSpot_vs2(1,4,2,0),
	compile vs_2_0 parallaxStaticLightingSpot_vs2(2,4,2,0),
	compile vs_2_0 parallaxStaticLightingSpot_vs2(0,0,0,1),
	compile vs_2_0 parallaxStaticLightingSpot_vs2(1,0,0,1),
	compile vs_2_0 parallaxStaticLightingSpot_vs2(2,0,0,1),
	compile vs_2_0 parallaxStaticLightingSpot_vs2(0,1,0,1),
	compile vs_2_0 parallaxStaticLightingSpot_vs2(1,1,0,1),
	compile vs_2_0 parallaxStaticLightingSpot_vs2(2,1,0,1),
	compile vs_2_0 parallaxStaticLightingSpot_vs2(0,2,0,1),
	compile vs_2_0 parallaxStaticLightingSpot_vs2(1,2,0,1),
	compile vs_2_0 parallaxStaticLightingSpot_vs2(2,2,0,1),
	compile vs_2_0 parallaxStaticLightingSpot_vs2(0,3,0,1),
	compile vs_2_0 parallaxStaticLightingSpot_vs2(1,3,0,1),
	compile vs_2_0 parallaxStaticLightingSpot_vs2(2,3,0,1),
	compile vs_2_0 parallaxStaticLightingSpot_vs2(0,4,0,1),
	compile vs_2_0 parallaxStaticLightingSpot_vs2(1,4,0,1),
	compile vs_2_0 parallaxStaticLightingSpot_vs2(2,4,0,1),
	compile vs_2_0 parallaxStaticLightingSpot_vs2(0,0,1,1),
	compile vs_2_0 parallaxStaticLightingSpot_vs2(1,0,1,1),
	compile vs_2_0 parallaxStaticLightingSpot_vs2(2,0,1,1),
	compile vs_2_0 parallaxStaticLightingSpot_vs2(0,1,1,1),
	compile vs_2_0 parallaxStaticLightingSpot_vs2(1,1,1,1),
	compile vs_2_0 parallaxStaticLightingSpot_vs2(2,1,1,1),
	compile vs_2_0 parallaxStaticLightingSpot_vs2(0,2,1,1),
	compile vs_2_0 parallaxStaticLightingSpot_vs2(1,2,1,1),
	compile vs_2_0 parallaxStaticLightingSpot_vs2(2,2,1,1),
	compile vs_2_0 parallaxStaticLightingSpot_vs2(0,3,1,1),
	compile vs_2_0 parallaxStaticLightingSpot_vs2(1,3,1,1),
	compile vs_2_0 parallaxStaticLightingSpot_vs2(2,3,1,1),
	compile vs_2_0 parallaxStaticLightingSpot_vs2(0,4,1,1),
	compile vs_2_0 parallaxStaticLightingSpot_vs2(1,4,1,1),
	compile vs_2_0 parallaxStaticLightingSpot_vs2(2,4,1,1),
	compile vs_2_0 parallaxStaticLightingSpot_vs2(0,0,0,2),
	compile vs_2_0 parallaxStaticLightingSpot_vs2(1,0,0,2),
	compile vs_2_0 parallaxStaticLightingSpot_vs2(2,0,0,2),
	compile vs_2_0 parallaxStaticLightingSpot_vs2(0,1,0,2),
	compile vs_2_0 parallaxStaticLightingSpot_vs2(1,1,0,2),
	compile vs_2_0 parallaxStaticLightingSpot_vs2(2,1,0,2),
	compile vs_2_0 parallaxStaticLightingSpot_vs2(0,2,0,2),
	compile vs_2_0 parallaxStaticLightingSpot_vs2(1,2,0,2),
	compile vs_2_0 parallaxStaticLightingSpot_vs2(2,2,0,2),
	compile vs_2_0 parallaxStaticLightingSpot_vs2(0,3,0,2),
	compile vs_2_0 parallaxStaticLightingSpot_vs2(1,3,0,2),
	compile vs_2_0 parallaxStaticLightingSpot_vs2(2,3,0,2),
	compile vs_2_0 parallaxStaticLightingSpot_vs2(0,4,0,2),
	compile vs_2_0 parallaxStaticLightingSpot_vs2(1,4,0,2),
	compile vs_2_0 parallaxStaticLightingSpot_vs2(2,4,0,2)	
};

PixelShader pixelShaders[2] =
{
	compile ps_2_0 parallaxLighting_ps2(),
	compile ps_2_0 parallaxLightingSpot_ps2()
};

int vsIndex( int nDir, int nPoint, int nSpecDir, int nSpecPoint, int nSpot )
{
	int nSpecIndex = nSpecDir;
	if (nSpecPoint > 0)
	{
		if (nSpecPoint == 1)
		{
			
			if (nSpecDir == 0)
			{
				nSpecIndex = 3;
			}
			else
			{
				nSpecIndex = 4;
			}
		}
		else
		{
			nSpecIndex = 5;
		}
	}	
	
	return min(nDir, 2) + (min(nPoint, 4) * 3) + (min(nSpecIndex, 6) * 15) + (min(nSpot,1)*90) + int(staticLighting) * 180;
}

//--------------------------------------------------------------//
// Technique Section for for pixel/vertexshader 2
//--------------------------------------------------------------//
technique parallax_lighting_shader2
<
	string label = "SHADER_MODEL_2";
	bool bumpMapped = true;
>
{
	pass Pass_0
	{
		ALPHATESTENABLE = <alphaTestEnable>;
		ALPHAREF = <alphaReference>;
		ALPHAFUNC = GREATER;
		
		ZENABLE = TRUE;
		ZWRITEENABLE = TRUE;
		ZFUNC = LESSEQUAL;
		FOGENABLE = TRUE;
		FOGSTART = 1.0;
		FOGEND = 0.0;
		FOGCOLOR = <fogColour>;
		FOGTABLEMODE = NONE;
		FOGVERTEXMODE = LINEAR;
		ALPHABLENDENABLE = FALSE;
		POINTSPRITEENABLE = FALSE;
		STENCILENABLE = FALSE;
		CULLMODE = (doubleSided ? 1 : 3);
		TEXCOORDINDEX[0] = 0;
		TEXCOORDINDEX[1] = 1;
		TEXCOORDINDEX[2] = 2;
		TEXCOORDINDEX[3] = 3;
		TEXCOORDINDEX[4] = 4;
		TEXCOORDINDEX[5] = 5;
		TEXCOORDINDEX[6] = 6;
		TEXCOORDINDEX[7] = 7;
		
		VertexShader = (vertexShaders_vs2[vsIndex(nDirectionalLights, nPointLights, nSpecularDirectionalLights, nSpecularPointLights, nSpotLights)]);
		PixelShader = (pixelShaders[min(nSpotLights,1)]);
	}

}

OutputDiffuseCharacterLighting diffuseCharacterLighting_vs1( VertexXYZNUVTB i,
	uniform int nDirectionals, 
	uniform int nPoints )
{
	OutputDiffuseCharacterLighting o = (OutputDiffuseCharacterLighting)0;

	o.pos = mul(i.pos, worldViewProj);

	float3x3 tsMatrix = {i.tangent, i.binormal, i.normal };

	float2 fogging = float2((-1.0 / (fogEnd - fogStart)), (fogEnd / (fogEnd - fogStart)));
	o.fog = o.pos.w * fogging.x + fogging.y;

	int nPointBump = min( nPoints, 2 );
	int nDirBump = min(2 - nPointBump, min(2, nDirectionals) );
	int nPoint = min( max(nPoints - nPointBump, 0), 2);
	int nDir = min(max(nDirectionals - nDirBump, 0), 2 );

	o.tc = i.tc;
	o.ntc = i.tc;
	o.diffuse = ambientColour;

	if (nDir > 0)
		o.diffuse.xyz += directionalLight( i.normal, osDirectionalLights[nDirBump] );
	if (nDir > 1)
		o.diffuse.xyz += directionalLight( i.normal, osDirectionalLights[nDirBump + 1] );

	if (nPoint > 0)
		o.diffuse.xyz += pointLight( i.pos, i.normal, osPointLights[2] );
	if (nPoint > 1)
		o.diffuse.xyz += pointLight( i.pos, i.normal, osPointLights[3] );

	if (nDirBump > 1)
		o.attenuation.x = directionalBumpLight( tsMatrix, osDirectionalLights[1], o.dLight1.xyz );
	else if (nPointBump > 0)
		o.attenuation.xyz = pointBumpLight( i.pos, tsMatrix, osPointLights[0], o.dLight1.xyz );
	else
		o.attenuation.xyz = 0;

	if (nDirBump > 0)
		o.attenuation.w = directionalBumpLight( tsMatrix, osDirectionalLights[0], o.dLight2.xyz );
	else if (nPointBump > 1)
		o.attenuation.w = pointBumpLight( i.pos, tsMatrix, osPointLights[1], o.dLight2.xyz );
	else
		o.attenuation.w = 0;
	return o;
}

OutputDiffuseCharacterLighting diffuseStaticCharacterLighting_vs1( VertexXYZNUVTB_D i,
	uniform int nDirectionals, 
	uniform int nPoints )
{
	OutputDiffuseCharacterLighting o = (OutputDiffuseCharacterLighting)0;

	o.pos = mul(i.pos, worldViewProj);

	float3x3 tsMatrix = {i.tangent, i.binormal, i.normal };

	float2 fogging = float2((-1.0 / (fogEnd - fogStart)), (fogEnd / (fogEnd - fogStart)));
	o.fog = o.pos.w * fogging.x + fogging.y;

	int nPointBump = min( nPoints, 2 );
	int nDirBump = min(2 - nPointBump, min(2, nDirectionals) );
	int nPoint = min( max(nPoints - nPointBump, 0), 2);
	int nDir = min(max(nDirectionals - nDirBump, 0), 2 );

	o.tc = i.tc;
	o.ntc = i.tc;
	o.diffuse = i.diffuse;

	if (nDir > 0)
		o.diffuse.xyz += directionalLight( i.normal, osDirectionalLights[nDirBump] );
	if (nDir > 1)
		o.diffuse.xyz += directionalLight( i.normal, osDirectionalLights[nDirBump + 1] );

	if (nPoint > 0)
		o.diffuse.xyz += pointLight( i.pos, i.normal, osPointLights[2] );
	if (nPoint > 1)
		o.diffuse.xyz += pointLight( i.pos, i.normal, osPointLights[3] );

	if (nDirBump > 1)
		o.attenuation.x = directionalBumpLight( tsMatrix, osDirectionalLights[1], o.dLight1.xyz );
	else if (nPointBump > 0)
		o.attenuation.xyz = pointBumpLight( i.pos, tsMatrix, osPointLights[0], o.dLight1.xyz );
	else
		o.attenuation.xyz = 0;

	if (nDirBump > 0)
		o.attenuation.w = directionalBumpLight( tsMatrix, osDirectionalLights[0], o.dLight2.xyz );
	else if (nPointBump > 1)
		o.attenuation.w = pointBumpLight( i.pos, tsMatrix, osPointLights[1], o.dLight2.xyz );
	else
		o.attenuation.w = 0;
	return o;
}

OutputSpecularCharacterLightingAlpha specularCharacterLighting_vs1( VertexXYZNUVTB i,
	uniform int nSpecularDirectionals, 
	uniform int nSpecularPoints )
{
	OutputSpecularCharacterLightingAlpha o = (OutputSpecularCharacterLightingAlpha)0;

	o.pos = mul(i.pos, worldViewProj);

	float2 fogging = float2((-1.0 / (fogEnd - fogStart)), (fogEnd / (fogEnd - fogStart)));
	o.fog = o.pos.w * fogging.x + fogging.y;

	float3x3 tsMatrix = {i.tangent, i.binormal, i.normal };

	o.ntc = i.tc;
	o.atc = i.tc;

	float3 eye = normalize(osCameraPos - i.pos);

	int nPointSpecBump = min( nSpecularPoints, 1 );
	int nDirSpecBump = min(1 - nPointSpecBump, min(1, nSpecularDirectionals) );

	if (nPointSpecBump > 0)
		o.attenuation.xyz = pointSpecBumpLight( i.pos, eye, tsMatrix, osSpecularPointLights[0], o.sLight.xyz );
	else if (nDirSpecBump > 0)
		o.attenuation.xyz = directionalSpecBumpLight( eye, tsMatrix, osSpecularDirectionalLights[0], o.sLight.xyz );
	else 
		o.attenuation.xyz = 0;
	return o;
}


sampler normalisationSampler = sampler_state
{
	Texture = (normalisationMap);
	ADDRESSU = CLAMP;
	ADDRESSV = CLAMP;
	ADDRESSW = CLAMP;
	MAGFILTER = LINEAR;
	MINFILTER = LINEAR;
	MIPFILTER = LINEAR;
	MAXMIPLEVEL = 0;
	MIPMAPLODBIAS = 0;
};

float4 diffuseCharacterLighting_ps1( OutputDiffuseCharacterLighting i,
							uniform int nBumpPointLights) : COLOR0
{
	float4 diffuseMap = tex2D( diffuseSampler, i.tc );
	float3 normal = (tex2D( normalSampler, i.ntc ) * 2 ) - 1;
	float3 diffuseDir1 = (texCUBE( normalisationSampler, i.dLight1 ) * 2) - 1;
	float3 diffuseDir2 = (texCUBE( normalisationSampler, i.dLight2 ) * 2) - 1;
	float4 diffuse = i.diffuse;
	
	float3 d2Colour;
	float3 d1Colour;
	if (nBumpPointLights < 2)
		d2Colour = osDirectionalLights[0].colour;
	else
		d2Colour = osPointLights[1].colour;
	if (nBumpPointLights < 1)
		d1Colour = osDirectionalLights[1].colour;
	else
		d1Colour = osPointLights[0].colour;

	diffuse.xyz += saturate(dot(normal, diffuseDir1)) * i.attenuation.xyz * d1Colour;
	diffuse.xyz += saturate(dot(normal, diffuseDir2)) * i.attenuation.w * d2Colour;
	
#ifdef MOD2X
	return float4(diffuse.xyz * diffuseMap.xyz + (diffuse.xyz * diffuseMap.xyz * diffuseLightExtraModulation), diffuseMap.w);
#else
	return float4(diffuse.xyz * diffuseMap.xyz, diffuseMap.w);
#endif
}

float4 specularCharacterLighting_ps1( OutputSpecularCharacterLightingAlpha i, 
							uniform bool point, uniform bool useSpecMap ) : COLOR0
{
	float3 normal = (tex2D( normalSampler, i.ntc ) * 2 ) - 1;
	float3 specularDir = (texCUBE( normalisationSampler, i.sLight ) * 2) - 1;
	float3 specularMap = useSpecMap ? tex2D( specularSampler, i.tc ) : specularColour.xyz;
	float4 specular;
	specular.w = dot( normal, specularDir ), 32;
	specular.w = pow(specular.w, 32);
	float3 specularColour;
	if (point)
		specularColour = osSpecularPointLights[0].colour * specularMap;
	else
		specularColour = osSpecularDirectionalLights[0].colour * specularMap;
	float3 colour = specularColour * i.attenuation.xyz;
	
	float alpha = tex2D(diffuseSampler, i.atc).a;
	return float4( specular.w * colour, alpha );
}
							
VertexShader diffuseVertexShaders_vs1[30] =
{
	compile vs_1_1 diffuseCharacterLighting_vs1(0,0),
	compile vs_1_1 diffuseCharacterLighting_vs1(1,0),
	compile vs_1_1 diffuseCharacterLighting_vs1(2,0),
	compile vs_1_1 diffuseCharacterLighting_vs1(0,1),
	compile vs_1_1 diffuseCharacterLighting_vs1(1,1),
	compile vs_1_1 diffuseCharacterLighting_vs1(2,1),
	compile vs_1_1 diffuseCharacterLighting_vs1(0,2),
	compile vs_1_1 diffuseCharacterLighting_vs1(1,2),
	compile vs_1_1 diffuseCharacterLighting_vs1(2,2),
	compile vs_1_1 diffuseCharacterLighting_vs1(0,3),
	compile vs_1_1 diffuseCharacterLighting_vs1(1,3),
	compile vs_1_1 diffuseCharacterLighting_vs1(2,3),
	compile vs_1_1 diffuseCharacterLighting_vs1(0,4),
	compile vs_1_1 diffuseCharacterLighting_vs1(1,4),
	compile vs_1_1 diffuseCharacterLighting_vs1(2,4),
	compile vs_1_1 diffuseStaticCharacterLighting_vs1(0,0),
	compile vs_1_1 diffuseStaticCharacterLighting_vs1(1,0),
	compile vs_1_1 diffuseStaticCharacterLighting_vs1(2,0),
	compile vs_1_1 diffuseStaticCharacterLighting_vs1(0,1),
	compile vs_1_1 diffuseStaticCharacterLighting_vs1(1,1),
	compile vs_1_1 diffuseStaticCharacterLighting_vs1(2,1),
	compile vs_1_1 diffuseStaticCharacterLighting_vs1(0,2),
	compile vs_1_1 diffuseStaticCharacterLighting_vs1(1,2),
	compile vs_1_1 diffuseStaticCharacterLighting_vs1(2,2),
	compile vs_1_1 diffuseStaticCharacterLighting_vs1(0,3),
	compile vs_1_1 diffuseStaticCharacterLighting_vs1(1,3),
	compile vs_1_1 diffuseStaticCharacterLighting_vs1(2,3),
	compile vs_1_1 diffuseStaticCharacterLighting_vs1(0,4),
	compile vs_1_1 diffuseStaticCharacterLighting_vs1(1,4),
	compile vs_1_1 diffuseStaticCharacterLighting_vs1(2,4)
};

VertexShader specularVertexShaders_vs1[3] =
{
	compile vs_1_1 specularCharacterLighting_vs1(0,0),
	compile vs_1_1 specularCharacterLighting_vs1(1,0),
	compile vs_1_1 specularCharacterLighting_vs1(0,1)
};

PixelShader diffusePixelShaders_ps1[3] =
{
	compile ps_1_1 diffuseCharacterLighting_ps1(0),
	compile ps_1_1 diffuseCharacterLighting_ps1(1),
	compile ps_1_1 diffuseCharacterLighting_ps1(2)
};

PixelShader specularPixelShaders_ps1[4] =
{
	compile ps_1_1 specularCharacterLighting_ps1(false, false),
	compile ps_1_1 specularCharacterLighting_ps1(true, false),
	compile ps_1_1 specularCharacterLighting_ps1(false, true),
	compile ps_1_1 specularCharacterLighting_ps1(true, true)
};

int diffuseVSIndex( int nDir, int nPoint )
{
	return min(4,nPoint) * 3 + min(nDir,2) + int(staticLighting) * 15;
}

int specularVSIndex( int nSpecDir, int nSpecPoint )
{
	int index = 0;
	if (nSpecPoint > 0)
		index = 2;
	else if (nSpecDir >0)
		index = 1;
	
	return index;
}

//--------------------------------------------------------------//
// Technique Section for for pixel/vertexshader 1
//--------------------------------------------------------------//
technique parallax_lighting_shader1
< 
	string label = "SHADER_MODEL_1";
>
{
	pass Pass_0
	{
		ALPHATESTENABLE = <alphaTestEnable>;
		ALPHAREF = <alphaReference>;
		ALPHAFUNC = GREATER;
		
		ZENABLE = TRUE;
		ZWRITEENABLE = TRUE;
		ZFUNC = LESSEQUAL;
		FOGENABLE = TRUE;
		FOGSTART = 1.0;
		FOGEND = 0.0;
		FOGCOLOR = <fogColour>;
		FOGTABLEMODE = NONE;
		FOGVERTEXMODE = LINEAR;
		ALPHABLENDENABLE = FALSE;
		POINTSPRITEENABLE = FALSE;
		STENCILENABLE = FALSE;
		CULLMODE = (doubleSided ? 1 : 3);
		TEXCOORDINDEX[0] = 0;
		TEXCOORDINDEX[1] = 1;
		TEXCOORDINDEX[2] = 2;
		TEXCOORDINDEX[3] = 3;
		TEXCOORDINDEX[4] = 4;
		TEXCOORDINDEX[5] = 5;
		TEXCOORDINDEX[6] = 6;
		TEXCOORDINDEX[7] = 7;

	
		VertexShader = (diffuseVertexShaders_vs1[diffuseVSIndex(nDirectionalLights, nPointLights)]);
		PixelShader = (diffusePixelShaders_ps1[min(nPointLights,2)]);
	}
   
	pass Pass_1
	{
		ALPHATESTENABLE = <alphaTestEnable>;
		ALPHAREF = <alphaReference>;
		ALPHAFUNC = GREATER;
		
		ZENABLE = TRUE;
		ZWRITEENABLE = TRUE;
		ZFUNC = LESSEQUAL;
		FOGENABLE = TRUE;
		FOGSTART = 1.0;
		FOGEND = 0.0;
		FOGCOLOR = float4(0,0,0,0);
		FOGTABLEMODE = NONE;
		FOGVERTEXMODE = LINEAR;
		ALPHABLENDENABLE = TRUE;
		DESTBLEND = ONE;
		SRCBLEND = ONE;
		POINTSPRITEENABLE = FALSE;
		STENCILENABLE = FALSE;
		CULLMODE = (doubleSided ? 1 : 3);
		
		VertexShader = (specularVertexShaders_vs1[specularVSIndex(nSpecularDirectionalLights, nSpecularPointLights)]);
		PixelShader = (specularPixelShaders_ps1[int(nSpecularPointLights>0) + (int(useSpecularMap) * 2)]);
	}

}

//--------------------------------------------------------------//
// Fallback for software mode.
//--------------------------------------------------------------//

struct OutputFallback
{
	float4 pos	: POSITION;
	float2 tc	: TEXCOORD;
	float4 diffuse : COLOR;
	float fog	: FOG;
};

OutputFallback diffuseOnlyFallbackStatic( VertexXYZNUV_D i)
{
	OutputFallback o = (OutputFallback)0;

	o.pos = mul(i.pos, worldViewProj);

	float2 fogging = float2((-1.0 / (fogEnd - fogStart)), (fogEnd / (fogEnd - fogStart)));
	o.fog = o.pos.w * fogging.x + fogging.y;

	o.tc = i.tc;
	o.diffuse = i.diffuse;
	
	int nd = nDirectionalLights < 2 ? nDirectionalLights : 2;
	int np = nPointLights < 4 ? nPointLights : 4;
	int ns = nSpotLights < 2 ? nSpotLights : 2;
	
	for (int l = 0; l < nd; l++)
	{
		o.diffuse.xyz += directionalLight( i.normal, osDirectionalLights[l] );
	}
	
	for (int l = 0; l < np; l++)
	{
		o.diffuse.xyz += pointLight( i.pos, i.normal, osPointLights[l] );
	}
	
	for (int l = 0; l < ns; l++)
	{
		o.diffuse.xyz += spotLight( i.pos, i.normal, osSpotLights[l] );
	}

	return o;
}
OutputFallback diffuseOnlyFallback( VertexXYZNUV i)
{
	OutputFallback o = (OutputFallback)0;

	o.pos = mul(i.pos, worldViewProj);

	float2 fogging = float2((-1.0 / (fogEnd - fogStart)), (fogEnd / (fogEnd - fogStart)));
	o.fog = o.pos.w * fogging.x + fogging.y;

	o.tc = i.tc;
	o.diffuse = ambientColour;
	
	int nd = nDirectionalLights < 2 ? nDirectionalLights : 2;
	int np = nPointLights < 4 ? nPointLights : 4;
	int ns = nSpotLights < 2 ? nSpotLights : 2;
	
	for (int l = 0; l < nd; l++)
	{
		o.diffuse.xyz += directionalLight( i.normal, osDirectionalLights[l] );
	}
	
	for (int l = 0; l < np; l++)
	{
		o.diffuse.xyz += pointLight( i.pos, i.normal, osPointLights[l] );
	}
	
	for (int l = 0; l < ns; l++)
	{
		o.diffuse.xyz += spotLight( i.pos, i.normal, osSpotLights[l] );
	}
#ifdef MOD2X
	o.diffuse.xyz *= 0.5 * (1 + diffuseLightExtraModulation);
#endif
	return o;
}

VertexShader fallbackShaders[2] =
{
	compile vs_2_0 diffuseOnlyFallback(),
	compile vs_2_0 diffuseOnlyFallbackStatic()
};

//--------------------------------------------------------------//
// Technique section for software mode
//--------------------------------------------------------------//

technique software_fallback
< 
	string label = "SHADER_MODEL_0";
>
{
	pass Pass_0
	{
		BW_BLENDING_SOLID
		BW_FOG
		BW_TEXTURESTAGE_DIFFUSEONLY(0, diffuseMap)
		BW_TEXTURESTAGE_TERMINATE(1)
		CULLMODE = (doubleSided ? 1 : 3);
		
		VertexShader = (fallbackShaders[int(staticLighting)]);
		PixelShader = NULL;
	}
}
#else


/*
 * Things for the 3ds max technique
 */
float4 lightDir : Direction 
<
string UIName = "Light Direction";
string Object = "TargetLight";
int RefID = 0;
> = {-0.577, -0.577, 0.577,1.0};

float4 lightColour : LightColor 
<
//string UIName = "Diffuse";
int LightRef = 0;
> = float4( 1.0f, 1.0f, 1.0f, 1.0f );    // diffuse

float4x4 worldInverse : WorldI;
float4x4 viewInverse  : ViewI;

OutputParallaxLighting parallaxLighting_maxpreview_vs2( VertexXYZNUVTB i )
{
	OutputParallaxLighting o = (OutputParallaxLighting)0;
	DirectionalLight dl;
	dl.direction = normalize(mul( lightDir.xyz, worldInverse ));
	dl.colour = lightColour;

	o.pos = mul(i.pos, worldViewProj);
	
	float3x3 tsMatrix = {i.tangent, i.binormal, i.normal };

	o.tc = i.tc;
	o.diffuse = float4(0.1, 0.1, 0.1, 1);

	float3 camp = mul( viewInverse[3].xyz, worldInverse );
	float3 eye = normalize(camp - i.pos);

	o.eye = mul( tsMatrix, eye );

	o.attenuation.x = directionalBumpLight( tsMatrix, dl, o.dLight1.xyz );
	o.attenuation.y = 0;

	o.attenuation.z = directionalSpecBumpLight( eye, tsMatrix, dl, o.sLight1.xyz );
	o.attenuation.w = 0;


	return o;
}


float4 parallaxLighting_maxpreview_ps2( OutputParallaxLighting i ) : COLOR0
{
	float4 height = tex2D( heightSampler, i.tc );
	float2 tc = parallax( i.tc, i.eye, height.x, parallaxScale );
	float4 diffuseMap = tex2D( diffuseSampler, tc );
	float3 normal = (tex2D( normalSampler, tc ) * 2 ) - 1;
	float3 specularMap = useSpecularMap ? tex2D( specularSampler, tc ) : specularColour.xyz;
	float3 diffuseColour = i.diffuse;

	float3 diffuse1Colour = float3(0,0,0);
	float3 specular1Colour = float3(0,0,0);

	diffuse1Colour = lightColour.xyz;

	specular1Colour = lightColour.xyz;
		
	float4 attenuation = float4(0,0,0,0);
	attenuation.x = saturate( dot( normalize(i.dLight1.xyz), normal ) );
	attenuation.z = pow( saturate( dot( normalize(i.sLight1.xyz), normal ) ), 32 );
	attenuation *= i.attenuation;

	diffuseColour +=  attenuation.x * diffuse1Colour;

	float3 specularColour = attenuation.z * specular1Colour;
	specularColour *= specularMap;

	float4 colour;
#ifdef MOD2X	
	colour.xyz = (diffuseColour * diffuseMap.xyz * (1 + diffuseLightExtraModulation) ) + specularColour;
#else
	colour.xyz = (diffuseColour * diffuseMap.xyz) + specularColour;
#endif
	colour.w = diffuseMap.w;

	return colour;
}



technique max_preview
{
	pass Pass_0
	{
		ALPHATESTENABLE = <alphaTestEnable>;
		ALPHAREF = <alphaReference>;
		ALPHAFUNC = GREATER;
		
		ZENABLE = TRUE;
		ZWRITEENABLE = TRUE;
		ZFUNC = LESSEQUAL;

		ALPHABLENDENABLE = FALSE;
		CULLMODE = (doubleSided ? 1 : 2);
		TEXCOORDINDEX[0] = 0;
		TEXCOORDINDEX[1] = 1;
		TEXCOORDINDEX[2] = 2;
		TEXCOORDINDEX[3] = 3;
		TEXCOORDINDEX[4] = 4;
		TEXCOORDINDEX[5] = 5;
		TEXCOORDINDEX[6] = 6;
		TEXCOORDINDEX[7] = 7;
		
		VertexShader = compile vs_2_0 parallaxLighting_maxpreview_vs2();
		PixelShader = compile ps_2_0 parallaxLighting_maxpreview_ps2();
	}
}
#endif