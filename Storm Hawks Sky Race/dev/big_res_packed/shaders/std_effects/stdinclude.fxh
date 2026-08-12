#ifndef STDINCLUDE_FXH
#define STDINCLUDE_FXH

// standard include file for .fx files
// contains most common code used in .fx pipeline

#include "optinclude.fxh"

// don't allow cloud shadows on additive effects
#if SKY_LIGHT_MAP_ENABLE
	#ifdef ADDITIVE_EFFECT
		#undef SKY_LIGHT_MAP_ENABLE
		#define REENABLE_SKY_LIGHT_MAP 1
	#endif
#endif

// Lighting structures

struct DirectionalLight
{
	float3 direction;
	float4 colour;
};

struct PointLight
{
	float3 position;
	float4 colour;
	float2 attenuation;
};

struct SpotLight
{
	float3 position;
	float4 colour;
	float3 attenuation;
	float3 direction;
};

// Lighting Code

// Directional lights

float3 directionalLight( in float3 normal, in DirectionalLight light )
{
	return saturate(dot(light.direction, normal )) * light.colour.xyz;
}

float directionalBumpLight( in float3x3 tsMatrix, in DirectionalLight light, out float3 tsLightDir )
{
	tsLightDir = mul( tsMatrix, light.direction ); // transform light direction to texture space
	return 1; // return attenuation, always 1 for directional lights
}

float directionalSpecBumpLight( in float3 eye, in float3x3 tsMatrix, in DirectionalLight light, out float3 tsLightDir )
{
	float3 h = light.direction + eye;
	tsLightDir = mul( tsMatrix, h );
	return 1;
}


float3 directionalSpecLight( in float3 normal, in float3 eye, in DirectionalLight light )
{
	float3 h = normalize(eye + light.direction);
	float att = saturate(dot(normal, h));
	att = pow(att,32);
	return att * light.colour;
}

// Point lights

float3 pointLight( in float3 position, in float3 normal, in PointLight light )
{
	float3 lDir = normalize( light.position - position );
	float	distance = dot( light.position - position, lDir );
	float2 att = {(-distance + light.attenuation.x) * light.attenuation.y, dot( lDir, normal )};
	att = saturate(att);
	return att.x * att.y * light.colour;
}

float pointBumpLight( in float3 position, in float3x3 tsMatrix, in PointLight light, out float3 tsLightDir )
{
	float3 dir = light.position - position;
	tsLightDir = mul( tsMatrix, dir );
	
	return saturate((-length( dir ) + light.attenuation.x) * light.attenuation.y);
}

float pointOrDirBumpLight( in float3 position,	in float3x3 tsMatrix, 
	in PointLight pLight, in DirectionalLight dLight, out float3 tsLightDir,
	int pointLight )
{
	float att;
	float3 dir;

	dir = (pLight.position - position) * pointLight;
	att = saturate((-length( dir ) + pLight.attenuation.x) * pLight.attenuation.y) * pointLight;

	dir += dLight.direction * (1 - pointLight);
	att += 1 - pointLight;

	tsLightDir = mul( tsMatrix, dir );
	return att;
}

float pointSpecBumpLight( in float3 position, in float3 eye, in float3x3 tsMatrix, in PointLight light, out float3 tsLightDir )
{
	float3 lightVector = light.position - position;
	float lightLen = length( lightVector );
	lightVector /= lightLen;
	
	float3 h = lightVector + eye;
	
	tsLightDir = mul( tsMatrix, h );
	
	return saturate((-lightLen + light.attenuation.x) * light.attenuation.y);
}

float pointOrDirSpecBumpLight( in float3 position, in float3 eye, 
	in float3x3 tsMatrix, in PointLight pLight, 
	in DirectionalLight dLight, out float3 tsLightDir,
	int pointLight )
{
	float3	lDir;
	float	lAtt;
	float3 l = pLight.position - position;
	lDir = normalize(l) * pointLight;
	float lightLen = dot( l, lDir );
	lAtt = saturate((-lightLen + pLight.attenuation.x) * pLight.attenuation.y) * pointLight;
	lDir += dLight.direction * (1 - pointLight);
	lAtt += 1-pointLight;

	float3 h = lDir + eye;
	tsLightDir = mul( tsMatrix, h );
	return lAtt;
}

float3 pointSpecLight( in float3 position, in float3 normal, in float3 eye,
	in PointLight light )
{
	float3 lightDir = light.position - position;
	float lightLen = length( lightDir );
	lightDir /= lightLen;

	float3 h = normalize(eye + lightDir);
	float att = saturate(dot(normal, h));
	att = pow(att,32);
	return saturate((-lightLen + light.attenuation.x) * light.attenuation.y) * att * light.colour;
	
}

