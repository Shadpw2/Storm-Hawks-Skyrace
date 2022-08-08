#include "stdinclude.fxh"

// ----------------------------------------------------------------------------
// Section: Shader inputs
// ----------------------------------------------------------------------------

// Transformation matrix
float4x4	WorldViewProj;

// A global simulation damapening scalar.
float		dampening = 0.75;
// The impact strength defines an impact multiplier for the cookies
float		impactStrength = 1.0;
// Indicates the "cookie" drawing mode for the simulation movements.
int			perturb = 0;
// The edge is the neighbour currently influencing the simulation (only one at the moment)
// edge == -1 means no edge influences
int			edge = 0;

//TODO: optimise the constants.....
// These are the offsets for local texture sampling. They are set to be
// the size of one pixel in the texture.
float4		psSimulationTexCoordDelta_x0y1;
float4		psSimulationTexCoordDelta_x2y1;
float4		psSimulationTexCoordDelta_x1y0;
float4		psSimulationTexCoordDelta_x1y2;

// Verlet integration parameters... changing these will vary the effect of the
// simulations propagation.
float4		psSimulationPositionWeighting;
// The speed which waves in the simulation will move.
float		psSimulationWaveSpeedSquared;
// A constant for time.
float		psSimulationOneHalfTimesDeltaTimeSquared;
// Grid scaling parameter for the normal calculations.
float3		psSimulationGridSize;
// Delta Time.
float		psDeltaTime;

// ----------------------------------------------------------------------------
// Section: Textures
// ----------------------------------------------------------------------------

texture previousHeightMap;	// the previous height/normal map  
texture heightMap;			// the current height/normal map
texture cookieMap;			// shape of the movements for simulation

texture neighbourHeightMap0; // holds the Y0 neighbour sim
texture neighbourHeightMap1; // holds the X0 neighbour sim
texture neighbourHeightMap2; // holds the Y2 neighbour sim
texture neighbourHeightMap3; // holds the X2 neighbour sim

int X0_enabled = 0;
int X2_enabled = 0;
int Y0_enabled = 0;
int Y2_enabled = 0;

// ----------------------------------------------------------------------------
// Section: Samplers
// ----------------------------------------------------------------------------

sampler previousHeightSampler = sampler_state
{
	Texture = (previousHeightMap);

	ADDRESSU = CLAMP;
	ADDRESSV = CLAMP;

	MAGFILTER = POINT;
	MINFILTER = POINT;
};

sampler heightSampler = sampler_state
{
	Texture = (heightMap);

	ADDRESSU = CLAMP;
	ADDRESSV = CLAMP;

	MAGFILTER = POINT;
	MINFILTER = POINT;
};

sampler neighbourHeightSampler0 = sampler_state
{
	Texture = (neighbourHeightMap0);

	ADDRESSU = WRAP;
	ADDRESSV = WRAP;

	MAGFILTER = POINT;
	MINFILTER = POINT;
};
sampler neighbourHeightSampler1 = sampler_state
{
	Texture = (neighbourHeightMap1);

	ADDRESSU = WRAP;
	ADDRESSV = WRAP;

	MAGFILTER = POINT;
	MINFILTER = POINT;
};
sampler neighbourHeightSampler2 = sampler_state
{
	Texture = (neighbourHeightMap2);

	ADDRESSU = WRAP;
	ADDRESSV = WRAP;

	MAGFILTER = POINT;
	MINFILTER = POINT;
};
sampler neighbourHeightSampler3 = sampler_state
{
	Texture = (neighbourHeightMap3);

	ADDRESSU = WRAP;
	ADDRESSV = WRAP;

	MAGFILTER = POINT;
	MINFILTER = POINT;
};


sampler cookieSampler = sampler_state
{
	Texture = (cookieMap);

	BORDERCOLOR = 0x80808080;
	ADDRESSU = BORDER;
	ADDRESSV = BORDER;

	MAGFILTER = LINEAR;
	MINFILTER = LINEAR;

	MAXMIPLEVEL = 0;
	MIPMAPLODBIAS = 0;
};


// ----------------------------------------------------------------------------
// Section: Vertex Shaders
// ----------------------------------------------------------------------------

// Vertex shader output / pixel shader input declaration
struct PS_INPUT
{
  float4 position : POSITION;
  float2 texCoord : TEXCOORD0;
  float4 diffuse  : COLOR0;
};


/* 
 *	Vertex shader for drawing cookies to the simulation
 */
