float4x4 viewProj : ViewProjection;
float4 world[51] : WorldPalette;
float4x4 shadowProj : ShadowProjection;
float3 shadowDir : ShadowDir;
float shadowTexelSize;
float shadowIntensity = 1.f;
texture depthTexture;

float shadowDistance = 10.f;
float shadowFadeStart = 9.f;

int shadowQuality = 0;

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

struct VertexXYZIIIWW
{
	float4 pos : POSITION;
	float3 normal : NORMAL;
	float3 indices:	BLENDINDICES;
	float2 weights:	BLENDWEIGHT;
};

struct Output
{
	float4 pos : POSITION;
	float2 shadowUV : TEXCOORD;
	float depth : TEXCOORD1;
	float fadeout : TEXCOORD2;
	float3 worldNormal : TEXCOORD3;
};

Output vs_main( VertexXYZIIIWW input )
{
	Output o = (Output)0;

	int indices[3] = { input.indices.x * 256.5,
							input.indices.y * 256.5,
							input.indices.z * 256.5 };
							
	float weights[3] = { input.weights.x, input.weights.y, 1 - input.weights.y - input.weights.x };
	
	float4 worldPos = transformPos( input.pos, weights, indices );
	o.worldNormal = normalize(transformPos( float4(input.normal, 0), weights, indices ).xyz);
	
	o.pos = mul(worldPos, viewProj);
	
	float4 shadow = mul( worldPos, shadowProj );
	o.shadowUV = shadow.xy;
	o.depth = (1.f - shadow.z) * 1.006;

	float sf = shadowFadeStart;
	
	if (shadowDistance < (shadowFadeStart + 0.2))
		sf = shadowDistance - 0.2;
		
	o.fadeout = ( shadow.z - 1.f ) / ((sf - shadowDistance) / shadowDistance );
	return o;
}

sampler shadowSampler = sampler_state
{
	Texture = <depthTexture>;
	MIPFILTER = POINT;
	MAGFILTER = LINEAR;
	MINFILTER = LINEAR;
	ADDRESSU = CLAMP;
	ADDRESSV = CLAMP;
};

float2 uvOffset1 = float2( ((1.f/1024.f) * 0.5f), ((1.f/1024.f) * 0.5f) );
float2 uvOffset2 = float2( -((1.f/1024.f) * 0.5f), ((1.f/1024.f) * 0.5f) );

float2 uvOffset3 = float2( ((1.f/1024.f) * 1.5f), ((1.f/1024.f) * 0.5f) );
float2 uvOffset4 = float2( ((1.f/1024.f) * 1.5f), -((1.f/1024.f) * 0.5f) );
float2 uvOffset5 = float2( ((1.f/1024.f) * 0.5f), ((1.f/1024.f) * 1.5f) );
float2 uvOffset6 = float2( ((1.f/1024.f) * 0.5f), -((1.f/1024.f) * 1.5f) );
	
float2 uvOffset7 = float2( ((1.f/1024.f) * 1.5f), ((1.f/1024.f) * 1.5f) );
float2 uvOffset8 = float2( -((1.f/1024.f) * 1.5f), ((1.f/1024.f) * 1.5f) );
	
float4 ps_detail0( Output i ) : COLOR
{
	i.depth = max( i.depth, 0.01f );
	
	float fadeout = saturate(-dot(normalize(i.worldNormal), normalize(shadowDir)));
	
	float depthOn = tex2D( shadowSampler, i.shadowUV ).r > i.depth;
	depthOn *= saturate(i.fadeout) * shadowIntensity * fadeout;
	return float4( depthOn, depthOn, depthOn, depthOn );
}

float4 ps_detail1( Output i ) : COLOR
{
	i.depth = max( i.depth, 0.01f );
	
	float depthOn = tex2D( shadowSampler, i.shadowUV ).r > i.depth;
	depthOn += tex2D( shadowSampler, i.shadowUV - uvOffset1 ).r > i.depth;
	depthOn += tex2D( shadowSampler, i.shadowUV + uvOffset2 ).r > i.depth;
	depthOn += tex2D( shadowSampler, i.shadowUV - uvOffset2 ).r > i.depth;
	float fadeout = saturate(-dot(normalize(i.worldNormal), normalize(shadowDir)));
	depthOn *= saturate(i.fadeout) * shadowIntensity * (1.f / 4.f) * fadeout;
	return float4( depthOn, depthOn, depthOn, depthOn );
}

float4 ps_detail2( Output i ) : COLOR
{
	i.depth = max( i.depth, 0.01f );
	
	float depthOn = tex2D( shadowSampler, i.shadowUV ).r > i.depth;
	depthOn += tex2D( shadowSampler, i.shadowUV - uvOffset1 ).r > i.depth;
	depthOn += tex2D( shadowSampler, i.shadowUV + uvOffset2 ).r > i.depth;
	depthOn += tex2D( shadowSampler, i.shadowUV - uvOffset2 ).r > i.depth;
	depthOn *= 1.5f;
	depthOn += tex2D( shadowSampler, i.shadowUV + uvOffset3 ).r > i.depth;
	depthOn += tex2D( shadowSampler, i.shadowUV - uvOffset3 ).r > i.depth;
	depthOn += tex2D( shadowSampler, i.shadowUV + uvOffset4 ).r > i.depth;
	depthOn += tex2D( shadowSampler, i.shadowUV - uvOffset4 ).r > i.depth;
	depthOn += tex2D( shadowSampler, i.shadowUV + uvOffset5 ).r > i.depth;
	depthOn += tex2D( shadowSampler, i.shadowUV - uvOffset5 ).r > i.depth;
	depthOn += tex2D( shadowSampler, i.shadowUV + uvOffset6 ).r > i.depth;
	depthOn += tex2D( shadowSampler, i.shadowUV - uvOffset6 ).r > i.depth;
	float fadeout = saturate(-dot(normalize(i.worldNormal), normalize(shadowDir)));
	depthOn *= saturate(i.fadeout) * shadowIntensity * (1.f / 14.f) * fadeout;
	return float4( depthOn, depthOn, depthOn, depthOn );
}

PixelShader pixelShaders[3] =
{
	compile ps_2_0 ps_detail0(),
	compile ps_2_0 ps_detail1(),
	compile ps_2_0 ps_detail2()
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
		ALPHATESTENABLE = FALSE;
		ALPHAFUNC = GREATER;
		ALPHABLENDENABLE = TRUE;
		SRCBLEND = ZERO;
		DESTBLEND = INVSRCCOLOR;
/*		SRCBLEND = ONE;
		DESTBLEND = ZERO;*/
		ZENABLE = TRUE;
		ZWRITEENABLE = FALSE;
		ZFUNC = LESSEQUAL;
		CULLMODE = CCW;
		FOGENABLE=FALSE;
		VertexShader = compile vs_2_0 vs_main();
		PixelShader = (pixelShaders[ min(2,max(shadowQuality, 0) ) ]  );
	}
}
