// sho_text_0010.c
// Generated by decompiling sho.exe
// using Reko decompiler version 0.10.0.0.

#include "sho.h"

// 0050AAA0: void fn0050AAA0(Stack Eq_3 dwArg04, Stack Eq_3 dwArg08, Stack Eq_3 dwArg0C)
// Called from:
//      fn00409AC0
//      fn004119C0
//      fn00411D40
//      fn00417890
//      fn0041DA20
//      fn006204B0
//      fn00620670
//      fn00622070
//      fn00622230
void fn0050AAA0(Eq_3 dwArg04, Eq_3 dwArg08, Eq_3 dwArg0C)
{
	int32 eax_7 = dwArg08 - dwArg04;
	Eq_25048 ecx_13 = (eax_7 >> 0x02) * 0x04;
	Eq_3 esi_14 = dwArg0C - ecx_13;
	if (eax_7 >> 0x02 > 0x00)
		memmove_s(esi_14, ecx_13, dwArg04, ecx_13);
}
