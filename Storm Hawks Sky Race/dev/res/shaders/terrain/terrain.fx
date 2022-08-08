#include "stdinclude.fxh"

#define PER_PIXEL_SPECULAR 0

// Auto variables
float fogStart : FogStart = 0.0;
float fogEnd : FogEnd = 1.0;
float4 fogColour : FogColour = {0,0,0,0};
float4 rcpPenumbra : PenumbraSize = {0.1,0.1,0.1,0.1};
float4 sunAngle : SunAngle = {0.5,0.5,0.5,0.5};
float4 textureTransform[2] : TerrainTextureTransform;
matrix fogTransform : FogTextureTransform;
texture fogTexture : FogGradientTexture;
texture normalisationMap : NormalisationMap;

// variables
texture Layer0;
texture Layer1;
texture Layer2;
texture Layer3;
float3 axis0 = {0.0, 0.0, 1.0};
float3 axis1 = {0.0, 1.0, 0.0};
bool alphaTestEnable = false;
int alphaReference = 0;
float4x4 world;
float4x4 viewProj;
float4x4 view;
float4x4 proj;
float4x4 textransform;

// these variables can be set at runtime, render/terrain/...
float specularDiffuseAmount = 0.45;
float specularPower = 1.0;
float specularMultiplier = 0.5;
float fresnelExp = 3.0;
float fresnelConstant = 0.15;

// Define the lighting type used in this shader
DIFFUSE_LIGHTING_WORLD_SPACE
BW_SKY_LIGHT_MAP_WORLD_SPACE

struct VS_INPUT
{
    float4 pos		: POSITION;
    float3 normal		: NORMAL;
    float4 blend		: COLOR0;
    float4 shadow		: COLOR1;
};

struct VS_OUTPUT
{
    float4 pos			: POSITION;
    float2 t0			: TEXCOORD0;
    float2 t1			: TEXCOORD1;
    float2 t2			: TEXCOORD2;
    float2 t3			: TEXCOORD3;
    float4 diffuse		: COLOR0;
    float4 blend		: COLOR1;    
    float4 reflection	: TEXCOORD4;
    float3 view     	: TEXCOORD5;
    float  shade     	: TEXCOORD6;
    float2 skyLightMap	: TEXCOORD7;
    float fog			: FOG;
};

struct VS_OUTPUT11
{
    float4 pos			: POSITION;
    float3 reflection	: TEXCOORD2;
    float3 view     	: TEXCOORD1;    
    float  shade		: TEXCOORD0;
};

struct VS_OUTPUT11WITHFIX
{
    float4 pos			: POSITION;
    float3 reflection	: TEXCOORD2;
    float3 view     	: TEXCOORD1;    
    float3  shade		: TEXCOORD0;
};

//----------------------------------------------------------------------------
// Shader body 
//----------------------------------------------------------------------------

VS_OUTPUT vs_spec(const VS_INPUT v)
{
	VS_OUTPUT o = (VS_OUTPUT) 0;
	
	float4 worldPos = mul( v.pos, world );
	o.pos = mul( worldPos, viewProj );
	o.blend = v.blend;
	
	float2 fogging = float2((-1.0 / (fogEnd - fogStart)), (fogEnd / (fogEnd - fogStart)));
	o.fog = o.pos.w * fogging.x + fogging.y;

	float2 tc;
	tc.x = dot( worldPos, textureTransform[0] );
	tc.y = dot( worldPos, textureTransform[1] );	
	o.t0.xy=tc.xy;
	o.t1.xy=tc.xy;
	o.t2.xy=tc.xy;
	o.t3.xy=tc.xy;
	
	BW_SKY_MAP_COORDS_WORLD_SPACE( o, worldPos )
	
	o.diffuse.xyz = directionalLight( v.normal, directionalLights[0] );
	float2 angleDiff = (sunAngle - v.shadow) * rcpPenumbra;
	angleDiff = saturate( float2( angleDiff.x, -angleDiff.y ) );
	o.shade.x = angleDiff.x * angleDiff.y;
	o.diffuse.xyz = ( o.diffuse.xyz * o.shade ) + ambientColour.xyz;	
	o.diffuse.w = v.blend.x * 2 - 1;	
	
#if TERRAIN_SPECULAR_ENABLE
#if PER_PIXEL_SPECULAR
	// Per pixel specular / fresnel: (costs 17 more instructions in the pixel shader)
	o.reflection.xyz = v.normal.xyz;
	o.view = worldPos.xyz;
#else
	o.reflection.xyz = reflect(-directionalLights[0].direction.xyz, v.normal.xyz);	
	o.view = normalize(wsCameraPos.xyz - worldPos.xyz);	
	// Adding a per vertex fresnel
	o.reflection.w = fresnel( -o.view, v.normal.xyz, fresnelExp, fresnelConstant );	
#endif //PER_PIXEL_SPECULAR
#endif //TERRAIN_SPECULAR_ENABLE

	return o;
};

