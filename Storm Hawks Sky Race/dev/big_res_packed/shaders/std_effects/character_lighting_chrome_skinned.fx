#include "stdinclude.fxh"

BW_SKY_LIGHT_MAP_WORLD_SPACE

#ifndef IN_GAME
float4x4 worldViewProj : WorldViewProjection;
float4x4 world : World;
#endif

#include "character_lighting_chrome.fxh"

#ifdef IN_GAME

float4x4 viewProj : ViewProjection;
float4 world[51] : WorldPalette;
float4 cameraPos : CameraPos;

DIFFUSE_LIGHTING_WORLD_SPACE
SPECULAR_LIGHTING_WORLD_SPACE

float3 transformPos( float4 pos, int index )
{
	float3 ret = {	dot( world[index], pos ),
					dot( world[index + 1], pos ),
					dot( world[index + 2], pos ) };
	return ret;
}

float4 transformPos( float4 pos, float weights[3], int indices[3] )
{
	float4 ret = float4( 0, 0, 0, 1 );
	ret.xyz = transformPos( pos, indices[0] ) * weights[0];
	ret.xyz += transformPos( pos, indices[1] ) * weights[1];
	ret.xyz += transformPos( pos, indices[2] ) * weights[2];
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

OutputCharacterLightingEnv vs_main( VertexXYZNUVIIIWWTB input,
	uniform int nDirectionals, 
	uniform int nPoints, 
	uniform int nSpecularDirectionals, 
	uniform int nSpecularPoints )
{
	OutputCharacterLightingEnv output = (OutputCharacterLightingEnv)0;
	
	int indices[3] = { input.indices.x * 256.5,
							input.indices.y * 256.5,
							input.indices.z * 256.5 };
							
	float weights[3] = { input.weights.x, input.weights.y, 1 - input.weights.y - input.weights.x };
	
	float4 worldPos = transformPos( input.pos, weights, indices );
	
	BW_SKY_MAP_COORDS_WORLD_SPACE_ENV( output, worldPos )

	output.pos = mul(worldPos, viewProj);

	float2 fogging = float2((-1.0 / (fogEnd - fogStart)), (fogEnd / (fogEnd - fogStart)));
	output.fog = output.pos.w * fogging.x + fogging.y;
	
	float3 worldNormal = transformNormaliseVector( input.normal, indices[0] );
	float3 worldTangent = transformNormaliseVector( input.tangent, indices[0] );
	float3 worldBinormal = transformNormaliseVector( input.binormal, indices[0] );
	
	float3x3 tsMatrix = { worldTangent, worldBinormal, worldNormal };
	
	int nPointBump = min( nPoints, 2 );
	int nDirBump = min(2 - nPointBump, min(2, nDirectionals) );
	int nPoint = min( max(nPoints - nPointBump, 0), 2);
	int nDir = min(max(nDirectionals - nDirBump, 0), 2 );

	output.tc.xy = input.tc;
	output.diffuse = ambientColour;

	if (nDir > 0)
		output.diffuse.xyz += directionalLight( worldNormal, directionalLights[nDirBump] );
	if (nDir > 1)
		output.diffuse.xyz += directionalLight( worldNormal, directionalLights[nDirBump + 1] );

	if (nPoint > 0)
		output.diffuse.xyz += pointLight( worldPos, worldNormal, pointLights[2] );
	if (nPoint > 1)
		output.diffuse.xyz += pointLight( worldPos, worldNormal, pointLights[3] );

	int ns = nSpotLights < 2 ? nSpotLights : 2;
	for (int l = 0; l < ns; l++)
	{
		output.diffuse.xyz += spotLight( worldPos, worldNormal, spotLights[l] );
	}	

	float4 attenuation;
	if (nDirBump > 1)
		attenuation.x = directionalBumpLight( tsMatrix, directionalLights[1], output.dLight1.xyz );
	else if (nPointBump > 0)
		attenuation.x = pointBumpLight( worldPos, tsMatrix, pointLights[0], output.dLight1.xyz );
	else
		attenuation.x = 0;

	if (nDirBump > 0)
		attenuation.y = directionalBumpLight( tsMatrix, directionalLights[0], output.dLight2.xyz );
	else if (nPointBump > 1)
		attenuation.y = pointBumpLight( worldPos, tsMatrix, pointLights[1], output.dLight2.xyz );
	else
		attenuation.y = 0;
	
	float3 eye = normalize(cameraPos.xyz - worldPos);

	int nPointSpecBump = min( nSpecularPoints, 2 );
	int nDirSpecBump = min(2 - nPointSpecBump, min(2, nSpecularDirectionals) );

	if (nDirSpecBump > 1)
		attenuation.z = directionalSpecBumpLight( eye, tsMatrix, specularDirectionalLights[1], output.sLight1.xyz );
	else if (nPointSpecBump > 0)
		attenuation.z = pointSpecBumpLight( worldPos, eye, tsMatrix, specularPointLights[0], output.sLight1.xyz );
	else
		attenuation.z = 0;

	if (nDirSpecBump > 0)
		attenuation.w = directionalSpecBumpLight( eye, tsMatrix, specularDirectionalLights[0], output.sLight2.xyz );
	else if (nPointSpecBump > 1)
		attenuation.w = pointSpecBumpLight( worldPos, eye, tsMatrix, specularPointLights[1], output.sLight2.xyz );
	else
		attenuation.w = 0;
		
	output.dLight1.w = attenuation.x;
	output.dLight2.w = attenuation.y;
	output.sLight1.w = attenuation.z;
	output.sLight2.w = attenuation.w;
	
	// Compute the 3x3 transform from tangent space to cube space:
	output.tangentToCubeSpace0.xyz = transpose(tsMatrix)[0].xyz;
	output.tangentToCubeSpace1.xyz = transpose(tsMatrix)[1].xyz;
	output.tangentToCubeSpace2.xyz = transpose(tsMatrix)[2].xyz;

    output.tangentToCubeSpace0.w = eye.x;
    output.tangentToCubeSpace1.w = eye.y;
    output.tangentToCubeSpace2.w = eye.z;

	return output;
}

float4 ps_main( OutputCharacterLightingEnv input,
	uniform int nDirectionals, 
	uniform int nPoints, 
	uniform int nSpecularDirectionals, 
	uniform int nSpecularPoints ) : COLOR0
{
	//  Output constant color:
	float4 diffuseMap = tex2D( diffuseSampler, input.tc );
	float3 normal = (tex2D( normalSampler, input.tc ).xyz * 2 ) - 1;
	float3 glowMap = tex2D( glowSampler, input.tc );
	float3 diffuseColour = input.diffuse;

	// Calculate a reflection vector and fresnel term
    float3 envNormal;
	envNormal.x = dot(input.tangentToCubeSpace0.xyz, normal );
	envNormal.y = dot(input.tangentToCubeSpace1.xyz, normal );
	envNormal.z = dot(input.tangentToCubeSpace2.xyz, normal );
	float3 eyeVec = normalize( float3(input.tangentToCubeSpace0.w, input.tangentToCubeSpace1.w, input.tangentToCubeSpace2.w) );	
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
		specular1Colour = specularPointLights[0].colour.xyz * materialSpecular;
	else if (nSpecularDirectionals > 1)
		specular1Colour = specularDirectionalLights[1].colour.xyz * materialSpecular;
	else
		s1 = false;

	if (nSpecularPoints > 1)
		specular2Colour = specularPointLights[1].colour.xyz * materialSpecular;
	else if (nSpecularDirectionals > 0)
		specular2Colour = specularDirectionalLights[0].colour.xyz * materialSpecular;
	else
		s2 = false;
		
	float4 attenuation = (0,0,0,0);
	if (d1)
		attenuation.x = saturate( dot( normalize(input.dLight1.xyz), normal ) ) * input.dLight1.w;
	if (d2)
		attenuation.y = saturate( dot( normalize(input.dLight2.xyz), normal ) )* input.dLight2.w;
	if (s1)
		attenuation.z = pow( saturate( dot( normalize(input.sLight1.xyz), normal ) ), 32 )* input.sLight1.w;
	if (s2)
		attenuation.w = pow( saturate( dot( normalize(input.sLight2.xyz), normal ) ), 32 )* input.sLight2.w;
	
	if (d1)
		diffuseColour +=  attenuation.x * diffuse1Colour;
	if (d2)
		diffuseColour +=  attenuation.y * diffuse2Colour;

	float3 specularColour = glowMap * glowFactor;

	if (s1)
		specularColour += attenuation.z * specular1Colour;
	if (s2)
		specularColour += attenuation.w * specular2Colour;

	float skyMap = SAMPLE_SKY_MAP_ENV(input)
	reflectionColour.xyz = reflectionColour.xyz * skyMap * diffuseColour.xyz;
	diffuseColour *= diffuseMap.xyz;
	
	float4 colour;	
#ifdef MOD2X
	colour.xyz = (skyMap * diffuseColour * (1 + diffuseLightExtraModulation)) + (specularColour*diffuseMap.aaa);
#else
	colour.xyz = skyMap * diffuseColour + (specularColour*diffuseMap.aaa);
#endif
	colour.xyz += (reflectionColour * reflectionAmount * diffuseMap.aaa);
	colour.xyz = lerp( fogColour.xyz, colour.xyz, saturate(input.fog) );
	colour.w = 1;

	return colour;
}

VertexShader vertexShaders[90] =
{
	compile vs_3_0 vs_main(0,0,0,0),
	compile vs_3_0 vs_main(1,0,0,0),
	compile vs_3_0 vs_main(2,0,0,0),
	compile vs_3_0 vs_main(0,1,0,0),
	compile vs_3_0 vs_main(1,1,0,0),
	compile vs_3_0 vs_main(2,1,0,0),
	compile vs_3_0 vs_main(0,2,0,0),
	compile vs_3_0 vs_main(1,2,0,0),
	compile vs_3_0 vs_main(2,2,0,0),
	compile vs_3_0 vs_main(0,3,0,0),
	compile vs_3_0 vs_main(1,3,0,0),
	compile vs_3_0 vs_main(2,3,0,0),
	compile vs_3_0 vs_main(0,4,0,0),
	compile vs_3_0 vs_main(1,4,0,0),
	compile vs_3_0 vs_main(2,4,0,0),
	compile vs_3_0 vs_main(0,0,1,0),
	compile vs_3_0 vs_main(1,0,1,0),
	compile vs_3_0 vs_main(2,0,1,0),
	compile vs_3_0 vs_main(0,1,1,0),
	compile vs_3_0 vs_main(1,1,1,0),
	compile vs_3_0 vs_main(2,1,1,0),
	compile vs_3_0 vs_main(0,2,1,0),
	compile vs_3_0 vs_main(1,2,1,0),
	compile vs_3_0 vs_main(2,2,1,0),
	compile vs_3_0 vs_main(0,3,1,0),
	compile vs_3_0 vs_main(1,3,1,0),
	compile vs_3_0 vs_main(2,3,1,0),
	compile vs_3_0 vs_main(0,4,1,0),
	compile vs_3_0 vs_main(1,4,1,0),
	compile vs_3_0 vs_main(2,4,1,0),
	compile vs_3_0 vs_main(0,0,2,0),
	compile vs_3_0 vs_main(1,0,2,0),
	compile vs_3_0 vs_main(2,0,2,0),
	compile vs_3_0 vs_main(0,1,2,0),
	compile vs_3_0 vs_main(1,1,2,0),
	compile vs_3_0 vs_main(2,1,2,0),
	compile vs_3_0 vs_main(0,2,2,0),
	compile vs_3_0 vs_main(1,2,2,0),
	compile vs_3_0 vs_main(2,2,2,0),
	compile vs_3_0 vs_main(0,3,2,0),
	compile vs_3_0 vs_main(1,3,2,0),
	compile vs_3_0 vs_main(2,3,2,0),
	compile vs_3_0 vs_main(0,4,2,0),
	compile vs_3_0 vs_main(1,4,2,0),
	compile vs_3_0 vs_main(2,4,2,0),
	compile vs_3_0 vs_main(0,0,0,1),
	compile vs_3_0 vs_main(1,0,0,1),
	compile vs_3_0 vs_main(2,0,0,1),
	compile vs_3_0 vs_main(0,1,0,1),
	compile vs_3_0 vs_main(1,1,0,1),
	compile vs_3_0 vs_main(2,1,0,1),
	compile vs_3_0 vs_main(0,2,0,1),
	compile vs_3_0 vs_main(1,2,0,1),
	compile vs_3_0 vs_main(2,2,0,1),
	compile vs_3_0 vs_main(0,3,0,1),
	compile vs_3_0 vs_main(1,3,0,1),
	compile vs_3_0 vs_main(2,3,0,1),
	compile vs_3_0 vs_main(0,4,0,1),
	compile vs_3_0 vs_main(1,4,0,1),
	compile vs_3_0 vs_main(2,4,0,1),
	compile vs_3_0 vs_main(0,0,1,1),
	compile vs_3_0 vs_main(1,0,1,1),
	compile vs_3_0 vs_main(2,0,1,1),
	compile vs_3_0 vs_main(0,1,1,1),
	compile vs_3_0 vs_main(1,1,1,1),
	compile vs_3_0 vs_main(2,1,1,1),
	compile vs_3_0 vs_main(0,2,1,1),
	compile vs_3_0 vs_main(1,2,1,1),
	compile vs_3_0 vs_main(2,2,1,1),
	compile vs_3_0 vs_main(0,3,1,1),
	compile vs_3_0 vs_main(1,3,1,1),
	compile vs_3_0 vs_main(2,3,1,1),
	compile vs_3_0 vs_main(0,4,1,1),
	compile vs_3_0 vs_main(1,4,1,1),
	compile vs_3_0 vs_main(2,4,1,1),
	compile vs_3_0 vs_main(0,0,0,2),
	compile vs_3_0 vs_main(1,0,0,2),
	compile vs_3_0 vs_main(2,0,0,2),
	compile vs_3_0 vs_main(0,1,0,2),
	compile vs_3_0 vs_main(1,1,0,2),
	compile vs_3_0 vs_main(2,1,0,2),
	compile vs_3_0 vs_main(0,2,0,2),
	compile vs_3_0 vs_main(1,2,0,2),
	compile vs_3_0 vs_main(2,2,0,2),
	compile vs_3_0 vs_main(0,3,0,2),
	compile vs_3_0 vs_main(1,3,0,2),
	compile vs_3_0 vs_main(2,3,0,2),
	compile vs_3_0 vs_main(0,4,0,2),
	compile vs_3_0 vs_main(1,4,0,2),
	compile vs_3_0 vs_main(2,4,0,2)
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
	
	return min(nDir, 2) + (min(nPoint, 4) * 3) + (min(nSpecIndex, 6) * 15);
}

PixelShader pixelShaders[36] =
{
	compile ps_3_0 ps_main(0,0,0,0),
	compile ps_3_0 ps_main(1,0,0,0),
	compile ps_3_0 ps_main(2,0,0,0),
	compile ps_3_0 ps_main(0,1,0,0),
	compile ps_3_0 ps_main(0,2,0,0),
	compile ps_3_0 ps_main(1,1,0,0),
	compile ps_3_0 ps_main(0,0,1,0),
	compile ps_3_0 ps_main(1,0,1,0),
	compile ps_3_0 ps_main(2,0,1,0),
	compile ps_3_0 ps_main(0,1,1,0),
	compile ps_3_0 ps_main(0,2,1,0),
	compile ps_3_0 ps_main(1,1,1,0),
	compile ps_3_0 ps_main(0,0,2,0),
	compile ps_3_0 ps_main(1,0,2,0),
	compile ps_3_0 ps_main(2,0,2,0),
	compile ps_3_0 ps_main(0,1,2,0),
	compile ps_3_0 ps_main(0,2,2,0),
	compile ps_3_0 ps_main(1,1,2,0),
	compile ps_3_0 ps_main(0,0,0,1),
	compile ps_3_0 ps_main(1,0,0,1),
	compile ps_3_0 ps_main(2,0,0,1),
	compile ps_3_0 ps_main(0,1,0,1),
	compile ps_3_0 ps_main(0,2,0,1),
	compile ps_3_0 ps_main(1,1,0,1),
	compile ps_3_0 ps_main(0,0,0,2),
	compile ps_3_0 ps_main(1,0,0,2),
	compile ps_3_0 ps_main(2,0,0,2),
	compile ps_3_0 ps_main(0,1,0,2),
	compile ps_3_0 ps_main(0,2,0,2),
	compile ps_3_0 ps_main(1,1,0,2),
	compile ps_3_0 ps_main(0,0,1,1),
	compile ps_3_0 ps_main(1,0,1,1),
	compile ps_3_0 ps_main(2,0,1,1),
	compile ps_3_0 ps_main(0,1,1,1),
	compile ps_3_0 ps_main(0,2,1,1),
	compile ps_3_0 ps_main(1,1,1,1)
};

int psIndex( int nDir, int nPoint, int nSpecDir, int nSpecPoint )
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
	return index + (specIndex * 6);
}

