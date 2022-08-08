// sub surface scattering!

#include "stdinclude.fxh"
#include "bw_four_channel_customise.fxh"

#ifdef IN_GAME

float4x4 viewProj : ViewProjection;
float4 world[51] : WorldPalette;
float4 cameraPos : CameraPos;
texture normalisationMap : NormalisationMap;
float fogStart : FogStart = 0.0;
float fogEnd : FogEnd = 1.0;
float4 fogColour : FogColour = {0,0,0,0};
float4x4 view : View;

int graphicsSetting
<
	string label = "SKIN_RENDERING";
>;
#endif

float rimWidth 
< 
	string UIName = "Rim Width";
	bool artistEditable = true;
	float UIMin = 0;
	float UIMax = 2;
	int UIDigits = 2; 
> = 0.5;

float rimStrength 
< 
	string UIName = "Rim Strength";
	bool artistEditable = true;
	float UIMin = 0;
	float UIMax = 2;
	int UIDigits = 2; 
> = 0.2;

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

texture subSurfaceMap
<
	bool artistEditable = true;
	string UIName = "Sub Surface Map";
	string UIDesc = "The sub-surface map for the material";
>;

float subSurfaceBlendPower
<
	string UIName = "Sub Surface Blend Power";
	string UIDesc = "The sub-surface blend power for the material";
	float UIMin = 0;
	float UIMax = 2;
	int UIDigits = 1;
	bool artistEditable = true;
> = 1;

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
#endif

BW_FOUR_CHANNEL_COLOURISE( skinColour, "Skin Colour", "Custom colour for skin. Selected by the red channel of the mask map.",
							hairColour, "Hair Colour", "Custom colour for hair. Selected by the green channel of the mask map.",
							decalColour1, "Decal Colour 1", "Custom colour for miscellaneous decal 1. Selected by the blue channel of the mask map. Unavailable on pixel shader 1.1 cards.",
							decalColour2, "Decal Colour 2", "Custom colour for miscellaneous decal 2. Selected by the alpha channel of the mask map." )
							
BW_ARTIST_EDITABLE_ALPHA_TEST

#ifdef IN_GAME

DIFFUSE_LIGHTING_WORLD_SPACE
SPECULAR_LIGHTING_WORLD_SPACE
BW_SKY_LIGHT_MAP_WORLD_SPACE

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

#endif

struct Output
{
	float4 pos : POSITION;
	float3 worldPos : TEXCOORD0;
	float2 tc : TEXCOORD1;
	float3 tangent : TEXCOORD2;
	float3 binormal : TEXCOORD3;
	float3 normal : TEXCOORD4;
	float2 skyLightMap: TEXCOORD5;
	float fog : FOG;
};

#ifdef IN_GAME