// Spot lights

float3 spotLight( in float3 position, in float3 normal, in SpotLight light )
{
	float3 lDir = normalize( light.position - position );
	float	distance = dot( light.position - position, lDir );
	
	float3 att = {(-distance + light.attenuation.x) * light.attenuation.y, 
				dot( light.direction, normal ),  
				(dot( light.direction, lDir ) -light.attenuation.z) / (1 - light.attenuation.z) };
	att = saturate(att);
	return att.x * att.y * att.z * light.colour.xyz;
}

float spotBumpLight( in float3 position, in float3 normal, in float3x3 tsMatrix, in SpotLight light, out float3 tsLightDir )
{
	float3 lDir = normalize( light.position - position );
	float	distance = dot( light.position - position, lDir );
	
	float3 att = {(-distance + light.attenuation.x) * light.attenuation.y, 
				/*dot( light.direction, normal )*/ 0,  
				(dot( light.direction, lDir ) -light.attenuation.z) / (1 - light.attenuation.z) };
	
	att = saturate(att);	
	
	float3 dir = light.position - position;
	tsLightDir = mul( tsMatrix, dir ); // transform light direction to texture space
	
	return att.x * att.z;
}

float spotSpecBumpLight( in float3 position, in float3 normal, in float3 eye,
						 in float3x3 tsMatrix, in SpotLight light,
						 out float3 tsLightDir, out float3 tsHalfVec, out float3 spotDir )
{
	float3 dir = light.position - position;
	float3 lDir = normalize( dir );
	float	distance = dot( dir, lDir );

	float3 h = lDir + eye;
	
	tsHalfVec = mul( tsMatrix, h );
	tsLightDir = mul( tsMatrix, dir ); // transform light direction to texture space
	
	spotDir = dir;
	
	float att = (-distance + light.attenuation.x) * light.attenuation.y;
	att = saturate(att);
	return att;
}


float spotSpecBumpLight2( in float3 position, in float3 normal, in float3 eye,
						 in float3x3 tsMatrix, in SpotLight light,
						 out float3 tsLightDir, out float3 tsHalfVec, out float3 spotDir )
{
	float3 dir = light.position - position;
	float3 lDir = normalize( dir );
	float	distance = dot( dir, lDir );

	float3 h = lDir + eye;
	
	tsHalfVec = mul( tsMatrix, h );
	tsLightDir = mul( tsMatrix, dir ); // transform light direction to texture space
	
	//spotDir = dir;
	//spotDir = lDir;
	spotDir = (lDir*0.5) + float3(0.5,0.5,0.5);
	
	float att = (-distance + light.attenuation.x) * light.attenuation.y;
	att = saturate(att);
	return att;
}


void spotLightBump( in float3 position, in float3 normal, in float3 eye, in SpotLight light, out float3 diffuse, out float3 spec)
{
	float3 lDir = normalize( light.position - position );
	float	distance = dot( light.position - position, lDir );
	float3 h = normalize(eye + lDir);
	
	float4 att = {(-distance + light.attenuation.x) * light.attenuation.y, 
				dot( light.direction, normal ),  
				(dot( light.direction, lDir ) -light.attenuation.z) / (1 - light.attenuation.z),
				dot(normal, h)};
	att = saturate(att);
	
	diffuse = (att.x * att.y * att.z * light.colour.xyz);	
	
	spec = att.x * att.z * pow(att.w,32) * light.colour;	
}


// Lighting defines

#define DIFFUSE_LIGHTING \
float4 ambientColour : Ambient; \
int nDirectionalLights : DirectionalLightCount; \
int nPointLights : PointLightCount; \
int nSpotLights : SpotLightCount;

#define DIFFUSE_LIGHTING_OBJECT_SPACE \
DIFFUSE_LIGHTING \
DirectionalLight osDirectionalLights[2] : DirectionalLightsObjectSpace; \
PointLight osPointLights[4] : PointLightsObjectSpace; \
SpotLight osSpotLights[2] : SpotLightsObjectSpace;

#define DIFFUSE_LIGHTING_WORLD_SPACE \
DIFFUSE_LIGHTING \
DirectionalLight directionalLights[2] : DirectionalLights; \
PointLight pointLights[4] : PointLights; \
SpotLight spotLights[2] : SpotLights;

