// sho_text_0042.c
// Generated by decompiling sho.exe
// using Reko decompiler version 0.10.0.0.

#include "sho.h"

// 0082ABF0: void fn0082ABF0(Register Eq_65628 eax, Stack word32 dwArg00)
// Called from:
//      fn006E8800
void fn0082ABF0(Eq_65628 eax, word32 dwArg00)
{
	uint32 eax_11 = (word32) eax + (((word32) fp + 4) - eax & 0x0F);
	ui32 eax_15 = eax_11 | 0x00 - (eax_11 < 0x00);
	fn006952A0(eax_15, dwArg00);
}