//This shader sets up the specular components for the
//second pass of the 1.1 shader version.
VS_OUTPUT11WITHFIX vs_spec_11(const VS_INPUT v)
{
	VS_OUTPUT11WITHFIX o = (VS_OUTPUT11WITHFIX) 0;
	
	float4 worldPos = mul( v.pos, world );
	o.pos = mul( worldPos, viewProj );
	o.reflection = reflect(-directionalLights[0].direction.xyz, v.normal.xyz);	
	o.view = wsCameraPos.xyz - worldPos.xyz;
	float2 angleDiff = (sunAngle - v.shadow) * rcpPenumbra;
	angleDiff = saturate( float2( angleDiff.x, -angleDiff.y ) );
	o.shade.x = angleDiff.x * angleDiff.y;
	
	return o;
};

//This shader is a hack to clear the alpha channel.  Should
//be replaced once a better way of doing spec on ps1.1 cards is found.
VS_OUTPUT11 vs_fixup(const VS_INPUT v)
{
	VS_OUTPUT11 o = (VS_OUTPUT11) 0;
	float4 worldPos = mul( v.pos, world );
	o.pos = mul( worldPos, viewProj );
	return o;
};

//This shader sets up the standard diffuse pixel shader
VS_OUTPUT vs_main(const VS_INPUT v)
{
	VS_OUTPUT o = (VS_OUTPUT) 0;

	float4 worldPos = mul( v.pos, world );
	o.pos = mul( worldPos, viewProj );
	o.blend = v.blend;
	
	float2 fogging = float2((-1.0 / (fogEnd - fogStart)), (fogEnd / (fogEnd - fogStart)));
	o.fog = o.pos.w * fogging.x + fogging.y;
	
	float2 tc;
	tc.x = dot( worldPos, textureTransform[0] );
	tc.y = dot( worldPos, textureTransform[1] );
	o.t0.xy=tc.xy;
	o.t1.xy=tc.xy;
	o.t2.xy=tc.xy;
	o.t3.xy=tc.xy;
	
	o.diffuse.xyz = directionalLight( v.normal, directionalLights[0] );
	float2 angleDiff = (sunAngle - v.shadow) * rcpPenumbra;
	angleDiff = saturate( float2( angleDiff.x, -angleDiff.y ) );
	o.diffuse.xyz = ( o.diffuse.xyz * angleDiff.x * angleDiff.y ) + ambientColour.xyz;	
	o.diffuse.w = v.blend.x * 2 - 1;		
	
	return o;
};

sampler layer0Sampler = sampler_state
{
	Texture = (Layer0);
	ADDRESSU = WRAP;
	ADDRESSV = WRAP;
	ADDRESSW = WRAP;
	MAGFILTER = LINEAR;
	MINFILTER = LINEAR;
	MIPFILTER = LINEAR;
	MAXMIPLEVEL = 0;
	MIPMAPLODBIAS = 0;
};

sampler layer1Sampler = sampler_state
{
	Texture = (Layer1);
	ADDRESSU = WRAP;
	ADDRESSV = WRAP;
	ADDRESSW = WRAP;
	MAGFILTER = LINEAR;
	MINFILTER = LINEAR;
	MIPFILTER = LINEAR;
	MAXMIPLEVEL = 0;
	MIPMAPLODBIAS = 0;
};

sampler layer2Sampler = sampler_state
{
	Texture = (Layer2);
	ADDRESSU = WRAP;
	ADDRESSV = WRAP;
	ADDRESSW = WRAP;
	MAGFILTER = LINEAR;
	MINFILTER = LINEAR;
	MIPFILTER = LINEAR;
	MAXMIPLEVEL = 0;
	MIPMAPLODBIAS = 0;
};