Output vs_main_3_0( VertexXYZNUVIIIWWTB input )
{
	Output output = (Output)0;
	
	// Grab the indices into the matrix palette	
	int indices[3] = { input.indices.x * 256.5,
							input.indices.y * 256.5,
							input.indices.z * 256.5 };
	
	// calculate the weights for the matrices in the palette
	float weights[3] = { input.weights.x, input.weights.y, 1 - input.weights.y - input.weights.x };
	
	// transform the vertex position to world space
	float4 worldPos = transformPos( input.pos, weights, indices );
	
	// calculate the sky map data
	BW_SKY_MAP_COORDS_WORLD_SPACE( output, worldPos )
	
	// Output the position and the world position
	output.pos = mul(worldPos, viewProj);
	output.worldPos = worldPos;

	// do the fog
	float2 fogging = float2((-1.0 / (fogEnd - fogStart)), (fogEnd / (fogEnd - fogStart)));
	output.fog = output.pos.w * fogging.x + fogging.y;
	
	// output the normal, tangent and binormal for use in the pixel shader
	output.normal = transformNormaliseVector( input.normal, indices[0] );
	output.tangent = transformNormaliseVector( input.tangent, indices[0] );
	output.binormal = transformNormaliseVector( input.binormal, indices[0] );	
	
	// tex coord
	output.tc = input.tc;
	
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

sampler subSurfaceSampler = sampler_state
{
	Texture = (subSurfaceMap);
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

float4 ps_main_3_0( Output input ) : COLOR0
{
	// Grab our maps	
	float4 diffuseMap = colouriseDiffuseMap( diffuseSampler, input.tc, input.tc );
	float3 specularMap = tex2D( specularSampler, input.tc );
	float3 normalMap = (tex2D( normalSampler, input.tc ).xyz * 2 ) - 1;
	float4 subSurfaceMap = tex2D( subSurfaceSampler, input.tc );

	// construct texture space matrix and transform normal map normal to 
	// world space
	float3x3 tsMatrix = { input.tangent, input.binormal, input.normal };
	float3 normal = normalize( mul( normalMap, tsMatrix ) );
	
	// Lighting section
	
	// Start with the ambient colour
	float3 diffuse = ambientColour;
	
	// Do diffuse lighting
	for (int i = 0; i < nDirectionalLights; i++)
	{
		diffuse += directionalLight( normal, directionalLights[i] );
	}

	for (int i = 0; i < nPointLights; i++)
	{
		diffuse += pointLight( input.worldPos, normal, pointLights[i] );
	}
	
	
	// grab the eye vector
	float3 eye = normalize(cameraPos - input.worldPos);
	
	// calculate specular lights
	float3 specular = float3(0,0,0);
	
	for (int i = 0; i < nSpecularDirectionalLights; i++)
	{
		specular += directionalSpecLight( normal, eye, specularDirectionalLights[i] );
	}

	for (int i = 0; i < nSpecularPointLights; i++)
	{
		specular += pointSpecLight( input.worldPos, normal, eye, specularPointLights[i] );
	}

	// Include spot lights	
	for (int i = 0; i < nSpotLights; i++)
	{
		float3 diff = float3(0,0,0);
		float3 spec = float3(0,0,0);
		spotLightBump(input.worldPos, normal, eye, spotLights[i], diff, spec);
		diffuse += diff;
		specular += spec;
	}
	
	// do the rim lighting
	half rimLight;
	if (nDirectionalLights > 0)
	{		
		half3 rLight = directionalLights[0].direction;
		rLight = -rLight;
		
		half attenuation = saturate(dot(rLight, normal ));
		rimLight = 1.0 - saturate( dot( eye, normal ) );
		rimLight = rimStrength * smoothstep( 1-rimWidth, 1, rimLight );
		rimLight = saturate( rimLight * attenuation );
	}
	else
	{
		rimLight = 0.0;
	}

	// calculate the proportien of diffuse to sub surface map to blend together and mul by the diffuse colour.
	float diffuseAmount = 1 - ( 1 - pow(saturate( dot(normal, eye) ), subSurfaceBlendPower ) ) * subSurfaceMap.w;
	diffuse = (diffuseMap.xyz * diffuseAmount + subSurfaceMap * (1-diffuseAmount)) * saturate( diffuse );

	// Sample sky map
	float skyMap = SAMPLE_SKY_MAP(input)
	
	// Calculate result colour
	float4 colour;
	colour.xyz = skyMap * diffuse + (diffuseMap.xyz*rimLight) + saturate(specular) * specularMap;
#ifdef MOD2X
	colour.xyz *= (1 + diffuseLightExtraModulation);
#endif
	colour.w = diffuseMap.w;
	colour.xyz = lerp( fogColour.xyz, colour.xyz, saturate(input.fog) );

	return colour;
}


//--------------------------------------------------------------//
// Technique Section for for pixel/vertexshader 3
//--------------------------------------------------------------//
technique subsurface_skinned_shader3
<
	bool skinned = true;
	bool bumpMapped = true;
	string label = "SHADER_MODEL_3";
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
		
		VertexShader = compile vs_3_0 vs_main_3_0();
		PixelShader = compile ps_3_0 ps_main_3_0();
	}

}


struct Output_2_0
{
	float4 pos : POSITION;
	float3 worldPos : TEXCOORD0;
	float2 tc : TEXCOORD1;
	float3 tangent : TEXCOORD2;
	float3 binormal : TEXCOORD3;
	float3 normal : TEXCOORD4;
	float2 skyLightMap: TEXCOORD5;
	float3 diffuse : COLOR;
	float fog : FOG;
};

