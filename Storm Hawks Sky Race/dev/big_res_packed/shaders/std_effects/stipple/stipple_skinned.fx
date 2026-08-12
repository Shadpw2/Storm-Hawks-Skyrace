#include "stipple_include.fxh"

float4x4 viewProj : ViewProjection;
float4 world[51] : WorldPalette;
float4 screen : Screen;
texture stippleMap : StippleMap;

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
	float3 indices:	BLENDINDICES;
	float2 weights:	BLENDWEIGHT;
};

struct Output
{
	float4 pos : POSITION;
	float4 screenPos : TEXCOORD;
};

Output vs_main( VertexXYZIIIWW input )
{
	Output o = (Output)0;

	int indices[3] = { input.indices.x * 256.5,
							input.indices.y * 256.5,
							input.indices.z * 256.5 };
							
	float weights[3] = { input.weights.x, input.weights.y, 1 - input.weights.y - input.weights.x };
	
	float4 worldPos = transformPos( input.pos, weights, indices );
	
	o.pos = mul(worldPos, viewProj);
	o.screenPos = o.pos;

	return o;
}

STIPPLE_SAMPLER_DECLARE

float4 ps_main( Output i ) : COLOR
{
	float2 uv;
	STIPPLE_UV_COORDS( i.screenPos, uv );	
	return tex2D( stippleSampler, uv );	
}


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
		ALPHATESTENABLE = TRUE;		
		ALPHAREF = 127;
		ALPHABLENDENABLE = FALSE;
		SRCBLEND = ONE;
		DESTBLEND = ZERO;
		ZENABLE = TRUE;
		ZWRITEENABLE = TRUE;
		ZFUNC = LESSEQUAL;
		CULLMODE = NONE;
		FOGENABLE = FALSE;
		VertexShader = compile vs_2_0 vs_main();
		PixelShader = compile ps_2_0 ps_main();
	}
}