#define SPECULAR_LIGHTING \
int nSpecularDirectionalLights : SpecularDirectionalLightCount; \
int nSpecularPointLights : SpecularPointLightCount;

#define SPECULAR_LIGHTING_OBJECT_SPACE \
SPECULAR_LIGHTING \
DirectionalLight osSpecularDirectionalLights[2] : SpecularDirectionalLightsObjectSpace; \
PointLight osSpecularPointLights[2] : SpecularPointLightsObjectSpace;

#define SPECULAR_LIGHTING_WORLD_SPACE \
SPECULAR_LIGHTING \
DirectionalLight specularDirectionalLights[2] : SpecularDirectionalLights; \
PointLight specularPointLights[2] : SpecularPointLights;

// Vertex input definitions

struct VertexXYZNUVIIIWWTB
{
   float4 pos:		POSITION;
   float3 indices:	BLENDINDICES;
   float2 weights:	BLENDWEIGHT;
   float3 normal:	NORMAL;
   float3 binormal:	BINORMAL;
   float3 tangent:	TANGENT;
   float2 tc:		TEXCOORD0;
};

struct VertexXYZNUVIIIWW
{
   float4 pos:		POSITION;
   float3 indices:	BLENDINDICES;
   float2 weights:	BLENDWEIGHT;
   float3 normal:	NORMAL;
   float2 tc:		TEXCOORD0;
};

struct VertexXYZNUVITB
{
   float4 pos:		POSITION;
   float  index:	BLENDINDICES;
   float3 normal:	NORMAL;
   float3 binormal:	BINORMAL;
   float3 tangent:	TANGENT;
   float2 tc:		TEXCOORD0;
};

struct VertexXYZNUVI
{
   float4 pos:		POSITION;
   float   index:	BLENDINDICES;
   float3 normal:	NORMAL;
   float2 tc:		TEXCOORD0;
};



struct VertexXYZNUVTB
{
   float4 pos:		POSITION;
   float3 normal:	NORMAL;
   float3 binormal:	BINORMAL;
   float3 tangent:	TANGENT;
   float2 tc:		TEXCOORD0;
};

struct VertexXYZNUVTB_D
{
   float4 pos:		POSITION;
   float3 normal:	NORMAL;
   float3 binormal:	BINORMAL;
   float3 tangent:	TANGENT;
   float2 tc:		TEXCOORD0;
   float4 diffuse:	COLOR;
};

struct VertexXYZNUV
{
   float4 pos:		POSITION;
   float3 normal:	NORMAL;
   float2 tc:		TEXCOORD0;
};

struct VertexXYZNUV_D
{
   float4 pos:		POSITION;
   float3 normal:	NORMAL;
   float2 tc:		TEXCOORD0;
   float4 diffuse:	COLOR;
};

struct VertexXYZL
{
   float4 pos:		POSITION;
   float4 diffuse:	COLOR;
};

struct VertexXYZDUV
{
   float4 pos:		POSITION;
   float4 diffuse:	COLOR;
   float2 tc:		TEXCOORD0;
};

struct OutputCharacterLighting
{
	float4 pos:     POSITION;
	float2 tc:      TEXCOORD0;
	float3 dLight1: TEXCOORD1;
	float3 dLight2: TEXCOORD2;
	float3 sLight1: TEXCOORD3;
	float3 sLight2: TEXCOORD4;
	float4 attenuation: TEXCOORD5;
#if SKY_LIGHT_MAP_ENABLE	
	float2 skyLightMap: TEXCOORD6;
#endif
	float4 diffuse: COLOR;
	float fog: FOG;
};

struct OutputCharacterLightingSpot
{
	float4 pos:     POSITION;
	float2 tc:      TEXCOORD0;
	float3 dLight1: TEXCOORD1;
	float3 dLight2: TEXCOORD2;
	float3 sLight1: TEXCOORD3;
	float3 sLight2: TEXCOORD4;
	float4 attenuation: TEXCOORD5;
#if SKY_LIGHT_MAP_ENABLE	
	float2 skyLightMap: TEXCOORD6;
#endif
	float3 spotDir: TEXCOORD7;
	float4 diffuse: COLOR0;
	float fog: FOG;
};

struct OutputCharacterLighting2
{
	float4 pos:     POSITION;
	float2 tc:      TEXCOORD0;
	float3 dLight1: TEXCOORD1;
	float3 dLight2: TEXCOORD2;
	float3 sLight1: TEXCOORD3;
	float3 sLight2: TEXCOORD4;
	float4 attenuation: TEXCOORD5;
#if SKY_LIGHT_MAP_ENABLE	
	float2 skyLightMap: TEXCOORD6;
#endif
	float3 eye:		TEXCOORD7;
	float4 diffuse: COLOR;
	float fog: FOG;
};