Output_2_0 vs_main_2_0( VertexXYZNUVIIIWWTB input,
					uniform int nDirectionals,
					uniform int nPoints )
{
	Output_2_0 output = (Output_2_0)0;
	
	// Grab the indices into the matrix palette	
	int indices[3] = { input.indices.x * 256.5,
							input.indices.y * 256.5,
							input.indices.z * 256.5 };
	
	// calculate the weights for the matrices in the palette
	float weights[3] = { input.weights.x, input.weights.y, 1 - input.weights.y - input.weights.x };
	
	// transform the vertex position to world space
	float4 worldPos = transformPos( input.pos, weights, indices );
	
	// calculate the sky map data
	BW_SKY_MAP_COORDS_WORLD_SPACE( output, worldPos )
	
	// Output the position and the world position
	output.pos = mul(worldPos, viewProj);
	output.worldPos = worldPos;

	// do the fog
	float2 fogging = float2((-1.0 / (fogEnd - fogStart)), (fogEnd / (fogEnd - fogStart)));
	output.fog = output.pos.w * fogging.x + fogging.y;
	
	// output the normal, tangent and binormal for use in the pixel shader
	output.normal = transformNormaliseVector( input.normal, indices[0] );
	output.tangent = transformNormaliseVector( input.tangent, indices[0] );
	output.binormal = transformNormaliseVector( input.binormal, indices[0] );
	
	output.diffuse = ambientColour;
	
	int startDir = nDirectionals > 0 ? 1 : 0;

	for (int i = startDir; i < nDirectionals; i++)
	{
		output.diffuse += directionalLight( output.normal, directionalLights[i] );
	}

	int startPoint = nDirectionals > 0 ? 0 : 1;
	for (int i = startPoint; i < nPoints; i++)
	{
		output.diffuse += pointLight( worldPos, output.normal, pointLights[i] );
	}

	int ns = nSpotLights < 2 ? nSpotLights : 2;
	for (int l = 0; l < ns; l++)
	{
		output.diffuse += spotLight( worldPos, output.normal, spotLights[l] );
	}
		
	// tex coord
	output.tc = input.tc;
	
	return output;
}

float4 ps_main_2_0( Output_2_0 input, 
				uniform int nDirectionals, 
				uniform int nPoints,
				uniform int nSpecDirectionals,
				uniform int nSpecPoints ) : COLOR0
{
	// Grab our maps	
	float4 diffuseMap = colouriseDiffuseMap( diffuseSampler, input.tc, input.tc );
	float3 specularMap = tex2D( specularSampler, input.tc );
	float3 normalMap = (tex2D( normalSampler, input.tc ).xyz * 2 ) - 1;
	float4 subSurfaceMap = tex2D( subSurfaceSampler, input.tc );

	// construct texture space matrix and transform normal map normal to 
	// world space
	float3x3 tsMatrix = { input.tangent, input.binormal, input.normal };
	float3 normal = normalize( mul( normalMap, tsMatrix ) );
	
	// Lighting section
	
	// Start with the ambient colour
	float3 diffuse = input.diffuse;
	
	// Do diffuse lighting
	for (int i = 0; i < nDirectionals; i++)
	{
		diffuse += directionalLight( normal, directionalLights[i] );
	}

	for (int i = 0; i < nPoints; i++)
	{
		diffuse += pointLight( input.worldPos, normal, pointLights[i] );
	}
	
	
	// grab the eye vector
	float3 eye = normalize(cameraPos - input.worldPos);
	
	// calculate specular lights
	float3 specular = float3(0,0,0);
	
	for (int i = 0; i < nSpecDirectionals; i++)
	{
		specular += directionalSpecLight( normal, eye, specularDirectionalLights[i] );
	}

	for (int i = 0; i < nSpecPoints; i++)
	{
		specular += pointSpecLight( input.worldPos, normal, eye, specularPointLights[i] );
	}
	
	// do the rim lighting
	float rimLight;
	if (nDirectionals > 0)
	{
		half3 rLight = directionalLights[0].direction;
		rLight = -rLight;
		float attenuation = saturate(dot(rLight, normal ));
		rimLight = 1.0 - saturate( dot( eye, normal ) );
		rimLight = rimStrength * smoothstep( 1-rimWidth, 1, rimLight );
		rimLight = saturate( rimLight * attenuation );
	}
	else
	{
		rimLight = 0.0;
	}

	// calculate the proportien of diffuse to sub surface map to blend together and mul by the diffuse colour.
	float diffuseAmount = 1 - ( 1 - pow(saturate( dot(normal, eye) ), subSurfaceBlendPower ) ) * subSurfaceMap.w;
	diffuse = (diffuseMap.xyz * diffuseAmount + subSurfaceMap * (1-diffuseAmount)) * saturate( diffuse );

	// Sample sky map
	float skyMap = SAMPLE_SKY_MAP(input)
	
	// Calculate result colour
	float4 colour;
	colour.xyz = skyMap * diffuse + (rimLight*diffuseMap.xyz) + saturate(specular) * specularMap;
#ifdef MOD2X
	colour.xyz *= (1 + diffuseLightExtraModulation);
#endif
	colour.w = diffuseMap.w;

	return colour;
}