//--------------------------------------------------------------//
// Technique Section for for pixel/vertexshader 3
//--------------------------------------------------------------//
technique character_lighting_shader3
<
	bool skinned = true;
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
		
		VertexShader = (vertexShaders[vsIndex(nDirectionalLights, nPointLights, nSpecularDirectionalLights, nSpecularPointLights)]);
		PixelShader = (pixelShaders[psIndex(nDirectionalLights, nPointLights, nSpecularDirectionalLights, nSpecularPointLights)]);
	}

}

OutputDiffuseCharacterLighting diffuseCharacterLighting_vs1( VertexXYZNUVIIIWWTB i,
	uniform int nDirectionals, 
	uniform int nPoints )
{
	OutputDiffuseCharacterLighting o = (OutputDiffuseCharacterLighting)0;

	int indices[3] = { i.indices.x * 256.5,
							i.indices.y * 256.5,
							i.indices.z * 256.5 };
							
	float weights[3] = { i.weights.x, i.weights.y, 1 - i.weights.y - i.weights.x };
	
	float4 worldPos = transformPos( i.pos, weights, indices );
	
	o.pos = mul(worldPos, viewProj);

	float2 fogging = float2((-1.0 / (fogEnd - fogStart)), (fogEnd / (fogEnd - fogStart)));
	o.fog = o.pos.w * fogging.x + fogging.y;
	
	float3 worldNormal = transformNormaliseVector( i.normal, indices[0] );
	float3 worldTangent = transformNormaliseVector( i.tangent, indices[0] );
	float3 worldBinormal = transformNormaliseVector( i.binormal, indices[0] );
	
	float3x3 tsMatrix = { worldTangent, worldBinormal, worldNormal };

	int nPointBump = min( nPoints, 2 );
	int nDirBump = min(2 - nPointBump, min(2, nDirectionals) );
	int nPoint = min( max(nPoints - nPointBump, 0), 2);
	int nDir = min(max(nDirectionals - nDirBump, 0), 2 );

	o.tc = i.tc;
	o.ntc = i.tc;
	o.diffuse = ambientColour;

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

OutputSpecularCharacterLighting specularCharacterLighting_vs1( VertexXYZNUVIIIWWTB i,
	uniform int nSpecularDirectionals, 
	uniform int nSpecularPoints )
{
	OutputSpecularCharacterLighting o = (OutputSpecularCharacterLighting)0;

	int indices[3] = { i.indices.x * 256.5,
							i.indices.y * 256.5,
							i.indices.z * 256.5 };
							
	float weights[3] = { i.weights.x, i.weights.y, 1 - i.weights.y - i.weights.x };
	
	float4 worldPos = transformPos( i.pos, weights, indices );
	
	o.pos = mul(worldPos, viewProj);

	float2 fogging = float2((-1.0 / (fogEnd - fogStart)), (fogEnd / (fogEnd - fogStart)));
	o.fog = o.pos.w * fogging.x + fogging.y;
	
	float3 worldNormal = transformNormaliseVector( i.normal, indices[0] );
	float3 worldTangent = transformNormaliseVector( i.tangent, indices[0] );
	float3 worldBinormal = transformNormaliseVector( i.binormal, indices[0] );
	
	float3x3 tsMatrix = { worldTangent, worldBinormal, worldNormal };

	o.ntc = i.tc;
	o.tc = i.tc;

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
		d2Colour = directionalLights[0].colour;
	else
		d2Colour = pointLights[1].colour;
	if (nBumpPointLights < 1)
		d1Colour = directionalLights[1].colour;
	else
		d1Colour = pointLights[0].colour;

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
	float3 normal = (tex2D( normalSampler, i.ntc ) * 2) - 1;
	float3 specularDir = (texCUBE( normalisationSampler, i.sLight ) * 2) - 1;
	float3 glow = (tex2D( glowSampler, i.tc )) * glowFactor;
	float4 specular;
	specular.w = dot( normal, specularDir );
	specular.w = pow(specular.w, 32);
	float3 specularColour;
	if (point)
		specularColour = specularPointLights[0].colour * materialSpecular;
	else
		specularColour = specularDirectionalLights[0].colour * materialSpecular;
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

OutputReflection reflection_vs1( VertexXYZNUVIIIWWTB i )
{
	OutputReflection o = (OutputReflection)0;

	int indices[3] = { i.indices.x * 256.5,
							i.indices.y * 256.5,
							i.indices.z * 256.5 };
							
	float weights[3] = { i.weights.x, i.weights.y, 1 - i.weights.y - i.weights.x };
	
	float4 worldPos = transformPos( i.pos, weights, indices );
	
	o.pos = mul(worldPos, viewProj);
	
	o.tc = i.tc;
	// calculate eye reflected around normal
	float3 worldNormal = transformNormaliseVector( i.normal, indices[0] );
	float3 eye = cameraPos - worldPos;
	float d = dot( eye, worldNormal );
	float3 eNormal = worldNormal * d;
	float4 rEye = float4((eNormal - eye) + eNormal, 1);
	rEye.xyz = normalize( rEye.xyz );
			
	float4 ut = float4( transformPos( float4(1,0,0,1), weights, indices ).xyz, 1) * 0.5;
	float4 vt = float4( transformPos( float4(0,-1,0,1), weights, indices ).xyz, 1) * 0.5;

	// output to extra texture coordinate
	o.tc2.x = dot( ut, rEye );
	o.tc2.y = dot( vt, rEye );
	
	o.fresnel.x = fresnel(-eye, worldNormal, fresnelExp, fresnelConstant) * reflectionAmount;

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
		
/*	pass Pass_2
	{
		ALPHATESTENABLE = FALSE;
		ZENABLE = TRUE;
		ZWRITEENABLE = FALSE;
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
		
		VertexShader = compile vs_1_1 reflection_vs1();
		PixelShader = compile ps_1_1 reflection_ps1();
	}*/	
	
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

OutputFallback diffuseOnlyFallback( VertexXYZNUVIIIWW i)
{
	OutputFallback o = (OutputFallback)0;

	int indices[3] = { i.indices.x * 256.5,
							i.indices.y * 256.5,
							i.indices.z * 256.5 };
							
	float weights[3] = { i.weights.x, i.weights.y, 1 - i.weights.y - i.weights.x };
	
	float4 worldPos = transformPos( i.pos, weights, indices );
	
	o.pos = mul(worldPos, viewProj);

	float2 fogging = float2((-1.0 / (fogEnd - fogStart)), (fogEnd / (fogEnd - fogStart)));
	o.fog = o.pos.w * fogging.x + fogging.y;
	
	float3 worldNormal = transformNormaliseVector( i.normal, indices[0] );

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

#define alphaTestEnable 0
#define alphaReference 0

//--------------------------------------------------------------//
// Technique section for software mode
//--------------------------------------------------------------//

technique software_fallback
<
	bool skinned = true;
	string label = "SHADER_MODEL_0";
>
{
	pass Pass_0
	{
		BW_BLENDING_SOLID
		BW_FOG
		BW_TEXTURESTAGE_DIFFUSEONLY(0, diffuseMap)
		ColorOp[0] = MODULATE;
		BW_TEXTURESTAGE_TERMINATE(1)
		CULLMODE = CCW;
		
		VertexShader = compile vs_2_0 diffuseOnlyFallback();
		PixelShader = NULL;
	}
}
#endif