struct OutputParallaxLighting
{
	float4 pos:     POSITION;
	float2 tc:      TEXCOORD0;
	float3 dLight1: TEXCOORD1;
	float3 dLight2: TEXCOORD2;
	float3 sLight1: TEXCOORD3;
	float3 sLight2: TEXCOORD4;
	float4 attenuation: TEXCOORD5;
	float3 eye: TEXCOORD6;
#if SKY_LIGHT_MAP_ENABLE	
	float3 skyLightMap: TEXCOORD7;
#endif
	float4 diffuse: COLOR;
	float fog: FOG;
};

struct OutputParallaxLightingSpot
{
	float4 pos:     POSITION;
	float2 tc:      TEXCOORD0;
	float3 dLight1: TEXCOORD1;
	float3 dLight2: TEXCOORD2;
	float3 sLight1: TEXCOORD3;
	float3 sLight2: TEXCOORD4;
	float4 attenuation: TEXCOORD5;
	float3 eye: TEXCOORD6;
#if SKY_LIGHT_MAP_ENABLE	
	float3 skyLightMap: TEXCOORD7;
#endif
	float4 spotDir : COLOR1;
	float4 diffuse: COLOR0;
	float fog: FOG;
};

struct OutputDiffuseLighting
{
	float4 pos:				POSITION;
	float2 tc:				TEXCOORD0;
#if SKY_LIGHT_MAP_ENABLE
	float2 skyLightMap:		TEXCOORD1;
#endif
	float4 diffuse:			COLOR;
	float  fog: FOG;
};

struct OutputDiffuseLighting2
{
	float4 pos:     POSITION;
	float2 tc:      TEXCOORD0;
#if SKY_LIGHT_MAP_ENABLE
	float2 skyLightMap:	TEXCOORD1;
	float2 tc2:     TEXCOORD2;
#else
	float2 tc2:     TEXCOORD1;
#endif
	float4 diffuse: COLOR;
	float  fog: FOG;
};

struct OutputDiffuseLighting3
{
	float4 pos:     POSITION;
	float2 tc:      TEXCOORD0;
#if SKY_LIGHT_MAP_ENABLE
	float2 skyLightMap:	TEXCOORD1;
	float2 tc2:     TEXCOORD2;
	float2 tc3:     TEXCOORD3;
#else
	float2 tc2:     TEXCOORD1;
	float2 tc3:     TEXCOORD2;
#endif	
	float4 diffuse: COLOR;
	float  fog: FOG;
};

struct OutputDiffuseCharacterLighting
{
	float4 pos:     		POSITION;
	float2 tc:      		TEXCOORD0;
	float2 ntc:		TEXCOORD1;
	float3 dLight1: 	TEXCOORD2;
	float3 dLight2: 	TEXCOORD3;
	float4 diffuse: 		COLOR0;
	float4 attenuation: 	COLOR1;
	float fog: FOG;
};

struct OutputSpecularCharacterLighting
{
	float4 pos:     		POSITION;
	float2 tc:			TEXCOORD0;
	float2 ntc:			TEXCOORD1;
	float3 sLight: 		TEXCOORD2;
	float4 attenuation:	COLOR0;
	float fog: FOG;
};

struct OutputSpecularCharacterLightingAlpha
{
	float4 pos:     		POSITION;
	float2 tc:			TEXCOORD0;
	float2 ntc:			TEXCOORD1;
	float3 sLight: 		TEXCOORD2;
	float2 atc:			TEXCOORD3;	
	float4 attenuation:	COLOR0;
	float fog: FOG;
};


// Standard material definitions

#define BW_BLENDING_SOLID\
ALPHATESTENABLE = <alphaTestEnable>;\
ALPHAREF = <alphaReference>;\
ALPHAFUNC = GREATER;\
ALPHABLENDENABLE = FALSE;\
SRCBLEND = ONE;\
ZENABLE = TRUE;\
ZWRITEENABLE = TRUE;\
ZFUNC = LESSEQUAL;

#define BW_ARTIST_EDITABLE_ADDITIVE_BLEND\
int srcBlend\
<\
	bool artistEditable = true;\
	string UIName = "Source Blend";\
	string UIDesc = "D3D Source blend factor for blending with backbuffer";\
	string EnumType = "SRCBLEND";\
	int UIMin = 1;\
	int UIMax = 15;\
	int UIDigits = 2;\
