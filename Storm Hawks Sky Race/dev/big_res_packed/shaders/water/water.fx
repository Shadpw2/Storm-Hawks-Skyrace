// ----------------------------------------------------------------------------
// Water shaders
// ----------------------------------------------------------------------------
// TODO: use normalization cube map?
// TODO: create a different texture parameter for the cube maps
// TODO: group all the common variables for the different water shaders.

#include "stdinclude.fxh"

#ifdef IN_GAME
float3		cameraPos : CameraPos;
float		fogStart : FogStart		= 0.0;
float		fogEnd : FogEnd			= 1.0;
float4		fogColour : FogColour	= {0,0,0,0};
#endif //IN_GAME

float3		uTransform				= {1,0,0};
float3		vTransform				= {0,1,0};

float4		scale					= {0.08,0.08,0.08,0.08};
float4		reflectRefractScale		= {0.8,0.8,0.8,0.8};
float4		simulationTransformX	= {1,0,0,0};
float4		simulationTransformY	= {0,1,0,0};
float4		bumpTexCoordTransformX	= {1,0,0,0};
float4		bumpTexCoordTransformY	= {0,1,0,0};
float4		bumpTexCoordTransformX2 = {1,0,0,0};
float4		bumpTexCoordTransformY2 = {0,1,0,0};
float4		reflectionTint			= {1,1,1,1};
float4		refractionTint			= {0.1,0.9,1.0,1};

float		simulationTiling		= 1.f; //used to artificially increase the sim resolution for the rain
float		sunPower				= 32.0;
float		sunScale				= 1.0;
float		smoothness				= 0.0;

bool		alphaTestEnable			= false;
bool		useSimulation			= true;
bool		useRefraction			= true;
bool		useSmoothEdges			= false;

int			alphaReference			= 0;

float4x4	worldViewProj;
float4x4	world;
float4x4	tex;
float4x4	trans;

BW_NON_EDITABLE_ALPHA_BLEND
BW_FRESNEL
SPECULAR_LIGHTING_WORLD_SPACE

// ----------------------------------------------------------------------------
// Section: Textures
// ----------------------------------------------------------------------------

texture		reflectionMap;
texture		refractionMap;
texture		normalMap;
texture		simulationMap;
texture		screenFadeMap;


texture foamTexture;


// ----------------------------------------------------------------------------
// Section: Samplers
// ----------------------------------------------------------------------------


sampler foamSampler = sampler_state
{
	Texture = (foamTexture);
	ADDRESSU = WRAP;
	ADDRESSV = WRAP;
	ADDRESSW = WRAP;
	MAGFILTER = LINEAR;
	MINFILTER = LINEAR;
	MIPFILTER = LINEAR;
	MAXMIPLEVEL = 0;
	MIPMAPLODBIAS = 0;
};

sampler simulationSampler = sampler_state
{
	Texture = (simulationMap);
	ADDRESSU = CLAMP;
	ADDRESSV = CLAMP;
	ADDRESSW = CLAMP;
	MAGFILTER = LINEAR;
	MINFILTER = LINEAR;
	MIPFILTER = LINEAR;
	MAXMIPLEVEL = 0;
	MIPMAPLODBIAS = 0;
};

