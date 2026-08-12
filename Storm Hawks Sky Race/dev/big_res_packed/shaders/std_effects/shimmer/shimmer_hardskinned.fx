float4x4 viewProj : ViewProjection;
float4 world[51] : WorldPalette;

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
	float depth : TEXCOORD;
};

Output vs_main( VertexXYZI input )
{
	Output o = (Output)0;

	float4 worldPos = float4(transformPos( input.pos, input.index ), 1);
	
	o.pos = mul(worldPos, viewProj);
	o.depth = 1.f - o.pos.z;

	return o;
}

float4 ps_main( Output i ) : COLOR
{
	return float4(1,1,1,1);
	//return float4( i.depth, i.depth, i.depth, i.depth );
}

//--------------------------------------------------------------//
// Technique Section for standard
//--------------------------------------------------------------//
technique standard
<
	string channel = "shimmer";
	bool skinned = true;
>
{
	pass Pass_0
	{
		ALPHATESTENABLE = FALSE;		
		ALPHABLENDENABLE = TRUE;
		SRCBLEND = ONE;
		DESTBLEND = ONE;
		ZENABLE = TRUE;
		ZWRITEENABLE = FALSE;
		ZFUNC = LESSEQUAL;
		CULLMODE = NONE;
		VertexShader = compile vs_1_1 vs_main();
		PixelShader = compile ps_1_1 ps_main();
	}
}
