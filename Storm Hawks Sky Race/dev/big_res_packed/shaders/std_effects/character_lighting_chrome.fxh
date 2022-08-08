#ifndef CHARACTER_LIGHTING_CHROME
#define CHARACTER_LIGHTING_CHROME

struct OutputCharacterLightingEnv
{
	float4 pos:     POSITION;
	float4 tc:      TEXCOORD0;
	float4 dLight1: TEXCOORD1;
	float4 dLight2: TEXCOORD2;
	float4 sLight1: TEXCOORD3;
	float4 sLight2: TEXCOORD4;

	float4 tangentToCubeSpace0 : TEXCOORD5; //first row of the 3x3 transform from tangent to cube space
    float4 tangentToCubeSpace1 : TEXCOORD6; //second row of the 3x3 transform from tangent to cube space
    float4 tangentToCubeSpace2 : TEXCOORD7; //third row of the 3x3 transform from tangent to cube space	
	
	float4 diffuse: COLOR;
	float fog: FOG;
};

BW_ARTIST_EDITABLE_FRESNEL
BW_NON_EDITABLE_LIGHT_ENABLE

int graphicsSetting
<
	string label = "REFLECTION_RENDERING";
>;

float reflectionAmount
< 
	bool artistEditable = true;
	string UIName = "Reflection Amount";
	string UIDesc = "A scaling factor for the reflection";
	float UIMin = 0;
	float UIMax = 2.0;
	int UIDigits = 2;
> = 1.0;

float  glowFactor
<
	bool artistEditable = true;
	string UIName = "Glow Factor";
	string UIDesc = "The scalar factor to scale the glow map by";
	float UIMin = 0;
	float UIMax = 2;
	int UIDigits = 1;
> = 0;

float4 materialSpecular
<
	bool artistEditable = true;
	string UIWidget = "Color";
	string UIName = "Specular Colour";
	string UIDesc = "The specular colour for the material";
	float UIMin = 0;
	float UIMax = 2;
	int UIDigits = 1;
> = {1,1,1,1};


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

texture glowMap 
<
	bool artistEditable = true;
	string UIName = "Glow Map";
	string UIDesc = "The glow map for the material";
>;

texture reflectionMap
<
	bool artistEditable = true;
	string UIWidget = "CubeMap";
	string UIName = "Reflection Cube Map";
	string UIDesc = "The reflection map for the material";

	string type = "Cube";
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

#ifdef IN_GAME

texture normalisationMap : NormalisationMap;

float fogStart : FogStart = 0.0;
float fogEnd : FogEnd = 1.0;
float4 fogColour : FogColour = {0,0,0,0};

BW_SKY_LIGHT_MAP_SAMPLER

#endif //IN_GAME

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

