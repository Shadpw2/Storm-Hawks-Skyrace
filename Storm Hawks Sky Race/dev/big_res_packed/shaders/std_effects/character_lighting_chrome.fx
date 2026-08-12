#include "stdinclude.fxh"

BW_SKY_LIGHT_MAP_OBJECT_SPACE

float4x4 worldViewProj : WorldViewProjection;

#include "character_lighting_chrome.fxh"

#ifdef IN_GAME
float3 osCameraPos : CameraPosObjectSpace;
bool staticLighting : StaticLighting = false;
#endif

#ifdef IN_GAME

// Define the lighting type used in this shader
DIFFUSE_LIGHTING_OBJECT_SPACE
SPECULAR_LIGHTING_OBJECT_SPACE

void calculateLightingEnv_vs3( in float3x3 tsMatrix, 
							in float4 pos,
							in float4 diffuse,
							in float2 tex,
							in int nDirectionals, 
							in int nPoints, 
							in int nSpecularDirectionals, 
							in int nSpecularPoints,
							out OutputCharacterLightingEnv o )
{
	o = (OutputCharacterLightingEnv)0;
	o.pos = mul(pos, worldViewProj);
	
	float4 worldPos = mul( pos, world );
#if SKY_LIGHT_MAP_ENABLE	
	float4 skyLightMap;
	skyLightMap.xyz = worldPos.xyz - wsCameraPos.xyz;
	skyLightMap.w = 1.0;
	o.tc.z = dot( skyLightMap, skyLightMapTransform[0] );
	o.tc.w = dot( skyLightMap, skyLightMapTransform[1] );	
#endif	

	float2 fogging = float2((-1.0 / (fogEnd - fogStart)), (fogEnd / (fogEnd - fogStart)));
	o.fog = o.pos.w * fogging.x + fogging.y;

	o.tc.xy = tex;
	o.diffuse = diffuse;	
	
	int nPointBump = min( nPoints, 2 );
	int nDirBump = min(2 - nPointBump, min(2, nDirectionals) );
	int nPoint = min( max(nPoints - nPointBump, 0), 2);
	int nDir = min(max(nDirectionals - nDirBump, 0), 2 );

	if (nDir > 0)
		o.diffuse.xyz += directionalLight( tsMatrix[2], osDirectionalLights[nDirBump] );
	if (nDir > 1)
		o.diffuse.xyz += directionalLight( tsMatrix[2], osDirectionalLights[nDirBump + 1] );

	if (nPoint > 0)
		o.diffuse.xyz += pointLight( pos, tsMatrix[2], osPointLights[2] );
	if (nPoint > 1)
		o.diffuse.xyz += pointLight( pos, tsMatrix[2], osPointLights[3] );

	int ns = nSpotLights < 2 ? nSpotLights : 2;
	for (int l = 0; l < ns; l++)
	{
		o.diffuse.xyz += spotLight( pos, tsMatrix[2], osSpotLights[l] );
	}	

	float4 attenuation;
	if (nDirBump > 1)
		attenuation.x = directionalBumpLight( tsMatrix, osDirectionalLights[1], o.dLight1.xyz );
	else if (nPointBump > 0)
		attenuation.x = pointBumpLight( pos, tsMatrix, osPointLights[0], o.dLight1.xyz );
	else
		attenuation.x = 0;

	if (nDirBump > 0)
		attenuation.y = directionalBumpLight( tsMatrix, osDirectionalLights[0], o.dLight2.xyz );
	else if (nPointBump > 1)
		attenuation.y = pointBumpLight( pos, tsMatrix, osPointLights[1], o.dLight2.xyz );
	else
		attenuation.y = 0;

	float3 eye = normalize(osCameraPos - pos);	

	int nPointSpecBump = min( nSpecularPoints, 2 );
	int nDirSpecBump = min(2 - nPointSpecBump, min(2, nSpecularDirectionals) );

	if (nDirSpecBump > 1)
		attenuation.z = directionalSpecBumpLight( eye, tsMatrix, osSpecularDirectionalLights[1], o.sLight1.xyz );
	else if (nPointSpecBump > 0)
		attenuation.z = pointSpecBumpLight( pos, eye, tsMatrix, osSpecularPointLights[0], o.sLight1.xyz );
	else
		attenuation.z = 0;

	if (nDirSpecBump > 0)
		attenuation.w = directionalSpecBumpLight( eye, tsMatrix, osSpecularDirectionalLights[0], o.sLight2.xyz );
	else if (nPointSpecBump > 1)
		attenuation.w = pointSpecBumpLight( pos, eye, tsMatrix, osSpecularPointLights[1], o.sLight2.xyz );
	else
		attenuation.w = 0;

	o.dLight1.w = attenuation.x;
	o.dLight2.w = attenuation.y;
	o.sLight1.w = attenuation.z;
	o.sLight2.w = attenuation.w;		
	
	// Compute the 3x3 transform from tangent space to cube space:
	o.tangentToCubeSpace0.xyz = transpose(tsMatrix)[0].xyz;
	o.tangentToCubeSpace1.xyz = transpose(tsMatrix)[1].xyz;
	o.tangentToCubeSpace2.xyz = transpose(tsMatrix)[2].xyz;

    o.tangentToCubeSpace0.w = eye.x;
    o.tangentToCubeSpace1.w = eye.y;
    o.tangentToCubeSpace2.w = eye.z;
}


