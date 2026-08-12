#include "stdinclude.fxh"

// Auto variables
float4x4 worldViewProj :  WorldViewProjection;

// Manual variables
float4  diffuseColour = (1,1,1,1);


OutputDiffuseLighting vs_main( VertexXYZL input )
{
	OutputDiffuseLighting o = (OutputDiffuseLighting)0;

	o.pos = mul(input.pos, worldViewProj);
	o.diffuse = diffuseColour;
	
	return o;
}

//--------------------------------------------------------------//
// Technique Section for standard
//--------------------------------------------------------------//
technique standard
{
   pass Pass_0
   {
      ALPHATESTENABLE = FALSE;
      SRCBLEND = ONE;
      DESTBLEND = ONE;
      ZENABLE = TRUE;
      ZWRITEENABLE = FALSE;
      ZFUNC = LESSEQUAL;
      FOGENABLE = FALSE;
      ALPHABLENDENABLE = TRUE;
      COLORWRITEENABLE = RED | GREEN | BLUE;
      POINTSPRITEENABLE = FALSE;
      STENCILENABLE = FALSE;
      
      ColorOp[0] = SELECTARG1;
      ColorArg1[0] = DIFFUSE;
      ColorArg2[0] = CURRENT;
      AlphaOp[0] = SELECTARG1;
      AlphaArg1[0] = DIFFUSE;
      AlphaArg2[0] = CURRENT;
      ColorOp[0] = DISABLE;
      AlphaOp[0] = DISABLE;

      VertexShader = compile vs_1_1 vs_main();
      PixelShader = NULL;
   }
}
