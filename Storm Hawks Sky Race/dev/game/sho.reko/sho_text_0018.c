// sho_text_0018.c
// Generated by decompiling sho.exe
// using Reko decompiler version 0.10.0.0.

#include "sho.h"

// 00581360: void fn00581360(Stack Eq_3 dwArg04, Stack Eq_3 dwArg08, Stack Eq_3 dwArg0C)
// Called from:
//      fn005A5370
void fn00581360(Eq_3 dwArg04, Eq_3 dwArg08, Eq_3 dwArg0C)
{
	Eq_3 eax_16 = dwArg04;
	if (dwArg04 != dwArg08)
	{
		do
		{
			*eax_16 = *dwArg0C;
			*((word32) eax_16 + 4) = *((word32) dwArg0C + 4);
			*((word32) eax_16 + 8) = *((word32) dwArg0C + 8);
			*((word32) eax_16 + 0x0C) = *((word32) dwArg0C + 0x0C);
			eax_16 = (word32) eax_16 + 16;
		} while (eax_16 != dwArg08);
	}
}