OutputCharacterLightingEnv characterLighting_vs3( VertexXYZNUVTB i,
	uniform int nDirectionals, 
	uniform int nPoints, 
	uniform int nSpecularDirectionals, 
	uniform int nSpecularPoints )
{
	OutputCharacterLightingEnv o;

	float3x3 tsMatrix = { i.tangent, i.binormal, i.normal };	
	calculateLightingEnv_vs3(tsMatrix, i.pos, ambientColour, i.tc,
							nDirectionals, nPoints, nSpecularDirectionals, nSpecularPoints, 
							o );    		
	return o;
}


OutputCharacterLightingEnv characterStaticLighting_vs3( VertexXYZNUVTB_D i,
	uniform int nDirectionals, 
	uniform int nPoints, 
	uniform int nSpecularDirectionals, 
	uniform int nSpecularPoints )
{
	OutputCharacterLightingEnv o;
			
	float3x3 tsMatrix = {i.tangent, i.binormal, i.normal };	
	calculateLightingEnv_vs3(tsMatrix, i.pos, i.diffuse, i.tc,
							nDirectionals, nPoints, nSpecularDirectionals, nSpecularPoints, 
							o );
	return o;
}

float4 characterLighting_ps3( OutputCharacterLightingEnv i ) : COLOR0
{
	//  Output constant color:
	float4 diffuseMap = tex2D( diffuseSampler, i.tc );
	float3 normal = (tex2D( normalSampler, i.tc ) * 2 ) - 1;
	float3 glowMap = tex2D( glowSampler, i.tc );
	float3 diffuseColour = i.diffuse;

	// Calculate a reflection vector and fresnel term
    float3 envNormal;
	envNormal.x = dot(i.tangentToCubeSpace0.xyz, normal );
	envNormal.y = dot(i.tangentToCubeSpace1.xyz, normal );
	envNormal.z = dot(i.tangentToCubeSpace2.xyz, normal );
	float3 eyeVec = normalize( float3(i.tangentToCubeSpace0.w, i.tangentToCubeSpace1.w, i.tangentToCubeSpace2.w) );	
	float3 reflVec = reflect(eyeVec, envNormal);
	reflVec = normalize(reflVec);
	reflVec.y = -reflVec.y;

	float4 reflectionColour = texCUBE(reflectionCubeSampler, reflVec);
	half fresnelTerm = fresnel(eyeVec, envNormal, fresnelExp, fresnelConstant);
	reflectionColour *= fresnelTerm;

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
		specular1Colour = osSpecularPointLights[0].colour.xyz * materialSpecular.xyz;
	else
		specular1Colour = osSpecularDirectionalLights[1].colour.xyz * materialSpecular.xyz;

	if (nSpecularPointLights > 1)
		specular2Colour = osSpecularPointLights[1].colour.xyz * materialSpecular.xyz;
	else
		specular2Colour = osSpecularDirectionalLights[0].colour.xyz * materialSpecular.xyz;
	
	float4 attenuation;
	attenuation.x = saturate( dot( normalize(i.dLight1.xyz), normal ) ) * i.dLight1.w;
	attenuation.y = saturate( dot( normalize(i.dLight2.xyz), normal ) ) * i.dLight2.w;
	attenuation.z = pow( saturate( dot( normalize(i.sLight1.xyz), normal ) ), 32 ) * i.sLight1.w;
	attenuation.w = pow( saturate( dot( normalize(i.sLight2.xyz), normal ) ), 32 ) * i.sLight2.w;

	diffuseColour +=  attenuation.x * diffuse1Colour;
	diffuseColour +=  attenuation.y * diffuse2Colour;

	float3 specularColour = glowMap * glowFactor;
	
	specularColour += attenuation.z * specular1Colour;
	specularColour += attenuation.w * specular2Colour;

	float skyMap = SAMPLE_SKY_MAP_ENV(i);

	float4 colour;
#ifdef MOD2X
	colour.xyz = (skyMap * diffuseColour * diffuseMap.xyz * (1 + diffuseLightExtraModulation) ) + (specularColour*diffuseMap.aaa);
#else
	colour.xyz = (skyMap * diffuseColour * diffuseMap.xyz) + (specularColour*diffuseMap.aaa);
#endif
	colour.xyz += skyMap * diffuseColour * reflectionColour * reflectionAmount * diffuseMap.aaa;
	
	colour.xyz = lerp( fogColour.xyz, colour.xyz, saturate(i.fog) );

	colour.w = 1;

	return colour;
}

