#ifdef IN_GAME
#include "stdinclude.fxh"

float4x4 viewProj : ViewProjection;
float4 world[51] : WorldPalette;
float4 cameraPos : CameraPos;
texture normalisationMap : NormalisationMap;
float fogStart : FogStart = 0.0;
float fogEnd : FogEnd = 1.0;
float4 fogColour : FogColour = {0,0,0,0};


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

bool doubleSided
<
	bool artistEditable = true;
	string UIName = "Double Sided";
	string UIDesc = "Whether the material is draw on both sides";
> = false;

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

float specularLightExtraModulation
< 
	bool artistEditable = true;
	string UIName = "Specular Light Extra Modulation";
	string UIDesc = "The specular light extra modulation factor"; 
	float UIMin = 0;
	float UIMax = 2;
	int UIDigits = 1;
> = 1.0;
#endif

BW_ARTIST_EDITABLE_ALPHA_TEST
DIFFUSE_LIGHTING_WORLD_SPACE
SPECULAR_LIGHTING_WORLD_SPACE
BW_SKY_LIGHT_MAP_WORLD_SPACE
BW_NON_EDITABLE_LIGHT_ENABLE

float3 transformPos( float4 pos, int index )
{
	float3 ret = {	dot( world[index], pos ),
					dot( world[index + 1], pos ),
					dot( world[index + 2], pos ) };
	return ret;
}

float3 transformNormaliseVector( float3 v, int index )
{
	float3 ret;
	ret.x = dot( world[index + 0].xyz, v  );
	ret.y = dot( world[index + 1].xyz, v );
	ret.z = dot( world[index + 2].xyz, v );
	return normalize( ret );
}

OutputCharacterLighting vs_main( VertexXYZNUVITB input,
	uniform int nDirectionals, 
	uniform int nPoints, 
	uniform int nSpecularDirectionals, 
	uniform int nSpecularPoints )
{
	OutputCharacterLighting output = (OutputCharacterLighting)0;
	
	float4 worldPos = float4( transformPos( input.pos, input.index ), 1);
	
	BW_SKY_MAP_COORDS_WORLD_SPACE( output, worldPos )
	
	output.pos = mul(worldPos, viewProj);

	float2 fogging = float2((-1.0 / (fogEnd - fogStart)), (fogEnd / (fogEnd - fogStart)));
	output.fog = output.pos.w * fogging.x + fogging.y;
	
	float3 worldNormal = transformNormaliseVector( input.normal, input.index );
	float3 worldTangent = transformNormaliseVector( input.tangent, input.index );
	float3 worldBinormal = transformNormaliseVector( input.binormal, input.index );
	
	float3x3 tsMatrix = { worldTangent, worldBinormal, worldNormal };
	
	int nPointBump = min( nPoints, 2 );
	int nDirBump = min(2 - nPointBump, min(2, nDirectionals) );
	int nPoint = min( max(nPoints - nPointBump, 0), 2);
	int nDir = min(max(nDirectionals - nDirBump, 0), 2 );

	output.tc = input.tc;
	output.diffuse = ambientColour;

	if (nDir > 0)
		output.diffuse.xyz += directionalLight( worldNormal, directionalLights[nDirBump] );
	if (nDir > 1)
		output.diffuse.xyz += directionalLight( worldNormal, directionalLights[nDirBump + 1] );

	if (nPoint > 0)
		output.diffuse.xyz += pointLight( worldPos, worldNormal, pointLights[2] );
	if (nPoint > 1)
		output.diffuse.xyz += pointLight( worldPos, worldNormal, pointLights[3] );

	if (nDirBump > 1)
		output.attenuation.x = directionalBumpLight( tsMatrix, directionalLights[1], output.dLight1.xyz );
	else if (nPointBump > 0)
		output.attenuation.x = pointBumpLight( worldPos, tsMatrix, pointLights[0], output.dLight1.xyz );
	else
		output.attenuation.x = 0;

	if (nDirBump > 0)
		output.attenuation.y = directionalBumpLight( tsMatrix, directionalLights[0], output.dLight2.xyz );
	else if (nPointBump > 1)
		output.attenuation.y = pointBumpLight( worldPos, tsMatrix, pointLights[1], output.dLight2.xyz );
	else
		output.attenuation.y = 0;
	
	float3 eye = normalize(cameraPos.xyz - worldPos);

	int nPointSpecBump = min( nSpecularPoints, 2 );
	int nDirSpecBump = min(2 - nPointSpecBump, min(2, nSpecularDirectionals) );

	if (nDirSpecBump > 1)
	{
		output.attenuation.z = directionalSpecBumpLight( eye, tsMatrix, specularDirectionalLights[1], output.sLight1.xyz );
	}
	else if (nPointSpecBump > 0)
	{
		output.attenuation.z = pointSpecBumpLight( worldPos, eye, tsMatrix, specularPointLights[0], output.sLight1.xyz );
	}
	else
		output.attenuation.z = 0;

	if (nDirSpecBump > 0)
		output.attenuation.w = directionalSpecBumpLight( eye, tsMatrix, specularDirectionalLights[0], output.sLight2.xyz );
	else if (nPointSpecBump > 1)
		output.attenuation.w = pointSpecBumpLight( worldPos, eye, tsMatrix, specularPointLights[1], output.sLight2.xyz );
	else
		output.attenuation.w = 0;

	return output;
}


