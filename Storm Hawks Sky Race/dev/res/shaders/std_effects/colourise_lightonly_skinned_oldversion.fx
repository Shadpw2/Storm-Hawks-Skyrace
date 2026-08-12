#include "stdinclude.fxh"
#include "bw_four_channel_customise.fxh"


#ifdef IN_GAME
float4x4 viewProj : ViewProjection;
float4 world[51] : WorldPalette;
float fogStart : FogStart = 0.0;
float fogEnd : FogEnd = 1.0;
float4 fogColour : FogColour = {0,0,0,0};
#endif

texture diffuseMap 
< 
	bool artistEditable = true; 
	string UIName = "Diffuse Map";
	string UIDesc = "The diffuse map for the material";
>;

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

BW_FOUR_CHANNEL_COLOURISE( skinColour, "Skin Colour", "Custom colour for skin",
							hairColour, "Hair Colour", "Custom colour for hair",
							clothesColour1, "Clothes Colour", "Custom colour for misc. clothes 1",
							clothesColour2, "Clothes Colour 2", "Custom colour for misc. clothes 2" )

BW_ARTIST_EDITABLE_ALPHA_TEST
BW_ARTIST_EDITABLE_LIGHT_ENABLE

bool doubleSided
<
	bool artistEditable = true;
	string UIName = "Double Sided";
	string UIDesc = "Whether the material is draw on both sides";
> = false;

#ifdef IN_GAME

BW_SKY_LIGHT_MAP_WORLD_SPACE
DIFFUSE_LIGHTING_WORLD_SPACE

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

OutputDiffuseLighting2 vs_main( VertexXYZNUVIIIWW input, 
	uniform int nDirectionals, 
	uniform int nPoints, 
	uniform int nSpots )
{
	OutputDiffuseLighting2 o = (OutputDiffuseLighting2)0;

	int indices[3] = { input.indices.x * 256.5,
							input.indices.y * 256.5,
							input.indices.z * 256.5 };
							
	float weights[3] = { input.weights.x, input.weights.y, 1 - input.weights.y - input.weights.x };
	
	float4 worldPos = transformPos( input.pos, weights, indices );	
	
	o.pos = mul(worldPos, viewProj);

	float3 worldNormal = transformNormaliseVector( input.normal, indices[0] );

	o.tc = input.tc;
	o.tc2 = input.tc;
	
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
	{
		o.diffuse.xyz += spotLight( worldPos, worldNormal, spotLights[i] );
	}	
	
	BW_SKY_MAP_COORDS_WORLD_SPACE( o, worldPos );

#ifdef MOD2X
	o.diffuse.xyz *= 0.5 * (1 + diffuseLightExtraModulation);
#endif

	float2 fogging = float2((-1.0 / (fogEnd - fogStart)), (fogEnd / (fogEnd - fogStart)));
	o.fog = o.pos.w * fogging.x + fogging.y;

	return o;
}

//This pixel shader coloursies the diffuse map, using the mask map
//to select between 4 user-defined colours.  The alpha channel of
//the diffuse map is output to the alpha channel to be used for
//alpha test.
float4 ps_main( OutputDiffuseLighting2 input ) : COLOR0
{
	//get a customised / colourised version of diffuse map
	float4 result = colouriseDiffuseMap( diffuseSampler, input.tc, input.tc2 );
	
	//and do normal lighting.	
	result.xyz = result.xyz * input.diffuse.xyz;	
	return result;
}

float4 ps_11_colourise( OutputDiffuseLighting2 input ) : COLOR0
{
	//get a customised / colourised version of diffuse map
	float4 result = colouriseDiffuseMap_ps11( diffuseSampler, input.tc, input.tc2 );
	return result;
}

float4 ps_11_diffuse( OutputDiffuseLighting2 input ) : COLOR0
{
	float4 diffuseMap = tex2D( diffuseSampler, input.tc );
	float4 result;
	result.rgb = diffuseMap.rgb * input.diffuse.rgb * 0.5;
	result.a = diffuseMap.a;
	return result;
}