> = 2;

#define BW_ARTIST_EDITABLE_ALPHA_BLEND\
int srcBlend\
<\
	bool artistEditable = true;\
	string UIName = "Source Blend";\
	string UIDesc = "D3D Source blend factor for blending with backbuffer";\
	string EnumType = "SRCBLEND";\
	int UIMin = 1;\
	int UIMax = 15;\
	int UIDigits = 2;\
> = 5;\
int destBlend\
<\
	bool artistEditable = true;\
	string UIName = "Destination Blend";\
	string UIDesc = "D3D Destination blend factor for blending with backbuffer";\
	string EnumType = "DESTBLEND";\
	int UIMin = 1;\
	int UIMax = 15;\
	int UIDigits = 2;\
> = 6;

#define BW_ARTIST_EDITABLE_TEXTURE_OP\
int textureOperation\
<\
	bool artistEditable = true;\
	string UIName = "Texture Operation";\
	string UIDesc = "D3D Texture Stage operation to use for blending the layer";\
	string EnumType = "TEXTUREOP";\
	int UIMin = 1;\
	int UIMax = 27;\
	int UIDigits = 2;\
> = 18;

#define BW_ARTIST_EDITABLE_LIGHT_ENABLE\
bool lightEnable\
<\
	bool artistEditable = true;\
	string UIName = "Light Enable";\
	string UIDesc = "Enable lighting on the material";\
	int UIMin = 1;\
	int UIMax = 15;\
	int UIDigits = 2;\
> = true;

#define BW_NON_EDITABLE_LIGHT_ENABLE\
const bool lightEnable = true;

#define BW_NON_EDITABLE_ADDITIVE_BLEND\
const int srcBlend=2;
#define BW_NON_EDITABLE_ALPHA_BLEND\
const int srcBlend=5;\
const int destBlend=6;

#define BW_BLENDING_ADD\
ALPHATESTENABLE = <alphaTestEnable>;\
ALPHAREF = <alphaReference>;\
ALPHAFUNC = GREATER;\
ALPHABLENDENABLE = TRUE;\
SRCBLEND = <srcBlend>;\
DESTBLEND = ONE;\
ZENABLE = TRUE;\
ZWRITEENABLE = FALSE;\
ZFUNC = LESSEQUAL;

#define BW_BLENDING_ALPHA\
ALPHATESTENABLE = <alphaTestEnable>;\
ALPHAREF = <alphaReference>;\
ALPHAFUNC = GREATER;\
ALPHABLENDENABLE = TRUE;\
SRCBLEND = <srcBlend>;\
DESTBLEND = <destBlend>;\
ZENABLE = TRUE;\
ZWRITEENABLE = FALSE;\
ZFUNC = LESSEQUAL;


#define BW_FOG\
FOGENABLE = TRUE;\
FOGSTART = 1.0;\
FOGEND = 0.0;\
FOGCOLOR = <fogColour>;\
FOGTABLEMODE = NONE;\
FOGVERTEXMODE = LINEAR;

#define BW_FOG_ADD\
FOGENABLE = TRUE;\
FOGSTART = 1.0;\
FOGEND = 0.0;\
FOGCOLOR = float4(0,0,0,0);\
FOGTABLEMODE = NONE;\
FOGVERTEXMODE = LINEAR;

#ifdef MOD2X
#define BW_TEXTURESTAGE_DIFFUSEONLY(stage, inTexture)\
COLOROP[stage] = (lightEnable ? 5 : 2);\
COLORARG1[stage] = TEXTURE;\
COLORARG2[stage] = DIFFUSE;\
ALPHAOP[stage] = SELECTARG1;\
ALPHAARG1[stage] = TEXTURE;\
ALPHAARG2[stage] = DIFFUSE;\
Texture[stage] = (inTexture);\
ADDRESSU[stage] = WRAP;\
ADDRESSV[stage] = WRAP;\
ADDRESSW[stage] = WRAP;\
MAGFILTER[stage] = LINEAR;\
MINFILTER[stage] = LINEAR;\
MIPFILTER[stage] = LINEAR;\
MAXMIPLEVEL[stage] = 0;\
MIPMAPLODBIAS[stage] = 0;\
TexCoordIndex[stage] = stage;
#else
#define BW_TEXTURESTAGE_DIFFUSEONLY(stage, inTexture)\
COLOROP[stage] = (lightEnable == true ? 4 : 2);\
COLORARG1[stage] = TEXTURE;\
COLORARG2[stage] = DIFFUSE;\
ALPHAOP[stage] = SELECTARG1;\
ALPHAARG1[stage] = TEXTURE;\
ALPHAARG2[stage] = DIFFUSE;\
Texture[stage] = (inTexture);\
ADDRESSU[stage] = WRAP;\
ADDRESSV[stage] = WRAP;\
ADDRESSW[stage] = WRAP;\
MAGFILTER[stage] = LINEAR;\
MINFILTER[stage] = LINEAR;\
MIPFILTER[stage] = LINEAR;\
MAXMIPLEVEL[stage] = 0;\
MIPMAPLODBIAS[stage] = 0;\
TexCoordIndex[stage] = stage;
#endif