OutputCharacterLightingSpot vs_mainSpot( VertexXYZNUVITB input,
	uniform int nDirectionals, 
	uniform int nPoints, 
	uniform int nSpecularDirectionals, 
	uniform int nSpecularPoints )
{
	OutputCharacterLightingSpot output = (OutputCharacterLightingSpot)0;
	
	float4 worldPos = float4( transformPos( input.pos, input.index ), 1);
	
	BW_SKY_MAP_COORDS_WORLD_SPACE( output, worldPos )
	
	output.pos = mul(worldPos, viewProj);

	float2 fogging = float2((-1.0 / (fogEnd - fogStart)), (fogEnd / (fogEnd - fogStart)));
	output.fog = output.pos.w * fogging.x + fogging.y;
	
	float3 worldNormal = transformNormaliseVector( input.normal, input.index );
	float3 worldTangent = transformNormaliseVector( input.tangent, input.index );
	float3 worldBinormal = transformNormaliseVector( input.binormal, input.index );
	
	float3x3 tsMatrix = { worldTangent, worldBinormal, worldNormal };
	
	int nPointBump = min( nPoints, 1 );
	int nDirBump = min(1 - nPointBump, min(1, nDirectionals) );
	
	int nPoint = min( max(nPoints - nPointBump, 0), 3);
	int nDir = min(max(nDirectionals - nDirBump, 0), 2 );
	int nSpot = min( max(nSpotLights - 1, 0), 2 );

	output.tc = input.tc;
	output.diffuse = ambientColour;
	
	if (nSpot > 0)
		output.diffuse.xyz += spotLight( worldPos, worldNormal, spotLights[1] );

	if (nDir > 0)
		output.diffuse.xyz += directionalLight( worldNormal, directionalLights[nDirBump] );
	if (nDir > 1)
		output.diffuse.xyz += directionalLight( worldNormal, directionalLights[nDirBump + 1] );

	if (nPoint > 0)
		output.diffuse.xyz += pointLight( worldPos, worldNormal, pointLights[1] );
	if (nPoint > 1)
		output.diffuse.xyz += pointLight( worldPos, worldNormal, pointLights[2] );
	if (nPoint > 2)
		output.diffuse.xyz += pointLight( worldPos, worldNormal, pointLights[3] );

	if (nDirBump > 0)
		output.attenuation.y = directionalBumpLight( tsMatrix, directionalLights[0], output.dLight2.xyz );
	else if (nPointBump > 0)
		output.attenuation.y = pointBumpLight( worldPos, tsMatrix, pointLights[0], output.dLight2.xyz );
	else
		output.attenuation.y = 0;
	
	float3 eye = normalize(cameraPos.xyz - worldPos);

	int nPointSpecBump = min( nSpecularPoints, 2 );
	int nDirSpecBump = min(2 - nPointSpecBump, min(2, nSpecularDirectionals) );

	output.attenuation.x = output.attenuation.z = spotSpecBumpLight( worldPos, worldNormal, eye, tsMatrix, spotLights[0], output.dLight1.xyz, output.sLight1.xyz, output.spotDir );

	if (nDirSpecBump > 0)
		output.attenuation.w = directionalSpecBumpLight( eye, tsMatrix, specularDirectionalLights[0], output.sLight2.xyz );
	else if (nPointSpecBump > 0)
		output.attenuation.w = pointSpecBumpLight( worldPos, eye, tsMatrix, specularPointLights[0], output.sLight2.xyz );
	else
		output.attenuation.w = 0;

	return output;
}

sampler diffuseSampler = sampler_state
{
	Texture = (diffuseMap);
	ADDRESSU = CLAMP;
	ADDRESSV = CLAMP;
	ADDRESSW = CLAMP;
	MAGFILTER = LINEAR;
	MINFILTER = LINEAR;
	MIPFILTER = LINEAR;
	MAXMIPLEVEL = 0;
	MIPMAPLODBIAS = 0;
};

sampler specularSampler = sampler_state
{
	Texture = (specularMap);
	ADDRESSU = CLAMP;
	ADDRESSV = CLAMP;
	ADDRESSW = CLAMP;
	MAGFILTER = LINEAR;
	MINFILTER = LINEAR;
	MIPFILTER = LINEAR;
	MAXMIPLEVEL = 0;
	MIPMAPLODBIAS = 0;
};

sampler normalSampler = sampler_state
{
	Texture = (normalMap);
	ADDRESSU = CLAMP;
	ADDRESSV = CLAMP;
	ADDRESSW = CLAMP;
	MAGFILTER = LINEAR;
	MINFILTER = LINEAR;
	MIPFILTER = LINEAR;
	MAXMIPLEVEL = 0;
	MIPMAPLODBIAS = 0;
};

BW_SKY_LIGHT_MAP_SAMPLER