VertexShader vertexShaders_2_0[9] =
{
	compile vs_2_0 vs_main_2_0(0,0),
	compile vs_2_0 vs_main_2_0(0,1),
	compile vs_2_0 vs_main_2_0(0,2),
	compile vs_2_0 vs_main_2_0(0,3),
	compile vs_2_0 vs_main_2_0(1,0),
	compile vs_2_0 vs_main_2_0(1,1),
	compile vs_2_0 vs_main_2_0(1,2),
	compile vs_2_0 vs_main_2_0(1,3),
	compile vs_2_0 vs_main_2_0(2,4)
};

int vs_2_0Selector()
{
	int res = 0;
	if (nDirectionalLights > 1 || nPointLights >3)
	{
		res = 8;
	}
	else
	{
		res = nDirectionalLights *4 + nPointLights;
	}
	return res;
}

PixelShader pixelShaders_2_0[11] = 
{
	compile ps_2_0 ps_main_2_0(0,0,0,0),
	compile ps_2_0 ps_main_2_0(1,0,0,0),
	compile ps_2_0 ps_main_2_0(0,1,0,0),
	compile ps_2_0 ps_main_2_0(1,0,0,0),
	compile ps_2_0 ps_main_2_0(0,0,1,0),
	compile ps_2_0 ps_main_2_0(1,0,1,0),
	compile ps_2_0 ps_main_2_0(0,1,1,0),
	compile ps_2_0 ps_main_2_0(1,0,1,0),
	compile ps_2_0 ps_main_2_0(0,0,0,1),
	compile ps_2_0 ps_main_2_0(1,0,0,1),
	compile ps_2_0 ps_main_2_0(0,1,0,1)
};

int ps_2_0Selector()
{
	int dir = nDirectionalLights > 0;
	int point = dir ? 0 : nPointLights > 0;
	int specDir = nSpecularDirectionalLights > 0;
	int specPoint = specDir ? 0 : nSpecularPointLights > 0;
	return specPoint * 8 + specDir * 4 + point *2 + dir;
}

//--------------------------------------------------------------//
// Technique Section for for pixel/vertexshader 2
//--------------------------------------------------------------//
technique subsurface_skinned_shader2
<
	bool skinned = true;
	bool bumpMapped = true;
	string label = "SHADER_MODEL_2";
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
		
		VertexShader = (vertexShaders_2_0[vs_2_0Selector()]);
		PixelShader = (pixelShaders_2_0[ps_2_0Selector()]);
	}

}


OutputDiffuseCharacterLighting diffuseCharacterLighting_vs1( VertexXYZNUVIIIWWTB i,
	uniform int nDirectionals, 
	uniform int nPoints,
	uniform int nSpots )
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

	if (nSpots>0)
		o.diffuse.xyz += spotLight( worldPos, worldNormal, spotLights[0] );

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