VertexShader vertexShaders[45] =
{
	compile vs_2_0 vs_main(0,0,0),
	compile vs_2_0 vs_main(1,0,0),
	compile vs_2_0 vs_main(2,0,0),
	compile vs_2_0 vs_main(0,1,0),
	compile vs_2_0 vs_main(1,1,0),
	compile vs_2_0 vs_main(2,1,0),
	compile vs_2_0 vs_main(0,2,0),
	compile vs_2_0 vs_main(1,2,0),
	compile vs_2_0 vs_main(2,2,0),
	compile vs_2_0 vs_main(0,3,0),
	compile vs_2_0 vs_main(1,3,0),
	compile vs_2_0 vs_main(2,3,0),
	compile vs_2_0 vs_main(0,4,0),
	compile vs_2_0 vs_main(1,4,0),
	compile vs_2_0 vs_main(2,4,0),
	compile vs_2_0 vs_main(0,0,1),
	compile vs_2_0 vs_main(1,0,1),
	compile vs_2_0 vs_main(2,0,1),
	compile vs_2_0 vs_main(0,1,1),
	compile vs_2_0 vs_main(1,1,1),
	compile vs_2_0 vs_main(2,1,1),
	compile vs_2_0 vs_main(0,2,1),
	compile vs_2_0 vs_main(1,2,1),
	compile vs_2_0 vs_main(2,2,1),
	compile vs_2_0 vs_main(0,3,1),
	compile vs_2_0 vs_main(1,3,1),
	compile vs_2_0 vs_main(2,3,1),
	compile vs_2_0 vs_main(0,4,1),
	compile vs_2_0 vs_main(1,4,1),
	compile vs_2_0 vs_main(2,4,1),
	compile vs_2_0 vs_main(0,0,2),
	compile vs_2_0 vs_main(1,0,2),
	compile vs_2_0 vs_main(2,0,2),
	compile vs_2_0 vs_main(0,1,2),
	compile vs_2_0 vs_main(1,1,2),
	compile vs_2_0 vs_main(2,1,2),
	compile vs_2_0 vs_main(0,2,2),
	compile vs_2_0 vs_main(1,2,2),
	compile vs_2_0 vs_main(2,2,2),
	compile vs_2_0 vs_main(0,3,2),
	compile vs_2_0 vs_main(1,3,2),
	compile vs_2_0 vs_main(2,3,2),
	compile vs_2_0 vs_main(0,4,1),
	compile vs_2_0 vs_main(1,4,1),
	compile vs_2_0 vs_main(2,4,1)
};

VertexShader vertexShaders_11[45] =
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
	compile vs_1_1 vs_main(0,4,1),
	compile vs_1_1 vs_main(1,4,1),
	compile vs_1_1 vs_main(2,4,1)
};

//--------------------------------------------------------------//
// Technique Section for shader 2.0
//--------------------------------------------------------------//
technique shader_2_0
<
	bool skinned = true;
>
{
	pass Pass_0
	{
		BW_BLENDING_SOLID
		BW_FOG
		CULLMODE = (doubleSided ? 1 : 3);
		VertexShader = (vertexShaders[nDirectionalLights + (nPointLights * 3) + (nSpotLights * 15) ]);
		PixelShader = compile ps_2_0 ps_main();
	}
}

technique shader_1_1
<
	bool skinned = true;
>
{
	pass Pass_0
	{
		BW_BLENDING_SOLID
		BW_FOG
		CULLMODE = (doubleSided ? 1 : 3);
		VertexShader = (vertexShaders_11[nDirectionalLights + (nPointLights * 3) + (nSpotLights * 15) ]);
		PixelShader = compile ps_1_1 ps_11_colourise();
	}
	
	pass Pass_1
	{
		ALPHABLENDENABLE = TRUE;
		DESTBLEND = SRCCOLOR;
		SRCBLEND = DESTCOLOR;
		
		VertexShader = (vertexShaders_11[nDirectionalLights + (nPointLights * 3) + (nSpotLights * 15) ]);
		PixelShader = compile ps_1_1 ps_11_diffuse();
	}
}
#else
// Auto variables
float4x4 worldViewProj : WorldViewProjection;

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
	
#ifdef MOD2X
	o.diffuse = saturate(dot( lDir, i.normal )) * lightColour * 0.5 * (1 + diffuseLightExtraModulation);
#else
	o.diffuse = saturate(dot( lDir, i.normal )) * lightColour;
#endif
	o.diffuse.w = 1;
	return o;
}

float4 ps_max( OutputDiffuseLighting input ) : COLOR0
{
	//get a customised / colourised version of diffuse map
	float4 result = colouriseDiffuseMap( diffuseSampler, input.tc, input.tc );
	
	//and do normal lighting.	
	result.xyz = result.xyz * input.diffuse.xyz;	
	return result;
}

technique max_preview
{
	pass max_pass
	{
		BW_BLENDING_SOLID
		CULLMODE = (doubleSided ? 1 : 2);
		VertexShader = compile vs_2_0 vs_max();
		PixelShader = compile ps_2_0 ps_max();
	}
}
#endif