float4 ps_main( OutputCharacterLighting input,
	uniform int nDirectionals, 
	uniform int nPoints, 
	uniform int nSpecularDirectionals, 
	uniform int nSpecularPoints ) : COLOR0
{
	//  Output constant color:
	float4 diffuseMap = tex2D( diffuseSampler, input.tc );
	float3 specularMap = tex2D( specularSampler, input.tc );
	float3 normal = (tex2D( normalSampler, input.tc ).xyz * 2 ) - 1;
	float3 diffuseColour = input.diffuse;

	float3 diffuse1Colour = float3(0,0,0);
	float3 diffuse2Colour = float3(0,0,0);
	float3 specular1Colour = float3(0,0,0);
	float3 specular2Colour = float3(0,0,0);

	bool d1 = true;
	bool d2 = true;
	bool s1 = true;
	bool s2 = true;

	if (nPoints > 0 )
		diffuse1Colour = pointLights[0].colour.xyz;
	else if (nDirectionals > 1)
		diffuse1Colour = directionalLights[1].colour.xyz;
	else
		d1 = false;
	
	if (nPoints > 1)
		diffuse2Colour = pointLights[1].colour.xyz;
	else if (nDirectionals > 0)
		diffuse2Colour = directionalLights[0].colour.xyz;
	else
		d2 = false;
	

	if (nSpecularPoints > 0)
		specular1Colour = specularPointLights[0].colour.xyz;
	else if (nSpecularDirectionals > 1)
		specular1Colour = specularDirectionalLights[1].colour.xyz;
	else
		s1 = false;

	if (nSpecularPoints > 1)
		specular2Colour = specularPointLights[1].colour.xyz;
	else if (nSpecularDirectionals > 0)
		specular2Colour = specularDirectionalLights[0].colour.xyz;
	else
		s2 = false;
		
	float4 attenuation = (0,0,0,0);
	if (d1)
		attenuation.x = saturate( dot( normalize(input.dLight1.xyz), normal ) );
	if (d2)
		attenuation.y = saturate( dot( normalize(input.dLight2.xyz), normal ) );
	if (s1)
		attenuation.z = pow( saturate( dot( normalize(input.sLight1.xyz), normal ) ), 32 );
	if (s2)
		attenuation.w = pow( saturate( dot( normalize(input.sLight2.xyz), normal ) ), 32 );
	
	attenuation *= input.attenuation;

	if (d1)
		diffuseColour +=  attenuation.x * diffuse1Colour;
	if (d2)
		diffuseColour +=  attenuation.y * diffuse2Colour;

	float3 specularColour = float3(0,0,0);

	if (s1)
		specularColour += attenuation.z * specular1Colour;
	if (s2)
		specularColour += attenuation.w * specular2Colour;

	diffuseColour *= diffuseMap.xyz;
	specularColour *=  specularMap;

#ifdef MOD2X
	diffuseColour *= (1 + diffuseLightExtraModulation );
	specularColour *= (1 + specularLightExtraModulation);
#endif
	
	float skyMap = SAMPLE_SKY_MAP(input)
	float4 colour;
	colour.xyz = skyMap * diffuseColour + specularColour;

	colour.w = diffuseMap.w;

	return colour;
}

float4 ps_mainSpot( OutputCharacterLightingSpot input,
	uniform int nDirectionals, 
	uniform int nPoints, 
	uniform int nSpecularDirectionals, 
	uniform int nSpecularPoints ) : COLOR0
{
	//  Output constant color:
	float4 diffuseMap = tex2D( diffuseSampler, input.tc );
	float3 specularMap = tex2D( specularSampler, input.tc );
	float3 normal = (tex2D( normalSampler, input.tc ).xyz * 2 ) - 1;
	float3 diffuseColour = input.diffuse;

	float3 diffuse1Colour = float3(0,0,0);
	float3 diffuse2Colour = float3(0,0,0);
	float3 specular1Colour = float3(0,0,0);
	float3 specular2Colour = float3(0,0,0);

	bool d1 = true;
	bool d2 = true;
	bool s1 = true;
	bool s2 = true;

	diffuse1Colour = spotLights[0].colour.xyz;
	
	if (nPoints > 0)
		diffuse2Colour = pointLights[0].colour.xyz;
	else if (nDirectionals > 0)
		diffuse2Colour = directionalLights[0].colour.xyz;
	else
		d2 = false;
	
	specular1Colour = spotLights[0].colour.xyz;

	if (nSpecularPoints > 0)
		specular2Colour = specularPointLights[0].colour.xyz;
	else if (nSpecularDirectionals > 0)
		specular2Colour = specularDirectionalLights[0].colour.xyz;
	else
		s2 = false;
		
	float4 attenuation = (0,0,0,0);
	attenuation.x = saturate( dot( normalize(input.dLight1.xyz), normal ) );
	if (d2)
		attenuation.y = saturate( dot( normalize(input.dLight2.xyz), normal ) );

	attenuation.z = pow( saturate( dot( normalize(input.sLight1.xyz), normal ) ), 32 );
	if (s2)
		attenuation.w = pow( saturate( dot( normalize(input.sLight2.xyz), normal ) ), 32 );
	
	float spotEffect = saturate( dot( normalize(input.spotDir), spotLights[0].direction.xyz  ) - spotLights[0].attenuation.z) /  ( 1 - spotLights[0].attenuation.z );
	attenuation.xz *= spotEffect;
	attenuation *= input.attenuation;

	diffuseColour +=  attenuation.x * diffuse1Colour;
	if (d2)
		diffuseColour +=  attenuation.y * diffuse2Colour;

	float3 specularColour = float3(0,0,0);

	specularColour += attenuation.z * specular1Colour;
	if (s2)
		specularColour += attenuation.w * specular2Colour;

	diffuseColour *= diffuseMap.xyz;
	specularColour *=  specularMap;

#ifdef MOD2X
	diffuseColour *= (1 + diffuseLightExtraModulation );
	specularColour *= (1 + specularLightExtraModulation);
#endif
	
	float skyMap = SAMPLE_SKY_MAP(input)
	float4 colour;
	colour.xyz = skyMap * diffuseColour + specularColour;

	colour.w = diffuseMap.w;

	return colour;
}