OutputSpecularCharacterLightingAlpha specularCharacterLighting_vs1( VertexXYZNUVIIIWWTB i,
	uniform int nSpecularDirectionals, 
	uniform int nSpecularPoints )
{
	OutputSpecularCharacterLightingAlpha o = (OutputSpecularCharacterLightingAlpha)0;

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

float4 diffuseColourisation_ps1( OutputDiffuseCharacterLighting i ) : COLOR0
{	
	float4 diffuseMap = colouriseDiffuseMap_ps11( diffuseSampler, i.tc, i.ntc );	
	return diffuseMap;
}

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
	
	//NOTE - multiply by 0.5 added in to account for mod2 multi-pass blend mode for ps1
	// the mod2 parameter passed in will still work
	return float4(diffuse.xyz * diffuseMap.xyz * 0.5 * (int(mod2) + 1), diffuseMap.w);
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
							
VertexShader diffuseVertexShaders_vs1[30] =
{
	compile vs_1_1 diffuseCharacterLighting_vs1(0,0,0),
	compile vs_1_1 diffuseCharacterLighting_vs1(1,0,0),
	compile vs_1_1 diffuseCharacterLighting_vs1(2,0,0),
	compile vs_1_1 diffuseCharacterLighting_vs1(0,1,0),
	compile vs_1_1 diffuseCharacterLighting_vs1(1,1,0),
	compile vs_1_1 diffuseCharacterLighting_vs1(2,1,0),
	compile vs_1_1 diffuseCharacterLighting_vs1(0,2,0),
	compile vs_1_1 diffuseCharacterLighting_vs1(1,2,0),
	compile vs_1_1 diffuseCharacterLighting_vs1(2,2,0),
	compile vs_1_1 diffuseCharacterLighting_vs1(0,3,0),
	compile vs_1_1 diffuseCharacterLighting_vs1(1,3,0),
	compile vs_1_1 diffuseCharacterLighting_vs1(2,3,0),
	compile vs_1_1 diffuseCharacterLighting_vs1(0,4,0),
	compile vs_1_1 diffuseCharacterLighting_vs1(1,4,0),
	compile vs_1_1 diffuseCharacterLighting_vs1(2,4,0),

	compile vs_1_1 diffuseCharacterLighting_vs1(0,0,1),
	compile vs_1_1 diffuseCharacterLighting_vs1(1,0,1),
	compile vs_1_1 diffuseCharacterLighting_vs1(2,0,1),
	compile vs_1_1 diffuseCharacterLighting_vs1(0,1,1),
	compile vs_1_1 diffuseCharacterLighting_vs1(1,1,1),
	compile vs_1_1 diffuseCharacterLighting_vs1(2,1,1),
	compile vs_1_1 diffuseCharacterLighting_vs1(0,2,1),
	compile vs_1_1 diffuseCharacterLighting_vs1(1,2,1),
	compile vs_1_1 diffuseCharacterLighting_vs1(2,2,1),
	compile vs_1_1 diffuseCharacterLighting_vs1(0,3,1),
	compile vs_1_1 diffuseCharacterLighting_vs1(1,3,1),
	compile vs_1_1 diffuseCharacterLighting_vs1(2,3,1),
	compile vs_1_1 diffuseCharacterLighting_vs1(0,4,1),
	compile vs_1_1 diffuseCharacterLighting_vs1(1,4,1),
	compile vs_1_1 diffuseCharacterLighting_vs1(2,4,1)

};

VertexShader specularVertexShaders_vs1[3] =
{
	compile vs_1_1 specularCharacterLighting_vs1(0,0),
	compile vs_1_1 specularCharacterLighting_vs1(1,0),
	compile vs_1_1 specularCharacterLighting_vs1(0,1)
};


PixelShader diffusePixelShaders_ps1[3] =
{
	compile ps_1_1 diffuseCharacterLighting_ps1(0, false),
	compile ps_1_1 diffuseCharacterLighting_ps1(1, false),
	compile ps_1_1 diffuseCharacterLighting_ps1(2, false)
};

PixelShader specularPixelShaders_ps1[2] =
{
	compile ps_1_1 specularCharacterLighting_ps1(false, false),
	compile ps_1_1 specularCharacterLighting_ps1(true, false)
};

int diffuseVSIndex( int nDir, int nPoint, int nSpot )
{
	return min(4,nPoint) * 3 + min(nDir,2) + min(nSpot,1)*15;
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
technique subsurface_skinned_shader1
<
	bool skinned = true;
	bool bumpMapped = true;
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
		
		VertexShader = (diffuseVertexShaders_vs1[diffuseVSIndex(nDirectionalLights, nPointLights, nSpotLights)]);
		PixelShader = compile ps_1_1 diffuseColourisation_ps1();
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
		FOGCOLOR = <fogColour>;
		FOGTABLEMODE = NONE;
		FOGVERTEXMODE = LINEAR;
		ALPHABLENDENABLE = TRUE;
		POINTSPRITEENABLE = FALSE;
		STENCILENABLE = FALSE;
		CULLMODE = (doubleSided ? 1 : 3);
		
		DESTBLEND = SRCCOLOR;
		SRCBLEND = DESTCOLOR;
		
		VertexShader = (diffuseVertexShaders_vs1[diffuseVSIndex(nDirectionalLights, nPointLights, nSpotLights)]);
#ifdef MOD2X		
		PixelShader = (diffusePixelShaders_ps1[min(nPointLights,2)]);
#else
		PixelShader = (diffusePixelShaders_ps1[min(nPointLights,2)]);
#endif
	}
	
	pass Pass_2
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
		PixelShader = (specularPixelShaders_ps1[int(nSpecularPointLights>0)]);
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
	o.diffuse.xyz *= 0.5;
#endif

	return o;
}