VertexShader vertexShaders_vs3[180] =
{
	compile vs_3_0 characterLighting_vs3(0,0,0,0),
	compile vs_3_0 characterLighting_vs3(1,0,0,0),
	compile vs_3_0 characterLighting_vs3(2,0,0,0),
	compile vs_3_0 characterLighting_vs3(0,1,0,0),
	compile vs_3_0 characterLighting_vs3(1,1,0,0),
	compile vs_3_0 characterLighting_vs3(2,1,0,0),
	compile vs_3_0 characterLighting_vs3(0,2,0,0),
	compile vs_3_0 characterLighting_vs3(1,2,0,0),
	compile vs_3_0 characterLighting_vs3(2,2,0,0),
	compile vs_3_0 characterLighting_vs3(0,3,0,0),
	compile vs_3_0 characterLighting_vs3(1,3,0,0),
	compile vs_3_0 characterLighting_vs3(2,3,0,0),
	compile vs_3_0 characterLighting_vs3(0,4,0,0),
	compile vs_3_0 characterLighting_vs3(1,4,0,0),
	compile vs_3_0 characterLighting_vs3(2,4,0,0),
	compile vs_3_0 characterLighting_vs3(0,0,1,0),
	compile vs_3_0 characterLighting_vs3(1,0,1,0),
	compile vs_3_0 characterLighting_vs3(2,0,1,0),
	compile vs_3_0 characterLighting_vs3(0,1,1,0),
	compile vs_3_0 characterLighting_vs3(1,1,1,0),
	compile vs_3_0 characterLighting_vs3(2,1,1,0),
	compile vs_3_0 characterLighting_vs3(0,2,1,0),
	compile vs_3_0 characterLighting_vs3(1,2,1,0),
	compile vs_3_0 characterLighting_vs3(2,2,1,0),
	compile vs_3_0 characterLighting_vs3(0,3,1,0),
	compile vs_3_0 characterLighting_vs3(1,3,1,0),
	compile vs_3_0 characterLighting_vs3(2,3,1,0),
	compile vs_3_0 characterLighting_vs3(0,4,1,0),
	compile vs_3_0 characterLighting_vs3(1,4,1,0),
	compile vs_3_0 characterLighting_vs3(2,4,1,0),
	compile vs_3_0 characterLighting_vs3(0,0,2,0),
	compile vs_3_0 characterLighting_vs3(1,0,2,0),
	compile vs_3_0 characterLighting_vs3(2,0,2,0),
	compile vs_3_0 characterLighting_vs3(0,1,2,0),
	compile vs_3_0 characterLighting_vs3(1,1,2,0),
	compile vs_3_0 characterLighting_vs3(2,1,2,0),
	compile vs_3_0 characterLighting_vs3(0,2,2,0),
	compile vs_3_0 characterLighting_vs3(1,2,2,0),
	compile vs_3_0 characterLighting_vs3(2,2,2,0),
	compile vs_3_0 characterLighting_vs3(0,3,2,0),
	compile vs_3_0 characterLighting_vs3(1,3,2,0),
	compile vs_3_0 characterLighting_vs3(2,3,2,0),
	compile vs_3_0 characterLighting_vs3(0,4,2,0),
	compile vs_3_0 characterLighting_vs3(1,4,2,0),
	compile vs_3_0 characterLighting_vs3(2,4,2,0),
	compile vs_3_0 characterLighting_vs3(0,0,0,1),
	compile vs_3_0 characterLighting_vs3(1,0,0,1),
	compile vs_3_0 characterLighting_vs3(2,0,0,1),
	compile vs_3_0 characterLighting_vs3(0,1,0,1),
	compile vs_3_0 characterLighting_vs3(1,1,0,1),
	compile vs_3_0 characterLighting_vs3(2,1,0,1),
	compile vs_3_0 characterLighting_vs3(0,2,0,1),
	compile vs_3_0 characterLighting_vs3(1,2,0,1),
	compile vs_3_0 characterLighting_vs3(2,2,0,1),
	compile vs_3_0 characterLighting_vs3(0,3,0,1),
	compile vs_3_0 characterLighting_vs3(1,3,0,1),
	compile vs_3_0 characterLighting_vs3(2,3,0,1),
	compile vs_3_0 characterLighting_vs3(0,4,0,1),
	compile vs_3_0 characterLighting_vs3(1,4,0,1),
	compile vs_3_0 characterLighting_vs3(2,4,0,1),
	compile vs_3_0 characterLighting_vs3(0,0,1,1),
	compile vs_3_0 characterLighting_vs3(1,0,1,1),
	compile vs_3_0 characterLighting_vs3(2,0,1,1),
	compile vs_3_0 characterLighting_vs3(0,1,1,1),
	compile vs_3_0 characterLighting_vs3(1,1,1,1),
	compile vs_3_0 characterLighting_vs3(2,1,1,1),
	compile vs_3_0 characterLighting_vs3(0,2,1,1),
	compile vs_3_0 characterLighting_vs3(1,2,1,1),
	compile vs_3_0 characterLighting_vs3(2,2,1,1),
	compile vs_3_0 characterLighting_vs3(0,3,1,1),
	compile vs_3_0 characterLighting_vs3(1,3,1,1),
	compile vs_3_0 characterLighting_vs3(2,3,1,1),
	compile vs_3_0 characterLighting_vs3(0,4,1,1),
	compile vs_3_0 characterLighting_vs3(1,4,1,1),
	compile vs_3_0 characterLighting_vs3(2,4,1,1),
	compile vs_3_0 characterLighting_vs3(0,0,0,2),
	compile vs_3_0 characterLighting_vs3(1,0,0,2),
	compile vs_3_0 characterLighting_vs3(2,0,0,2),
	compile vs_3_0 characterLighting_vs3(0,1,0,2),
	compile vs_3_0 characterLighting_vs3(1,1,0,2),
	compile vs_3_0 characterLighting_vs3(2,1,0,2),
	compile vs_3_0 characterLighting_vs3(0,2,0,2),
	compile vs_3_0 characterLighting_vs3(1,2,0,2),
	compile vs_3_0 characterLighting_vs3(2,2,0,2),
	compile vs_3_0 characterLighting_vs3(0,3,0,2),
	compile vs_3_0 characterLighting_vs3(1,3,0,2),
	compile vs_3_0 characterLighting_vs3(2,3,0,2),
	compile vs_3_0 characterLighting_vs3(0,4,0,2),
	compile vs_3_0 characterLighting_vs3(1,4,0,2),
	compile vs_3_0 characterLighting_vs3(2,4,0,2),
	compile vs_3_0 characterStaticLighting_vs3(0,0,0,0),
	compile vs_3_0 characterStaticLighting_vs3(1,0,0,0),
	compile vs_3_0 characterStaticLighting_vs3(2,0,0,0),
	compile vs_3_0 characterStaticLighting_vs3(0,1,0,0),
	compile vs_3_0 characterStaticLighting_vs3(1,1,0,0),
	compile vs_3_0 characterStaticLighting_vs3(2,1,0,0),
	compile vs_3_0 characterStaticLighting_vs3(0,2,0,0),
	compile vs_3_0 characterStaticLighting_vs3(1,2,0,0),
	compile vs_3_0 characterStaticLighting_vs3(2,2,0,0),
	compile vs_3_0 characterStaticLighting_vs3(0,3,0,0),
	compile vs_3_0 characterStaticLighting_vs3(1,3,0,0),
	compile vs_3_0 characterStaticLighting_vs3(2,3,0,0),
	compile vs_3_0 characterStaticLighting_vs3(0,4,0,0),
	compile vs_3_0 characterStaticLighting_vs3(1,4,0,0),
	compile vs_3_0 characterStaticLighting_vs3(2,4,0,0),
	compile vs_3_0 characterStaticLighting_vs3(0,0,1,0),
	compile vs_3_0 characterStaticLighting_vs3(1,0,1,0),
	compile vs_3_0 characterStaticLighting_vs3(2,0,1,0),
	compile vs_3_0 characterStaticLighting_vs3(0,1,1,0),
	compile vs_3_0 characterStaticLighting_vs3(1,1,1,0),
	compile vs_3_0 characterStaticLighting_vs3(2,1,1,0),
	compile vs_3_0 characterStaticLighting_vs3(0,2,1,0),
	compile vs_3_0 characterStaticLighting_vs3(1,2,1,0),
	compile vs_3_0 characterStaticLighting_vs3(2,2,1,0),
	compile vs_3_0 characterStaticLighting_vs3(0,3,1,0),
	compile vs_3_0 characterStaticLighting_vs3(1,3,1,0),
	compile vs_3_0 characterStaticLighting_vs3(2,3,1,0),
	compile vs_3_0 characterStaticLighting_vs3(0,4,1,0),
	compile vs_3_0 characterStaticLighting_vs3(1,4,1,0),
	compile vs_3_0 characterStaticLighting_vs3(2,4,1,0),
	compile vs_3_0 characterStaticLighting_vs3(0,0,2,0),
	compile vs_3_0 characterStaticLighting_vs3(1,0,2,0),
	compile vs_3_0 characterStaticLighting_vs3(2,0,2,0),
	compile vs_3_0 characterStaticLighting_vs3(0,1,2,0),
	compile vs_3_0 characterStaticLighting_vs3(1,1,2,0),
	compile vs_3_0 characterStaticLighting_vs3(2,1,2,0),
	compile vs_3_0 characterStaticLighting_vs3(0,2,2,0),
	compile vs_3_0 characterStaticLighting_vs3(1,2,2,0),
	compile vs_3_0 characterStaticLighting_vs3(2,2,2,0),
	compile vs_3_0 characterStaticLighting_vs3(0,3,2,0),
	compile vs_3_0 characterStaticLighting_vs3(1,3,2,0),
	compile vs_3_0 characterStaticLighting_vs3(2,3,2,0),
	compile vs_3_0 characterStaticLighting_vs3(0,4,2,0),
	compile vs_3_0 characterStaticLighting_vs3(1,4,2,0),
	compile vs_3_0 characterStaticLighting_vs3(2,4,2,0),
	compile vs_3_0 characterStaticLighting_vs3(0,0,0,1),
	compile vs_3_0 characterStaticLighting_vs3(1,0,0,1),
	compile vs_3_0 characterStaticLighting_vs3(2,0,0,1),
	compile vs_3_0 characterStaticLighting_vs3(0,1,0,1),
	compile vs_3_0 characterStaticLighting_vs3(1,1,0,1),
	compile vs_3_0 characterStaticLighting_vs3(2,1,0,1),
	compile vs_3_0 characterStaticLighting_vs3(0,2,0,1),
	compile vs_3_0 characterStaticLighting_vs3(1,2,0,1),
	compile vs_3_0 characterStaticLighting_vs3(2,2,0,1),
	compile vs_3_0 characterStaticLighting_vs3(0,3,0,1),
	compile vs_3_0 characterStaticLighting_vs3(1,3,0,1),
	compile vs_3_0 characterStaticLighting_vs3(2,3,0,1),
	compile vs_3_0 characterStaticLighting_vs3(0,4,0,1),
	compile vs_3_0 characterStaticLighting_vs3(1,4,0,1),
	compile vs_3_0 characterStaticLighting_vs3(2,4,0,1),
	compile vs_3_0 characterStaticLighting_vs3(0,0,1,1),
	compile vs_3_0 characterStaticLighting_vs3(1,0,1,1),
	compile vs_3_0 characterStaticLighting_vs3(2,0,1,1),
	compile vs_3_0 characterStaticLighting_vs3(0,1,1,1),
	compile vs_3_0 characterStaticLighting_vs3(1,1,1,1),
	compile vs_3_0 characterStaticLighting_vs3(2,1,1,1),
	compile vs_3_0 characterStaticLighting_vs3(0,2,1,1),
	compile vs_3_0 characterStaticLighting_vs3(1,2,1,1),
	compile vs_3_0 characterStaticLighting_vs3(2,2,1,1),
	compile vs_3_0 characterStaticLighting_vs3(0,3,1,1),
	compile vs_3_0 characterStaticLighting_vs3(1,3,1,1),
	compile vs_3_0 characterStaticLighting_vs3(2,3,1,1),
	compile vs_3_0 characterStaticLighting_vs3(0,4,1,1),
	compile vs_3_0 characterStaticLighting_vs3(1,4,1,1),
	compile vs_3_0 characterStaticLighting_vs3(2,4,1,1),
	compile vs_3_0 characterStaticLighting_vs3(0,0,0,2),
	compile vs_3_0 characterStaticLighting_vs3(1,0,0,2),
	compile vs_3_0 characterStaticLighting_vs3(2,0,0,2),
	compile vs_3_0 characterStaticLighting_vs3(0,1,0,2),
	compile vs_3_0 characterStaticLighting_vs3(1,1,0,2),
	compile vs_3_0 characterStaticLighting_vs3(2,1,0,2),
	compile vs_3_0 characterStaticLighting_vs3(0,2,0,2),
	compile vs_3_0 characterStaticLighting_vs3(1,2,0,2),
	compile vs_3_0 characterStaticLighting_vs3(2,2,0,2),
	compile vs_3_0 characterStaticLighting_vs3(0,3,0,2),
	compile vs_3_0 characterStaticLighting_vs3(1,3,0,2),
	compile vs_3_0 characterStaticLighting_vs3(2,3,0,2),
	compile vs_3_0 characterStaticLighting_vs3(0,4,0,2),
	compile vs_3_0 characterStaticLighting_vs3(1,4,0,2),
	compile vs_3_0 characterStaticLighting_vs3(2,4,0,2)	
};