VertexShader vertexShaders[180] =
{
	compile vs_2_0 vs_main(0,0,0,0),
	compile vs_2_0 vs_main(1,0,0,0),
	compile vs_2_0 vs_main(2,0,0,0),
	compile vs_2_0 vs_main(0,1,0,0),
	compile vs_2_0 vs_main(1,1,0,0),
	compile vs_2_0 vs_main(2,1,0,0),
	compile vs_2_0 vs_main(0,2,0,0),
	compile vs_2_0 vs_main(1,2,0,0),
	compile vs_2_0 vs_main(2,2,0,0),
	compile vs_2_0 vs_main(0,3,0,0),
	compile vs_2_0 vs_main(1,3,0,0),
	compile vs_2_0 vs_main(2,3,0,0),
	compile vs_2_0 vs_main(0,4,0,0),
	compile vs_2_0 vs_main(1,4,0,0),
	compile vs_2_0 vs_main(2,4,0,0),
	compile vs_2_0 vs_main(0,0,1,0),
	compile vs_2_0 vs_main(1,0,1,0),
	compile vs_2_0 vs_main(2,0,1,0),
	compile vs_2_0 vs_main(0,1,1,0),
	compile vs_2_0 vs_main(1,1,1,0),
	compile vs_2_0 vs_main(2,1,1,0),
	compile vs_2_0 vs_main(0,2,1,0),
	compile vs_2_0 vs_main(1,2,1,0),
	compile vs_2_0 vs_main(2,2,1,0),
	compile vs_2_0 vs_main(0,3,1,0),
	compile vs_2_0 vs_main(1,3,1,0),
	compile vs_2_0 vs_main(2,3,1,0),
	compile vs_2_0 vs_main(0,4,1,0),
	compile vs_2_0 vs_main(1,4,1,0),
	compile vs_2_0 vs_main(2,4,1,0),
	compile vs_2_0 vs_main(0,0,2,0),
	compile vs_2_0 vs_main(1,0,2,0),
	compile vs_2_0 vs_main(2,0,2,0),
	compile vs_2_0 vs_main(0,1,2,0),
	compile vs_2_0 vs_main(1,1,2,0),
	compile vs_2_0 vs_main(2,1,2,0),
	compile vs_2_0 vs_main(0,2,2,0),
	compile vs_2_0 vs_main(1,2,2,0),
	compile vs_2_0 vs_main(2,2,2,0),
	compile vs_2_0 vs_main(0,3,2,0),
	compile vs_2_0 vs_main(1,3,2,0),
	compile vs_2_0 vs_main(2,3,2,0),
	compile vs_2_0 vs_main(0,4,2,0),
	compile vs_2_0 vs_main(1,4,2,0),
	compile vs_2_0 vs_main(2,4,2,0),
	compile vs_2_0 vs_main(0,0,0,1),
	compile vs_2_0 vs_main(1,0,0,1),
	compile vs_2_0 vs_main(2,0,0,1),
	compile vs_2_0 vs_main(0,1,0,1),
	compile vs_2_0 vs_main(1,1,0,1),
	compile vs_2_0 vs_main(2,1,0,1),
	compile vs_2_0 vs_main(0,2,0,1),
	compile vs_2_0 vs_main(1,2,0,1),
	compile vs_2_0 vs_main(2,2,0,1),
	compile vs_2_0 vs_main(0,3,0,1),
	compile vs_2_0 vs_main(1,3,0,1),
	compile vs_2_0 vs_main(2,3,0,1),
	compile vs_2_0 vs_main(0,4,0,1),
	compile vs_2_0 vs_main(1,4,0,1),
	compile vs_2_0 vs_main(2,4,0,1),
	compile vs_2_0 vs_main(0,0,1,1),
	compile vs_2_0 vs_main(1,0,1,1),
	compile vs_2_0 vs_main(2,0,1,1),
	compile vs_2_0 vs_main(0,1,1,1),
	compile vs_2_0 vs_main(1,1,1,1),
	compile vs_2_0 vs_main(2,1,1,1),
	compile vs_2_0 vs_main(0,2,1,1),
	compile vs_2_0 vs_main(1,2,1,1),
	compile vs_2_0 vs_main(2,2,1,1),
	compile vs_2_0 vs_main(0,3,1,1),
	compile vs_2_0 vs_main(1,3,1,1),
	compile vs_2_0 vs_main(2,3,1,1),
	compile vs_2_0 vs_main(0,4,1,1),
	compile vs_2_0 vs_main(1,4,1,1),
	compile vs_2_0 vs_main(2,4,1,1),
	compile vs_2_0 vs_main(0,0,0,2),
	compile vs_2_0 vs_main(1,0,0,2),
	compile vs_2_0 vs_main(2,0,0,2),
	compile vs_2_0 vs_main(0,1,0,2),
	compile vs_2_0 vs_main(1,1,0,2),
	compile vs_2_0 vs_main(2,1,0,2),
	compile vs_2_0 vs_main(0,2,0,2),
	compile vs_2_0 vs_main(1,2,0,2),
	compile vs_2_0 vs_main(2,2,0,2),
	compile vs_2_0 vs_main(0,3,0,2),
	compile vs_2_0 vs_main(1,3,0,2),
	compile vs_2_0 vs_main(2,3,0,2),
	compile vs_2_0 vs_main(0,4,0,2),
	compile vs_2_0 vs_main(1,4,0,2),
	compile vs_2_0 vs_main(2,4,0,2),
	
	compile vs_2_0 vs_mainSpot(0,0,0,0),
	compile vs_2_0 vs_mainSpot(1,0,0,0),
	compile vs_2_0 vs_mainSpot(2,0,0,0),
	compile vs_2_0 vs_mainSpot(0,1,0,0),
	compile vs_2_0 vs_mainSpot(1,1,0,0),
	compile vs_2_0 vs_mainSpot(2,1,0,0),
	compile vs_2_0 vs_mainSpot(0,2,0,0),
	compile vs_2_0 vs_mainSpot(1,2,0,0),
	compile vs_2_0 vs_mainSpot(2,2,0,0),
	compile vs_2_0 vs_mainSpot(0,3,0,0),
	compile vs_2_0 vs_mainSpot(1,3,0,0),
	compile vs_2_0 vs_mainSpot(2,3,0,0),
	compile vs_2_0 vs_mainSpot(0,4,0,0),
	compile vs_2_0 vs_mainSpot(1,4,0,0),
	compile vs_2_0 vs_mainSpot(2,4,0,0),
	compile vs_2_0 vs_mainSpot(0,0,1,0),
	compile vs_2_0 vs_mainSpot(1,0,1,0),
	compile vs_2_0 vs_mainSpot(2,0,1,0),
	compile vs_2_0 vs_mainSpot(0,1,1,0),
	compile vs_2_0 vs_mainSpot(1,1,1,0),
	compile vs_2_0 vs_mainSpot(2,1,1,0),
	compile vs_2_0 vs_mainSpot(0,2,1,0),
	compile vs_2_0 vs_mainSpot(1,2,1,0),
	compile vs_2_0 vs_mainSpot(2,2,1,0),
	compile vs_2_0 vs_mainSpot(0,3,1,0),
	compile vs_2_0 vs_mainSpot(1,3,1,0),
	compile vs_2_0 vs_mainSpot(2,3,1,0),
	compile vs_2_0 vs_mainSpot(0,4,1,0),
	compile vs_2_0 vs_mainSpot(1,4,1,0),
	compile vs_2_0 vs_mainSpot(2,4,1,0),
	compile vs_2_0 vs_mainSpot(0,0,2,0),
	compile vs_2_0 vs_mainSpot(1,0,2,0),
	compile vs_2_0 vs_mainSpot(2,0,2,0),
	compile vs_2_0 vs_mainSpot(0,1,2,0),
	compile vs_2_0 vs_mainSpot(1,1,2,0),
	compile vs_2_0 vs_mainSpot(2,1,2,0),
	compile vs_2_0 vs_mainSpot(0,2,2,0),
	compile vs_2_0 vs_mainSpot(1,2,2,0),
	compile vs_2_0 vs_mainSpot(2,2,2,0),
	compile vs_2_0 vs_mainSpot(0,3,2,0),
	compile vs_2_0 vs_mainSpot(1,3,2,0),
	compile vs_2_0 vs_mainSpot(2,3,2,0),
	compile vs_2_0 vs_mainSpot(0,4,2,0),
	compile vs_2_0 vs_mainSpot(1,4,2,0),
	compile vs_2_0 vs_mainSpot(2,4,2,0),
	compile vs_2_0 vs_mainSpot(0,0,0,1),
	compile vs_2_0 vs_mainSpot(1,0,0,1),
	compile vs_2_0 vs_mainSpot(2,0,0,1),
	compile vs_2_0 vs_mainSpot(0,1,0,1),
	compile vs_2_0 vs_mainSpot(1,1,0,1),
	compile vs_2_0 vs_mainSpot(2,1,0,1),
	compile vs_2_0 vs_mainSpot(0,2,0,1),
	compile vs_2_0 vs_mainSpot(1,2,0,1),
	compile vs_2_0 vs_mainSpot(2,2,0,1),
	compile vs_2_0 vs_mainSpot(0,3,0,1),
	compile vs_2_0 vs_mainSpot(1,3,0,1),
	compile vs_2_0 vs_mainSpot(2,3,0,1),
	compile vs_2_0 vs_mainSpot(0,4,0,1),
	compile vs_2_0 vs_mainSpot(1,4,0,1),
	compile vs_2_0 vs_mainSpot(2,4,0,1),
	compile vs_2_0 vs_mainSpot(0,0,1,1),
	compile vs_2_0 vs_mainSpot(1,0,1,1),
	compile vs_2_0 vs_mainSpot(2,0,1,1),
	compile vs_2_0 vs_mainSpot(0,1,1,1),
	compile vs_2_0 vs_mainSpot(1,1,1,1),
	compile vs_2_0 vs_mainSpot(2,1,1,1),
	compile vs_2_0 vs_mainSpot(0,2,1,1),
	compile vs_2_0 vs_mainSpot(1,2,1,1),
	compile vs_2_0 vs_mainSpot(2,2,1,1),
	compile vs_2_0 vs_mainSpot(0,3,1,1),
	compile vs_2_0 vs_mainSpot(1,3,1,1),
	compile vs_2_0 vs_mainSpot(2,3,1,1),
	compile vs_2_0 vs_mainSpot(0,4,1,1),
	compile vs_2_0 vs_mainSpot(1,4,1,1),
	compile vs_2_0 vs_mainSpot(2,4,1,1),
	compile vs_2_0 vs_mainSpot(0,0,0,2),
	compile vs_2_0 vs_mainSpot(1,0,0,2),
	compile vs_2_0 vs_mainSpot(2,0,0,2),
	compile vs_2_0 vs_mainSpot(0,1,0,2),
	compile vs_2_0 vs_mainSpot(1,1,0,2),
	compile vs_2_0 vs_mainSpot(2,1,0,2),
	compile vs_2_0 vs_mainSpot(0,2,0,2),
	compile vs_2_0 vs_mainSpot(1,2,0,2),
	compile vs_2_0 vs_mainSpot(2,2,0,2),
	compile vs_2_0 vs_mainSpot(0,3,0,2),
	compile vs_2_0 vs_mainSpot(1,3,0,2),
	compile vs_2_0 vs_mainSpot(2,3,0,2),
	compile vs_2_0 vs_mainSpot(0,4,0,2),
	compile vs_2_0 vs_mainSpot(1,4,0,2),
	compile vs_2_0 vs_mainSpot(2,4,0,2)	
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
	
	return min(nDir, 2) + (min(nPoint, 4) * 3) + (min(nSpecIndex, 6) * 15) + (min(nSpot,1)*90);
}

