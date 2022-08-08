float4 FilterCoefficents;
bool AlphaBlendPass;
texture diffuseMap;

sampler diffuseSampler = sampler_state
{
	Texture = (diffuseMap);
	ADDRESSU = CLAMP;
	ADDRESSV = CLAMP;
	ADDRESSW = CLAMP;
	MAGFILTER = LINEAR;
	MINFILTER = LINEAR;
	MIPFILTER = NONE;
	MAXMIPLEVEL = 0;
	MIPMAPLODBIAS = 0;
};

struct PS_INPUT
{
	float2 tc0		: TEXCOORD0;
	float2 tc1		: TEXCOORD1;
	float2 tc2		: TEXCOORD2;
	float2 tc3		: TEXCOORD3;
};

float4 main( PS_INPUT v ) : COLOR
{
	float3 map0 = tex2D( diffuseSampler, v.tc0 );
	float3 map1 = tex2D( diffuseSampler, v.tc1 );
	float3 map2 = tex2D( diffuseSampler, v.tc2 );
	float3 map3 = tex2D( diffuseSampler, v.tc3 );

	float3 result0 = map1 * FilterCoefficents[1];
	result0 = saturate( (FilterCoefficents[0] * map0) + result0 );

	float3 result1 = map3 * FilterCoefficents[3];
	result1 = saturate( (FilterCoefficents[2] * map2) + result1 );

	float3 result = result0 + result1;
	
	return float4( result, 1 );
};

technique standard
{
	pass Pass_0
	{
		ZENABLE = FALSE;
		ZWRITEENABLE = FALSE;
		ALPHABLENDENABLE = <AlphaBlendPass>;
		ALPHATESTENABLE = FALSE;
		//need this to output alpha of 1 to render target
		COLORWRITEENABLE = RED | GREEN | BLUE | ALPHA;
		CULLMODE = NONE;
		FOGENABLE = FALSE;
		SRCBLEND = ONE;
		DESTBLEND = INVSRCCOLOR;
		
		VertexShader = NULL;
		PixelShader = compile ps_1_1 main();
	}
}