#ifdef MOD2X
#define BW_TEXTURESTAGE_DIFFUSEONLY_ALPHA(stage, inTexture)\
COLOROP[stage] = (lightEnable ? 5 : 2);\
COLORARG1[stage] = TEXTURE;\
COLORARG2[stage] = DIFFUSE;\
ALPHAOP[stage] = MODULATE;\
ALPHAARG1[stage] = TEXTURE;\
ALPHAARG2[stage] = DIFFUSE;\
Texture[stage] = (inTexture);\
ADDRESSU[stage] = WRAP;\
ADDRESSV[stage] = WRAP;\
ADDRESSW[stage] = WRAP;\
MAGFILTER[stage] = LINEAR;\
MINFILTER[stage] = LINEAR;\
MIPFILTER[stage] = LINEAR;\
MAXMIPLEVEL[stage] = 0;\
MIPMAPLODBIAS[stage] = 0;\
TexCoordIndex[stage] = stage;
#else
#define BW_TEXTURESTAGE_DIFFUSEONLY_ALPHA(stage, inTexture)\
COLOROP[stage] = (lightEnable == true ? 4 : 2);\
COLORARG1[stage] = TEXTURE;\
COLORARG2[stage] = DIFFUSE;\
ALPHAOP[stage] = MODULATE;\
ALPHAARG1[stage] = TEXTURE;\
ALPHAARG2[stage] = DIFFUSE;\
Texture[stage] = (inTexture);\
ADDRESSU[stage] = WRAP;\
ADDRESSV[stage] = WRAP;\
ADDRESSW[stage] = WRAP;\
MAGFILTER[stage] = LINEAR;\
MINFILTER[stage] = LINEAR;\
MIPFILTER[stage] = LINEAR;\
MAXMIPLEVEL[stage] = 0;\
MIPMAPLODBIAS[stage] = 0;\
TexCoordIndex[stage] = stage;
#endif

#define BW_TEXTURESTAGE_ADDTEXTUREMULALPHA(stage, inTexture)\
COLOROP[stage] = MODULATEALPHA_ADDCOLOR;\
COLORARG1[stage] = CURRENT;\
COLORARG2[stage] = TEXTURE;\
ALPHAOP[stage] = SELECTARG1;\
ALPHAARG1[stage] = CURRENT;\
ALPHAARG2[stage] = CURRENT;\
Texture[stage] = (inTexture);\
ADDRESSU[stage] = WRAP;\
ADDRESSV[stage] = WRAP;\
ADDRESSW[stage] = WRAP;\
MAGFILTER[stage] = LINEAR;\
MINFILTER[stage] = LINEAR;\
MIPFILTER[stage] = LINEAR;\
MAXMIPLEVEL[stage] = 0;\
MIPMAPLODBIAS[stage] = 0;\
TexCoordIndex[stage] = stage;

#define BW_TEXTURESTAGE_TEXTUREOP(stage, inTexture)\
COLOROP[stage] = <textureOperation>;\
COLORARG1[stage] = CURRENT;\
COLORARG2[stage] = TEXTURE;\
ALPHAOP[stage] = SELECTARG1;\
ALPHAARG1[stage] = CURRENT;\
ALPHAARG2[stage] = CURRENT;\
Texture[stage] = (inTexture);\
ADDRESSU[stage] = WRAP;\
ADDRESSV[stage] = WRAP;\
ADDRESSW[stage] = WRAP;\
MAGFILTER[stage] = LINEAR;\
MINFILTER[stage] = LINEAR;\
MIPFILTER[stage] = LINEAR;\
MAXMIPLEVEL[stage] = 0;\
MIPMAPLODBIAS[stage] = 0;\
TexCoordIndex[stage] = stage;