PixelShader pixelShaders[72] =
{
	compile ps_2_0 ps_main(0,0,0,0),
	compile ps_2_0 ps_main(1,0,0,0),
	compile ps_2_0 ps_main(2,0,0,0),
	compile ps_2_0 ps_main(0,1,0,0),
	compile ps_2_0 ps_main(0,2,0,0),
	compile ps_2_0 ps_main(1,1,0,0),
	compile ps_2_0 ps_main(0,0,1,0),
	compile ps_2_0 ps_main(1,0,1,0),
	compile ps_2_0 ps_main(2,0,1,0),
	compile ps_2_0 ps_main(0,1,1,0),
	compile ps_2_0 ps_main(0,2,1,0),
	compile ps_2_0 ps_main(1,1,1,0),
	compile ps_2_0 ps_main(0,0,2,0),
	compile ps_2_0 ps_main(1,0,2,0),
	compile ps_2_0 ps_main(2,0,2,0),
	compile ps_2_0 ps_main(0,1,2,0),
	compile ps_2_0 ps_main(0,2,2,0),
	compile ps_2_0 ps_main(1,1,2,0),
	compile ps_2_0 ps_main(0,0,0,1),
	compile ps_2_0 ps_main(1,0,0,1),
	compile ps_2_0 ps_main(2,0,0,1),
	compile ps_2_0 ps_main(0,1,0,1),
	compile ps_2_0 ps_main(0,2,0,1),
	compile ps_2_0 ps_main(1,1,0,1),
	compile ps_2_0 ps_main(0,0,0,2),
	compile ps_2_0 ps_main(1,0,0,2),
	compile ps_2_0 ps_main(2,0,0,2),
	compile ps_2_0 ps_main(0,1,0,2),
	compile ps_2_0 ps_main(0,2,0,2),
	compile ps_2_0 ps_main(1,1,0,2),
	compile ps_2_0 ps_main(0,0,1,1),
	compile ps_2_0 ps_main(1,0,1,1),
	compile ps_2_0 ps_main(2,0,1,1),
	compile ps_2_0 ps_main(0,1,1,1),
	compile ps_2_0 ps_main(0,2,1,1),
	compile ps_2_0 ps_main(1,1,1,1),
	
	compile ps_2_0 ps_mainSpot(0,0,0,0),
	compile ps_2_0 ps_mainSpot(1,0,0,0),
	compile ps_2_0 ps_mainSpot(2,0,0,0),
	compile ps_2_0 ps_mainSpot(0,1,0,0),
	compile ps_2_0 ps_mainSpot(0,2,0,0),
	compile ps_2_0 ps_mainSpot(1,1,0,0),
	compile ps_2_0 ps_mainSpot(0,0,1,0),
	compile ps_2_0 ps_mainSpot(1,0,1,0),
	compile ps_2_0 ps_mainSpot(2,0,1,0),
	compile ps_2_0 ps_mainSpot(0,1,1,0),
	compile ps_2_0 ps_mainSpot(0,2,1,0),
	compile ps_2_0 ps_mainSpot(1,1,1,0),
	compile ps_2_0 ps_mainSpot(0,0,2,0),
	compile ps_2_0 ps_mainSpot(1,0,2,0),
	compile ps_2_0 ps_mainSpot(2,0,2,0),
	compile ps_2_0 ps_mainSpot(0,1,2,0),
	compile ps_2_0 ps_mainSpot(0,2,2,0),
	compile ps_2_0 ps_mainSpot(1,1,2,0),
	compile ps_2_0 ps_mainSpot(0,0,0,1),
	compile ps_2_0 ps_mainSpot(1,0,0,1),
	compile ps_2_0 ps_mainSpot(2,0,0,1),
	compile ps_2_0 ps_mainSpot(0,1,0,1),
	compile ps_2_0 ps_mainSpot(0,2,0,1),
	compile ps_2_0 ps_mainSpot(1,1,0,1),
	compile ps_2_0 ps_mainSpot(0,0,0,2),
	compile ps_2_0 ps_mainSpot(1,0,0,2),
	compile ps_2_0 ps_mainSpot(2,0,0,2),
	compile ps_2_0 ps_mainSpot(0,1,0,2),
	compile ps_2_0 ps_mainSpot(0,2,0,2),
	compile ps_2_0 ps_mainSpot(1,1,0,2),
	compile ps_2_0 ps_mainSpot(0,0,1,1),
	compile ps_2_0 ps_mainSpot(1,0,1,1),
	compile ps_2_0 ps_mainSpot(2,0,1,1),
	compile ps_2_0 ps_mainSpot(0,1,1,1),
	compile ps_2_0 ps_mainSpot(0,2,1,1),
	compile ps_2_0 ps_mainSpot(1,1,1,1)	
};