#define lightEnable 1

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
		BW_TEXTURESTAGE_TERMINATE(1)
		CULLMODE = (doubleSided ? 1 : 3);
		
		VertexShader = compile vs_2_0 diffuseOnlyFallback();
		PixelShader = NULL;
	}
}

#else

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

sampler subSurfaceSampler = sampler_state
{
	Texture = (subSurfaceMap);
	ADDRESSU = WRAP;
	ADDRESSV = WRAP;
	ADDRESSW = WRAP;
	MAGFILTER = LINEAR;
	MINFILTER = LINEAR;
	MIPFILTER = LINEAR;
	MAXMIPLEVEL = 0;
	MIPMAPLODBIAS = 0;
};

float4x4 worldViewProj : WorldViewProjection;

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

float4x4 world : World;
float4x4 worldInverse : WorldI;
float4x4 viewInverse  : ViewI;

float4x4 worldViewInverse  : WorldViewI;

Output characterLighting_maxpreview_vs3( VertexXYZNUVTB input)
{
	Output output = (Output)0;

	output.pos = mul(input.pos, worldViewProj);

	// transform the vertex position to world space
	float4 worldPos = mul(input.pos, world);
	
	// Output the position and the world position
	output.worldPos = input.pos;

	// output the normal, tangent and binormal for use in the pixel shader
	output.normal = normalize( input.normal );
	output.tangent = normalize( input.tangent );
	output.binormal = normalize( input.binormal );
	
	// tex coord
	output.tc = input.tc;	
	return output;
}

float4 characterLighting_maxpreview_ps3( Output input ) : COLOR0
{
	// Grab our maps	
	float4 diffuseMap = colouriseDiffuseMap( diffuseSampler, input.tc, input.tc );
	float3 specularMap = tex2D( specularSampler, input.tc );
	float3 normalMap = (tex2D( normalSampler, input.tc ).xyz * 2 ) - 1;
	float4 subSurfaceMap = tex2D( subSurfaceSampler, input.tc );

	// construct texture space matrix and transform normal map normal to 
	// world space
	float3x3 tsMatrix = { input.tangent, input.binormal, input.normal };
	float3 normal = normalize( mul( normalMap, tsMatrix ) );
	
	// Lighting section

	DirectionalLight dl;
	dl.direction = normalize(mul( lightDir.xyz, worldInverse ));
	dl.colour = float4(0.5, 0.5, 0.5, 1);
	
	// Start with the ambient colour
	float3 diffuse = float3(0.1, 0.1, 0.1);
	
	// Do diffuse lighting
	diffuse += directionalLight( normal, dl );

	float3 cameraPos = worldViewInverse[3].xyz;

	float3 eye = normalize(cameraPos - input.worldPos);
	
	// calculate specular lights
	float3 specular = float3(0,0,0);
	
	specular += directionalSpecLight( normal, eye, dl );

	// do the rim lighting
	half rimLight;

	half3 rLight = dl.direction;
	rLight = -rLight;
		
	half attenuation = saturate(dot(rLight, normal ));
	rimLight = 1.0 - saturate( dot( eye, normal ) );
	rimLight = rimStrength * smoothstep( 1-rimWidth, 1, rimLight );
	rimLight = saturate( rimLight * attenuation );

	// calculate the proportion of diffuse to sub surface map to blend together and mul by the diffuse colour.
	float diffuseAmount = 1 - ( 1 - pow(saturate( dot(normal, eye) ), subSurfaceBlendPower ) ) * subSurfaceMap.w;
	diffuse = (diffuseMap.xyz * diffuseAmount + subSurfaceMap * (1-diffuseAmount)) * saturate( diffuse );

	// Calculate result colour
	float4 colour;
	colour.xyz = diffuse + (diffuseMap.xyz*rimLight) + saturate(specular) * specularMap;
#ifdef MOD2X
	colour.xyz *= (1 + diffuseLightExtraModulation);
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
		
		VertexShader = compile vs_3_0 characterLighting_maxpreview_vs3();
		PixelShader = compile ps_3_0 characterLighting_maxpreview_ps3();
	}
}

#endif // IN_GAME 