sampler glowSampler = sampler_state
{
	Texture = (glowMap);
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

samplerCUBE reflectionCubeSampler = sampler_state
{
	Texture = (reflectionMap);
	ADDRESSU = CLAMP;
	ADDRESSV = CLAMP;
	ADDRESSW = CLAMP;
	MAGFILTER = LINEAR;
	MINFILTER = LINEAR;
	MIPFILTER = LINEAR;
	MAXMIPLEVEL = 0;
	MIPMAPLODBIAS = 0;
};

#if SKY_LIGHT_MAP_ENABLE
#define BW_SKY_MAP_COORDS_WORLD_SPACE_ENV( output, worldPos )\
	float4 skyLightMap;\
	skyLightMap.xyz = worldPos.xyz - wsCameraPos.xyz;\
	skyLightMap.w = 1.0;\
	output.tc.z = dot( skyLightMap, skyLightMapTransform[0] );\
	output.tc.w = dot( skyLightMap, skyLightMapTransform[1] );
#else // SKY_LIGHT_MAP_ENABLE
#define BW_SKY_MAP_COORDS_WORLD_SPACE_ENV( output, worldPos )
#endif // SKY_LIGHT_MAP_ENABLE

#if SKY_LIGHT_MAP_ENABLE
#define SAMPLE_SKY_MAP_ENV(input) 1.0 - tex2D( skyLightMapSampler, input.tc.zw ).w;
#else
#define SAMPLE_SKY_MAP_ENV(input) 1.0;
#endif //SKY_LIGHT_MAP_ENABLE


#ifndef IN_GAME

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

OutputCharacterLightingEnv characterLighting_maxpreview_vs3( VertexXYZNUVTB i)
{
	OutputCharacterLightingEnv o = (OutputCharacterLightingEnv)0;
	DirectionalLight dl;
	dl.direction = normalize(mul( lightDir.xyz, worldInverse ));
	dl.colour = float4(0.5, 0.5, 0.5, 1);

	o.pos = mul(i.pos, worldViewProj);
	
	float3x3 tsMatrix = {i.tangent, i.binormal, i.normal };

	o.tc.xy = i.tc.xy;
	o.diffuse = float4(0.1, 0.1, 0.1, 1);

	o.dLight1.w = directionalBumpLight( tsMatrix, dl, o.dLight1.xyz );
	o.dLight2.w = 0;

	float3 camp = mul( viewInverse[3].xyz, worldInverse );
	float3 eye = normalize(camp - i.pos);	

	o.sLight1.w = directionalSpecBumpLight( eye, tsMatrix, dl, o.sLight1.xyz );;
	o.sLight2.w = 0;

	// Compute the 3x3 transform from tangent space to cube space:
	o.tangentToCubeSpace0.xyz = mul(tsMatrix, transpose(world)[0].xyz);
	o.tangentToCubeSpace1.xyz = mul(tsMatrix, transpose(world)[1].xyz);
	o.tangentToCubeSpace2.xyz = mul(tsMatrix, transpose(world)[2].xyz);

	float3 wsCameraPos = viewInverse[3].xyz;

	float4 worldPos = mul( i.pos, world );

    // Compute the eye vector (going from shaded point to eye) in cube space
	float3 eyeVector = wsCameraPos - worldPos;
    
    o.tangentToCubeSpace0.w = eyeVector.x;
    o.tangentToCubeSpace1.w = eyeVector.y;
    o.tangentToCubeSpace2.w = eyeVector.z;


	return o;
}

float4 characterLighting_maxpreview_ps3( OutputCharacterLightingEnv i ) : COLOR0
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
	reflVec.yz = reflVec.zy;
	reflVec.y = -reflVec.y;
	
	float4 reflectionColour = texCUBE(reflectionCubeSampler, reflVec);
	half fresnelTerm = fresnel(eyeVec, envNormal, fresnelExp, fresnelConstant);
	reflectionColour *= fresnelTerm;

	float3 diffuse1Colour = lightColour.xyz;
	float3 diffuse2Colour = float3(0,0,0);
	float3 specular1Colour = lightColour.xyz * materialSpecular;
	float3 specular2Colour = float3(0,0,0);
	float4 attenuation = float4(0,0,0,0);

	attenuation.x = saturate( dot( normalize(i.dLight1.xyz), normal ) ) * i.dLight1.w;
	attenuation.z = pow( saturate( dot( normalize(i.sLight1.xyz), normal ) ), 32 ) * i.sLight1.w;

	diffuseColour +=  attenuation.x * diffuse1Colour;

	float3 specularColour = glowMap * glowFactor;
	specularColour += attenuation.z * specular1Colour;

	float4 colour;
	colour.xyz = (diffuseColour * diffuseMap) + specularColour;
	colour.xyz += reflectionColour * reflectionAmount * diffuseMap.aaa;
	colour.w = 1;

	return colour;
}

technique max_preview
{
	pass Pass_0
	{
		ZEnable = true;
		ZWriteEnable = true;
		CullMode = CW;
		
		VertexShader = compile vs_3_0 characterLighting_maxpreview_vs3();
		PixelShader = compile ps_3_0 characterLighting_maxpreview_ps3();
	}
}

#endif 

#endif //CHARACTER_LIGHTING_CHROME