int psIndex( int nDir, int nPoint, int nSpecDir, int nSpecPoint, int nSpot )
{
	int nd = min( nDir, 2 );
	int np = min( nPoint, 2 );
	
	int nsd = min( nSpecDir, 2 );
	int nsp = min( nSpecPoint, 2 );

	int specIndex = nsd;
	if (nsp > 0)
	{
		if (nsp == 1)
		{
			if (nsd == 0)
			{
				specIndex = 3;
			}
			else
			{
				specIndex = 5;
			}
		}
		else
		{
			specIndex = 4;
		}
	}
	
	int index = nd;
	if (np > 0)
	{
		if (np == 1)
		{
			if (nd == 0)
			{
				index = 3;
			}
			else
			{
				index = 5;
			}
		}
		else
		{
			index = 4;
		}
	}
	return index + (specIndex * 6) + (min(nSpot,1)*36);
}

//--------------------------------------------------------------//
// Technique Section for for pixel/vertexshader 1
//--------------------------------------------------------------//
technique character_lighting_shader2
<
	bool skinned = true;
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
		
		VertexShader = (vertexShaders[vsIndex(nDirectionalLights, nPointLights, nSpecularDirectionalLights, nSpecularPointLights, nSpotLights)]);
		PixelShader = (pixelShaders[psIndex(nDirectionalLights, nPointLights, nSpecularDirectionalLights, nSpecularPointLights, nSpotLights)]);
	}

}