PS_INPUT vs_solid(float4 position : POSITION,
				 float4 diffuse  : COLOR0,
                 float2 texCoord : TEXCOORD0)
{
	PS_INPUT o = (PS_INPUT)0;
	
	o.position = mul( position, WorldViewProj );	
	o.diffuse = diffuse;	
	o.texCoord = texCoord;    	
	return(o);
}


/* 
 *	Vertex shader for drawing the simulation
 */
PS_INPUT vs_main(float4 position : POSITION,
				 float4 diffuse  : COLOR0,
                 float2 texCoord : TEXCOORD0)
{
	PS_INPUT o = (PS_INPUT)0;

	o.position = position;
	o.diffuse = diffuse;
	o.texCoord.xy = texCoord.xy;
	return(o);
}

// ----------------------------------------------------------------------------
// Section: Pixel shaders
// ----------------------------------------------------------------------------

/* 
 *	Calculates the new height value from the previous height and four
 *	samples.
 */
half calculateNewHeight(	half previousHeight,
							half height_x1y1,
							half height_x0y1, half height_x2y1,
							half height_x1y0, half height_x1y2 )
{
	// Compute the acceleration of the point based upon its neighbours
	half acceleration = dampening * psSimulationWaveSpeedSquared *
		(height_x0y1 + height_x2y1 + height_x1y0 + height_x1y2 - 4.0 * height_x1y1);

	// Do Verlet integration
	half newHeight = psSimulationPositionWeighting.x * height_x1y1 - 
				psSimulationPositionWeighting.y * previousHeight + 
				psSimulationOneHalfTimesDeltaTimeSquared * acceleration;	
				
	return newHeight;
}


/* 
 *	Calculates the normal from some height values.
 */
half3 calculateNormal(  half height_x1y1, half height_x2y1, half height_x1y2 )
{
	half3 dydx = half3(psSimulationGridSize.x, height_x2y1 - height_x1y1, 0.0);
	half3 dydz = half3(0.0, height_x1y2 - height_x1y1, -psSimulationGridSize.z);
	half3 normal = cross(dydx, dydz);
	normal = normalize(normal);	
	return normal;
}


/* 
 *	A pixel shader which calculates a water simulation with influence from
 *	all edges.
 */
half4 ps_main_edge_ALL(PS_INPUT i, 
					   uniform bool Y0,
					   uniform bool X0,
					   uniform bool Y2,
					   uniform bool X2) : COLOR
{
	// Look up all the neighbour heights	
	// central point sample
	half4 sampleCentre = tex2D(heightSampler, i.texCoord.xy);

	// X axis samples
	half4 sampleNegX;	
	if ( X0 && ((i.texCoord.x + psSimulationTexCoordDelta_x0y1.x) < 0.0) )
		sampleNegX = tex2D(neighbourHeightSampler1, i.texCoord.xy + psSimulationTexCoordDelta_x0y1.xy);
	else
		sampleNegX = tex2D(heightSampler, i.texCoord.xy + psSimulationTexCoordDelta_x0y1.xy);
	
	half4 samplePosX;
	if ( X2 && ((i.texCoord.x + psSimulationTexCoordDelta_x2y1.x) >= 1.0) )	
		samplePosX = tex2D(neighbourHeightSampler3, i.texCoord.xy + psSimulationTexCoordDelta_x2y1.xy);
	else
		samplePosX = tex2D(heightSampler, i.texCoord.xy + psSimulationTexCoordDelta_x2y1.xy);
	
	// Y axis samples
	half4 sampleNegY;
	if ( Y0 && ((i.texCoord.y + psSimulationTexCoordDelta_x1y0.y) < 0.0) )
		sampleNegY = tex2D(neighbourHeightSampler0, i.texCoord.xy + psSimulationTexCoordDelta_x1y0.xy);
	else
		sampleNegY = tex2D(heightSampler, i.texCoord.xy + psSimulationTexCoordDelta_x1y0.xy);
	
	half4 samplePosY;
	if ( Y2 && ((i.texCoord.y + psSimulationTexCoordDelta_x1y2.y) >= 1.0) )
		samplePosY = tex2D(neighbourHeightSampler2, i.texCoord.xy + psSimulationTexCoordDelta_x1y2.xy);
	else	
		samplePosY = tex2D(heightSampler, i.texCoord.xy + psSimulationTexCoordDelta_x1y2.xy);

	//previous height sample
	half4 samplePrevious  = tex2D(previousHeightSampler, i.texCoord.xy);

	return half4(	calculateNormal( sampleCentre.a, samplePosX.a, samplePosY.a ),
					calculateNewHeight(	samplePrevious.a, sampleCentre.a,
							sampleNegX.a, samplePosX.a, sampleNegY.a, samplePosY.a ) );
}

