// sho_text_0014.c
// Generated by decompiling sho.exe
// using Reko decompiler version 0.10.0.0.

#include "sho.h"

// 005410E0: void fn005410E0(Stack Eq_3 dwArg04, Stack Eq_3 dwArg08, Stack Eq_3 dwArg0C)
// Called from:
//      fn00411980
//      fn00412EF0
void fn005410E0(Eq_3 dwArg04, Eq_3 dwArg08, Eq_3 dwArg0C)
{
	Eq_3 edx_32 = dwArg08;
	if (dwArg08 > 0x00)
	{
		Eq_3 eax_10 = dwArg04;
		do
		{
			if (eax_10 != 0x00)
			{
				word32 ecx_25;
				Eq_3 esi_27 = dwArg0C;
				Eq_3 edi_28 = eax_10;
				for (ecx_25 = 0x10; ecx_25 != 0x00; --ecx_25)
				{
					*edi_28 = *esi_27;
					esi_27 = (word32) esi_27 + 4;
					edi_28 = (word32) edi_28 + 4;
				}
			}
			--edx_32;
			eax_10 = (word32) eax_10 + 64;
		} while (edx_32 > 0x00);
	}
}

