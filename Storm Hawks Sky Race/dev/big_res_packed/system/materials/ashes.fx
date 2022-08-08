#include "stdinclude.fxh"

// Auto variables
float4x4 worldViewProj :  WorldViewProjection;
float4	 factor : GUIColour;

// Manual variables
texture diffuseMap = NULL;
float4  diffuseColour = (1,1,1,1);
int     filterType = 2; // linear filtering


sampler clampSampler = sampler_state
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


OutputDiffuseLighting vs_main( VertexXYZDUV input )
{
	OutputDiffuseLighting o = (OutputDiffuseLighting)0;

	o.pos = mul(input.pos, worldViewProj);
	o.tc = input.tc;
	o.diffuse = diffuseColour;
	
	return o;
}


// Define for common states used in all blending modes
#define COMMONSTATES\
ZENABLE = FALSE;\
FOGENABLE = FALSE;\
CULLMODE = NONE;

// The pixel operation defines
#define COMMONPARTS\
TexCoordIndex[0] = 0;\
TexCoordIndex[1] = 1;\
Texture[0] = (diffuseMap);\
ADDRESSU[0] = CLAMP;\
ADDRESSV[0] = CLAMP;\
ADDRESSW[0] = CLAMP;\
MAGFILTER[0] = (filterType);\
MINFILTER[0] = (filterType);\
MIPFILTER[0] = (filterType);\
MAXMIPLEVEL[0] = 0;\
MIPMAPLODBIAS[0] = 0;\
ColorOp[1] = MODULATE;\
ColorArg1[1] = TFACTOR;\
ColorArg2[1] = CURRENT;\
AlphaOp[1] = MODULATE;\
AlphaArg1[1] = TFACTOR;\
AlphaArg2[1] = CURRENT;\
ColorOp[2] = DISABLE;\
AlphaOp[2] = DISABLE;\
TextureFactor = (factor);\
PixelShader = NULL;

#define PIXELOPMOD1 \
ColorOp[0] = MODULATE;\
ColorArg1[0] = TEXTURE;\
ColorArg2[0] = DIFFUSE;\
AlphaOp[0] = MODULATE;\
AlphaArg1[0] = TEXTURE;\
AlphaArg2[0] = DIFFUSE;\
COMMONPARTS

#define PIXELOPMOD2 \
ColorOp[0] = MODULATE2X;\
ColorArg1[0] = TEXTURE;\
ColorArg2[0] = DIFFUSE;\
AlphaOp[0] = MODULATE2X;\
AlphaArg1[0] = TEXTURE;\
AlphaArg2[0] = DIFFUSE;\
COMMONPARTS

//--------------------------------------------------------------//
// Technique Section for standard
//--------------------------------------------------------------//
technique FX_ADD
{
   pass Pass_0
   {
      COMMONSTATES
      ALPHATESTENABLE = FALSE;
      SRCBLEND = SRCALPHA;
      DESTBLEND = ONE;
      ALPHABLENDENABLE = TRUE;

      VertexShader = compile vs_1_1 vs_main();
      PIXELOPMOD1
   }

}

technique FX_BLEND
{
   pass Pass_0
   {
      COMMONSTATES
      ALPHATESTENABLE = FALSE;
      SRCBLEND = SRCALPHA;
      DESTBLEND = INVSRCALPHA;
      ALPHABLENDENABLE = TRUE;

      VertexShader = compile vs_1_1 vs_main();
      PIXELOPMOD1
   }

}

technique FX_BLEND_COLOUR
{
   pass Pass_0
   {
      COMMONSTATES
      ALPHATESTENABLE = FALSE;
      SRCBLEND = SRCCOLOR;
      DESTBLEND = INVSRCCOLOR;
      ALPHABLENDENABLE = TRUE;

      VertexShader = compile vs_1_1 vs_main();
      PIXELOPMOD1
   }

}

technique FX_BLEND_INVERSE_COLOUR
{
   pass Pass_0
   {
      COMMONSTATES
      ALPHATESTENABLE = FALSE;
      SRCBLEND = INVSRCCOLOR;
      DESTBLEND = SRCCOLOR;
      ALPHABLENDENABLE = TRUE;

      VertexShader = compile vs_1_1 vs_main();
      PIXELOPMOD1
   }

}

technique FX_SOLID
{
   pass Pass_0
   {
      COMMONSTATES
      ALPHATESTENABLE = FALSE;
      SRCBLEND = ONE;
      DESTBLEND = ZERO;
      ALPHABLENDENABLE = FALSE;

      VertexShader = compile vs_1_1 vs_main();
      PIXELOPMOD1
   }

}

technique FX_MODULATE2X
{
   pass Pass_0
   {
      COMMONSTATES
      ALPHATESTENABLE = FALSE;
      SRCBLEND = ONE;
      DESTBLEND = ZERO;
      ALPHABLENDENABLE = FALSE;

      VertexShader = compile vs_1_1 vs_main();
      PIXELOPMOD2
   }
}

technique FX_ALPHA_TEST
{
   pass Pass_0
   {
      COMMONSTATES
      ALPHATESTENABLE = TRUE;
      ALPHAREF = 1;
      SRCBLEND = ONE;
      DESTBLEND = ZERO;
      ALPHABLENDENABLE = FALSE;

      VertexShader = compile vs_1_1 vs_main();
      PIXELOPMOD1
   }
}

technique FX_BLEND_INVERSE_ALPHA
{
   pass Pass_0
   {
      COMMONSTATES
      ALPHATESTENABLE = FALSE;
      SRCBLEND = INVSRCALPHA;
      DESTBLEND = SRCALPHA;
      ALPHABLENDENABLE = TRUE;

      VertexShader = compile vs_1_1 vs_main();
      PIXELOPMOD2
   }

}

technique FX_BLEND2X
{
   pass Pass_0
   {
      COMMONSTATES
      ALPHATESTENABLE = FALSE;
      SRCBLEND = SRCALPHA;
      DESTBLEND = INVSRCALPHA;
      ALPHABLENDENABLE = TRUE;

      VertexShader = compile vs_1_1 vs_main();
      PIXELOPMOD2
   }

}

technique FX_ADD_SIGNED
{
   pass Pass_0
   {
      COMMONSTATES
      ALPHATESTENABLE = FALSE;
      SRCBLEND = DESTCOLOR;
      DESTBLEND = SRCCOLOR;
      ALPHABLENDENABLE = TRUE;	  

      VertexShader = compile vs_1_1 vs_main();      
      PIXELOPMOD1
   }
}