#define BW_TEXTURESTAGE_ALPHAONLY(stage, inTexture)\
COLOROP[stage] = SELECTARG1;\
COLORARG1[stage] = CURRENT;\
COLORARG2[stage] = CURRENT;\
ALPHAOP[stage] = SELECTARG1;\
ALPHAARG1[stage] = TEXTURE;\
ALPHAARG2[stage] = CURRENT;\
Texture[stage] = (inTexture);\
ADDRESSU[stage] = WRAP;\
ADDRESSV[stage] = WRAP;\
ADDRESSW[stage] = WRAP;\
MAGFILTER[stage] = LINEAR;\
MINFILTER[stage] = LINEAR;\
MIPFILTER[stage] = LINEAR;\
MAXMIPLEVEL[stage] = 0;\
MIPMAPLODBIAS[stage] = 0;\
TexCoordIndex[stage] = stage;


#define BW_TEXTURESTAGE_ADD(stage, inTexture)\
COLOROP[stage] = ADD;\
COLORARG1[stage] = CURRENT;\
COLORARG2[stage] = TEXTURE;\
ALPHAOP[stage] = SELECTARG1;\
ALPHAARG1[stage] = CURRENT;\
ALPHAARG2[stage] = TEXTURE;\
Texture[stage] = (inTexture);\
ADDRESSU[stage] = WRAP;\
ADDRESSV[stage] = WRAP;\
ADDRESSW[stage] = WRAP;\
MAGFILTER[stage] = LINEAR;\
MINFILTER[stage] = LINEAR;\
MIPFILTER[stage] = LINEAR;\
MAXMIPLEVEL[stage] = 0;\
MIPMAPLODBIAS[stage] = 0;\
TexCoordIndex[stage] = stage;

#define BW_TEXTURESTAGE_TERMINATE(stage)\
COLOROP[stage] = DISABLE;\
ALPHAOP[stage] = DISABLE;

#if SKY_LIGHT_MAP_ENABLE

#define BW_SKY_LIGHT_MAP_WORLD_SPACE\
float3 wsCameraPos : CameraPos;\
float4 skyLightMapTransform[2] : SkyLightMapTransform;\
texture skyLightMap : SkyLightMap;\

#define BW_SKY_MAP_COORDS_WORLD_SPACE(output,inputWPos)\
float4 skyLightMap;\
skyLightMap.xyz = inputWPos.xyz - wsCameraPos.xyz;\
skyLightMap.w = 1.0;\
output.skyLightMap.x = dot( skyLightMap, skyLightMapTransform[0] );\
output.skyLightMap.y = dot( skyLightMap, skyLightMapTransform[1] );\

#define BW_SKY_LIGHT_MAP_OBJECT_SPACE\
float3 wsCameraPos : CameraPos;\
float4 skyLightMapTransform[2] : SkyLightMapTransform;\
texture skyLightMap : SkyLightMap;\
float4x4 world : World;

#define BW_SKY_MAP_COORDS_OBJECT_SPACE(output,inputPos)\
float4 worldPos = mul( inputPos, world );\
BW_SKY_MAP_COORDS_WORLD_SPACE( output, worldPos )\

#define BW_SKY_LIGHT_MAP_SAMPLER\
sampler skyLightMapSampler = sampler_state\
{\
	Texture = (skyLightMap);\
	ADDRESSU = CLAMP;\
	ADDRESSV = WRAP;\
	ADDRESSW = CLAMP;\
	MAGFILTER = LINEAR;\
	MINFILTER = LINEAR;\
	MIPFILTER = LINEAR;\
	MAXMIPLEVEL = 0;\
	MIPMAPLODBIAS = 0;\
};\

#define SAMPLE_SKY_MAP( input )\
1.0 - tex2D( skyLightMapSampler, input.skyLightMap ).w;\

#define BW_TEXTURESTAGE_CLOUDMAP(stage)\
COLOROP[stage] = MODULATE;\
COLORARG1[stage] = TEXTURE|ALPHAREPLICATE|COMPLEMENT;\
COLORARG2[stage] = CURRENT;\
ALPHAOP[stage] = SELECTARG1;\
ALPHAARG1[stage] = CURRENT;\
ALPHAARG2[stage] = CURRENT;\
Texture[stage] = (skyLightMap);\
ADDRESSU[stage] = WRAP;\
ADDRESSV[stage] = CLAMP;\
ADDRESSW[stage] = WRAP;\
MAGFILTER[stage] = LINEAR;\
MINFILTER[stage] = LINEAR;\
MIPFILTER[stage] = LINEAR;\
MAXMIPLEVEL[stage] = 0;\
MIPMAPLODBIAS[stage] = 0;\
TexCoordIndex[stage] = stage;