int vsIndex( int nDir, int nPoint, int nSpecDir, int nSpecPoint )
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
	
	return min(nDir, 2) + (min(nPoint, 4) * 3) + (min(nSpecIndex, 6) * 15) + int(staticLighting) * 90;
}

//--------------------------------------------------------------//
// Technique Section for for pixel/vertexshader 3
//--------------------------------------------------------------//
technique character_lighting_shader3
<
	bool bumpMapped = true;
	string label = "SHADER_MODEL_3";
>
{
	pass Pass_0
	{
		ALPHATESTENABLE = FALSE;
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
		CULLMODE = CCW;
		
		VertexShader = (vertexShaders_vs3[vsIndex(nDirectionalLights, nPointLights, nSpecularDirectionalLights, nSpecularPointLights)]);
		PixelShader = compile ps_3_0 characterLighting_ps3();
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

OutputSpecularCharacterLighting specularCharacterLighting_vs1( VertexXYZNUVTB i,
	uniform int nSpecularDirectionals, 
	uniform int nSpecularPoints )
{
	OutputSpecularCharacterLighting o = (OutputSpecularCharacterLighting)0;

	o.pos = mul(i.pos, worldViewProj);
	
	float2 fogging = float2((-1.0 / (fogEnd - fogStart)), (fogEnd / (fogEnd - fogStart)));
	o.fog = o.pos.w * fogging.x + fogging.y;

	float3x3 tsMatrix = {i.tangent, i.binormal, i.normal };

	o.ntc = i.tc;

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

float4 specularCharacterLighting_ps1( OutputSpecularCharacterLighting i, 
							uniform bool point ) : COLOR0
{
	float3 normal = (tex2D( normalSampler, i.ntc ) * 2 ) - 1;
	float3 specularDir = (texCUBE( normalisationSampler, i.sLight ) * 2) - 1;
	float3 glow = (tex2D( glowSampler, i.tc )) * glowFactor;
	float4 specular;
	specular.w = dot( normal, specularDir ), 32;
	specular.w = pow(specular.w, 32);
	float3 specularColour;
	if (point)
		specularColour = osSpecularPointLights[0].colour * materialSpecular;
	else
		specularColour = osSpecularDirectionalLights[0].colour * materialSpecular;
	float3 colour = specularColour * i.attenuation.xyz;
	
	return float4( specular.w * colour + glow, 1 );
}

struct OutputReflection
{
	float4 pos:     	POSITION;
	float2 tc:			TEXCOORD0;
	float2 tc2:			TEXCOORD1;
	float4 fresnel:		COLOR0;
	float fog: FOG;
};

OutputReflection reflection_vs1( VertexXYZNUVTB i )
{
	OutputReflection o = (OutputReflection)0;

	o.pos = mul(i.pos, worldViewProj);
	
	o.tc = i.tc;

	// calculate eye reflected around normal
	float3 eye = osCameraPos - i.pos;
	float d = dot( eye, i.normal );
	float3 eNormal = i.normal * d;
	float4 rEye = float4((eNormal - eye) + eNormal, 1);
	rEye.xyz = normalize( rEye.xyz );

	float4 ut = float4(mul( world, float3(1,0,0) ).xyz, 1) * 0.5;
	float4 vt = float4(mul( world, float3(0,-1,0) ).xyz, 1) * 0.5;

	// output to extra texture coordinate
	o.tc2.x = dot( ut, rEye );
	o.tc2.y = dot( vt, rEye );
	
	o.fresnel.x = fresnel(-eye, i.normal, fresnelExp, fresnelConstant) * reflectionAmount;
	
	float2 fogging = float2((-1.0 / (fogEnd - fogStart)), (fogEnd / (fogEnd - fogStart)));
	o.fog = o.pos.w * fogging.x + fogging.y;

	return o;
}

float4 reflection_ps1( OutputReflection i ) : COLOR0
{
	float4 diffuseColour = tex2D( diffuseSampler, i.tc );
	float3 reflectionColour = tex2D( reflectionSampler, i.tc2 );	
	return float4( i.fresnel.xxx * reflectionColour * diffuseColour.aaa, 1 );
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

PixelShader specularPixelShaders_ps1[2] =
{
	compile ps_1_1 specularCharacterLighting_ps1(false),
	compile ps_1_1 specularCharacterLighting_ps1(true)
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
technique character_lighting_shader1
<
	bool bumpMapped = true;
	string label = "SHADER_MODEL_1";
>
{
	pass Pass_0
	{
		ALPHATESTENABLE = FALSE;
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
		CULLMODE = CCW;
	
		VertexShader = (diffuseVertexShaders_vs1[diffuseVSIndex(nDirectionalLights, nPointLights)]);
		PixelShader = (diffusePixelShaders_ps1[min(nPointLights,2)]);
	}
   
	pass Pass_1
	{
		ALPHATESTENABLE = FALSE;
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
		CULLMODE = CCW;
		
		VertexShader = (specularVertexShaders_vs1[specularVSIndex(nSpecularDirectionalLights, nSpecularPointLights)]);
		PixelShader = (specularPixelShaders_ps1[int(nSpecularPointLights>0)]);
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

#ifdef MOD2X
	o.diffuse.xyz *= 0.5 * (1 + diffuseLightExtraModulation);
#endif
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

#define alphaTestEnable 0
#define alphaReference 0

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
		CULLMODE = CCW;
		
		VertexShader = (fallbackShaders[int(staticLighting)]);
		PixelShader = NULL;
	}
}
#endif