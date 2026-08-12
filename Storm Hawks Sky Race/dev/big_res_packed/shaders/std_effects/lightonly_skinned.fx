#ifdef IN_GAME
#include "stdinclude.fxh"

float4x4 viewProj : ViewProjection;
float4 world[51] : WorldPalette;
float fogStart : FogStart = 0.0;
float fogEnd : FogEnd = 1.0;
float4 fogColour : FogColour = {0,0,0,0};

texture diffuseMap 
< 
	bool artistEditable = true; 
	string UIName = "Diffuse Map";
	string UIDesc = "The diffuse map for the material";
>;

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

BW_ARTIST_EDITABLE_ALPHA_TEST
BW_SKY_LIGHT_MAP_WORLD_SPACE
DIFFUSE_LIGHTING_WORLD_SPACE
BW_ARTIST_EDITABLE_LIGHT_ENABLE

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

OutputDiffuseLighting vs_main( VertexXYZNUVIIIWW input, 
	uniform int nDirectionals, 
	uniform int nPoints, 
	uniform int nSpots )
{
	OutputDiffuseLighting o = (OutputDiffuseLighting)0;

	int indices[3] = { input.indices.x * 256.5,
							input.indices.y * 256.5,
							input.indices.z * 256.5 };
							
	float weights[3] = { input.weights.x, input.weights.y, 1 - input.weights.y - input.weights.x };
	
	float4 worldPos = transformPos( input.pos, weights, indices );	
	
	o.pos = mul(worldPos, viewProj);

	float3 worldNormal = transformNormaliseVector( input.normal, indices[0] );

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
	
	BW_SKY_MAP_COORDS_WORLD_SPACE( o, worldPos );

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
	compile vs_1_1 vs_main(0,4,1),
	compile vs_1_1 vs_main(1,4,1),
	compile vs_1_1 vs_main(2,4,1)
};

//--------------------------------------------------------------//
// Technique Section for standard
//--------------------------------------------------------------//
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
		BW_TEXTURESTAGE_TERMINATE(CLOUDMAP_STAGE_PLUS1)
		CULLMODE = (doubleSided ? 1 : 3);
		VertexShader = (vertexShaders[nDirectionalLights + (nPointLights * 3) + (nSpotLights * 15) ]);
		PixelShader = NULL;
	}
}
#else
#include "lightonly.fx"
#endif
