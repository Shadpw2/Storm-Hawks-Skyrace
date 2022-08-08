// Exposed artist editable variables.
texture diffuseMap
< 
bool artistEditable = true; 
string UIName = "Diffuse Map";
string UIDesc = "The map to use for the sky dome";
>;

texture fogMap
< 
bool artistEditable = true; 
string UIName = "Fog Mask";
string UIDesc = "The map that defines how much fogging is applied to the sky dome";
>;

// Auto Variables
float4x4 environmentTransform : EnvironmentTransform;
int occlusionTest : EnvironmentOcclusionTest;
int occlusionAlphaRef : EnvironmentOcclusionAlphaRef;

// Vertex Formats
struct VertexXYZNUV
{
   float4 pos:		POSITION;
   float3 normal:	NORMAL;
   float2 tc:		TEXCOORD0;
};

struct OutputDiffuseLighting
{
	float4 pos: POSITION;
	float2 tc0: TEXCOORD0;
	float2 tc1: TEXCOORD1;	
};


float fogStart : FogStart = 0.0;
float fogEnd : FogEnd = 1.0;
float4 fogColour : FogColour = {0,0,0,0};
bool fogEnabled : FogEnabled = true;

OutputDiffuseLighting vs_main( VertexXYZNUV input )
{
	OutputDiffuseLighting o = (OutputDiffuseLighting)0;

	o.pos = mul(input.pos, environmentTransform);
	o.pos.z = o.pos.w;
	o.tc0 = input.tc;
	o.tc1 = input.tc;
	
	return o;
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

sampler fogMapSampler = sampler_state
{
	Texture = (fogMap);
	ADDRESSU = CLAMP;
	ADDRESSV = CLAMP;
	ADDRESSW = CLAMP;
	MAGFILTER = LINEAR;
	MINFILTER = LINEAR;
	MIPFILTER = LINEAR;
	MAXMIPLEVEL = 0;
	MIPMAPLODBIAS = 0;
};


//blend between the skybox map and the fog colour based on the fog gradient map
float4 ps_main( OutputDiffuseLighting i ) : COLOR0
{
	float4 diffuseMap = tex2D( diffuseSampler, i.tc0 );
	float4 fogAmount;

	if (fogEnabled)
		fogAmount = tex2D( fogMapSampler, i.tc1 );
	else
		fogAmount = float4(0,0,0,0);

	float4 colour;
	colour.xyz = (float3(1,1,1) - fogAmount.xyz) * diffuseMap.xyz;
	colour.xyz += (fogColour.xyz * fogAmount.xyz);
	colour.w = diffuseMap.w;

	return colour;
}

//occlusion test shader
float4 ps_occlusion( OutputDiffuseLighting i ) : COLOR0
{
	float4 diffuseMap = tex2D( diffuseSampler, i.tc0 );	
	return diffuseMap;
}


PixelShader pixelShaders[2] = 
{
	compile ps_1_1 ps_main(),
	compile ps_1_1 ps_occlusion()
};


//return the alpha reference for the technique.
int alphaReference()
{
	if (!occlusionTest)
		return 0;		
	else
		return occlusionAlphaRef;
};


//The pixel shader version turns off fogging with the engine.
technique pixelShader1_1
{
   pass Pass_0
   {
      ALPHATESTENABLE = (occlusionTest);      
      ALPHAREF = alphaReference();      
      ZENABLE = (1-occlusionTest);
      SRCBLEND = SRCALPHA;
      DESTBLEND = INVSRCALPHA;
      ZWRITEENABLE = FALSE;
      ZFUNC = LESSEQUAL;
      FOGENABLE = FALSE;
      ALPHABLENDENABLE = TRUE;      
      POINTSPRITEENABLE = FALSE;
      STENCILENABLE = FALSE;
	  CULLMODE = NONE;

      VertexShader = compile vs_1_1 vs_main();
      PixelShader = (pixelShaders[occlusionTest]);
   }
}


//The fixed function version cannot turn off fogging.
technique fixedFunction
{
   pass Pass_0
   {
      ALPHATESTENABLE = (occlusionTest);
      ALPHAREF = alphaReference();      
      ZENABLE = (1-occlusionTest);
      SRCBLEND = SRCALPHA;
      DESTBLEND = INVSRCALPHA;
      ZWRITEENABLE = FALSE;
      ZFUNC = LESSEQUAL;
      FOGENABLE = FALSE;
      ALPHABLENDENABLE = TRUE;      
      POINTSPRITEENABLE = FALSE;
      STENCILENABLE = FALSE;
	  CULLMODE = NONE;
      TEXTUREFACTOR = <fogColour>;
      
      //stage 0 - diffuse
      ColorOp[0] = SELECTARG1;
      ColorArg1[0] = TEXTURE;
      ColorArg2[0] = CURRENT;
      AlphaOp[0] = SELECTARG1;
      AlphaArg1[0] = TEXTURE;
      AlphaArg2[0] = CURRENT;
      Texture[0] = <diffuseMap>;
      ADDRESSU[0] = CLAMP;
      ADDRESSV[0] = CLAMP;
      ADDRESSW[0] = CLAMP;
      
      //stage 1 - fog
      ColorOp[1] = LERP;      
      ColorArg1[1] = TFACTOR;
      ColorArg2[1] = CURRENT;
      ColorArg0[1] = TEXTURE;
      AlphaOp[1] = SELECTARG1;
      AlphaArg1[1] = CURRENT;
      AlphaArg2[1] = CURRENT;
      Texture[1] = <fogMap>;
      
      ColorOp[2] = DISABLE;
      AlphaOp[2] = DISABLE;

      VertexShader = compile vs_1_1 vs_main();
      PixelShader = NULL;
   }
}