sampler layer3Sampler = sampler_state
{
	Texture = (Layer3);
	ADDRESSU = WRAP;
	ADDRESSV = WRAP;
	ADDRESSW = WRAP;
	MAGFILTER = LINEAR;
	MINFILTER = LINEAR;
	MIPFILTER = LINEAR;
	MAXMIPLEVEL = 0;
	MIPMAPLODBIAS = 0;
};

BW_SKY_LIGHT_MAP_SAMPLER

float4 ps20_main( const VS_OUTPUT input ) : COLOR0
{	
	float4 layer0Map = tex2D( layer0Sampler, input.t0 );
	float4 layer1Map = tex2D( layer1Sampler, input.t1 );
	float4 layer2Map = tex2D( layer2Sampler, input.t2 );
	float4 layer3Map = tex2D( layer3Sampler, input.t3 );		
	
	#if SKY_LIGHT_MAP_ENABLE
		float4 skyShade = tex2D( skyLightMapSampler, input.skyLightMap );
		skyShade.w = 1.0 - skyShade.w;
		SAMPLE_SKY_MAP( input )
	#else
		float4 skyShade = {0.0,0.0,0.0,1.0};
	#endif
	
	float3 bx2Blend = 2.0*(input.blend.xyz-0.5);
	float blend0 = saturate(dot(bx2Blend,axis0));
	float blend1 = saturate(dot(bx2Blend,axis1));	
	float4 colour;
	colour = blend0 * layer0Map;	
	colour += blend1 * layer1Map;
	colour += input.diffuse.a * layer2Map;
	colour += input.blend.a * layer3Map;	
	colour.xyz *= input.diffuse;
	colour.xyz *= skyShade.w;
#if TERRAIN_SPECULAR_ENABLE
#if PER_PIXEL_SPECULAR
	// Per pixel specular / fresnel: (costs 17 more instructions in the pixel shader)
	float3 normal = normalize(input.reflection.xyz);
	float3 refl = reflect(-directionalLights[0].direction.xyz, normal);
	float3 view = normalize(wsCameraPos.xyz - input.view);	
	float fres = fresnel( -view, normal, fresnelExp, fresnelConstant );	
	float specular = specularMultiplier * saturate(dot(normalize(refl),view));
	specular = skyShade.a * input.shade * pow(specular,specularPower) * fres;
#else
	// Added per vertex fresnel term to specular
	float specular = specularMultiplier * saturate(dot(normalize(input.reflection.xyz),normalize(input.view)));
	specular = skyShade.a * input.shade * pow(specular,specularPower);	
	specular *= input.reflection.w;		
#endif //PER_PIXEL_SPECULAR

	float3 specDiffuse = specularDiffuseAmount * colour.xyz;
	float3 specLight = directionalLights[0].colour;
	colour.xyz += colour.a * (specular*(specDiffuse+specLight));
#endif
	colour.xyz += colour.xyz * skyShade.xyz;
	return colour;
};

float4 ps11_diffuse( const VS_OUTPUT input ) : COLOR0
{	
	float4 layer0Map = tex2D( layer0Sampler, input.t0 );
	float4 layer1Map = tex2D( layer1Sampler, input.t1 );
	float4 layer2Map = tex2D( layer2Sampler, input.t2 );
	float4 layer3Map = tex2D( layer3Sampler, input.t3 );		
	float3 bx2Blend = 2.0*(input.blend.xyz-0.5);
	float blend0 = saturate(dot(bx2Blend,axis0));
	float blend1 = saturate(dot(bx2Blend,axis1));	
	float4 colour;	
	colour = blend0 * layer0Map;	
	colour += blend1 * layer1Map;
	colour += input.diffuse.a * layer2Map;
	colour += input.blend.a * layer3Map;	
	colour.xyz *= input.diffuse;	
	return colour;
};

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