/* 
 *	A pixel shader which calculates a water simulation.
 */
half4 ps_main(PS_INPUT i) : COLOR
{
	// Look up all the neighbour heights	
	// central point sample
	half4 sampleCentre = tex2D(heightSampler, i.texCoord.xy);
	
	// X axis samples
	half4 sampleNegX = tex2D(heightSampler, i.texCoord.xy + psSimulationTexCoordDelta_x0y1.xy);	
	half4 samplePosX = tex2D(heightSampler, i.texCoord.xy + psSimulationTexCoordDelta_x2y1.xy);
	
	// Y axis samples
	half4 sampleNegY = tex2D(heightSampler, i.texCoord.xy + psSimulationTexCoordDelta_x1y0.xy);
	half4 samplePosY = tex2D(heightSampler, i.texCoord.xy + psSimulationTexCoordDelta_x1y2.xy);

	//previous height sample
	half4 samplePrevious  = tex2D(previousHeightSampler, i.texCoord.xy);

	return half4(	calculateNormal( sampleCentre.a, samplePosX.a, samplePosY.a ),
					calculateNewHeight(	samplePrevious.a, sampleCentre.a,
							sampleNegX.a, samplePosX.a, sampleNegY.a, samplePosY.a ) );
}


/* 
 * Pixel shader for the simulation impact cookie drawing
 */
half4 ps_solid(PS_INPUT i) : COLOR
{	
	float ret = (tex2D(cookieSampler, i.texCoord).r - 0.5);
	return float4(0, 1.0, 0, ret*psDeltaTime*impactStrength);
}

// ----------------------------------------------------------------------------
// Section: Techniques
// ----------------------------------------------------------------------------

PixelShader shaders[18] = {		compile ps_3_0 ps_main(),
								compile ps_3_0 ps_solid(),

								compile ps_3_0 ps_main_edge_ALL(false,false,false,false),
								compile ps_3_0 ps_main_edge_ALL(false,false,false,true),
								compile ps_3_0 ps_main_edge_ALL(false,false,true,false),
								compile ps_3_0 ps_main_edge_ALL(false,false,true,true),
								
								compile ps_3_0 ps_main_edge_ALL(false,true,false,false),
								compile ps_3_0 ps_main_edge_ALL(false,true,false,true),
								compile ps_3_0 ps_main_edge_ALL(false,true,true,false),
								compile ps_3_0 ps_main_edge_ALL(false,true,true,true),

								compile ps_3_0 ps_main_edge_ALL(true,false,false,false),
								compile ps_3_0 ps_main_edge_ALL(true,false,false,true),
								compile ps_3_0 ps_main_edge_ALL(true,false,true,false),
								compile ps_3_0 ps_main_edge_ALL(true,false,true,true),
								
								compile ps_3_0 ps_main_edge_ALL(true,true,false,false),
								compile ps_3_0 ps_main_edge_ALL(true,true,false,true),
								compile ps_3_0 ps_main_edge_ALL(true,true,true,false),
								compile ps_3_0 ps_main_edge_ALL(true,true,true,true)
								
								};
								

VertexShader vshaders[2] = {	compile vs_3_0 vs_main(), 
								compile vs_3_0 vs_solid() };

int psIndexALL( int _perturb, int y0, int x0, int y2, int x2, int _edge )
{
	int idx=0;
	if (_perturb > 0)
	{
		idx = 1;
	}
	else if (_edge != 0)
	{
		idx = 2 + (y0*8 + x0*4 + y2*2 + x2);
	}
	return idx;
}

technique water_simulation
{
	pass Pass_0
	{
		ALPHABLENDENABLE = (perturb==1 ? 1 : 0);
		SRCBLEND = ONE;
		DESTBLEND = (perturb==1 ? 2 : 1);
		ZENABLE = FALSE;
		ZWRITEENABLE = FALSE;		
		CULLMODE = NONE;

		VertexShader = (vshaders[perturb]);
		PixelShader = (shaders[psIndexALL(perturb,Y0_enabled,X0_enabled,Y2_enabled,X2_enabled, edge)]);
	}
}

// A dummy technique so the shader wont put out warnings on machines
// that dont have shader model 3 capabilities.
technique dummy
{
	pass Pass_0
	{
		VertexShader = NULL;
		PixelShader = NULL;
	}
}