#define BW_TEXTURESTAGE_CLOUDMAP_MULALPHA(stage)\
COLOROP[stage] = MODULATE;\
COLORARG1[stage] = TEXTURE|ALPHAREPLICATE|COMPLEMENT;\
COLORARG2[stage] = CURRENT;\
ALPHAOP[stage] = MODULATE;\
ALPHAARG1[stage] = CURRENT;\
ALPHAARG2[stage] = DIFFUSE;\
Texture[stage] = (skyLightMap);\
ADDRESSU[stage] = WRAP;\
ADDRESSV[stage] = CLAMP;\
ADDRESSW[stage] = WRAP;\
MAGFILTER[stage] = LINEAR;\
MINFILTER[stage] = LINEAR;\
MIPFILTER[stage] = LINEAR;\
MAXMIPLEVEL[stage] = 0;\
MIPMAPLODBIAS[stage] = 0;\
TexCoordIndex[stage] = stage;

#define CLOUDMAP_STAGE 1
#define CLOUDMAP_STAGE_PLUS1 2
#define CLOUDMAP_STAGE_PLUS2 3
#define CLOUDMAP_STAGE_PLUS3 4

#else	// i.e. if not def SKY_LIGHTMAP_ENABLE

#define BW_SKY_LIGHT_MAP_WORLD_SPACE \
float3 wsCameraPos : CameraPos; \

#define BW_SKY_MAP_COORDS_WORLD_SPACE(output,inputWPos)
#define BW_SKY_LIGHT_MAP_OBJECT_SPACE \
float4x4 world : World; \

#define BW_SKY_MAP_COORDS_OBJECT_SPACE(output,inputPos)
#define BW_SKY_LIGHT_MAP_SAMPLER
#define SAMPLE_SKY_MAP( input ) 1.0;
#define BW_TEXTURESTAGE_CLOUDMAP(stage)
#define BW_TEXTURESTAGE_CLOUDMAP_MULALPHA(stage)
#define CLOUDMAP_STAGE 0
#define CLOUDMAP_STAGE_PLUS1 1
#define CLOUDMAP_STAGE_PLUS2 2
#define CLOUDMAP_STAGE_PLUS3 3

#endif	// ifdef SKY_LIGHT_MAP_ENABLE

#define BW_ARTIST_EDITABLE_ALPHA_TEST\
bool alphaTestEnable < bool artistEditable = true;  string UIName = "Alpha Test";  string UIDesc = "Whether an alpha test should be performed"; > = false;\
int alphaReference < bool artistEditable = true;  string UIName = "Alpha Reference";  string UIDesc = "The alpha value cut-off value"; \
int UIMax = 255; int UIMin = 0; > = 0;

#define BW_NON_EDITABLE_ALPHA_TEST\
bool alphaTestEnable  = false;\
int alphaReference = 0;

//Fresnel term calculation:
#define BW_ARTIST_EDITABLE_FRESNEL\
float fresnelExp\
<\
	bool artistEditable = true;\
	string UIName = "Fresnel falloff";\
	string UIDesc = "Fresnel term edging";\
	float UIMin = 1.0;\
	float UIMax = 7.0;\
	int UIDigits = 2;\
> = 5.0;\
\
float fresnelConstant\
<\
	bool artistEditable = true;\
	string UIName = "Fresnel constant";\
	string UIDesc = "Fresnel constant";\
	float UIMin = 0;\
	float UIMax = 0.5;\
	int UIDigits = 4;\
> = 0.5;

#define BW_FRESNEL\
float fresnelExp = 5.0;\
float fresnelConstant = 0.3;

// Calculates the fresnel term. Assumes the input is normalized.
half fresnel( float3 vec, float3 normal, float exponent, float constant )
{
	// Note: compute fresnelConstant on the CPU and provide as a
	// constant. it is more efficient than computing fresnelConstant in
	// the vertex shader. fresnelConstant is:
	// float const fresnelConstant = pow(1.0-refractionIndexRatio, 2.0) / pow(1.0+refractionIndexRatio, 2.0);
	half edotn = abs(dot(vec, normal));
	return (constant + ((1.0-constant) * pow(1.0-edotn, exponent)) );
}

#ifdef REENABLE_SKY_LIGHT_MAP
#define SKY_LIGHT_MAP_ENABLE 1
#undef REENABLE_SKY_LIGHT_MAP
#endif
#endif