OutputDiffuseCharacterLighting diffuseCharacterLighting_vs1( VertexXYZNUVITB i,
	uniform int nDirectionals, 
	uniform int nPoints )
{
	OutputDiffuseCharacterLighting o = (OutputDiffuseCharacterLighting)0;

	float4 worldPos = float4( transformPos( i.pos, i.index ), 1);
	
	o.pos = mul(worldPos, viewProj);

	float2 fogging = float2((-1.0 / (fogEnd - fogStart)), (fogEnd / (fogEnd - fogStart)));
	o.fog = o.pos.w * fogging.x + fogging.y;
	
	float3 worldNormal = transformNormaliseVector( i.normal, i.index );
	float3 worldTangent = transformNormaliseVector( i.tangent, i.index );
	float3 worldBinormal = transformNormaliseVector( i.binormal, i.index );
	
	float3x3 tsMatrix = { worldTangent, worldBinormal, worldNormal };

	int nPointBump = min( nPoints, 2 );
	int nDirBump = min(2 - nPointBump, min(2, nDirectionals) );
	int nPoint = min( max(nPoints - nPointBump, 0), 2);
	int nDir = min(max(nDirectionals - nDirBump, 0), 2 );

	o.tc = i.tc;
	o.ntc = i.tc;
	o.diffuse = ambientColour;
	
	int ns = nSpotLights < 2 ? nSpotLights : 2;
	for (int l = 0; l < ns; l++)
	{
		o.diffuse.xyz += spotLight( worldPos, worldNormal, spotLights[l] );
	}

	if (nDir > 0)
		o.diffuse.xyz += directionalLight( worldNormal, directionalLights[nDirBump] );
	if (nDir > 1)
		o.diffuse.xyz += directionalLight( worldNormal, directionalLights[nDirBump + 1] );

	if (nPoint > 0)
		o.diffuse.xyz += pointLight( worldPos, worldNormal, pointLights[2] );
	if (nPoint > 1)
		o.diffuse.xyz += pointLight( worldPos, worldNormal, pointLights[3] );

	if (nDirBump > 1)
		o.attenuation.x = directionalBumpLight( tsMatrix, directionalLights[1], o.dLight1.xyz );
	else if (nPointBump > 0)
		o.attenuation.xyz = pointBumpLight( worldPos, tsMatrix, pointLights[0], o.dLight1.xyz );
	else
		o.attenuation.xyz = 0;

	if (nDirBump > 0)
		o.attenuation.w = directionalBumpLight( tsMatrix, directionalLights[0], o.dLight2.xyz );
	else if (nPointBump > 1)
		o.attenuation.w = pointBumpLight( worldPos, tsMatrix, pointLights[1], o.dLight2.xyz );
	else
		o.attenuation.w = 0;
	return o;
}

OutputSpecularCharacterLightingAlpha specularCharacterLighting_vs1( VertexXYZNUVITB i,
	uniform int nSpecularDirectionals, 
	uniform int nSpecularPoints )
{
	OutputSpecularCharacterLightingAlpha o = (OutputSpecularCharacterLightingAlpha)0;

	float4 worldPos = float4( transformPos( i.pos, i.index ), 1);
	
	o.pos = mul(worldPos, viewProj);

	float2 fogging = float2((-1.0 / (fogEnd - fogStart)), (fogEnd / (fogEnd - fogStart)));
	o.fog = o.pos.w * fogging.x + fogging.y;
	
	float3 worldNormal = transformNormaliseVector( i.normal, i.index );
	float3 worldTangent = transformNormaliseVector( i.tangent, i.index );
	float3 worldBinormal = transformNormaliseVector( i.binormal, i.index );
	
	float3x3 tsMatrix = { worldTangent, worldBinormal, worldNormal };

	o.ntc = i.tc;
	o.tc = i.tc;
	o.atc = i.tc;

	float3 eye = normalize(cameraPos - worldPos);

	int nPointSpecBump = min( nSpecularPoints, 1 );
	int nDirSpecBump = min(1 - nPointSpecBump, min(1, nSpecularDirectionals) );

	if (nPointSpecBump > 0)
		o.attenuation.xyz = pointSpecBumpLight( worldPos, eye, tsMatrix, specularPointLights[0], o.sLight.xyz );
	else if (nDirSpecBump > 0)
		o.attenuation.xyz = directionalSpecBumpLight( eye, tsMatrix, specularDirectionalLights[0], o.sLight.xyz );
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
							uniform int nBumpPointLights, uniform bool mod2) : COLOR0
{
	float4 diffuseMap = tex2D( diffuseSampler, i.tc );
	float3 normal = (tex2D( normalSampler, i.ntc ) * 2 ) - 1;
	float3 diffuseDir1 = (texCUBE( normalisationSampler, i.dLight1 ) * 2) - 1;
	float3 diffuseDir2 = (texCUBE( normalisationSampler, i.dLight2 ) * 2) - 1;
	float4 diffuse = i.diffuse;
	
	float3 d2Colour;
	float3 d1Colour;
	if (nBumpPointLights < 2)
		d2Colour = directionalLights[0].colour;
	else
		d2Colour = pointLights[1].colour;
	if (nBumpPointLights < 1)
		d1Colour = directionalLights[1].colour;
	else
		d1Colour = pointLights[0].colour;

	diffuse.xyz += saturate(dot(normal, diffuseDir1)) * i.attenuation.xyz * d1Colour;
	diffuse.xyz += saturate(dot(normal, diffuseDir2)) * i.attenuation.w * d2Colour;
	
	return float4(diffuse.xyz * diffuseMap.xyz * (int(mod2) + 1), diffuseMap.w);
}

