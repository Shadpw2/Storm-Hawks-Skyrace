float4x4 viewProj : ViewProjection;
float4 world[51] : WorldPalette;

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
	float depth : TEXCOORD;
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