#if TERRAIN_SPECULAR_ENABLE
float4 ps11_specular( const VS_OUTPUT11WITHFIX input ) : COLOR0
{	
	float3 normReflection = (texCUBE( normalisationSampler, input.reflection ) * 2) - 1;
	float3 normView = (texCUBE( normalisationSampler, input.view ) * 2) - 1;	
	float specular = saturate(dot(normReflection,normView));
	float4 colour;
	//can't have variable specular power on pixel shader 1.1
	specular = specularMultiplier * input.shade.x*pow(specular,4);
	colour.xyz = specular*directionalLights[0].colour;
	colour.w = 0.0;
	return colour;
};
#endif


//--------------------------------------------------------------//
// Technique Sections for shader hardware
//--------------------------------------------------------------//
technique shader_version_2_0
{
	pass Pass_0
	{
		BW_BLENDING_SOLID
		BW_FOG
		SPECULARENABLE = TRUE;
		CULLMODE = CCW;
		COLORWRITEENABLE = RED | BLUE | GREEN;
		
		VertexShader = compile vs_2_0 vs_spec();
		PixelShader = compile ps_2_0 ps20_main();
	}
}

technique shader_version_1_1
{
#if TERRAIN_SPECULAR_ENABLE
	pass Pass_Diffuse
	{
		BW_BLENDING_SOLID
		BW_FOG
		SPECULARENABLE = TRUE;
		CULLMODE = CCW;
		COLORWRITEENABLE = RED | BLUE | GREEN | ALPHA;
		
		VertexShader = compile vs_1_1 vs_main();
		PixelShader = compile ps_1_1 ps11_diffuse();
	}
	
	pass Pass_Specular
	{		
		ZWRITEENABLE = FALSE;
		DESTBLEND = ONE;
		SRCBLEND = DESTALPHA;
		FOGENABLE = FALSE;
		ALPHABLENDENABLE = TRUE;
		
		VertexShader = compile vs_1_1 vs_spec_11();
		PixelShader = compile ps_1_1 ps11_specular();
	}
	
	pass Pass_AlphaFix
	{		
		DESTBLEND = ZERO;
		SRCBLEND = ZERO;
		COLORWRITEENABLE = ALPHA;
		
		VertexShader = compile vs_1_1 vs_fixup();
		PixelShader = NULL;
	}
#else
	pass Pass_Diffuse
	{
		BW_BLENDING_SOLID
		BW_FOG
		SPECULARENABLE = TRUE;
		CULLMODE = CCW;
		COLORWRITEENABLE = RED | BLUE | GREEN;
		
		VertexShader = compile vs_1_1 vs_main();
		PixelShader = compile ps_1_1 ps11_diffuse();
	}
#endif
}


