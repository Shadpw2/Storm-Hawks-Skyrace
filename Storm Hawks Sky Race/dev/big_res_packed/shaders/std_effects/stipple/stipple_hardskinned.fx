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

struct VertexXYZI
{
	float4 pos : POSITION;
	float index:	BLENDINDICES;
};

struct Output
{
	float4 pos : POSITION;
	float4 screenPos : TEXCOORD;
};

Output vs_main( VertexXYZI input )
{
	Output o = (Output)0;

	float4 worldPos = float4(transformPos( input.pos, input.index ), 1);
	
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