sampler rainSimulationSampler = sampler_state
{
	Texture = (simulationMap);
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

sampler screenFadeSampler = sampler_state
{
	Texture = (screenFadeMap);
	ADDRESSU = WRAP;
	ADDRESSV = WRAP;
	ADDRESSW = WRAP;
	MAGFILTER = LINEAR;
	MINFILTER = LINEAR;
	MIPFILTER = LINEAR;
	MAXMIPLEVEL = 0;
	MIPMAPLODBIAS = 0;
};

sampler reflectionSampler = sampler_state
{
	Texture = (reflectionMap);
	ADDRESSU = WRAP;
	ADDRESSV = WRAP;
	ADDRESSW = WRAP;
	MAGFILTER = LINEAR;
	MINFILTER = LINEAR;
	MIPFILTER = LINEAR;
	MAXMIPLEVEL = 0;
	MIPMAPLODBIAS = 0;
};

sampler refractionSampler = sampler_state
{
	Texture = (refractionMap);
	ADDRESSU = WRAP;
	ADDRESSV = WRAP;
	ADDRESSW = WRAP;
	MAGFILTER = LINEAR;
	MINFILTER = LINEAR;
	MIPFILTER = LINEAR;
	MAXMIPLEVEL = 0;
	MIPMAPLODBIAS = 0;
};

sampler reflectionCubeSampler = sampler_state
{
	Texture = (reflectionMap);
	ADDRESSU = WRAP;
	ADDRESSV = WRAP;
	ADDRESSW = WRAP;
	MAGFILTER = LINEAR;
	MINFILTER = LINEAR;
	MIPFILTER = LINEAR;
	MAXMIPLEVEL = 0;
	MIPMAPLODBIAS = 0;
};

// ----------------------------------------------------------------------------
// Section: Vertex formats
// ----------------------------------------------------------------------------

struct VertexXYZDUV2
{
   float4 pos:				POSITION;
   float4 diffuse:			COLOR0;
   float4 tc:				TEXCOORD0;
};

// ----------------------------------------------------------------------------
// Section: Pixel shader input
// ----------------------------------------------------------------------------

struct PS_INPUT
{
	float4 pos:				POSITION;
	float4 tc:				TEXCOORD0;
	float3 reflectionVec:	TEXCOORD1;
	float3 normal:			TEXCOORD2;	
	float3 eyeVec:			TEXCOORD3;
	float4 alpha:			COLOR0;
	float fog:				FOG;
};

struct PS_INPUT_RT
{
	float4 pos:				POSITION;
	float4 tc:				TEXCOORD0;
	float3 worldPos:		TEXCOORD1;	
	float4 reflect_refract:	TEXCOORD4;
	float4 W_sim:			TEXCOORD5;
	float4 alpha:			COLOR0;
	float fog:				FOG;	
};

// ----------------------------------------------------------------------------
// Section: Vertex Shaders
// ----------------------------------------------------------------------------

#define cHalf	0.5f

PS_INPUT_RT vs_main ( VertexXYZDUV2 i )
{
	PS_INPUT_RT o = (PS_INPUT_RT)0;
		
	float4 projPos = mul( i.pos, worldViewProj );
	o.pos = projPos;
	
	float2 fogging = float2((-1.0 / (fogEnd - fogStart)), (fogEnd / (fogEnd - fogStart)));
	o.fog = o.pos.w * fogging.x + fogging.y;
				
	// Transform bump coordinates
	o.tc.x = dot( float4(i.tc.xy,0,1), bumpTexCoordTransformX );
	o.tc.y = dot( float4(i.tc.xy,0,1), bumpTexCoordTransformY );

	o.tc.z = dot( float4(i.tc.xy,0,1), bumpTexCoordTransformX2 );
	o.tc.w = dot( float4(i.tc.xy,0,1), bumpTexCoordTransformY2 );

	o.W_sim.x = (i.tc.x + simulationTransformX.w)*simulationTransformX.x + 0.5;
	o.W_sim.y = (i.tc.y + simulationTransformY.w)*simulationTransformY.y + 0.5;

	// Map projected position to the reflection texture
	float2 reflectPos;
	reflectPos = (projPos.xy + projPos.w) * cHalf;

	// Map projected position to the refraction texture
	float2 refractPos;
	refractPos = (projPos.xy + projPos.w) * cHalf;

	// Reflection transform
	o.reflect_refract = float4( reflectPos.x, -reflectPos.y, -refractPos.y, refractPos.x );
	o.W_sim.z = projPos.w;

	float3 worldPos = mul(i.pos, world);    
    o.worldPos = worldPos;
    
	float4 edge = i.diffuse;   
    o.alpha = edge;

	//TODO: use the far plane here ....
	o.W_sim.w = (1 - (projPos.z * 0.002));
	return o;
};

// ----------------------------------------------------------------------------
// Section: Pixel Shaders
// ----------------------------------------------------------------------------

half3 generateSurfaceNormal( float4 tex, half3 simNormal )
{
   	// Load normal and expand range
	half4 vNormalSample1 = tex2D( normalSampler, tex.xy );
	half3 vNormal1 = vNormalSample1 * 2.0 - 1.0;	// expand

	half4 vNormalSample2 = tex2D( normalSampler, tex.zw );
	half3 vNormal2 = vNormalSample2 * 2.0 - 1.0;	// expand
	
	half3 vNormal = normalize(vNormal1 + vNormal2);	
	vNormal = lerp( vNormal, half3(0,0,1), smoothness);		
	vNormal = normalize( vNormal + simNormal );	
	return vNormal;
}


half4 computeDependentCoords(float4 reflect_refract, half3 normal, float w, float zScale )
{
	// Perform division by W only once
	half ooW = 1.0f / w;
	// Vectorize the dependent UV calculations (reflect = .xy, refract = .wz)
	half4 vN = normal.xyxy;	
	half4 screenCoords = reflect_refract * ooW;
	// Fade out the distortion offset at the screen borders to avoid artifacts.
	half3 screenFade = tex2D( screenFadeSampler, screenCoords.xy  );	
	half4 dependentTexCoords = vN * scale * screenFade.xxxx * zScale;
	dependentTexCoords += ( screenCoords );	
	return dependentTexCoords;
}


half3 calcFinalColour(half4 dependentTexCoords, half3 normal, half3 worldPos)
{
	half3 eye = normalize(cameraPos - worldPos);	
	half3 halfAngle = normalize(specularDirectionalLights[0].direction + eye);

	half2 reflectTexCoord = dependentTexCoords.xy;
	half2 refractTexCoord = dependentTexCoords.wz;

	// Sample reflection and refraction
	half3 reflectionColour = tex2D( reflectionSampler, reflectTexCoord ) * reflectionTint;	
	half3 refractionColour = tex2D( refractionSampler, refractTexCoord ) * refractionTint;
    
    // Combine reflection / refraction
	half fresnel = fresnel( eye, normal, fresnelExp, fresnelConstant );
	half3 finalColour = lerp( refractionColour, reflectionColour, fresnel );

	// Specular
	half specular = sunScale*pow( saturate( dot( halfAngle, normal ) ), sunPower );
	finalColour += saturate(specular * specularDirectionalLights[0].colour);	

	return finalColour;
}


half3 calcFinalColourFoam(half4 dependentTexCoords, half3 normal, half3 worldPos, half height, half2 tc)
{
	half3 eye = normalize(cameraPos - worldPos);	
	half3 halfAngle = normalize(specularDirectionalLights[0].direction + eye);

	half2 reflectTexCoord = dependentTexCoords.xy;
	half2 refractTexCoord = dependentTexCoords.wz;

	// Sample reflection and refraction
	half3 reflectionColour = tex2D( reflectionSampler, reflectTexCoord ) * reflectionTint;	
	half3 refractionColour = tex2D( refractionSampler, refractTexCoord ) * refractionTint;
    
    // Combine reflection / refraction
	half fresnel = fresnel( eye, normal, fresnelExp, fresnelConstant );
	half3 finalColour = lerp( refractionColour, reflectionColour, fresnel );

	float4 foamTex = tex2D(foamSampler, tc);
	finalColour.rgb += finalColour.rgb*foamTex.rgb * clamp((height*0.5), 0, 1.5);

	// Specular
	half specular = sunScale*pow( saturate( dot( halfAngle, normal ) ), sunPower );
	finalColour += saturate(specular * specularDirectionalLights[0].colour);

	return finalColour;
}


half4 calcFinalColourAlpha(half4 dependentTexCoords, half3 normal, half3 worldPos)
{
	half3 eye = normalize(cameraPos - worldPos);	
	half3 halfAngle = normalize(specularDirectionalLights[0].direction + eye);
	
	half2 reflectTexCoord = dependentTexCoords.xy;
	// Sample reflection and use alpha for transparency
	half4 reflectionColour = tex2D( reflectionSampler, reflectTexCoord ) * reflectionTint;	
	half4 refractionColour = refractionTint;
	half fresnel = fresnel( eye, normal, fresnelExp, fresnelConstant );
	half4 finalColour = reflectionColour*fresnel;
	
	// Specular
	half specular = sunScale*pow( saturate( dot( halfAngle, normal ) ), sunPower );	
	half4 specCol = specular * specularDirectionalLights[0].colour;
	finalColour.xyz += saturate(specCol);
	finalColour.xyz += saturate(specCol * (1-fresnel));
	fresnel= saturate(fresnel + (1-fresnel)*specular);
	return float4( finalColour.xyz, fresnel );
}


float4 ps_main_rt_alpha( PS_INPUT_RT i ) : COLOR0
{
 	half3 vNormal = generateSurfaceNormal( i.tc, half3(0,0,1) );
	half edging = i.alpha.w;
	
	// Compute coordinates for sampling Reflection/Refraction
	half4 dependentTexCoords = computeDependentCoords(i.reflect_refract, vNormal, i.W_sim.z, i.W_sim.w);
			
	half4 finalColour = calcFinalColourAlpha(dependentTexCoords, vNormal.xzy, i.worldPos);
	return float4( finalColour.xyz, finalColour.w*edging);
};




float4 ps_main_rt_alpha_sim( PS_INPUT_RT i ) : COLOR0
{
	half4 simSample = tex2D(simulationSampler, i.W_sim.xy);
	half3 simNormal = simSample.xzy;
	
	half3 vNormal = generateSurfaceNormal( i.tc, simNormal );
	half edging = i.alpha.w;
	
	// Compute coordinates for sampling Reflection/Refraction
	half4 dependentTexCoords = computeDependentCoords(i.reflect_refract, vNormal, i.W_sim.z, i.W_sim.w);	
			
	half4 finalColour = calcFinalColourAlpha(dependentTexCoords, vNormal.xzy, i.worldPos);
	return float4( finalColour.xyz, finalColour.w*edging);	
};


float4 ps_main_rt_alpha_sim_rain( PS_INPUT_RT i ) : COLOR0
{
	half3 simSample = tex2D(rainSimulationSampler, i.W_sim.xy * simulationTiling );
	half3 simNormal = simSample.xzy;
	
	half3 vNormal = generateSurfaceNormal( i.tc, simNormal );
	half edging = i.alpha.w;
	
	// Compute coordinates for sampling Reflection/Refraction
	half4 dependentTexCoords = computeDependentCoords(i.reflect_refract, vNormal, i.W_sim.z, i.W_sim.w);	
			
	half4 finalColour = calcFinalColourAlpha(dependentTexCoords, vNormal.xzy, i.worldPos);
	return float4( finalColour.xyz, finalColour.w*edging);	
};


float4 ps_main_rt( PS_INPUT_RT i ) : COLOR0
{
	half3 vNormal = generateSurfaceNormal( i.tc, half3(0,0,1) );
	half edging = i.alpha.w;

	// Compute coordinates for sampling Reflection/Refraction
	half4 dependentTexCoords = computeDependentCoords(i.reflect_refract, vNormal, i.W_sim.z, i.W_sim.w);	

	// testing some stuff...
	//dependentTexCoords.y += 0.0009765625; //(1 / 1024 atm....!)

	half3 finalColour = calcFinalColour(dependentTexCoords, vNormal.xzy, i.worldPos);
	return float4( finalColour, edging);
};


float4 ps_main_rt_sim( PS_INPUT_RT i ) : COLOR0
{
	half4 simSample = tex2D(simulationSampler, i.W_sim.xy );
	half3 simNormal = simSample.xzy;	
	
	half3 vNormal = generateSurfaceNormal( i.tc, simNormal );		
	half edging = i.alpha.w;	
	
	// Compute coordinates for sampling Reflection/Refraction
	half4 dependentTexCoords = computeDependentCoords(i.reflect_refract, vNormal, i.W_sim.z, i.W_sim.w);	
	half3 finalColour = calcFinalColourFoam(dependentTexCoords, vNormal.xzy, i.worldPos, simSample.a, i.tc.xy);

	return float4( finalColour, edging);
};


float4 ps_main_rt_sim_rain( PS_INPUT_RT i ) : COLOR0
{
	half4 simSample = tex2D(rainSimulationSampler, i.W_sim.xy * simulationTiling );
	half3 simNormal = simSample.xzy;
	
	half3 vNormal = generateSurfaceNormal( i.tc, simNormal );		
	half edging = i.alpha.w;	
	
	// Compute coordinates for sampling Reflection/Refraction
	half4 dependentTexCoords = computeDependentCoords(i.reflect_refract, vNormal, i.W_sim.z, i.W_sim.w);	
	half3 finalColour = calcFinalColour(dependentTexCoords, vNormal.xzy, i.worldPos);
	return float4( finalColour, edging);
};

// A special case to draw the water in the project view thumbnails.
float4 ps_main_proj_view( PS_INPUT_RT i ) : COLOR0
{
 	half3 vNormal = generateSurfaceNormal( i.tc, half3(0,0,1) );
	half edging = i.alpha.w;
	
	// Compute coordinates for sampling Reflection/Refraction
	half4 dependentTexCoords = computeDependentCoords(i.reflect_refract, vNormal, i.W_sim.z, i.W_sim.w);
			
	half3 eye = half3(0,1,0);
	half3 halfAngle = normalize(specularDirectionalLights[0].direction + eye);
	
	half2 reflectTexCoord = dependentTexCoords.xy;
	// Sample reflection and use alpha for transparency
	half4 reflectionColour = tex2D( reflectionSampler, reflectTexCoord ) * reflectionTint;	
	half4 refractionColour = refractionTint;
	half fresnel = fresnel( eye, vNormal.xzy, fresnelExp, fresnelConstant );
	half4 finalColour = reflectionColour*fresnel;
	
	// Specular
	half specular = sunScale*pow( saturate( dot( halfAngle, vNormal.xzy ) ), sunPower );	
	half4 specCol = specular * specularDirectionalLights[0].colour;
	finalColour.xyz += saturate(specCol);
	finalColour.xyz += saturate(specCol * (1-fresnel));
	fresnel= saturate(fresnel + (1-fresnel)*specular);
	return float4( finalColour.xyz, fresnel*edging );

};


//--------------------------------------------------------------
// Technique Section
//--------------------------------------------------------------

PixelShader rt_shaders[6] = 
{
	compile ps_2_0 ps_main_rt_alpha(),
	compile ps_2_0 ps_main_rt_alpha_sim(),
	compile ps_2_0 ps_main_rt_alpha_sim_rain(),
	compile ps_2_0 ps_main_rt(),
	compile ps_2_0 ps_main_rt_sim(),
	compile ps_2_0 ps_main_rt_sim_rain()
};

//TODO: clean up this indexing
int psIndex()
{
	if (useRefraction)
	{
		if (useSimulation)
		{
			if (simulationTiling == 1.0)
				return 4;
			else
				return 5;
		}
		else
			return 3;
	}
	else
	{
		if (useSimulation)
		{			
			if (simulationTiling == 1.0)
				return 1;
			else
				return 2;			
		}
		else
			return 0;
	}
}

// Standard water render technique:
technique water_rt
{
	pass Pass_0
	{
		ALPHATESTENABLE = <alphaTestEnable>;
		ALPHAREF = <alphaReference>;
		ALPHAFUNC = GREATER;
		ALPHABLENDENABLE = TRUE;
		SRCBLEND = <srcBlend>;
		DESTBLEND = <destBlend>;
		ZENABLE = TRUE;
		ZWRITEENABLE = <useRefraction>;
		ZFUNC = LESSEQUAL;		
		BW_FOG
		CULLMODE = NONE;
			
		VertexShader = compile vs_2_0 vs_main();		
		PixelShader = (rt_shaders[psIndex()]);
	}
}


// Project view technique:
technique water_proj
{
	pass Pass_0
	{
		ALPHATESTENABLE = <alphaTestEnable>;
		ALPHAREF = <alphaReference>;
		ALPHAFUNC = GREATER;
		ALPHABLENDENABLE = TRUE;
		SRCBLEND = <srcBlend>;
		DESTBLEND = <destBlend>;
		ZENABLE = TRUE;
		ZWRITEENABLE = <useRefraction>;
		ZFUNC = LESSEQUAL;		
		BW_FOG
		CULLMODE = NONE;
			
		VertexShader = compile vs_2_0 vs_main();		
		PixelShader = compile ps_2_0 ps_main_proj_view();
	}
}


// Experimental edge waves :::
texture edgeTexture;


sampler edgeSampler = sampler_state
{
	Texture = (edgeTexture);
	ADDRESSU = WRAP;
	ADDRESSV = CLAMP;
	ADDRESSW = WRAP;
	MAGFILTER = LINEAR;
	MINFILTER = LINEAR;
	MIPFILTER = LINEAR;
	MAXMIPLEVEL = 0;
	MIPMAPLODBIAS = 0;
};

struct VertexXYZNDUV
{
   float4 pos:				POSITION;
   float4 normal:			NORMAL;
   float4 diffuse:			COLOR0;
   float4 tc:				TEXCOORD0;
};


PS_INPUT_RT vs_main_wave ( VertexXYZNDUV i )
{
	PS_INPUT_RT o = (PS_INPUT_RT)0;
		
	float4 projPos = mul( i.pos, worldViewProj );
	o.pos = projPos;
	
	float2 fogging = float2((-1.0 / (fogEnd - fogStart)), (fogEnd / (fogEnd - fogStart)));
	o.fog = o.pos.w * fogging.x + fogging.y;
				
	// Transform bump coordinates
	o.tc.x = i.tc.x * 0.25;
	//o.tc.y = i.tc.y;


	float4 edge = i.diffuse;

	//o.tc.x = edge.w;
	o.tc.y = edge.w;
    o.alpha = edge;
	return o;
};

float4 ps_main_wave( PS_INPUT_RT i ) : COLOR0
{
	//TODO: how to map to the edge texture?
	float4 foamTex = tex2D(edgeSampler, i.tc);
	half edging = 1 - i.alpha.w;
	return float4( foamTex.rgb, foamTex.a * edging);
};

technique water_wave
{
	pass Pass_0
	{
		ALPHATESTENABLE = FALSE;
		ALPHABLENDENABLE = TRUE;
		SRCBLEND = <srcBlend>;
		DESTBLEND = <destBlend>;
		ZENABLE = TRUE;
		ZWRITEENABLE = TRUE;
		ZFUNC = LESSEQUAL;		
		BW_FOG
		CULLMODE = NONE;
			
		VertexShader = compile vs_2_0 vs_main_wave();		
		PixelShader = compile ps_2_0 ps_main_wave();
	}
}


// A dummy technique so the shader wont put out warnings on machines
// that dont have shader model 3 capabilities.
technique dummy
{
	pass Pass_0
	{
		VertexShader = NULL;
		PixelShader = NULL;
	}
}