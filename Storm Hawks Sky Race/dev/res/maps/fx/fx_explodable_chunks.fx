texture diffuseMap < bool artistEditable = true;  >;

technique EffectOverride
{
	pass Pass_0
	{
		TextureFactor = -1;
		ZWriteEnable = TRUE;
		AlphaRef = 162;
		CullMode = NONE;
		SrcBlend = ONE;
		AlphaBlendEnable = FALSE;
		ColorWriteEnable = RED | GREEN | BLUE;
		DestBlend = ZERO;
		AlphaTestEnable = TRUE;
		ZEnable = True;
		ZFunc = LESSEQUAL;
		AlphaFunc = GREATER;

		MipFilter[0] = LINEAR;
		MinFilter[0] = LINEAR;
		AlphaOp[0] = SELECTARG1;
		MagFilter[0] = LINEAR;
		ColorArg1[0] = TEXTURE;
		ColorArg2[0] = DIFFUSE;
		ColorOp[0] = MODULATE;
		AddressW[0] = WRAP;
		AddressV[0] = WRAP;
		Texture[0] = (diffuseMap);
		AddressU[0] = WRAP;
		AlphaArg1[0] = TEXTURE;
		AlphaArg2[0] = DIFFUSE;
		TexCoordIndex[0] = 0;

		AlphaOp[1] = DISABLE;
		ColorOp[1] = DISABLE;

		PixelShader = NULL;
	}
}