//--------------------------------------------------------------//
// Technique Section for fixed function hardware.
//--------------------------------------------------------------//
technique fixedFunction
{
	pass Pass_TextureLayer3
	{
		VertexShader = NULL;
		PixelShader = NULL;
		
		CULLMODE = CCW;
		
		ALPHATESTENABLE = FALSE;
		FOGENABLE = FALSE;
		ALPHABLENDENABLE = TRUE;
		SRCBLEND = SRCALPHA;		
		DESTBLEND = ZERO;
		DIFFUSEMATERIALSOURCE = COLOR1;		
		WORLDTRANSFORM[0] = <world>;
		VIEWTRANSFORM = <view>;
		PROJECTIONTRANSFORM = <proj>;
		SPECULARENABLE = FALSE;				
		ZWRITEENABLE = TRUE;
		ZFUNC = LESSEQUAL;
		ZENABLE = TRUE;
		LIGHTING = FALSE;		
		
		COLOROP[0] = SELECTARG1;
		COLORARG1[0] = TEXTURE;
		COLORARG2[0] = DIFFUSE;
		ALPHAOP[0] = SELECTARG2;
		ALPHAARG1[0] = TEXTURE;
		ALPHAARG2[0] = DIFFUSE;
		TEXTURE[0] = <Layer3>;		
		TEXCOORDINDEX[0] = CAMERASPACEPOSITION;
		TEXTURETRANSFORM[0] = <textransform>;
		TEXTURETRANSFORMFLAGS[0] = COUNT2;
		ADDRESSU[0] = WRAP;
		ADDRESSV[0] = WRAP;
		ADDRESSW[0] = WRAP;
		MAGFILTER[0] = LINEAR;
		MINFILTER[0] = LINEAR;
		MIPFILTER[0] = LINEAR;
		MAXMIPLEVEL[0] = 0;
		MIPMAPLODBIAS[0] = 0;		
		
		COLOROP[1] = DISABLE;
		ALPHAOP[1] = DISABLE;		
	}
	
	pass Pass_TextureLayer0
	{	
		CULLMODE = CCW;
		
		ZWRITEENABLE = FALSE;
		SRCBLEND = ONE;
		DESTBLEND = ONE;
		TEXTUREFACTOR = 0x8080ff;
		
		COLOROP[0] = DOTPRODUCT3;
		COLORARG1[0] = DIFFUSE;
		COLORARG2[0] = TFACTOR;
		ALPHAOP[0] = DISABLE;
		TEXTURE[0] = NULL;
		
		COLOROP[1] = MODULATE;
		COLORARG1[1] = TEXTURE;
		COLORARG2[1] = CURRENT;
		TEXTURE[1] = <Layer0>;
		TEXCOORDINDEX[1] = CAMERASPACEPOSITION;
		TEXTURETRANSFORM[1] = <textransform>;
		TEXTURETRANSFORMFLAGS[1] = COUNT2;
		ADDRESSU[1] = WRAP;
		ADDRESSV[1] = WRAP;
		ADDRESSW[1] = WRAP;
		MAGFILTER[1] = LINEAR;
		MINFILTER[1] = LINEAR;
		MIPFILTER[1] = LINEAR;
		MAXMIPLEVEL[1] = 0;
		MIPMAPLODBIAS[1] = 0;		
		
		COLOROP[2] = DISABLE;		
	}
	
	pass Pass_TextureLayer1
	{
		CULLMODE = CCW;
		
		TEXTUREFACTOR = 0x80ff80;
		TEXTURE[1] = <Layer1>;
	}
	
	pass Pass_TextureLayer2
	{
		CULLMODE = CCW;
		
		TEXTUREFACTOR = 0xff8080;
		TEXTURE[1] = <Layer2>;
	}
	
	pass Pass_Lighting
	{
		CULLMODE = CCW;
		
		SRCBLEND = DESTCOLOR;		
		DESTBLEND = ZERO;				
				
		LIGHTING = TRUE;
		LIGHTTYPE[0] = DIRECTIONAL;
		LIGHTDIFFUSE[0] = <directionalLights[0].colour>;
		LIGHTSPECULAR[0] = 0xffffffff;
		LIGHTAMBIENT[0] = 0xffffffff;
		LIGHTATTENUATION0[0] = 1.0;
		LIGHTATTENUATION1[0] = 0.0;
		LIGHTATTENUATION2[0] = 0.0;
		LIGHTDIRECTION[0] = <-directionalLights[0].direction>;
		
		LIGHTENABLE[0] = TRUE;				
		LIGHTENABLE[1] = FALSE;
		
		DIFFUSEMATERIALSOURCE = MATERIAL;
		MATERIALEMISSIVE = <ambientColour>;		
		MATERIALDIFFUSE = 0xFFFFFFFF;
		
		COLOROP[0] = SELECTARG2;
		COLORARG1[0] = TFACTOR;
		COLORARG2[0] = DIFFUSE;
		COLOROP[1] = DISABLE;
		ALPHAOP[0] = DISABLE;
		ALPHAOP[1] = DISABLE;
	}
	
	pass Pass_Fog
	{
		CULLMODE = CCW;
		
		SRCBLEND = SRCALPHA;
		DESTBLEND = INVSRCALPHA;
		LIGHTING = FALSE;
		
		TEXTUREFACTOR = <fogColour>;
		COLOROP[0] = SELECTARG2;
		COLORARG1[0] = TEXTURE;
		COLORARG2[0] = TFACTOR;
		ALPHAOP[0] = SELECTARG1;
		ALPHAARG1[0] = TEXTURE;
		ALPHAARG2[0] = CURRENT;
		ADDRESSU[0] = CLAMP;
		ADDRESSV[0] = CLAMP;
		ADDRESSW[0] = CLAMP;
		TEXTURETRANSFORM[0] = <fogTransform>;		
		TEXTURE[0] = <fogTexture>;
		COLOROP[1] = DISABLE;
		ALPHAOP[1] = DISABLE;
		
		VertexShader = NULL;
		PixelShader = NULL;
	}
}