float4 specularCharacterLighting_ps1( OutputSpecularCharacterLightingAlpha i, 
							uniform bool point, uniform bool mod2 ) : COLOR0
{
	float3 specularMap = tex2D( specularSampler, i.tc );
	float3 normal = (tex2D( normalSampler, i.ntc ) * 2) - 1;
	float3 specularDir = (texCUBE( normalisationSampler, i.sLight ) * 2) - 1;
	float4 specular;
	specular.w = dot( normal, specularDir );
	specular.w = pow(specular.w, 32);
	float3 specularColour;
	if (point)
		specularColour = specularPointLights[0].colour * specularMap;
	else
		specularColour = specularDirectionalLights[0].colour * specularMap;
	float3 colour = specularColour * i.attenuation.xyz * (int(mod2) + 1);
	
	float alpha = tex2D(diffuseSampler, i.atc).a;
	return float4( specular.w * colour, alpha );
}
							
VertexShader diffuseVertexShaders_vs1[15] =
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
	compile vs_1_1 diffuseCharacterLighting_vs1(2,4)
};

VertexShader specularVertexShaders_vs1[3] =
{
	compile vs_1_1 specularCharacterLighting_vs1(0,0),
	compile vs_1_1 specularCharacterLighting_vs1(1,0),
	compile vs_1_1 specularCharacterLighting_vs1(0,1)
};

PixelShader diffusePixelShaders_ps1[6] =
{
	compile ps_1_1 diffuseCharacterLighting_ps1(0, false),
	compile ps_1_1 diffuseCharacterLighting_ps1(1, false),
	compile ps_1_1 diffuseCharacterLighting_ps1(2, false),
	compile ps_1_1 diffuseCharacterLighting_ps1(0, true),
	compile ps_1_1 diffuseCharacterLighting_ps1(1, true),
	compile ps_1_1 diffuseCharacterLighting_ps1(2, true)};

PixelShader specularPixelShaders_ps1[4] =
{
	compile ps_1_1 specularCharacterLighting_ps1(false, false),
	compile ps_1_1 specularCharacterLighting_ps1(true, false),
	compile ps_1_1 specularCharacterLighting_ps1(false, true),
	compile ps_1_1 specularCharacterLighting_ps1(true, true)
};

int diffuseVSIndex( int nDir, int nPoint )
{
	return min(4,nPoint) * 3 + min(nDir,2);
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
technique character_lighting_shader1
<
	bool skinned = true;
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
		
		VertexShader = (diffuseVertexShaders_vs1[diffuseVSIndex(nDirectionalLights, nPointLights)]);
#ifdef MOD2X
		PixelShader = (diffusePixelShaders_ps1[min(nPointLights,2) + int(diffuseLightExtraModulation>0.5) * 3]);
#else
		PixelShader = (diffusePixelShaders_ps1[min(nPointLights,2)]);
#endif
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
#ifdef MOD2X
		PixelShader = (specularPixelShaders_ps1[int(nSpecularPointLights>0) + int(specularLightExtraModulation>0.5) * 2]);
#else
		PixelShader = (specularPixelShaders_ps1[int(nSpecularPointLights>0)]);
#endif
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

OutputFallback diffuseOnlyFallback( VertexXYZNUVI i)
{
	OutputFallback o = (OutputFallback)0;

	float4 worldPos = float4( transformPos( i.pos, i.index ), 1);
	
	o.pos = mul(worldPos, viewProj);

	float2 fogging = float2((-1.0 / (fogEnd - fogStart)), (fogEnd / (fogEnd - fogStart)));
	o.fog = o.pos.w * fogging.x + fogging.y;
	
	float3 worldNormal = transformNormaliseVector( i.normal, i.index );

	o.tc = i.tc;
	o.diffuse = ambientColour;
	
	int nd = nDirectionalLights < 2 ? nDirectionalLights : 2;
	int np = nPointLights < 4 ? nPointLights : 4;
	int ns = nSpotLights < 2 ? nSpotLights : 2;
	
	for (int l = 0; l < nd; l++)
	{
		o.diffuse.xyz += directionalLight( worldNormal, directionalLights[l] );
	}
	
	for (int l = 0; l < np; l++)
	{
		o.diffuse.xyz += pointLight( worldPos, worldNormal, pointLights[l] );
	}
	
	for (int l = 0; l < ns; l++)
	{
		o.diffuse.xyz += spotLight( worldPos, worldNormal, spotLights[l] );
	}
	
#ifdef MOD2X
	o.diffuse.xyz *= 0.5 * (1 + diffuseLightExtraModulation);
#endif

	return o;
}

//--------------------------------------------------------------//
// Technique section for software mode
//--------------------------------------------------------------//

technique software_fallbackHS
<
	bool skinned = true;
>
{
	pass Pass_0
	{
		BW_BLENDING_SOLID
		BW_FOG
		BW_TEXTURESTAGE_DIFFUSEONLY(0, diffuseMap)
		BW_TEXTURESTAGE_TERMINATE(1)
		CULLMODE = (doubleSided ? 1 : 3);
		
		VertexShader = compile vs_2_0 diffuseOnlyFallback();
		PixelShader = NULL;
	}
}
#else
#include "character_lighting_specmap.fx"
#endif