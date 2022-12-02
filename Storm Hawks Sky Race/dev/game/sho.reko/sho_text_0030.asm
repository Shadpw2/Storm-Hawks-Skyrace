;;; Segment .text (00401000)

l00701003:
	push	ecx
	push	ebp
	sub	ebp,[esp+18h]
	push	ebp
	push	eax
	push	edx
	push	8D6B70h
	call	edi
	add	eax,40h
	push	eax
	call	ebx
	add	esp,1Ch

l0070101C:
	cmp	dword ptr [0A74AF0h],1h
	jle	70108Fh

l00701025:
	mov	eax,[0A6CD2Ch]
	test	eax,eax
	mov	[esp+10h],eax
	jz	70108Fh

l00701032:
	mov	esi,[esp+10h]
	add	esi,8h
	mov	ebp,3Eh
	mov	edi,edi

l00701040:
	cmp	dword ptr [esi+4h],0A1E4B8h
	jnz	701079h

l00701049:
	cmp	dword ptr [esi],0h
	jz	701079h

l0070104E:
	push	0Ch
	push	64h
	mov	edx,esi
	lea	ecx,[esp+20h]
	call	6FF4A0h
	mov	ecx,[esi]
	add	esp,8h
	lea	eax,[esp+18h]
	push	eax
	push	ecx
	push	esi
	push	8D6B48h
	call	edi
	add	eax,40h
	push	eax
	call	ebx
	add	esp,14h

l00701079:
	add	esi,10h
	sub	ebp,1h
	jnz	701040h

l00701081:
	mov	edx,[esp+10h]
	mov	eax,[edx]
	test	eax,eax
	mov	[esp+10h],eax
	jnz	701032h

l0070108F:
	mov	ecx,[esp+7Ch]
	pop	edi
	pop	esi
	pop	ebp
	pop	ebx
	xor	ecx,esp
	call	694B8Eh
	add	esp,70h
	ret
007010A2       CC CC CC CC CC CC CC CC CC CC CC CC CC CC   ..............
007010B0 A1 28 CD A6 00 83 EC 0C 85 C0 0F 85 7A 01 00 00 .(..........z...
007010C0 39 44 24 1C 56 8B 74 24 1C 57 BF 01 00 00 00 74 9D$.V.t$.W.....t
007010D0 06 83 C6 03 83 CF FF DD 44 24 18 53 D9 EE DF F1 ........D$.S....
007010E0 76 06 B3 01 D9 E0 EB 02 32 DB 8D 44 24 0C 50 83 v.......2..D$.P.
007010F0 EC 08 DD 1C 24 FF 15 D0 46 8A 00 DD 05 50 B8 8A ....$...F....P..
00701100 00 83 C4 0C D9 C9 DB F1 DD D9 D9 E8 72 3D DB F1 ............r=..
00701110 76 39 8B 4C 24 0C D9 C9 83 E9 01 DC C0 81 F9 80 v9.L$...........
00701120 00 00 00 89 4C 24 0C 0F 8D C9 00 00 00 83 F9 82 ....L$..........
00701130 7D 48 83 C1 7E DD D9 51 83 EC 08 DD 1C 24 FF 15 }H..~..Q.....$..
00701140 1C 47 8A 00 83 C4 0C 33 C9 EB 37 D9 C1 D9 EE D9 .G.....3..7.....
00701150 C9 DF E9 DD D8 9F F6 C4 44 0F 8A B9 00 00 00 33 ........D......3
00701160 C9 D9 C9 D9 C0 D9 EE D9 C9 DF E9 DD D8 9F F6 C4 ................
00701170 44 7B 0D 83 C1 7F DE E1 EB 08 85 C9 75 F5 EB E3 D{..........u...
00701180 DD D9 DC 0D F8 6B 8D 00 D9 7C 24 0C 0F B7 44 24 .....k...|$...D$
00701190 0C DC 05 50 B8 8A 00 0D 00 0C 00 00 89 44 24 10 ...P.........D$.
007011A0 D9 6C 24 10 DF 7C 24 10 8B 44 24 10 A9 00 00 80 .l$..|$..D$.....
007011B0 FF D9 6C 24 0C 74 11 83 C1 01 33 C0 81 F9 FF 00 ..l$.t....3.....
007011C0 00 00 89 4C 24 0C 7D 32 8B D1 D1 FA C0 E3 07 0A ...L$.}2........
007011D0 D3 88 16 8B D0 C0 E1 07 03 F7 C1 EA 10 0A D1 88 ................
007011E0 16 03 F7 8B C8 C1 E9 08 88 0E 88 04 37 5B 5F 33 ............7[_3
007011F0 C0 5E 83 C4 0C C3 DD D8 DD D8 8B 0D 98 85 A1 00 .^..............
00701200 68 D0 6B 8D 00 51 E8 75 FD FD FF 83 C4 08 5B 5F h.k..Q.u......[_
00701210 83 C8 FF 5E 83 C4 0C C3 8B 15 20 87 A1 00 DD D9 ...^...... .....
00701220 68 B4 6B 8D 00 DD D8 52 E8 53 FD FD FF 83 C4 08 h.k....R.S......
00701230 5B 5F 83 C8 FF 5E 83 C4 0C C3 83 F8 02 DD 44 24 [_...^........D$
00701240 10 D9 1C 24 B9 01 00 00 00 75 32 83 7C 24 1C 00 ...$.....u2.|$..
00701250 74 37 8B 44 24 18 0F B6 14 24 88 10 0F B6 54 24 t7.D$....$....T$
00701260 01 88 14 08 0F B6 54 24 02 03 C1 03 C1 88 10 0F ......T$........
00701270 B6 54 24 03 88 14 01 33 C0 83 C4 0C C3 83 F8 01 .T$....3........
00701280 75 D0 83 7C 24 1C 00 74 C9 8B 44 24 18 83 C0 03 u..|$..t..D$....
00701290 83 C9 FF EB C1 CC CC CC CC CC CC CC CC CC CC CC ................

;; fn007012A0: 007012A0
;;   Called from:
;;     007361A4 (in fn00735890)
;;     007361FE (in fn00735890)
;;     00736395 (in fn00735890)
fn007012A0 proc
	mov	eax,[0A6CD1Ch]
	sub	esp,0Ch
	test	eax,eax
	jnz	7014ADh

l007012B0:
	cmp	[esp+1Ch],eax
	push	esi
	mov	esi,[esp+1Ch]
	push	edi
	mov	edi,1h
	jz	7012C7h

l007012C1:
	add	esi,7h
	or	edi,0FFh

l007012C7:
	fld	double ptr [esp+18h]
	push	ebx
	fldz
	fcomip	st(0),st(1)
	jbe	7012D8h

l007012D2:
	mov	bl,1h
	fchs
	jmp	7012DAh

l007012D8:
	xor	bl,bl

l007012DA:
	lea	eax,[esp+0Ch]
	push	eax
	sub	esp,8h
	fstp	double ptr [esp]
	call	dword ptr [8A46D0h]
	fld	double ptr [8AB850h]
	add	esp,0Ch
	fxch	st(0),st(1)
	fcomi	st(0),st(1)
	fstp	st(1)
	fld1
	jc	701341h

l007012FE:
	fcomi	st(0),st(1)
	jbe	701341h

l00701302:
	mov	edx,[esp+0Ch]
	fxch	st(0),st(1)
	sub	edx,1h
	fadd	st(0),st(0)
	cmp	edx,400h
	mov	[esp+0Ch],edx
	jge	70146Ah

l0070131D:
	cmp	edx,0FFFFFC02h
	jge	701373h

l00701325:
	add	edx,3FEh
	fstp	st(1)
	push	edx
	sub	esp,8h
	fstp	double ptr [esp]
	call	dword ptr [8A471Ch]
	add	esp,0Ch
	xor	edx,edx
	jmp	70137Bh

l00701341:
	fld	st(1)
	fldz
	fxch	st(0),st(1)
	fucomip	st(0),st(1)
	fstp	st(0)
	lahf
	test	ah,44h
	jpe	70148Ch

l00701355:
	xor	edx,edx
	fxch	st(0),st(1)

l00701359:
	fld	st(0)
	fldz
	fxch	st(0),st(1)
	fucomip	st(0),st(1)
	fstp	st(0)
	lahf
	test	ah,44h
	jpo	701379h

l00701369:
	add	edx,3FFh
	fsubrp	st(1),st(0)
	jmp	70137Bh

l00701373:
	test	edx,edx
	jnz	701369h

l00701377:
	jmp	701359h

l00701379:
	fstp	st(1)

l0070137B:
	fmul	double ptr [8D6C30h]
	fstcw	word ptr [esp+0Ch]
	movzx	eax,word ptr [esp+0Ch]
	or	eax,0C00h
	fld	st(0)
	mov	[esp+10h],eax
	fldcw	word ptr [esp+10h]
	fistp	qword ptr [esp+10h]
	mov	ecx,[esp+10h]
	mov	eax,ecx
	test	eax,eax
	fldcw	word ptr [esp+0Ch]
	mov	[esp+10h],eax
	fild	dword ptr [esp+10h]
	jge	7013B9h

l007013B3:
	fadd	double ptr [8ACE50h]

l007013B9:
	fsubp	st(1),st(0)
	fstcw	word ptr [esp+0Ch]
	movzx	eax,word ptr [esp+0Ch]
	fmul	double ptr [8D6C28h]
	or	eax,0C00h
	mov	[esp+10h],eax
	fadd	double ptr [8AB850h]
	fldcw	word ptr [esp+10h]
	fistp	qword ptr [esp+10h]
	mov	eax,[esp+10h]
	test	eax,0FF000000h
	mov	[esp+10h],eax
	fldcw	word ptr [esp+0Ch]
	jz	701418h

l007013F4:
	add	ecx,1h
	test	ecx,0F0000000h
	mov	dword ptr [esp+10h],0h
	jz	701418h

l00701407:
	add	edx,1h
	xor	ecx,ecx
	cmp	edx,7FFh
	mov	[esp+0Ch],edx
	jge	70146Eh

l00701418:
	mov	eax,edx
	sar	eax,4h
	shl	bl,7h
	or	al,bl
	mov	[esi],al
	add	esi,edi
	shl	dl,4h
	mov	eax,ecx
	shr	eax,18h
	or	al,dl
	mov	[esi],al
	add	esi,edi
	mov	edx,ecx
	shr	edx,10h
	mov	[esi],dl
	add	esi,edi
	mov	eax,ecx
	shr	eax,8h
	mov	[esi],al
	mov	eax,[esp+10h]
	add	esi,edi
	mov	[esi],cl
	add	esi,edi
	mov	ecx,eax
	shr	ecx,10h
	mov	[esi],cl
	add	esi,edi
	mov	edx,eax
	shr	edx,8h
	mov	[esi],dl
	mov	[edi+esi],al
	pop	ebx
	pop	edi
	xor	eax,eax
	pop	esi
	add	esp,0Ch
	ret

l0070146A:
	fstp	st(0)
	fstp	st(0)

l0070146E:
	mov	ecx,[0A18598h]
	push	8D6C00h
	push	ecx
	call	6E0F80h
	add	esp,8h
	pop	ebx
	pop	edi
	or	eax,0FFh
	pop	esi
	add	esp,0Ch
	ret

l0070148C:
	mov	eax,[0A18720h]
	fstp	st(1)
	push	8D6BB4h
	fstp	st(0)
	push	eax
	call	6E0F80h
	add	esp,8h
	pop	ebx
	pop	edi
	or	eax,0FFh
	pop	esi
	add	esp,0Ch
	ret

l007014AD:
	cmp	eax,2h
	mov	ecx,1h
	jnz	70150Ah

l007014B7:
	cmp	dword ptr [esp+1Ch],0h
	jz	701516h

l007014BE:
	mov	eax,[esp+18h]

l007014C2:
	mov	dl,[esp+10h]
	mov	[eax],dl
	mov	dl,[esp+11h]
	mov	[eax+ecx],dl
	mov	dl,[esp+12h]
	add	eax,ecx
	mov	[eax+ecx],dl
	mov	dl,[esp+13h]
	add	eax,ecx
	mov	[eax+ecx],dl
	mov	dl,[esp+14h]
	add	eax,ecx
	mov	[eax+ecx],dl
	mov	dl,[esp+15h]
	add	eax,ecx
	mov	[eax+ecx],dl
	mov	dl,[esp+16h]
	add	eax,ecx
	add	eax,ecx
	mov	[eax],dl
	mov	dl,[esp+17h]
	mov	[ecx+eax],dl
	xor	eax,eax
	add	esp,0Ch
	ret

l0070150A:
	cmp	eax,1h
	jnz	7014BEh

l0070150F:
	cmp	dword ptr [esp+1Ch],0h
	jz	7014BEh

l00701516:
	mov	eax,[esp+18h]
	add	eax,7h
	or	ecx,0FFh
	jmp	7014C2h
00701522       CC CC CC CC CC CC CC CC CC CC CC CC CC CC   ..............
00701530 51 A1 28 CD A6 00 85 C0 56 0F 85 AF 00 00 00 39 Q.(.....V......9
00701540 44 24 10 8B 54 24 0C BE 01 00 00 00 74 06 83 C2 D$..T$......t...
00701550 03 83 CE FF 0F B6 02 0F B6 0C 32 03 D6 53 8A D8 ..........2..S..
00701560 57 83 E0 7F 8B F9 C1 EF 07 03 C0 83 E1 7F 0B C7 W...............
00701570 C1 E1 10 C0 EB 07 03 D6 3D FF 00 00 00 8B F9 75 ........=......u
00701580 1E A1 2C 7E A1 00 68 40 6C 8D 00 50 E8 EF F9 FD ..,~..h@l..P....
00701590 FF DD 05 F8 86 8A 00 83 C4 08 5F 5B 5E 59 C3 0F .........._[^Y..
007015A0 B6 0C 16 8A 2A 0B CF 85 C9 89 4C 24 0C DB 44 24 ....*.....L$..D$
007015B0 0C 7D 06 DC 05 50 CE 8A 00 85 C0 DC 0D 38 6C 8D .}...P.......8l.
007015C0 00 75 07 B8 82 FF FF FF EB 09 DC 05 C8 D1 8A 00 .u..............
007015D0 83 E8 7F 50 83 EC 08 DD 1C 24 FF 15 1C 47 8A 00 ...P.....$...G..
007015E0 83 C4 0C 84 DB 74 B3 5F D9 E0 5B 5E 59 C3 83 F8 .....t._..[^Y...
007015F0 02 75 18 83 7C 24 10 00 74 1D 8B 4C 24 0C 8B 11 .u..|$..t..L$...
00701600 89 54 24 04 D9 44 24 04 5E 59 C3 83 F8 01 75 EA .T$..D$.^Y....u.
00701610 83 7C 24 10 00 74 E3 8B 4C 24 0C 8D 44 24 07 BE .|$..t..L$..D$..
00701620 04 00 00 00 8A 11 88 10 83 E8 01 83 C1 01 83 EE ................
00701630 01 75 F1 8B 44 24 04 89 44 24 04 D9 44 24 04 5E .u..D$..D$..D$.^
00701640 59 C3 CC CC CC CC CC CC CC CC CC CC CC CC CC CC Y...............

;; fn00701650: 00701650
;;   Called from:
;;     00736A37 (in fn007367D0)
;;     00736B61 (in fn007367D0)
;;     00736BA9 (in fn007367D0)
fn00701650 proc
	sub	esp,14h
	mov	eax,[0A14188h]
	xor	eax,esp
	mov	[esp+10h],eax
	mov	ecx,[0A6CD1Ch]
	test	ecx,ecx
	mov	eax,[esp+18h]
	push	esi
	jnz	70177Bh

l00701671:
	cmp	dword ptr [esp+20h],0h
	mov	ecx,1h
	jz	701683h

l0070167D:
	add	eax,7h
	or	ecx,0FFh

l00701683:
	movzx	edx,byte ptr [eax]
	movzx	esi,byte ptr [eax+ecx]
	push	ebx
	mov	bl,dl
	and	edx,7Fh
	add	eax,ecx
	shl	edx,4h
	push	edi
	mov	edi,edx
	mov	edx,esi
	shr	edx,4h
	and	esi,0Fh
	or	edi,edx
	shr	bl,7h
	shl	esi,18h
	add	eax,ecx
	cmp	edi,7FFh
	jnz	7016DDh

l007016B2:
	mov	eax,[0A17E2Ch]
	push	8D6C40h
	push	eax
	call	6E0F80h
	fld	double ptr [8A86F8h]
	add	esp,8h

l007016CB:
	pop	edi
	pop	ebx
	pop	esi
	mov	ecx,[esp+10h]
	xor	ecx,esp
	call	694B8Eh
	add	esp,14h
	ret

l007016DD:
	movzx	edx,byte ptr [eax]
	shl	edx,10h
	or	esi,edx
	add	eax,ecx
	xor	edx,edx
	mov	dh,[eax]
	add	eax,ecx
	or	esi,edx
	movzx	edx,byte ptr [eax]
	add	eax,ecx
	or	esi,edx
	movzx	edx,byte ptr [eax]
	add	eax,ecx
	movzx	ecx,byte ptr [eax+ecx]
	mov	ch,[eax]
	shl	edx,10h
	or	ecx,edx
	test	ecx,ecx
	mov	[esp+0Ch],ecx
	fild	dword ptr [esp+0Ch]
	jge	701718h

l00701712:
	fadd	double ptr [8ACE50h]

l00701718:
	test	esi,esi
	fmul	double ptr [8D6C88h]
	mov	[esp+0Ch],esi
	fild	dword ptr [esp+0Ch]
	jge	701730h

l0070172A:
	fadd	double ptr [8ACE50h]

l00701730:
	test	edi,edi
	faddp	st(1),st(0)
	fmul	double ptr [8D6C80h]
	jnz	701743h

l0070173C:
	mov	edi,0FFFFFC02h
	jmp	70174Fh

l00701743:
	fadd	double ptr [8AD1C8h]
	sub	edi,3FFh

l0070174F:
	push	edi
	sub	esp,8h
	fstp	double ptr [esp]
	call	dword ptr [8A471Ch]
	add	esp,0Ch
	test	bl,bl
	jz	7016CBh

l00701767:
	pop	edi
	fchs
	pop	ebx
	pop	esi
	mov	ecx,[esp+10h]
	xor	ecx,esp
	call	694B8Eh
	add	esp,14h
	ret

l0070177B:
	cmp	ecx,2h
	jnz	7017A8h

l00701780:
	cmp	dword ptr [esp+20h],0h
	jz	7017B4h

l00701787:
	mov	edx,[eax]
	mov	eax,[eax+4h]
	mov	[esp+4h],edx
	mov	[esp+8h],eax
	fld	double ptr [esp+4h]
	pop	esi
	mov	ecx,[esp+10h]
	xor	ecx,esp
	call	694B8Eh
	add	esp,14h
	ret

l007017A8:
	cmp	ecx,1h
	jnz	701787h

l007017AD:
	cmp	dword ptr [esp+20h],0h
	jz	701787h

l007017B4:
	lea	ecx,[esp+13h]
	mov	esi,8h
	lea	ecx,[ecx+0h]

l007017C0:
	mov	dl,[eax]
	mov	[ecx],dl
	sub	ecx,1h
	add	eax,1h
	sub	esi,1h
	jnz	7017C0h

l007017CF:
	mov	ecx,[esp+10h]
	mov	eax,[esp+0Ch]
	mov	[esp+8h],ecx
	mov	ecx,[esp+14h]
	pop	esi
	mov	[esp],eax
	fld	double ptr [esp]
	xor	ecx,esp
	call	694B8Eh
	add	esp,14h
	ret
007017F1    CC CC CC CC CC CC CC CC CC CC CC CC CC CC CC  ...............

;; fn00701800: 00701800
;;   Called from:
;;     007042B2 (in fn00704220)
;;     007043A3 (in fn00704300)
;;     00704494 (in fn00704400)
fn00701800 proc
	mov	ecx,[eax+4h]
	mov	edx,[ecx+0Ch]
	mov	eax,[esp+4h]
	mov	ecx,[0A16B7Ch]
	push	edx
	push	eax
	push	ecx
	call	6E15D0h
	add	esp,0Ch
	xor	eax,eax
	ret
0070181E                                           CC CC               ..
00701820 8B 4C 24 04 85 C9 74 2D 8B 44 24 08 85 C0 74 25 .L$...t-.D$...t%
00701830 56 50 51 E8 98 DB FD FF 83 C4 08 8B F0 E8 7E F7 VPQ...........~.
00701840 FD FF 85 C0 74 05 83 C8 FF 5E C3 8B 44 24 10 89 ....t....^..D$..
00701850 30 33 C0 5E C3 E8 66 F7 FD FF 85 C0 75 14 8B 0D 03.^..f.....u...
00701860 20 87 A1 00 68 90 6C 8D 00 51 E8 11 F7 FD FF 83  ...h.l..Q......
00701870 C4 08 83 C8 FF C3 CC CC CC CC CC CC CC CC CC CC ................

;; fn00701880: 00701880
;;   Called from:
;;     007200E4 (in fn00720070)
fn00701880 proc
	push	ebx
	push	ebp
	push	edi
	mov	edi,[esp+10h]
	test	edi,edi
	jz	701928h

l0070188F:
	mov	ebp,[esp+14h]
	test	ebp,ebp
	jz	701928h

l0070189B:
	mov	ebx,[esp+18h]
	test	ebx,ebx
	jz	701928h

l007018A7:
	mov	eax,[edi+4h]
	push	esi
	mov	esi,[eax+50h]
	test	esi,esi
	jz	70190Ch

l007018B2:
	cmp	dword ptr [esi+0Ch],0h
	jz	70190Ch

l007018B8:
	mov	eax,[esi+8h]
	test	eax,eax
	jz	70190Ch

l007018BF:
	push	0h
	push	edi
	call	eax
	add	esp,8h
	cmp	eax,1h
	jz	7018E8h

l007018CC:
	mov	ecx,[0A16B7Ch]
	push	8D6CD8h
	push	ecx
	call	6E0F80h
	add	esp,8h

l007018E0:
	pop	esi
	pop	edi
	pop	ebp
	or	eax,0FFh
	pop	ebx
	ret

l007018E8:
	mov	eax,[esi+0Ch]
	lea	edx,[esp+14h]
	push	edx
	push	0h
	push	edi
	call	eax
	add	esp,0Ch
	test	eax,eax
	jl	7018E0h

l007018FC:
	mov	ecx,[esp+14h]
	pop	esi
	pop	edi
	mov	[ebp+0h],ecx
	mov	[ebx],eax
	pop	ebp
	xor	eax,eax
	pop	ebx
	ret

l0070190C:
	mov	edx,[0A16B7Ch]
	push	8D6CB4h
	push	edx
	call	6E0F80h
	add	esp,8h
	pop	esi
	pop	edi
	pop	ebp
	or	eax,0FFh
	pop	ebx
	ret

l00701928:
	call	6E0FC0h
	test	eax,eax
	jnz	701944h

l00701931:
	mov	eax,[0A18720h]
	push	8D6C90h
	push	eax
	call	6E0F80h
	add	esp,8h

l00701944:
	pop	edi
	pop	ebp
	or	eax,0FFh
	pop	ebx
	ret
0070194B                                  CC CC CC CC CC            .....

;; fn00701950: 00701950
;;   Called from:
;;     00734D3D (in fn00734BB0)
;;     00735CB5 (in fn00735890)
fn00701950 proc
	mov	ecx,[esp+4h]
	mov	eax,[ecx+4h]
	mov	eax,[eax+50h]
	test	eax,eax
	jz	701978h

l0070195E:
	cmp	dword ptr [eax],0h
	jz	701978h

l00701963:
	mov	eax,[eax+8h]
	test	eax,eax
	jz	701978h

l0070196A:
	push	0h
	push	ecx
	call	eax
	add	esp,8h
	cmp	eax,1h
	jnz	701978h

l00701977:
	ret

l00701978:
	xor	eax,eax
	ret
0070197B                                  CC CC CC CC CC            .....
00701980 53 55 57 8B 7C 24 10 85 FF 0F 84 93 00 00 00 8B SUW.|$..........
00701990 6C 24 14 85 ED 0F 84 87 00 00 00 8B 5C 24 18 85 l$..........\$..
007019A0 DB 74 7F 8B 47 04 56 8B 70 50 85 F6 74 58 83 3E .t..G.V.pP..tX.>
007019B0 00 74 53 8B 46 08 85 C0 74 4C 6A 00 57 FF D0 83 .tS.F...tLj.W...
007019C0 C4 08 83 F8 01 74 1C 8B 0D 7C 6B A1 00 68 D8 6C .....t...|k..h.l
007019D0 8D 00 51 E8 A8 F5 FD FF 83 C4 08 5E 5F 5D 83 C8 ..Q........^_]..
007019E0 FF 5B C3 8B 06 8D 54 24 14 52 6A 00 57 FF D0 83 .[....T$.Rj.W...
007019F0 C4 0C 85 C0 7C E5 8B 4C 24 14 5E 5F 89 4D 00 89 ....|..L$.^_.M..
00701A00 03 5D 33 C0 5B C3 8B 15 7C 6B A1 00 68 00 6D 8D .]3.[...|k..h.m.
00701A10 00 52 E8 69 F5 FD FF 83 C4 08 5E 5F 5D 83 C8 FF .R.i......^_]...
00701A20 5B C3 E8 99 F5 FD FF 85 C0 75 13 A1 20 87 A1 00 [........u.. ...
00701A30 68 90 6C 8D 00 50 E8 45 F5 FD FF 83 C4 08 5F 5D h.l..P.E......_]
00701A40 83 C8 FF 5B C3 CC CC CC CC CC CC CC CC CC CC CC ...[............
00701A50 53 55 57 8B 7C 24 10 85 FF 0F 84 99 00 00 00 8B SUW.|$..........
00701A60 6C 24 14 85 ED 0F 84 8D 00 00 00 8B 5C 24 18 85 l$..........\$..
00701A70 DB 0F 84 81 00 00 00 8B 47 04 56 8B 70 50 85 F6 ........G.V.pP..
00701A80 74 5A 83 7E 04 00 74 54 8B 46 08 85 C0 74 4D 6A tZ.~..tT.F...tMj
00701A90 00 57 FF D0 83 C4 08 83 F8 01 74 1C 8B 0D 7C 6B .W........t...|k
00701AA0 A1 00 68 D8 6C 8D 00 51 E8 D3 F4 FD FF 83 C4 08 ..h.l..Q........
00701AB0 5E 5F 5D 83 C8 FF 5B C3 8B 46 04 8D 54 24 14 52 ^_]...[..F..T$.R
00701AC0 6A 00 57 FF D0 83 C4 0C 85 C0 7C E4 8B 4C 24 14 j.W.......|..L$.
00701AD0 5E 5F 89 4D 00 89 03 5D 33 C0 5B C3 8B 15 7C 6B ^_.M...]3.[...|k
00701AE0 A1 00 68 24 6D 8D 00 52 E8 93 F4 FD FF 83 C4 08 ..h$m..R........
00701AF0 5E 5F 5D 83 C8 FF 5B C3 E8 C3 F4 FD FF 85 C0 75 ^_]...[........u
00701B00 13 A1 20 87 A1 00 68 90 6C 8D 00 50 E8 6F F4 FD .. ...h.l..P.o..
00701B10 FF 83 C4 08 5F 5D 83 C8 FF 5B C3 CC CC CC CC CC ...._]...[......

;; fn00701B20: 00701B20
;;   Called from:
;;     006DE1DD (in fn006DE1B0)
;;     006DE1F7 (in fn006DE1B0)
fn00701B20 proc
	mov	eax,[esp+4h]
	test	eax,eax
	jz	701B44h

l00701B28:
	mov	eax,[eax+4h]
	mov	eax,[eax+30h]
	test	eax,eax
	jz	701B44h

l00701B32:
	cmp	dword ptr [eax+48h],0h
	jnz	701B3Eh

l00701B38:
	cmp	dword ptr [eax+50h],0h
	jz	701B44h

l00701B3E:
	mov	eax,1h
	ret

l00701B44:
	xor	eax,eax
	ret
00701B47                      CC CC CC CC CC CC CC CC CC        .........

;; fn00701B50: 00701B50
;;   Called from:
;;     007020DE (in fn007020D0)
;;     0070213E (in fn00702130)
;;     0070219E (in fn00702190)
;;     007021FE (in fn007021F0)
;;     0070225E (in fn00702250)
;;     007022BE (in fn007022B0)
;;     0070231E (in fn00702310)
;;     007023DF (in fn007023D0)
;;     00702461 (in fn00702450)
;;     007024C1 (in fn007024B0)
;;     0070251E (in fn00702510)
;;     00702621 (in fn007025E0)
;;     00702819 (in fn007027D0)
;;     00704570 (in fn00704560)
;;     0070465A (in fn00704610)
fn00701B50 proc
	mov	edx,[esp+4h]
	mov	ecx,[edx+4h]
	mov	eax,[ecx+30h]
	push	ebx
	push	ebp
	mov	ebp,[esp+14h]
	push	esi
	push	edi
	xor	edi,edi
	xor	esi,esi
	test	eax,eax
	mov	bl,10h
	jz	701B74h

l00701B6C:
	test	[ecx+54h],bl
	jz	701B74h

l00701B71:
	mov	edi,[eax+ebp]

l00701B74:
	mov	eax,[esp+18h]
	mov	eax,[eax+4h]
	cmp	eax,ecx
	jz	701B9Bh

l00701B7F:
	mov	edx,[esp+18h]
	mov	edx,[edx+4h]
	mov	eax,[edx+30h]
	test	eax,eax
	jz	701B9Bh

l00701B8D:
	test	[edx+54h],bl
	jz	701B9Bh

l00701B92:
	mov	esi,[eax+ebp]
	cmp	esi,edi
	jnz	701B9Bh

l00701B99:
	xor	esi,esi

l00701B9B:
	test	edi,edi
	jz	701C10h

l00701B9F:
	test	esi,esi
	jz	701BE5h

l00701BA3:
	mov	eax,[esp+18h]
	push	ecx
	mov	ecx,[eax+4h]
	push	ecx
	call	6D5670h
	add	esp,8h
	test	eax,eax
	jz	701BE5h

l00701BB8:
	mov	edx,[esp+18h]
	mov	eax,[esp+14h]
	push	edx
	push	eax
	call	esi
	add	esp,8h
	cmp	eax,0A16480h
	jnz	701D1Fh

l00701BD2:
	add	dword ptr [eax],0FFh
	jnz	701BE3h

l00701BD7:
	mov	ecx,[eax+4h]
	mov	edx,[ecx+18h]
	push	eax
	call	edx
	add	esp,4h

l00701BE3:
	xor	esi,esi

l00701BE5:
	mov	eax,[esp+18h]
	mov	ecx,[esp+14h]
	push	eax
	push	ecx
	call	edi
	add	esp,8h
	cmp	eax,0A16480h
	jnz	701D1Fh

l00701BFF:
	add	dword ptr [eax],0FFh
	jnz	701C10h

l00701C04:
	mov	edx,[eax+4h]
	push	eax
	mov	eax,[edx+18h]
	call	eax
	add	esp,4h

l00701C10:
	test	esi,esi
	jz	701C3Fh

l00701C14:
	mov	ecx,[esp+18h]
	mov	edx,[esp+14h]
	push	ecx
	push	edx
	call	esi
	add	esp,8h
	cmp	eax,0A16480h
	jnz	701D1Fh

l00701C2E:
	add	dword ptr [eax],0FFh
	jnz	701C3Fh

l00701C33:
	mov	ecx,[eax+4h]
	mov	edx,[ecx+18h]
	push	eax
	call	edx
	add	esp,4h

l00701C3F:
	mov	eax,[esp+14h]
	mov	ecx,[eax+4h]
	test	[ecx+54h],bl
	jz	701C5Bh

l00701C4B:
	mov	edx,[esp+18h]
	mov	eax,[edx+4h]
	test	[eax+54h],bl
	jnz	701D13h

l00701C5B:
	lea	ecx,[esp+18h]
	push	ecx
	lea	edx,[esp+18h]
	push	edx
	call	6DEB20h
	add	esp,8h
	test	eax,eax
	jge	701C78h

l00701C71:
	pop	edi
	pop	esi
	pop	ebp
	xor	eax,eax
	pop	ebx
	ret

l00701C78:
	jnz	701D13h

l00701C7E:
	mov	eax,[esp+14h]
	mov	ecx,[eax+4h]
	mov	ecx,[ecx+30h]
	test	ecx,ecx
	jz	701CDFh

l00701C8C:
	mov	ecx,[ecx+ebp]
	test	ecx,ecx
	jz	701CDFh

l00701C93:
	mov	edx,[esp+18h]
	push	edx
	push	eax
	call	ecx
	mov	esi,eax
	mov	eax,[esp+1Ch]
	add	dword ptr [eax],0FFh
	mov	eax,[esp+1Ch]
	add	esp,8h
	cmp	dword ptr [eax],0h
	jnz	701CBCh

l00701CB0:
	mov	ecx,[eax+4h]
	mov	edx,[ecx+18h]
	push	eax
	call	edx
	add	esp,4h

l00701CBC:
	mov	eax,[esp+18h]
	add	dword ptr [eax],0FFh
	mov	eax,[esp+18h]
	cmp	dword ptr [eax],0h
	jnz	701CD8h

l00701CCC:
	mov	ecx,[eax+4h]
	mov	edx,[ecx+18h]
	push	eax
	call	edx
	add	esp,4h

l00701CD8:
	pop	edi
	mov	eax,esi
	pop	esi
	pop	ebp
	pop	ebx
	ret

l00701CDF:
	add	dword ptr [eax],0FFh
	mov	eax,[esp+14h]
	cmp	dword ptr [eax],0h
	jnz	701CF7h

l00701CEB:
	mov	ecx,[eax+4h]
	mov	edx,[ecx+18h]
	push	eax
	call	edx
	add	esp,4h

l00701CF7:
	mov	eax,[esp+18h]
	add	dword ptr [eax],0FFh
	mov	eax,[esp+18h]
	cmp	dword ptr [eax],0h
	jnz	701D13h

l00701D07:
	mov	ecx,[eax+4h]
	mov	edx,[ecx+18h]
	push	eax
	call	edx
	add	esp,4h

l00701D13:
	add	dword ptr [0A16480h],1h
	mov	eax,0A16480h

l00701D1F:
	pop	edi
	pop	esi
	pop	ebp
	pop	ebx
	ret
00701D24             CC CC CC CC CC CC CC CC CC CC CC CC     ............

;; fn00701D30: 00701D30
;;   Called from:
;;     00702581 (in fn00702570)
;;     007028E7 (in fn007028C0)
;;     007028FD (in fn007028C0)
fn00701D30 proc
	sub	esp,10h
	mov	eax,[esp+14h]
	mov	ecx,[eax+4h]
	mov	edx,[esp+18h]
	mov	eax,[ecx+30h]
	mov	edx,[edx+4h]
	push	ebx
	push	ebp
	mov	ebp,[edx+30h]
	push	esi
	push	edi
	xor	edi,edi
	xor	esi,esi
	cmp	eax,edi
	mov	[esp+10h],edi
	jz	701D68h

l00701D57:
	test	byte ptr [ecx+54h],10h
	jz	701D68h

l00701D5D:
	mov	ebx,[esp+30h]
	mov	eax,[eax+ebx]
	mov	[esp+10h],eax

l00701D68:
	mov	eax,[esp+28h]
	mov	ebx,[esp+24h]
	mov	eax,[eax+4h]
	cmp	eax,[ebx+4h]
	mov	bl,10h
	jz	701D92h

l00701D7A:
	test	ebp,ebp
	jz	701D92h

l00701D7E:
	test	[edx+54h],bl
	jz	701D92h

l00701D83:
	mov	eax,[esp+30h]
	mov	edi,[eax+ebp]
	cmp	edi,[esp+10h]
	jnz	701D92h

l00701D90:
	xor	edi,edi

l00701D92:
	cmp	[esp+10h],esi
	jz	701E1Fh

l00701D9C:
	test	edi,edi
	jz	701DE2h

l00701DA0:
	push	ecx
	push	edx
	call	6D5670h
	mov	ebp,[esp+34h]
	add	esp,8h
	test	eax,eax
	jz	701DE6h

l00701DB2:
	mov	ecx,[esp+28h]
	mov	edx,[esp+24h]
	push	ebp
	push	ecx
	push	edx
	call	edi
	add	esp,0Ch
	cmp	eax,0A16480h
	jnz	7020C4h

l00701DCD:
	add	dword ptr [eax],0FFh
	jnz	701DDEh

l00701DD2:
	mov	ecx,[eax+4h]
	mov	edx,[ecx+18h]
	push	eax
	call	edx
	add	esp,4h

l00701DDE:
	xor	edi,edi
	jmp	701DE6h

l00701DE2:
	mov	ebp,[esp+2Ch]

l00701DE6:
	mov	eax,[esp+28h]
	mov	ecx,[esp+24h]
	push	ebp
	push	eax
	push	ecx
	call	dword ptr [esp+1Ch]
	mov	esi,eax
	add	esp,0Ch
	cmp	esi,0A16480h
	jz	701E0Ch

l00701E02:
	pop	edi
	mov	eax,esi
	pop	esi
	pop	ebp
	pop	ebx
	add	esp,10h
	ret

l00701E0C:
	add	dword ptr [esi],0FFh
	jnz	701E23h

l00701E11:
	mov	edx,[esi+4h]
	mov	eax,[edx+18h]
	push	esi
	call	eax
	add	esp,4h
	jmp	701E23h

l00701E1F:
	mov	ebp,[esp+2Ch]

l00701E23:
	test	edi,edi
	jz	701E52h

l00701E27:
	mov	ecx,[esp+28h]
	mov	edx,[esp+24h]
	push	ebp
	push	ecx
	push	edx
	call	edi
	mov	esi,eax
	add	esp,0Ch
	cmp	esi,0A16480h
	jnz	701E02h

l00701E41:
	add	dword ptr [esi],0FFh
	jnz	701E52h

l00701E46:
	mov	eax,[esi+4h]
	mov	ecx,[eax+18h]
	push	esi
	call	ecx
	add	esp,4h

l00701E52:
	mov	ecx,[ebp+4h]
	mov	eax,[ecx+30h]
	test	eax,eax
	jz	701EA5h

l00701E5C:
	test	[ecx+54h],bl
	jz	701EA5h

l00701E61:
	mov	edx,[esp+30h]
	mov	eax,[eax+edx]
	cmp	eax,[esp+10h]
	jz	701EA5h

l00701E6E:
	cmp	eax,edi
	jz	701EA5h

l00701E72:
	test	eax,eax
	jz	701EA5h

l00701E76:
	mov	ecx,[esp+28h]
	mov	edx,[esp+24h]
	push	ebp
	push	ecx
	push	edx
	call	eax
	mov	esi,eax
	add	esp,0Ch
	cmp	esi,0A16480h
	jnz	701E02h

l00701E94:
	add	dword ptr [esi],0FFh
	jnz	701EA5h

l00701E99:
	mov	eax,[esi+4h]
	mov	ecx,[eax+18h]
	push	esi
	call	ecx
	add	esp,4h

l00701EA5:
	mov	eax,[esp+24h]
	mov	edx,[eax+4h]
	test	[edx+54h],bl
	jz	701ED5h

l00701EB1:
	mov	ecx,[esp+28h]
	mov	edx,[ecx+4h]
	test	[edx+54h],bl
	jz	701ED5h

l00701EBD:
	cmp	ebp,0A163B8h
	jz	70206Dh

l00701EC9:
	mov	edx,[ebp+4h]
	test	[edx+54h],bl
	jnz	702065h

l00701ED5:
	lea	eax,[esp+28h]
	push	eax
	lea	ecx,[esp+28h]
	push	ecx
	call	6DEB90h
	mov	edi,eax
	add	esp,8h
	test	edi,edi
	jnz	702057h

l00701EF1:
	cmp	ebp,0A163B8h
	jnz	701F2Dh

l00701EF9:
	mov	ecx,[esp+24h]
	mov	edx,[ecx+4h]
	mov	eax,[edx+30h]
	test	eax,eax
	jz	701F25h

l00701F07:
	mov	edx,[esp+30h]
	mov	eax,[eax+edx]
	test	eax,eax
	jz	701F25h

l00701F12:
	mov	edx,[esp+28h]
	push	ebp
	push	edx
	push	ecx
	call	eax
	add	esp,0Ch
	mov	esi,eax
	jmp	70201Dh

l00701F25:
	or	edi,0FFh
	jmp	70201Dh

l00701F2D:
	mov	eax,[esp+24h]
	lea	ecx,[esp+1Ch]
	push	ecx
	lea	edx,[esp+1Ch]
	push	edx
	mov	[esp+20h],eax
	mov	[esp+24h],ebp
	call	6DEB90h
	mov	edi,eax
	add	esp,8h
	test	edi,edi
	jnz	70201Dh

l00701F55:
	mov	eax,[esp+28h]
	mov	ecx,[esp+1Ch]
	lea	edx,[esp+14h]
	mov	[esp+10h],eax
	push	edx
	lea	eax,[esp+14h]
	push	eax
	mov	[esp+1Ch],ecx
	call	6DEB90h
	mov	edi,eax
	add	esp,8h
	test	edi,edi
	jnz	701FE5h

l00701F7D:
	mov	ecx,[esp+18h]
	mov	edx,[ecx+4h]
	mov	eax,[edx+30h]
	test	eax,eax
	jz	701FAAh

l00701F8B:
	mov	edx,[esp+30h]
	mov	eax,[eax+edx]
	test	eax,eax
	jz	701FAAh

l00701F96:
	mov	edx,[esp+14h]
	push	edx
	mov	edx,[esp+14h]
	push	edx
	push	ecx
	call	eax
	add	esp,0Ch
	mov	esi,eax
	jmp	701FADh

l00701FAA:
	or	edi,0FFh

l00701FAD:
	mov	eax,[esp+10h]
	add	dword ptr [eax],0FFh
	mov	eax,[esp+10h]
	cmp	dword ptr [eax],0h
	jnz	701FC9h

l00701FBD:
	mov	ecx,[eax+4h]
	mov	edx,[ecx+18h]
	push	eax
	call	edx
	add	esp,4h

l00701FC9:
	mov	eax,[esp+14h]
	add	dword ptr [eax],0FFh
	mov	eax,[esp+14h]
	cmp	dword ptr [eax],0h
	jnz	701FE5h

l00701FD9:
	mov	ecx,[eax+4h]
	mov	edx,[ecx+18h]
	push	eax
	call	edx
	add	esp,4h

l00701FE5:
	mov	eax,[esp+18h]
	add	dword ptr [eax],0FFh
	mov	eax,[esp+18h]
	cmp	dword ptr [eax],0h
	jnz	702001h

l00701FF5:
	mov	ecx,[eax+4h]
	mov	edx,[ecx+18h]
	push	eax
	call	edx
	add	esp,4h

l00702001:
	mov	eax,[esp+1Ch]
	add	dword ptr [eax],0FFh
	mov	eax,[esp+1Ch]
	cmp	dword ptr [eax],0h
	jnz	70201Dh

l00702011:
	mov	ecx,[eax+4h]
	mov	edx,[ecx+18h]
	push	eax
	call	edx
	add	esp,4h

l0070201D:
	mov	eax,[esp+24h]
	add	dword ptr [eax],0FFh
	mov	eax,[esp+24h]
	cmp	dword ptr [eax],0h
	jnz	702039h

l0070202D:
	mov	ecx,[eax+4h]
	mov	edx,[ecx+18h]
	push	eax
	call	edx
	add	esp,4h

l00702039:
	mov	eax,[esp+28h]
	add	dword ptr [eax],0FFh
	mov	eax,[esp+28h]
	cmp	dword ptr [eax],0h
	jnz	702055h

l00702049:
	mov	ecx,[eax+4h]
	mov	edx,[ecx+18h]
	push	eax
	call	edx
	add	esp,4h

l00702055:
	test	edi,edi

l00702057:
	jge	701E02h

l0070205D:
	mov	eax,[esp+24h]
	mov	ecx,[esp+28h]

l00702065:
	cmp	ebp,0A163B8h
	jnz	702099h

l0070206D:
	mov	ecx,[ecx+4h]
	mov	edx,[ecx+0Ch]
	mov	eax,[eax+4h]
	mov	ecx,[eax+0Ch]
	push	edx
	mov	edx,[0A16B7Ch]
	push	ecx
	push	8D6DD0h
	push	edx
	call	6E15D0h
	add	esp,10h
	pop	edi
	pop	esi
	pop	ebp
	xor	eax,eax
	pop	ebx
	add	esp,10h
	ret

l00702099:
	mov	edx,[ebp+4h]
	mov	edx,[edx+0Ch]
	mov	ecx,[ecx+4h]
	mov	eax,[eax+4h]
	push	edx
	mov	edx,[ecx+0Ch]
	mov	ecx,[eax+0Ch]
	push	edx
	mov	edx,[0A16B7Ch]
	push	ecx
	push	8D6D88h
	push	edx
	call	6E15D0h
	add	esp,14h
	xor	eax,eax

l007020C4:
	pop	edi
	pop	esi
	pop	ebp
	pop	ebx
	add	esp,10h
	ret
007020CC                                     CC CC CC CC             ....

;; fn007020D0: 007020D0
;;   Called from:
;;     0070988C (in fn00708DC0)
;;     0072662D (in fn00726570)
fn007020D0 proc
	push	esi
	mov	esi,[esp+0Ch]
	push	edi
	mov	edi,[esp+0Ch]
	push	40h
	push	esi
	push	edi
	call	701B50h
	add	esp,0Ch
	cmp	eax,0A16480h
	jnz	702127h

l007020ED:
	add	dword ptr [eax],0FFh
	jnz	7020FEh

l007020F2:
	mov	ecx,[eax+4h]
	mov	edx,[ecx+18h]
	push	eax
	call	edx
	add	esp,4h

l007020FE:
	mov	eax,[esi+4h]
	mov	ecx,[eax+0Ch]
	mov	edx,[edi+4h]
	mov	eax,[edx+0Ch]
	push	ecx
	mov	ecx,[0A16B7Ch]
	push	eax
	push	8D6E14h
	push	8D6D48h
	push	ecx
	call	6E15D0h
	add	esp,14h
	xor	eax,eax

l00702127:
	pop	edi
	pop	esi
	ret
0070212A                               CC CC CC CC CC CC           ......

;; fn00702130: 00702130
;;   Called from:
;;     00709873 (in fn00708DC0)
;;     00726624 (in fn00726570)
fn00702130 proc
	push	esi
	mov	esi,[esp+0Ch]
	push	edi
	mov	edi,[esp+0Ch]
	push	3Ch
	push	esi
	push	edi
	call	701B50h
	add	esp,0Ch
	cmp	eax,0A16480h
	jnz	702187h

l0070214D:
	add	dword ptr [eax],0FFh
	jnz	70215Eh

l00702152:
	mov	ecx,[eax+4h]
	mov	edx,[ecx+18h]
	push	eax
	call	edx
	add	esp,4h

l0070215E:
	mov	eax,[esi+4h]
	mov	ecx,[eax+0Ch]
	mov	edx,[edi+4h]
	mov	eax,[edx+0Ch]
	push	ecx
	mov	ecx,[0A16B7Ch]
	push	eax
	push	8D6E18h
	push	8D6D48h
	push	ecx
	call	6E15D0h
	add	esp,14h
	xor	eax,eax

l00702187:
	pop	edi
	pop	esi
	ret
0070218A                               CC CC CC CC CC CC           ......

;; fn00702190: 00702190
;;   Called from:
;;     0070985A (in fn00708DC0)
;;     0072661B (in fn00726570)
fn00702190 proc
	push	esi
	mov	esi,[esp+0Ch]
	push	edi
	mov	edi,[esp+0Ch]
	push	38h
	push	esi
	push	edi
	call	701B50h
	add	esp,0Ch
	cmp	eax,0A16480h
	jnz	7021E7h

l007021AD:
	add	dword ptr [eax],0FFh
	jnz	7021BEh

l007021B2:
	mov	ecx,[eax+4h]
	mov	edx,[ecx+18h]
	push	eax
	call	edx
	add	esp,4h

l007021BE:
	mov	eax,[esi+4h]
	mov	ecx,[eax+0Ch]
	mov	edx,[edi+4h]
	mov	eax,[edx+0Ch]
	push	ecx
	mov	ecx,[0A16B7Ch]
	push	eax
	push	8D6E1Ch
	push	8D6D48h
	push	ecx
	call	6E15D0h
	add	esp,14h
	xor	eax,eax

l007021E7:
	pop	edi
	pop	esi
	ret
007021EA                               CC CC CC CC CC CC           ......

;; fn007021F0: 007021F0
;;   Called from:
;;     00709825 (in fn00708DC0)
;;     00726609 (in fn00726570)
fn007021F0 proc
	push	esi
	mov	esi,[esp+0Ch]
	push	edi
	mov	edi,[esp+0Ch]
	push	30h
	push	esi
	push	edi
	call	701B50h
	add	esp,0Ch
	cmp	eax,0A16480h
	jnz	702247h

l0070220D:
	add	dword ptr [eax],0FFh
	jnz	70221Eh

l00702212:
	mov	ecx,[eax+4h]
	mov	edx,[ecx+18h]
	push	eax
	call	edx
	add	esp,4h

l0070221E:
	mov	eax,[esi+4h]
	mov	ecx,[eax+0Ch]
	mov	edx,[edi+4h]
	mov	eax,[edx+0Ch]
	push	ecx
	mov	ecx,[0A16B7Ch]
	push	eax
	push	8D6E20h
	push	8D6D48h
	push	ecx
	call	6E15D0h
	add	esp,14h
	xor	eax,eax

l00702247:
	pop	edi
	pop	esi
	ret
0070224A                               CC CC CC CC CC CC           ......

;; fn00702250: 00702250
;;   Called from:
;;     0070983E (in fn00708DC0)
;;     00726612 (in fn00726570)
fn00702250 proc
	push	esi
	mov	esi,[esp+0Ch]
	push	edi
	mov	edi,[esp+0Ch]
	push	34h
	push	esi
	push	edi
	call	701B50h
	add	esp,0Ch
	cmp	eax,0A16480h
	jnz	7022A7h

l0070226D:
	add	dword ptr [eax],0FFh
	jnz	70227Eh

l00702272:
	mov	ecx,[eax+4h]
	mov	edx,[ecx+18h]
	push	eax
	call	edx
	add	esp,4h

l0070227E:
	mov	eax,[esi+4h]
	mov	ecx,[eax+0Ch]
	mov	edx,[edi+4h]
	mov	eax,[edx+0Ch]
	push	ecx
	mov	ecx,[0A16B7Ch]
	push	eax
	push	8D6E24h
	push	8D6D48h
	push	ecx
	call	6E15D0h
	add	esp,14h
	xor	eax,eax

l007022A7:
	pop	edi
	pop	esi
	ret
007022AA                               CC CC CC CC CC CC           ......

;; fn007022B0: 007022B0
;;   Called from:
;;     007097AC (in fn00708DC0)
;;     007265F7 (in fn00726570)
fn007022B0 proc
	push	esi
	mov	esi,[esp+0Ch]
	push	edi
	mov	edi,[esp+0Ch]
	push	4h
	push	esi
	push	edi
	call	701B50h
	add	esp,0Ch
	cmp	eax,0A16480h
	jnz	702307h

l007022CD:
	add	dword ptr [eax],0FFh
	jnz	7022DEh

l007022D2:
	mov	ecx,[eax+4h]
	mov	edx,[ecx+18h]
	push	eax
	call	edx
	add	esp,4h

l007022DE:
	mov	eax,[esi+4h]
	mov	ecx,[eax+0Ch]
	mov	edx,[edi+4h]
	mov	eax,[edx+0Ch]
	push	ecx
	mov	ecx,[0A16B7Ch]
	push	eax
	push	8D4BA8h
	push	8D6D48h
	push	ecx
	call	6E15D0h
	add	esp,14h
	xor	eax,eax

l00702307:
	pop	edi
	pop	esi
	ret
0070230A                               CC CC CC CC CC CC           ......

;; fn00702310: 00702310
;;   Called from:
;;     0070965E (in fn00708DC0)
fn00702310 proc
	push	esi
	mov	esi,[esp+0Ch]
	push	edi
	mov	edi,[esp+0Ch]
	push	0Ch
	push	esi
	push	edi
	call	701B50h
	add	esp,0Ch
	cmp	eax,0A16480h
	jnz	702367h

l0070232D:
	add	dword ptr [eax],0FFh
	jnz	70233Eh

l00702332:
	mov	ecx,[eax+4h]
	mov	edx,[ecx+18h]
	push	eax
	call	edx
	add	esp,4h

l0070233E:
	mov	eax,[esi+4h]
	mov	ecx,[eax+0Ch]
	mov	edx,[edi+4h]
	mov	eax,[edx+0Ch]
	push	ecx
	mov	ecx,[0A16B7Ch]
	push	eax
	push	8A6A50h
	push	8D6D48h
	push	ecx
	call	6E15D0h
	add	esp,14h
	xor	eax,eax

l00702367:
	pop	edi
	pop	esi
	ret
0070236A                               CC CC CC CC CC CC           ......
00702370 56 8B 74 24 0C 57 8B 7C 24 0C 6A 14 56 57 E8 CD V.t$.W.|$.j.VW..
00702380 F7 FF FF 83 C4 0C 3D 80 64 A1 00 75 3A 83 00 FF ......=.d..u:...
00702390 75 0C 8B 48 04 8B 51 18 50 FF D2 83 C4 04 8B 46 u..H..Q.P......F
007023A0 04 8B 48 0C 8B 57 04 8B 42 0C 51 8B 0D 7C 6B A1 ..H..W..B.Q..|k.
007023B0 00 50 68 28 6E 8D 00 68 48 6D 8D 00 51 E8 0E F2 .Ph(n..hHm..Q...
007023C0 FD FF 83 C4 14 33 C0 5F 5E C3 CC CC CC CC CC CC .....3._^.......

;; fn007023D0: 007023D0
;;   Called from:
;;     00709751 (in fn00708DC0)
;;     007265EE (in fn00726570)
fn007023D0 proc
	push	ebx
	mov	ebx,[esp+0Ch]
	push	esi
	mov	esi,[esp+0Ch]
	push	edi
	push	0h
	push	ebx
	push	esi
	call	701B50h
	add	esp,0Ch
	cmp	eax,0A16480h
	jnz	702444h

l007023EE:
	mov	ecx,[esi+4h]
	mov	edi,[ecx+34h]
	add	dword ptr [eax],0FFh
	jnz	702405h

l007023F9:
	mov	edx,[eax+4h]
	push	eax
	mov	eax,[edx+18h]
	call	eax
	add	esp,4h

l00702405:
	test	edi,edi
	jz	70241Bh

l00702409:
	mov	eax,[edi+4h]
	test	eax,eax
	jz	70241Bh

l00702410:
	push	ebx
	push	esi
	call	eax
	add	esp,8h
	pop	edi
	pop	esi
	pop	ebx
	ret

l0070241B:
	mov	ecx,[ebx+4h]
	mov	edx,[ecx+0Ch]
	mov	eax,[esi+4h]
	mov	ecx,[eax+0Ch]
	push	edx
	mov	edx,[0A16B7Ch]
	push	ecx
	push	8D6E34h
	push	8D6D48h
	push	edx
	call	6E15D0h
	add	esp,14h
	xor	eax,eax

l00702444:
	pop	edi
	pop	esi
	pop	ebx
	ret
00702448                         CC CC CC CC CC CC CC CC         ........

;; fn00702450: 00702450
;;   Called from:
;;     007096BF (in fn00708DC0)
;;     007265DC (in fn00726570)
fn00702450 proc
	push	esi
	mov	esi,[esp+0Ch]
	push	edi
	mov	edi,[esp+0Ch]
	push	88h
	push	esi
	push	edi
	call	701B50h
	add	esp,0Ch
	cmp	eax,0A16480h
	jnz	7024AAh

l00702470:
	add	dword ptr [eax],0FFh
	jnz	702481h

l00702475:
	mov	ecx,[eax+4h]
	mov	edx,[ecx+18h]
	push	eax
	call	edx
	add	esp,4h

l00702481:
	mov	eax,[esi+4h]
	mov	ecx,[eax+0Ch]
	mov	edx,[edi+4h]
	mov	eax,[edx+0Ch]
	push	ecx
	mov	ecx,[0A16B7Ch]
	push	eax
	push	8D6E38h
	push	8D6D48h
	push	ecx
	call	6E15D0h
	add	esp,14h
	xor	eax,eax

l007024AA:
	pop	edi
	pop	esi
	ret
007024AD                                        CC CC CC              ...

;; fn007024B0: 007024B0
;;   Called from:
;;     007096A3 (in fn00708DC0)
;;     007265D3 (in fn00726570)
fn007024B0 proc
	push	esi
	mov	esi,[esp+0Ch]
	push	edi
	mov	edi,[esp+0Ch]
	push	8Ch
	push	esi
	push	edi
	call	701B50h
	add	esp,0Ch
	cmp	eax,0A16480h
	jnz	70250Ah

l007024D0:
	add	dword ptr [eax],0FFh
	jnz	7024E1h

l007024D5:
	mov	ecx,[eax+4h]
	mov	edx,[ecx+18h]
	push	eax
	call	edx
	add	esp,4h

l007024E1:
	mov	eax,[esi+4h]
	mov	ecx,[eax+0Ch]
	mov	edx,[edi+4h]
	mov	eax,[edx+0Ch]
	push	ecx
	mov	ecx,[0A16B7Ch]
	push	eax
	push	8A6A50h
	push	8D6D48h
	push	ecx
	call	6E15D0h
	add	esp,14h
	xor	eax,eax

l0070250A:
	pop	edi
	pop	esi
	ret
0070250D                                        CC CC CC              ...

;; fn00702510: 00702510
;;   Called from:
;;     007096D8 (in fn00708DC0)
;;     007265E5 (in fn00726570)
fn00702510 proc
	push	esi
	mov	esi,[esp+0Ch]
	push	edi
	mov	edi,[esp+0Ch]
	push	10h
	push	esi
	push	edi
	call	701B50h
	add	esp,0Ch
	cmp	eax,0A16480h
	jnz	702567h

l0070252D:
	add	dword ptr [eax],0FFh
	jnz	70253Eh

l00702532:
	mov	ecx,[eax+4h]
	mov	edx,[ecx+18h]
	push	eax
	call	edx
	add	esp,4h

l0070253E:
	mov	eax,[esi+4h]
	mov	ecx,[eax+0Ch]
	mov	edx,[edi+4h]
	mov	eax,[edx+0Ch]
	push	ecx
	mov	ecx,[0A16B7Ch]
	push	eax
	push	8D4F8Ch
	push	8D6D48h
	push	ecx
	call	6E15D0h
	add	esp,14h
	xor	eax,eax

l00702567:
	pop	edi
	pop	esi
	ret
0070256A                               CC CC CC CC CC CC           ......

;; fn00702570: 00702570
;;   Called from:
;;     007095D0 (in fn00708DC0)
;;     007265BE (in fn00726570)
fn00702570 proc
	mov	eax,[esp+0Ch]
	mov	ecx,[esp+8h]
	mov	edx,[esp+4h]
	push	18h
	push	eax
	push	ecx
	push	edx
	call	701D30h
	add	esp,10h
	ret
0070258A                               CC CC CC CC CC CC           ......
00702590 8B 4E 04 8B 41 30 85 C0 74 30 F6 41 54 08 74 2A .N..A0..t0.AT.t*
007025A0 8B 4C 24 04 8B 04 08 85 C0 74 1F 57 56 FF D0 83 .L$......t.WV...
007025B0 C4 08 3D 80 64 A1 00 75 20 83 00 FF 75 0C 8B 50 ..=.d..u ...u..P
007025C0 04 50 8B 42 18 FF D0 83 C4 04 8B 4C 24 08 51 57 .P.B.......L$.QW
007025D0 56 E8 7A F5 FF FF 83 C4 0C C3 CC CC CC CC CC CC V.z.............

;; fn007025E0: 007025E0
;;   Called from:
;;     00702686 (in fn00702670)
;;     007026B6 (in fn007026A0)
;;     007026E3 (in fn007026D0)
;;     00702703 (in fn007026F0)
;;     00702723 (in fn00702710)
;;     00702743 (in fn00702730)
;;     00702763 (in fn00702750)
;;     00702789 (in fn00702770)
;;     007027B9 (in fn007027A0)
;;     007028B3 (in fn007028A0)
fn007025E0 proc
	mov	ecx,[esi+4h]
	mov	eax,[ecx+30h]
	test	eax,eax
	jz	70261Ah

l007025EA:
	test	byte ptr [ecx+54h],8h
	jz	70261Ah

l007025F0:
	mov	ecx,[esp+4h]
	mov	eax,[eax+ecx]
	test	eax,eax
	jz	70261Ah

l007025FB:
	push	edi
	push	esi
	call	eax
	add	esp,8h
	cmp	eax,0A16480h
	jnz	702669h

l00702609:
	add	dword ptr [eax],0FFh
	jnz	70261Ah

l0070260E:
	mov	edx,[eax+4h]
	push	eax
	mov	eax,[edx+18h]
	call	eax
	add	esp,4h

l0070261A:
	mov	ecx,[esp+8h]
	push	ecx
	push	edi
	push	esi
	call	701B50h
	add	esp,0Ch
	cmp	eax,0A16480h
	jnz	702669h

l00702630:
	add	dword ptr [eax],0FFh
	jnz	702641h

l00702635:
	mov	edx,[eax+4h]
	push	eax
	mov	eax,[edx+18h]
	call	eax
	add	esp,4h

l00702641:
	mov	ecx,[edi+4h]
	mov	edx,[ecx+0Ch]
	mov	eax,[esi+4h]
	mov	ecx,[eax+0Ch]
	mov	eax,[0A16B7Ch]
	push	edx
	mov	edx,[esp+10h]
	push	ecx
	push	edx
	push	8D6D48h
	push	eax
	call	6E15D0h
	add	esp,14h
	xor	eax,eax

l00702669:
	ret
0070266A                               CC CC CC CC CC CC           ......

;; fn00702670: 00702670
;;   Called from:
;;     00709AEE (in fn00708DC0)
fn00702670 proc
	push	esi
	mov	esi,[esp+8h]
	push	edi
	mov	edi,[esp+10h]
	push	8D6E3Ch
	push	40h
	push	84h
	call	7025E0h
	add	esp,0Ch
	pop	edi
	pop	esi
	ret
00702691    CC CC CC CC CC CC CC CC CC CC CC CC CC CC CC  ...............

;; fn007026A0: 007026A0
;;   Called from:
;;     00709AD5 (in fn00708DC0)
fn007026A0 proc
	push	esi
	mov	esi,[esp+8h]
	push	edi
	mov	edi,[esp+10h]
	push	8D6E40h
	push	3Ch
	push	80h
	call	7025E0h
	add	esp,0Ch
	pop	edi
	pop	esi
	ret
007026C1    CC CC CC CC CC CC CC CC CC CC CC CC CC CC CC  ...............

;; fn007026D0: 007026D0
;;   Called from:
;;     00709ABC (in fn00708DC0)
fn007026D0 proc
	push	esi
	mov	esi,[esp+8h]
	push	edi
	mov	edi,[esp+10h]
	push	8D6E44h
	push	38h
	push	7Ch
	call	7025E0h
	add	esp,0Ch
	pop	edi
	pop	esi
	ret
007026EE                                           CC CC               ..

;; fn007026F0: 007026F0
;;   Called from:
;;     00709A87 (in fn00708DC0)
fn007026F0 proc
	push	esi
	mov	esi,[esp+8h]
	push	edi
	mov	edi,[esp+10h]
	push	8D6E48h
	push	30h
	push	74h
	call	7025E0h
	add	esp,0Ch
	pop	edi
	pop	esi
	ret
0070270E                                           CC CC               ..

;; fn00702710: 00702710
;;   Called from:
;;     00709AA0 (in fn00708DC0)
fn00702710 proc
	push	esi
	mov	esi,[esp+8h]
	push	edi
	mov	edi,[esp+10h]
	push	8D6E4Ch
	push	34h
	push	78h
	call	7025E0h
	add	esp,0Ch
	pop	edi
	pop	esi
	ret
0070272E                                           CC CC               ..

;; fn00702730: 00702730
;;   Called from:
;;     00709A68 (in fn00708DC0)
fn00702730 proc
	push	esi
	mov	esi,[esp+8h]
	push	edi
	mov	edi,[esp+10h]
	push	8D6E50h
	push	4h
	push	60h
	call	7025E0h
	add	esp,0Ch
	pop	edi
	pop	esi
	ret
0070274E                                           CC CC               ..

;; fn00702750: 00702750
;;   Called from:
;;     0070995C (in fn00708DC0)
fn00702750 proc
	push	esi
	mov	esi,[esp+8h]
	push	edi
	mov	edi,[esp+10h]
	push	8D6E54h
	push	0Ch
	push	68h
	call	7025E0h
	add	esp,0Ch
	pop	edi
	pop	esi
	ret
0070276E                                           CC CC               ..

;; fn00702770: 00702770
;;   Called from:
;;     00709991 (in fn00708DC0)
fn00702770 proc
	push	esi
	mov	esi,[esp+8h]
	push	edi
	mov	edi,[esp+10h]
	push	8D6E58h
	push	88h
	push	90h
	call	7025E0h
	add	esp,0Ch
	pop	edi
	pop	esi
	ret
00702794             CC CC CC CC CC CC CC CC CC CC CC CC     ............

;; fn007027A0: 007027A0
;;   Called from:
;;     00709975 (in fn00708DC0)
fn007027A0 proc
	push	esi
	mov	esi,[esp+8h]
	push	edi
	mov	edi,[esp+10h]
	push	8D6E54h
	push	8Ch
	push	94h
	call	7025E0h
	add	esp,0Ch
	pop	edi
	pop	esi
	ret
007027C4             CC CC CC CC CC CC CC CC CC CC CC CC     ............

;; fn007027D0: 007027D0
;;   Called from:
;;     00709A0D (in fn00708DC0)
fn007027D0 proc
	push	ebp
	mov	ebp,[esp+0Ch]
	push	esi
	mov	esi,[esp+0Ch]
	mov	eax,[esi+4h]
	mov	ecx,[eax+30h]
	test	ecx,ecx
	push	edi
	jz	702815h

l007027E5:
	test	byte ptr [eax+54h],8h
	jz	702815h

l007027EB:
	mov	ecx,[ecx+5Ch]
	test	ecx,ecx
	jz	702815h

l007027F2:
	push	ebp
	push	esi
	call	ecx
	add	esp,8h
	cmp	eax,0A16480h
	jnz	70288Dh

l00702804:
	add	dword ptr [eax],0FFh
	jnz	702815h

l00702809:
	mov	ecx,[eax+4h]
	mov	edx,[ecx+18h]
	push	eax
	call	edx
	add	esp,4h

l00702815:
	push	0h
	push	ebp
	push	esi
	call	701B50h
	add	esp,0Ch
	cmp	eax,0A16480h
	jnz	70288Dh

l00702828:
	mov	ecx,[esi+4h]
	mov	edi,[ecx+34h]
	add	dword ptr [eax],0FFh
	jnz	70283Fh

l00702833:
	mov	edx,[eax+4h]
	push	eax
	mov	eax,[edx+18h]
	call	eax
	add	esp,4h

l0070283F:
	test	edi,edi
	jz	702865h

l00702843:
	mov	ecx,[esi+4h]
	test	byte ptr [ecx+54h],8h
	jz	702853h

l0070284C:
	mov	eax,[edi+20h]
	test	eax,eax
	jnz	70285Ah

l00702853:
	mov	eax,[edi+4h]
	test	eax,eax
	jz	702865h

l0070285A:
	push	ebp
	push	esi
	call	eax
	add	esp,8h
	pop	edi
	pop	esi
	pop	ebp
	ret

l00702865:
	mov	edx,[ebp+4h]
	mov	eax,[edx+0Ch]
	mov	ecx,[esi+4h]
	mov	edx,[ecx+0Ch]
	push	eax
	mov	eax,[0A16B7Ch]
	push	edx
	push	8D6E5Ch
	push	8D6D48h
	push	eax
	call	6E15D0h
	add	esp,14h
	xor	eax,eax

l0070288D:
	pop	edi
	pop	esi
	pop	ebp
	ret
00702891    CC CC CC CC CC CC CC CC CC CC CC CC CC CC CC  ...............

;; fn007028A0: 007028A0
;;   Called from:
;;     007099AA (in fn00708DC0)
fn007028A0 proc
	push	esi
	mov	esi,[esp+8h]
	push	edi
	mov	edi,[esp+10h]
	push	8D6E60h
	push	10h
	push	6Ch
	call	7025E0h
	add	esp,0Ch
	pop	edi
	pop	esi
	ret
007028BE                                           CC CC               ..

;; fn007028C0: 007028C0
;;   Called from:
;;     00709921 (in fn00708DC0)
fn007028C0 proc
	mov	ecx,[esp+4h]
	mov	eax,[ecx+4h]
	test	byte ptr [eax+54h],8h
	jz	7028F0h

l007028CD:
	mov	eax,[eax+30h]
	test	eax,eax
	jz	7028F0h

l007028D4:
	cmp	dword ptr [eax+70h],0h
	jz	7028F0h

l007028DA:
	mov	eax,[esp+0Ch]
	mov	edx,[esp+8h]
	push	70h
	push	eax
	push	edx
	push	ecx
	call	701D30h
	add	esp,10h
	ret

l007028F0:
	mov	eax,[esp+0Ch]
	mov	edx,[esp+8h]
	push	18h
	push	eax
	push	edx
	push	ecx
	call	701D30h
	add	esp,10h
	ret
00702906                   CC CC CC CC CC CC CC CC CC CC       ..........

;; fn00702910: 00702910
;;   Called from:
;;     007094F7 (in fn00708DC0)
;;     007267C6 (in fn00726760)
fn00702910 proc
	mov	edx,[esp+4h]
	test	edx,edx
	jnz	702937h

l00702918:
	call	6E0FC0h
	test	eax,eax
	jnz	702966h

l00702921:
	mov	eax,[0A18720h]
	push	8D6C90h
	push	eax
	call	6E0F80h
	add	esp,8h
	xor	eax,eax
	ret

l00702937:
	mov	ecx,[edx+4h]
	mov	eax,[ecx+30h]
	test	eax,eax
	jz	70294Eh

l00702941:
	mov	eax,[eax+1Ch]
	test	eax,eax
	jz	70294Eh

l00702948:
	mov	[esp+4h],edx
	jmp	eax

l0070294E:
	mov	ecx,[ecx+0Ch]
	mov	edx,[0A16B7Ch]
	push	ecx
	push	8D6E64h
	push	edx
	call	6E15D0h
	add	esp,0Ch

l00702966:
	xor	eax,eax
	ret
00702969                            CC CC CC CC CC CC CC          .......

;; fn00702970: 00702970
;;   Called from:
;;     007094C4 (in fn00708DC0)
fn00702970 proc
	mov	edx,[esp+4h]
	test	edx,edx
	jnz	702997h

l00702978:
	call	6E0FC0h
	test	eax,eax
	jnz	7029C6h

l00702981:
	mov	eax,[0A18720h]
	push	8D6C90h
	push	eax
	call	6E0F80h
	add	esp,8h
	xor	eax,eax
	ret

l00702997:
	mov	ecx,[edx+4h]
	mov	eax,[ecx+30h]
	test	eax,eax
	jz	7029AEh

l007029A1:
	mov	eax,[eax+20h]
	test	eax,eax
	jz	7029AEh

l007029A8:
	mov	[esp+4h],edx
	jmp	eax

l007029AE:
	mov	ecx,[ecx+0Ch]
	mov	edx,[0A16B7Ch]
	push	ecx
	push	8D6E8Ch
	push	edx
	call	6E15D0h
	add	esp,0Ch

l007029C6:
	xor	eax,eax
	ret
007029C9                            CC CC CC CC CC CC CC          .......

;; fn007029D0: 007029D0
;;   Called from:
;;     00709597 (in fn00708DC0)
;;     007267A8 (in fn00726760)
fn007029D0 proc
	mov	edx,[esp+4h]
	test	edx,edx
	jnz	7029F7h

l007029D8:
	call	6E0FC0h
	test	eax,eax
	jnz	702A26h

l007029E1:
	mov	eax,[0A18720h]
	push	8D6C90h
	push	eax
	call	6E0F80h
	add	esp,8h
	xor	eax,eax
	ret

l007029F7:
	mov	ecx,[edx+4h]
	mov	eax,[ecx+30h]
	test	eax,eax
	jz	702A0Eh

l00702A01:
	mov	eax,[eax+2Ch]
	test	eax,eax
	jz	702A0Eh

l00702A08:
	mov	[esp+4h],edx
	jmp	eax

l00702A0E:
	mov	ecx,[ecx+0Ch]
	mov	edx,[0A16B7Ch]
	push	ecx
	push	8D6EB4h
	push	edx
	call	6E15D0h
	add	esp,0Ch

l00702A26:
	xor	eax,eax
	ret
00702A29                            CC CC CC CC CC CC CC          .......
00702A30 8B 54 24 04 85 D2 75 1F E8 83 E5 FD FF 85 C0 75 .T$...u........u
00702A40 45 A1 20 87 A1 00 68 90 6C 8D 00 50 E8 2F E5 FD E. ...h.l..P./..
00702A50 FF 83 C4 08 33 C0 C3 8B 4A 04 8B 41 30 85 C0 74 ....3...J..A0..t
00702A60 0D 8B 40 24 85 C0 74 06 89 54 24 04 FF E0 8B 49 ..@$..t..T$....I
00702A70 0C 8B 15 7C 6B A1 00 51 68 DC 6E 8D 00 52 E8 4D ...|k..Qh.n..R.M
00702A80 EB FD FF 83 C4 0C 33 C0 C3 CC CC CC CC CC CC CC ......3.........
00702A90 51 56 57 8B F8 6A 0A 8D 44 24 0C 50 57 E8 EE 29 QVW..j..D$.PW..)
00702AA0 00 00 8B F0 83 C4 0C 85 F6 74 31 8B 4C 24 10 03 .........t1.L$..
00702AB0 F9 39 7C 24 08 74 27 8B 15 2C 7E A1 00 68 04 6F .9|$.t'..,~..h.o
00702AC0 8D 00 52 E8 B8 E4 FD FF 83 C4 08 83 06 FF 75 0C ..R...........u.
00702AD0 8B 46 04 8B 48 18 56 FF D1 83 C4 04 33 C0 5F 5E .F..H.V.....3._^
00702AE0 59 C3 CC CC CC CC CC CC CC CC CC CC CC CC CC CC Y...............

;; fn00702AF0: 00702AF0
;;   Called from:
;;     00702C37 (in fn00702C30)
fn00702AF0 proc
	push	esi
	mov	esi,[esp+8h]
	push	edi
	xor	edi,edi
	test	esi,esi
	jnz	702B1Dh

l00702AFC:
	call	6E0FC0h
	test	eax,eax
	jnz	702B18h

l00702B05:
	mov	eax,[0A18720h]
	push	8D6C90h
	push	eax
	call	6E0F80h
	add	esp,8h

l00702B18:
	pop	edi
	xor	eax,eax
	pop	esi
	ret

l00702B1D:
	mov	eax,[esi+4h]
	cmp	eax,0A1E7E8h
	jz	702C1Fh

l00702B2B:
	push	0A1E7E8h
	push	eax
	call	6D5670h
	add	esp,8h
	test	eax,eax
	jnz	702C1Fh

l00702B41:
	mov	eax,[esi+4h]
	cmp	eax,0A1F400h
	jz	702C1Fh

l00702B4F:
	push	0A1F400h
	push	eax
	call	6D5670h
	add	esp,8h
	test	eax,eax
	jnz	702C1Fh

l00702B65:
	mov	ecx,[esi+4h]
	mov	eax,[ecx+30h]
	test	eax,eax
	jz	702C02h

l00702B73:
	test	dword ptr [ecx+54h],20000h
	jz	702C02h

l00702B80:
	mov	eax,[eax+98h]
	test	eax,eax
	jz	702C02h

l00702B8A:
	push	esi
	call	eax
	mov	edi,eax
	add	esp,4h
	test	edi,edi
	jz	702C1Ah

l00702B9A:
	mov	eax,[edi+4h]
	cmp	eax,0A1E7E8h
	jz	702C1Ah

l00702BA4:
	push	0A1E7E8h
	push	eax
	call	6D5670h
	add	esp,8h
	test	eax,eax
	jnz	702C1Ah

l00702BB6:
	mov	eax,[edi+4h]
	cmp	eax,0A1F400h
	jz	702C1Ah

l00702BC0:
	push	0A1F400h
	push	eax
	call	6D5670h
	add	esp,8h
	test	eax,eax
	jnz	702C1Ah

l00702BD2:
	mov	ecx,[edi+4h]
	mov	edx,[ecx+0Ch]
	mov	eax,[0A16B7Ch]
	push	edx
	push	8D6F58h
	push	eax
	call	6E15D0h
	add	esp,0Ch
	add	dword ptr [edi],0FFh
	jnz	702BFDh

l00702BF1:
	mov	ecx,[edi+4h]
	mov	edx,[ecx+18h]
	push	edi
	call	edx
	add	esp,4h

l00702BFD:
	pop	edi
	xor	eax,eax
	pop	esi
	ret

l00702C02:
	mov	eax,[ecx+0Ch]
	mov	ecx,[0A16B7Ch]
	push	eax
	push	8D6F24h
	push	ecx
	call	6E15D0h
	add	esp,0Ch

l00702C1A:
	mov	eax,edi
	pop	edi
	pop	esi
	ret

l00702C1F:
	add	dword ptr [esi],1h
	pop	edi
	mov	eax,esi
	pop	esi
	ret
00702C27                      CC CC CC CC CC CC CC CC CC        .........

;; fn00702C30: 00702C30
;;   Called from:
;;     00704281 (in fn00704220)
;;     00704370 (in fn00704300)
;;     00704463 (in fn00704400)
;;     00704514 (in fn007044F0)
;;     00707DB4 (in fn00707D70)
fn00702C30 proc
	push	ebx
	mov	ebx,[esp+8h]
	push	esi
	push	ebx
	call	702AF0h
	mov	esi,eax
	add	esp,4h
	test	esi,esi
	jnz	702C4Bh

l00702C45:
	pop	esi
	or	eax,0FFh
	pop	ebx
	ret

l00702C4B:
	push	edi
	push	esi
	call	7052C0h
	mov	edi,eax
	add	esp,4h
	cmp	edi,0FFh
	jnz	702CB5h

l00702C5C:
	call	6E0FC0h
	test	eax,eax
	jz	702CB5h

l00702C65:
	mov	ecx,[0A18598h]
	push	ecx
	push	eax
	call	6E0FD0h
	add	esp,8h
	test	eax,eax
	jz	702CB5h

l00702C79:
	call	6E1160h
	mov	eax,[esp+14h]
	test	eax,eax
	jnz	702CA0h

l00702C86:
	push	esi
	call	710C20h
	xor	edx,edx
	add	esp,4h
	test	eax,eax
	setl	dl
	add	edx,7FFFFFFFh
	mov	edi,edx
	jmp	702CB5h

l00702CA0:
	mov	ecx,[ebx+4h]
	mov	edx,[ecx+0Ch]
	push	edx
	push	8D6F88h
	push	eax
	call	6E15D0h
	add	esp,0Ch

l00702CB5:
	add	dword ptr [esi],0FFh
	jnz	702CC6h

l00702CBA:
	mov	eax,[esi+4h]
	mov	ecx,[eax+18h]
	push	esi
	call	ecx
	add	esp,4h

l00702CC6:
	mov	eax,edi
	pop	edi
	pop	esi
	pop	ebx
	ret
00702CCC                                     CC CC CC CC             ....
00702CD0 51 56 8B 74 24 0C 85 F6 75 21 E8 E1 E2 FD FF 85 QV.t$...u!......
00702CE0 C0 75 13 A1 20 87 A1 00 68 90 6C 8D 00 50 E8 8D .u.. ...h.l..P..
00702CF0 E2 FD FF 83 C4 08 33 C0 5E 59 C3 8B 4E 04 81 F9 ......3.^Y..N...
00702D00 E8 E7 A1 00 75 08 83 06 01 8B C6 5E 59 C3 8B 41 ....u......^Y..A
00702D10 30 85 C0 74 7F 8B 40 48 85 C0 74 78 56 FF D0 8B 0..t..@H..txV...
00702D20 F0 83 C4 04 85 F6 74 E1 8B 46 04 3D E8 E7 A1 00 ......t..F.=....
00702D30 74 D7 68 E8 E7 A1 00 50 E8 33 29 FD FF 83 C4 08 t.h....P.3).....
00702D40 85 C0 75 C5 8B 46 04 3D 00 F4 A1 00 74 BB 68 00 ..u..F.=....t.h.
00702D50 F4 A1 00 50 E8 17 29 FD FF 83 C4 08 85 C0 75 A9 ...P..).......u.
00702D60 8B 4E 04 8B 51 0C A1 7C 6B A1 00 52 68 F4 6F 8D .N..Q..|k..Rh.o.
00702D70 00 50 E8 59 E8 FD FF 83 C4 0C 83 06 FF 0F 85 73 .P.Y...........s
00702D80 FF FF FF 8B 4E 04 8B 51 18 56 FF D2 83 C4 04 33 ....N..Q.V.....3
00702D90 C0 5E 59 C3 68 E8 E7 A1 00 51 E8 D1 28 FD FF 83 .^Y.h....Q..(...
00702DA0 C4 08 85 C0 0F 85 A1 00 00 00 8B 46 04 3D 50 B4 ...........F.=P.
00702DB0 A1 00 0F 84 81 00 00 00 68 50 B4 A1 00 50 E8 AD ........hP...P..
00702DC0 28 FD FF 83 C4 08 85 C0 75 6F 8B 46 04 3D 20 3B (.......uo.F.= ;
00702DD0 A2 00 74 50 68 20 3B A2 00 50 E8 91 28 FD FF 83 ..tPh ;..P..(...
00702DE0 C4 08 85 C0 75 3E 8D 44 24 0C 50 8D 4C 24 08 51 ....u>.D$.P.L$.Q
00702DF0 56 E8 8A EA FF FF 83 C4 0C 85 C0 75 15 8B 54 24 V..........u..T$
00702E00 0C 8B 44 24 04 5E 83 C4 04 89 54 24 04 E9 7E FC ..D$.^....T$..~.
00702E10 FF FF 68 B8 6F 8D 00 8B C6 E8 E2 E9 FF FF 83 C4 ..h.o...........
00702E20 04 5E 59 C3 8B 46 08 8B 4E 0C 6A 0A 50 51 E8 2D .^Y..F..N.j.PQ.-
00702E30 28 00 00 83 C4 0C 5E 59 C3 8B 56 08 52 8D 46 14 (.....^Y..V.R.F.
00702E40 E8 4B FC FF FF 83 C4 04 5E 59 C3 8B 46 08 5E 83 .K......^Y..F.^.
00702E50 C4 04 89 44 24 04 E9 45 22 00 00 CC CC CC CC CC ...D$..E".......
00702E60 51 56 57 8B F8 6A 0A 8D 44 24 0C 50 57 E8 7E F2 QVW..j..D$.PW.~.
00702E70 00 00 8B F0 83 C4 0C 85 F6 74 31 8B 4C 24 10 03 .........t1.L$..
00702E80 F9 39 7C 24 08 74 27 8B 15 2C 7E A1 00 68 1C 70 .9|$.t'..,~..h.p
00702E90 8D 00 52 E8 E8 E0 FD FF 83 C4 08 83 06 FF 75 0C ..R...........u.
00702EA0 8B 46 04 8B 48 18 56 FF D1 83 C4 04 33 C0 5F 5E .F..H.V.....3._^
00702EB0 59 C3 CC CC CC CC CC CC CC CC CC CC CC CC CC CC Y...............
00702EC0 51 56 8B 74 24 0C 85 F6 75 21 E8 F1 E0 FD FF 85 QV.t$...u!......
00702ED0 C0 75 13 A1 20 87 A1 00 68 90 6C 8D 00 50 E8 9D .u.. ...h.l..P..
00702EE0 E0 FD FF 83 C4 08 33 C0 5E 59 C3 8B 4E 04 8B 41 ......3.^Y..N..A
00702EF0 30 85 C0 0F 84 80 00 00 00 8B 40 4C 85 C0 74 79 0.........@L..ty
00702F00 56 FF D0 8B F0 83 C4 04 85 F6 74 68 8B 46 04 3D V.........th.F.=
00702F10 E8 E7 A1 00 74 5E 68 E8 E7 A1 00 50 E8 4F 27 FD ....t^h....P.O'.
00702F20 FF 83 C4 08 85 C0 75 4C 8B 46 04 3D 00 F4 A1 00 ......uL.F.=....
00702F30 74 42 68 00 F4 A1 00 50 E8 33 27 FD FF 83 C4 08 tBh....P.3'.....
00702F40 85 C0 75 30 8B 4E 04 8B 51 0C A1 7C 6B A1 00 52 ..u0.N..Q..|k..R
00702F50 68 7C 70 8D 00 50 E8 75 E6 FD FF 83 C4 0C 83 06 h|p..P.u........
00702F60 FF 75 0C 8B 4E 04 8B 51 18 56 FF D2 83 C4 04 33 .u..N..Q.V.....3
00702F70 C0 5E 59 C3 8B C6 5E 59 C3 81 F9 00 F4 A1 00 0F .^Y...^Y........
00702F80 84 B7 00 00 00 68 00 F4 A1 00 51 E8 E0 26 FD FF .....h....Q..&..
00702F90 83 C4 08 85 C0 0F 85 A1 00 00 00 8B 46 04 3D 50 ............F.=P
00702FA0 B4 A1 00 0F 84 81 00 00 00 68 50 B4 A1 00 50 E8 .........hP...P.
00702FB0 BC 26 FD FF 83 C4 08 85 C0 75 6F 8B 46 04 3D 20 .&.......uo.F.= 
00702FC0 3B A2 00 74 50 68 20 3B A2 00 50 E8 A0 26 FD FF ;..tPh ;..P..&..
00702FD0 83 C4 08 85 C0 75 3E 8D 44 24 0C 50 8D 4C 24 08 .....u>.D$.P.L$.
00702FE0 51 56 E8 99 E8 FF FF 83 C4 0C 85 C0 75 15 8B 54 QV..........u..T
00702FF0 24 0C 8B 44 24 04 5E 83 C4 04 89 54 24 04 E9 5D $..D$.^....T$..]
00703000 FE FF FF 68 40 70 8D 00 8B C6 E8 F1 E7 FF FF 83 ...h@p..........
00703010 C4 04 5E 59 C3 8B 46 08 8B 4E 0C 6A 0A 50 51 E8 ..^Y..F..N.j.PQ.
00703020 6C F5 00 00 83 C4 0C 5E 59 C3 8B 56 08 52 8D 46 l......^Y..V.R.F
00703030 14 E8 2A FE FF FF 83 C4 04 5E 59 C3 56 E8 CE D5 ..*......^Y.V...
00703040 00 00 83 C4 04 5E 59 C3 CC CC CC CC CC CC CC CC .....^Y.........
00703050 56 8B 74 24 08 85 F6 75 20 E8 62 DF FD FF 85 C0 V.t$...u .b.....
00703060 75 13 A1 20 87 A1 00 68 90 6C 8D 00 50 E8 0E DF u.. ...h.l..P...
00703070 FD FF 83 C4 08 33 C0 5E C3 8B 4E 04 8B 41 30 85 .....3.^..N..A0.
00703080 C0 74 62 8B 40 50 85 C0 74 5B 56 FF D0 8B F0 83 .tb.@P..t[V.....
00703090 C4 04 85 F6 74 4B 8B 46 04 3D B8 E4 A1 00 74 41 ....tK.F.=....tA
007030A0 68 B8 E4 A1 00 50 E8 C5 25 FD FF 83 C4 08 85 C0 h....P..%.......
007030B0 75 2F 8B 4E 04 8B 51 0C A1 7C 6B A1 00 52 68 A8 u/.N..Q..|k..Rh.
007030C0 70 8D 00 50 E8 07 E5 FD FF 83 C4 0C 83 06 FF 75 p..P...........u
007030D0 0C 8B 4E 04 8B 51 18 56 FF D2 83 C4 04 33 C0 5E ..N..Q.V.....3.^
007030E0 C3 8B C6 5E C3 81 F9 B8 E4 A1 00 74 1E 68 B8 E4 ...^.......t.h..
007030F0 A1 00 51 E8 78 25 FD FF 83 C4 08 85 C0 75 0C 50 ..Q.x%.......u.P
00703100 56 E8 9A BF FF FF 83 C4 08 5E C3 DD 46 08 83 EC V........^..F...
00703110 08 DD 1C 24 E8 47 BF FF FF 83 C4 08 5E C3 CC CC ...$.G......^...

;; fn00703120: 00703120
;;   Called from:
;;     006E57BD (in fn006E5710)
fn00703120 proc
	mov	edx,[esp+4h]
	test	edx,edx
	jnz	703148h

l00703128:
	call	6E0FC0h
	test	eax,eax
	jnz	703176h

l00703131:
	mov	eax,[0A18720h]
	push	8D6C90h
	push	eax
	call	6E0F80h
	add	esp,8h
	or	eax,0FFh
	ret

l00703148:
	mov	ecx,[edx+4h]
	mov	eax,[ecx+34h]
	test	eax,eax
	jz	70315Eh

l00703152:
	mov	eax,[eax]
	test	eax,eax
	jz	70315Eh

l00703158:
	mov	[esp+4h],edx
	jmp	eax

l0070315E:
	mov	ecx,[ecx+0Ch]
	mov	edx,[0A16B7Ch]
	push	ecx
	push	8D70D4h
	push	edx
	call	6E15D0h
	add	esp,0Ch

l00703176:
	or	eax,0FFh
	ret
0070317A                               CC CC CC CC CC CC           ......

;; fn00703180: 00703180
;;   Called from:
;;     006E581D (in fn006E5710)
;;     006F8CA1 (in fn006F8C70)
;;     006F8DEB (in fn006F8C70)
;;     0070429B (in fn00704220)
;;     007082CE (in fn00708210)
;;     0070838D (in fn00708210)
fn00703180 proc
	push	edi
	mov	edi,[esp+8h]
	test	edi,edi
	jnz	7031A9h

l00703189:
	call	6E0FC0h
	test	eax,eax
	jnz	7031A5h

l00703192:
	mov	eax,[0A18720h]
	push	8D6C90h
	push	eax
	call	6E0F80h
	add	esp,8h

l007031A5:
	xor	eax,eax
	pop	edi
	ret

l007031A9:
	mov	eax,[edi+4h]
	push	esi
	mov	esi,[eax+34h]
	test	esi,esi
	jz	7031E9h

l007031B4:
	cmp	dword ptr [esi+0Ch],0h
	jz	7031E9h

l007031BA:
	push	ebx
	mov	ebx,[esp+14h]
	test	ebx,ebx
	jge	7031DBh

l007031C3:
	mov	eax,[esi]
	test	eax,eax
	jz	7031DBh

l007031C9:
	push	edi
	call	eax
	add	esp,4h
	test	eax,eax
	jge	7031D9h

l007031D3:
	pop	ebx
	pop	esi
	xor	eax,eax
	pop	edi
	ret

l007031D9:
	add	ebx,eax

l007031DB:
	mov	ecx,[esi+0Ch]
	push	ebx
	push	edi
	call	ecx
	add	esp,8h
	pop	ebx
	pop	esi
	pop	edi
	ret

l007031E9:
	mov	edx,[eax+0Ch]
	mov	eax,[0A16B7Ch]
	push	edx
	push	8D70FCh
	push	eax
	call	6E15D0h
	add	esp,0Ch
	pop	esi
	xor	eax,eax
	pop	edi
	ret
00703205                CC CC CC CC CC CC CC CC CC CC CC      ...........

;; fn00703210: 00703210
;;   Called from:
;;     00707F1F (in fn00707E00)
fn00703210 proc
	push	ebx
	mov	ebx,[esp+8h]
	test	ebx,ebx
	jnz	703239h

l00703219:
	call	6E0FC0h
	test	eax,eax
	jnz	703235h

l00703222:
	mov	eax,[0A18720h]
	push	8D6C90h
	push	eax
	call	6E0F80h
	add	esp,8h

l00703235:
	xor	eax,eax
	pop	ebx
	ret

l00703239:
	mov	eax,[ebx+4h]
	push	esi
	mov	esi,[eax+34h]
	test	esi,esi
	push	edi
	jz	70328Fh

l00703245:
	cmp	dword ptr [esi+10h],0h
	jz	70328Fh

l0070324B:
	mov	edi,[esp+18h]
	push	ebp
	mov	ebp,[esp+18h]
	test	ebp,ebp
	jl	70325Ch

l00703258:
	test	edi,edi
	jge	70327Fh

l0070325C:
	mov	eax,[esi]
	test	eax,eax
	jz	70327Fh

l00703262:
	push	ebx
	call	eax
	add	esp,4h
	test	eax,eax
	jge	703273h

l0070326C:
	pop	ebp
	pop	edi
	pop	esi
	xor	eax,eax
	pop	ebx
	ret

l00703273:
	test	ebp,ebp
	jge	703279h

l00703277:
	add	ebp,eax

l00703279:
	test	edi,edi
	jge	70327Fh

l0070327D:
	add	edi,eax

l0070327F:
	mov	ecx,[esi+10h]
	push	edi
	push	ebp
	push	ebx
	call	ecx
	add	esp,0Ch
	pop	ebp
	pop	edi
	pop	esi
	pop	ebx
	ret

l0070328F:
	mov	edi,[eax+38h]
	test	edi,edi
	jz	7032D7h

l00703296:
	cmp	dword ptr [edi+4h],0h
	jz	7032D7h

l0070329C:
	mov	edx,[esp+18h]
	mov	eax,[esp+14h]
	push	edx
	push	eax
	call	72F230h
	mov	esi,eax
	add	esp,8h
	test	esi,esi
	jz	7032EFh

l007032B4:
	mov	ecx,[edi+4h]
	push	esi
	push	ebx
	call	ecx
	add	esp,8h
	add	dword ptr [esi],0FFh
	mov	edi,eax
	jnz	7032D1h

l007032C5:
	mov	edx,[esi+4h]
	mov	eax,[edx+18h]
	push	esi
	call	eax
	add	esp,4h

l007032D1:
	mov	eax,edi
	pop	edi
	pop	esi
	pop	ebx
	ret

l007032D7:
	mov	ecx,[eax+0Ch]
	mov	edx,[0A16B7Ch]
	push	ecx
	push	8D711Ch
	push	edx
	call	6E15D0h
	add	esp,0Ch

l007032EF:
	pop	edi
	pop	esi
	xor	eax,eax
	pop	ebx
	ret
007032F5                CC CC CC CC CC CC CC CC CC CC CC      ...........

;; fn00703300: 00703300
;;   Called from:
;;     0070438B (in fn00704300)
fn00703300 proc
	push	edi
	mov	edi,[esp+8h]
	test	edi,edi
	jnz	70332Ah

l00703309:
	call	6E0FC0h
	test	eax,eax
	jnz	703325h

l00703312:
	mov	eax,[0A18720h]
	push	8D6C90h
	push	eax
	call	6E0F80h
	add	esp,8h

l00703325:
	or	eax,0FFh
	pop	edi
	ret

l0070332A:
	mov	eax,[edi+4h]
	push	esi
	mov	esi,[eax+34h]
	test	esi,esi
	jz	703370h

l00703335:
	cmp	dword ptr [esi+14h],0h
	jz	703370h

l0070333B:
	push	ebx
	mov	ebx,[esp+14h]
	test	ebx,ebx
	jge	70335Dh

l00703344:
	mov	eax,[esi]
	test	eax,eax
	jz	70335Dh

l0070334A:
	push	edi
	call	eax
	add	esp,4h
	test	eax,eax
	jge	70335Bh

l00703354:
	pop	ebx
	pop	esi
	or	eax,0FFh
	pop	edi
	ret

l0070335B:
	add	ebx,eax

l0070335D:
	mov	ecx,[esp+18h]
	mov	edx,[esi+14h]
	push	ecx
	push	ebx
	push	edi
	call	edx
	add	esp,0Ch
	pop	ebx
	pop	esi
	pop	edi
	ret

l00703370:
	mov	eax,[eax+0Ch]
	mov	ecx,[0A16B7Ch]
	push	eax
	push	8D713Ch
	push	ecx
	call	6E15D0h
	add	esp,0Ch
	pop	esi
	or	eax,0FFh
	pop	edi
	ret
0070338E                                           CC CC               ..

;; fn00703390: 00703390
;;   Called from:
;;     0070447D (in fn00704400)
;;     007272BC (in fn00727290)
;;     0072C2C8 (in fn0072C160)
;;     00748072 (in fn00748030)
fn00703390 proc
	push	edi
	mov	edi,[esp+8h]
	test	edi,edi
	jnz	7033BAh

l00703399:
	call	6E0FC0h
	test	eax,eax
	jnz	7033B5h

l007033A2:
	mov	eax,[0A18720h]
	push	8D6C90h
	push	eax
	call	6E0F80h
	add	esp,8h

l007033B5:
	or	eax,0FFh
	pop	edi
	ret

l007033BA:
	mov	eax,[edi+4h]
	push	esi
	mov	esi,[eax+34h]
	test	esi,esi
	jz	7033FDh

l007033C5:
	cmp	dword ptr [esi+14h],0h
	jz	7033FDh

l007033CB:
	push	ebx
	mov	ebx,[esp+14h]
	test	ebx,ebx
	jge	7033EDh

l007033D4:
	mov	eax,[esi]
	test	eax,eax
	jz	7033EDh

l007033DA:
	push	edi
	call	eax
	add	esp,4h
	test	eax,eax
	jge	7033EBh

l007033E4:
	pop	ebx
	pop	esi
	or	eax,0FFh
	pop	edi
	ret

l007033EB:
	add	ebx,eax

l007033ED:
	mov	ecx,[esi+14h]
	push	0h
	push	ebx
	push	edi
	call	ecx
	add	esp,0Ch
	pop	ebx
	pop	esi
	pop	edi
	ret

l007033FD:
	mov	edx,[eax+0Ch]
	mov	eax,[0A16B7Ch]
	push	edx
	push	8D7170h
	push	eax
	call	6E15D0h
	add	esp,0Ch
	pop	esi
	or	eax,0FFh
	pop	edi
	ret
0070341A                               CC CC CC CC CC CC           ......

;; fn00703420: 00703420
;;   Called from:
;;     007080BE (in fn00707F70)
fn00703420 proc
	push	ebx
	mov	ebx,[esp+8h]
	test	ebx,ebx
	jnz	70344Ah

l00703429:
	call	6E0FC0h
	test	eax,eax
	jnz	703445h

l00703432:
	mov	eax,[0A18720h]
	push	8D6C90h
	push	eax
	call	6E0F80h
	add	esp,8h

l00703445:
	or	eax,0FFh
	pop	ebx
	ret

l0070344A:
	mov	eax,[ebx+4h]
	push	esi
	mov	esi,[eax+34h]
	test	esi,esi
	push	edi
	jz	7034A6h

l00703456:
	cmp	dword ptr [esi+18h],0h
	jz	7034A6h

l0070345C:
	mov	edi,[esp+18h]
	push	ebp
	mov	ebp,[esp+18h]
	test	ebp,ebp
	jl	70346Dh

l00703469:
	test	edi,edi
	jge	703491h

l0070346D:
	mov	eax,[esi]
	test	eax,eax
	jz	703491h

l00703473:
	push	ebx
	call	eax
	add	esp,4h
	test	eax,eax
	jge	703485h

l0070347D:
	pop	ebp
	pop	edi
	pop	esi
	or	eax,0FFh
	pop	ebx
	ret

l00703485:
	test	ebp,ebp
	jge	70348Bh

l00703489:
	add	ebp,eax

l0070348B:
	test	edi,edi
	jge	703491h

l0070348F:
	add	edi,eax

l00703491:
	mov	ecx,[esp+20h]
	mov	edx,[esi+18h]
	push	ecx
	push	edi
	push	ebp
	push	ebx
	call	edx
	add	esp,10h
	pop	ebp
	pop	edi
	pop	esi
	pop	ebx
	ret

l007034A6:
	mov	edi,[eax+38h]
	test	edi,edi
	jz	7034F3h

l007034AD:
	cmp	dword ptr [edi+8h],0h
	jz	7034F3h

l007034B3:
	mov	eax,[esp+18h]
	mov	ecx,[esp+14h]
	push	eax
	push	ecx
	call	72F230h
	mov	esi,eax
	add	esp,8h
	test	esi,esi
	jz	70350Bh

l007034CB:
	mov	edx,[esp+1Ch]
	mov	eax,[edi+8h]
	push	edx
	push	esi
	push	ebx
	call	eax
	add	esp,0Ch
	add	dword ptr [esi],0FFh
	mov	edi,eax
	jnz	7034EDh

l007034E1:
	mov	ecx,[esi+4h]
	mov	edx,[ecx+18h]
	push	esi
	call	edx
	add	esp,4h

l007034ED:
	mov	eax,edi
	pop	edi
	pop	esi
	pop	ebx
	ret

l007034F3:
	mov	eax,[eax+0Ch]
	mov	ecx,[0A16B7Ch]
	push	eax
	push	8D71A0h
	push	ecx
	call	6E15D0h
	add	esp,0Ch

l0070350B:
	pop	edi
	pop	esi
	or	eax,0FFh
	pop	ebx
	ret
00703512       CC CC CC CC CC CC CC CC CC CC CC CC CC CC   ..............

;; fn00703520: 00703520
;;   Called from:
;;     007080A4 (in fn00707F70)
fn00703520 proc
	push	edi
	mov	edi,[esp+8h]
	test	edi,edi
	jnz	70354Ah

l00703529:
	call	6E0FC0h
	test	eax,eax
	jnz	703545h

l00703532:
	mov	eax,[0A18720h]
	push	8D6C90h
	push	eax
	call	6E0F80h
	add	esp,8h

l00703545:
	or	eax,0FFh
	pop	edi
	ret

l0070354A:
	mov	eax,[edi+4h]
	push	esi
	mov	esi,[eax+34h]
	test	esi,esi
	jz	7035A3h

l00703555:
	cmp	dword ptr [esi+18h],0h
	jz	7035A3h

l0070355B:
	push	ebx
	mov	ebx,[esp+18h]
	push	ebp
	mov	ebp,[esp+18h]
	test	ebp,ebp
	jl	70356Dh

l00703569:
	test	ebx,ebx
	jge	703591h

l0070356D:
	mov	eax,[esi]
	test	eax,eax
	jz	703591h

l00703573:
	push	edi
	call	eax
	add	esp,4h
	test	eax,eax
	jge	703585h

l0070357D:
	pop	ebp
	pop	ebx
	pop	esi
	or	eax,0FFh
	pop	edi
	ret

l00703585:
	test	ebp,ebp
	jge	70358Bh

l00703589:
	add	ebp,eax

l0070358B:
	test	ebx,ebx
	jge	703591h

l0070358F:
	add	ebx,eax

l00703591:
	mov	ecx,[esi+18h]
	push	0h
	push	ebx
	push	ebp
	push	edi
	call	ecx
	add	esp,10h
	pop	ebp
	pop	ebx
	pop	esi
	pop	edi
	ret

l007035A3:
	mov	edx,[eax+0Ch]
	mov	eax,[0A16B7Ch]
	push	edx
	push	8D71D4h
	push	eax
	call	6E15D0h
	add	esp,0Ch
	pop	esi
	or	eax,0FFh
	pop	edi
	ret

;; fn007035C0: 007035C0
;;   Called from:
;;     00704E16 (in fn00704DA0)
;;     00728C10 (in fn00728BE0)
fn007035C0 proc
	push	edi
	mov	edi,[esp+8h]
	test	edi,edi
	jnz	7035E9h

l007035C9:
	call	6E0FC0h
	test	eax,eax
	jnz	7035E5h

l007035D2:
	mov	eax,[0A18720h]
	push	8D6C90h
	push	eax
	call	6E0F80h
	add	esp,8h

l007035E5:
	xor	eax,eax
	pop	edi
	ret

l007035E9:
	push	esi
	push	0h
	call	6F2650h
	mov	esi,eax
	add	esp,4h
	test	esi,esi
	jz	703619h

l007035FA:
	push	edi
	push	esi
	call	6F3930h
	add	esp,8h
	test	eax,eax
	jnz	70361Eh

l00703608:
	add	dword ptr [esi],0FFh
	jnz	703619h

l0070360D:
	mov	ecx,[esi+4h]
	mov	edx,[ecx+18h]
	push	esi
	call	edx
	add	esp,4h

l00703619:
	pop	esi
	xor	eax,eax
	pop	edi
	ret

l0070361E:
	add	dword ptr [eax],0FFh
	jnz	70362Fh

l00703623:
	mov	ecx,[eax+4h]
	mov	edx,[ecx+18h]
	push	eax
	call	edx
	add	esp,4h

l0070362F:
	mov	eax,esi
	pop	esi
	pop	edi
	ret
00703634             CC CC CC CC CC CC CC CC CC CC CC CC     ............

;; fn00703640: 00703640
;;   Called from:
;;     0070BE93 (in fn0070BCC0)
fn00703640 proc
	mov	ecx,[esp+4h]
	test	ecx,ecx
	jz	703681h

l00703648:
	mov	eax,[ecx+4h]
	cmp	eax,0A1EB98h
	jnz	703661h

l00703652:
	push	8D0B00h
	push	ecx
	call	6DF7C0h
	add	esp,8h
	ret

l00703661:
	mov	ecx,[eax+38h]
	test	ecx,ecx
	jz	703681h

l00703668:
	cmp	dword ptr [ecx+4h],0h
	jz	703681h

l0070366E:
	mov	eax,[eax+34h]
	test	eax,eax
	jz	70367Bh

l00703675:
	cmp	dword ptr [eax+10h],0h
	jnz	703681h

l0070367B:
	mov	eax,1h
	ret

l00703681:
	xor	eax,eax
	ret
00703684             CC CC CC CC CC CC CC CC CC CC CC CC     ............

;; fn00703690: 00703690
;;   Called from:
;;     007040C2 (in fn00704080)
;;     00704110 (in fn007040D0)
fn00703690 proc
	mov	edx,[esp+4h]
	test	edx,edx
	jnz	7036B8h

l00703698:
	call	6E0FC0h
	test	eax,eax
	jnz	7036E6h

l007036A1:
	mov	eax,[0A18720h]
	push	8D6C90h
	push	eax
	call	6E0F80h
	add	esp,8h
	or	eax,0FFh
	ret

l007036B8:
	mov	ecx,[edx+4h]
	mov	eax,[ecx+38h]
	test	eax,eax
	jz	7036CEh

l007036C2:
	mov	eax,[eax]
	test	eax,eax
	jz	7036CEh

l007036C8:
	mov	[esp+4h],edx
	jmp	eax

l007036CE:
	mov	ecx,[ecx+0Ch]
	mov	edx,[0A16B7Ch]
	push	ecx
	push	8D70D4h
	push	edx
	call	6E15D0h
	add	esp,0Ch

l007036E6:
	or	eax,0FFh
	ret
007036EA                               CC CC CC CC CC CC           ......

;; fn007036F0: 007036F0
;;   Called from:
;;     0065718F (in fn00657140)
;;     0075340F (in fn007533F0)
;;     00753E58 (in fn00753C30)
fn007036F0 proc
	mov	eax,[esp+8h]
	mov	ecx,[esp+4h]
	push	0h
	push	eax
	push	ecx
	call	707680h
	add	esp,0Ch
	ret
00703705                CC CC CC CC CC CC CC CC CC CC CC      ...........

;; fn00703710: 00703710
;;   Called from:
;;     006DC1F3 (in fn006DC1B0)
;;     007037D4 (in fn00703780)
;;     00703B31 (in fn00703AF0)
;;     00707726 (in fn00707680)
;;     00707B8E (in fn00707B30)
;;     00707D13 (in fn00707BD0)
fn00703710 proc
	mov	edx,[esp+4h]
	mov	ecx,[edx+4h]
	mov	eax,[ecx+40h]
	test	eax,eax
	jz	703756h

l0070371E:
	mov	ecx,[esp+0Ch]
	push	esi
	push	ecx
	mov	ecx,[esp+10h]
	push	ecx
	push	edx
	call	eax
	mov	esi,eax
	add	esp,0Ch
	test	esi,esi
	jnz	703752h

l00703735:
	call	6E0FC0h
	test	eax,eax
	jnz	703752h

l0070373E:
	mov	edx,[0A18720h]
	push	8D7224h
	push	edx
	call	6E0F80h
	add	esp,8h

l00703752:
	mov	eax,esi
	pop	esi
	ret

l00703756:
	mov	eax,[ecx+0Ch]
	mov	ecx,[0A16B7Ch]
	push	eax
	push	8D7204h
	push	ecx
	call	6E15D0h
	add	esp,0Ch
	xor	eax,eax
	ret
00703771    CC CC CC CC CC CC CC CC CC CC CC CC CC CC CC  ...............

;; fn00703780: 00703780
;;   Called from:
;;     00703845 (in fn00703800)
;;     0070385A (in fn00703800)
;;     007038B5 (in fn00703870)
;;     007038CA (in fn00703870)
;;     00703972 (in fn007038E0)
fn00703780 proc
	push	esi
	mov	esi,eax
	test	esi,esi
	jz	7037C2h

l00703787:
	mov	eax,[esi+4h]
	cmp	eax,0A16588h
	jz	7037CBh

l00703791:
	push	0A16588h
	push	eax
	call	6D5670h
	add	esp,8h
	test	eax,eax
	jnz	7037CBh

l007037A3:
	push	1h
	call	6DFD20h
	add	esp,4h
	test	eax,eax
	jnz	7037C6h

l007037B1:
	add	dword ptr [esi],0FFh
	jnz	7037C2h

l007037B6:
	mov	eax,[esi+4h]
	mov	ecx,[eax+18h]
	push	esi
	call	ecx
	add	esp,4h

l007037C2:
	xor	eax,eax
	pop	esi
	ret

l007037C6:
	mov	[eax+0Ch],esi
	mov	esi,eax

l007037CB:
	mov	edx,[esp+8h]
	push	edi
	push	0h
	push	esi
	push	edx
	call	703710h
	add	esp,0Ch
	add	dword ptr [esi],0FFh
	mov	edi,eax
	jnz	7037EFh

l007037E3:
	mov	eax,[esi+4h]
	mov	ecx,[eax+18h]
	push	esi
	call	ecx
	add	esp,4h

l007037EF:
	mov	eax,edi
	pop	edi
	pop	esi
	ret
007037F4             CC CC CC CC CC CC CC CC CC CC CC CC     ............

;; fn00703800: 00703800
;;   Called from:
;;     006E19CB (in fn006E1970)
;;     006E1A7D (in fn006E19F0)
fn00703800 proc
	push	esi
	mov	esi,[esp+8h]
	test	esi,esi
	jnz	703829h

l00703809:
	call	6E0FC0h
	test	eax,eax
	jnz	703825h

l00703812:
	mov	eax,[0A18720h]
	push	8D6C90h
	push	eax
	call	6E0F80h
	add	esp,8h

l00703825:
	xor	eax,eax
	pop	esi
	ret

l00703829:
	mov	eax,[esp+0Ch]
	test	eax,eax
	jz	70384Fh

l00703831:
	cmp	byte ptr [eax],0h
	jz	70384Fh

l00703836:
	lea	ecx,[esp+10h]
	push	ecx
	push	eax
	call	6EA240h
	add	esp,8h
	push	esi
	call	703780h
	add	esp,4h
	pop	esi
	ret

l0070384F:
	push	0h
	call	6DFD20h
	add	esp,4h
	push	esi
	call	703780h
	add	esp,4h
	pop	esi
	ret
00703864             CC CC CC CC CC CC CC CC CC CC CC CC     ............

;; fn00703870: 00703870
;;   Called from:
;;     006E3D39 (in fn006E3D10)
;;     006E3E79 (in fn006E3E50)
fn00703870 proc
	push	esi
	mov	esi,[esp+8h]
	test	esi,esi
	jnz	703899h

l00703879:
	call	6E0FC0h
	test	eax,eax
	jnz	703895h

l00703882:
	mov	eax,[0A18720h]
	push	8D6C90h
	push	eax
	call	6E0F80h
	add	esp,8h

l00703895:
	xor	eax,eax
	pop	esi
	ret

l00703899:
	mov	eax,[esp+0Ch]
	test	eax,eax
	jz	7038BFh

l007038A1:
	cmp	byte ptr [eax],0h
	jz	7038BFh

l007038A6:
	lea	ecx,[esp+10h]
	push	ecx
	push	eax
	call	6EA260h
	add	esp,8h
	push	esi
	call	703780h
	add	esp,4h
	pop	esi
	ret

l007038BF:
	push	0h
	call	6DFD20h
	add	esp,4h
	push	esi
	call	703780h
	add	esp,4h
	pop	esi
	ret
007038D4             CC CC CC CC CC CC CC CC CC CC CC CC     ............

;; fn007038E0: 007038E0
;;   Called from:
;;     006F79A2 (in fn006F7890)
;;     006F7DDA (in fn006F7890)
;;     006F83F2 (in fn006F82C0)
;;     006FCCF8 (in fn006FCC90)
;;     006FE467 (in fn006FE400)
;;     006FE6F6 (in fn006FE400)
;;     00704166 (in fn007040D0)
;;     0070829E (in fn00708210)
fn007038E0 proc
	mov	eax,[esp+4h]
	push	ebx
	xor	ebx,ebx
	test	eax,eax
	push	edi
	jz	703993h

l007038F0:
	mov	edi,[esp+10h]
	test	edi,edi
	jz	703993h

l007038FC:
	push	esi
	push	edi
	push	eax
	call	6DF760h
	mov	esi,eax
	add	esp,8h
	test	esi,esi
	jnz	703922h

l0070390D:
	mov	eax,[0A178F0h]
	push	edi
	push	eax
	call	6E0F80h
	add	esp,8h
	pop	esi
	pop	edi
	xor	eax,eax
	pop	ebx
	ret

l00703922:
	push	esi
	call	6DF870h
	add	esp,4h
	test	eax,eax
	jnz	70394Bh

l0070392F:
	mov	ecx,[esi+4h]
	mov	edx,[ecx+0Ch]
	mov	eax,[0A16B7Ch]
	push	edx
	push	8D7250h
	push	eax
	call	6E15D0h
	add	esp,0Ch
	jmp	70397Ch

l0070394B:
	mov	eax,[esp+18h]
	test	eax,eax
	jz	703967h

l00703953:
	cmp	[eax],bl
	jz	703967h

l00703957:
	lea	ecx,[esp+1Ch]
	push	ecx
	push	eax
	call	6EA240h
	add	esp,8h
	jmp	703971h

l00703967:
	push	0h
	call	6DFD20h
	add	esp,4h

l00703971:
	push	esi
	call	703780h
	add	esp,4h
	mov	ebx,eax

l0070397C:
	add	dword ptr [esi],0FFh
	jnz	70398Dh

l00703981:
	mov	edx,[esi+4h]
	mov	eax,[edx+18h]
	push	esi
	call	eax
	add	esp,4h

l0070398D:
	pop	esi
	pop	edi
	mov	eax,ebx
	pop	ebx
	ret

l00703993:
	call	6E0FC0h
	test	eax,eax
	jnz	7039B0h

l0070399C:
	mov	ecx,[0A18720h]
	push	8D6C90h
	push	ecx
	call	6E0F80h
	add	esp,8h

l007039B0:
	pop	edi
	xor	eax,eax
	pop	ebx
	ret
007039B5                CC CC CC CC CC CC CC CC CC CC CC      ...........
007039C0 8B 44 24 04 53 33 DB 85 C0 57 0F 84 A3 00 00 00 .D$.S3...W......
007039D0 8B 7C 24 10 85 FF 0F 84 97 00 00 00 56 57 50 E8 .|$.........VWP.
007039E0 7C BD FD FF 8B F0 83 C4 08 85 F6 75 15 A1 F0 78 |..........u...x
007039F0 A1 00 57 50 E8 87 D5 FD FF 83 C4 08 5E 5F 33 C0 ..WP........^_3.
00703A00 5B C3 56 E8 68 BE FD FF 83 C4 04 85 C0 75 1C 8B [.V.h........u..
00703A10 4E 04 8B 51 0C A1 7C 6B A1 00 52 68 50 72 8D 00 N..Q..|k..RhPr..
00703A20 50 E8 AA DB FD FF 83 C4 0C EB 31 8B 44 24 18 85 P.........1.D$..
00703A30 C0 74 14 38 18 74 10 8D 4C 24 1C 51 50 E8 1E 68 .t.8.t..L$.QP..h
00703A40 FE FF 83 C4 08 EB 0A 6A 00 E8 D2 C2 FD FF 83 C4 .......j........
00703A50 04 56 E8 29 FD FF FF 83 C4 04 8B D8 83 06 FF 75 .V.)...........u
00703A60 0C 8B 56 04 8B 42 18 56 FF D0 83 C4 04 5E 5F 8B ..V..B.V.....^_.
00703A70 C3 5B C3 E8 48 D5 FD FF 85 C0 75 14 8B 0D 20 87 .[..H.....u... .
00703A80 A1 00 68 90 6C 8D 00 51 E8 F3 D4 FD FF 83 C4 08 ..h.l..Q........
00703A90 5F 33 C0 5B C3 CC CC CC CC CC CC CC CC CC CC CC _3.[............

;; fn00703AA0: 00703AA0
;;   Called from:
;;     00703B1B (in fn00703AF0)
fn00703AA0 proc
	push	esi
	push	edi
	xor	edi,edi
	cmp	[eax],edi
	mov	esi,eax
	jz	703ABBh

l00703AAA:
	lea	ebx,[ebx+0h]

l00703AB0:
	add	eax,4h
	add	edi,1h
	cmp	dword ptr [eax],0h
	jnz	703AB0h

l00703ABB:
	push	edi
	call	6DFD20h
	add	esp,4h
	test	eax,eax
	jz	703AE5h

l00703AC8:
	test	edi,edi
	jle	703AE5h

l00703ACC:
	lea	edx,[esi-4h]
	lea	esi,[eax+0Ch]

l00703AD2:
	mov	ecx,[edx+4h]
	add	edx,4h
	mov	[esi],ecx
	add	dword ptr [ecx],1h
	add	esi,4h
	sub	edi,1h
	jnz	703AD2h

l00703AE5:
	pop	edi
	pop	esi
	ret
00703AE8                         CC CC CC CC CC CC CC CC         ........

;; fn00703AF0: 00703AF0
;;   Called from:
;;     006F6B5A (in fn006F6AF0)
;;     006F6B8F (in fn006F6AF0)
;;     006F9255 (in fn006F9120)
;;     006FE21C (in fn006FE160)
;;     00708CED (in fn00708C10)
;;     0070ABD8 (in fn00708DC0)
;;     00717D7A (in fn00717CB0)
;;     00719F72 (in fn00719F20)
fn00703AF0 proc
	cmp	dword ptr [esp+4h],0h
	jnz	703B16h

l00703AF7:
	call	6E0FC0h
	test	eax,eax
	jnz	703B13h

l00703B00:
	mov	eax,[0A18720h]
	push	8D6C90h
	push	eax
	call	6E0F80h
	add	esp,8h

l00703B13:
	xor	eax,eax
	ret

l00703B16:
	push	esi
	lea	eax,[esp+0Ch]
	call	703AA0h
	mov	esi,eax
	test	esi,esi
	jnz	703B28h

l00703B26:
	pop	esi
	ret

l00703B28:
	mov	ecx,[esp+8h]
	push	edi
	push	0h
	push	esi
	push	ecx
	call	703710h
	add	esp,0Ch
	add	dword ptr [esi],0FFh
	mov	edi,eax
	jnz	703B4Ch

l00703B40:
	mov	edx,[esi+4h]
	mov	eax,[edx+18h]
	push	esi
	call	eax
	add	esp,4h

l00703B4C:
	mov	eax,edi
	pop	edi
	pop	esi
	ret
00703B51    CC CC CC CC CC CC CC CC CC CC CC CC CC CC CC  ...............

;; fn00703B60: 00703B60
;;   Called from:
;;     00703C42 (in fn00703BF0)
;;     00703CB1 (in fn00703CB0)
;;     00703F46 (in fn00703F10)
fn00703B60 proc
	mov	eax,[0A6CD34h]
	test	eax,eax
	jnz	703B80h

l00703B69:
	push	8D0D60h
	call	6ECAC0h
	add	esp,4h
	test	eax,eax
	mov	[0A6CD34h],eax
	jnz	703B80h

l00703B7F:
	ret

l00703B80:
	push	esi
	push	eax
	mov	eax,[esp+0Ch]
	push	eax
	call	6DE330h
	mov	esi,eax
	add	esp,8h
	test	esi,esi
	jnz	703BB1h

l00703B95:
	mov	ecx,[0A178F0h]
	push	ecx
	call	6E1110h
	add	esp,4h
	test	eax,eax
	jz	703BADh

l00703BA8:
	call	6E1160h

l00703BAD:
	xor	eax,eax
	pop	esi
	ret

l00703BB1:
	mov	eax,[esi+4h]
	cmp	eax,0A16588h
	jz	703BE2h

l00703BBB:
	push	0A16588h
	push	eax
	call	6D5670h
	add	esp,8h
	test	eax,eax
	jnz	703BE2h

l00703BCD:
	add	dword ptr [esi],0FFh
	jnz	703BDEh

l00703BD2:
	mov	edx,[esi+4h]
	mov	eax,[edx+18h]
	push	esi
	call	eax
	add	esp,4h

l00703BDE:
	xor	eax,eax
	pop	esi
	ret

l00703BE2:
	mov	eax,esi
	pop	esi
	ret
00703BE6                   CC CC CC CC CC CC CC CC CC CC       ..........

;; fn00703BF0: 00703BF0
;;   Called from:
;;     00703C78 (in fn00703BF0)
;;     00703DD1 (in fn00703D00)
;;     00703FB6 (in fn00703F10)
fn00703BF0 proc
	push	ebx
	mov	ebx,[esp+8h]
	push	esi
	push	edi
	mov	edi,[esp+14h]
	xor	esi,esi
	cmp	ebx,edi
	jnz	703C0Ah

l00703C01:
	pop	edi
	pop	esi
	mov	eax,1h
	pop	ebx
	ret

l00703C0A:
	mov	eax,[edi+4h]
	cmp	eax,0A16588h
	jz	703C26h

l00703C14:
	push	0A16588h
	push	eax
	call	6D5670h
	add	esp,8h
	test	eax,eax
	jz	703C40h

l00703C26:
	mov	edx,[edi+8h]
	xor	eax,eax
	test	edx,edx
	jle	703C40h

l00703C2F:
	lea	ecx,[edi+0Ch]

l00703C32:
	cmp	ebx,[ecx]
	jz	703C01h

l00703C36:
	add	eax,1h
	add	ecx,4h
	cmp	eax,edx
	jl	703C32h

l00703C40:
	push	ebp
	push	ebx
	call	703B60h
	mov	ebp,eax
	add	esp,4h
	test	ebp,ebp
	jnz	703C5Eh

l00703C50:
	call	6E0FC0h
	pop	ebp
	pop	edi
	neg	eax
	pop	esi
	sbb	eax,eax
	pop	ebx
	ret

l00703C5E:
	mov	ebx,[ebp+8h]
	xor	edi,edi
	test	ebx,ebx
	jle	703C96h

l00703C67:
	lea	esi,[ebp+0Ch]
	lea	ebx,[ebx+0h]

l00703C70:
	mov	eax,[esp+18h]
	mov	ecx,[esi]
	push	eax
	push	ecx
	call	703BF0h
	add	esp,8h
	test	eax,eax
	mov	[esp+14h],eax
	jnz	703C92h

l00703C88:
	add	edi,1h
	add	esi,4h
	cmp	edi,ebx
	jl	703C70h

l00703C92:
	mov	esi,[esp+14h]

l00703C96:
	add	dword ptr [ebp+0h],0FFh
	jnz	703CA8h

l00703C9C:
	mov	edx,[ebp+4h]
	mov	eax,[edx+18h]
	push	ebp
	call	eax
	add	esp,4h

l00703CA8:
	pop	ebp
	pop	edi
	mov	eax,esi
	pop	esi
	pop	ebx
	ret
00703CAF                                              CC                .

;; fn00703CB0: 00703CB0
;;   Called from:
;;     00703D9F (in fn00703D00)
;;     00703FA8 (in fn00703F10)
fn00703CB0 proc
	push	eax
	call	703B60h
	add	esp,4h
	test	eax,eax
	jnz	703CDDh

l00703CBD:
	call	6E0FC0h
	test	eax,eax
	jnz	703CDAh

l00703CC6:
	mov	ecx,[esp+4h]
	mov	edx,[0A16B7Ch]
	push	ecx
	push	edx
	call	6E0F80h
	add	esp,8h

l00703CDA:
	xor	eax,eax
	ret

l00703CDD:
	add	dword ptr [eax],0FFh
	jnz	703CEEh

l00703CE2:
	mov	ecx,[eax+4h]
	mov	edx,[ecx+18h]
	push	eax
	call	edx
	add	esp,4h

l00703CEE:
	or	eax,0FFh
	ret
00703CF2       CC CC CC CC CC CC CC CC CC CC CC CC CC CC   ..............

;; fn00703D00: 00703D00
;;   Called from:
;;     00703E40 (in fn00703D00)
;;     0070472E (in fn00704700)
fn00703D00 proc
	push	ecx
	push	ebx
	xor	ebx,ebx
	cmp	[0A6CD38h],ebx
	jnz	703D28h

l00703D0C:
	push	8B299Ch
	call	6ECAC0h
	add	esp,4h
	test	eax,eax
	mov	[0A6CD38h],eax
	jnz	703D28h

l00703D22:
	or	eax,0FFh
	pop	ebx
	pop	ecx
	ret

l00703D28:
	push	ebp
	mov	ebp,[esp+10h]
	push	esi
	mov	esi,[esp+18h]
	mov	eax,[esi+4h]
	cmp	eax,0A1E968h
	push	edi
	jnz	703D5Bh

l00703D3D:
	cmp	dword ptr [ebp+4h],0A1EB98h
	jnz	703D5Bh

l00703D46:
	mov	ebp,[ebp+8h]
	push	esi
	push	ebp
	call	70C700h
	add	esp,8h
	pop	edi
	pop	esi
	pop	ebp
	mov	ebx,eax
	pop	ebx
	pop	ecx
	ret

l00703D5B:
	cmp	eax,0A15380h
	jz	703E62h

l00703D66:
	push	0A15380h
	push	eax
	call	6D5670h
	add	esp,8h
	test	eax,eax
	jnz	703E62h

l00703D7C:
	mov	eax,[esi+4h]
	cmp	eax,0A16588h
	jz	703DF8h

l00703D86:
	push	0A16588h
	push	eax
	call	6D5670h
	add	esp,8h
	test	eax,eax
	jnz	703DF8h

l00703D98:
	push	8D72A0h
	mov	eax,esi
	call	703CB0h
	add	esp,4h
	test	eax,eax
	jz	703E13h

l00703DAB:
	mov	eax,[0A6CD38h]
	push	eax
	push	ebp
	call	6DE330h
	mov	edi,eax
	add	esp,8h
	test	edi,edi
	jnz	703DCFh

l00703DC0:
	call	6E1160h
	pop	edi
	pop	esi
	xor	ebx,ebx
	pop	ebp
	mov	eax,ebx
	pop	ebx
	pop	ecx
	ret

l00703DCF:
	push	esi
	push	edi
	call	703BF0h
	add	esp,8h
	add	dword ptr [edi],0FFh
	mov	ebx,eax
	jnz	703EE7h

l00703DE4:
	mov	ecx,[edi+4h]
	mov	edx,[ecx+18h]
	push	edi
	call	edx
	add	esp,4h
	pop	edi
	pop	esi
	pop	ebp
	mov	eax,ebx
	pop	ebx
	pop	ecx
	ret

l00703DF8:
	mov	eax,[esp+20h]
	test	eax,eax
	jnz	703E1Ch

l00703E00:
	mov	eax,[0A175E0h]
	push	8D727Ch
	push	eax
	call	6E0F80h
	add	esp,8h

l00703E13:
	pop	edi
	pop	esi
	pop	ebp
	or	eax,0FFh
	pop	ebx
	pop	ecx
	ret

l00703E1C:
	mov	ebp,[esi+8h]
	xor	edi,edi
	test	ebp,ebp
	jle	703EE7h

l00703E29:
	add	eax,0FFh
	mov	[esp+10h],eax
	add	esi,0Ch

l00703E33:
	mov	ecx,[esp+10h]
	mov	edx,[esi]
	mov	eax,[esp+18h]
	push	ecx
	push	edx
	push	eax
	call	703D00h
	mov	ebx,eax
	add	esp,0Ch
	test	ebx,ebx
	jnz	703EE7h

l00703E52:
	add	edi,1h
	add	esi,4h
	cmp	edi,ebp
	jl	703E33h

l00703E5C:
	pop	edi
	pop	esi
	pop	ebp
	pop	ebx
	pop	ecx
	ret

l00703E62:
	mov	eax,[ebp+4h]
	cmp	eax,esi
	jz	703E9Ch

l00703E69:
	push	esi
	push	eax
	call	6D5670h
	add	esp,8h
	test	eax,eax
	jnz	703E9Ch

l00703E77:
	mov	ecx,[0A6CD38h]
	push	ecx
	push	ebp
	xor	ebx,ebx
	call	6DE330h
	mov	edi,eax
	add	esp,8h
	test	edi,edi
	jnz	703EA9h

l00703E8F:
	call	6E1160h
	pop	edi
	pop	esi
	pop	ebp
	mov	eax,ebx
	pop	ebx
	pop	ecx
	ret

l00703E9C:
	pop	edi
	pop	esi
	mov	ebx,1h
	pop	ebp
	mov	eax,ebx
	pop	ebx
	pop	ecx
	ret

l00703EA9:
	cmp	edi,[ebp+4h]
	jz	703ED6h

l00703EAE:
	mov	eax,[edi+4h]
	cmp	eax,0A15380h
	jz	703ECAh

l00703EB8:
	push	0A15380h
	push	eax
	call	6D5670h
	add	esp,8h
	test	eax,eax
	jz	703ED6h

l00703ECA:
	push	esi
	push	edi
	call	6D5670h
	add	esp,8h
	mov	ebx,eax

l00703ED6:
	add	dword ptr [edi],0FFh
	jnz	703EE7h

l00703EDB:
	mov	edx,[edi+4h]
	mov	eax,[edx+18h]
	push	edi
	call	eax
	add	esp,4h

l00703EE7:
	pop	edi
	pop	esi
	pop	ebp
	mov	eax,ebx
	pop	ebx
	pop	ecx
	ret
00703EEF                                              CC                .
00703EF0 E8 AB 2E 00 00 8B 4C 24 04 50 8B 44 24 0C 50 51 ......L$.P.D$.PQ
00703F00 E8 FB FD FF FF 83 C4 0C C3 CC CC CC CC CC CC CC ................

;; fn00703F10: 00703F10
;;   Called from:
;;     00703FFD (in fn00703F10)
;;     00704030 (in fn00704020)
fn00703F10 proc
	push	esi
	mov	esi,[esp+0Ch]
	push	edi
	mov	edi,[esp+0Ch]
	mov	eax,0A1E968h
	cmp	[edi+4h],eax
	jnz	703F45h

l00703F24:
	cmp	[esi+4h],eax
	jnz	703F45h

l00703F29:
	xor	eax,eax
	cmp	edi,esi
	setz	al
	test	eax,eax
	jnz	704017h

l00703F38:
	push	esi
	push	edi
	call	70C700h
	add	esp,8h
	pop	edi
	pop	esi
	ret

l00703F45:
	push	edi
	call	703B60h
	add	esp,4h
	test	eax,eax
	jnz	703F74h

l00703F52:
	call	6E0FC0h
	test	eax,eax
	jnz	703F6Eh

l00703F5B:
	mov	eax,[0A16B7Ch]
	push	8D7320h
	push	eax
	call	6E0F80h
	add	esp,8h

l00703F6E:
	pop	edi
	or	eax,0FFh
	pop	esi
	ret

l00703F74:
	add	dword ptr [eax],0FFh
	jnz	703F85h

l00703F79:
	mov	ecx,[eax+4h]
	mov	edx,[ecx+18h]
	push	eax
	call	edx
	add	esp,4h

l00703F85:
	mov	eax,[esi+4h]
	cmp	eax,0A16588h
	jz	703FC1h

l00703F8F:
	push	0A16588h
	push	eax
	call	6D5670h
	add	esp,8h
	test	eax,eax
	jnz	703FC1h

l00703FA1:
	push	8D72E8h
	mov	eax,esi
	call	703CB0h
	add	esp,4h
	test	eax,eax
	jz	703F6Eh

l00703FB4:
	push	esi
	push	edi
	call	703BF0h
	add	esp,8h
	pop	edi
	pop	esi
	ret

l00703FC1:
	mov	eax,[esp+14h]
	test	eax,eax
	push	ebx
	mov	ebx,[esi+8h]
	jnz	703FE7h

l00703FCD:
	mov	eax,[0A175E0h]
	push	8D727Ch
	push	eax
	call	6E0F80h
	add	esp,8h
	pop	ebx
	pop	edi
	or	eax,0FFh
	pop	esi
	ret

l00703FE7:
	xor	edi,edi
	test	ebx,ebx
	push	ebp
	jle	704013h

l00703FEE:
	lea	ebp,[eax-1h]
	add	esi,0Ch

l00703FF4:
	mov	ecx,[esi]
	mov	edx,[esp+14h]
	push	ebp
	push	ecx
	push	edx
	call	703F10h
	add	esp,0Ch
	test	eax,eax
	jnz	704015h

l00704009:
	add	edi,1h
	add	esi,4h
	cmp	edi,ebx
	jl	703FF4h

l00704013:
	xor	eax,eax

l00704015:
	pop	ebp
	pop	ebx

l00704017:
	pop	edi
	pop	esi
	ret
0070401A                               CC CC CC CC CC CC           ......

;; fn00704020: 00704020
;;   Called from:
;;     006E10B6 (in fn006E0FD0)
;;     006E1C71 (in fn006E1BD0)
fn00704020 proc
	call	706DA0h
	mov	ecx,[esp+4h]
	push	eax
	mov	eax,[esp+0Ch]
	push	eax
	push	ecx
	call	703F10h
	add	esp,0Ch
	ret
00704039                            CC CC CC CC CC CC CC          .......

;; fn00704040: 00704040
;;   Called from:
;;     006FCD2F (in fn006FCC90)
;;     006FCDB9 (in fn006FCC90)
;;     00704C90 (in fn00704BA0)
;;     00704CDB (in fn00704BA0)
;;     00707301 (in fn007072E0)
;;     0070731A (in fn007072E0)
;;     00735E0A (in fn00735890)
;;     00735E34 (in fn00735890)
;;     00738AD3 (in fn007389B0)
;;     00738B0C (in fn007389B0)
fn00704040 proc
	mov	eax,[esp+4h]
	mov	ecx,[eax+4h]
	mov	edx,[ecx+70h]
	push	esi
	push	eax
	call	edx
	mov	esi,eax
	add	esp,4h
	test	esi,esi
	jnz	704079h

l00704057:
	call	6E0FC0h
	test	eax,eax
	jz	704077h

l00704060:
	mov	eax,[0A16D00h]
	push	eax
	call	6E1110h
	add	esp,4h
	test	eax,eax
	jz	704077h

l00704072:
	call	6E1160h

l00704077:
	mov	eax,esi

l00704079:
	pop	esi
	ret
0070407B                                  CC CC CC CC CC            .....

;; fn00704080: 00704080
;;   Called from:
;;     00726646 (in fn00726570)
;;     00735DDC (in fn00735890)
;;     00753E9E (in fn00753C30)
fn00704080 proc
	mov	ecx,[esp+4h]
	test	ecx,ecx
	jnz	7040A8h

l00704088:
	call	6E0FC0h
	test	eax,eax
	jnz	7040A4h

l00704091:
	mov	eax,[0A18720h]
	push	8D6C90h
	push	eax
	call	6E0F80h
	add	esp,8h

l007040A4:
	or	eax,0FFh
	ret

l007040A8:
	mov	edx,[ecx+4h]
	mov	eax,[edx+34h]
	test	eax,eax
	jz	7040BEh

l007040B2:
	mov	eax,[eax]
	test	eax,eax
	jz	7040BEh

l007040B8:
	mov	[esp+4h],ecx
	jmp	eax

l007040BE:
	mov	[esp+4h],ecx
	jmp	703690h
007040C7                      CC CC CC CC CC CC CC CC CC        .........

;; fn007040D0: 007040D0
;;   Called from:
;;     006F371B (in fn006F3930)
;;     00704C18 (in fn00704BA0)
fn007040D0 proc
	sub	esp,8h
	push	esi
	mov	esi,[esp+10h]
	test	esi,esi
	jnz	7040FAh

l007040DC:
	call	6E0FC0h
	test	eax,eax
	jnz	704121h

l007040E5:
	mov	eax,[0A18720h]
	push	8D6C90h
	push	eax
	call	6E0F80h
	add	esp,8h
	jmp	704121h

l007040FA:
	mov	ecx,[esi+4h]
	mov	eax,[ecx+34h]
	test	eax,eax
	jz	70410Fh

l00704104:
	mov	eax,[eax]
	test	eax,eax
	jz	70410Fh

l0070410A:
	push	esi
	call	eax
	jmp	704115h

l0070410F:
	push	esi
	call	703690h

l00704115:
	add	esp,4h
	cmp	eax,0FFh
	jnz	704217h

l00704121:
	mov	edx,[0A16B7Ch]
	push	edx
	call	6E1110h
	add	esp,4h
	test	eax,eax
	jnz	70414Ah

l00704134:
	mov	eax,[0A178F0h]
	push	eax
	call	6E1110h
	add	esp,4h
	test	eax,eax
	jz	704214h

l0070414A:
	lea	ecx,[esp+10h]
	push	ecx
	lea	edx,[esp+8h]
	push	edx
	lea	eax,[esp+10h]
	push	eax
	call	6E1130h
	push	0h
	push	8D1E78h
	push	esi
	call	7038E0h
	mov	esi,eax
	add	esp,18h
	test	esi,esi
	jz	7041FDh

l00704178:
	push	edi
	push	esi
	call	7051A0h
	add	esp,4h
	add	dword ptr [esi],0FFh
	mov	edi,eax
	jnz	704195h

l00704189:
	mov	ecx,[esi+4h]
	mov	edx,[ecx+18h]
	push	esi
	call	edx
	add	esp,4h

l00704195:
	mov	eax,[esp+0Ch]
	test	eax,eax
	jz	7041B5h

l0070419D:
	add	dword ptr [eax],0FFh
	mov	eax,[esp+0Ch]
	cmp	dword ptr [eax],0h
	jnz	7041B5h

l007041A9:
	mov	ecx,[eax+4h]
	mov	edx,[ecx+18h]
	push	eax
	call	edx
	add	esp,4h

l007041B5:
	mov	eax,[esp+8h]
	test	eax,eax
	jz	7041D5h

l007041BD:
	add	dword ptr [eax],0FFh
	mov	eax,[esp+8h]
	cmp	dword ptr [eax],0h
	jnz	7041D5h

l007041C9:
	mov	ecx,[eax+4h]
	mov	edx,[ecx+18h]
	push	eax
	call	edx
	add	esp,4h

l007041D5:
	mov	eax,[esp+14h]
	test	eax,eax
	jz	7041F5h

l007041DD:
	add	dword ptr [eax],0FFh
	mov	eax,[esp+14h]
	cmp	dword ptr [eax],0h
	jnz	7041F5h

l007041E9:
	mov	ecx,[eax+4h]
	mov	edx,[ecx+18h]
	push	eax
	call	edx
	add	esp,4h

l007041F5:
	mov	eax,edi
	pop	edi
	pop	esi
	add	esp,8h
	ret

l007041FD:
	mov	eax,[esp+10h]
	mov	ecx,[esp+4h]
	mov	edx,[esp+8h]
	push	eax
	push	ecx
	push	edx
	call	6E0E00h
	add	esp,0Ch

l00704214:
	or	eax,0FFh

l00704217:
	pop	esi
	add	esp,8h
	ret
0070421C                                     CC CC CC CC             ....

;; fn00704220: 00704220
;;   Called from:
;;     006F9191 (in fn006F9120)
;;     006F921D (in fn006F9120)
;;     006FCD6B (in fn006FCC90)
;;     00707F40 (in fn00707E00)
;;     00709806 (in fn00708DC0)
;;     0070A4D2 (in fn00708DC0)
;;     00726600 (in fn00726570)
;;     0073B32B (in fn0073B310)
fn00704220 proc
	push	ebx
	mov	ebx,[esp+8h]
	test	ebx,ebx
	jz	7042DBh

l0070422D:
	mov	eax,[esp+0Ch]
	test	eax,eax
	jz	7042DBh

l00704239:
	push	esi
	mov	esi,[ebx+4h]
	mov	ecx,[esi+38h]
	test	ecx,ecx
	jz	704255h

l00704244:
	mov	ecx,[ecx+4h]
	test	ecx,ecx
	jz	704255h

l0070424B:
	push	eax
	push	ebx
	call	ecx
	add	esp,8h
	pop	esi
	pop	ebx
	ret

l00704255:
	push	edi
	mov	edi,[esi+34h]
	test	edi,edi
	jz	7042BEh

l0070425D:
	mov	edx,[eax+4h]
	mov	ecx,[edx+30h]
	test	ecx,ecx
	jz	7042A7h

l00704267:
	test	dword ptr [edx+54h],20000h
	jz	7042A7h

l00704270:
	cmp	dword ptr [ecx+98h],0h
	jz	7042A7h

l00704279:
	mov	ecx,[0A17CA4h]
	push	ecx
	push	eax
	call	702C30h
	mov	esi,eax
	add	esp,8h
	cmp	esi,0FFh
	jnz	704299h

l00704290:
	call	6E0FC0h
	test	eax,eax
	jnz	7042D5h

l00704299:
	push	esi
	push	ebx
	call	703180h
	add	esp,8h
	pop	edi
	pop	esi
	pop	ebx
	ret

l007042A7:
	cmp	dword ptr [edi+0Ch],0h
	jz	7042BEh

l007042AD:
	push	8D7368h
	call	701800h
	add	esp,4h
	pop	edi
	pop	esi
	pop	ebx
	ret

l007042BE:
	mov	edx,[esi+0Ch]
	mov	eax,[0A16B7Ch]
	push	edx
	push	8D7344h
	push	eax
	call	6E15D0h
	add	esp,0Ch

l007042D5:
	pop	edi
	pop	esi
	xor	eax,eax
	pop	ebx
	ret

l007042DB:
	call	6E0FC0h
	test	eax,eax
	jnz	7042F8h

l007042E4:
	mov	ecx,[0A18720h]
	push	8D6C90h
	push	ecx
	call	6E0F80h
	add	esp,8h

l007042F8:
	xor	eax,eax
	pop	ebx
	ret
007042FC                                     CC CC CC CC             ....

;; fn00704300: 00704300
;;   Called from:
;;     007080E9 (in fn00707F70)
;;     00708348 (in fn00708210)
;;     00709CC0 (in fn00708DC0)
;;     0070A303 (in fn00708DC0)
;;     0073B2EA (in fn0073B2B0)
fn00704300 proc
	push	ebx
	mov	ebx,[esp+8h]
	test	ebx,ebx
	push	ebp
	jz	7043D2h

l0070430E:
	mov	eax,[esp+10h]
	test	eax,eax
	jz	7043D2h

l0070431A:
	mov	ebp,[esp+14h]
	test	ebp,ebp
	jz	7043D2h

l00704326:
	push	esi
	mov	esi,[ebx+4h]
	mov	ecx,[esi+38h]
	test	ecx,ecx
	jz	704344h

l00704331:
	mov	ecx,[ecx+8h]
	test	ecx,ecx
	jz	704344h

l00704338:
	push	ebp
	push	eax
	push	ebx
	call	ecx
	add	esp,0Ch
	pop	esi
	pop	ebp
	pop	ebx
	ret

l00704344:
	push	edi
	mov	edi,[esi+34h]
	test	edi,edi
	jz	7043B3h

l0070434C:
	mov	edx,[eax+4h]
	mov	ecx,[edx+30h]
	test	ecx,ecx
	jz	704398h

l00704356:
	test	dword ptr [edx+54h],20000h
	jz	704398h

l0070435F:
	cmp	dword ptr [ecx+98h],0h
	jz	704398h

l00704368:
	mov	ecx,[0A17CA4h]
	push	ecx
	push	eax
	call	702C30h
	mov	esi,eax
	add	esp,8h
	cmp	esi,0FFh
	jnz	704388h

l0070437F:
	call	6E0FC0h
	test	eax,eax
	jnz	7043ABh

l00704388:
	push	ebp
	push	esi
	push	ebx
	call	703300h
	add	esp,0Ch
	pop	edi
	pop	esi
	pop	ebp
	pop	ebx
	ret

l00704398:
	cmp	dword ptr [edi+14h],0h
	jz	7043B3h

l0070439E:
	push	8D7368h
	call	701800h
	add	esp,4h

l007043AB:
	pop	edi
	pop	esi
	pop	ebp
	or	eax,0FFh
	pop	ebx
	ret

l007043B3:
	mov	edx,[esi+0Ch]
	mov	eax,[0A16B7Ch]
	push	edx
	push	8D713Ch
	push	eax
	call	6E15D0h
	add	esp,0Ch
	pop	edi
	pop	esi
	pop	ebp
	or	eax,0FFh
	pop	ebx
	ret

l007043D2:
	call	6E0FC0h
	test	eax,eax
	jnz	7043EFh

l007043DB:
	mov	ecx,[0A18720h]
	push	8D6C90h
	push	ecx
	call	6E0F80h
	add	esp,8h

l007043EF:
	pop	ebp
	or	eax,0FFh
	pop	ebx
	ret
007043F5                CC CC CC CC CC CC CC CC CC CC CC      ...........

;; fn00704400: 00704400
;;   Called from:
;;     007080F5 (in fn00707F70)
;;     00709D06 (in fn00708DC0)
;;     0070A360 (in fn00708DC0)
;;     0073B2D9 (in fn0073B2B0)
fn00704400 proc
	push	ebx
	mov	ebx,[esp+8h]
	test	ebx,ebx
	jz	7044C1h

l0070440D:
	mov	eax,[esp+0Ch]
	test	eax,eax
	jz	7044C1h

l00704419:
	push	esi
	mov	esi,[ebx+4h]
	mov	ecx,[esi+38h]
	test	ecx,ecx
	jz	704437h

l00704424:
	mov	ecx,[ecx+8h]
	test	ecx,ecx
	jz	704437h

l0070442B:
	push	0h
	push	eax
	push	ebx
	call	ecx
	add	esp,0Ch
	pop	esi
	pop	ebx
	ret

l00704437:
	push	edi
	mov	edi,[esi+34h]
	test	edi,edi
	jz	7044A3h

l0070443F:
	mov	edx,[eax+4h]
	mov	ecx,[edx+30h]
	test	ecx,ecx
	jz	704489h

l00704449:
	test	dword ptr [edx+54h],20000h
	jz	704489h

l00704452:
	cmp	dword ptr [ecx+98h],0h
	jz	704489h

l0070445B:
	mov	ecx,[0A17CA4h]
	push	ecx
	push	eax
	call	702C30h
	mov	esi,eax
	add	esp,8h
	cmp	esi,0FFh
	jnz	70447Bh

l00704472:
	call	6E0FC0h
	test	eax,eax
	jnz	70449Ch

l0070447B:
	push	esi
	push	ebx
	call	703390h
	add	esp,8h
	pop	edi
	pop	esi
	pop	ebx
	ret

l00704489:
	cmp	dword ptr [edi+14h],0h
	jz	7044A3h

l0070448F:
	push	8D7368h
	call	701800h
	add	esp,4h

l0070449C:
	pop	edi
	pop	esi
	or	eax,0FFh
	pop	ebx
	ret

l007044A3:
	mov	edx,[esi+0Ch]
	mov	eax,[0A16B7Ch]
	push	edx
	push	8D7398h
	push	eax
	call	6E15D0h
	add	esp,0Ch
	pop	edi
	pop	esi
	or	eax,0FFh
	pop	ebx
	ret

l007044C1:
	call	6E0FC0h
	test	eax,eax
	jnz	7044DEh

l007044CA:
	mov	ecx,[0A18720h]
	push	8D6C90h
	push	ecx
	call	6E0F80h
	add	esp,8h

l007044DE:
	or	eax,0FFh
	pop	ebx
	ret
007044E3          CC CC CC CC CC CC CC CC CC CC CC CC CC    .............

;; fn007044F0: 007044F0
;;   Called from:
;;     007045AB (in fn00704560)
;;     007045C7 (in fn00704560)
;;     007046A9 (in fn00704610)
;;     007046C5 (in fn00704610)
fn007044F0 proc
	mov	ecx,[edx+4h]
	mov	eax,[ecx+30h]
	test	eax,eax
	jz	70453Fh

l007044FA:
	test	dword ptr [ecx+54h],20000h
	jz	70453Fh

l00704503:
	cmp	dword ptr [eax+98h],0h
	jz	70453Fh

l0070450C:
	mov	eax,[0A18598h]
	push	esi
	push	eax
	push	edx
	call	702C30h
	mov	esi,eax
	add	esp,8h
	cmp	esi,0FFh
	jnz	704530h

l00704523:
	call	6E0FC0h
	test	eax,eax
	jz	704530h

l0070452C:
	xor	eax,eax
	pop	esi
	ret

l00704530:
	mov	ecx,[esp+0Ch]
	push	esi
	push	ecx
	call	dword ptr [esp+10h]
	add	esp,8h
	pop	esi
	ret

l0070453F:
	mov	edx,[ecx+0Ch]
	mov	eax,[0A16B7Ch]
	push	edx
	push	8D73C8h
	push	eax
	call	6E15D0h
	add	esp,0Ch
	xor	eax,eax
	ret
00704559                            CC CC CC CC CC CC CC          .......

;; fn00704560: 00704560
;;   Called from:
;;     00709610 (in fn00708DC0)
;;     007265CA (in fn00726570)
fn00704560 proc
	push	ebx
	push	ebp
	push	esi
	mov	esi,[esp+14h]
	push	edi
	mov	edi,[esp+14h]
	push	8h
	push	esi
	push	edi
	call	701B50h
	add	esp,0Ch
	cmp	eax,0A16480h
	jnz	7045FDh

l0070457F:
	mov	ecx,[edi+4h]
	mov	edx,[esi+4h]
	mov	ebx,[ecx+34h]
	mov	ebp,[edx+34h]
	add	dword ptr [eax],0FFh
	jnz	70459Ch

l00704590:
	mov	ecx,[eax+4h]
	mov	edx,[ecx+18h]
	push	eax
	call	edx
	add	esp,4h

l0070459C:
	test	ebx,ebx
	jz	7045B8h

l007045A0:
	mov	ebx,[ebx+8h]
	test	ebx,ebx
	jz	7045B8h

l007045A7:
	push	edi
	push	ebx
	mov	edx,esi
	call	7044F0h
	add	esp,8h
	pop	edi
	pop	esi
	pop	ebp
	pop	ebx
	ret

l007045B8:
	test	ebp,ebp
	jz	7045D4h

l007045BC:
	mov	eax,[ebp+8h]
	test	eax,eax
	jz	7045D4h

l007045C3:
	push	esi
	push	eax
	mov	edx,edi
	call	7044F0h
	add	esp,8h
	pop	edi
	pop	esi
	pop	ebp
	pop	ebx
	ret

l007045D4:
	mov	eax,[esi+4h]
	mov	ecx,[eax+0Ch]
	mov	edx,[edi+4h]
	mov	eax,[edx+0Ch]
	push	ecx
	mov	ecx,[0A16B7Ch]
	push	eax
	push	8A7F90h
	push	8D6D48h
	push	ecx
	call	6E15D0h
	add	esp,14h
	xor	eax,eax

l007045FD:
	pop	edi
	pop	esi
	pop	ebp
	pop	ebx
	ret
00704602       CC CC CC CC CC CC CC CC CC CC CC CC CC CC   ..............

;; fn00704610: 00704610
;;   Called from:
;;     0070993A (in fn00708DC0)
fn00704610 proc
	push	ebx
	push	ebp
	mov	ebp,[esp+10h]
	push	esi
	mov	esi,[esp+10h]
	mov	eax,[esi+4h]
	mov	ecx,[eax+30h]
	test	ecx,ecx
	push	edi
	jz	704656h

l00704626:
	test	byte ptr [eax+54h],8h
	jz	704656h

l0070462C:
	mov	ecx,[ecx+64h]
	test	ecx,ecx
	jz	704656h

l00704633:
	push	ebp
	push	esi
	call	ecx
	add	esp,8h
	cmp	eax,0A16480h
	jnz	7046FBh

l00704645:
	add	dword ptr [eax],0FFh
	jnz	704656h

l0070464A:
	mov	ecx,[eax+4h]
	mov	edx,[ecx+18h]
	push	eax
	call	edx
	add	esp,4h

l00704656:
	push	8h
	push	ebp
	push	esi
	call	701B50h
	add	esp,0Ch
	cmp	eax,0A16480h
	jnz	7046FBh

l0070466D:
	mov	ecx,[esi+4h]
	mov	edx,[ebp+4h]
	mov	edi,[ecx+34h]
	mov	ebx,[edx+34h]
	add	dword ptr [eax],0FFh
	jnz	70468Ah

l0070467E:
	mov	ecx,[eax+4h]
	mov	edx,[ecx+18h]
	push	eax
	call	edx
	add	esp,4h

l0070468A:
	test	edi,edi
	jz	7046B6h

l0070468E:
	mov	eax,[esi+4h]
	test	byte ptr [eax+54h],8h
	jz	70469Eh

l00704697:
	mov	eax,[edi+24h]
	test	eax,eax
	jnz	7046A5h

l0070469E:
	mov	eax,[edi+8h]
	test	eax,eax
	jz	7046D2h

l007046A5:
	push	esi
	push	eax
	mov	edx,ebp
	call	7044F0h
	add	esp,8h
	pop	edi
	pop	esi
	pop	ebp
	pop	ebx
	ret

l007046B6:
	test	ebx,ebx
	jz	7046D2h

l007046BA:
	mov	ebx,[ebx+8h]
	test	ebx,ebx
	jz	7046D2h

l007046C1:
	push	ebp
	push	ebx
	mov	edx,esi
	call	7044F0h
	add	esp,8h
	pop	edi
	pop	esi
	pop	ebp
	pop	ebx
	ret

l007046D2:
	mov	ecx,[ebp+4h]
	mov	edx,[ecx+0Ch]
	mov	eax,[esi+4h]
	mov	ecx,[eax+0Ch]
	push	edx
	mov	edx,[0A16B7Ch]
	push	ecx
	push	8D73FCh
	push	8D6D48h
	push	edx
	call	6E15D0h
	add	esp,14h
	xor	eax,eax

l007046FB:
	pop	edi
	pop	esi
	pop	ebp
	pop	ebx
	ret

;; fn00704700: 00704700
;;   Called from:
;;     006E5788 (in fn006E5710)
;;     00704B16 (in fn00704B00)
;;     00725DA6 (in fn00725DA0)
fn00704700 proc
	push	esi
	mov	esi,[esp+8h]
	test	esi,esi
	jz	704722h

l00704709:
	cmp	dword ptr [esi+4h],0A1EB98h
	jnz	704722h

l00704712:
	push	8D0B00h
	push	esi
	call	6DF7C0h
	add	esp,8h
	pop	esi
	ret

l00704722:
	call	706DA0h
	push	eax
	push	0A1D1B8h
	push	esi
	call	703D00h
	add	esp,0Ch
	test	eax,eax
	jnz	704755h

l0070473A:
	test	esi,esi
	jz	704755h

l0070473E:
	mov	eax,[esi+4h]
	mov	eax,[eax+34h]
	test	eax,eax
	jz	704755h

l00704748:
	cmp	dword ptr [eax+0Ch],0h
	jz	704755h

l0070474E:
	mov	eax,1h
	pop	esi
	ret

l00704755:
	xor	eax,eax
	pop	esi
	ret
00704759                            CC CC CC CC CC CC CC          .......
00704760 56 8B 74 24 08 85 F6 57 0F 84 81 00 00 00 8B 7C V.t$...W.......|
00704770 24 10 85 FF 74 79 8B 46 04 8B 40 34 85 C0 74 11 $...ty.F..@4..t.
00704780 8B 40 04 85 C0 74 0A 57 56 FF D0 83 C4 08 5F 5E .@...t.WV....._^
00704790 C3 56 E8 69 FF FF FF 83 C4 04 85 C0 74 31 57 E8 .V.i........t1W.
007047A0 5C FF FF FF 83 C4 04 85 C0 74 24 6A 00 57 56 E8 \........t$j.WV.
007047B0 9C D3 FF FF 83 C4 0C 3D 80 64 A1 00 75 4F 83 00 .......=.d..uO..
007047C0 FF 75 0C 8B 48 04 8B 51 18 50 FF D2 83 C4 04 8B .u..H..Q.P......
007047D0 46 04 8B 48 0C 8B 15 7C 6B A1 00 51 68 00 74 8D F..H...|k..Qh.t.
007047E0 00 52 E8 E9 CD FD FF 83 C4 0C 5F 33 C0 5E C3 E8 .R........_3.^..
007047F0 CC C7 FD FF 85 C0 75 13 A1 20 87 A1 00 68 90 6C ......u.. ...h.l
00704800 8D 00 50 E8 78 C7 FD FF 83 C4 08 33 C0 5F 5E C3 ..P.x......3._^.
00704810 53 8B 5C 24 08 85 DB 75 20 E8 A2 C7 FD FF 85 C0 S.\$...u .......
00704820 75 13 A1 20 87 A1 00 68 90 6C 8D 00 50 E8 4E C7 u.. ...h.l..P.N.
00704830 FD FF 83 C4 08 33 C0 5B C3 8B 4B 04 8B 41 34 85 .....3.[..K..A4.
00704840 C0 74 14 8B 40 08 85 C0 74 0D 8B 54 24 0C 52 53 .t..@...t..T$.RS
00704850 FF D0 83 C4 08 5B C3 56 57 53 E8 A1 FE FF FF 83 .....[.VWS......
00704860 C4 04 85 C0 74 51 8B 44 24 14 50 E8 B0 08 00 00 ....tQ.D$.P.....
00704870 8B F0 83 C4 04 85 F6 74 59 6A 08 56 53 E8 CE D2 .......tYj.VS...
00704880 FF FF 83 C4 0C 83 06 FF 8B F8 75 0C 8B 4E 04 8B ..........u..N..
00704890 51 18 56 FF D2 83 C4 04 81 FF 80 64 A1 00 74 06 Q.V........d..t.
007048A0 8B C7 5F 5E 5B C3 83 07 FF 75 0C 8B 47 04 8B 48 .._^[....u..G..H
007048B0 18 57 FF D1 83 C4 04 8B 53 04 8B 42 0C 8B 0D 7C .W......S..B...|
007048C0 6B A1 00 50 68 28 74 8D 00 51 E8 01 CD FD FF 83 k..Ph(t..Q......
007048D0 C4 0C 5F 5E 33 C0 5B C3 CC CC CC CC CC CC CC CC .._^3.[.........
007048E0 56 8B 74 24 08 85 F6 57 0F 84 9C 00 00 00 8B 7C V.t$...W.......|
007048F0 24 10 85 FF 0F 84 90 00 00 00 8B 4E 04 8B 41 34 $..........N..A4
00704900 85 C0 74 28 F6 41 54 08 74 11 8B 48 20 85 C9 74 ..t(.AT.t..H ..t
00704910 0A 57 56 FF D1 83 C4 08 5F 5E C3 8B 40 04 85 C0 .WV....._^..@...
00704920 74 0A 57 56 FF D0 83 C4 08 5F 5E C3 56 E8 CE FD t.WV....._^.V...
00704930 FF FF 83 C4 04 85 C0 74 31 57 E8 C1 FD FF FF 83 .......t1W......
00704940 C4 04 85 C0 74 24 6A 00 6A 5C E8 41 DC FF FF 83 ....t$j.j\.A....
00704950 C4 08 3D 80 64 A1 00 75 4F 83 00 FF 75 0C 8B 48 ..=.d..uO...u..H
00704960 04 8B 51 18 50 FF D2 83 C4 04 8B 46 04 8B 48 0C ..Q.P......F..H.
00704970 8B 15 7C 6B A1 00 51 68 00 74 8D 00 52 E8 4E CC ..|k..Qh.t..R.N.
00704980 FD FF 83 C4 0C 5F 33 C0 5E C3 E8 31 C6 FD FF 85 ....._3.^..1....
00704990 C0 75 13 A1 20 87 A1 00 68 90 6C 8D 00 50 E8 DD .u.. ...h.l..P..
007049A0 C5 FD FF 83 C4 08 33 C0 5F 5E C3 CC CC CC CC CC ......3._^......
007049B0 56 8B 74 24 08 85 F6 75 20 E8 02 C6 FD FF 85 C0 V.t$...u .......
007049C0 75 13 A1 20 87 A1 00 68 90 6C 8D 00 50 E8 AE C5 u.. ...h.l..P...
007049D0 FD FF 83 C4 08 33 C0 5E C3 8B 4E 04 8B 41 34 85 .....3.^..N..A4.
007049E0 C0 74 2E F6 41 54 08 74 14 8B 48 24 85 C9 74 0D .t..AT.t..H$..t.
007049F0 8B 54 24 0C 52 56 FF D1 83 C4 08 5E C3 8B 40 08 .T$.RV.....^..@.
00704A00 85 C0 74 0D 8B 4C 24 0C 51 56 FF D0 83 C4 08 5E ..t..L$.QV.....^
00704A10 C3 53 57 56 E8 E7 FC FF FF 83 C4 04 85 C0 74 51 .SWV..........tQ
00704A20 8B 54 24 14 52 E8 F6 06 00 00 8B F8 83 C4 04 85 .T$.R...........
00704A30 FF 74 58 6A 08 6A 64 E8 54 DB FF FF 83 C4 08 83 .tXj.jd.T.......
00704A40 07 FF 8B D8 75 0C 8B 47 04 8B 48 18 57 FF D1 83 ....u..G..H.W...
00704A50 C4 04 81 FB 80 64 A1 00 74 06 5F 8B C3 5B 5E C3 .....d..t._..[^.
00704A60 83 03 FF 75 0C 8B 53 04 8B 42 18 53 FF D0 83 C4 ...u..S..B.S....
00704A70 04 8B 4E 04 8B 51 0C A1 7C 6B A1 00 52 68 28 74 ..N..Q..|k..Rh(t
00704A80 8D 00 50 E8 48 CB FD FF 83 C4 0C 5F 5B 33 C0 5E ..P.H......_[3.^
00704A90 C3 CC CC CC CC CC CC CC CC CC CC CC CC CC CC CC ................
00704AA0 8B 44 24 08 85 C0 75 1F E8 13 C5 FD FF 85 C0 75 .D$...u........u
00704AB0 13 A1 20 87 A1 00 68 90 6C 8D 00 50 E8 BF C4 FD .. ...h.l..P....
00704AC0 FF 83 C4 08 33 C0 C3 56 50 E8 F2 7F FE FF 8B F0 ....3..VP.......
00704AD0 83 C4 04 85 F6 75 02 5E C3 8B 4C 24 08 57 56 51 .....u.^..L$.WVQ
00704AE0 E8 3B F7 FF FF 83 C4 08 83 06 FF 8B F8 75 0C 8B .;...........u..
00704AF0 56 04 8B 42 18 56 FF D0 83 C4 04 8B C7 5F 5E C3 V..B.V......._^.

;; fn00704B00: 00704B00
;;   Called from:
;;     006F36FE (in fn006F3930)
;;     006FCD0B (in fn006FCC90)
;;     00704C00 (in fn00704BA0)
;;     00704DDC (in fn00704DA0)
;;     00704E5C (in fn00704E40)
;;     007072E8 (in fn007072E0)
;;     007093D1 (in fn00708DC0)
;;     00735DF7 (in fn00735890)
;;     00738AC0 (in fn007389B0)
fn00704B00 proc
	push	esi
	mov	esi,[esp+8h]
	mov	eax,[esi+4h]
	test	byte ptr [eax+54h],80h
	jz	704B15h

l00704B0E:
	mov	eax,[eax+6Ch]
	test	eax,eax
	jnz	704B4Ch

l00704B15:
	push	esi
	call	704700h
	add	esp,4h
	test	eax,eax
	jz	704B2Dh

l00704B22:
	push	esi
	call	725DA0h
	add	esp,4h
	pop	esi
	ret

l00704B2D:
	mov	eax,[esi+4h]
	mov	ecx,[eax+0Ch]
	mov	edx,[0A16B7Ch]
	push	ecx
	push	8D16A0h
	push	edx
	call	6E15D0h
	add	esp,0Ch
	xor	eax,eax
	pop	esi
	ret

l00704B4C:
	push	esi
	call	eax
	mov	esi,eax
	add	esp,4h
	test	esi,esi
	jz	704B92h

l00704B58:
	mov	eax,[esi+4h]
	test	byte ptr [eax+54h],80h
	jz	704B67h

l00704B61:
	cmp	dword ptr [eax+70h],0h
	jnz	704B92h

l00704B67:
	mov	eax,[eax+0Ch]
	mov	ecx,[0A16B7Ch]
	push	eax
	push	8D744Ch
	push	ecx
	call	6E15D0h
	add	esp,0Ch
	add	dword ptr [esi],0FFh
	jnz	704B90h

l00704B84:
	mov	edx,[esi+4h]
	mov	eax,[edx+18h]
	push	esi
	call	eax
	add	esp,4h

l00704B90:
	xor	esi,esi

l00704B92:
	mov	eax,esi
	pop	esi
	ret
00704B96                   CC CC CC CC CC CC CC CC CC CC       ..........

;; fn00704BA0: 00704BA0
;;   Called from:
;;     00707C6E (in fn00707BD0)
fn00704BA0 proc
	push	ecx
	push	esi
	mov	esi,[esp+0Ch]
	test	esi,esi
	jnz	704BCBh

l00704BAA:
	call	6E0FC0h
	test	eax,eax
	jnz	704BC6h

l00704BB3:
	mov	eax,[0A18720h]
	push	8D6C90h
	push	eax
	call	6E0F80h
	add	esp,8h

l00704BC6:
	xor	eax,eax
	pop	esi
	pop	ecx
	ret

l00704BCB:
	mov	eax,[esi+4h]
	cmp	eax,0A16588h
	jnz	704BDDh

l00704BD5:
	add	dword ptr [esi],1h
	mov	eax,esi
	pop	esi
	pop	ecx
	ret

l00704BDD:
	cmp	eax,0A1BAF0h
	jz	704D8Ah

l00704BE8:
	push	0A1BAF0h
	push	eax
	call	6D5670h
	add	esp,8h
	test	eax,eax
	jnz	704D8Ah

l00704BFE:
	push	ebx
	push	esi
	call	704B00h
	mov	ebx,eax
	add	esp,4h
	test	ebx,ebx
	mov	[esp+10h],ebx
	jnz	704C16h

l00704C12:
	pop	ebx
	pop	esi
	pop	ecx
	ret

l00704C16:
	push	edi
	push	esi
	call	7040D0h
	mov	edi,eax
	add	esp,4h
	test	edi,edi
	jge	704C77h

l00704C26:
	call	6E0FC0h
	test	eax,eax
	jz	704C6Dh

l00704C2F:
	mov	ecx,[0A16B7Ch]
	push	ecx
	call	6E1110h
	add	esp,4h
	test	eax,eax
	jnz	704C6Dh

l00704C42:
	mov	edx,[0A178F0h]
	push	edx
	call	6E1110h
	add	esp,4h
	test	eax,eax
	jnz	704C6Dh

l00704C55:
	add	dword ptr [ebx],0FFh
	jnz	704C66h

l00704C5A:
	mov	eax,[ebx+4h]
	mov	ecx,[eax+18h]
	push	ebx
	call	ecx
	add	esp,4h

l00704C66:
	pop	edi
	pop	ebx
	xor	eax,eax
	pop	esi
	pop	ecx
	ret

l00704C6D:
	call	6E1160h
	mov	edi,0Ah

l00704C77:
	push	ebp
	push	edi
	call	6DFD20h
	add	esp,4h
	test	eax,eax
	mov	[esp+10h],eax
	jz	704D71h

l00704C8D:
	push	ebx
	xor	ebp,ebp
	call	704040h
	mov	esi,eax
	add	esp,4h
	test	esi,esi
	jz	704CEDh

l00704C9E:
	mov	ebx,0Ch

l00704CA3:
	cmp	ebp,edi
	jl	704CC9h

l00704CA7:
	mov	eax,edi
	add	edi,0Ah
	mov	edx,edi
	sar	edx,2h
	add	edi,edx
	cmp	edi,eax
	jl	704D27h

l00704CB7:
	lea	eax,[esp+10h]
	push	edi
	push	eax
	call	6E0B00h
	add	esp,8h
	test	eax,eax
	jnz	704D3Ch

l00704CC9:
	mov	ecx,[esp+10h]
	mov	edx,[esp+18h]
	mov	[ebx+ecx],esi
	push	edx
	add	ebp,1h
	add	ebx,4h
	call	704040h
	mov	esi,eax
	add	esp,4h
	test	esi,esi
	jnz	704CA3h

l00704CE9:
	mov	ebx,[esp+18h]

l00704CED:
	call	6E0FC0h
	test	eax,eax
	jnz	704D51h

l00704CF6:
	cmp	ebp,edi
	jge	704D0Ch

l00704CFA:
	lea	eax,[esp+10h]
	push	ebp
	push	eax
	call	6E0B00h
	add	esp,8h
	test	eax,eax
	jnz	704D51h

l00704D0C:
	add	dword ptr [ebx],0FFh
	jnz	704D1Dh

l00704D11:
	mov	ecx,[ebx+4h]
	mov	edx,[ecx+18h]
	push	ebx
	call	edx
	add	esp,4h

l00704D1D:
	mov	eax,[esp+10h]
	pop	ebp
	pop	edi
	pop	ebx
	pop	esi
	pop	ecx
	ret

l00704D27:
	call	6E1210h
	add	dword ptr [esi],0FFh
	jnz	704D4Dh

l00704D31:
	mov	eax,[esi+4h]
	mov	ecx,[eax+18h]
	push	esi
	call	ecx
	jmp	704D4Ah

l00704D3C:
	add	dword ptr [esi],0FFh
	jnz	704D4Dh

l00704D41:
	mov	edx,[esi+4h]
	mov	eax,[edx+18h]
	push	esi
	call	eax

l00704D4A:
	add	esp,4h

l00704D4D:
	mov	ebx,[esp+18h]

l00704D51:
	mov	eax,[esp+10h]
	test	eax,eax
	jz	704D71h

l00704D59:
	add	dword ptr [eax],0FFh
	mov	eax,[esp+10h]
	cmp	dword ptr [eax],0h
	jnz	704D71h

l00704D65:
	mov	ecx,[eax+4h]
	mov	edx,[ecx+18h]
	push	eax
	call	edx
	add	esp,4h

l00704D71:
	add	dword ptr [ebx],0FFh
	jnz	704D82h

l00704D76:
	mov	eax,[ebx+4h]
	mov	ecx,[eax+18h]
	push	ebx
	call	ecx
	add	esp,4h

l00704D82:
	pop	ebp
	pop	edi
	pop	ebx
	xor	eax,eax
	pop	esi
	pop	ecx
	ret

l00704D8A:
	push	esi
	call	6F4F00h
	add	esp,4h
	pop	esi
	pop	ecx
	ret
00704D96                   CC CC CC CC CC CC CC CC CC CC       ..........

;; fn00704DA0: 00704DA0
;;   Called from:
;;     006F3252 (in fn006F31C0)
;;     006F3846 (in fn006F3930)
fn00704DA0 proc
	mov	eax,[esp+4h]
	test	eax,eax
	jnz	704DC7h

l00704DA8:
	call	6E0FC0h
	test	eax,eax
	jnz	704DC4h

l00704DB1:
	mov	eax,[0A18720h]
	push	8D6C90h
	push	eax
	call	6E0F80h
	add	esp,8h

l00704DC4:
	xor	eax,eax
	ret

l00704DC7:
	mov	ecx,[eax+4h]
	cmp	ecx,0A1BAF0h
	jz	704E36h

l00704DD2:
	cmp	ecx,0A16588h
	jz	704E36h

l00704DDA:
	push	esi
	push	eax
	call	704B00h
	mov	esi,eax
	add	esp,4h
	test	esi,esi
	jnz	704E14h

l00704DEA:
	mov	ecx,[0A16B7Ch]
	push	ecx
	call	6E1110h
	add	esp,4h
	test	eax,eax
	jz	704E10h

l00704DFD:
	mov	edx,[esp+0Ch]
	mov	eax,[0A16B7Ch]
	push	edx
	push	eax
	call	6E0F80h
	add	esp,8h

l00704E10:
	xor	eax,eax
	pop	esi
	ret

l00704E14:
	push	edi
	push	esi
	call	7035C0h
	add	esp,4h
	add	dword ptr [esi],0FFh
	mov	edi,eax
	jnz	704E31h

l00704E25:
	mov	ecx,[esi+4h]
	mov	edx,[ecx+18h]
	push	esi
	call	edx
	add	esp,4h

l00704E31:
	mov	eax,edi
	pop	edi
	pop	esi
	ret

l00704E36:
	add	dword ptr [eax],1h
	ret
00704E3A                               CC CC CC CC CC CC           ......

;; fn00704E40: 00704E40
;;   Called from:
;;     00705009 (in fn00704FE0)
fn00704E40 proc
	push	ebx
	push	esi
	mov	esi,[esp+0Ch]
	xor	ebx,ebx
	cmp	esi,ebx
	jz	704F96h

l00704E50:
	cmp	[esp+10h],ebx
	jz	704F96h

l00704E5A:
	push	ebp
	push	esi
	call	704B00h
	mov	ebp,eax
	add	esp,4h
	cmp	ebp,ebx
	jnz	704E8Ch

l00704E6A:
	mov	eax,[esi+4h]
	mov	ecx,[eax+0Ch]
	mov	edx,[0A16B7Ch]
	push	ecx
	push	8D74E4h
	push	edx
	call	6E15D0h
	add	esp,0Ch
	pop	ebp
	pop	esi
	or	eax,0FFh
	pop	ebx
	ret

l00704E8C:
	mov	[esp+10h],ebx
	push	edi

l00704E91:
	mov	eax,[ebp+4h]
	mov	ecx,[eax+70h]
	push	ebp
	call	ecx
	mov	esi,eax
	add	esp,4h
	test	esi,esi
	jz	704F0Ch

l00704EA3:
	mov	edx,[esp+18h]
	push	2h
	push	esi
	push	edx
	call	6DF5A0h
	add	esp,0Ch
	add	dword ptr [esi],0FFh
	mov	edi,eax
	jnz	704EC6h

l00704EBA:
	mov	eax,[esi+4h]
	mov	ecx,[eax+18h]
	push	esi
	call	ecx
	add	esp,4h

l00704EC6:
	test	edi,edi
	jl	704F7Ah

l00704ECE:
	jle	704EE3h

l00704ED0:
	mov	eax,[esp+1Ch]
	sub	eax,1h
	jz	704EFFh

l00704ED9:
	sub	eax,1h
	jz	704F51h

l00704EDE:
	sub	eax,1h
	jz	704F4Ah

l00704EE3:
	cmp	dword ptr [esp+1Ch],2h
	jnz	704E91h

l00704EEA:
	cmp	ebx,7FFFFFFFh
	jnz	704EFAh

l00704EF2:
	mov	dword ptr [esp+14h],1h

l00704EFA:
	add	ebx,1h
	jmp	704E91h

l00704EFF:
	cmp	ebx,7FFFFFFFh
	jz	704F66h

l00704F07:
	add	ebx,1h
	jmp	704E91h

l00704F0C:
	call	6E0FC0h
	test	eax,eax
	jz	704F2Dh

l00704F15:
	mov	edx,[0A16D00h]
	push	edx
	call	6E1110h
	add	esp,4h
	test	eax,eax
	jz	704F2Dh

l00704F28:
	call	6E1160h

l00704F2D:
	call	6E0FC0h
	test	eax,eax
	jnz	704F7Ah

l00704F36:
	cmp	dword ptr [esp+1Ch],2h
	jnz	704F7Dh

l00704F3D:
	mov	eax,[0A17E2Ch]
	push	8D74BCh
	push	eax
	jmp	704F72h

l00704F4A:
	mov	ebx,1h
	jmp	704F7Dh

l00704F51:
	cmp	dword ptr [esp+14h],0h
	jz	704F7Dh

l00704F58:
	mov	ecx,[0A18598h]
	push	8D749Ch
	push	ecx
	jmp	704F72h

l00704F66:
	mov	edx,[0A18598h]
	push	8D747Ch
	push	edx

l00704F72:
	call	6E0F80h
	add	esp,8h

l00704F7A:
	or	ebx,0FFh

l00704F7D:
	add	dword ptr [ebp+0h],0FFh
	pop	edi
	jnz	704F90h

l00704F84:
	mov	eax,[ebp+4h]
	mov	ecx,[eax+18h]
	push	ebp
	call	ecx
	add	esp,4h

l00704F90:
	pop	ebp
	pop	esi
	mov	eax,ebx
	pop	ebx
	ret

l00704F96:
	call	6E0FC0h
	test	eax,eax
	jnz	704FB3h

l00704F9F:
	mov	edx,[0A18720h]
	push	8D6C90h
	push	edx
	call	6E0F80h
	add	esp,8h

l00704FB3:
	pop	esi
	or	eax,0FFh
	pop	ebx
	ret
00704FB9                            CC CC CC CC CC CC CC          .......
00704FC0 8B 44 24 08 8B 4C 24 04 6A 01 50 51 E8 6F FE FF .D$..L$.j.PQ.o..
00704FD0 FF 83 C4 0C C3 CC CC CC CC CC CC CC CC CC CC CC ................

;; fn00704FE0: 00704FE0
;;   Called from:
;;     00708157 (in fn00708130)
;;     00708168 (in fn00708130)
fn00704FE0 proc
	mov	ecx,[esp+4h]
	mov	eax,[ecx+4h]
	test	byte ptr [eax+54h],2h
	jz	705001h

l00704FED:
	mov	eax,[eax+34h]
	test	eax,eax
	jz	705001h

l00704FF4:
	mov	eax,[eax+1Ch]
	test	eax,eax
	jz	705001h

l00704FFB:
	mov	[esp+4h],ecx
	jmp	eax

l00705001:
	mov	eax,[esp+8h]
	push	3h
	push	eax
	push	ecx
	call	704E40h
	add	esp,0Ch
	ret
00705012       CC CC CC CC CC CC CC CC CC CC CC CC CC CC   ..............
00705020 8B 44 24 08 8B 4C 24 04 6A 02 50 51 E8 0F FE FF .D$..L$.j.PQ....
00705030 FF 83 C4 0C C3 CC CC CC CC CC CC CC CC CC CC CC ................

;; fn00705040: 00705040
;;   Called from:
;;     006E9CD2 (in fn006E9BD0)
fn00705040 proc
	mov	eax,7FFFFFFFh
	ret
00705046                   CC CC CC CC CC CC CC CC CC CC       ..........

;; fn00705050: 00705050
;;   Called from:
;;     007050C4 (in fn007050A0)
fn00705050 proc
	push	3DCh
	call	dword ptr [8A45BCh]
	add	esp,4h
	test	eax,eax
	jnz	705067h

l00705062:
	jmp	6E1210h

l00705067:
	mov	ecx,[0A6D158h]
	mov	[eax],ecx
	mov	[0A6D158h],eax
	add	eax,4h
	push	esi
	lea	esi,[eax+3CCh]
	mov	ecx,esi
	cmp	ecx,eax
	jbe	705090h

l00705084:
	lea	edx,[ecx-0Ch]
	mov	[ecx+4h],edx
	mov	ecx,edx
	cmp	ecx,eax
	ja	705084h

l00705090:
	mov	eax,esi
	mov	dword ptr [ecx+4h],0h
	pop	esi
	ret
0070509B                                  CC CC CC CC CC            .....

;; fn007050A0: 007050A0
;;   Called from:
;;     006E1E2E (in fn006E1DE0)
;;     006E9CA3 (in fn006E9BD0)
;;     006E9CBB (in fn006E9BD0)
;;     006E9CF4 (in fn006E9BD0)
;;     00705133 (in fn00705120)
;;     00709715 (in fn00708DC0)
;;     00709797 (in fn00708DC0)
;;     007099EA (in fn00708DC0)
;;     00709A53 (in fn00708DC0)
;;     0070AB3C (in fn00708DC0)
;;     0070B1F8 (in fn00708DC0)
;;     00711295 (in fn00711280)
;;     00726291 (in fn00726260)
;;     007263AE (in fn00726340)
;;     0072776F (in fn007276E0)
;;     0072A990 (in fn0072A940)
;;     0072AC74 (in fn0072AC20)
;;     00731AAD (in fn00731A20)
;;     007368E1 (in fn007367D0)
;;     0073D1E5 (in fn0073D140)
;;     00747644 (in fn00747610)
;;     007476DF (in fn00747610)
;;     00747765 (in fn00747610)
;;     007477DB (in fn00747610)
;;     00747844 (in fn00747610)
;;     007478A2 (in fn00747890)
;;     00747ACB (in fn00747A80)
;;     00747B26 (in fn00747A80)
;;     00747B95 (in fn00747A80)
;;     0074820B (in fn00748190)
;;     0074828E (in fn00748190)
fn007050A0 proc
	push	esi
	mov	esi,[esp+8h]
	lea	eax,[esi+5h]
	cmp	eax,105h
	ja	7050BBh

l007050AF:
	mov	eax,[0A6CD54h+esi*4]
	add	dword ptr [eax],1h
	pop	esi
	ret

l007050BB:
	mov	eax,[0A6D15Ch]
	test	eax,eax
	jnz	7050D4h

l007050C4:
	call	705050h
	test	eax,eax
	mov	[0A6D15Ch],eax
	jnz	7050D4h

l007050D2:
	pop	esi
	ret

l007050D4:
	mov	edx,[eax+4h]
	lea	ecx,[eax+4h]
	mov	[eax+8h],esi
	mov	[0A6D15Ch],edx
	mov	dword ptr [ecx],0A1E7E8h
	mov	dword ptr [eax],1h
	pop	esi
	ret
007050F1    CC CC CC CC CC CC CC CC CC CC CC CC CC CC CC  ...............
00705100 8B 44 24 04 3D FF FF FF 7F 77 09 89 44 24 04 E9 .D$.=....w..D$..
00705110 8C FF FF FF 89 44 24 04 E9 A3 C3 00 00 CC CC CC .....D$.........

;; fn00705120: 00705120
;;   Called from:
;;     006E377B (in fn006E3770)
;;     006E38BB (in fn006E38B0)
;;     0072F236 (in fn0072F230)
;;     0072F24C (in fn0072F230)
;;     007360B0 (in fn00735890)
fn00705120 proc
	mov	eax,[esp+4h]
	lea	ecx,[eax-80000000h]
	cmp	ecx,0FFh
	ja	705138h

l0070512F:
	mov	[esp+4h],eax
	jmp	7050A0h

l00705138:
	mov	[esp+4h],eax
	jmp	7114A0h
00705141    CC CC CC CC CC CC CC CC CC CC CC CC CC CC CC  ...............
00705150 8B 44 24 04 8B 48 04 81 F9 E8 E7 A1 00 75 0F 8B .D$..H.......u..
00705160 0D 5C D1 A6 00 89 48 04 A3 5C D1 A6 00 C3 8B 91 .\....H..\......
00705170 A0 00 00 00 89 44 24 04 FF E2 CC CC CC CC CC CC .....D$.........
00705180 8B 44 24 04 8B 0D 5C D1 A6 00 89 48 04 A3 5C D1 .D$...\....H..\.
00705190 A6 00 C3 CC CC CC CC CC CC CC CC CC CC CC CC CC ................

;; fn007051A0: 007051A0
;;   Called from:
;;     0065668C (in fn00656570)
;;     006DC22C (in fn006DC1B0)
;;     006E5CAD (in fn006E5C60)
;;     006E5D88 (in fn006E5C60)
;;     006E5E57 (in fn006E5C60)
;;     006E5F24 (in fn006E5C60)
;;     006E7E3C (in fn006E7D90)
;;     006E7EA9 (in fn006E7D90)
;;     006E8D59 (in fn006E8D90)
;;     0070417A (in fn007040D0)
;;     0070531A (in fn007052C0)
;;     0070A851 (in fn00708DC0)
;;     007109A8 (in fn007108F0)
;;     0071160F (in fn007114E0)
;;     00711658 (in fn007114E0)
;;     007277E6 (in fn007276E0)
;;     0072FC16 (in fn0072FBB0)
;;     00731A8D (in fn00731A20)
;;     0073606B (in fn00735890)
;;     0073B8CD (in fn0073B870)
;;     00748184 (in fn00748140)
fn007051A0 proc
	push	esi
	mov	esi,[esp+8h]
	test	esi,esi
	jz	7052A6h

l007051AD:
	mov	eax,[esi+4h]
	cmp	eax,0A1E7E8h
	jz	7051C9h

l007051B7:
	push	0A1E7E8h
	push	eax
	call	6D5670h
	add	esp,8h
	test	eax,eax
	jz	7051CEh

l007051C9:
	mov	eax,[esi+8h]
	pop	esi
	ret

l007051CE:
	mov	eax,[esi+4h]
	mov	eax,[eax+30h]
	test	eax,eax
	jz	7052A6h

l007051DC:
	mov	eax,[eax+48h]
	test	eax,eax
	jz	7052A6h

l007051E7:
	push	esi
	call	eax
	mov	esi,eax
	add	esp,4h
	test	esi,esi
	jz	7052BAh

l007051F7:
	mov	eax,[esi+4h]
	cmp	eax,0A1E7E8h
	push	edi
	jz	70528Dh

l00705206:
	push	0A1E7E8h
	push	eax
	call	6D5670h
	add	esp,8h
	test	eax,eax
	jnz	70528Dh

l00705218:
	mov	eax,[esi+4h]
	cmp	eax,0A1F400h
	jz	70525Eh

l00705222:
	push	0A1F400h
	push	eax
	call	6D5670h
	add	esp,8h
	test	eax,eax
	jnz	70525Eh

l00705234:
	add	dword ptr [esi],0FFh
	jnz	705245h

l00705239:
	mov	ecx,[esi+4h]
	mov	edx,[ecx+18h]
	push	esi
	call	edx
	add	esp,4h

l00705245:
	mov	eax,[0A16B7Ch]
	push	8D7528h
	push	eax
	call	6E0F80h
	add	esp,8h
	pop	edi
	or	eax,0FFh
	pop	esi
	ret

l0070525E:
	push	esi
	call	7108F0h
	add	esp,4h
	add	dword ptr [esi],0FFh
	mov	edi,eax
	jnz	70527Ah

l0070526E:
	mov	ecx,[esi+4h]
	mov	edx,[ecx+18h]
	push	esi
	call	edx
	add	esp,4h

l0070527A:
	cmp	edi,0FFh
	jnz	7052A1h

l0070527F:
	call	6E0FC0h
	test	eax,eax
	jz	7052A1h

l00705288:
	or	eax,edi
	pop	edi
	pop	esi
	ret

l0070528D:
	add	dword ptr [esi],0FFh
	mov	edi,[esi+8h]
	jnz	7052A1h

l00705295:
	mov	eax,[esi+4h]
	mov	ecx,[eax+18h]
	push	esi
	call	ecx
	add	esp,4h

l007052A1:
	mov	eax,edi
	pop	edi
	pop	esi
	ret

l007052A6:
	mov	edx,[0A16B7Ch]
	push	8D7510h
	push	edx
	call	6E0F80h
	add	esp,8h

l007052BA:
	or	eax,0FFh
	pop	esi
	ret
007052BF                                              CC                .

;; fn007052C0: 007052C0
;;   Called from:
;;     00702C4D (in fn00702C30)
;;     007097DC (in fn00708DC0)
fn007052C0 proc
	push	esi
	mov	esi,[esp+8h]
	test	esi,esi
	jnz	7052E1h

l007052C9:
	mov	eax,[0A16B7Ch]
	push	8D7510h
	push	eax
	call	6E0F80h
	add	esp,8h
	or	eax,0FFh
	pop	esi
	ret

l007052E1:
	mov	eax,[esi+4h]
	cmp	eax,0A1E7E8h
	jz	70532Fh

l007052EB:
	push	0A1E7E8h
	push	eax
	call	6D5670h
	add	esp,8h
	test	eax,eax
	jnz	70532Fh

l007052FD:
	mov	eax,[esi+4h]
	cmp	eax,0A1F400h
	jz	705324h

l00705307:
	push	0A1F400h
	push	eax
	call	6D5670h
	add	esp,8h
	test	eax,eax
	jnz	705324h

l00705319:
	push	esi
	call	7051A0h
	add	esp,4h
	pop	esi
	ret

l00705324:
	push	esi
	call	7109D0h
	add	esp,4h
	pop	esi
	ret

l0070532F:
	mov	eax,[esi+8h]
	pop	esi
	ret
00705334             CC CC CC CC CC CC CC CC CC CC CC CC     ............

;; fn00705340: 00705340
;;   Called from:
;;     006E5D46 (in fn006E5C60)
;;     006E5E21 (in fn006E5C60)
;;     006E5EEE (in fn006E5C60)
;;     006E5FB0 (in fn006E5C60)
;;     006E6085 (in fn006E5C60)
;;     00710BF7 (in fn00710B80)
fn00705340 proc
	push	esi
	mov	esi,[esp+8h]
	test	esi,esi
	jz	705469h

l0070534D:
	mov	eax,[esi+4h]
	cmp	eax,0A1E7E8h
	jz	705369h

l00705357:
	push	0A1E7E8h
	push	eax
	call	6D5670h
	add	esp,8h
	test	eax,eax
	jz	70536Eh

l00705369:
	mov	eax,[esi+8h]
	pop	esi
	ret

l0070536E:
	mov	eax,[esi+4h]
	cmp	eax,0A1F400h
	jz	70538Ah

l00705378:
	push	0A1F400h
	push	eax
	call	6D5670h
	add	esp,8h
	test	eax,eax
	jz	705395h

l0070538A:
	push	esi
	call	710B80h
	add	esp,4h
	pop	esi
	ret

l00705395:
	mov	eax,[esi+4h]
	mov	eax,[eax+30h]
	test	eax,eax
	jz	705469h

l007053A3:
	mov	eax,[eax+48h]
	test	eax,eax
	jz	705469h

l007053AE:
	push	esi
	call	eax
	mov	esi,eax
	add	esp,4h
	test	esi,esi
	jz	70547Dh

l007053BE:
	mov	eax,[esi+4h]
	cmp	eax,0A1E7E8h
	push	edi
	jz	705450h

l007053CD:
	push	0A1E7E8h
	push	eax
	call	6D5670h
	add	esp,8h
	test	eax,eax
	jnz	705450h

l007053DF:
	mov	eax,[esi+4h]
	cmp	eax,0A1F400h
	jz	705425h

l007053E9:
	push	0A1F400h
	push	eax
	call	6D5670h
	add	esp,8h
	test	eax,eax
	jnz	705425h

l007053FB:
	add	dword ptr [esi],0FFh
	jnz	70540Ch

l00705400:
	mov	ecx,[esi+4h]
	mov	edx,[ecx+18h]
	push	esi
	call	edx
	add	esp,4h

l0070540C:
	mov	eax,[0A16B7Ch]
	push	8D7528h
	push	eax
	call	6E0F80h
	add	esp,8h
	pop	edi
	or	eax,0FFh
	pop	esi
	ret

l00705425:
	push	esi
	call	710B80h
	add	esp,4h
	add	dword ptr [esi],0FFh
	mov	edi,eax
	jnz	705441h

l00705435:
	mov	ecx,[esi+4h]
	mov	edx,[ecx+18h]
	push	esi
	call	edx
	add	esp,4h

l00705441:
	call	6E0FC0h
	test	eax,eax
	jz	705464h

l0070544A:
	pop	edi
	or	eax,0FFh
	pop	esi
	ret

l00705450:
	add	dword ptr [esi],0FFh
	mov	edi,[esi+8h]
	jnz	705464h

l00705458:
	mov	eax,[esi+4h]
	mov	ecx,[eax+18h]
	push	esi
	call	ecx
	add	esp,4h

l00705464:
	mov	eax,edi
	pop	edi
	pop	esi
	ret

l00705469:
	mov	edx,[0A16B7Ch]
	push	8D7510h
	push	edx
	call	6E0F80h
	add	esp,8h

l0070547D:
	or	eax,0FFh
	pop	esi
	ret
00705482       CC CC CC CC CC CC CC CC CC CC CC CC CC CC   ..............
00705490 51 57 8B 7C 24 14 85 FF 74 05 83 FF 02 7C 05 83 QW.|$...t....|..
007054A0 FF 24 7E 18 A1 2C 7E A1 00 68 74 75 8D 00 50 E8 .$~..,~..htu..P.
007054B0 CC BA FD FF 83 C4 08 33 C0 5F 59 C3 55 8B 2D 84 .......3._Y.U.-.
007054C0 46 8A 00 56 8B 74 24 14 8A 06 84 C0 74 19 8B FF F..V.t$.....t...
007054D0 0F B6 C8 51 FF D5 83 C4 04 85 C0 74 0A 8A 46 01 ...Q.......t..F.
007054E0 83 C6 01 84 C0 75 E9 53 8B 1D E4 46 8A 00 FF D3 .....u.S...F....
007054F0 85 FF C7 00 00 00 00 00 75 30 80 3E 30 75 2B 57 ........u0.>0u+W
00705500 8D 54 24 14 52 56 E8 95 AC 04 00 8B F8 83 C4 0C .T$.RV..........
00705510 85 FF 7D 27 8B 44 24 1C 6A 00 50 56 E8 CF CB 00 ..}'.D$.j.PV....
00705520 00 83 C4 0C 5B 5E 5D 5F 59 C3 57 8D 4C 24 14 51 ....[^]_Y.W.L$.Q
00705530 56 E8 BA AD 04 00 83 C4 0C 8B F8 8B 44 24 10 3B V...........D$.;
00705540 C6 0F 84 82 00 00 00 0F B6 50 FF 52 FF 15 C4 46 .........P.R...F
00705550 8A 00 83 C4 04 85 C0 74 70 8B 44 24 10 8A 00 84 .......tp.D$....
00705560 C0 74 29 0F B6 C8 51 FF D5 83 C4 04 85 C0 74 13 .t)...Q.......t.
00705570 8B 44 24 10 83 C0 01 89 44 24 10 8A 00 84 C0 75 .D$.....D$.....u
00705580 E2 EB 09 8B 54 24 10 80 3A 00 75 3D FF D3 83 38 ....T$..:.u=...8
00705590 00 74 19 8B 44 24 20 8B 4C 24 1C 50 51 56 E8 4D .t..D$ .L$.PQV.M
007055A0 CB 00 00 83 C4 0C 5B 5E 5D 5F 59 C3 8B 44 24 1C ......[^]_Y..D$.
007055B0 85 C0 74 06 8B 54 24 10 89 10 57 E8 E0 FA FF FF ..t..T$...W.....
007055C0 83 C4 04 5B 5E 5D 5F 59 C3 8B C6 8D 50 01 8B FF ...[^]_Y....P...
007055D0 8A 08 83 C0 01 84 C9 75 F7 2B C2 3D C8 00 00 00 .......u.+.=....
007055E0 73 12 8B C6 8D 50 01 8A 08 83 C0 01 84 C9 75 F7 s....P........u.
007055F0 2B C2 EB 05 B8 C8 00 00 00 50 56 E8 B0 73 FE FF +........PV..s..
00705600 8B F0 83 C4 08 85 F6 74 4E 56 E8 A1 87 FD FF 83 .......tNV......
00705610 C4 04 83 06 FF 8B F8 75 0C 8B 46 04 8B 48 18 56 .......u..F..H.V
00705620 FF D1 83 C4 04 85 FF 74 2E 8B 44 24 20 8B 0D 2C .......t..D$ ..,
00705630 7E A1 00 8D 57 14 52 50 68 48 75 8D 00 51 E8 8D ~...W.RPhHu..Q..
00705640 BF FD FF 83 C4 10 83 07 FF 75 0C 8B 57 04 8B 42 .........u..W..B
00705650 18 57 FF D0 83 C4 04 5B 5E 5D 33 C0 5F 59 C3 CC .W.....[^]3._Y..
00705660 56 57 8B 7C 24 10 8D 47 01 85 C0 75 05 B8 01 00 VW.|$..G...u....
00705670 00 00 50 FF 15 BC 45 8A 00 8B F0 83 C4 04 85 F6 ..P...E.........
00705680 75 07 5F 5E E9 87 BB FD FF 8B 44 24 0C 6A 00 56 u._^......D$.j.V
00705690 57 50 E8 79 6E 01 00 83 C4 10 85 C0 74 0F 56 FF WP.yn.......t.V.
007056A0 15 D4 45 8A 00 83 C4 04 5F 33 C0 5E C3 8B 4C 24 ..E....._3.^..L$
007056B0 14 51 6A 00 56 E8 D6 FD FF FF 56 8B F8 FF 15 D4 .Qj.V.....V.....
007056C0 45 8A 00 83 C4 10 8B C7 5F 5E C3 CC CC CC CC CC E......._^......
007056D0 8B 44 24 04 8B 48 08 8B 54 24 08 51 68 B4 4F 8D .D$..H..T$.Qh.O.
007056E0 00 52 FF 15 E0 45 8A 00 83 C4 0C 33 C0 C3 CC CC .R...E.....3....
007056F0 83 EC 44 A1 88 41 A1 00 33 C4 89 44 24 40 8B 44 ..D..A..3..D$@.D
00705700 24 48 8B 40 08 50 68 B4 4F 8D 00 8D 4C 24 08 6A $H.@.Ph.O...L$.j
00705710 40 51 E8 C9 F8 01 00 8D 54 24 10 52 E8 9F 73 FE @Q......T$.R..s.
00705720 FF 8B 4C 24 54 83 C4 14 33 CC E8 5F F4 F8 FF 83 ..L$T...3.._....
00705730 C4 44 C3 CC CC CC CC CC CC CC CC CC CC CC CC CC .D..............
00705740 8B 44 24 04 8B 4C 24 08 8B 40 08 8B 49 08 3B C1 .D$..L$..@..I.;.
00705750 7D 04 83 C8 FF C3 33 D2 3B C1 0F 9F C2 8B C2 C3 }.....3.;.......
00705760 8B 44 24 04 8B 40 08 83 F8 FF 75 05 B8 FE FF FF .D$..@....u.....
00705770 FF C3 CC CC CC CC CC CC CC CC CC CC CC CC CC CC ................
00705780 53 8B 5C 24 08 8B 43 04 3D E8 E7 A1 00 74 20 68 S.\$..C.=....t h
00705790 E8 E7 A1 00 50 E8 D6 FE FC FF 83 C4 08 85 C0 75 ....P..........u
007057A0 0E 83 05 80 64 A1 00 01 B8 80 64 A1 00 5B C3 56 ....d.....d..[.V
007057B0 8B 73 08 57 8B 7C 24 14 8B 47 04 3D E8 E7 A1 00 .s.W.|$..G.=....
007057C0 74 22 68 E8 E7 A1 00 50 E8 A3 FE FC FF 83 C4 08 t"h....P........
007057D0 85 C0 75 10 83 05 80 64 A1 00 01 5F 5E B8 80 64 ..u....d..._^..d
007057E0 A1 00 5B C3 8B 4F 08 8D 04 31 8B D0 33 D6 7D 18 ..[..O...1..3.}.
007057F0 8B D0 33 D1 7D 12 A1 30 F4 A1 00 8B 08 57 53 FF ..3.}..0.....WS.
00705800 D1 83 C4 08 5F 5E 5B C3 50 E8 92 F8 FF FF 83 C4 ...._^[.P.......
00705810 04 5F 5E 5B C3 CC CC CC CC CC CC CC CC CC CC CC ._^[............
00705820 53 8B 5C 24 08 8B 43 04 3D E8 E7 A1 00 74 20 68 S.\$..C.=....t h
00705830 E8 E7 A1 00 50 E8 36 FE FC FF 83 C4 08 85 C0 75 ....P.6........u
00705840 0E 83 05 80 64 A1 00 01 B8 80 64 A1 00 5B C3 56 ....d.....d..[.V
00705850 8B 73 08 57 8B 7C 24 14 8B 47 04 3D E8 E7 A1 00 .s.W.|$..G.=....
00705860 74 22 68 E8 E7 A1 00 50 E8 03 FE FC FF 83 C4 08 t"h....P........
00705870 85 C0 75 10 83 05 80 64 A1 00 01 5F 5E B8 80 64 ..u....d..._^..d
00705880 A1 00 5B C3 8B 4F 08 8B C6 2B C1 8B D0 33 D6 7D ..[..O...+...3.}
00705890 19 F7 D1 33 C8 7D 13 A1 30 F4 A1 00 8B 48 04 57 ...3.}..0....H.W
007058A0 53 FF D1 83 C4 08 5F 5E 5B C3 50 E8 F0 F7 FF FF S....._^[.P.....
007058B0 83 C4 04 5F 5E 5B C3 CC CC CC CC CC CC CC CC CC ..._^[..........
007058C0 83 EC 08 53 8B 5C 24 10 8B 43 04 3D E8 E7 A1 00 ...S.\$..C.=....
007058D0 74 23 68 E8 E7 A1 00 50 E8 93 FD FC FF 83 C4 08 t#h....P........
007058E0 85 C0 75 11 83 05 80 64 A1 00 01 B8 80 64 A1 00 ..u....d.....d..
007058F0 5B 83 C4 08 C3 56 8B 74 24 18 8B 46 04 3D E8 E7 [....V.t$..F.=..
00705900 A1 00 57 8B 7B 08 89 7C 24 0C 74 25 68 E8 E7 A1 ..W.{..|$.t%h...
00705910 00 50 E8 59 FD FC FF 83 C4 08 85 C0 75 13 83 05 .P.Y........u...
00705920 80 64 A1 00 01 5F 5E B8 80 64 A1 00 5B 83 C4 08 .d..._^..d..[...
00705930 C3 8B 46 08 89 44 24 18 0F AF C7 DB 44 24 18 DA ..F..D$.....D$..
00705940 4C 24 0C 8B C8 89 4C 24 10 DB 44 24 10 D9 C0 D9 L$....L$..D$....
00705950 C2 D9 C9 DF E9 DD D8 9F F6 C4 44 7A 14 DD D8 DD ..........Dz....
00705960 D8 51 E8 39 F7 FF FF 83 C4 04 5F 5E 5B 83 C4 08 .Q.9......_^[...
00705970 C3 D8 E1 D9 EE D9 C9 DB F1 73 02 D9 E0 D9 CA DB .........s......
00705980 F1 DD D9 73 02 D9 E0 D9 C9 DC 0D 98 75 8D 00 D9 ...s........u...
00705990 C9 DF F1 DD D8 73 CA A1 30 F4 A1 00 8B 48 08 56 .....s..0....H.V
007059A0 53 FF D1 83 C4 08 5F 5E 5B 83 C4 08 C3 CC CC CC S....._^[.......
007059B0 85 F6 75 19 A1 9C 85 A1 00 68 A0 75 8D 00 50 E8 ..u......h.u..P.
007059C0 BC B5 FD FF 83 C4 08 B8 02 00 00 00 C3 83 FE FF ................
007059D0 75 12 85 C9 7D 0E 8B D1 F7 DA 3B CA 75 06 B8 01 u...}.....;.u...
007059E0 00 00 00 C3 8B C1 99 F7 FE 8B D0 0F AF D6 2B CA ..............+.
007059F0 74 0B 8B D1 33 D6 7D 05 03 CE 83 E8 01 8B 54 24 t...3.}.......T$
00705A00 04 89 02 8B 44 24 08 89 08 33 C0 C3 CC CC CC CC ....D$...3......
00705A10 51 55 8B 6C 24 0C 8B 45 04 3D E8 E7 A1 00 74 21 QU.l$..E.=....t!
00705A20 68 E8 E7 A1 00 50 E8 45 FC FC FF 83 C4 08 85 C0 h....P.E........
00705A30 75 0F 83 05 80 64 A1 00 01 B8 80 64 A1 00 5D 59 u....d.....d..]Y
00705A40 C3 53 8B 5D 08 57 8B 7C 24 18 8B 47 04 3D E8 E7 .S.].W.|$..G.=..
00705A50 A1 00 74 23 68 E8 E7 A1 00 50 E8 11 FC FC FF 83 ..t#h....P......
00705A60 C4 08 85 C0 75 11 83 05 80 64 A1 00 01 5F 5B B8 ....u....d..._[.
00705A70 80 64 A1 00 5D 59 C3 56 8B 77 08 8D 44 24 10 50 .d..]Y.V.w..D$.P
00705A80 8D 4C 24 1C 51 8B CB E8 24 FF FF FF 83 C4 08 83 .L$.Q...$.......
00705A90 E8 00 5E 74 21 83 E8 01 74 07 5F 5B 33 C0 5D 59 ..^t!...t._[3.]Y
00705AA0 C3 8B 15 30 F4 A1 00 8B 42 0C 57 55 FF D0 83 C4 ...0....B.WU....
00705AB0 08 5F 5B 5D 59 C3 8B 4C 24 14 51 E8 E0 F5 FF FF ._[]Y..L$.Q.....
00705AC0 83 C4 04 5F 5B 5D 59 C3 CC CC CC CC CC CC CC CC ..._[]Y.........
00705AD0 51 55 8B 6C 24 0C 8B 45 04 3D E8 E7 A1 00 74 21 QU.l$..E.=....t!
00705AE0 68 E8 E7 A1 00 50 E8 85 FB FC FF 83 C4 08 85 C0 h....P..........
00705AF0 75 0F 83 05 80 64 A1 00 01 B8 80 64 A1 00 5D 59 u....d.....d..]Y
00705B00 C3 53 8B 5D 08 57 8B 7C 24 18 8B 47 04 3D E8 E7 .S.].W.|$..G.=..
00705B10 A1 00 74 23 68 E8 E7 A1 00 50 E8 51 FB FC FF 83 ..t#h....P.Q....
00705B20 C4 08 85 C0 75 11 83 05 80 64 A1 00 01 5F 5B B8 ....u....d..._[.
00705B30 80 64 A1 00 5D 59 C3 83 3D 04 4B A7 00 00 56 8B .d..]Y..=.K...V.
00705B40 77 08 74 19 A1 34 8A A1 00 6A 01 68 C4 75 8D 00 w.t..4...j.h.u..
00705B50 50 E8 1A BE FD FF 83 C4 0C 85 C0 7C 1E 8D 4C 24 P..........|..L$
00705B60 10 51 8D 54 24 1C 52 8B CB E8 42 FE FF FF 83 C4 .Q.T$.R...B.....
00705B70 08 83 E8 00 74 22 83 E8 01 74 08 5E 5F 5B 33 C0 ....t"...t.^_[3.
00705B80 5D 59 C3 A1 30 F4 A1 00 8B 48 0C 57 55 FF D1 83 ]Y..0....H.WU...
00705B90 C4 08 5E 5F 5B 5D 59 C3 8B 54 24 18 52 E8 FE F4 ..^_[]Y..T$.R...
00705BA0 FF FF 83 C4 04 5E 5F 5B 5D 59 C3 CC CC CC CC CC .....^_[]Y......
00705BB0 56 57 8B 7C 24 0C 8B 47 04 3D E8 E7 A1 00 74 12 VW.|$..G.=....t.
00705BC0 68 E8 E7 A1 00 50 E8 A5 FA FC FF 83 C4 08 85 C0 h....P..........
00705BD0 74 20 8B 74 24 10 8B 46 04 3D E8 E7 A1 00 74 21 t .t$..F.=....t!
00705BE0 68 E8 E7 A1 00 50 E8 85 FA FC FF 83 C4 08 85 C0 h....P..........
00705BF0 75 0F 83 05 80 64 A1 00 01 5F B8 80 64 A1 00 5E u....d..._..d..^
00705C00 C3 A1 E8 E4 A1 00 8B 88 8C 00 00 00 56 57 FF D1 ............VW..
00705C10 83 C4 08 5F 5E C3 CC CC CC CC CC CC CC CC CC CC ..._^...........
00705C20 51 55 8B 6C 24 0C 8B 45 04 3D E8 E7 A1 00 74 21 QU.l$..E.=....t!
00705C30 68 E8 E7 A1 00 50 E8 35 FA FC FF 83 C4 08 85 C0 h....P.5........
00705C40 75 0F 83 05 80 64 A1 00 01 B8 80 64 A1 00 5D 59 u....d.....d..]Y
00705C50 C3 53 8B 5D 08 57 8B 7C 24 18 8B 47 04 3D E8 E7 .S.].W.|$..G.=..
00705C60 A1 00 74 23 68 E8 E7 A1 00 50 E8 01 FA FC FF 83 ..t#h....P......
00705C70 C4 08 85 C0 75 11 83 05 80 64 A1 00 01 5F 5B B8 ....u....d..._[.
00705C80 80 64 A1 00 5D 59 C3 56 8B 77 08 8D 44 24 18 50 .d..]Y.V.w..D$.P
00705C90 8D 4C 24 14 51 8B CB E8 14 FD FF FF 83 C4 08 83 .L$.Q...........
00705CA0 E8 00 5E 74 21 83 E8 01 74 07 5F 5B 33 C0 5D 59 ..^t!...t._[3.]Y
00705CB0 C3 8B 15 30 F4 A1 00 8B 42 10 57 55 FF D0 83 C4 ...0....B.WU....
00705CC0 08 5F 5B 5D 59 C3 8B 4C 24 14 51 E8 D0 F3 FF FF ._[]Y..L$.Q.....
00705CD0 83 C4 04 5F 5B 5D 59 C3 CC CC CC CC CC CC CC CC ..._[]Y.........
00705CE0 51 55 8B 6C 24 0C 8B 45 04 3D E8 E7 A1 00 74 21 QU.l$..E.=....t!
00705CF0 68 E8 E7 A1 00 50 E8 75 F9 FC FF 83 C4 08 85 C0 h....P.u........
00705D00 75 0F 83 05 80 64 A1 00 01 B8 80 64 A1 00 5D 59 u....d.....d..]Y
00705D10 C3 53 8B 5D 08 57 8B 7C 24 18 8B 47 04 3D E8 E7 .S.].W.|$..G.=..
00705D20 A1 00 74 23 68 E8 E7 A1 00 50 E8 41 F9 FC FF 83 ..t#h....P.A....
00705D30 C4 08 85 C0 75 11 83 05 80 64 A1 00 01 5F 5B B8 ....u....d..._[.
00705D40 80 64 A1 00 5D 59 C3 56 8B 77 08 8D 44 24 18 50 .d..]Y.V.w..D$.P
00705D50 8D 4C 24 14 51 8B CB E8 54 FC FF FF 83 C4 08 83 .L$.Q...T.......
00705D60 E8 00 5E 74 21 83 E8 01 74 07 5F 5B 33 C0 5D 59 ..^t!...t._[3.]Y
00705D70 C3 8B 15 30 F4 A1 00 8B 42 14 57 55 FF D0 83 C4 ...0....B.WU....
00705D80 08 5F 5B 5D 59 C3 8B 4C 24 14 8B 54 24 0C 51 52 ._[]Y..L$..T$.QR
00705D90 68 DC 75 8D 00 E8 66 44 FE FF 83 C4 0C 5F 5B 5D h.u...fD....._[]
00705DA0 59 C3 CC CC CC CC CC CC CC CC CC CC CC CC CC CC Y...............
00705DB0 83 EC 08 56 57 8B 7C 24 14 8B 47 04 33 F6 3D E8 ...VW.|$..G.3.=.
00705DC0 E7 A1 00 74 24 68 E8 E7 A1 00 50 E8 A0 F8 FC FF ...t$h....P.....
00705DD0 83 C4 08 85 C0 75 12 83 05 80 64 A1 00 01 5F B8 .....u....d..._.
00705DE0 80 64 A1 00 5E 83 C4 08 C3 8B 47 08 55 8B 6C 24 .d..^.....G.U.l$
00705DF0 1C 89 44 24 0C 8B 45 04 3D E8 E7 A1 00 74 25 68 ..D$..E.=....t%h
00705E00 E8 E7 A1 00 50 E8 66 F8 FC FF 83 C4 08 85 C0 75 ....P.f........u
00705E10 13 83 05 80 64 A1 00 01 5D 5F B8 80 64 A1 00 5E ....d...]_..d..^
00705E20 83 C4 08 C3 53 8B 5D 08 85 DB 7D 42 8B 44 24 24 ....S.]...}B.D$$
00705E30 3D B8 63 A1 00 74 1E 8B 0D 7C 6B A1 00 68 08 76 =.c..t...|k..h.v
00705E40 8D 00 51 E8 38 B1 FD FF 83 C4 08 5B 5D 5F 33 C0 ..Q.8......[]_3.
00705E50 5E 83 C4 08 C3 8B 15 E8 E4 A1 00 50 8B 42 18 55 ^..........P.B.U
00705E60 57 FF D0 83 C4 0C 5B 5D 5F 5E 83 C4 08 C3 8B 7C W.....[]_^.....|
00705E70 24 24 81 FF B8 63 A1 00 74 55 8B 47 04 3D E8 E7 $$...c..tU.G.=..
00705E80 A1 00 74 26 68 E8 E7 A1 00 50 E8 E1 F7 FC FF 83 ..t&h....P......
00705E90 C4 08 85 C0 75 14 83 05 80 64 A1 00 01 5B 5D 5F ....u....d...[]_
00705EA0 B8 80 64 A1 00 5E 83 C4 08 C3 8B 77 08 85 F6 75 ..d..^.....w...u
00705EB0 1E 8B 0D 2C 7E A1 00 68 E4 75 8D 00 51 E8 BE B0 ...,~..h.u..Q...
00705EC0 FD FF 83 C4 08 5B 5D 5F 33 C0 5E 83 C4 08 C3 85 .....[]_3.^.....
00705ED0 DB 8B 7C 24 10 B9 01 00 00 00 7E 49 8D 64 24 00 ..|$......~I.d$.
00705EE0 F6 C3 01 8B E9 74 10 0F AF CF 85 FF 74 37 8B C1 .....t......t7..
00705EF0 99 F7 FF 3B C5 75 60 D1 FB 74 2A 8B EF 8B D7 0F ...;.u`..t*.....
00705F00 AF FA 85 ED 74 09 8B C7 99 F7 FD 3B C5 75 59 85 ....t......;.uY.
00705F10 F6 74 0E 8B C1 99 F7 FE 8B C7 8B CA 99 F7 FE 8B .t..............
00705F20 FA 85 DB 7F BB 85 F6 74 55 8D 54 24 10 52 8D 44 .......tU.T$.R.D
00705F30 24 18 50 E8 78 FA FF FF 83 C4 08 83 E8 00 74 3A $.P.x.........t:
00705F40 83 E8 01 75 80 5B 5D 5F 5E 83 C4 08 8B 0D 30 F4 ...u.[]_^.....0.
00705F50 A1 00 8B 51 18 FF E2 5B 5D 5F 5E 83 C4 08 A1 30 ...Q...[]_^....0
00705F60 F4 A1 00 8B 48 18 FF E1 5B 5D 5F 5E 83 C4 08 8B ....H...[]_^....
00705F70 15 30 F4 A1 00 8B 42 18 FF E0 8B 4C 24 10 51 E8 .0....B....L$.Q.
00705F80 1C F1 FF FF 83 C4 04 5B 5D 5F 5E 83 C4 08 C3 CC .......[]_^.....
00705F90 8B 44 24 04 8B 40 08 85 C0 7D 3E 8B C8 F7 D9 3B .D$..@...}>....;
00705FA0 C1 75 36 56 50 E8 E6 A6 00 00 8B F0 83 C4 04 85 .u6VP...........
00705FB0 F6 74 22 57 56 E8 56 C9 FF FF 83 C4 04 83 06 FF .t"WV.V.........
00705FC0 8B F8 75 0C 8B 56 04 8B 42 18 56 FF D0 83 C4 04 ..u..V..B.V.....
00705FD0 8B C7 5F 5E C3 33 C0 5E C3 F7 D8 89 44 24 04 E9 .._^.3.^....D$..
00705FE0 BC F0 FF FF CC CC CC CC CC CC CC CC CC CC CC CC ................
00705FF0 8B 44 24 04 8B 48 08 85 C9 7C 16 81 78 04 E8 E7 .D$..H...|..x...
00706000 A1 00 75 04 83 00 01 C3 89 4C 24 04 E9 8F F0 FF ..u......L$.....
00706010 FF 89 44 24 04 E9 76 FF FF FF CC CC CC CC CC CC ..D$..v.........
00706020 8B 4C 24 04 33 C0 39 41 08 0F 95 C0 C3 CC CC CC .L$.3.9A........
00706030 8B 44 24 04 8B 48 08 F7 D1 89 4C 24 04 E9 5E F0 .D$..H....L$..^.
00706040 FF FF CC CC CC CC CC CC CC CC CC CC CC CC CC CC ................
00706050 56 8B 74 24 08 8B 46 04 3D E8 E7 A1 00 74 20 68 V.t$..F.=....t h
00706060 E8 E7 A1 00 50 E8 06 F6 FC FF 83 C4 08 85 C0 75 ....P..........u
00706070 0E 83 05 80 64 A1 00 01 B8 80 64 A1 00 5E C3 53 ....d.....d..^.S
00706080 8B 5C 24 10 8B 43 04 3D E8 E7 A1 00 57 8B 7E 08 .\$..C.=....W.~.
00706090 74 22 68 E8 E7 A1 00 50 E8 D3 F5 FC FF 83 C4 08 t"h....P........
007060A0 85 C0 75 10 83 05 80 64 A1 00 01 5F 5B B8 80 64 ..u....d..._[..d
007060B0 A1 00 5E C3 8B 4B 08 85 C9 7D 19 A1 2C 7E A1 00 ..^..K...}..,~..
007060C0 68 4C 76 8D 00 50 E8 B5 AE FD FF 83 C4 08 5F 5B hLv..P........_[
007060D0 33 C0 5E C3 85 FF 0F 84 10 01 00 00 85 C9 0F 84 3.^.............
007060E0 08 01 00 00 83 F9 20 7C 7B 8B 4E 08 51 E8 9E A5 ...... |{.N.Q...
007060F0 00 00 8B F0 83 C4 04 85 F6 0F 84 A6 00 00 00 8B ................
00706100 53 08 52 E8 88 A5 00 00 8B F8 83 C4 04 85 FF 75 S.R............u
00706110 1B 83 06 FF 0F 85 8B 00 00 00 8B 46 04 8B 48 18 ...........F..H.
00706120 56 FF D1 83 C4 04 5F 5B 33 C0 5E C3 57 56 E8 BD V....._[3.^.WV..
00706130 C0 FF FF 83 C4 08 83 06 FF 8B D8 75 0C 8B 56 04 ...........u..V.
00706140 8B 42 18 56 FF D0 83 C4 04 83 07 FF 0F 85 87 00 .B.V............
00706150 00 00 8B 4F 04 8B 51 18 57 FF D2 83 C4 04 5F 8B ...O..Q.W....._.
00706160 C3 5B 5E C3 8B C7 D3 E0 8B D0 D3 FA 3B FA 74 6F .[^.........;.to
00706170 8B 46 08 50 E8 17 A5 00 00 8B F0 83 C4 04 85 F6 .F.P............
00706180 74 23 8B 4B 08 51 E8 05 A5 00 00 8B F8 83 C4 04 t#.K.Q..........
00706190 85 FF 75 17 83 06 FF 75 0C 8B 56 04 8B 42 18 56 ..u....u..V..B.V
007061A0 FF D0 83 C4 04 5F 5B 33 C0 5E C3 57 56 E8 3E C0 ....._[3.^.WV.>.
007061B0 FF FF 83 C4 08 83 06 FF 8B D8 75 0C 8B 4E 04 8B ..........u..N..
007061C0 51 18 56 FF D2 83 C4 04 83 07 FF 75 0C 8B 47 04 Q.V........u..G.
007061D0 8B 48 18 57 FF D1 83 C4 04 5F 8B C3 5B 5E C3 50 .H.W....._..[^.P
007061E0 E8 BB EE FF FF 83 C4 04 5F 5B 5E C3 81 7E 04 E8 ........_[^..~..
007061F0 E7 A1 00 75 09 83 06 01 5F 5B 8B C6 5E C3 8B 56 ...u...._[..^..V
00706200 08 52 E8 99 EE FF FF 83 C4 04 5F 5B 5E C3 CC CC .R........_[^...
00706210 56 8B 74 24 08 8B 46 04 3D E8 E7 A1 00 74 20 68 V.t$..F.=....t h
00706220 E8 E7 A1 00 50 E8 46 F4 FC FF 83 C4 08 85 C0 75 ....P.F........u
00706230 0E 83 05 80 64 A1 00 01 B8 80 64 A1 00 5E C3 53 ....d.....d..^.S
00706240 8B 5C 24 10 8B 43 04 3D E8 E7 A1 00 57 8B 7E 08 .\$..C.=....W.~.
00706250 74 22 68 E8 E7 A1 00 50 E8 13 F4 FC FF 83 C4 08 t"h....P........
00706260 85 C0 75 10 83 05 80 64 A1 00 01 5F 5B B8 80 64 ..u....d..._[..d
00706270 A1 00 5E C3 8B 4B 08 85 C9 7D 19 A1 2C 7E A1 00 ..^..K...}..,~..
00706280 68 4C 76 8D 00 50 E8 F5 AC FD FF 83 C4 08 5F 5B hLv..P........_[
00706290 33 C0 5E C3 85 FF 74 31 85 C9 74 2D 83 F9 20 7C 3.^...t1..t-.. |
007062A0 19 33 C9 85 FF 0F 9D C1 83 E9 01 8B F9 57 E8 ED .3...........W..
007062B0 ED FF FF 83 C4 04 5F 5B 5E C3 D3 FF 57 E8 DE ED ......_[^...W...
007062C0 FF FF 83 C4 04 5F 5B 5E C3 81 7E 04 E8 E7 A1 00 ....._[^..~.....
007062D0 75 09 83 06 01 5F 5B 8B C6 5E C3 8B 56 08 52 E8 u...._[..^..V.R.
007062E0 BC ED FF FF 83 C4 04 5F 5B 5E C3 CC CC CC CC CC ......._[^......
007062F0 56 8B 74 24 08 8B 46 04 3D E8 E7 A1 00 74 20 68 V.t$..F.=....t h
00706300 E8 E7 A1 00 50 E8 66 F3 FC FF 83 C4 08 85 C0 75 ....P.f........u
00706310 0E 83 05 80 64 A1 00 01 B8 80 64 A1 00 5E C3 8B ....d.....d..^..
00706320 76 08 57 8B 7C 24 10 8B 47 04 3D E8 E7 A1 00 74 v.W.|$..G.=....t
00706330 21 68 E8 E7 A1 00 50 E8 34 F3 FC FF 83 C4 08 85 !h....P.4.......
00706340 C0 75 0F 83 05 80 64 A1 00 01 5F B8 80 64 A1 00 .u....d..._..d..
00706350 5E C3 8B 47 08 23 C6 50 E8 43 ED FF FF 83 C4 04 ^..G.#.P.C......
00706360 5F 5E C3 CC CC CC CC CC CC CC CC CC CC CC CC CC _^..............
00706370 56 8B 74 24 08 8B 46 04 3D E8 E7 A1 00 74 20 68 V.t$..F.=....t h
00706380 E8 E7 A1 00 50 E8 E6 F2 FC FF 83 C4 08 85 C0 75 ....P..........u
00706390 0E 83 05 80 64 A1 00 01 B8 80 64 A1 00 5E C3 8B ....d.....d..^..
007063A0 76 08 57 8B 7C 24 10 8B 47 04 3D E8 E7 A1 00 74 v.W.|$..G.=....t
007063B0 21 68 E8 E7 A1 00 50 E8 B4 F2 FC FF 83 C4 08 85 !h....P.........
007063C0 C0 75 0F 83 05 80 64 A1 00 01 5F B8 80 64 A1 00 .u....d..._..d..
007063D0 5E C3 8B 47 08 33 C6 50 E8 C3 EC FF FF 83 C4 04 ^..G.3.P........
007063E0 5F 5E C3 CC CC CC CC CC CC CC CC CC CC CC CC CC _^..............
007063F0 56 8B 74 24 08 8B 46 04 3D E8 E7 A1 00 74 20 68 V.t$..F.=....t h
00706400 E8 E7 A1 00 50 E8 66 F2 FC FF 83 C4 08 85 C0 75 ....P.f........u
00706410 0E 83 05 80 64 A1 00 01 B8 80 64 A1 00 5E C3 8B ....d.....d..^..
00706420 76 08 57 8B 7C 24 10 8B 47 04 3D E8 E7 A1 00 74 v.W.|$..G.=....t
00706430 21 68 E8 E7 A1 00 50 E8 34 F2 FC FF 83 C4 08 85 !h....P.4.......
00706440 C0 75 0F 83 05 80 64 A1 00 01 5F B8 80 64 A1 00 .u....d..._..d..
00706450 5E C3 8B 47 08 0B C6 50 E8 43 EC FF FF 83 C4 04 ^..G...P.C......
00706460 5F 5E C3 CC CC CC CC CC CC CC CC CC CC CC CC CC _^..............
00706470 56 8B 74 24 0C 8B 06 8B 40 04 3D E8 E7 A1 00 74 V.t$....@.=....t
00706480 19 68 E8 E7 A1 00 50 E8 E4 F1 FC FF 83 C4 08 85 .h....P.........
00706490 C0 75 07 B8 01 00 00 00 5E C3 8B 4C 24 08 8B 01 .u......^..L$...
007064A0 83 00 01 8B 06 83 00 01 33 C0 5E C3 CC CC CC CC ........3.^.....
007064B0 8B 44 24 04 81 78 04 E8 E7 A1 00 75 04 83 00 01 .D$..x.....u....
007064C0 C3 8B 40 08 89 44 24 04 E9 D3 EB FF FF CC CC CC ..@..D$.........
007064D0 8B 44 24 04 8B 48 08 89 4C 24 04 E9 B0 A1 00 00 .D$..H..L$......
007064E0 8B 44 24 04 DB 40 08 83 EC 08 DD 1C 24 E8 6E 8B .D$..@......$.n.
007064F0 FF FF 83 C4 08 C3 CC CC CC CC CC CC CC CC CC CC ................
00706500 83 EC 68 A1 88 41 A1 00 33 C4 89 44 24 64 8B 44 ..h..A..3..D$d.D
00706510 24 6C 8B 40 08 85 C0 7D 11 F7 D8 50 68 6C 76 8D $l.@...}...Phlv.
00706520 00 6A 64 8D 44 24 0C 50 EB 17 75 08 66 C7 04 24 .jd.D$.P..u.f..$
00706530 30 00 EB 15 50 68 64 76 8D 00 6A 64 8D 4C 24 0C 0...Phdv..jd.L$.
00706540 51 E8 9A EA 01 00 83 C4 10 8D 14 24 52 E8 6E 65 Q..........$R.ne
00706550 FE FF 8B 4C 24 68 83 C4 04 33 CC E8 2E E6 F8 FF ...L$h...3......
00706560 83 C4 68 C3 CC CC CC CC CC CC CC CC CC CC CC CC ..h.............
00706570 83 EC 68 A1 88 41 A1 00 33 C4 89 44 24 64 8B 44 ..h..A..3..D$d.D
00706580 24 6C 8B 40 08 85 C0 7D 11 F7 D8 50 68 7C 76 8D $l.@...}...Ph|v.
00706590 00 6A 64 8D 44 24 0C 50 EB 0D 50 68 74 76 8D 00 .jd.D$.P..Phtv..
007065A0 6A 64 8D 4C 24 0C 51 E8 34 EA 01 00 8D 54 24 10 jd.L$.Q.4....T$.
007065B0 83 C4 10 52 E8 07 65 FE FF 8B 4C 24 68 83 C4 04 ...R..e...L$h...
007065C0 33 CC E8 C7 E5 F8 FF 83 C4 68 C3 CC CC CC CC CC 3........h......
007065D0 83 EC 08 8B 44 24 0C 3D E8 E7 A1 00 56 BE 73 FC ....D$.=....V.s.
007065E0 FF FF C7 44 24 04 00 00 00 00 89 74 24 08 74 18 ...D$......t$.t.
007065F0 8B 4C 24 18 8B 54 24 14 51 52 50 E8 60 01 00 00 .L$..T$.QRP.`...
00706600 83 C4 0C 5E 83 C4 08 C3 8B 54 24 18 8D 44 24 08 ...^.....T$..D$.
00706610 50 8B 44 24 18 8D 4C 24 08 51 68 78 E5 A1 00 68 P.D$..L$.Qhx...h
00706620 B8 76 8D 00 52 50 E8 D5 14 FE FF 83 C4 18 85 C0 .v..RP..........
00706630 74 7D 8B 54 24 04 85 D2 75 0E 52 E8 60 EA FF FF t}.T$...u.R.`...
00706640 83 C4 04 5E 83 C4 08 C3 39 74 24 08 75 0E 52 E8 ...^....9t$.u.R.
00706650 7C C6 FF FF 83 C4 04 5E 83 C4 08 C3 81 7A 04 50 |......^.....z.P
00706660 B4 A1 00 74 73 8B 4A 04 68 50 B4 A1 00 51 E8 FD ...ts.J.hP...Q..
00706670 EF FC FF 83 C4 08 85 C0 75 5A 8B 44 24 04 81 78 ........uZ.D$..x
00706680 04 20 3B A2 00 74 33 8B 50 04 68 20 3B A2 00 52 . ;..t3.P.h ;..R
00706690 E8 DB EF FC FF 83 C4 08 85 C0 75 1A A1 7C 6B A1 ..........u..|k.
007066A0 00 68 84 76 8D 00 50 E8 D4 A8 FD FF 83 C4 08 33 .h.v..P........3
007066B0 C0 5E 83 C4 08 C3 8B 44 24 04 8B 4C 24 08 8B 50 .^.....D$..L$..P
007066C0 08 8B 40 0C 51 52 50 E8 94 EF FF FF 83 C4 0C 5E ..@.QRP........^
007066D0 83 C4 08 C3 8B 54 24 04 57 8D 7A 14 8B C7 8D 70 .....T$.W.z....p
007066E0 01 8A 08 83 C0 01 84 C9 75 F7 2B C6 52 8B F0 E8 ........u.+.R...
007066F0 0C 65 FE FF 83 C4 04 3B F0 74 49 8B 4C 24 08 51 .e.....;.tI.L$.Q
00706700 E8 AB 76 FD FF 8B F0 83 C4 04 85 F6 74 2E 8B 44 ..v.........t..D
00706710 24 0C 8B 0D 2C 7E A1 00 8D 56 14 52 50 68 48 75 $...,~...V.RPhHu
00706720 8D 00 51 E8 A8 AE FD FF 83 C4 10 83 06 FF 75 0C ..Q...........u.
00706730 8B 56 04 8B 42 18 56 FF D0 83 C4 04 5F 33 C0 5E .V..B.V....._3.^
00706740 83 C4 08 C3 8B 4C 24 0C 51 6A 00 57 E8 3F ED FF .....L$.Qj.W.?..
00706750 FF 83 C4 0C 5F 5E 83 C4 08 C3 CC CC CC CC CC CC ...._^..........
00706760 8B 44 24 0C 8B 4C 24 08 56 50 51 68 E8 E7 A1 00 .D$..L$.VPQh....
00706770 E8 5B FE FF FF 8B F0 83 C4 0C 85 F6 75 02 5E C3 .[..........u.^.
00706780 8B 46 04 3D E8 E7 A1 00 53 74 40 68 E8 E7 A1 00 .F.=....St@h....
00706790 50 E8 DA EE FC FF 83 C4 08 85 C0 75 2E 56 E8 4D P..........u.V.M
007067A0 A1 00 00 8B D8 83 C4 04 83 FB FF 75 21 E8 0E A8 ...........u!...
007067B0 FD FF 85 C0 74 18 01 1E 75 0C 8B 56 04 8B 42 18 ....t...u..V..B.
007067C0 56 FF D0 83 C4 04 5B 33 C0 5E C3 8B 5E 08 8B 44 V.....[3.^..^..D
007067D0 24 0C 8B 88 98 00 00 00 57 6A 00 50 FF D1 8B F8 $.......Wj.P....
007067E0 83 C4 08 85 FF 75 17 83 06 FF 75 0C 8B 56 04 8B .....u....u..V..
007067F0 42 18 56 FF D0 83 C4 04 5F 5B 33 C0 5E C3 89 5F B.V....._[3.^.._
00706800 08 83 06 FF 75 0C 8B 4E 04 8B 51 18 56 FF D2 83 ....u..N..Q.V...
00706810 C4 04 8B C7 5F 5B 5E C3 CC CC CC CC CC CC CC CC ...._[^.........
00706820 8B 44 24 04 8B 48 08 51 68 C0 76 8D 00 E8 CE 39 .D$..H.Qh.v....9
00706830 FE FF 83 C4 08 C3 CC CC CC CC CC CC CC CC CC CC ................
00706840 8B 0D 5C D1 A6 00 55 8B 2D BC 45 8A 00 56 57 BE ..\...U.-.E..VW.
00706850 FB FF FF FF 85 C9 75 59 68 DC 03 00 00 FF D5 83 ......uYh.......
00706860 C4 04 85 C0 75 07 E8 A5 A9 FD FF EB 38 8B 0D 58 ....u.......8..X
00706870 D1 A6 00 89 08 A3 58 D1 A6 00 83 C0 04 8D B8 CC ......X.........
00706880 03 00 00 8B CF 3B C8 76 13 8D A4 24 00 00 00 00 .....;.v...$....
00706890 8D 51 F4 89 51 04 8B CA 3B C8 77 F4 C7 41 04 00 .Q..Q...;.w..A..
007068A0 00 00 00 8B C7 85 C0 8B C8 89 0D 5C D1 A6 00 74 ...........\...t
007068B0 3B 8B C1 8D 51 04 8B 0A 89 70 08 C7 02 E8 E7 A1 ;...Q....p......
007068C0 00 C7 00 01 00 00 00 89 04 B5 54 CD A6 00 83 C6 ..........T.....
007068D0 01 81 FE 01 01 00 00 89 0D 5C D1 A6 00 0F 8C 71 .........\.....q
007068E0 FF FF FF 5F 5E B8 01 00 00 00 5D C3 5F 5E 33 C0 ..._^.....]._^3.
007068F0 5D C3 CC CC CC CC CC CC CC CC CC CC CC CC CC CC ]...............

;; fn00706900: 00706900
;;   Called from:
;;     006E89AD (in fn006E8910)
fn00706900 proc
	sub	esp,0Ch
	push	ebx
	push	ebp
	push	esi
	push	edi
	mov	esi,0A6CD40h
	mov	edi,105h

l00706911:
	mov	eax,[esi]
	xor	ebx,ebx
	cmp	eax,ebx
	jz	70692Eh

l00706919:
	add	dword ptr [eax],0FFh
	mov	eax,[esi]
	cmp	[eax],ebx
	jnz	70692Eh

l00706922:
	mov	ecx,[eax+4h]
	mov	edx,[ecx+18h]
	push	eax
	call	edx
	add	esp,4h

l0070692E:
	mov	[esi],ebx
	add	esi,4h
	sub	edi,1h
	jns	706911h

l00706938:
	mov	edx,[0A6D158h]
	cmp	edx,ebx
	mov	[esp+14h],ebx
	mov	[esp+18h],ebx
	mov	[esp+10h],ebx
	mov	[0A6D158h],ebx
	mov	[0A6D15Ch],ebx
	jz	706A70h

l0070695E:
	mov	edi,edi

l00706960:
	add	dword ptr [esp+14h],1h
	lea	eax,[edx+4h]
	xor	ebp,ebp
	mov	ecx,eax
	mov	esi,29h

l00706971:
	mov	edi,0A1E7E8h
	cmp	[ecx+4h],edi
	jnz	706983h

l0070697B:
	cmp	dword ptr [ecx],0h
	jz	706983h

l00706980:
	add	ebp,1h

l00706983:
	cmp	[ecx+10h],edi
	jnz	706991h

l00706988:
	cmp	dword ptr [ecx+0Ch],0h
	jz	706991h

l0070698E:
	add	ebp,1h

l00706991:
	add	ecx,18h
	sub	esi,1h
	jnz	706971h

l00706999:
	test	ebp,ebp
	mov	ebx,[edx]
	jz	706A53h

l007069A3:
	mov	ecx,[0A6D158h]
	mov	[edx],ecx
	mov	[0A6D158h],edx
	mov	edi,29h

l007069B6:
	mov	esi,0A1E7E8h
	cmp	[eax+4h],esi
	jnz	7069EEh

l007069C0:
	mov	edx,[eax]
	test	edx,edx
	jz	7069EEh

l007069C6:
	mov	ecx,[eax+8h]
	cmp	ecx,0FBh
	jl	7069FCh

l007069CE:
	cmp	ecx,101h
	jge	7069FCh

l007069D6:
	cmp	dword ptr [0A6CD54h+ecx*4],0h
	jnz	7069FCh

l007069E0:
	add	edx,1h
	mov	[eax],edx
	mov	[0A6CD54h+ecx*4],eax
	jmp	7069FCh

l007069EE:
	mov	edx,[0A6D15Ch]
	mov	[eax+4h],edx
	mov	[0A6D15Ch],eax

l007069FC:
	cmp	[eax+10h],esi
	jnz	706A33h

l00706A01:
	mov	esi,[eax+0Ch]
	test	esi,esi
	lea	edx,[eax+0Ch]
	jz	706A33h

l00706A0B:
	mov	ecx,[eax+14h]
	cmp	ecx,0FBh
	jl	706A45h

l00706A13:
	cmp	ecx,101h
	jge	706A45h

l00706A1B:
	cmp	dword ptr [0A6CD54h+ecx*4],0h
	jnz	706A45h

l00706A25:
	add	esi,1h
	mov	[edx],esi
	mov	[0A6CD54h+ecx*4],edx
	jmp	706A45h

l00706A33:
	mov	ecx,[0A6D15Ch]
	lea	edx,[eax+0Ch]
	mov	[eax+10h],ecx
	mov	[0A6D15Ch],edx

l00706A45:
	add	eax,18h
	sub	edi,1h
	jnz	7069B6h

l00706A51:
	jmp	706A62h

l00706A53:
	push	edx
	call	dword ptr [8A45D4h]
	add	esp,4h
	add	dword ptr [esp+18h],1h

l00706A62:
	add	[esp+10h],ebp
	test	ebx,ebx
	mov	edx,ebx
	jnz	706960h

l00706A70:
	cmp	dword ptr [0A74AF0h],0h
	jz	706B4Bh

l00706A7D:
	mov	edi,[8A46CCh]
	push	8D7718h
	call	edi
	mov	ebx,[8A45E0h]
	add	eax,40h
	push	eax
	call	ebx
	mov	esi,[esp+18h]
	add	esp,8h
	test	esi,esi
	jnz	706AB3h

l00706AA1:
	push	8A6DE8h
	call	edi
	add	eax,40h
	push	eax
	call	ebx
	add	esp,8h
	jmp	706AEEh

l00706AB3:
	mov	edx,[esp+14h]
	cmp	edx,1h
	mov	ecx,8A698Fh
	jz	706AC6h

l00706AC1:
	mov	ecx,8B22ACh

l00706AC6:
	cmp	esi,1h
	mov	eax,8A698Fh
	jz	706AD5h

l00706AD0:
	mov	eax,8B22ACh

l00706AD5:
	push	ecx
	push	edx
	sub	edx,[esp+20h]
	push	edx
	push	eax
	push	esi
	push	8D76ECh
	call	edi
	add	eax,40h
	push	eax
	call	ebx
	add	esp,1Ch

l00706AEE:
	cmp	dword ptr [0A74AF0h],1h
	jle	706B4Bh

l00706AF7:
	mov	eax,[0A6D158h]
	test	eax,eax
	mov	[esp+18h],eax
	jz	706B4Bh

l00706B04:
	mov	esi,[esp+18h]
	add	esi,4h
	mov	ebp,52h

l00706B10:
	cmp	dword ptr [esi+4h],0A1E7E8h
	jnz	706B35h

l00706B19:
	mov	eax,[esi]
	test	eax,eax
	jz	706B35h

l00706B1F:
	mov	ecx,[esi+8h]
	push	ecx
	push	eax
	push	esi
	push	8D76C4h
	call	edi
	add	eax,40h
	push	eax
	call	ebx
	add	esp,14h

l00706B35:
	add	esi,0Ch
	sub	ebp,1h
	jnz	706B10h

l00706B3D:
	mov	edx,[esp+18h]
	mov	eax,[edx]
	test	eax,eax
	mov	[esp+18h],eax
	jnz	706B04h

l00706B4B:
	pop	edi
	pop	esi
	pop	ebp
	pop	ebx
	add	esp,0Ch
	ret
00706B53          CC CC CC CC CC CC CC CC CC CC CC CC CC    .............
00706B60 83 3D 60 D2 A6 00 00 75 1F E8 32 8B 04 00 6A 01 .=`....u..2...j.
00706B70 50 A3 60 D2 A6 00 E8 C5 89 04 00 83 C4 08 E8 FD P.`.............
00706B80 8A 04 00 A3 64 D2 A6 00 C3 CC CC CC CC CC CC CC ....d...........
00706B90 A1 60 D2 A6 00 50 E8 D5 89 04 00 59 C3 CC CC CC .`...P.....Y....
00706BA0 56 8B 74 24 08 85 F6 75 0D 68 58 77 8D 00 E8 3D V.t$...u.hXw...=
00706BB0 1B FE FF 83 C4 04 A1 60 D2 A6 00 6A 01 50 E8 7D .......`...j.P.}
00706BC0 89 04 00 56 E8 E7 EC 00 00 83 C4 0C 85 C0 5E 74 ...V..........^t
00706BD0 0D C7 44 24 04 28 77 8D 00 E9 12 1B FE FF C3 CC ..D$.(w.........

;; fn00706BE0: 00706BE0
;;   Called from:
;;     006F5CAC (in fn006F5C60)
;;     0075575B (in fn007556D0)
;;     0075590C (in fn007558B0)
fn00706BE0 proc
	push	esi
	push	0h
	call	7158B0h
	mov	esi,eax
	add	esp,4h
	test	esi,esi
	jnz	706BFEh

l00706BF1:
	push	8D7784h
	call	6E86F0h
	add	esp,4h

l00706BFE:
	mov	eax,[0A6D260h]
	test	eax,eax
	jz	706C10h

l00706C07:
	push	eax
	call	74F570h
	add	esp,4h

l00706C10:
	mov	eax,esi
	pop	esi
	ret
00706C14             CC CC CC CC CC CC CC CC CC CC CC CC     ............

;; fn00706C20: 00706C20
;;   Called from:
;;     006F5CC1 (in fn006F5C60)
;;     0075574C (in fn007556D0)
;;     00755975 (in fn007558B0)
fn00706C20 proc
	push	ebx
	mov	ebx,[esp+8h]
	test	ebx,ebx
	jnz	706C36h

l00706C29:
	push	8D77A4h
	call	6E86F0h
	add	esp,4h

l00706C36:
	cmp	dword ptr [0A6D260h],0h
	jz	706C61h

l00706C3F:
	push	esi
	mov	esi,[8A46E4h]
	push	edi
	call	esi
	mov	edi,[eax]
	mov	eax,[0A6D260h]
	push	1h
	push	eax
	call	74F540h
	add	esp,8h
	call	esi
	mov	[eax],edi
	pop	edi
	pop	esi

l00706C61:
	push	ebx
	call	7158B0h
	add	esp,4h
	pop	ebx
	ret
00706C6C                                     CC CC CC CC             ....
00706C70 A1 74 D2 A6 00 85 C0 74 04 83 C8 FF C3 BA 01 00 .t.....t........
00706C80 00 00 89 15 74 D2 A6 00 8B 0D 6C D2 A6 00 8D 41 ....t.....l....A
00706C90 01 25 1F 00 00 80 56 79 05 48 83 C8 E0 40 8B 35 .%....Vy.H...@.5
00706CA0 68 D2 A6 00 3B C6 75 0F C7 05 74 D2 A6 00 00 00 h...;.u...t.....
00706CB0 00 00 83 C8 FF 5E C3 8B 74 24 08 89 34 CD 60 D1 .....^..t$..4.`.
00706CC0 A6 00 8B 74 24 0C 89 34 CD 64 D1 A6 00 A3 6C D2 ...t$..4.d....l.
00706CD0 A6 00 33 C0 A3 B4 E8 A1 00 89 15 70 D2 A6 00 A3 ..3........p....
00706CE0 74 D2 A6 00 5E C3 CC CC CC CC CC CC CC CC CC CC t...^...........

;; fn00706CF0: 00706CF0
;;   Called from:
;;     00708F5F (in fn00708DC0)
fn00706CF0 proc
	cmp	dword ptr [0A6D264h],0h
	jz	706D06h

l00706CF9:
	call	74F680h
	cmp	eax,[0A6D264h]
	jnz	706D77h

l00706D06:
	cmp	dword ptr [0A6D278h],0h
	jnz	706D77h

l00706D0F:
	mov	dword ptr [0A6D278h],1h
	mov	dword ptr [0A6D270h],0h
	mov	eax,[0A6D268h]
	mov	ecx,[0A6D26Ch]
	cmp	eax,ecx
	jz	706D6Dh

l00706D32:
	mov	ecx,[0A6D160h+eax*8]
	mov	edx,[0A6D164h+eax*8]
	add	eax,1h
	and	eax,8000001Fh
	jns	706D4Fh

l00706D4A:
	dec	eax
	or	eax,0E0h
	inc	eax

l00706D4F:
	push	edx
	mov	[0A6D268h],eax
	call	ecx
	add	esp,4h
	test	eax,eax
	jl	706D7Ah

l00706D5E:
	mov	eax,[0A6D268h]
	mov	edx,[0A6D26Ch]
	cmp	eax,edx
	jnz	706D32h

l00706D6D:
	mov	dword ptr [0A6D278h],0h

l00706D77:
	xor	eax,eax
	ret

l00706D7A:
	mov	dword ptr [0A6D278h],0h
	mov	dword ptr [0A6D270h],1h
	or	eax,0FFh
	ret
00706D92       CC CC CC CC CC CC CC CC CC CC CC CC CC CC   ..............

;; fn00706DA0: 00706DA0
;;   Called from:
;;     00704020 (in fn00704020)
;;     00704722 (in fn00704700)
fn00706DA0 proc
	mov	eax,[0A1E8A8h]
	ret
00706DA6                   CC CC CC CC CC CC CC CC CC CC       ..........
00706DB0 8B 44 24 04 A3 A8 E8 A1 00 A3 AC E8 A1 00 C3 CC .D$.............

;; fn00706DC0: 00706DC0
;;   Called from:
;;     006DF4E6 (in fn006DF4C0)
;;     00708E1B (in fn00708DC0)
fn00706DC0 proc
	push	esi
	mov	esi,[0A6D67Ch]
	call	6E8800h
	test	eax,eax
	jz	706DECh

l00706DD0:
	add	dword ptr [esi+0Ch],0FFh
	mov	eax,[0A188A8h]
	push	8D77ECh
	push	eax
	call	6E0F80h
	add	esp,8h
	or	eax,0FFh
	pop	esi
	ret

l00706DEC:
	mov	eax,[esi+0Ch]
	mov	ecx,[0A1E8A8h]
	cmp	eax,ecx
	jle	706E1Dh

l00706DF9:
	mov	ecx,[esp+8h]
	add	eax,0FFh
	push	ecx
	mov	[esi+0Ch],eax
	mov	edx,[0A175E0h]
	push	8D77C8h
	push	edx
	call	6E15D0h
	add	esp,0Ch
	or	eax,0FFh
	pop	esi
	ret

l00706E1D:
	mov	[0A1E8ACh],ecx
	xor	eax,eax
	pop	esi
	ret
00706E27                      CC CC CC CC CC CC CC CC CC        .........

;; fn00706E30: 00706E30
;;   Called from:
;;     0070B1AF (in fn00708DC0)
fn00706E30 proc
	mov	edx,[eax+8h]
	cmp	dword ptr [edx+2Ch],0h
	push	ebx
	push	ebp
	mov	ebp,[esp+0Ch]
	push	esi
	jnz	706E80h

l00706E40:
	cmp	dword ptr [eax+34h],0h
	jnz	706E54h

l00706E46:
	add	dword ptr [0A163B8h],1h
	mov	dword ptr [eax+34h],0A163B8h

l00706E54:
	mov	ecx,[eax+34h]
	add	dword ptr [ecx],1h
	mov	ecx,[eax+38h]
	test	ecx,ecx
	jz	706E64h

l00706E61:
	add	dword ptr [ecx],1h

l00706E64:
	mov	ecx,[eax+3Ch]
	test	ecx,ecx
	jz	706E6Eh

l00706E6B:
	add	dword ptr [ecx],1h

l00706E6E:
	mov	ecx,[eax+34h]
	mov	[edx+2Ch],ecx
	mov	ecx,[eax+38h]
	mov	[edx+30h],ecx
	mov	ecx,[eax+3Ch]
	mov	[edx+34h],ecx

l00706E80:
	mov	ecx,[eax+34h]
	mov	esi,[eax+38h]
	mov	ebx,[eax+3Ch]
	add	dword ptr [edi],1h
	test	ebp,ebp
	jz	706E94h

l00706E90:
	add	dword ptr [ebp+0h],1h

l00706E94:
	mov	edx,[esp+14h]
	test	edx,edx
	jz	706E9Fh

l00706E9C:
	add	dword ptr [edx],1h

l00706E9F:
	test	ecx,ecx
	mov	[eax+34h],edi
	mov	[eax+38h],ebp
	mov	[eax+3Ch],edx
	jz	706EBDh

l00706EAC:
	add	dword ptr [ecx],0FFh
	jnz	706EBDh

l00706EB1:
	mov	edx,[ecx+4h]
	mov	eax,[edx+18h]
	push	ecx
	call	eax
	add	esp,4h

l00706EBD:
	test	esi,esi
	jz	706ED2h

l00706EC1:
	add	dword ptr [esi],0FFh
	jnz	706ED2h

l00706EC6:
	mov	ecx,[esi+4h]
	mov	edx,[ecx+18h]
	push	esi
	call	edx
	add	esp,4h

l00706ED2:
	test	ebx,ebx
	jz	706EE7h

l00706ED6:
	add	dword ptr [ebx],0FFh
	jnz	706EE7h

l00706EDB:
	mov	eax,[ebx+4h]
	mov	ecx,[eax+18h]
	push	ebx
	call	ecx
	add	esp,4h

l00706EE7:
	push	edi
	push	8D54ACh
	call	715E50h
	push	ebp
	push	8D54A0h
	call	715E50h
	add	esp,10h
	pop	esi
	pop	ebp
	pop	ebx
	mov	dword ptr [esp+4h],8D5490h
	jmp	715E50h

;; fn00706F10: 00706F10
;;   Called from:
;;     0070B37D (in fn00708DC0)
fn00706F10 proc
	mov	edx,[eax+34h]
	push	ebx
	mov	ebx,[eax+3Ch]
	push	esi
	mov	esi,[eax+8h]
	mov	ecx,[esi+2Ch]
	push	edi
	mov	edi,[eax+38h]
	add	dword ptr [ecx],1h
	mov	ecx,[esi+30h]
	test	ecx,ecx
	jz	706F2Fh

l00706F2C:
	add	dword ptr [ecx],1h

l00706F2F:
	mov	ecx,[esi+34h]
	test	ecx,ecx
	jz	706F39h

l00706F36:
	add	dword ptr [ecx],1h

l00706F39:
	test	edx,edx
	mov	ecx,[esi+2Ch]
	mov	[eax+34h],ecx
	mov	ecx,[esi+30h]
	mov	[eax+38h],ecx
	mov	ecx,[esi+34h]
	mov	[eax+3Ch],ecx
	jz	706F60h

l00706F4F:
	add	dword ptr [edx],0FFh
	jnz	706F60h

l00706F54:
	mov	eax,[edx+4h]
	mov	ecx,[eax+18h]
	push	edx
	call	ecx
	add	esp,4h

l00706F60:
	test	edi,edi
	jz	706F75h

l00706F64:
	add	dword ptr [edi],0FFh
	jnz	706F75h

l00706F69:
	mov	edx,[edi+4h]
	mov	eax,[edx+18h]
	push	edi
	call	eax
	add	esp,4h

l00706F75:
	test	ebx,ebx
	jz	706F8Ah

l00706F79:
	add	dword ptr [ebx],0FFh
	jnz	706F8Ah

l00706F7E:
	mov	ecx,[ebx+4h]
	mov	edx,[ecx+18h]
	push	ebx
	call	edx
	add	esp,4h

l00706F8A:
	mov	eax,[esi+2Ch]
	push	eax
	push	8D54ACh
	call	715E50h
	mov	ecx,[esi+30h]
	push	ecx
	push	8D54A0h
	call	715E50h
	mov	edx,[esi+34h]
	push	edx
	push	8D5490h
	call	715E50h
	mov	eax,[esi+2Ch]
	mov	edi,[esi+30h]
	mov	ebx,[esi+34h]
	add	esp,18h
	mov	dword ptr [esi+2Ch],0h
	mov	dword ptr [esi+30h],0h
	mov	dword ptr [esi+34h],0h
	add	dword ptr [eax],0FFh
	jnz	706FE6h

l00706FDA:
	mov	ecx,[eax+4h]
	mov	edx,[ecx+18h]
	push	eax
	call	edx
	add	esp,4h

l00706FE6:
	test	edi,edi
	jz	706FFBh

l00706FEA:
	add	dword ptr [edi],0FFh
	jnz	706FFBh

l00706FEF:
	mov	eax,[edi+4h]
	mov	ecx,[eax+18h]
	push	edi
	call	ecx
	add	esp,4h

l00706FFB:
	test	ebx,ebx
	jz	707010h

l00706FFF:
	add	dword ptr [ebx],0FFh
	jnz	707010h

l00707004:
	mov	edx,[ebx+4h]
	mov	eax,[edx+18h]
	push	ebx
	call	eax
	add	esp,4h

l00707010:
	pop	edi
	pop	esi
	pop	ebx
	ret
00707014             CC CC CC CC CC CC CC CC CC CC CC CC     ............

;; fn00707020: 00707020
;;   Called from:
;;     0070A049 (in fn00708DC0)
fn00707020 proc
	cmp	dword ptr [esp+4h],0h
	mov	eax,[esp+0Ch]
	jnz	707073h

l0070702B:
	mov	eax,[0A6D67Ch]
	mov	ecx,[eax+34h]
	test	ecx,ecx
	jnz	70703Ch

l00707037:
	mov	ecx,0A163B8h

l0070703C:
	test	ecx,ecx
	mov	[esp+4h],ecx
	mov	edx,[eax+38h]
	mov	[esp+8h],edx
	mov	eax,[eax+3Ch]
	mov	[esp+0Ch],eax
	jz	707059h

l00707052:
	add	dword ptr [ecx],1h
	mov	eax,[esp+0Ch]

l00707059:
	mov	ecx,[esp+8h]
	test	ecx,ecx
	jz	707068h

l00707061:
	add	dword ptr [ecx],1h
	mov	eax,[esp+0Ch]

l00707068:
	test	eax,eax
	jz	707073h

l0070706C:
	add	dword ptr [eax],1h
	mov	eax,[esp+0Ch]

l00707073:
	cmp	eax,0A163B8h
	jnz	707108h

l0070707E:
	add	dword ptr [eax],0FFh
	mov	eax,[esp+0Ch]
	cmp	dword ptr [eax],0h
	jnz	707096h

l0070708A:
	mov	ecx,[eax+4h]
	mov	edx,[ecx+18h]
	push	eax
	call	edx
	add	esp,4h

l00707096:
	mov	dword ptr [esp+0Ch],0h

l0070709E:
	cmp	dword ptr [esp+8h],0h
	jnz	7070B4h

l007070A5:
	add	dword ptr [0A163B8h],1h
	mov	dword ptr [esp+8h],0A163B8h

l007070B4:
	mov	eax,[esp+4h]
	cmp	dword ptr [eax+4h],0A16588h
	jz	7070D6h

l007070C1:
	mov	ecx,[eax+4h]
	push	0A16588h
	push	ecx
	call	6D5670h
	add	esp,8h
	test	eax,eax
	jz	707125h

l007070D6:
	mov	edx,[esp+4h]
	push	edx
	call	6DFE20h
	add	esp,4h
	test	eax,eax
	jle	707125h

l007070E7:
	mov	eax,[esp+4h]
	mov	ecx,[eax+0Ch]
	mov	[esp+4h],ecx
	add	dword ptr [ecx],1h
	add	dword ptr [eax],0FFh
	jnz	7070B4h

l007070FA:
	mov	ecx,[eax+4h]
	mov	edx,[ecx+18h]
	push	eax
	call	edx
	add	esp,4h
	jmp	7070B4h

l00707108:
	test	eax,eax
	jz	70709Eh

l0070710C:
	cmp	dword ptr [eax+4h],0A25E40h
	jz	70709Eh

l00707115:
	mov	eax,[0A16B7Ch]
	push	8D78A4h
	push	eax
	jmp	7071F2h

l00707125:
	mov	ecx,[esp+4h]
	mov	eax,[ecx+4h]
	cmp	eax,0A1B450h
	jnz	707155h

l00707133:
	mov	eax,[0A18A34h]
	push	1h
	push	8D7878h
	push	eax
	call	6E1970h
	add	esp,0Ch
	test	eax,eax
	jnz	7071FAh

l00707150:
	jmp	7072B8h

l00707155:
	cmp	eax,0A1E968h
	jz	7072A1h

l00707160:
	cmp	eax,0A15380h
	jz	70717Fh

l00707167:
	mov	ecx,eax
	push	0A15380h
	push	ecx
	call	6D5670h
	add	esp,8h
	test	eax,eax
	jz	707197h

l0070717B:
	mov	ecx,[esp+4h]

l0070717F:
	mov	edx,[0A169F0h]
	push	edx
	push	ecx
	call	6D5670h
	add	esp,8h
	test	eax,eax
	jnz	7072A1h

l00707197:
	mov	eax,[esp+4h]
	cmp	dword ptr [eax+4h],0A1EB98h
	jz	7071DBh

l007071A4:
	mov	ecx,[0A169F0h]
	mov	edx,[eax+4h]
	push	ecx
	push	edx
	call	6D5670h
	add	esp,8h
	test	eax,eax
	jnz	7071DBh

l007071BB:
	mov	eax,[esp+4h]
	mov	ecx,[eax+4h]
	mov	edx,[ecx+0Ch]
	mov	eax,[0A16B7Ch]
	push	edx
	push	8D7830h
	push	eax
	call	6E15D0h
	add	esp,0Ch
	jmp	7071FAh

l007071DB:
	mov	eax,[esp+8h]
	cmp	eax,0A163B8h
	jz	707260h

l007071E6:
	mov	ecx,[0A16B7Ch]
	push	8D77FCh
	push	ecx

l007071F2:
	call	6E0F80h
	add	esp,8h

l007071FA:
	mov	eax,[esp+8h]
	test	eax,eax
	jz	70721Ah

l00707202:
	add	dword ptr [eax],0FFh
	mov	eax,[esp+8h]
	cmp	dword ptr [eax],0h
	jnz	70721Ah

l0070720E:
	mov	edx,[eax+4h]
	push	eax
	mov	eax,[edx+18h]
	call	eax
	add	esp,4h

l0070721A:
	mov	eax,[esp+4h]
	test	eax,eax
	jz	70723Ah

l00707222:
	add	dword ptr [eax],0FFh
	mov	eax,[esp+4h]
	cmp	dword ptr [eax],0h
	jnz	70723Ah

l0070722E:
	mov	ecx,[eax+4h]
	mov	edx,[ecx+18h]
	push	eax
	call	edx
	add	esp,4h

l0070723A:
	mov	eax,[esp+0Ch]
	test	eax,eax
	jz	70725Ah

l00707242:
	add	dword ptr [eax],0FFh
	mov	eax,[esp+0Ch]
	cmp	dword ptr [eax],0h
	jnz	70725Ah

l0070724E:
	mov	ecx,[eax+4h]
	mov	edx,[ecx+18h]
	push	eax
	call	edx
	add	esp,4h

l0070725A:
	mov	eax,2h
	ret

l00707260:
	add	dword ptr [eax],0FFh
	mov	eax,[esp+8h]
	cmp	dword ptr [eax],0h
	jnz	707278h

l0070726C:
	mov	ecx,[eax+4h]
	mov	edx,[ecx+18h]
	push	eax
	call	edx
	add	esp,4h

l00707278:
	mov	eax,[esp+4h]
	mov	[esp+8h],eax
	cmp	dword ptr [eax+4h],0A1EB98h
	jnz	707295h

l00707289:
	mov	eax,[eax+8h]
	mov	[esp+4h],eax
	add	dword ptr [eax],1h
	jmp	7072B8h

l00707295:
	mov	eax,[eax+4h]
	mov	[esp+4h],eax
	add	dword ptr [eax],1h
	jmp	7072B8h

l007072A1:
	lea	eax,[esp+0Ch]
	push	eax
	lea	ecx,[esp+0Ch]
	push	ecx
	lea	edx,[esp+0Ch]
	push	edx
	call	6E1BD0h
	add	esp,0Ch

l007072B8:
	mov	eax,[esp+0Ch]
	mov	ecx,[esp+8h]
	mov	edx,[esp+4h]
	push	eax
	push	ecx
	push	edx
	call	6E0E00h
	xor	eax,eax
	add	esp,0Ch
	cmp	[esp+0Ch],eax
	setnz	al
	lea	eax,[eax+eax+2h]
	ret
007072DD                                        CC CC CC              ...

;; fn007072E0: 007072E0
;;   Called from:
;;     0070AAB4 (in fn00708DC0)
fn007072E0 proc
	push	ebp
	push	esi
	push	edi
	push	eax
	mov	edi,ecx
	xor	esi,esi
	call	704B00h
	mov	ebp,eax
	add	esp,4h
	test	ebp,ebp
	jz	7073D6h

l007072FA:
	test	ebx,ebx
	jle	707319h

l007072FE:
	mov	edi,edi

l00707300:
	push	ebp
	call	704040h
	add	esp,4h
	test	eax,eax
	jz	70734Ah

l0070730D:
	sub	edi,4h
	add	esi,1h
	cmp	esi,ebx
	mov	[edi],eax
	jl	707300h

l00707319:
	push	ebp
	call	704040h
	add	esp,4h
	test	eax,eax
	jnz	70737Ah

l00707326:
	call	6E0FC0h
	test	eax,eax
	jnz	70739Eh

l0070732F:
	add	dword ptr [ebp+0h],0FFh
	jnz	707341h

l00707335:
	mov	edx,[ebp+4h]
	mov	eax,[edx+18h]
	push	ebp
	call	eax
	add	esp,4h

l00707341:
	pop	edi
	pop	esi
	mov	eax,1h
	pop	ebp
	ret

l0070734A:
	call	6E0FC0h
	test	eax,eax
	jnz	70739Eh

l00707353:
	cmp	esi,1h
	mov	eax,8A698Fh
	jz	707362h

l0070735D:
	mov	eax,8B22ACh

l00707362:
	mov	ecx,[0A17E2Ch]
	push	eax
	push	esi
	push	8D78ECh
	push	ecx
	call	6E15D0h
	add	esp,10h
	jmp	70739Eh

l0070737A:
	add	dword ptr [eax],0FFh
	jnz	70738Bh

l0070737F:
	mov	ecx,[eax+4h]
	mov	edx,[ecx+18h]
	push	eax
	call	edx
	add	esp,4h

l0070738B:
	mov	eax,[0A17E2Ch]
	push	8D78D0h
	push	eax
	call	6E0F80h
	add	esp,8h

l0070739E:
	test	esi,esi
	jle	7073C4h

l007073A2:
	mov	eax,[edi]
	add	dword ptr [eax],0FFh
	mov	eax,[edi]
	cmp	dword ptr [eax],0h
	jnz	7073BAh

l007073AE:
	mov	ecx,[eax+4h]
	mov	edx,[ecx+18h]
	push	eax
	call	edx
	add	esp,4h

l007073BA:
	sub	esi,1h
	add	edi,4h
	test	esi,esi
	jg	7073A2h

l007073C4:
	add	dword ptr [ebp+0h],0FFh
	jnz	7073D6h

l007073CA:
	mov	eax,[ebp+4h]
	mov	ecx,[eax+18h]
	push	ebp
	call	ecx
	add	esp,4h

l007073D6:
	pop	edi
	pop	esi
	xor	eax,eax
	pop	ebp
	ret
007073DC                                     CC CC CC CC             ....

;; fn007073E0: 007073E0
;;   Called from:
;;     00707464 (in fn00707430)
;;     007074A8 (in fn00707430)
;;     0070860F (in fn00708590)
;;     00708915 (in fn00708880)
;;     00708969 (in fn00708880)
;;     007089E2 (in fn00708880)
;;     00708A2E (in fn00708880)
;;     00708AB4 (in fn00708880)
;;     00708B01 (in fn00708880)
;;     0070B304 (in fn00708DC0)
;;     0070B349 (in fn00708DC0)
fn007073E0 proc
	push	esi
	mov	esi,[eax+38h]
	cmp	dword ptr [esi+10h],0h
	jz	7073EEh

l007073EA:
	xor	eax,eax
	pop	esi
	ret

l007073EE:
	push	ecx
	push	edx
	push	eax
	mov	eax,[esp+18h]
	push	eax
	mov	dword ptr [esi+10h],1h
	mov	dword ptr [esi+14h],0h
	call	dword ptr [esp+18h]
	add	esp,10h
	cmp	dword ptr [esi+1Ch],0h
	jnz	707422h

l00707411:
	cmp	dword ptr [esi+18h],0h
	jnz	707422h

l00707417:
	xor	ecx,ecx
	add	dword ptr [esi+10h],0FFh
	mov	[esi+14h],ecx
	pop	esi
	ret

l00707422:
	add	dword ptr [esi+10h],0FFh
	mov	ecx,1h
	mov	[esi+14h],ecx
	pop	esi
	ret

;; fn00707430: 00707430
;;   Called from:
;;     0070906E (in fn00708DC0)
fn00707430 proc
	mov	eax,[esi+3Ch]
	sub	esp,8h
	push	ebp
	mov	ebp,[esp+14h]
	push	edi
	xor	edi,edi
	cmp	eax,[ebx]
	jl	70747Dh

l00707442:
	mov	ecx,[esp+1Ch]
	cmp	eax,[ecx]
	jge	70747Dh

l0070744A:
	mov	edx,[esp+20h]
	cmp	eax,[edx]
	jg	7074C2h

l00707452:
	mov	eax,[esp+14h]
	push	ebp
	push	eax
	mov	ecx,0A163B8h
	mov	edx,2h
	mov	eax,esi
	call	7073E0h
	mov	ecx,[esi+3Ch]
	mov	edx,[esp+28h]
	add	esp,8h
	mov	edi,eax
	pop	edi
	mov	[edx],ecx
	pop	ebp
	add	esp,8h
	ret

l0070747D:
	mov	edx,[esi+10h]
	lea	ecx,[esp+8h]
	push	ecx
	push	eax
	push	edx
	call	7355A0h
	add	esp,0Ch
	test	eax,eax
	jl	7074B2h

l00707493:
	mov	[esi+40h],eax
	mov	eax,[esp+14h]
	push	ebp
	push	eax
	mov	ecx,0A163B8h
	mov	edx,2h
	mov	eax,esi
	call	7073E0h
	add	esp,8h
	mov	edi,eax

l007074B2:
	mov	ecx,[esp+8h]
	mov	edx,[esp+0Ch]
	mov	eax,[esp+1Ch]
	mov	[ebx],ecx
	mov	[eax],edx

l007074C2:
	mov	ecx,[esi+3Ch]
	mov	edx,[esp+20h]
	mov	eax,edi
	pop	edi
	mov	[edx],ecx
	pop	ebp
	add	esp,8h
	ret
007074D3          CC CC CC CC CC CC CC CC CC CC CC CC CC    .............
007074E0 56 8B 35 7C D6 A6 00 8B 46 20 57 8B 7C 24 10 85 V.5|....F W.|$..
007074F0 FF 74 03 83 07 01 33 C9 39 4E 1C C7 46 18 00 00 .t....3.9N..F...
00707500 00 00 0F 95 C1 85 C0 C7 46 20 00 00 00 00 89 4E ........F .....N
00707510 14 74 11 83 00 FF 75 0C 8B 50 04 50 8B 42 18 FF .t....u..P.P.B..
00707520 D0 83 C4 04 8B 44 24 0C 85 C0 89 46 18 89 7E 20 .....D$....F..~ 
00707530 75 0B 39 46 1C 75 06 5F 89 46 14 5E C3 B8 01 00 u.9F.u._.F.^....
00707540 00 00 5F 89 46 14 5E C3 CC CC CC CC CC CC CC CC .._.F.^.........
00707550 56 8B 35 7C D6 A6 00 8B 46 24 57 8B 7C 24 10 85 V.5|....F$W.|$..
00707560 FF 74 03 83 07 01 33 C9 39 4E 18 C7 46 1C 00 00 .t....3.9N..F...
00707570 00 00 0F 95 C1 85 C0 C7 46 24 00 00 00 00 89 4E ........F$.....N
00707580 14 74 11 83 00 FF 75 0C 8B 50 04 50 8B 42 18 FF .t....u..P.P.B..
00707590 D0 83 C4 04 8B 44 24 0C 85 C0 89 46 1C 89 7E 24 .....D$....F..~$
007075A0 75 0B 39 46 18 75 06 5F 89 46 14 5E C3 B8 01 00 u.9F.u._.F.^....
007075B0 00 00 5F 89 46 14 5E C3 CC CC CC CC CC CC CC CC .._.F.^.........

;; fn007075C0: 007075C0
;;   Called from:
;;     0072EC34 (in fn0072EC10)
fn007075C0 proc
	mov	eax,[0A6D67Ch]
	push	eax
	call	dword ptr [0A6D680h]
	add	esp,4h
	ret

;; fn007075D0: 007075D0
;;   Called from:
;;     00736F94 (in fn007367D0)
fn007075D0 proc
	mov	eax,[0A6D67Ch]
	push	eax
	call	dword ptr [0A6D680h]
	add	esp,4h
	test	eax,eax
	jnz	7075E4h

l007075E3:
	ret

l007075E4:
	mov	ecx,[eax+38h]
	mov	edx,[ecx+4h]
	mov	eax,[eax+14h]
	xor	ecx,ecx
	cmp	eax,[edx+10h]
	setnz	cl
	mov	eax,ecx
	ret
007075F8                         CC CC CC CC CC CC CC CC         ........

;; fn00707600: 00707600
;;   Called from:
;;     0070BF8F (in fn0070BCC0)
;;     0070C00B (in fn0070BCC0)
fn00707600 proc
	mov	eax,[0A6D67Ch]
	push	esi
	push	eax
	call	dword ptr [0A6D680h]
	mov	esi,[esp+0Ch]
	mov	ecx,[esi]
	mov	edx,eax
	xor	eax,eax
	add	esp,4h
	test	ecx,ecx
	setnz	al
	test	edx,edx
	jz	70763Ah

l00707623:
	mov	edx,[edx+10h]
	mov	edx,[edx+14h]
	and	edx,0E000h
	jz	70763Ah

l00707631:
	or	ecx,edx
	mov	eax,1h
	mov	[esi],ecx

l0070763A:
	pop	esi
	ret
0070763C                                     CC CC CC CC             ....

;; fn00707640: 00707640
;;   Called from:
;;     006E80EB (in fn006E8060)
;;     006E879E (in fn006E8730)
;;     006E8C6E (in fn006E8D90)
;;     006E8EE1 (in fn006E8D90)
fn00707640 proc
	push	esi
	push	8AC530h
	call	715DD0h
	mov	esi,eax
	add	esp,4h
	test	esi,esi
	jnz	707658h

l00707654:
	xor	eax,eax
	pop	esi
	ret

l00707658:
	push	0h
	push	esi
	call	731A20h
	add	esp,8h
	test	eax,eax
	jz	707654h

l00707667:
	push	esi
	push	8A6DE8h
	call	731D30h
	add	esp,8h
	pop	esi
	ret
00707677                      CC CC CC CC CC CC CC CC CC        .........

;; fn00707680: 00707680
;;   Called from:
;;     006E1CCF (in fn006E1BD0)
;;     006E8758 (in fn006E8730)
;;     006E8E5F (in fn006E8D90)
;;     007036FC (in fn007036F0)
;;     00709DCC (in fn00708DC0)
;;     0070A90B (in fn00708DC0)
;;     0072EC85 (in fn0072EC10)
;;     00731C0F (in fn00731B10)
;;     0074EC19 (in fn0074EB10)
;;     0074EDC8 (in fn0074ED80)
;;     0074EEE2 (in fn0074EE90)
fn00707680 proc
	push	esi
	mov	esi,[esp+0Ch]
	test	esi,esi
	jnz	70769Ah

l00707689:
	push	esi
	call	6DFD20h
	mov	esi,eax
	add	esp,4h
	test	esi,esi
	jnz	7076D0h

l00707698:
	pop	esi
	ret

l0070769A:
	mov	eax,[esi+4h]
	cmp	eax,0A16588h
	jz	7076CDh

l007076A4:
	push	0A16588h
	push	eax
	call	6D5670h
	add	esp,8h
	test	eax,eax
	jnz	7076CDh

l007076B6:
	mov	eax,[0A16B7Ch]
	push	8D7934h
	push	eax
	call	6E0F80h
	add	esp,8h
	xor	eax,eax
	pop	esi
	ret

l007076CD:
	add	dword ptr [esi],1h

l007076D0:
	push	edi
	mov	edi,[esp+14h]
	test	edi,edi
	jz	70771Fh

l007076D9:
	mov	eax,[edi+4h]
	cmp	eax,0A1D1B8h
	jz	70771Fh

l007076E3:
	push	0A1D1B8h
	push	eax
	call	6D5670h
	add	esp,8h
	test	eax,eax
	jnz	70771Fh

l007076F5:
	mov	ecx,[0A16B7Ch]
	push	8D7910h
	push	ecx
	call	6E0F80h
	add	esp,8h
	add	dword ptr [esi],0FFh
	jnz	70771Ah

l0070770E:
	mov	edx,[esi+4h]
	mov	eax,[edx+18h]
	push	esi
	call	eax
	add	esp,4h

l0070771A:
	pop	edi
	xor	eax,eax
	pop	esi
	ret

l0070771F:
	mov	ecx,[esp+0Ch]
	push	edi
	push	esi
	push	ecx
	call	703710h
	add	esp,0Ch
	add	dword ptr [esi],0FFh
	mov	edi,eax
	jnz	707741h

l00707735:
	mov	edx,[esi+4h]
	mov	eax,[edx+18h]
	push	esi
	call	eax
	add	esp,4h

l00707741:
	mov	eax,edi
	pop	edi
	pop	esi
	ret
00707746                   CC CC CC CC CC CC CC CC CC CC       ..........

;; fn00707750: 00707750
;;   Called from:
;;     00707A0B (in fn00707950)
;;     00707C1E (in fn00707BD0)
;;     00707CA2 (in fn00707BD0)
fn00707750 proc
	mov	eax,[esp+4h]
	mov	ecx,0A1ED20h
	cmp	[eax+4h],ecx
	jnz	707768h

l0070775E:
	mov	edi,edi

l00707760:
	mov	eax,[eax+8h]
	cmp	[eax+4h],ecx
	jz	707760h

l00707768:
	mov	ecx,[eax+4h]
	cmp	ecx,0A249B8h
	jnz	70777Fh

l00707773:
	mov	eax,[eax+1Ch]
	mov	[esp+4h],eax
	jmp	6ECC50h

l0070777F:
	cmp	ecx,0A1C698h
	jnz	70778Dh

l00707787:
	mov	ecx,[eax+8h]
	mov	eax,[ecx]
	ret

l0070778D:
	cmp	ecx,0A1E968h
	jnz	7077A1h

l00707795:
	mov	edx,[eax+10h]
	mov	[esp+4h],edx
	jmp	6ECC50h

l007077A1:
	cmp	ecx,0A1EB98h
	jnz	7077B8h

l007077A9:
	mov	eax,[eax+8h]
	mov	ecx,[eax+10h]
	mov	[esp+4h],ecx
	jmp	6ECC50h

l007077B8:
	mov	eax,[ecx+0Ch]
	ret
007077BC                                     CC CC CC CC             ....

;; fn007077C0: 007077C0
;;   Called from:
;;     00707A01 (in fn00707950)
;;     00707C14 (in fn00707BD0)
;;     00707C98 (in fn00707BD0)
fn007077C0 proc
	mov	eax,[esp+4h]
	mov	eax,[eax+4h]
	cmp	eax,0A1ED20h
	jnz	7077D4h

l007077CE:
	mov	eax,8CE83Ch
	ret

l007077D4:
	cmp	eax,0A249B8h
	jz	7077CEh

l007077DB:
	cmp	eax,0A1C698h
	jz	7077CEh

l007077E2:
	cmp	eax,0A1E968h
	jnz	7077EFh

l007077E9:
	mov	eax,8D7968h
	ret

l007077EF:
	cmp	eax,0A1EB98h
	mov	eax,8D795Ch
	jz	707800h

l007077FB:
	mov	eax,8D7954h

l00707800:
	ret
00707801    CC CC CC CC CC CC CC CC CC CC CC CC CC CC CC  ...............

;; fn00707810: 00707810
;;   Called from:
;;     00708A78 (in fn00708880)
fn00707810 proc
	test	byte ptr [esp+4h],4h
	mov	edx,[0A16B7Ch]
	push	eax
	mov	eax,[ecx+8h]
	mov	ecx,[eax]
	push	ecx
	jz	707833h

l00707824:
	push	8D79A8h
	push	edx
	call	6E15D0h
	add	esp,10h
	ret

l00707833:
	push	8D7978h
	push	edx
	call	6E15D0h
	add	esp,10h
	ret
00707842       CC CC CC CC CC CC CC CC CC CC CC CC CC CC   ..............

;; fn00707850: 00707850
;;   Called from:
;;     00708BA0 (in fn00708880)
fn00707850 proc
	mov	edx,[ecx+8h]
	push	ebx
	push	ebp
	push	esi
	mov	esi,[ecx+0Ch]
	push	edi
	mov	edi,eax
	mov	eax,[ecx+10h]
	xor	ebx,ebx
	xor	ebp,ebp
	test	eax,eax
	jnz	707905h

l0070786B:
	cmp	[edx+8h],edi
	jnz	70790Bh

l00707874:
	cmp	[esp+1Ch],ebx
	jnz	70790Bh

l0070787E:
	cmp	dword ptr [edx+14h],43h
	jnz	70790Bh

l00707888:
	mov	ebx,[0A6D67Ch]
	push	ebp
	push	esi
	push	edx
	push	ebx
	call	73AFB0h
	mov	esi,eax
	add	esp,10h
	test	esi,esi
	jnz	7078A5h

l007078A0:
	pop	edi
	pop	esi
	pop	ebp
	pop	ebx
	ret

l007078A5:
	mov	edx,[esp+14h]
	lea	eax,[0000h+edi*4]
	mov	ecx,eax
	mov	eax,[edx]
	sub	eax,ecx
	xor	ecx,ecx
	test	edi,edi
	jle	7078D8h

l007078BC:
	lea	esp,[esp+0h]

l007078C0:
	mov	edx,[eax]
	add	dword ptr [edx],1h
	mov	edx,[eax]
	mov	[esi+ecx*4+138h],edx
	add	ecx,1h
	add	eax,4h
	cmp	ecx,edi
	jl	7078C0h

l007078D8:
	push	0h
	push	esi
	call	708DC0h
	add	dword ptr [ebx+0Ch],1h
	add	esp,8h
	add	dword ptr [esi],0FFh
	mov	edi,eax
	jnz	7078FAh

l007078EE:
	mov	eax,[esi+4h]
	mov	ecx,[eax+18h]
	push	esi
	call	ecx
	add	esp,4h

l007078FA:
	add	dword ptr [ebx+0Ch],0FFh
	mov	eax,edi
	pop	edi
	pop	esi
	pop	ebp
	pop	ebx
	ret

l00707905:
	mov	ebp,[eax+8h]
	lea	ebx,[eax+0Ch]

l0070790B:
	mov	ecx,[ecx+14h]
	mov	eax,[esp+14h]
	mov	eax,[eax]
	push	ecx
	mov	ecx,[esp+20h]
	push	ebp
	push	ebx
	push	ecx
	add	ecx,ecx
	add	ecx,ecx
	add	ecx,ecx
	mov	ebx,eax
	sub	ebx,ecx
	mov	ecx,[esp+28h]
	push	ebx
	push	ecx
	lea	ecx,[0000h+edi*4]
	sub	eax,ecx
	push	eax
	push	0h
	push	esi
	push	edx
	call	70B600h
	add	esp,28h
	pop	edi
	pop	esi
	pop	ebp
	pop	ebx
	ret
00707947                      CC CC CC CC CC CC CC CC CC        .........

;; fn00707950: 00707950
;;   Called from:
;;     00707B45 (in fn00707B30)
;;     00707CE8 (in fn00707BD0)
fn00707950 proc
	push	ecx
	push	ebp
	push	esi
	mov	esi,eax
	test	esi,esi
	jnz	707962h

l00707959:
	call	6FDCC0h
	mov	ebp,eax
	jmp	70797Eh

l00707962:
	push	esi
	call	6FDE60h
	add	esp,4h
	add	dword ptr [esi],0FFh
	mov	ebp,eax
	jnz	70797Eh

l00707972:
	mov	eax,[esi+4h]
	mov	ecx,[eax+18h]
	push	esi
	call	ecx
	add	esp,4h

l0070797E:
	test	ebp,ebp
	jnz	707988h

l00707982:
	pop	esi
	xor	eax,eax
	pop	ebp
	pop	ecx
	ret

l00707988:
	sub	dword ptr [esp+10h],1h
	push	edi
	js	7079EBh

l00707990:
	add	dword ptr [ebx],0FCh
	mov	eax,[ebx]
	mov	edi,[eax]
	add	eax,0FCh
	mov	[ebx],eax
	mov	esi,[eax]
	push	esi
	push	ebp
	call	6FBCC0h
	add	esp,8h
	test	eax,eax
	jnz	7079F2h

l007079AC:
	push	edi
	push	esi
	push	ebp
	call	6FBD90h
	add	esp,0Ch
	add	dword ptr [esi],0FFh
	mov	[esp+0Ch],eax
	jnz	7079CCh

l007079C0:
	mov	edx,[esi+4h]
	mov	eax,[edx+18h]
	push	esi
	call	eax
	add	esp,4h

l007079CC:
	add	dword ptr [edi],0FFh
	jnz	7079DDh

l007079D1:
	mov	ecx,[edi+4h]
	mov	edx,[ecx+18h]
	push	edi
	call	edx
	add	esp,4h

l007079DD:
	cmp	dword ptr [esp+0Ch],0h
	jnz	707A62h

l007079E4:
	sub	dword ptr [esp+14h],1h
	jns	707990h

l007079EB:
	pop	edi
	pop	esi
	mov	eax,ebp
	pop	ebp
	pop	ecx
	ret

l007079F2:
	push	esi
	call	6ECC50h
	mov	ecx,[esp+1Ch]
	add	esp,4h
	push	eax
	push	ecx
	call	7077C0h
	add	esp,4h
	push	eax
	push	ecx
	call	707750h
	add	esp,4h
	push	eax
	mov	eax,[0A16B7Ch]
	push	8D79D0h
	push	eax
	call	6E15D0h
	add	esp,14h
	add	dword ptr [esi],0FFh
	jnz	707A38h

l00707A2C:
	mov	ecx,[esi+4h]
	mov	edx,[ecx+18h]
	push	esi
	call	edx
	add	esp,4h

l00707A38:
	add	dword ptr [edi],0FFh
	jnz	707A49h

l00707A3D:
	mov	eax,[edi+4h]
	mov	ecx,[eax+18h]
	push	edi
	call	ecx
	add	esp,4h

l00707A49:
	add	dword ptr [ebp+0h],0FFh
	jnz	707A74h

l00707A4F:
	mov	edx,[ebp+4h]
	mov	eax,[edx+18h]
	push	ebp
	call	eax
	add	esp,4h
	pop	edi
	pop	esi
	xor	eax,eax
	pop	ebp
	pop	ecx
	ret

l00707A62:
	add	dword ptr [ebp+0h],0FFh
	jnz	707A74h

l00707A68:
	mov	ecx,[ebp+4h]
	mov	edx,[ecx+18h]
	push	ebp
	call	edx
	add	esp,4h

l00707A74:
	pop	edi
	pop	esi
	xor	eax,eax
	pop	ebp
	pop	ecx
	ret
00707A7B                                  CC CC CC CC CC            .....

;; fn00707A80: 00707A80
;;   Called from:
;;     00707CFE (in fn00707BD0)
fn00707A80 proc
	push	ebp
	mov	ebp,[esp+8h]
	push	esi
	mov	esi,eax
	lea	eax,[esi+ebp]
	push	eax
	call	6DFD20h
	add	esp,4h
	test	eax,eax
	jnz	707A9Bh

l00707A98:
	pop	esi
	pop	ebp
	ret

l00707A9B:
	test	ebp,ebp
	jle	707AC3h

l00707A9F:
	mov	edx,[esp+10h]
	push	ebx
	lea	ebx,[eax+esi*4+0Ch]
	add	edx,0Ch
	jmp	707AB0h
00707AAD                                        8D 49 00              .I.

l00707AB0:
	mov	ecx,[edx]
	add	dword ptr [ecx],1h
	mov	[ebx],ecx
	add	edx,4h
	add	ebx,4h
	sub	ebp,1h
	jnz	707AB0h

l00707AC2:
	pop	ebx

l00707AC3:
	sub	esi,1h
	js	707AE3h

l00707AC8:
	lea	ecx,[eax+esi*4+0Ch]
	lea	esp,[esp+0h]

l00707AD0:
	add	dword ptr [edi],0FCh
	mov	edx,[edi]
	mov	edx,[edx]
	mov	[ecx],edx
	sub	esi,1h
	sub	ecx,4h
	test	esi,esi
	jge	707AD0h

l00707AE3:
	pop	esi
	pop	ebp
	ret
00707AE6                   CC CC CC CC CC CC CC CC CC CC       ..........

;; fn00707AF0: 00707AF0
;;   Called from:
;;     00708A8D (in fn00708880)
fn00707AF0 proc
	push	edi
	mov	edi,eax
	push	edi
	call	6DFD20h
	add	esp,4h
	test	eax,eax
	jnz	707B02h

l00707B00:
	pop	edi
	ret

l00707B02:
	sub	edi,1h
	js	707B23h

l00707B07:
	lea	ecx,[eax+edi*4+0Ch]
	jmp	707B10h
00707B0D                                        8D 49 00              .I.

l00707B10:
	add	dword ptr [esi],0FCh
	mov	edx,[esi]
	mov	edx,[edx]
	mov	[ecx],edx
	sub	edi,1h
	sub	ecx,4h
	test	edi,edi
	jge	707B10h

l00707B23:
	pop	edi
	ret
00707B25                CC CC CC CC CC CC CC CC CC CC CC      ...........

;; fn00707B30: 00707B30
;;   Called from:
;;     00708BB2 (in fn00708880)
fn00707B30 proc
	push	ebx
	push	ebp
	push	edi
	xor	edi,edi
	xor	ebp,ebp
	test	eax,eax
	mov	ebx,ecx
	jle	707B53h

l00707B3D:
	mov	ecx,[esp+10h]
	push	ecx
	push	eax
	xor	eax,eax
	call	707950h
	mov	edi,eax
	add	esp,8h
	test	edi,edi
	jz	707BBFh

l00707B53:
	mov	edx,[esp+14h]
	push	esi
	push	edx
	call	6DFD20h
	mov	esi,eax
	add	esp,4h
	test	esi,esi
	jz	707BA9h

l00707B67:
	mov	eax,[esp+18h]
	add	eax,0FFh
	js	707B87h

l00707B70:
	lea	ecx,[esi+eax*4+0Ch]

l00707B74:
	add	dword ptr [ebx],0FCh
	mov	edx,[ebx]
	mov	edx,[edx]
	mov	[ecx],edx
	sub	eax,1h
	sub	ecx,4h
	test	eax,eax
	jge	707B74h

l00707B87:
	mov	eax,[esp+14h]
	push	edi
	push	esi
	push	eax
	call	703710h
	add	esp,0Ch
	add	dword ptr [esi],0FFh
	mov	ebp,eax
	jnz	707BA9h

l00707B9D:
	mov	ecx,[esi+4h]
	mov	edx,[ecx+18h]
	push	esi
	call	edx
	add	esp,4h

l00707BA9:
	test	edi,edi
	pop	esi
	jz	707BBFh

l00707BAE:
	add	dword ptr [edi],0FFh
	jnz	707BBFh

l00707BB3:
	mov	eax,[edi+4h]
	mov	ecx,[eax+18h]
	push	edi
	call	ecx
	add	esp,4h

l00707BBF:
	pop	edi
	mov	eax,ebp
	pop	ebp
	pop	ebx
	ret
00707BC5                CC CC CC CC CC CC CC CC CC CC CC      ...........

;; fn00707BD0: 00707BD0
;;   Called from:
;;     0070AD6D (in fn00708DC0)
fn00707BD0 proc
	push	ecx
	push	ebx
	push	ebp
	push	esi
	push	edi
	xor	ebp,ebp
	xor	edi,edi
	xor	esi,esi
	test	byte ptr [esp+1Ch],2h
	mov	ebx,eax
	mov	[esp+10h],ebp
	jz	707C3Fh

l00707BE8:
	add	dword ptr [ebx],0FCh
	mov	eax,[ebx]
	mov	esi,[eax]
	cmp	esi,ebp
	jz	707C0Fh

l00707BF3:
	mov	eax,[esi+4h]
	cmp	eax,0A1D1B8h
	jz	707C3Fh

l00707BFD:
	push	0A1D1B8h
	push	eax
	call	6D5670h
	add	esp,8h
	test	eax,eax
	jnz	707C3Fh

l00707C0F:
	mov	ecx,[esp+18h]
	push	ecx
	call	7077C0h
	add	esp,4h
	push	eax
	push	ecx
	call	707750h
	add	esp,4h
	push	eax
	mov	eax,[0A16B7Ch]
	push	8D7A38h
	push	eax
	call	6E15D0h
	add	esp,10h
	jmp	707D30h

l00707C3F:
	test	byte ptr [esp+1Ch],1h
	jz	707CD8h

l00707C4A:
	add	dword ptr [ebx],0FCh
	mov	eax,[ebx]
	mov	ebp,[eax]
	mov	eax,[ebp+4h]
	cmp	eax,0A16588h
	jz	707CD5h

l00707C5B:
	push	0A16588h
	push	eax
	call	6D5670h
	add	esp,8h
	test	eax,eax
	jnz	707CD5h

l00707C6D:
	push	ebp
	call	704BA0h
	mov	edi,eax
	add	esp,4h
	test	edi,edi
	jnz	707CC1h

l00707C7C:
	mov	ecx,[0A16B7Ch]
	push	ecx
	call	6E1110h
	add	esp,4h
	test	eax,eax
	jz	707D30h

l00707C93:
	mov	ecx,[esp+18h]
	push	ecx
	call	7077C0h
	add	esp,4h
	push	eax
	push	ecx
	call	707750h
	mov	edx,[0A16B7Ch]
	add	esp,4h
	push	eax
	push	8D7A0Ch
	push	edx
	call	6E15D0h
	add	esp,10h
	jmp	707D30h

l00707CC1:
	add	dword ptr [ebp+0h],0FFh
	jnz	707CD3h

l00707CC7:
	mov	eax,[ebp+4h]
	mov	ecx,[eax+18h]
	push	ebp
	call	ecx
	add	esp,4h

l00707CD3:
	mov	ebp,edi

l00707CD5:
	mov	edi,[ebp+8h]

l00707CD8:
	mov	eax,[esp+24h]
	test	eax,eax
	jle	707CF6h

l00707CE0:
	mov	edx,[esp+18h]
	push	edx
	push	eax
	mov	eax,esi
	call	707950h
	mov	esi,eax
	add	esp,8h
	test	esi,esi
	jz	707D45h

l00707CF6:
	mov	eax,[esp+20h]
	push	ebp
	push	edi
	mov	edi,ebx
	call	707A80h
	mov	edi,eax
	add	esp,8h
	test	edi,edi
	jz	707D30h

l00707D0C:
	mov	eax,[esp+18h]
	push	esi
	push	edi
	push	eax
	call	703710h
	add	esp,0Ch
	add	dword ptr [edi],0FFh
	mov	[esp+10h],eax
	jnz	707D30h

l00707D24:
	mov	ecx,[edi+4h]
	mov	edx,[ecx+18h]
	push	edi
	call	edx
	add	esp,4h

l00707D30:
	test	esi,esi
	jz	707D45h

l00707D34:
	add	dword ptr [esi],0FFh
	jnz	707D45h

l00707D39:
	mov	eax,[esi+4h]
	mov	ecx,[eax+18h]
	push	esi
	call	ecx
	add	esp,4h

l00707D45:
	test	ebp,ebp
	jz	707D5Bh

l00707D49:
	add	dword ptr [ebp+0h],0FFh
	jnz	707D5Bh

l00707D4F:
	mov	edx,[ebp+4h]
	mov	eax,[edx+18h]
	push	ebp
	call	eax
	add	esp,4h

l00707D5B:
	mov	eax,[esp+10h]
	pop	edi
	pop	esi
	pop	ebp
	pop	ebx
	pop	ecx
	ret
00707D65                CC CC CC CC CC CC CC CC CC CC CC      ...........

;; fn00707D70: 00707D70
;;   Called from:
;;     00707EF6 (in fn00707E00)
;;     00707F08 (in fn00707E00)
;;     0070806B (in fn00707F70)
;;     00708081 (in fn00707F70)
fn00707D70 proc
	push	esi
	mov	esi,[esp+8h]
	test	esi,esi
	jz	707DF0h

l00707D79:
	mov	eax,[esi+4h]
	cmp	eax,0A1E7E8h
	jz	707DE7h

l00707D83:
	push	0A1E7E8h
	push	eax
	call	6D5670h
	add	esp,8h
	test	eax,eax
	jnz	707DE7h

l00707D95:
	mov	ecx,[esi+4h]
	mov	eax,[ecx+30h]
	test	eax,eax
	jz	707DD0h

l00707D9F:
	test	dword ptr [ecx+54h],20000h
	jz	707DD0h

l00707DA8:
	cmp	dword ptr [eax+98h],0h
	jz	707DD0h

l00707DB1:
	push	0h
	push	esi
	call	702C30h
	mov	esi,eax
	add	esp,8h
	cmp	esi,0FFh
	jnz	707DEAh

l00707DC3:
	call	6E0FC0h
	test	eax,eax
	jz	707DEAh

l00707DCC:
	xor	eax,eax
	pop	esi
	ret

l00707DD0:
	mov	eax,[0A16B7Ch]
	push	8D7A68h
	push	eax
	call	6E0F80h
	add	esp,8h
	xor	eax,eax
	pop	esi
	ret

l00707DE7:
	mov	esi,[esi+8h]

l00707DEA:
	mov	ecx,[esp+0Ch]
	mov	[ecx],esi

l00707DF0:
	mov	eax,1h
	pop	esi
	ret
00707DF7                      CC CC CC CC CC CC CC CC CC        .........

;; fn00707E00: 00707E00
;;   Called from:
;;     00709B30 (in fn00708DC0)
fn00707E00 proc
	push	ecx
	push	ebp
	mov	ebp,[esp+0Ch]
	push	esi
	push	edi
	mov	edi,eax
	mov	eax,[ebp+4h]
	mov	eax,[eax+34h]
	test	eax,eax
	mov	esi,ecx
	jz	707F2Ch

l00707E1A:
	cmp	dword ptr [eax+10h],0h
	jz	707F2Ch

l00707E24:
	test	esi,esi
	jz	707E88h

l00707E28:
	mov	eax,[esi+4h]
	cmp	eax,0A1E7E8h
	jz	707E88h

l00707E32:
	push	0A1E7E8h
	push	eax
	call	6D5670h
	add	esp,8h
	test	eax,eax
	jnz	707E88h

l00707E44:
	mov	eax,[esi+4h]
	cmp	eax,0A1F400h
	jz	707E88h

l00707E4E:
	push	0A1F400h
	push	eax
	call	6D5670h
	add	esp,8h
	test	eax,eax
	jnz	707E88h

l00707E60:
	mov	eax,[esi+4h]
	mov	ecx,[eax+30h]
	test	ecx,ecx
	jz	707F2Ch

l00707E6E:
	test	dword ptr [eax+54h],20000h
	jz	707F2Ch

l00707E7B:
	cmp	dword ptr [ecx+98h],0h
	jz	707F2Ch

l00707E88:
	test	edi,edi
	jz	707EE0h

l00707E8C:
	mov	eax,[edi+4h]
	cmp	eax,0A1E7E8h
	jz	707EE0h

l00707E96:
	push	0A1E7E8h
	push	eax
	call	6D5670h
	add	esp,8h
	test	eax,eax
	jnz	707EE0h

l00707EA8:
	mov	eax,[edi+4h]
	cmp	eax,0A1F400h
	jz	707EE0h

l00707EB2:
	push	0A1F400h
	push	eax
	call	6D5670h
	add	esp,8h
	test	eax,eax
	jnz	707EE0h

l00707EC4:
	mov	eax,[edi+4h]
	mov	ecx,[eax+30h]
	test	ecx,ecx
	jz	707F2Ch

l00707ECE:
	test	dword ptr [eax+54h],20000h
	jz	707F2Ch

l00707ED7:
	cmp	dword ptr [ecx+98h],0h
	jz	707F2Ch

l00707EE0:
	lea	ecx,[esp+0Ch]
	push	ecx
	push	esi
	mov	dword ptr [esp+14h],0h
	mov	dword ptr [esp+1Ch],7FFFFFFFh
	call	707D70h
	add	esp,8h
	test	eax,eax
	jz	707F62h

l00707F02:
	lea	edx,[esp+14h]
	push	edx
	push	edi
	call	707D70h
	add	esp,8h
	test	eax,eax
	jz	707F62h

l00707F14:
	mov	eax,[esp+14h]
	mov	ecx,[esp+0Ch]
	push	eax
	push	ecx
	push	ebp
	call	703210h
	add	esp,0Ch
	pop	edi
	pop	esi
	pop	ebp
	pop	ecx
	ret

l00707F2C:
	push	0h
	push	edi
	push	esi
	call	72F1E0h
	mov	esi,eax
	add	esp,0Ch
	test	esi,esi
	jz	707F62h

l00707F3E:
	push	esi
	push	ebp
	call	704220h
	add	esp,8h
	add	dword ptr [esi],0FFh
	mov	edi,eax
	jnz	707F5Bh

l00707F4F:
	mov	edx,[esi+4h]
	mov	eax,[edx+18h]
	push	esi
	call	eax
	add	esp,4h

l00707F5B:
	mov	eax,edi
	pop	edi
	pop	esi
	pop	ebp
	pop	ecx
	ret

l00707F62:
	pop	edi
	pop	esi
	xor	eax,eax
	pop	ebp
	pop	ecx
	ret
00707F69                            CC CC CC CC CC CC CC          .......

;; fn00707F70: 00707F70
;;   Called from:
;;     00709BCE (in fn00708DC0)
;;     00709C76 (in fn00708DC0)
fn00707F70 proc
	sub	esp,8h
	push	esi
	push	edi
	mov	edi,eax
	mov	eax,[ebx+4h]
	mov	eax,[eax+34h]
	test	eax,eax
	mov	esi,ecx
	jz	7080CCh

l00707F87:
	cmp	dword ptr [eax+18h],0h
	jz	7080CCh

l00707F91:
	test	esi,esi
	jz	707FF5h

l00707F95:
	mov	eax,[esi+4h]
	cmp	eax,0A1E7E8h
	jz	707FF5h

l00707F9F:
	push	0A1E7E8h
	push	eax
	call	6D5670h
	add	esp,8h
	test	eax,eax
	jnz	707FF5h

l00707FB1:
	mov	eax,[esi+4h]
	cmp	eax,0A1F400h
	jz	707FF5h

l00707FBB:
	push	0A1F400h
	push	eax
	call	6D5670h
	add	esp,8h
	test	eax,eax
	jnz	707FF5h

l00707FCD:
	mov	eax,[esi+4h]
	mov	ecx,[eax+30h]
	test	ecx,ecx
	jz	7080CCh

l00707FDB:
	test	dword ptr [eax+54h],20000h
	jz	7080CCh

l00707FE8:
	cmp	dword ptr [ecx+98h],0h
	jz	7080CCh

l00707FF5:
	test	edi,edi
	jz	708055h

l00707FF9:
	mov	eax,[edi+4h]
	cmp	eax,0A1E7E8h
	jz	708055h

l00708003:
	push	0A1E7E8h
	push	eax
	call	6D5670h
	add	esp,8h
	test	eax,eax
	jnz	708055h

l00708015:
	mov	eax,[edi+4h]
	cmp	eax,0A1F400h
	jz	708055h

l0070801F:
	push	0A1F400h
	push	eax
	call	6D5670h
	add	esp,8h
	test	eax,eax
	jnz	708055h

l00708031:
	mov	eax,[edi+4h]
	mov	ecx,[eax+30h]
	test	ecx,ecx
	jz	7080CCh

l0070803F:
	test	dword ptr [eax+54h],20000h
	jz	7080CCh

l0070804C:
	cmp	dword ptr [ecx+98h],0h
	jz	7080CCh

l00708055:
	lea	ecx,[esp+0Ch]
	push	ecx
	push	esi
	mov	dword ptr [esp+14h],0h
	mov	dword ptr [esp+10h],7FFFFFFFh
	call	707D70h
	add	esp,8h
	test	eax,eax
	jz	708118h

l0070807B:
	lea	edx,[esp+8h]
	push	edx
	push	edi
	call	707D70h
	add	esp,8h
	test	eax,eax
	jz	708118h

l00708091:
	mov	eax,[esp+14h]
	test	eax,eax
	jnz	7080B2h

l00708099:
	mov	eax,[esp+8h]
	mov	ecx,[esp+0Ch]
	push	eax
	push	ecx
	push	ebx
	call	703520h
	add	esp,0Ch
	pop	edi
	pop	esi
	add	esp,8h
	ret

l007080B2:
	mov	edx,[esp+8h]
	push	eax
	mov	eax,[esp+10h]
	push	edx
	push	eax
	push	ebx
	call	703420h
	add	esp,10h
	pop	edi
	pop	esi
	add	esp,8h
	ret

l007080CC:
	push	0h
	push	edi
	push	esi
	call	72F1E0h
	mov	esi,eax
	add	esp,0Ch
	test	esi,esi
	jz	708118h

l007080DE:
	mov	eax,[esp+14h]
	test	eax,eax
	jz	7080F3h

l007080E6:
	push	eax
	push	esi
	push	ebx
	call	704300h
	add	esp,0Ch
	jmp	7080FDh

l007080F3:
	push	esi
	push	ebx
	call	704400h
	add	esp,8h

l007080FD:
	add	dword ptr [esi],0FFh
	mov	edi,eax
	jnz	708110h

l00708104:
	mov	ecx,[esi+4h]
	mov	edx,[ecx+18h]
	push	esi
	call	edx
	add	esp,4h

l00708110:
	mov	eax,edi
	pop	edi
	pop	esi
	add	esp,8h
	ret

l00708118:
	pop	edi
	or	eax,0FFh
	pop	esi
	add	esp,8h
	ret
00708121    CC CC CC CC CC CC CC CC CC CC CC CC CC CC CC  ...............

;; fn00708130: 00708130
;;   Called from:
;;     007092B7 (in fn00708DC0)
fn00708130 proc
	lea	edx,[esi-6h]
	cmp	edx,4h
	ja	70819Bh

l00708138:
	jmp	dword ptr [7081A8h+edx*4]

l0070813F:
	xor	edx,edx
	cmp	ecx,eax
	setz	dl
	mov	eax,edx
	jmp	708189h

l0070814A:
	xor	edx,edx
	cmp	ecx,eax
	setnz	dl
	mov	eax,edx
	jmp	708189h

l00708155:
	push	ecx
	push	eax
	call	704FE0h
	add	esp,8h
	test	eax,eax
	jge	70818Bh

l00708163:
	xor	eax,eax
	ret

l00708166:
	push	ecx
	push	eax
	call	704FE0h
	add	esp,8h
	test	eax,eax
	jl	708163h

l00708174:
	xor	ecx,ecx
	test	eax,eax
	setz	cl
	mov	eax,ecx
	jmp	708189h

l0070817F:
	push	eax
	push	ecx
	call	6E0FD0h
	add	esp,8h

l00708189:
	test	eax,eax

l0070818B:
	mov	eax,0A191E4h
	jnz	708197h

l00708192:
	mov	eax,0A191D8h

l00708197:
	add	dword ptr [eax],1h
	ret

l0070819B:
	push	esi
	push	eax
	push	ecx
	call	6DF4C0h
	add	esp,0Ch
	ret
007081A7                      90                                .       
l007081A8	dd	0x00708155
l007081AC	dd	0x00708166
l007081B0	dd	0x0070813F
l007081B4	dd	0x0070814A
l007081B8	dd	0x0070817F
007081BC                                     CC CC CC CC             ....

;; fn007081C0: 007081C0
;;   Called from:
;;     0070A9AE (in fn00708DC0)
fn007081C0 proc
	push	esi
	push	edi
	push	eax
	call	6DE330h
	mov	esi,eax
	add	esp,8h
	test	esi,esi
	jnz	708201h

l007081D1:
	mov	ecx,[0A178F0h]
	push	ecx
	call	6E1110h
	add	esp,4h
	test	eax,eax
	jz	7081FFh

l007081E4:
	push	edi
	call	6ECC50h
	mov	edx,[0A16F8Ch]
	push	eax
	push	8D7AACh
	push	edx
	call	6E15D0h
	add	esp,10h

l007081FF:
	mov	eax,esi

l00708201:
	pop	esi
	ret
00708203          CC CC CC CC CC CC CC CC CC CC CC CC CC    .............

;; fn00708210: 00708210
;;   Called from:
;;     0070A979 (in fn00708DC0)
fn00708210 proc
	sub	esp,8h
	push	ebx
	push	esi
	push	edi
	mov	edi,[esp+1Ch]
	push	8D5F08h
	push	edi
	call	6DF760h
	mov	ebx,eax
	add	esp,8h
	test	ebx,ebx
	mov	dword ptr [esp+0Ch],0h
	jnz	7082C5h

l0070823A:
	mov	eax,[0A178F0h]
	push	eax
	call	6E1110h
	add	esp,4h
	test	eax,eax
	jz	70828Ch

l0070824C:
	call	6E1160h
	push	8AC17Ch
	push	edi
	call	6DF760h
	mov	esi,eax
	add	esp,8h
	test	esi,esi
	jnz	708296h

l00708265:
	mov	ecx,[0A178F0h]
	push	ecx
	call	6E1110h
	add	esp,4h
	test	eax,eax
	jz	70828Ch

l00708278:
	mov	edx,[0A16F8Ch]
	push	8D7AC8h
	push	edx
	call	6E0F80h
	add	esp,8h

l0070828C:
	pop	edi
	pop	esi
	or	eax,0FFh
	pop	ebx
	add	esp,8h
	ret

l00708296:
	push	0h
	push	8B0A10h
	push	esi
	call	7038E0h
	add	esp,0Ch
	add	dword ptr [esi],0FFh
	mov	ebx,eax
	jnz	7082B9h

l007082AD:
	mov	eax,[esi+4h]
	mov	ecx,[eax+18h]
	push	esi
	call	ecx
	add	esp,4h

l007082B9:
	test	ebx,ebx
	jz	70828Ch

l007082BD:
	mov	dword ptr [esp+0Ch],1h

l007082C5:
	push	ebp
	xor	ebp,ebp
	push	ebp
	push	ebx
	mov	[esp+1Ch],ebp
	call	703180h
	mov	esi,eax
	add	esp,8h
	test	esi,esi
	jz	70839Fh

l007082E0:
	cmp	dword ptr [esp+10h],0h
	jz	70831Ch

l007082E7:
	mov	eax,[esi+4h]
	cmp	eax,0A1B450h
	jz	708303h

l007082F1:
	push	0A1B450h
	push	eax
	call	6D5670h
	add	esp,8h
	test	eax,eax
	jz	70831Ch

l00708303:
	cmp	byte ptr [esi+14h],5Fh
	jnz	70831Ch

l00708309:
	add	dword ptr [esi],0FFh
	jnz	708380h

l0070830E:
	mov	edx,[esi+4h]
	mov	eax,[edx+18h]
	push	esi
	call	eax
	add	esp,4h
	jmp	708380h

l0070831C:
	push	esi
	push	edi
	call	6DE330h
	mov	edi,eax
	add	esp,8h
	test	edi,edi
	jnz	708331h

l0070832C:
	or	ebp,0FFh
	jmp	708352h

l00708331:
	mov	eax,[esp+1Ch]
	cmp	dword ptr [eax+4h],0A1D1B8h
	push	edi
	push	esi
	push	eax
	jnz	708348h

l00708341:
	call	6FBD90h
	jmp	70834Dh

l00708348:
	call	704300h

l0070834D:
	mov	ebp,eax
	add	esp,0Ch

l00708352:
	add	dword ptr [esi],0FFh
	jnz	708363h

l00708357:
	mov	ecx,[esi+4h]
	mov	edx,[ecx+18h]
	push	esi
	call	edx
	add	esp,4h

l00708363:
	test	edi,edi
	jz	708378h

l00708367:
	add	dword ptr [edi],0FFh
	jnz	708378h

l0070836C:
	mov	eax,[edi+4h]
	mov	ecx,[eax+18h]
	push	edi
	call	ecx
	add	esp,4h

l00708378:
	test	ebp,ebp
	jnz	7083BCh

l0070837C:
	mov	edi,[esp+20h]

l00708380:
	mov	eax,[esp+14h]
	add	eax,1h
	push	eax
	push	ebx
	mov	[esp+1Ch],eax
	call	703180h
	mov	esi,eax
	add	esp,8h
	test	esi,esi
	jnz	7082E0h

l0070839F:
	mov	edx,[0A17CA4h]
	push	edx
	call	6E1110h
	add	esp,4h
	test	eax,eax
	jnz	7083B7h

l007083B2:
	or	ebp,0FFh
	jmp	7083BCh

l007083B7:
	call	6E1160h

l007083BC:
	add	dword ptr [ebx],0FFh
	jnz	7083CDh

l007083C1:
	mov	eax,[ebx+4h]
	mov	ecx,[eax+18h]
	push	ebx
	call	ecx
	add	esp,4h

l007083CD:
	mov	eax,ebp
	pop	ebp
	pop	edi
	pop	esi
	pop	ebx
	add	esp,8h
	ret
007083D7                      CC CC CC CC CC CC CC CC CC        .........

;; fn007083E0: 007083E0
;;   Called from:
;;     007094A1 (in fn00708DC0)
;;     0070A381 (in fn00708DC0)
;;     0070A6C7 (in fn00708DC0)
;;     0070A6E9 (in fn00708DC0)
fn007083E0 proc
	test	eax,eax
	jz	708404h

l007083E4:
	push	eax
	call	6ECC50h
	add	esp,4h
	test	eax,eax
	jz	708404h

l007083F1:
	mov	ecx,[esp+4h]
	push	eax
	mov	eax,[esp+0Ch]
	push	eax
	push	ecx
	call	6E15D0h
	add	esp,0Ch

l00708404:
	ret
00708405                CC CC CC CC CC CC CC CC CC CC CC      ...........

;; fn00708410: 00708410
;;   Called from:
;;     0070973C (in fn00708DC0)
fn00708410 proc
	push	ecx
	mov	eax,[esp+0Ch]
	mov	eax,[eax+8h]
	push	ebp
	push	esi
	mov	esi,[esp+10h]
	mov	ebp,[esi+8h]
	mov	[esp+8h],eax
	add	eax,ebp
	jns	708443h

l00708429:
	mov	ecx,[0A18598h]
	push	8D48B0h
	push	ecx
	call	6E0F80h
	add	esp,8h

l0070843D:
	pop	esi
	xor	eax,eax
	pop	ebp
	pop	ecx
	ret

l00708443:
	cmp	dword ptr [esi],2h
	jnz	70851Fh

l0070844C:
	movzx	eax,byte ptr [ecx]
	sub	eax,5Ah
	push	ebx
	push	edi
	jz	7084D1h

l00708456:
	sub	eax,23h
	jz	708497h

l0070845B:
	sub	eax,0Ch
	jnz	70851Dh

l00708464:
	movzx	eax,byte ptr [ecx+2h]
	mov	edi,[edx+10h]
	movzx	ecx,byte ptr [ecx+1h]
	shl	eax,8h
	add	eax,[edi+0Ch]
	add	eax,ecx
	mov	edx,[edx+eax*4+138h]
	cmp	[edx+8h],esi
	jnz	70851Dh

l00708487:
	push	0h
	push	edx
	call	750420h
	add	esp,8h
	jmp	708519h

l00708497:
	movzx	eax,byte ptr [ecx+2h]
	movzx	ecx,byte ptr [ecx+1h]
	shl	eax,8h
	add	eax,ecx
	mov	ecx,[edx+eax*4+138h]
	cmp	ecx,esi
	jnz	70851Dh

l007084AF:
	test	ecx,ecx
	mov	dword ptr [edx+eax*4+138h],0h
	jz	70851Dh

l007084BE:
	add	dword ptr [ecx],0FFh
	jnz	708519h

l007084C3:
	mov	edx,[ecx+4h]
	mov	eax,[edx+18h]
	push	ecx
	call	eax
	add	esp,4h
	jmp	708519h

l007084D1:
	movzx	eax,byte ptr [ecx+2h]
	movzx	ecx,byte ptr [ecx+1h]
	mov	edi,[edx+1Ch]
	shl	eax,8h
	add	eax,ecx
	cmp	dword ptr [edi+4h],0A1D1B8h
	mov	ecx,[edx+10h]
	mov	ecx,[ecx+20h]
	mov	ebx,[ecx+eax*4+0Ch]
	jnz	70851Dh

l007084F4:
	push	ebx
	push	edi
	call	6FBCC0h
	mov	esi,[esp+20h]
	add	esp,8h
	cmp	eax,esi
	jnz	70851Dh

l00708506:
	push	ebx
	push	edi
	call	6FBE60h
	add	esp,8h
	test	eax,eax
	jz	708519h

l00708514:
	call	6E1160h

l00708519:
	mov	esi,[esp+18h]

l0070851D:
	pop	edi
	pop	ebx

l0070851F:
	cmp	dword ptr [esi],1h
	jnz	708569h

l00708524:
	cmp	dword ptr [esi+10h],0h
	jnz	708569h

l0070852A:
	mov	esi,[esp+8h]
	lea	eax,[esi+ebp]
	push	eax
	lea	edx,[esp+14h]
	push	edx
	call	6EC4F0h
	add	esp,8h
	test	eax,eax
	jnz	70843Dh

l00708547:
	mov	eax,[esp+14h]
	mov	ecx,[esp+10h]
	push	esi
	add	eax,14h
	push	eax
	lea	edx,[ecx+ebp+14h]
	push	edx
	call	695030h
	mov	eax,[esp+1Ch]
	add	esp,0Ch
	pop	esi
	pop	ebp
	pop	ecx
	ret

l00708569:
	mov	eax,[esp+14h]
	push	eax
	lea	ecx,[esp+14h]
	push	ecx
	call	6EC440h
	mov	eax,[esp+18h]
	add	esp,8h
	pop	esi
	pop	ebp
	pop	ecx
	ret
00708583          CC CC CC CC CC CC CC CC CC CC CC CC CC    .............

;; fn00708590: 00708590
;;   Called from:
;;     0070B067 (in fn00708DC0)
fn00708590 proc
	sub	esp,0Ch
	lea	eax,[esp+8h]
	push	eax
	lea	ecx,[esp+4h]
	push	ecx
	lea	edx,[esp+0Ch]
	push	edx
	call	6E1130h
	mov	eax,[esp+0Ch]
	add	esp,0Ch
	test	eax,eax
	jnz	7085C1h

l007085B2:
	add	dword ptr [0A163B8h],1h
	mov	eax,0A163B8h
	mov	[esp],eax

l007085C1:
	mov	ecx,[esp+8h]
	mov	edx,[esp+4h]
	push	esi
	push	ecx
	push	eax
	push	edx
	push	3h
	call	6DFF80h
	mov	esi,eax
	add	esp,10h
	test	esi,esi
	jnz	7085F9h

l007085DD:
	mov	eax,[esp+0Ch]
	mov	ecx,[esp+4h]
	mov	edx,[esp+8h]
	push	eax
	push	ecx
	push	edx
	call	6E0E00h
	add	esp,0Ch
	pop	esi
	add	esp,0Ch
	ret

l007085F9:
	mov	eax,[esp+18h]
	mov	ecx,[esp+14h]
	push	edi
	push	eax
	mov	eax,[esp+24h]
	push	ecx
	mov	ecx,esi
	mov	edx,1h
	call	7073E0h
	add	esp,8h
	add	dword ptr [esi],0FFh
	mov	edi,eax
	jnz	70862Ah

l0070861E:
	mov	edx,[esi+4h]
	mov	eax,[edx+18h]
	push	esi
	call	eax
	add	esp,4h

l0070862A:
	mov	eax,[esp+0Ch]
	test	edi,edi
	pop	edi
	jnz	70864Bh

l00708633:
	mov	ecx,[esp+0Ch]
	mov	edx,[esp+4h]
	push	ecx
	push	edx
	push	eax
	call	6E0E00h
	add	esp,0Ch
	pop	esi
	add	esp,0Ch
	ret

l0070864B:
	test	eax,eax
	jz	708667h

l0070864F:
	add	dword ptr [eax],0FFh
	mov	eax,[esp+8h]
	cmp	dword ptr [eax],0h
	jnz	708667h

l0070865B:
	mov	ecx,[eax+4h]
	mov	edx,[ecx+18h]
	push	eax
	call	edx
	add	esp,4h

l00708667:
	mov	eax,[esp+4h]
	test	eax,eax
	jz	708687h

l0070866F:
	add	dword ptr [eax],0FFh
	mov	eax,[esp+4h]
	cmp	dword ptr [eax],0h
	jnz	708687h

l0070867B:
	mov	ecx,[eax+4h]
	mov	edx,[ecx+18h]
	push	eax
	call	edx
	add	esp,4h

l00708687:
	mov	eax,[esp+0Ch]
	test	eax,eax
	jz	7086A7h

l0070868F:
	add	dword ptr [eax],0FFh
	mov	eax,[esp+0Ch]
	cmp	dword ptr [eax],0h
	jnz	7086A7h

l0070869B:
	mov	ecx,[eax+4h]
	mov	edx,[ecx+18h]
	push	eax
	call	edx
	add	esp,4h

l007086A7:
	pop	esi
	add	esp,0Ch
	ret
007086AC                                     CC CC CC CC             ....

;; fn007086B0: 007086B0
;;   Called from:
;;     0070894D (in fn00708880)
;;     00708A15 (in fn00708880)
;;     00708AE8 (in fn00708880)
;;     00708E41 (in fn00708DC0)
;;     00708E65 (in fn00708DC0)
;;     0070B2AE (in fn00708DC0)
;;     0070B2DF (in fn00708DC0)
fn007086B0 proc
	sub	esp,0Ch
	push	esi
	lea	eax,[esp+0Ch]
	push	eax
	lea	ecx,[esp+0Ch]
	push	ecx
	lea	edx,[esp+0Ch]
	push	edx
	call	6E1130h
	mov	esi,[edi+38h]
	add	esp,0Ch
	cmp	dword ptr [esi+10h],0h
	jnz	708719h

l007086D4:
	mov	eax,[esp+20h]
	mov	ecx,[esp+1Ch]
	mov	edx,[esp+18h]
	push	eax
	push	ecx
	push	edi
	push	edx
	mov	dword ptr [esi+10h],1h
	mov	dword ptr [esi+14h],0h
	call	dword ptr [esp+24h]
	add	esp,10h
	cmp	dword ptr [esi+1Ch],0h
	jnz	708709h

l007086FF:
	cmp	dword ptr [esi+18h],0h
	jnz	708709h

l00708705:
	xor	ecx,ecx
	jmp	70870Eh

l00708709:
	mov	ecx,1h

l0070870E:
	add	dword ptr [esi+10h],0FFh
	test	eax,eax
	mov	[esi+14h],ecx
	jnz	708737h

l00708719:
	mov	eax,[esp+0Ch]
	mov	ecx,[esp+8h]
	mov	edx,[esp+4h]
	push	eax
	push	ecx
	push	edx
	call	6E0E00h
	add	esp,0Ch
	xor	eax,eax
	pop	esi
	add	esp,0Ch
	ret

l00708737:
	mov	eax,[esp+4h]
	test	eax,eax
	jz	708757h

l0070873F:
	add	dword ptr [eax],0FFh
	mov	eax,[esp+4h]
	cmp	dword ptr [eax],0h
	jnz	708757h

l0070874B:
	mov	ecx,[eax+4h]
	mov	edx,[ecx+18h]
	push	eax
	call	edx
	add	esp,4h

l00708757:
	mov	eax,[esp+8h]
	test	eax,eax
	jz	708777h

l0070875F:
	add	dword ptr [eax],0FFh
	mov	eax,[esp+8h]
	cmp	dword ptr [eax],0h
	jnz	708777h

l0070876B:
	mov	ecx,[eax+4h]
	mov	edx,[ecx+18h]
	push	eax
	call	edx
	add	esp,4h

l00708777:
	mov	eax,[esp+0Ch]
	test	eax,eax
	jz	708797h

l0070877F:
	add	dword ptr [eax],0FFh
	mov	eax,[esp+0Ch]
	cmp	dword ptr [eax],0h
	jnz	708797h

l0070878B:
	mov	ecx,[eax+4h]
	mov	edx,[ecx+18h]
	push	eax
	call	edx
	add	esp,4h

l00708797:
	or	eax,0FFh
	pop	esi
	add	esp,0Ch
	ret
0070879F                                              CC                .
007087A0 A1 7C D6 A6 00 53 56 57 50 FF 15 80 D6 A6 00 8B .|...SVWP.......
007087B0 70 38 8B 7E 10 8B 5E 14 83 C4 04 83 7E 1C 00 C7 p8.~..^.....~...
007087C0 46 10 00 00 00 00 75 0A 83 7E 18 00 75 04 33 C0 F.....u..~..u.3.
007087D0 EB 05 B8 01 00 00 00 8B 4C 24 10 89 46 14 8B 44 ........L$..F..D
007087E0 24 14 6A 00 50 51 E8 25 AF FF FF 83 C4 0C 89 7E $.j.PQ.%.......~
007087F0 10 5F 89 5E 14 5E 5B C3 CC CC CC CC CC CC CC CC ._.^.^[.........

;; fn00708800: 00708800
;;   Called from:
;;     006F64E5 (in fn006F6490)
fn00708800 proc
	mov	eax,[0A6D67Ch]
	push	eax
	call	dword ptr [0A6D680h]
	add	esp,4h
	test	eax,eax
	jnz	70881Fh

l00708813:
	mov	eax,[0A6D67Ch]
	mov	ecx,[eax+4h]
	mov	eax,[ecx+10h]
	ret

l0070881F:
	mov	eax,[eax+14h]
	ret
00708823          CC CC CC CC CC CC CC CC CC CC CC CC CC    .............
00708830 A1 7C D6 A6 00 56 50 FF 15 80 D6 A6 00 8B F0 83 .|...VP.........
00708840 C4 04 85 F6 75 02 5E C3 56 E8 82 2B 03 00 8B 46 ....u.^.V..+...F
00708850 1C 83 C4 04 5E C3 CC CC CC CC CC CC CC CC CC CC ....^...........

;; fn00708860: 00708860
;;   Called from:
;;     006F917C (in fn006F9120)
fn00708860 proc
	mov	eax,[0A6D67Ch]
	push	eax
	call	dword ptr [0A6D680h]
	add	esp,4h
	test	eax,eax
	jnz	708874h

l00708873:
	ret

l00708874:
	mov	eax,[eax+18h]
	ret
00708878                         CC CC CC CC CC CC CC CC         ........

;; fn00708880: 00708880
;;   Called from:
;;     0070ACC1 (in fn00708DC0)
fn00708880 proc
	sub	esp,0Ch
	push	ebx
	push	ebp
	push	esi
	mov	esi,eax
	movzx	ebp,ah
	mov	eax,[esp+1Ch]
	mov	edx,[eax]
	and	esi,0FFh
	lea	ecx,[esi+ebp*2]
	lea	eax,[0004h+ecx*4]
	sub	edx,eax
	push	edi
	mov	edi,[edx]
	mov	eax,[edi+4h]
	cmp	eax,0A1C698h
	mov	[esp+18h],ecx
	mov	[esp+14h],edx
	jnz	708B48h

l007088BC:
	test	ebp,ebp
	jnz	708B48h

l007088C4:
	mov	ecx,[edi+8h]
	mov	eax,[ecx+8h]
	test	al,0Ch
	mov	ebx,[0A6D67Ch]
	jz	708A87h

l007088D8:
	test	al,4h
	mov	ebp,[ecx+4h]
	mov	ecx,[edi+0Ch]
	mov	[esp+10h],ecx
	jz	7089A0h

l007088EA:
	test	esi,esi
	jnz	7089A0h

l007088F2:
	cmp	[ebx+14h],esi
	jz	708991h

l007088FB:
	mov	eax,[ebx+18h]
	test	eax,eax
	jz	708991h

l00708906:
	mov	ecx,[ebx+20h]
	push	ecx
	push	eax
	mov	eax,[ebx+8h]
	mov	ecx,edi
	mov	edx,4h
	call	7073E0h
	add	esp,8h
	test	eax,eax
	jnz	708BCDh

l00708925:
	mov	edx,[esp+10h]
	push	0h
	push	edx
	call	ebp
	mov	esi,eax
	mov	eax,[ebx+18h]
	add	esp,8h
	test	eax,eax
	jz	708BCDh

l0070893E:
	test	esi,esi
	jnz	70895Ah

l00708942:
	mov	ecx,[ebx+20h]
	push	edi
	mov	edi,[ebx+8h]
	push	5h
	push	ecx
	push	eax
	call	7086B0h
	add	esp,10h
	jmp	708BCDh

l0070895A:
	mov	edx,[ebx+20h]
	push	edx
	push	eax
	mov	eax,[ebx+8h]
	mov	ecx,edi
	mov	edx,6h
	call	7073E0h
	add	esp,8h
	test	eax,eax
	jz	708BCDh

l00708979:
	add	dword ptr [esi],0FFh
	jnz	70898Ah

l0070897E:
	mov	eax,[esi+4h]
	mov	ecx,[eax+18h]
	push	esi
	call	ecx
	add	esp,4h

l0070898A:
	xor	esi,esi
	jmp	708BCDh

l00708991:
	push	0h
	push	ecx
	call	ebp
	add	esp,8h
	mov	esi,eax
	jmp	708BCDh

l007089A0:
	test	al,8h
	jz	708A73h

l007089A8:
	cmp	esi,1h
	jnz	708A73h

l007089B1:
	mov	edx,[esp+20h]
	mov	eax,[edx]
	add	eax,0FCh
	mov	[edx],eax
	cmp	dword ptr [ebx+14h],0h
	mov	esi,[eax]
	mov	[esp+18h],esi
	jz	708A4Fh

l007089CC:
	mov	eax,[ebx+18h]
	test	eax,eax
	jz	708A4Fh

l007089D3:
	mov	ecx,[ebx+20h]
	push	ecx
	push	eax
	mov	eax,[ebx+8h]
	mov	ecx,edi
	mov	edx,4h
	call	7073E0h
	add	esp,8h
	test	eax,eax
	jz	7089F2h

l007089EE:
	xor	esi,esi
	jmp	708A58h

l007089F2:
	mov	edx,[esp+10h]
	push	esi
	push	edx
	call	ebp
	mov	esi,eax
	mov	eax,[ebx+18h]
	add	esp,8h
	test	eax,eax
	jz	708A58h

l00708A06:
	test	esi,esi
	jnz	708A1Fh

l00708A0A:
	mov	ecx,[ebx+20h]
	push	edi
	mov	edi,[ebx+8h]
	push	5h
	push	ecx
	push	eax
	call	7086B0h
	add	esp,10h
	jmp	708A58h

l00708A1F:
	mov	edx,[ebx+20h]
	push	edx
	push	eax
	mov	eax,[ebx+8h]
	mov	ecx,edi
	mov	edx,6h
	call	7073E0h
	add	esp,8h
	test	eax,eax
	jz	708A58h

l00708A3A:
	add	dword ptr [esi],0FFh
	jnz	708A4Bh

l00708A3F:
	mov	eax,[esi+4h]
	mov	ecx,[eax+18h]
	push	esi
	call	ecx
	add	esp,4h

l00708A4B:
	xor	esi,esi
	jmp	708A58h

l00708A4F:
	push	esi
	push	ecx
	call	ebp
	add	esp,8h
	mov	esi,eax

l00708A58:
	mov	eax,[esp+18h]
	add	dword ptr [eax],0FFh
	jnz	708BCDh

l00708A65:
	mov	edx,[eax+4h]
	push	eax
	mov	eax,[edx+18h]
	call	eax
	jmp	708BCAh

l00708A73:
	push	eax
	mov	eax,esi
	mov	ecx,edi
	call	707810h
	add	esp,4h
	xor	esi,esi
	jmp	708BCDh

l00708A87:
	mov	eax,esi
	mov	esi,[esp+20h]
	call	707AF0h
	cmp	dword ptr [ebx+14h],0h
	mov	ebp,eax
	jz	708B22h

l00708A9E:
	mov	eax,[ebx+18h]
	test	eax,eax
	jz	708B22h

l00708AA5:
	mov	ecx,[ebx+20h]
	push	ecx
	push	eax
	mov	eax,[ebx+8h]
	mov	ecx,edi
	mov	edx,4h
	call	7073E0h
	add	esp,8h
	test	eax,eax
	jz	708AC4h

l00708AC0:
	xor	esi,esi
	jmp	708B30h

l00708AC4:
	push	0h
	push	ebp
	push	edi
	call	6F9540h
	mov	esi,eax
	mov	eax,[ebx+18h]
	add	esp,0Ch
	test	eax,eax
	jz	708B30h

l00708AD9:
	test	esi,esi
	jnz	708AF2h

l00708ADD:
	mov	edx,[ebx+20h]
	push	edi
	mov	edi,[ebx+8h]
	push	5h
	push	edx
	push	eax
	call	7086B0h
	add	esp,10h
	jmp	708B30h

l00708AF2:
	mov	ecx,[ebx+20h]
	push	ecx
	push	eax
	mov	eax,[ebx+8h]
	mov	ecx,edi
	mov	edx,6h
	call	7073E0h
	add	esp,8h
	test	eax,eax
	jz	708B30h

l00708B0D:
	add	dword ptr [esi],0FFh
	jnz	708B1Eh

l00708B12:
	mov	edx,[esi+4h]
	mov	eax,[edx+18h]
	push	esi
	call	eax
	add	esp,4h

l00708B1E:
	xor	esi,esi
	jmp	708B30h

l00708B22:
	push	0h
	push	ebp
	push	edi
	call	6F9540h
	add	esp,0Ch
	mov	esi,eax

l00708B30:
	test	ebp,ebp
	jz	708BCDh

l00708B38:
	add	dword ptr [ebp+0h],0FFh
	jnz	708BCDh

l00708B42:
	mov	ecx,[ebp+4h]
	push	ebp
	jmp	708BC5h

l00708B48:
	cmp	eax,0A1ED20h
	jnz	708B89h

l00708B4F:
	mov	ebx,[edi+0Ch]
	test	ebx,ebx
	jz	708B89h

l00708B56:
	add	dword ptr [ebx],1h
	mov	edi,[edi+8h]
	add	dword ptr [edi],1h
	mov	eax,[edx]
	add	dword ptr [eax],0FFh
	mov	eax,[edx]
	cmp	dword ptr [eax],0h
	jnz	708B7Fh

l00708B6B:
	mov	ecx,[eax+4h]
	mov	edx,[ecx+18h]
	push	eax
	call	edx
	mov	edx,[esp+18h]
	mov	ecx,[esp+1Ch]
	add	esp,4h

l00708B7F:
	add	esi,1h
	mov	[edx],ebx
	add	ecx,1h
	jmp	708B8Ch

l00708B89:
	add	dword ptr [edi],1h

l00708B8C:
	cmp	dword ptr [edi+4h],0A249B8h
	jnz	708BAAh

l00708B95:
	mov	eax,[esp+20h]
	push	ebp
	push	esi
	push	eax
	mov	eax,ecx
	mov	ecx,edi
	call	707850h
	add	esp,0Ch
	jmp	708BBAh

l00708BAA:
	mov	ecx,[esp+20h]
	push	esi
	push	edi
	mov	eax,ebp
	call	707B30h
	add	esp,8h

l00708BBA:
	add	dword ptr [edi],0FFh
	mov	esi,eax
	jnz	708BCDh

l00708BC1:
	mov	ecx,[edi+4h]
	push	edi

l00708BC5:
	mov	edx,[ecx+18h]
	call	edx

l00708BCA:
	add	esp,4h

l00708BCD:
	mov	ebx,[esp+14h]
	mov	edi,[esp+20h]
	cmp	[edi],ebx
	jbe	708BFCh

l00708BD9:
	lea	esp,[esp+0h]

l00708BE0:
	add	dword ptr [edi],0FCh
	mov	eax,[edi]
	mov	eax,[eax]
	add	dword ptr [eax],0FFh
	jnz	708BF8h

l00708BEC:
	mov	ecx,[eax+4h]
	mov	edx,[ecx+18h]
	push	eax
	call	edx
	add	esp,4h

l00708BF8:
	cmp	[edi],ebx
	ja	708BE0h

l00708BFC:
	pop	edi
	mov	eax,esi
	pop	esi
	pop	ebp
	pop	ebx
	add	esp,0Ch
	ret
00708C06                   CC CC CC CC CC CC CC CC CC CC       ..........

;; fn00708C10: 00708C10
;;   Called from:
;;     0070A296 (in fn00708DC0)
fn00708C10 proc
	sub	esp,8h
	push	ebp
	mov	ebp,[esp+10h]
	mov	eax,[ebp+4h]
	cmp	eax,0A1D1B8h
	push	esi
	push	edi
	jz	708C36h

l00708C24:
	push	0A1D1B8h
	push	eax
	call	6D5670h
	add	esp,8h
	test	eax,eax
	jz	708C4Eh

l00708C36:
	push	8D7B2Ch
	push	ebp
	call	6FD8B0h
	mov	esi,eax
	add	esp,8h
	test	esi,esi
	jnz	708CE0h

l00708C4E:
	mov	eax,[ebx+4h]
	cmp	eax,0A16588h
	jz	708C6Ah

l00708C58:
	push	0A16588h
	push	eax
	call	6D5670h
	add	esp,8h
	test	eax,eax
	jz	708C91h

l00708C6A:
	cmp	dword ptr [ebx+8h],0h
	jle	708C91h

l00708C70:
	mov	edi,[ebx+0Ch]
	push	8B299Ch
	push	edi
	call	6DF760h
	mov	esi,eax
	add	esp,8h
	test	esi,esi
	jnz	708CE3h

l00708C87:
	call	6E1160h
	mov	esi,[edi+4h]
	jmp	708CE0h

l00708C91:
	mov	eax,[0A6D67Ch]
	push	eax
	call	dword ptr [0A6D680h]
	add	esp,4h
	test	eax,eax
	jz	708CDBh

l00708CA4:
	mov	esi,[eax+18h]
	test	esi,esi
	jz	708CDBh

l00708CAB:
	mov	eax,[esi+4h]
	cmp	eax,0A1D1B8h
	jz	708CC7h

l00708CB5:
	push	0A1D1B8h
	push	eax
	call	6D5670h
	add	esp,8h
	test	eax,eax
	jz	708CDBh

l00708CC7:
	push	8D7B2Ch
	push	esi
	call	6FD8B0h
	mov	esi,eax
	add	esp,8h
	test	esi,esi
	jnz	708CE0h

l00708CDB:
	mov	esi,0A1E968h

l00708CE0:
	add	dword ptr [esi],1h

l00708CE3:
	mov	eax,[esp+1Ch]
	push	0h
	push	ebp
	push	ebx
	push	eax
	push	esi
	call	703AF0h
	add	esp,14h
	add	dword ptr [esi],0FFh
	mov	edi,eax
	jnz	708D08h

l00708CFC:
	mov	ecx,[esi+4h]
	mov	edx,[ecx+18h]
	push	esi
	call	edx
	add	esp,4h

l00708D08:
	test	edi,edi
	jnz	708DB1h

l00708D10:
	mov	eax,[0A16B7Ch]
	push	eax
	call	6E1110h
	add	esp,4h
	test	eax,eax
	jz	708DB1h

l00708D26:
	lea	ecx,[esp+0Ch]
	push	ecx
	lea	edx,[esp+1Ch]
	push	edx
	lea	eax,[esp+18h]
	push	eax
	call	6E1130h
	mov	eax,[esp+24h]
	add	esp,0Ch
	cmp	dword ptr [eax+4h],0A1B450h
	jz	708D63h

l00708D4A:
	mov	ecx,[eax+4h]
	push	0A1B450h
	push	ecx
	call	6D5670h
	add	esp,8h
	test	eax,eax
	jz	708D9Ah

l00708D5F:
	mov	eax,[esp+18h]

l00708D63:
	add	eax,14h
	push	eax
	push	8D7AFCh
	call	6F2070h
	mov	esi,eax
	add	esp,8h
	test	esi,esi
	jz	708D9Ah

l00708D7A:
	mov	eax,[esp+18h]
	add	dword ptr [eax],0FFh
	mov	eax,[esp+18h]
	cmp	dword ptr [eax],0h
	jnz	708D96h

l00708D8A:
	mov	edx,[eax+4h]
	push	eax
	mov	eax,[edx+18h]
	call	eax
	add	esp,4h

l00708D96:
	mov	[esp+18h],esi

l00708D9A:
	mov	ecx,[esp+0Ch]
	mov	edx,[esp+18h]
	mov	eax,[esp+10h]
	push	ecx
	push	edx
	push	eax
	call	6E0E00h
	add	esp,0Ch

l00708DB1:
	mov	eax,edi
	pop	edi
	pop	esi
	pop	ebp
	add	esp,8h
	ret
00708DBA                               CC CC CC CC CC CC           ......

;; fn00708DC0: 00708DC0
;;   Called from:
;;     007078DB (in fn00707850)
;;     0070BC52 (in fn0070B600)
fn00708DC0 proc
	sub	esp,5Ch
	push	ebx
	push	esi
	mov	esi,[0A6D67Ch]
	xor	ebx,ebx
	push	edi
	mov	edi,[esp+6Ch]
	or	eax,0FFh
	cmp	edi,ebx
	mov	[esp+30h],ebx
	mov	[esp+28h],ebx
	mov	[esp+24h],esi
	mov	[esp+5Ch],eax
	mov	[esp+60h],ebx
	mov	[esp+58h],eax
	jnz	708DFAh

l00708DF1:
	pop	edi
	pop	esi
	xor	eax,eax
	pop	ebx
	add	esp,5Ch
	ret

l00708DFA:
	add	dword ptr [esi+0Ch],1h
	mov	eax,[0A1E8ACh]
	mov	ecx,[0A6D67Ch]
	sub	eax,1h
	mov	[0A1E8ACh],eax
	cmp	[ecx+0Ch],eax
	jle	708E27h

l00708E16:
	push	8A698Fh
	call	706DC0h
	add	esp,4h
	test	eax,eax
	jnz	708DF1h

l00708E27:
	cmp	[esi+14h],ebx
	mov	[esi+8h],edi
	jz	708E7Bh

l00708E2F:
	mov	eax,[esi+1Ch]
	cmp	eax,ebx
	jz	708E53h

l00708E36:
	mov	edx,[esi+24h]
	push	0A163B8h
	push	ebx
	push	edx
	push	eax
	call	7086B0h
	add	esp,10h
	test	eax,eax
	jnz	70B382h

l00708E51:
	xor	ebx,ebx

l00708E53:
	mov	eax,[esi+18h]
	cmp	eax,ebx
	jz	708E7Bh

l00708E5A:
	mov	ecx,[esi+20h]
	push	0A163B8h
	push	ebx
	push	ecx
	push	eax
	call	7086B0h
	add	esp,10h
	test	eax,eax
	jnz	70B382h

l00708E75:
	mov	edi,[esp+6Ch]
	xor	ebx,ebx

l00708E7B:
	mov	eax,[edi+10h]
	mov	edx,[eax+20h]
	mov	ecx,[eax+1Ch]
	mov	[esp+3Ch],eax
	mov	[esp+2Ch],edx
	mov	edx,[eax+0Ch]
	mov	eax,[eax+18h]
	add	eax,14h
	cmp	[esp+70h],ebx
	mov	[esp+64h],ecx
	lea	ecx,[edi+edx*4+138h]
	mov	edx,[edi+3Ch]
	mov	[esp+34h],eax
	push	ebp
	mov	ebp,[edi+24h]
	lea	eax,[edx+eax+1h]
	mov	[esp+44h],ecx
	mov	[esp+20h],eax
	mov	[edi+24h],ebx
	mov	dword ptr [esp+1Ch],1h
	mov	[esp+18h],ebx
	mov	dword ptr [esp+14h],0A163B8h
	mov	[esp+10h],ebx
	jz	708F23h

l00708ED8:
	mov	dword ptr [esp+1Ch],2h

l00708EE0:
	mov	edi,[esp+14h]

l00708EE4:
	mov	ebx,[esp+1Ch]
	cmp	ebx,1h
	jnz	70B00Fh

l00708EF1:
	cmp	dword ptr [esp+18h],0h
	jnz	708EFCh

l00708EF8:
	test	edi,edi
	jnz	708F23h

l00708EFC:
	mov	dword ptr [esp+1Ch],2h
	mov	ebx,[esp+1Ch]
	mov	dword ptr [esp+14h],0A163B8h
	mov	dword ptr [esp+18h],0h
	jmp	70B019h

l00708F1D:
	add	esi,ebx

l00708F1F:
	mov	[esp+20h],esi

l00708F23:
	add	dword ptr [0A1E8B4h],0FFh
	mov	ecx,[0A1E8B4h]
	jns	709025h

l00708F36:
	mov	edx,[esp+20h]
	cmp	byte ptr [edx],7Ah
	jz	709025h

l00708F43:
	mov	eax,[0A1E8B0h]
	mov	edi,[esp+28h]
	mov	[0A1E8B4h],eax
	mov	ecx,[0A6D270h]
	add	dword ptr [edi+44h],1h
	test	ecx,ecx
	jz	708F8Dh

l00708F5F:
	call	706CF0h
	test	eax,eax
	jge	708F79h

l00708F68:
	mov	dword ptr [esp+1Ch],2h
	mov	ebx,[esp+1Ch]
	jmp	70B019h

l00708F79:
	mov	edx,[0A6D270h]
	test	edx,edx
	jz	708F8Dh

l00708F83:
	mov	dword ptr [0A1E8B4h],0h

l00708F8D:
	cmp	dword ptr [0A6D260h],0h
	jz	709025h

l00708F9A:
	push	0h
	call	7158B0h
	add	esp,4h
	cmp	eax,edi
	jz	708FB5h

l00708FA8:
	push	8D7DA8h
	call	6E86F0h
	add	esp,4h

l00708FB5:
	mov	eax,[0A6D260h]
	push	eax
	call	74F570h
	mov	ecx,[0A6D260h]
	push	1h
	push	ecx
	call	74F540h
	push	edi
	call	7158B0h
	add	esp,10h
	test	eax,eax
	jz	708FE8h

l00708FDB:
	push	8D7D90h
	call	6E86F0h
	add	esp,4h

l00708FE8:
	mov	esi,[edi+4Ch]
	test	esi,esi
	jz	709025h

l00708FEF:
	push	esi
	mov	[esp+18h],esi
	mov	dword ptr [edi+4Ch],0h
	call	6E0F10h
	add	esp,4h
	add	dword ptr [esi],0FFh
	jnz	709014h

l00709008:
	mov	edx,[esi+4h]
	mov	eax,[edx+18h]
	push	esi
	call	eax
	add	esp,4h

l00709014:
	mov	dword ptr [esp+1Ch],2h
	mov	ebx,[esp+1Ch]
	jmp	70B019h

l00709025:
	mov	edi,[esp+14h]
	lea	esp,[esp+0h]

l00709030:
	mov	ecx,[esp+20h]
	sub	ecx,[esp+38h]
	mov	edx,[esp+70h]
	mov	eax,[esp+28h]
	mov	[edx+3Ch],ecx
	cmp	dword ptr [eax+1Ch],0h
	jz	7090A4h

l00709049:
	mov	ecx,eax
	cmp	dword ptr [ecx+10h],0h
	jnz	7090A4h

l00709051:
	mov	esi,edx
	lea	edx,[esp+5Ch]
	push	edx
	lea	eax,[esp+64h]
	push	eax
	mov	eax,ecx
	mov	[esi+24h],ebp
	mov	ecx,[eax+24h]
	mov	edx,[eax+1Ch]
	push	ecx
	push	edx
	lea	ebx,[esp+74h]
	call	707430h
	mov	[esp+28h],eax
	mov	ecx,esi
	mov	eax,[ecx+3Ch]
	add	eax,[esp+48h]
	add	esp,10h
	mov	[esp+20h],eax
	mov	eax,[ecx+24h]
	test	eax,eax
	jz	709099h

l0070908E:
	mov	ebp,eax
	mov	eax,ecx
	mov	dword ptr [eax+24h],0h

l00709099:
	cmp	dword ptr [esp+18h],0h
	jnz	708EE4h

l007090A4:
	mov	eax,[esp+20h]
	movzx	ecx,byte ptr [eax]
	add	eax,1h
	xor	ebx,ebx
	cmp	ecx,5Ah
	mov	[esp+20h],eax
	jl	7090D0h

l007090B9:
	movzx	ebx,byte ptr [eax+1h]
	movzx	edx,byte ptr [eax]
	add	eax,2h
	shl	ebx,8h
	mov	[esp+20h],eax
	add	ebx,edx
	lea	esp,[esp+0h]

l007090D0:
	lea	eax,[ecx-1h]
	cmp	eax,8Eh
	ja	70AFC3h

l007090DE:
	movzx	eax,byte ptr [eax+70B530h]
	jmp	dword ptr [70B3A4h+eax*4]

l007090EC:
	mov	eax,[esp+20h]
	movzx	ecx,byte ptr [eax]
	movzx	edx,byte ptr [eax+2h]
	add	eax,3h
	mov	[esp+20h],eax
	movzx	eax,byte ptr [eax-2h]
	shl	edx,8h
	add	edx,eax
	shl	ebx,10h
	or	ebx,edx
	jmp	7090D0h

l0070910E:
	mov	ecx,[esp+70h]
	mov	edi,[ecx+ebx*4+138h]
	test	edi,edi
	mov	[esp+14h],edi
	jz	709487h

l00709125:
	add	dword ptr [edi],1h
	mov	[ebp+0h],edi
	add	ebp,4h
	jmp	709030h

l00709133:
	mov	edx,[esp+68h]
	mov	edi,[edx+ebx*4+0Ch]
	add	dword ptr [edi],1h
	mov	[ebp+0h],edi
	mov	[esp+14h],edi
	add	ebp,4h
	jmp	709030h

l0070914D:
	mov	eax,[ebp-8h]
	mov	ecx,[ebp-4h]
	mov	[esp+10h],eax
	mov	[ebp-4h],eax
	mov	[ebp-8h],ecx
	jmp	709030h

l00709162:
	mov	eax,[ebp-8h]
	mov	edi,[ebp-0Ch]
	mov	ecx,[ebp-4h]
	mov	[esp+10h],eax
	mov	[esp+14h],edi
	mov	[ebp-4h],eax
	mov	[ebp-8h],edi
	mov	[ebp-0Ch],ecx
	jmp	709030h

l00709181:
	mov	eax,[ebp-0Ch]
	mov	edi,[ebp-10h]
	mov	ecx,[ebp-4h]
	mov	edx,[ebp-8h]
	mov	[esp+10h],eax
	mov	[esp+14h],edi
	mov	[ebp-4h],edx
	mov	[ebp-8h],eax
	mov	[ebp-0Ch],edi
	mov	[ebp-10h],ecx
	jmp	709030h

l007091A6:
	mov	eax,[ebp-4h]
	add	dword ptr [eax],1h
	mov	[ebp+0h],eax
	add	ebp,4h
	jmp	709030h

l007091B7:
	cmp	ebx,2h
	jnz	7091DEh

l007091BC:
	mov	edi,[ebp-4h]
	add	dword ptr [edi],1h
	mov	eax,[ebp-8h]
	add	dword ptr [eax],1h
	add	ebp,8h
	mov	[esp+14h],edi
	mov	[esp+10h],eax
	mov	[ebp-4h],edi
	mov	[ebp-8h],eax
	jmp	709030h

l007091DE:
	cmp	ebx,3h
	jnz	7094AEh

l007091E7:
	mov	edi,[ebp-4h]
	add	dword ptr [edi],1h
	mov	ecx,[ebp-8h]
	add	dword ptr [ecx],1h
	mov	eax,[ebp-0Ch]
	add	dword ptr [eax],1h
	add	ebp,0Ch
	mov	[esp+14h],edi
	mov	[esp+10h],ecx
	mov	[ebp-4h],edi
	mov	[ebp-8h],ecx
	mov	[ebp-0Ch],eax
	jmp	709030h

l00709212:
	mov	esi,[ebp-4h]
	mov	edx,[ebp-8h]
	sub	ebp,4h
	mov	eax,0A1E7E8h
	cmp	[esi+4h],eax
	mov	[esp+10h],esi
	mov	[esp+24h],edx
	jnz	7092ADh

l00709231:
	cmp	[edx+4h],eax
	jnz	7092ADh

l00709236:
	cmp	ebx,9h
	mov	eax,[edx+8h]
	mov	ecx,[esi+8h]
	ja	7092ADh

l00709241:
	jmp	dword ptr [70B5C0h+ebx*4]

l00709248:
	xor	ebx,ebx
	cmp	eax,ecx
	setl	bl
	mov	eax,ebx
	jmp	70929Ah

l00709253:
	xor	ebx,ebx
	cmp	eax,ecx
	setle	bl
	mov	eax,ebx
	jmp	70929Ah

l0070925E:
	xor	ebx,ebx
	cmp	eax,ecx
	setz	bl
	mov	eax,ebx
	jmp	70929Ah

l00709269:
	xor	ebx,ebx
	cmp	eax,ecx
	setnz	bl
	mov	eax,ebx
	jmp	70929Ah

l00709274:
	xor	ebx,ebx
	cmp	eax,ecx
	setg	bl
	mov	eax,ebx
	jmp	70929Ah

l0070927F:
	xor	ebx,ebx
	cmp	eax,ecx
	setge	bl
	mov	eax,ebx
	jmp	70929Ah

l0070928A:
	xor	eax,eax
	cmp	edx,esi
	setz	al
	jmp	70929Ah

l00709293:
	xor	eax,eax
	cmp	edx,esi
	setnz	al

l0070929A:
	test	eax,eax
	mov	edi,0A191E4h
	jnz	7092A8h

l007092A3:
	mov	edi,0A191D8h

l007092A8:
	add	dword ptr [edi],1h
	jmp	7092C6h

l007092AD:
	mov	eax,[esp+10h]
	mov	ecx,[esp+24h]
	mov	esi,ebx
	call	708130h
	mov	esi,[esp+10h]
	mov	edx,[esp+24h]
	mov	edi,eax

l007092C6:
	add	dword ptr [edx],0FFh
	mov	[esp+14h],edi
	jnz	7092DBh

l007092CF:
	mov	eax,[edx+4h]
	mov	ecx,[eax+18h]
	push	edx
	call	ecx
	add	esp,4h

l007092DB:
	add	dword ptr [esi],0FFh
	jnz	7092ECh

l007092E0:
	mov	edx,[esi+4h]
	mov	eax,[edx+18h]
	push	esi
	call	eax
	add	esp,4h

l007092EC:
	test	edi,edi
	mov	[ebp-4h],edi
	jz	708EE4h

l007092F7:
	mov	esi,[esp+20h]
	mov	al,[esi]
	cmp	al,6Fh
	jnz	709317h

l00709301:
	movzx	ebx,byte ptr [esi+2h]
	movzx	ecx,byte ptr [esi+1h]
	shl	ebx,8h
	add	ebx,ecx
	add	esi,3h
	mov	[esp+20h],esi
	jmp	709342h

l00709317:
	cmp	al,70h
	jnz	708F23h

l0070931F:
	movzx	ebx,byte ptr [esi+2h]
	movzx	edx,byte ptr [esi+1h]
	shl	ebx,8h
	add	ebx,edx
	add	esi,3h
	mov	[esp+20h],esi
	jmp	709375h

l00709335:
	add	[esp+20h],ebx
	jmp	709030h

l0070933E:
	mov	esi,[esp+20h]

l00709342:
	mov	eax,[ebp-4h]
	cmp	eax,0A191E4h
	mov	[esp+10h],eax
	jnz	70935Bh

l00709350:
	cmp	byte ptr [esi],1h
	jnz	709030h

l00709359:
	jmp	709390h

l0070935B:
	cmp	eax,0A191D8h
	jnz	70A9CAh

l00709366:
	add	esi,ebx
	mov	[esp+20h],esi
	jmp	709030h

l00709371:
	mov	esi,[esp+20h]

l00709375:
	mov	eax,[ebp-4h]
	cmp	eax,0A191D8h
	mov	[esp+10h],eax
	jnz	7093B7h

l00709383:
	cmp	byte ptr [esi],1h
	jnz	709030h

l0070938C:
	mov	esi,[esp+20h]

l00709390:
	add	esi,1h
	mov	[esp+20h],esi

l00709397:
	mov	eax,[ebp-4h]
	sub	ebp,4h

l0070939D:
	add	dword ptr [eax],0FFh
	jnz	709030h

l007093A6:
	mov	ecx,[eax+4h]
	mov	edx,[ecx+18h]
	push	eax
	call	edx
	add	esp,4h
	jmp	709030h

l007093B7:
	cmp	eax,0A191E4h
	jnz	70A9F8h

l007093C2:
	add	esi,ebx
	mov	[esp+20h],esi
	jmp	709030h

l007093CD:
	mov	esi,[ebp-4h]
	push	esi
	call	704B00h
	add	esp,4h
	add	dword ptr [esi],0FFh
	mov	edi,eax
	mov	[esp+14h],edi
	jnz	7093F0h

l007093E4:
	mov	eax,[esi+4h]
	mov	ecx,[eax+18h]
	push	esi
	call	ecx
	add	esp,4h

l007093F0:
	test	edi,edi
	jz	70AA1Ah

l007093F8:
	mov	esi,[esp+20h]
	mov	[ebp-4h],edi
	cmp	byte ptr [esi],5Dh
	jnz	708F23h

l00709408:
	movzx	ebx,byte ptr [esi+2h]
	movzx	edx,byte ptr [esi+1h]
	shl	ebx,8h
	add	ebx,edx
	add	esi,3h
	mov	[esp+20h],esi
	jmp	709422h

l0070941E:
	mov	esi,[esp+20h]

l00709422:
	mov	eax,[ebp-4h]
	mov	ecx,[eax+4h]
	mov	edx,[ecx+70h]
	push	eax
	call	edx
	mov	edi,eax
	add	esp,4h
	test	edi,edi
	mov	[esp+14h],edi
	jz	70AAE5h

l0070943F:
	mov	[ebp+0h],edi
	add	ebp,4h
	cmp	byte ptr [esi],7Dh
	jnz	70AA22h

l0070944E:
	movzx	ebx,byte ptr [esi+2h]
	movzx	eax,byte ptr [esi+1h]
	shl	ebx,8h
	add	ebx,eax
	add	esi,3h
	mov	[esp+20h],esi

l00709462:
	mov	ecx,[esp+70h]
	mov	eax,[ecx+ebx*4+138h]
	mov	edx,[ebp-4h]
	sub	ebp,4h
	test	eax,eax
	mov	[ecx+ebx*4+138h],edx
	jz	709030h

l00709482:
	jmp	70939Dh

l00709487:
	mov	eax,[esp+40h]
	mov	ecx,[eax+24h]
	push	ebx
	push	ecx
	call	6DFE60h
	mov	edx,[0A1776Ch]
	push	8D7D58h
	push	edx
	call	7083E0h
	add	esp,10h
	jmp	708EE4h

l007094AE:
	push	8D7D24h
	call	6E86F0h
	add	esp,4h
	jmp	708EE4h

l007094C0:
	mov	esi,[ebp-4h]
	push	esi
	call	702970h

l007094C9:
	add	esp,4h
	add	dword ptr [esi],0FFh
	mov	edi,eax
	mov	[esp+14h],edi
	jnz	7094E3h

l007094D7:
	mov	eax,[esi+4h]
	push	esi

l007094DB:
	mov	ecx,[eax+18h]
	call	ecx

l007094E0:
	add	esp,4h

l007094E3:
	mov	[ebp-4h],edi

l007094E6:
	test	edi,edi
	jnz	708F23h

l007094EE:
	jmp	708EE4h

l007094F3:
	mov	esi,[ebp-4h]
	push	esi
	call	702910h
	add	esp,4h
	add	dword ptr [esi],0FFh
	mov	edi,eax
	mov	[esp+14h],edi
	jnz	709516h

l0070950A:
	mov	edx,[esi+4h]
	mov	eax,[edx+18h]
	push	esi
	call	eax
	add	esp,4h

l00709516:
	test	edi,edi
	mov	[ebp-4h],edi
	jnz	708F23h

l00709521:
	jmp	708EE4h

l00709526:
	mov	esi,[ebp-4h]
	push	esi
	call	6DEA90h
	add	esp,4h
	add	dword ptr [esi],0FFh
	mov	ebx,eax
	mov	[esp+18h],ebx
	jnz	709549h

l0070953D:
	mov	ecx,[esi+4h]
	mov	edx,[ecx+18h]
	push	esi
	call	edx
	add	esp,4h

l00709549:
	test	ebx,ebx
	jnz	709560h

l0070954D:
	add	dword ptr [0A191E4h],1h
	mov	dword ptr [ebp-4h],0A191E4h
	jmp	708F23h

l00709560:
	jle	70957Dh

l00709562:
	add	dword ptr [0A191D8h],1h
	mov	dword ptr [ebp-4h],0A191D8h
	mov	dword ptr [esp+18h],0h
	jmp	708F23h

l0070957D:
	add	ebp,0FCh
	jmp	708EE4h

l00709585:
	mov	esi,[ebp-4h]
	push	esi
	call	6DDDB0h
	jmp	7094C9h

l00709593:
	mov	esi,[ebp-4h]
	push	esi
	call	7029D0h
	add	esp,4h
	add	dword ptr [esi],0FFh
	mov	edi,eax
	mov	[esp+14h],edi
	jnz	7094E3h

l007095AE:
	mov	edx,[esi+4h]
	mov	eax,[edx+18h]
	push	esi
	call	eax
	jmp	7094E0h

l007095BC:
	mov	ebx,[ebp-4h]
	mov	esi,[ebp-8h]
	sub	ebp,4h
	push	0A163B8h
	push	ebx
	push	esi
	mov	[esp+1Ch],ebx
	call	702570h

l007095D5:
	add	esp,0Ch

l007095D8:
	mov	edi,eax
	mov	[esp+14h],edi

l007095DE:
	add	dword ptr [esi],0FFh
	jnz	7095EFh

l007095E3:
	mov	ecx,[esi+4h]
	mov	edx,[ecx+18h]
	push	esi
	call	edx
	add	esp,4h

l007095EF:
	add	dword ptr [ebx],0FFh
	jnz	7094E3h

l007095F8:
	mov	eax,[ebx+4h]
	push	ebx
	jmp	7094DBh

l00709601:
	mov	ebx,[ebp-4h]
	mov	esi,[ebp-8h]
	sub	ebp,4h
	push	ebx
	push	esi
	mov	[esp+18h],ebx
	call	704560h

l00709615:
	mov	edi,eax
	mov	[esp+1Ch],edi

l0070961B:
	add	esp,8h

l0070961E:
	add	dword ptr [esi],0FFh
	jnz	70962Fh

l00709623:
	mov	edx,[esi+4h]
	mov	eax,[edx+18h]
	push	esi
	call	eax
	add	esp,4h

l0070962F:
	add	dword ptr [ebx],0FFh
	jnz	7094E3h

l00709638:
	mov	ecx,[ebx+4h]
	mov	edx,[ecx+18h]
	push	ebx
	call	edx
	jmp	7094E0h

l00709646:
	cmp	dword ptr [0A6C61Ch],0h
	jnz	709694h

l0070964F:
	mov	ebx,[ebp-4h]
	mov	esi,[ebp-8h]
	sub	ebp,4h
	push	ebx
	push	esi
	mov	[esp+18h],ebx
	call	702310h

l00709663:
	add	esp,8h
	add	dword ptr [esi],0FFh
	mov	edi,eax
	mov	[esp+14h],edi
	jnz	70967Dh

l00709671:
	mov	eax,[esi+4h]
	mov	ecx,[eax+18h]
	push	esi
	call	ecx
	add	esp,4h

l0070967D:
	add	dword ptr [ebx],0FFh
	jnz	7094E3h

l00709686:
	mov	edx,[ebx+4h]
	mov	eax,[edx+18h]
	push	ebx
	call	eax
	jmp	7094E0h

l00709694:
	mov	ebx,[ebp-4h]
	mov	esi,[ebp-8h]
	sub	ebp,4h
	push	ebx
	push	esi
	mov	[esp+18h],ebx
	call	7024B0h
	add	esp,8h
	jmp	7095D8h

l007096B0:
	mov	ebx,[ebp-4h]
	mov	esi,[ebp-8h]
	sub	ebp,4h
	push	ebx
	push	esi
	mov	[esp+18h],ebx
	call	702450h
	jmp	709615h

l007096C9:
	mov	ebx,[ebp-4h]
	mov	esi,[ebp-8h]
	sub	ebp,4h
	push	ebx
	push	esi
	mov	[esp+18h],ebx
	call	702510h
	jmp	709663h

l007096DF:
	mov	esi,[ebp-8h]
	mov	eax,[esi+4h]
	mov	ebx,[ebp-4h]
	sub	ebp,4h
	cmp	eax,0A1E7E8h
	mov	[esp+10h],ebx
	jnz	709722h

l007096F6:
	cmp	dword ptr [ebx+4h],0A1E7E8h
	jnz	709722h

l007096FF:
	mov	eax,[esi+8h]
	mov	edx,[ebx+8h]
	lea	ecx,[edx+eax]
	mov	edi,ecx
	xor	edi,eax
	jge	709714h

l0070970E:
	mov	eax,ecx
	xor	eax,edx
	jl	70974Fh

l00709714:
	push	ecx
	call	7050A0h
	add	esp,4h
	jmp	7095D8h

l00709722:
	cmp	eax,0A1B450h
	jnz	70974Fh

l00709729:
	cmp	dword ptr [ebx+4h],0A1B450h
	jnz	70974Fh

l00709732:
	mov	ecx,[esp+20h]
	mov	edx,[esp+70h]
	push	ebx
	push	esi
	call	708410h
	mov	edi,eax
	add	esp,8h
	mov	[esp+14h],edi
	jmp	7095EFh

l0070974F:
	push	ebx
	push	esi
	call	7023D0h
	add	esp,8h
	mov	edi,eax
	mov	[esp+14h],eax
	jmp	7095DEh

l00709764:
	mov	esi,[ebp-8h]
	mov	ebx,[ebp-4h]
	sub	ebp,4h
	mov	eax,0A1E7E8h
	cmp	[esi+4h],eax
	mov	[esp+10h],ebx
	jnz	7097AAh

l0070977B:
	cmp	[ebx+4h],eax
	jnz	7097AAh

l00709780:
	mov	edx,[esi+8h]
	mov	ecx,[ebx+8h]
	mov	eax,edx
	sub	eax,ecx
	mov	edi,eax
	xor	edi,edx
	jge	709796h

l00709790:
	not	ecx
	xor	ecx,eax
	jl	7097AAh

l00709796:
	push	eax
	call	7050A0h
	mov	edi,eax
	add	esp,4h
	mov	[esp+14h],edi
	jmp	70961Eh

l007097AA:
	push	ebx
	push	esi
	call	7022B0h
	mov	edi,eax
	mov	[esp+1Ch],eax
	jmp	70961Bh

l007097BC:
	mov	esi,[ebp-8h]
	mov	ebx,[ebp-4h]
	sub	ebp,4h
	cmp	dword ptr [esi+4h],0A1BAF0h
	mov	[esp+10h],ebx
	jnz	709804h

l007097D2:
	cmp	dword ptr [ebx+4h],0A1E7E8h
	jnz	709804h

l007097DB:
	push	ebx
	call	7052C0h
	add	esp,4h
	test	eax,eax
	jge	7097EDh

l007097E8:
	add	eax,[esi+8h]
	js	709804h

l007097ED:
	cmp	eax,[esi+8h]
	jge	709804h

l007097F2:
	mov	ecx,[esi+0Ch]
	mov	edi,[ecx+eax*4]
	add	dword ptr [edi],1h
	mov	[esp+14h],edi
	jmp	70961Eh

l00709804:
	push	ebx
	push	esi
	call	704220h
	mov	edi,eax
	mov	[esp+1Ch],eax
	jmp	70961Bh

l00709816:
	mov	ebx,[ebp-4h]
	mov	esi,[ebp-8h]
	sub	ebp,4h
	push	ebx
	push	esi
	mov	[esp+18h],ebx
	call	7021F0h
	jmp	709663h

l0070982F:
	mov	ebx,[ebp-4h]
	mov	esi,[ebp-8h]
	sub	ebp,4h
	push	ebx
	push	esi
	mov	[esp+18h],ebx
	call	702250h
	add	esp,8h
	jmp	7095D8h

l0070984B:
	mov	ebx,[ebp-4h]
	mov	esi,[ebp-8h]
	sub	ebp,4h
	push	ebx
	push	esi
	mov	[esp+18h],ebx
	call	702190h
	jmp	709615h

l00709864:
	mov	ebx,[ebp-4h]
	mov	esi,[ebp-8h]
	sub	ebp,4h
	push	ebx
	push	esi
	mov	[esp+18h],ebx
	call	702130h
	jmp	709663h

l0070987D:
	mov	ebx,[ebp-4h]
	mov	esi,[ebp-8h]
	sub	ebp,4h
	push	ebx
	push	esi
	mov	[esp+18h],ebx
	call	7020D0h
	add	esp,8h
	jmp	7095D8h

l00709899:
	mov	ebx,[ebp-4h]
	sub	ebp,4h
	mov	esi,[ebp-4h]
	sub	ebp,4h
	push	ebx
	push	esi
	mov	[esp+18h],ebx
	call	6F2A10h
	add	esp,8h
	add	dword ptr [esi],0FFh
	mov	[esp+18h],eax
	jnz	7098C8h

l007098BC:
	mov	edx,[esi+4h]
	mov	eax,[edx+18h]
	push	esi
	call	eax
	add	esp,4h

l007098C8:
	add	dword ptr [ebx],0FFh
	jnz	7098D9h

l007098CD:
	mov	ecx,[ebx+4h]
	mov	edx,[ecx+18h]
	push	ebx
	call	edx
	add	esp,4h

l007098D9:
	cmp	dword ptr [esp+18h],0h
	jnz	708EE4h

l007098E4:
	mov	eax,[esp+20h]
	cmp	byte ptr [eax],71h
	jnz	708F23h

l007098F1:
	movzx	ebx,byte ptr [eax+2h]
	movzx	eax,byte ptr [eax+1h]
	shl	ebx,8h
	add	ebx,eax

l007098FE:
	mov	ecx,[esp+38h]
	add	ebx,ecx
	mov	[esp+20h],ebx
	jmp	708F23h

l0070990D:
	mov	ebx,[ebp-4h]
	mov	esi,[ebp-8h]
	sub	ebp,4h
	push	0A163B8h
	push	ebx
	push	esi
	mov	[esp+1Ch],ebx
	call	7028C0h
	jmp	7095D5h

l0070992B:
	mov	ebx,[ebp-4h]
	mov	esi,[ebp-8h]
	sub	ebp,4h
	push	ebx
	push	esi
	mov	[esp+18h],ebx
	call	704610h
	jmp	709615h

l00709944:
	cmp	dword ptr [0A6C61Ch],0h
	jnz	709966h

l0070994D:
	mov	ebx,[ebp-4h]
	mov	esi,[ebp-8h]
	sub	ebp,4h
	push	ebx
	push	esi
	mov	[esp+18h],ebx
	call	702750h
	jmp	709663h

l00709966:
	mov	ebx,[ebp-4h]
	mov	esi,[ebp-8h]
	sub	ebp,4h
	push	ebx
	push	esi
	mov	[esp+18h],ebx
	call	7027A0h
	add	esp,8h
	jmp	7095D8h

l00709982:
	mov	ebx,[ebp-4h]
	mov	esi,[ebp-8h]
	sub	ebp,4h
	push	ebx
	push	esi
	mov	[esp+18h],ebx
	call	702770h
	jmp	709615h

l0070999B:
	mov	ebx,[ebp-4h]
	mov	esi,[ebp-8h]
	sub	ebp,4h
	push	ebx
	push	esi
	mov	[esp+18h],ebx
	call	7028A0h
	jmp	709663h

l007099B4:
	mov	esi,[ebp-8h]
	mov	eax,[esi+4h]
	mov	ebx,[ebp-4h]
	sub	ebp,4h
	cmp	eax,0A1E7E8h
	mov	[esp+10h],ebx
	jnz	7099F7h

l007099CB:
	cmp	dword ptr [ebx+4h],0A1E7E8h
	jnz	7099F7h

l007099D4:
	mov	eax,[esi+8h]
	mov	edx,[ebx+8h]
	lea	ecx,[edx+eax]
	mov	edi,ecx
	xor	edi,eax
	jge	7099E9h

l007099E3:
	mov	eax,ecx
	xor	eax,edx
	jl	709A0Bh

l007099E9:
	push	ecx
	call	7050A0h
	add	esp,4h
	jmp	7095D8h

l007099F7:
	cmp	eax,0A1B450h
	jnz	709A0Bh

l007099FE:
	cmp	dword ptr [ebx+4h],0A1B450h
	jz	709732h

l00709A0B:
	push	ebx
	push	esi
	call	7027D0h
	add	esp,8h
	mov	edi,eax
	mov	[esp+14h],eax
	jmp	7095DEh

l00709A20:
	mov	esi,[ebp-8h]
	mov	ebx,[ebp-4h]
	sub	ebp,4h
	mov	eax,0A1E7E8h
	cmp	[esi+4h],eax
	mov	[esp+10h],ebx
	jnz	709A66h

l00709A37:
	cmp	[ebx+4h],eax
	jnz	709A66h

l00709A3C:
	mov	edx,[esi+8h]
	mov	ecx,[ebx+8h]
	mov	eax,edx
	sub	eax,ecx
	mov	edi,eax
	xor	edi,edx
	jge	709A52h

l00709A4C:
	not	ecx
	xor	ecx,eax
	jl	709A66h

l00709A52:
	push	eax
	call	7050A0h
	mov	edi,eax
	add	esp,4h
	mov	[esp+14h],edi
	jmp	70961Eh

l00709A66:
	push	ebx
	push	esi
	call	702730h
	mov	edi,eax
	mov	[esp+1Ch],eax
	jmp	70961Bh

l00709A78:
	mov	ebx,[ebp-4h]
	mov	esi,[ebp-8h]
	sub	ebp,4h
	push	ebx
	push	esi
	mov	[esp+18h],ebx
	call	7026F0h
	jmp	709663h

l00709A91:
	mov	ebx,[ebp-4h]
	mov	esi,[ebp-8h]
	sub	ebp,4h
	push	ebx
	push	esi
	mov	[esp+18h],ebx
	call	702710h
	add	esp,8h
	jmp	7095D8h

l00709AAD:
	mov	ebx,[ebp-4h]
	mov	esi,[ebp-8h]
	sub	ebp,4h
	push	ebx
	push	esi
	mov	[esp+18h],ebx
	call	7026D0h
	jmp	709615h

l00709AC6:
	mov	ebx,[ebp-4h]
	mov	esi,[ebp-8h]
	sub	ebp,4h
	push	ebx
	push	esi
	mov	[esp+18h],ebx
	call	7026A0h
	jmp	709663h

l00709ADF:
	mov	ebx,[ebp-4h]
	mov	esi,[ebp-8h]
	sub	ebp,4h
	push	ebx
	push	esi
	mov	[esp+18h],ebx
	call	702670h
	add	esp,8h
	jmp	7095D8h

l00709AFB:
	lea	edx,[ecx-2h]
	test	dl,2h
	jz	709B0Fh

l00709B03:
	mov	eax,[ebp-4h]
	sub	ebp,4h
	mov	[esp+10h],eax
	jmp	709B17h

l00709B0F:
	mov	dword ptr [esp+10h],0h

l00709B17:
	test	cl,1h
	jz	709B24h

l00709B1C:
	mov	ebx,[ebp-4h]
	sub	ebp,4h
	jmp	709B26h

l00709B24:
	xor	ebx,ebx

l00709B26:
	mov	esi,[ebp-4h]
	mov	eax,[esp+10h]
	push	esi
	mov	ecx,ebx
	call	707E00h
	add	esp,4h
	add	dword ptr [esi],0FFh
	mov	edi,eax
	mov	[esp+14h],edi
	jnz	709B4Fh

l00709B43:
	mov	ecx,[esi+4h]
	mov	edx,[ecx+18h]
	push	esi
	call	edx
	add	esp,4h

l00709B4F:
	test	ebx,ebx
	jz	709B64h

l00709B53:
	add	dword ptr [ebx],0FFh
	jnz	709B64h

l00709B58:
	mov	eax,[ebx+4h]
	mov	ecx,[eax+18h]
	push	ebx
	call	ecx
	add	esp,4h

l00709B64:
	mov	eax,[esp+10h]
	test	eax,eax
	jz	7094E3h

l00709B70:
	add	dword ptr [eax],0FFh
	jnz	7094E3h

l00709B79:
	mov	edx,[eax+4h]
	push	eax
	mov	eax,[edx+18h]
	call	eax
	jmp	7094E0h

l00709B87:
	test	cl,2h
	jz	709B98h

l00709B8C:
	mov	edx,[ebp-4h]
	sub	ebp,4h
	mov	[esp+10h],edx
	jmp	709BA0h

l00709B98:
	mov	dword ptr [esp+10h],0h

l00709BA0:
	test	cl,1h
	jz	709BB1h

l00709BA5:
	mov	eax,[ebp-4h]
	sub	ebp,4h
	mov	[esp+24h],eax
	jmp	709BB9h

l00709BB1:
	mov	dword ptr [esp+24h],0h

l00709BB9:
	mov	ebx,[ebp-4h]
	mov	eax,[esp+10h]
	mov	ecx,[esp+24h]
	sub	ebp,4h
	mov	esi,[ebp-4h]
	sub	ebp,4h
	push	esi
	call	707F70h
	add	esp,4h
	add	dword ptr [esi],0FFh
	mov	[esp+18h],eax
	jnz	709BEBh

l00709BDF:
	mov	ecx,[esi+4h]
	mov	edx,[ecx+18h]
	push	esi
	call	edx
	add	esp,4h

l00709BEB:
	add	dword ptr [ebx],0FFh
	jnz	709BFCh

l00709BF0:
	mov	eax,[ebx+4h]
	mov	ecx,[eax+18h]
	push	ebx
	call	ecx
	add	esp,4h

l00709BFC:
	mov	eax,[esp+24h]
	test	eax,eax
	jz	709C15h

l00709C04:
	add	dword ptr [eax],0FFh
	jnz	709C15h

l00709C09:
	mov	edx,[eax+4h]
	push	eax

l00709C0D:
	mov	eax,[edx+18h]
	call	eax
	add	esp,4h

l00709C15:
	mov	eax,[esp+10h]
	test	eax,eax
	jz	709C2Eh

l00709C1D:
	add	dword ptr [eax],0FFh
	jnz	709C2Eh

l00709C22:
	mov	ecx,[eax+4h]
	push	eax

l00709C26:
	mov	edx,[ecx+18h]
	call	edx

l00709C2B:
	add	esp,4h

l00709C2E:
	cmp	dword ptr [esp+18h],0h
	jz	708F23h

l00709C39:
	jmp	708EE4h

l00709C3E:
	lea	eax,[ecx-2h]
	test	al,2h
	jz	709C51h

l00709C45:
	mov	edx,[ebp-4h]
	sub	ebp,4h
	mov	[esp+10h],edx
	jmp	709C59h

l00709C51:
	mov	dword ptr [esp+10h],0h

l00709C59:
	test	cl,1h
	jz	709C66h

l00709C5E:
	mov	esi,[ebp-4h]
	sub	ebp,4h
	jmp	709C68h

l00709C66:
	xor	esi,esi

l00709C68:
	mov	ebx,[ebp-4h]
	mov	eax,[esp+10h]
	sub	ebp,4h
	push	0h
	mov	ecx,esi
	call	707F70h
	add	esp,4h
	add	dword ptr [ebx],0FFh
	mov	[esp+18h],eax
	jnz	709C93h

l00709C87:
	mov	eax,[ebx+4h]
	mov	ecx,[eax+18h]
	push	ebx
	call	ecx
	add	esp,4h

l00709C93:
	test	esi,esi
	jz	709C15h

l00709C9B:
	add	dword ptr [esi],0FFh
	jnz	709C15h

l00709CA4:
	mov	edx,[esi+4h]
	push	esi
	jmp	709C0Dh

l00709CAD:
	mov	esi,[ebp-0Ch]
	mov	eax,[ebp-4h]
	mov	ebx,[ebp-8h]
	push	esi
	push	eax
	push	ebx
	mov	[esp+1Ch],eax
	add	ebp,0F4h
	call	704300h
	add	esp,0Ch
	add	dword ptr [esi],0FFh
	mov	[esp+18h],eax
	jnz	709CDDh

l00709CD1:
	mov	eax,[esi+4h]
	mov	ecx,[eax+18h]
	push	esi
	call	ecx
	add	esp,4h

l00709CDD:
	add	dword ptr [ebx],0FFh
	jnz	709CEEh

l00709CE2:
	mov	edx,[ebx+4h]
	mov	eax,[edx+18h]
	push	ebx
	call	eax
	add	esp,4h

l00709CEE:
	mov	eax,[esp+10h]
	jmp	709C1Dh

l00709CF7:
	mov	ebx,[ebp-4h]
	mov	esi,[ebp-8h]
	push	ebx
	push	esi
	mov	[esp+18h],ebx
	add	ebp,0F8h
	call	704400h
	add	esp,8h

l00709D0E:
	add	dword ptr [esi],0FFh
	mov	[esp+18h],eax
	jnz	709D23h

l00709D17:
	mov	eax,[esi+4h]
	mov	ecx,[eax+18h]
	push	esi
	call	ecx
	add	esp,4h

l00709D23:
	add	dword ptr [ebx],0FFh
	jnz	709C2Eh

l00709D2C:
	mov	edx,[ebx+4h]
	mov	eax,[edx+18h]
	push	ebx
	call	eax
	jmp	709C2Bh

l00709D3A:
	mov	ebx,[ebp-4h]
	sub	ebp,4h
	push	8D7D18h
	call	715DD0h
	mov	esi,eax
	add	esp,4h
	test	esi,esi
	mov	[esp+10h],esi
	jnz	709DACh

l00709D57:
	mov	ecx,[0A175E0h]
	push	8D7D00h
	push	ecx
	call	6E0F80h
	add	esp,8h
	xor	edi,edi
	mov	[esp+14h],edi

l00709D71:
	mov	dword ptr [esp+18h],0FFFFFFFFh

l00709D79:
	add	dword ptr [ebx],0FFh
	jnz	709D8Ah

l00709D7E:
	mov	ecx,[ebx+4h]
	mov	edx,[ecx+18h]
	push	ebx
	call	edx
	add	esp,4h

l00709D8A:
	test	edi,edi
	jz	708EE4h

l00709D92:
	add	dword ptr [edi],0FFh
	jnz	708EE4h

l00709D9B:
	mov	eax,[edi+4h]
	mov	ecx,[eax+18h]
	push	edi
	call	ecx
	add	esp,4h
	jmp	708EE4h

l00709DAC:
	cmp	dword ptr [esp+18h],0h
	jnz	709D79h

l00709DB3:
	push	ebx
	push	1h
	call	6DFF80h
	mov	edi,eax
	add	esp,8h
	test	edi,edi
	mov	[esp+14h],edi
	jz	709D71h

l00709DC8:
	push	0h
	push	edi
	push	esi
	call	707680h
	add	esp,0Ch
	test	eax,eax
	mov	[esp+10h],eax
	jz	709D71h

l00709DDC:
	add	dword ptr [eax],0FFh
	jnz	709D79h

l00709DE1:
	mov	edx,[eax+4h]
	push	eax
	mov	eax,[edx+18h]
	call	eax
	add	esp,4h
	jmp	709D79h

l00709DEF:
	mov	ebx,[ebp-4h]
	sub	ebp,4h
	mov	[esp+34h],ebx
	mov	[esp+10h],ebx
	jmp	709E03h

l00709DFF:
	mov	ebx,[esp+10h]

l00709E03:
	mov	eax,[esp+34h]
	mov	esi,[ebp-4h]
	sub	ebp,4h
	test	eax,eax
	jz	709E18h

l00709E11:
	cmp	eax,0A163B8h
	jnz	709E4Bh

l00709E18:
	push	8AC530h
	call	715DD0h
	mov	ebx,eax
	add	esp,4h
	test	ebx,ebx
	mov	[esp+10h],ebx
	jnz	709E4Fh

l00709E2F:
	mov	edx,[0A175E0h]
	push	8D7CF0h
	push	edx
	call	6E0F80h
	add	esp,8h
	mov	dword ptr [esp+18h],0FFFFFFFFh

l00709E4B:
	test	ebx,ebx
	jz	709E73h

l00709E4F:
	add	dword ptr [ebx],1h
	push	0h
	push	ebx
	call	731A20h
	add	esp,8h
	test	eax,eax
	jz	709E73h

l00709E61:
	push	ebx
	push	8A695Ch
	call	731D30h
	add	esp,8h
	mov	[esp+18h],eax

l00709E73:
	cmp	dword ptr [esp+18h],0h
	jnz	709F3Ch

l00709E7E:
	push	1h
	push	ebx
	push	esi
	call	731B10h
	add	esp,0Ch
	test	eax,eax
	mov	[esp+18h],eax
	jnz	709F3Ch

l00709E96:
	mov	eax,[esi+4h]
	cmp	eax,0A1B450h
	jz	709F08h

l00709EA0:
	push	0A1B450h
	push	eax
	call	6D5670h
	add	esp,8h
	test	eax,eax
	jnz	709F08h

l00709EB2:
	mov	eax,[esi+4h]
	cmp	eax,0A23B20h
	jz	709ECEh

l00709EBC:
	push	0A23B20h
	push	eax
	call	6D5670h
	add	esp,8h
	test	eax,eax
	jz	709F31h

l00709ECE:
	mov	eax,[esi+0Ch]
	mov	[esp+24h],eax
	mov	eax,[esi+8h]
	test	eax,eax
	mov	[esp+50h],eax
	jz	709F31h

l00709EE0:
	mov	ecx,[esp+24h]
	mov	edx,eax
	movzx	eax,word ptr [ecx+edx*2-2h]
	push	eax
	call	750FF0h
	add	esp,4h
	test	eax,eax
	jz	709F31h

l00709EF8:
	mov	ecx,[esp+24h]
	mov	edx,[esp+50h]
	cmp	word ptr [ecx+edx*2-2h],20h
	jmp	709F2Fh

l00709F08:
	mov	eax,[esi+8h]
	test	eax,eax
	mov	[esp+50h],eax
	jz	709F31h

l00709F13:
	movzx	ecx,byte ptr [eax+esi+13h]
	push	ecx
	call	dword ptr [8A4684h]
	add	esp,4h
	test	eax,eax
	jz	709F31h

l00709F26:
	mov	edx,[esp+50h]
	cmp	byte ptr [edx+esi+13h],20h

l00709F2F:
	jnz	709F3Ch

l00709F31:
	push	1h
	push	ebx
	call	731A20h
	add	esp,8h

l00709F3C:
	test	ebx,ebx
	jz	709F51h

l00709F40:
	add	dword ptr [ebx],0FFh
	jnz	709F51h

l00709F45:
	mov	eax,[ebx+4h]
	mov	ecx,[eax+18h]
	push	ebx
	call	ecx
	add	esp,4h

l00709F51:
	add	dword ptr [esi],0FFh
	jnz	709F62h

l00709F56:
	mov	edx,[esi+4h]
	mov	eax,[edx+18h]
	push	esi
	call	eax
	add	esp,4h

l00709F62:
	mov	eax,[esp+34h]
	test	eax,eax
	jz	709F7Bh

l00709F6A:
	add	dword ptr [eax],0FFh
	jnz	709F7Bh

l00709F6F:
	mov	ecx,[eax+4h]
	mov	edx,[ecx+18h]
	push	eax
	call	edx
	add	esp,4h

l00709F7B:
	mov	dword ptr [esp+34h],0h
	jmp	709C2Eh

l00709F88:
	mov	esi,[ebp-4h]
	sub	ebp,4h
	mov	ebx,esi
	mov	[esp+10h],ebx
	jmp	709F9Eh

l00709F96:
	mov	esi,[esp+34h]
	mov	ebx,[esp+10h]

l00709F9E:
	test	esi,esi
	jz	709FAAh

l00709FA2:
	cmp	esi,0A163B8h
	jnz	709FD4h

l00709FAA:
	push	8AC530h
	call	715DD0h
	mov	ebx,eax
	add	esp,4h
	test	ebx,ebx
	mov	[esp+10h],ebx
	jnz	709FD8h

l00709FC1:
	mov	eax,[0A175E0h]
	push	8D7CF0h
	push	eax
	call	6E0F80h
	add	esp,8h

l00709FD4:
	test	ebx,ebx
	jz	709FF8h

l00709FD8:
	push	ebx
	push	8A6DE8h
	call	731D30h
	add	esp,8h
	test	eax,eax
	mov	[esp+18h],eax
	jnz	709FF8h

l00709FEE:
	push	eax
	push	ebx
	call	731A20h
	add	esp,8h

l00709FF8:
	test	esi,esi
	jz	70A00Dh

l00709FFC:
	add	dword ptr [esi],0FFh
	jnz	70A00Dh

l0070A001:
	mov	ecx,[esi+4h]
	mov	edx,[ecx+18h]
	push	esi
	call	edx
	add	esp,4h

l0070A00D:
	mov	dword ptr [esp+34h],0h
	jmp	708EE4h

l0070A01A:
	xor	eax,eax
	xor	ecx,ecx
	xor	edx,edx
	cmp	ebx,3h
	mov	[esp+10h],eax
	ja	70A05Ah

l0070A029:
	jmp	dword ptr [70B5E8h+ebx*4]

l0070A030:
	mov	edx,[ebp-4h]
	sub	ebp,4h

l0070A036:
	mov	ecx,[ebp-4h]
	sub	ebp,4h

l0070A03C:
	mov	eax,[ebp-4h]
	sub	ebp,4h
	mov	[esp+10h],eax

l0070A046:
	push	edx
	push	ecx
	push	eax
	call	707020h
	add	esp,0Ch
	mov	[esp+1Ch],eax
	jmp	708EE4h

l0070A05A:
	mov	eax,[0A18720h]
	push	8D7CD8h
	push	eax
	call	6E0F80h
	mov	dword ptr [esp+24h],2h
	mov	ebx,[esp+24h]
	add	esp,8h
	jmp	70B019h

l0070A07E:
	mov	ecx,[esp+70h]
	mov	edi,[ecx+1Ch]
	test	edi,edi
	mov	[esp+14h],edi
	jz	70A09Bh

l0070A08D:
	add	dword ptr [edi],1h
	mov	[ebp+0h],edi
	add	ebp,4h
	jmp	708F23h

l0070A09B:
	mov	edx,[0A18720h]
	push	8D7CCCh
	push	edx
	call	6E0F80h
	add	esp,8h
	jmp	708EE4h

l0070A0B4:
	mov	eax,[ebp-4h]
	sub	ebp,4h
	mov	[esp+2Ch],eax
	mov	dword ptr [esp+1Ch],8h
	jmp	70B089h

l0070A0CB:
	mov	ebx,[ebp-4h]
	mov	eax,[ebp-8h]
	mov	esi,[ebp-0Ch]
	mov	ecx,[esp+70h]
	push	ebx
	push	eax
	push	esi
	push	ecx
	mov	[esp+20h],ebx
	mov	[esp+34h],eax
	add	ebp,0F4h
	call	70BCC0h
	add	esp,10h
	add	dword ptr [esi],0FFh
	mov	[esp+18h],eax
	jnz	70A104h

l0070A0F8:
	mov	edx,[esi+4h]
	mov	eax,[edx+18h]
	push	esi
	call	eax
	add	esp,4h

l0070A104:
	mov	eax,[esp+24h]
	add	dword ptr [eax],0FFh
	jnz	70A119h

l0070A10D:
	mov	ecx,[eax+4h]
	mov	edx,[ecx+18h]
	push	eax
	call	edx
	add	esp,4h

l0070A119:
	add	dword ptr [ebx],0FFh
	jnz	708EE4h

l0070A122:
	mov	eax,[ebx+4h]
	mov	ecx,[eax+18h]
	push	ebx
	call	ecx
	add	esp,4h
	jmp	708EE4h

l0070A133:
	mov	edi,[esp+70h]
	push	edi
	call	73B280h
	mov	edx,ebp
	sub	edx,[edi+20h]
	mov	esi,eax
	sar	edx,2h
	add	esp,4h
	cmp	edx,[esi+8h]
	jle	708F23h

l0070A153:
	mov	eax,[ebp-4h]
	sub	ebp,4h
	add	dword ptr [eax],0FFh
	jnz	70A16Ah

l0070A15E:
	mov	ecx,[eax+4h]
	mov	edx,[ecx+18h]
	push	eax
	call	edx
	add	esp,4h

l0070A16A:
	mov	eax,ebp
	sub	eax,[edi+20h]
	sar	eax,2h
	cmp	eax,[esi+8h]
	jg	70A153h

l0070A177:
	jmp	708F23h

l0070A17C:
	mov	esi,[ebp-4h]
	mov	eax,[esi+4h]
	sub	ebp,4h
	cmp	eax,0A1E7E8h
	jz	70A24Bh

l0070A190:
	push	0A1E7E8h
	push	eax
	call	6D5670h
	add	esp,8h
	test	eax,eax
	jnz	70A24Bh

l0070A1A6:
	mov	eax,[esi+4h]
	cmp	eax,0A1E968h
	jz	70A21Fh

l0070A1B0:
	cmp	eax,0A15380h
	jz	70A1C9h

l0070A1B7:
	push	0A15380h
	push	eax
	call	6D5670h
	add	esp,8h
	test	eax,eax
	jz	70A1DDh

l0070A1C9:
	mov	ecx,[0A169F0h]
	push	ecx
	push	esi
	call	6D5670h
	add	esp,8h
	test	eax,eax
	jnz	70A21Fh

l0070A1DD:
	mov	eax,[esi+4h]
	cmp	eax,0A1B450h
	jz	70A21Fh

l0070A1E7:
	push	0A1B450h
	push	eax
	call	6D5670h
	add	esp,8h
	test	eax,eax
	jnz	70A21Fh

l0070A1F9:
	cmp	esi,0A163B8h
	jz	70A266h

l0070A201:
	mov	edx,[0A18720h]
	push	8D7CACh
	push	edx
	call	6E0F80h
	add	esp,8h
	mov	dword ptr [esp+1Ch],2h
	jmp	70A266h

l0070A21F:
	mov	eax,[ebp-4h]
	sub	ebp,4h
	mov	ecx,[ebp-4h]
	sub	ebp,4h
	push	ecx
	push	eax
	push	esi
	mov	[esp+1Ch],eax
	call	6E0E00h
	mov	dword ptr [esp+28h],4h
	mov	ebx,[esp+28h]
	add	esp,0Ch
	jmp	70B019h

l0070A24B:
	mov	eax,[esi+8h]
	cmp	eax,8h
	mov	[esp+1Ch],eax
	jz	70A25Ch

l0070A257:
	cmp	eax,20h
	jnz	70A266h

l0070A25C:
	mov	edx,[ebp-4h]
	sub	ebp,4h
	mov	[esp+2Ch],edx

l0070A266:
	add	dword ptr [esi],0FFh
	jnz	708EE4h

l0070A26F:
	mov	eax,[esi+4h]
	mov	ecx,[eax+18h]
	push	esi
	call	ecx
	add	esp,4h
	jmp	708EE4h

l0070A280:
	mov	esi,[ebp-0Ch]
	mov	eax,[ebp-4h]
	mov	ebx,[ebp-8h]
	push	esi
	push	eax
	mov	[esp+2Ch],eax
	mov	[esp+18h],esi
	add	ebp,0F8h
	call	708C10h
	mov	edi,eax
	mov	eax,[esp+2Ch]
	add	esp,8h
	mov	[ebp-4h],edi
	add	dword ptr [eax],0FFh
	mov	[esp+14h],edi
	jnz	70A2BCh

l0070A2B0:
	mov	edx,[eax+4h]
	push	eax
	mov	eax,[edx+18h]
	call	eax
	add	esp,4h

l0070A2BC:
	add	dword ptr [ebx],0FFh
	jnz	70A266h

l0070A2C1:
	mov	ecx,[ebx+4h]
	mov	edx,[ecx+18h]
	push	ebx
	call	edx
	add	esp,4h
	jmp	70A266h

l0070A2CF:
	mov	eax,[esp+70h]
	mov	edx,[esp+30h]
	mov	edi,[eax+1Ch]
	mov	ebx,[edx+ebx*4+0Ch]
	mov	esi,[ebp-4h]
	sub	ebp,4h
	test	edi,edi
	mov	[esp+10h],ebx
	mov	[esp+14h],edi
	jz	70A321h

l0070A2F0:
	cmp	dword ptr [edi+4h],0A1D1B8h
	push	esi
	push	ebx
	push	edi
	jnz	70A303h

l0070A2FC:
	call	6FBD90h
	jmp	70A308h

l0070A303:
	call	704300h

l0070A308:
	add	esp,0Ch
	add	dword ptr [esi],0FFh
	mov	[esp+18h],eax
	jnz	709C2Eh

l0070A318:
	mov	ecx,[esi+4h]
	push	esi
	jmp	709C26h

l0070A321:
	push	ebx
	call	6DDDB0h
	add	eax,14h
	push	eax
	mov	eax,[0A18720h]
	push	8D7C8Ch
	push	eax
	call	6E15D0h
	add	esp,10h
	jmp	708EE4h

l0070A343:
	mov	edx,[esp+70h]
	mov	ecx,[esp+30h]
	mov	edi,[edx+1Ch]
	test	edi,edi
	mov	ebx,[ecx+ebx*4+0Ch]
	mov	[esp+10h],ebx
	mov	[esp+14h],edi
	push	ebx
	jz	70A38Eh

l0070A35F:
	push	edi
	call	704400h
	add	esp,8h
	test	eax,eax
	mov	[esp+18h],eax
	jz	708EE4h

l0070A374:
	push	8D7C6Ch

l0070A379:
	mov	eax,[0A17768h]
	push	eax
	mov	eax,ebx
	call	7083E0h
	add	esp,8h
	jmp	708EE4h

l0070A38E:
	call	6DDDB0h
	mov	ecx,[0A18720h]
	add	eax,14h
	push	eax
	push	8D7C50h
	push	ecx
	call	6E15D0h
	add	esp,10h
	jmp	708EE4h

l0070A3B0:
	mov	edx,[esp+30h]
	mov	eax,[edx+ebx*4+0Ch]
	mov	ebx,[ebp-8h]
	mov	esi,[ebp-4h]
	push	ebx
	push	eax
	push	esi
	mov	[esp+1Ch],eax
	add	ebp,0F8h
	call	6DE430h
	add	esp,0Ch
	jmp	709D0Eh

l0070A3D5:
	mov	ecx,[esp+30h]
	mov	ebx,[ecx+ebx*4+0Ch]
	mov	esi,[ebp-4h]
	push	0h
	sub	ebp,4h
	push	ebx
	push	esi
	mov	[esp+1Ch],ebx
	call	6DE430h
	add	esp,0Ch
	mov	[esp+18h],eax
	jmp	70AACBh

l0070A3FC:
	mov	ecx,[esp+30h]
	mov	esi,[ebp-4h]
	mov	ebx,[ecx+ebx*4+0Ch]
	mov	edx,[esp+70h]
	mov	eax,[edx+18h]
	sub	ebp,4h
	push	esi
	push	ebx
	push	eax
	mov	[esp+1Ch],ebx
	call	6FBD90h
	add	esp,0Ch
	add	dword ptr [esi],0FFh
	mov	ebx,eax
	mov	[esp+18h],ebx
	jnz	70A437h

l0070A42B:
	mov	ecx,[esi+4h]
	mov	edx,[ecx+18h]
	push	esi
	call	edx
	add	esp,4h

l0070A437:
	test	ebx,ebx
	jz	708F23h

l0070A43F:
	jmp	708EE4h

l0070A444:
	mov	eax,[esp+30h]
	mov	ebx,[eax+ebx*4+0Ch]
	mov	ecx,[esp+70h]
	mov	edx,[ecx+18h]
	push	ebx
	push	edx
	mov	[esp+18h],ebx
	call	6FBE60h
	add	esp,8h
	test	eax,eax
	mov	[esp+18h],eax
	jz	708EE4h

l0070A46D:
	push	8D7C2Ch
	jmp	70A379h

l0070A477:
	mov	esi,[esp+70h]
	mov	ecx,[esp+30h]
	mov	ebx,[ecx+ebx*4+0Ch]
	mov	eax,[esi+1Ch]
	test	eax,eax
	mov	[esp+10h],ebx
	push	ebx
	jnz	70A4B1h

l0070A48F:
	call	6DDDB0h
	mov	edx,[0A18720h]
	add	eax,14h
	push	eax
	push	8D7C10h
	push	edx
	call	6E15D0h
	add	esp,10h
	jmp	708EE4h

l0070A4B1:
	cmp	dword ptr [eax+4h],0A1D1B8h
	push	eax
	jnz	70A4D2h

l0070A4BB:
	call	6FBCC0h
	mov	edi,eax
	add	esp,8h
	test	edi,edi
	mov	[esp+14h],eax
	jz	70A514h

l0070A4CD:
	add	dword ptr [edi],1h
	jmp	70A50Ch

l0070A4D2:
	call	704220h
	mov	edi,eax
	add	esp,8h
	test	edi,edi
	mov	[esp+14h],edi
	jnz	70A5D1h

l0070A4E8:
	call	6E0FC0h
	test	eax,eax
	jz	70A50Ch

l0070A4F1:
	mov	eax,[0A17E28h]
	push	eax
	call	6E1110h
	add	esp,4h
	test	eax,eax
	jz	708EE4h

l0070A507:
	call	6E1160h

l0070A50C:
	test	edi,edi
	jnz	70A5D1h

l0070A514:
	mov	ecx,[esi+18h]
	push	ebx
	push	ecx
	call	6FBCC0h
	mov	edi,eax
	add	esp,8h
	test	edi,edi
	mov	[esp+14h],eax
	jnz	70A5CEh

l0070A52F:
	mov	edx,[esi+14h]
	push	ebx
	push	edx
	call	6FBCC0h
	mov	edi,eax
	add	esp,8h
	test	edi,edi
	mov	[esp+14h],edi
	jnz	70A5CEh

l0070A54A:
	jmp	70A374h

l0070A54F:
	mov	ecx,[esp+30h]
	mov	ebx,[ecx+ebx*4+0Ch]
	cmp	dword ptr [ebx+4h],0A1B450h
	mov	[esp+10h],ebx
	jnz	70A5DCh

l0070A564:
	mov	esi,[ebx+0Ch]
	cmp	esi,0FFh
	jz	70A5DCh

l0070A56C:
	mov	edi,[esp+70h]
	mov	eax,[edi+18h]
	mov	edx,[eax+18h]
	push	esi
	push	ebx
	push	eax
	call	edx
	add	esp,0Ch
	test	eax,eax
	jnz	70A58Dh

l0070A582:
	xor	edi,edi
	mov	[esp+14h],edi
	jmp	708EE4h

l0070A58D:
	mov	eax,[eax+8h]
	test	eax,eax
	mov	[esp+14h],eax
	jz	70A5A6h

l0070A598:
	add	dword ptr [eax],1h
	mov	[ebp+0h],eax
	add	ebp,4h
	jmp	708F23h

l0070A5A6:
	mov	eax,[edi+14h]
	push	esi
	push	ebx
	push	eax
	mov	eax,[eax+18h]
	call	eax
	add	esp,0Ch
	test	eax,eax
	jnz	70A5C3h

l0070A5B8:
	xor	edi,edi
	mov	[esp+14h],edi
	jmp	708EE4h

l0070A5C3:
	mov	edi,[eax+8h]
	test	edi,edi
	mov	[esp+14h],edi
	jz	70A60Eh

l0070A5CE:
	add	dword ptr [edi],1h

l0070A5D1:
	mov	[ebp+0h],edi
	add	ebp,4h
	jmp	708F23h

l0070A5DC:
	mov	esi,[esp+70h]
	mov	ecx,[esi+18h]
	push	ebx
	push	ecx
	call	6FBCC0h
	mov	edi,eax
	add	esp,8h
	test	edi,edi
	mov	[esp+14h],eax
	jnz	70A5CEh

l0070A5F7:
	mov	edx,[esi+14h]
	push	ebx
	push	edx
	call	6FBCC0h
	mov	edi,eax
	add	esp,8h
	test	edi,edi
	mov	[esp+14h],edi
	jnz	70A5CEh

l0070A60E:
	push	8D7C2Ch
	jmp	70A379h

l0070A618:
	mov	eax,[esp+70h]
	mov	edi,[eax+ebx*4+138h]
	test	edi,edi
	mov	[esp+14h],edi
	jz	709487h

l0070A62F:
	mov	dword ptr [eax+ebx*4+138h],0h
	add	dword ptr [edi],0FFh
	jnz	708F23h

l0070A643:
	mov	ecx,[edi+4h]
	mov	edx,[ecx+18h]
	push	edi
	call	edx
	add	esp,4h
	jmp	708F23h

l0070A654:
	mov	eax,[esp+44h]
	mov	ebx,[eax+ebx*4]
	add	dword ptr [ebx],1h
	mov	[ebp+0h],ebx
	mov	[esp+14h],ebx
	add	ebp,4h
	jmp	708F23h

l0070A66D:
	mov	ecx,[esp+44h]
	mov	edi,[ecx+ebx*4]
	push	edi
	mov	[esp+18h],edi
	call	7503F0h
	add	esp,4h
	test	eax,eax
	mov	[esp+10h],eax
	jz	70A694h

l0070A689:
	mov	[ebp+0h],eax
	add	ebp,4h
	jmp	708F23h

l0070A694:
	mov	dword ptr [esp+18h],0FFFFFFFFh
	call	6E0FC0h
	test	eax,eax
	jnz	708EE4h

l0070A6A9:
	mov	edx,[esp+40h]
	mov	ecx,[edx+2Ch]
	mov	eax,[ecx+8h]
	cmp	ebx,eax
	jge	70A6D4h

l0070A6B7:
	mov	edx,[0A1776Ch]
	mov	eax,[ecx+ebx*4+0Ch]
	push	8D7D58h
	push	edx
	call	7083E0h
	add	esp,8h
	jmp	708EE4h

l0070A6D4:
	mov	ecx,[0A17768h]
	sub	ebx,eax
	mov	eax,[edx+28h]
	mov	eax,[eax+ebx*4+0Ch]
	push	8D7BC8h
	push	ecx
	call	7083E0h
	add	esp,8h
	jmp	708EE4h

l0070A6F6:
	mov	esi,[ebp-4h]
	mov	edx,[esp+44h]
	mov	ebx,[edx+ebx*4]
	sub	ebp,4h
	push	esi
	push	ebx
	mov	[esp+18h],esi
	mov	[esp+1Ch],ebx
	call	750420h
	add	esp,8h

l0070A715:
	add	dword ptr [esi],0FFh
	jnz	708F23h

l0070A71E:
	mov	eax,[esi+4h]
	mov	ecx,[eax+18h]
	push	esi
	call	ecx
	add	esp,4h
	jmp	708F23h

l0070A72F:
	push	ebx
	call	6DFD20h
	mov	edi,eax
	add	esp,4h
	test	edi,edi
	mov	[esp+14h],edi
	jz	708EE4h

l0070A746:
	sub	ebx,1h
	js	70A766h

l0070A74B:
	lea	eax,[edi+ebx*4+0Ch]
	nop

l0070A750:
	mov	ecx,[ebp-4h]
	sub	ebp,4h
	mov	[eax],ecx
	sub	ebx,1h
	sub	eax,4h
	test	ebx,ebx
	mov	[esp+10h],ecx
	jge	70A750h

l0070A766:
	mov	[ebp+0h],edi
	add	ebp,4h
	jmp	708F23h

l0070A771:
	push	ebx
	call	6F2650h
	mov	edi,eax
	add	esp,4h
	test	edi,edi
	mov	[esp+14h],edi
	jz	708EE4h

l0070A788:
	sub	ebx,1h
	js	70A7A6h

l0070A78D:
	lea	ecx,[ecx+0h]

l0070A790:
	mov	eax,[ebp-4h]
	mov	edx,[edi+0Ch]
	sub	ebp,4h
	sub	ebx,1h
	mov	[edx+ebx*4+4h],eax
	mov	[esp+10h],eax
	jns	70A790h

l0070A7A6:
	mov	[ebp+0h],edi
	add	ebp,4h
	jmp	708F23h

l0070A7B1:
	call	6FDCC0h
	mov	edi,eax
	mov	[ebp+0h],edi
	mov	[esp+14h],edi
	add	ebp,4h
	jmp	7094E6h

l0070A7C7:
	mov	eax,[esp+30h]
	mov	ebx,[eax+ebx*4+0Ch]
	mov	esi,[ebp-4h]
	push	ebx
	push	esi
	mov	[esp+18h],ebx
	call	6DE330h
	add	esp,8h
	add	dword ptr [esi],0FFh
	mov	edi,eax
	mov	[esp+14h],edi
	jnz	7094E3h

l0070A7EF:
	mov	ecx,[esi+4h]
	mov	edx,[ecx+18h]
	push	esi
	call	edx
	jmp	7094E0h

l0070A7FD:
	mov	eax,[esp+30h]
	mov	esi,[esp+70h]
	mov	edx,[esi+14h]
	mov	ecx,[eax+ebx*4+0Ch]
	push	8D5F2Ch
	push	edx
	mov	[esp+18h],ecx
	call	6FD8B0h
	mov	edi,eax
	add	esp,8h
	test	edi,edi
	mov	[esp+14h],edi
	jnz	70A840h

l0070A828:
	mov	eax,[0A16F8Ch]
	push	8D7BB0h
	push	eax
	call	6E0F80h
	add	esp,8h
	jmp	708EE4h

l0070A840:
	add	dword ptr [edi],1h
	mov	eax,[ebp-8h]
	mov	ebx,[ebp-4h]
	sub	ebp,4h
	push	eax
	mov	[esp+28h],eax
	call	7051A0h
	add	esp,4h
	cmp	eax,0FFh
	jnz	70A890h

l0070A85E:
	call	6E0FC0h
	test	eax,eax
	jnz	70A890h

l0070A867:
	mov	eax,[esi+1Ch]
	test	eax,eax
	jnz	70A873h

l0070A86E:
	mov	eax,0A163B8h

l0070A873:
	mov	ecx,[esi+18h]
	mov	edx,[esp+10h]
	push	ebx
	push	eax
	push	ecx
	push	edx
	push	4h
	call	6DFF80h
	mov	esi,eax
	add	esp,14h
	mov	[esp+10h],esi
	jmp	70A8BCh

l0070A890:
	mov	eax,[esi+1Ch]
	test	eax,eax
	jnz	70A89Ch

l0070A897:
	mov	eax,0A163B8h

l0070A89C:
	mov	ecx,[esp+24h]
	mov	edx,[esi+18h]
	push	ecx
	push	ebx
	push	eax
	mov	eax,[esp+1Ch]
	push	edx
	push	eax
	push	5h
	call	6DFF80h
	add	esp,18h
	mov	esi,eax
	mov	[esp+10h],eax

l0070A8BC:
	add	dword ptr [ebx],0FFh
	jnz	70A8CDh

l0070A8C1:
	mov	ecx,[ebx+4h]
	mov	edx,[ecx+18h]
	push	ebx
	call	edx
	add	esp,4h

l0070A8CD:
	mov	eax,[esp+24h]
	add	dword ptr [eax],0FFh
	jnz	70A8E2h

l0070A8D6:
	mov	ecx,[eax+4h]
	mov	edx,[ecx+18h]
	push	eax
	call	edx
	add	esp,4h

l0070A8E2:
	test	esi,esi
	jnz	70A905h

l0070A8E6:
	add	ebp,0FCh
	add	dword ptr [edi],0FFh
	jnz	70A8FAh

l0070A8EE:
	mov	eax,[edi+4h]
	mov	ecx,[eax+18h]
	push	edi
	call	ecx
	add	esp,4h

l0070A8FA:
	xor	edi,edi
	mov	[esp+14h],edi
	jmp	708EE4h

l0070A905:
	push	0h
	push	esi
	push	edi
	mov	ebx,edi
	call	707680h
	add	esp,0Ch
	add	dword ptr [ebx],0FFh
	mov	edi,eax
	mov	[esp+14h],edi
	jnz	70A92Ah

l0070A91E:
	mov	edx,[ebx+4h]
	mov	eax,[edx+18h]
	push	ebx
	call	eax
	add	esp,4h

l0070A92A:
	add	dword ptr [esi],0FFh
	jnz	7094E3h

l0070A933:
	mov	ecx,[esi+4h]
	mov	edx,[ecx+18h]
	push	esi
	call	edx
	jmp	7094E0h

l0070A941:
	mov	ebx,[esp+70h]
	mov	esi,[ebp-4h]
	sub	ebp,4h
	push	ebx
	call	73B3D0h
	mov	edi,[ebx+1Ch]
	add	esp,4h
	test	edi,edi
	mov	[esp+14h],edi
	jnz	70A977h

l0070A95F:
	mov	eax,[0A18720h]
	push	8D7B8Ch
	push	eax
	call	6E0F80h
	add	esp,8h
	jmp	708EE4h

l0070A977:
	push	esi
	push	edi
	call	708210h
	push	0h
	push	ebx
	mov	[esp+28h],eax
	call	73B4E0h
	add	esp,10h
	add	dword ptr [esi],0FFh
	jnz	709C2Eh

l0070A996:
	mov	ecx,[esi+4h]
	push	esi
	jmp	709C26h

l0070A99F:
	mov	eax,[esp+30h]
	mov	edi,[eax+ebx*4+0Ch]
	mov	eax,[ebp-4h]
	mov	[esp+10h],edi
	call	7081C0h
	mov	[ebp+0h],eax
	add	ebp,4h
	test	eax,eax
	mov	[esp+14h],eax
	jnz	708F23h

l0070A9C5:
	jmp	708EE0h

l0070A9CA:
	push	eax
	call	6DEA90h
	add	esp,4h
	test	eax,eax
	mov	[esp+18h],eax
	jle	70A9E8h

l0070A9DB:
	mov	dword ptr [esp+18h],0h
	jmp	708F23h

l0070A9E8:
	cmp	dword ptr [esp+18h],0h
	jnz	708EE4h

l0070A9F3:
	jmp	708F1Dh

l0070A9F8:
	push	eax
	call	6DEA90h
	add	esp,4h
	test	eax,eax
	mov	[esp+18h],eax
	jle	709C2Eh

l0070AA0D:
	mov	dword ptr [esp+18h],0h
	jmp	708F1Dh

l0070AA1A:
	sub	ebp,4h
	jmp	708EE4h

l0070AA22:
	cmp	byte ptr [esi],5Ch
	jnz	708F23h

l0070AA2B:
	movzx	ebx,byte ptr [esi+2h]
	movzx	edx,byte ptr [esi+1h]
	shl	ebx,8h
	add	ebx,edx
	add	esi,3h
	mov	[esp+20h],esi

l0070AA3F:
	mov	esi,[ebp-4h]
	mov	eax,[esi+4h]
	sub	ebp,4h
	cmp	eax,0A16588h
	jnz	70AA7Dh

l0070AA4F:
	cmp	[esi+8h],ebx
	jnz	70AA7Dh

l0070AA54:
	test	ebx,ebx
	jz	70A715h

l0070AA5C:
	lea	esp,[esp+0h]

l0070AA60:
	mov	eax,[esi+ebx*4+8h]
	add	dword ptr [eax],1h
	sub	ebx,1h
	mov	[ebp+0h],eax
	add	ebp,4h
	test	ebx,ebx
	mov	[esp+10h],eax
	jnz	70AA60h

l0070AA78:
	jmp	70A715h

l0070AA7D:
	cmp	eax,0A1BAF0h
	jnz	70AAAAh

l0070AA84:
	cmp	[esi+8h],ebx
	jnz	70AAAAh

l0070AA89:
	test	ebx,ebx
	mov	ecx,[esi+0Ch]
	jz	70AACBh

l0070AA90:
	mov	eax,[ecx+ebx*4-4h]
	add	dword ptr [eax],1h
	sub	ebx,1h
	mov	[ebp+0h],eax
	add	ebp,4h
	test	ebx,ebx
	mov	[esp+10h],eax
	jnz	70AA90h

l0070AAA8:
	jmp	70AACBh

l0070AAAA:
	lea	ecx,[ebp+ebx*4+0h]
	mov	eax,esi
	mov	[esp+50h],ecx
	call	7072E0h
	test	eax,eax
	jz	70AAC3h

l0070AABD:
	mov	ebp,[esp+50h]
	jmp	70AACBh

l0070AAC3:
	mov	dword ptr [esp+1Ch],2h

l0070AACB:
	add	dword ptr [esi],0FFh
	jnz	708EE4h

l0070AAD4:
	mov	edx,[esi+4h]
	mov	eax,[edx+18h]
	push	esi
	call	eax
	add	esp,4h
	jmp	708EE4h

l0070AAE5:
	call	6E0FC0h
	test	eax,eax
	jz	70AB0Ah

l0070AAEE:
	mov	ecx,[0A16D00h]
	push	ecx
	call	6E1110h
	add	esp,4h
	test	eax,eax
	jz	708EE4h

l0070AB05:
	call	6E1160h

l0070AB0A:
	mov	eax,[ebp-4h]
	sub	ebp,4h
	add	dword ptr [eax],0FFh
	mov	[esp+14h],eax
	jnz	708F1Dh

l0070AB1D:
	mov	edx,[eax+4h]
	push	eax
	mov	eax,[edx+18h]
	call	eax
	add	esp,4h
	jmp	708F1Dh

l0070AB2E:
	mov	dword ptr [esp+1Ch],10h
	jmp	70B089h

l0070AB3B:
	push	ebx
	call	7050A0h
	add	esp,4h
	test	eax,eax
	mov	[esp+2Ch],eax
	jnz	70AB57h

l0070AB4C:
	xor	edi,edi
	mov	[esp+14h],edi
	jmp	708EE4h

l0070AB57:
	mov	dword ptr [esp+1Ch],20h
	jmp	70B089h

l0070AB64:
	mov	eax,[esp+70h]
	sub	ebx,[esp+38h]
	mov	edx,ebp
	sub	edx,[eax+20h]
	add	ebx,[esp+20h]
	sar	edx,2h
	push	edx
	push	ebx
	push	ecx
	push	eax
	call	73B240h
	add	esp,10h
	jmp	708F23h

l0070AB89:
	mov	esi,[ebp-8h]
	mov	eax,[esi+4h]
	cmp	eax,0A1E7E8h
	mov	edi,[ebp-4h]
	jz	70ABBFh

l0070AB99:
	push	0A1E7E8h
	push	eax
	call	6D5670h
	add	esp,8h
	test	eax,eax
	jnz	70ABBFh

l0070ABAB:
	cmp	esi,0A163B8h
	jz	70ABBFh

l0070ABB3:
	mov	eax,[ebp-0Ch]
	mov	ebx,[ebp-10h]
	mov	[esp+24h],eax
	jmp	70ABCAh

l0070ABBF:
	mov	ebx,0A163B8h
	mov	[esp+24h],ebx
	mov	esi,ebx

l0070ABCA:
	mov	ecx,[esp+24h]
	push	0h
	push	ebx
	push	ecx
	push	esi
	push	edi
	mov	[esp+24h],ebx
	call	703AF0h
	mov	edi,eax
	add	esp,14h
	test	edi,edi
	mov	[esp+14h],edi
	jz	708EE4h

l0070ABEE:
	cmp	esi,0A163B8h
	jz	70AC81h

l0070ABFA:
	push	edi
	call	6DEA90h
	add	esp,4h
	test	eax,eax
	jz	70AC81h

l0070AC07:
	add	dword ptr [edi],0FFh
	jnz	70AC18h

l0070AC0C:
	mov	edx,[edi+4h]
	mov	eax,[edx+18h]
	push	edi
	call	eax
	add	esp,4h

l0070AC18:
	mov	edi,[ebp-4h]
	add	dword ptr [0A163B8h],1h
	sub	ebp,0Ch
	mov	dword ptr [ebp-4h],0A163B8h
	add	dword ptr [edi],0FFh
	mov	[esp+14h],edi
	jnz	70AC41h

l0070AC35:
	mov	ecx,[edi+4h]
	mov	edx,[ecx+18h]
	push	edi
	call	edx
	add	esp,4h

l0070AC41:
	add	dword ptr [esi],0FFh
	jnz	70AC52h

l0070AC46:
	mov	eax,[esi+4h]
	mov	ecx,[eax+18h]
	push	esi
	call	ecx
	add	esp,4h

l0070AC52:
	mov	eax,[esp+24h]
	add	dword ptr [eax],0FFh
	jnz	70AC67h

l0070AC5B:
	mov	edx,[eax+4h]
	push	eax
	mov	eax,[edx+18h]
	call	eax
	add	esp,4h

l0070AC67:
	add	dword ptr [ebx],0FFh
	jnz	708EE4h

l0070AC70:
	mov	ecx,[ebx+4h]
	mov	edx,[ecx+18h]
	push	ebx
	call	edx
	add	esp,4h
	jmp	708EE4h

l0070AC81:
	add	dword ptr [edi],0FFh
	jnz	70AC92h

l0070AC86:
	mov	eax,[edi+4h]
	mov	ecx,[eax+18h]
	push	edi
	call	ecx
	add	esp,4h

l0070AC92:
	mov	edi,[ebp-4h]
	add	ebp,0FCh
	add	dword ptr [edi],0FFh
	mov	[esp+14h],edi
	jnz	708EE4h

l0070ACA5:
	mov	edx,[edi+4h]
	mov	eax,[edx+18h]
	push	edi
	call	eax
	add	esp,4h
	jmp	708EE4h

l0070ACB6:
	lea	ecx,[esp+54h]
	push	ecx
	mov	eax,ebx
	mov	[esp+58h],ebp
	call	708880h
	mov	edi,eax
	mov	eax,[esp+58h]
	add	esp,4h
	mov	[esp+14h],edi
	mov	[eax],edi
	lea	ebp,[eax+4h]
	jmp	7094E6h

l0070ACDD:
	movzx	eax,bh
	add	ecx,1h
	mov	edi,ebx
	and	ecx,3h
	and	edi,0FFh
	test	cl,1h
	mov	[esp+24h],eax
	mov	[esp+50h],ecx
	lea	eax,[edi+eax*2]
	jz	70AD01h

l0070ACFE:
	add	eax,1h

l0070AD01:
	test	cl,2h
	jz	70AD09h

l0070AD06:
	add	eax,1h

l0070AD09:
	lea	edx,[0004h+eax*4]
	mov	ebx,ebp
	sub	ebx,edx
	mov	esi,[ebx]
	cmp	dword ptr [esi+4h],0A1ED20h
	jnz	70AD5Ah

l0070AD1F:
	mov	edx,[esi+0Ch]
	test	edx,edx
	mov	[esp+58h],edx
	jz	70AD5Ah

l0070AD2A:
	add	dword ptr [edx],1h
	mov	esi,[esi+8h]
	add	dword ptr [esi],1h
	mov	eax,[ebx]
	add	dword ptr [eax],0FFh
	mov	eax,[ebx]
	cmp	dword ptr [eax],0h
	jnz	70AD53h

l0070AD3F:
	mov	ecx,[eax+4h]
	mov	edx,[ecx+18h]
	push	eax
	call	edx
	mov	edx,[esp+5Ch]
	mov	ecx,[esp+54h]
	add	esp,4h

l0070AD53:
	mov	[ebx],edx
	add	edi,1h
	jmp	70AD5Dh

l0070AD5A:
	add	dword ptr [esi],1h

l0070AD5D:
	mov	eax,[esp+24h]
	push	eax
	push	edi
	push	ecx
	push	esi
	lea	eax,[esp+68h]
	mov	[esp+68h],ebp
	call	707BD0h
	mov	ebp,[esp+68h]
	add	esp,10h
	add	dword ptr [esi],0FFh
	mov	edi,eax
	mov	[esp+14h],edi
	jnz	70AD90h

l0070AD84:
	mov	ecx,[esi+4h]
	mov	edx,[ecx+18h]
	push	esi
	call	edx
	add	esp,4h

l0070AD90:
	cmp	ebp,ebx
	jbe	70ADB3h

l0070AD94:
	mov	eax,[ebp-4h]
	sub	ebp,4h
	add	dword ptr [eax],0FFh
	mov	[esp+10h],eax
	jnz	70ADAFh

l0070ADA3:
	mov	ecx,[eax+4h]
	mov	edx,[ecx+18h]
	push	eax
	call	edx
	add	esp,4h

l0070ADAF:
	cmp	ebp,ebx
	ja	70AD94h

l0070ADB3:
	mov	[ebp+0h],edi
	add	ebp,4h
	jmp	7094E6h

l0070ADBE:
	mov	eax,[esp+70h]
	mov	ecx,[eax+18h]
	mov	esi,[ebp-4h]
	sub	ebp,4h
	push	ecx
	push	esi
	call	725010h
	add	esp,8h
	add	dword ptr [esi],0FFh
	mov	edi,eax
	mov	[esp+14h],edi
	jnz	70ADECh

l0070ADE0:
	mov	edx,[esi+4h]
	mov	eax,[edx+18h]
	push	esi
	call	eax
	add	esp,4h

l0070ADEC:
	test	edi,edi
	jz	70AE65h

l0070ADF0:
	test	ebx,ebx
	jle	70AE65h

l0070ADF4:
	push	ebx
	call	6DFD20h
	mov	esi,eax
	add	esp,4h
	test	esi,esi
	jnz	70AE23h

l0070AE03:
	add	dword ptr [edi],0FFh
	jnz	70A8FAh

l0070AE0C:
	mov	ecx,[edi+4h]
	mov	edx,[ecx+18h]
	push	edi
	call	edx
	add	esp,4h
	xor	edi,edi
	mov	[esp+14h],edi
	jmp	708EE4h

l0070AE23:
	sub	ebx,1h
	js	70AE46h

l0070AE28:
	lea	eax,[esi+ebx*4+0Ch]
	lea	esp,[esp+0h]

l0070AE30:
	mov	ecx,[ebp-4h]
	sub	ebp,4h
	mov	[eax],ecx
	sub	ebx,1h
	sub	eax,4h
	test	ebx,ebx
	mov	[esp+10h],ecx
	jge	70AE30h

l0070AE46:
	push	esi
	push	edi
	call	725150h
	add	esp,8h
	add	dword ptr [esi],0FFh
	mov	[esp+18h],eax
	jnz	70AE65h

l0070AE59:
	mov	eax,[esi+4h]
	mov	ecx,[eax+18h]
	push	esi
	call	ecx
	add	esp,4h

l0070AE65:
	mov	[ebp+0h],edi
	add	ebp,4h
	jmp	708EE4h

l0070AE70:
	mov	edx,[esp+70h]
	mov	eax,[edx+18h]
	mov	esi,[ebp-4h]
	sub	ebp,4h
	push	eax
	push	esi
	call	725010h
	add	esp,8h
	add	dword ptr [esi],0FFh
	mov	edi,eax
	mov	[esp+14h],edi
	jnz	70AE9Eh

l0070AE92:
	mov	ecx,[esi+4h]
	mov	edx,[ecx+18h]
	push	esi
	call	edx
	add	esp,4h

l0070AE9E:
	test	edi,edi
	jz	70AE65h

l0070AEA2:
	mov	esi,[ebp-4h]
	sub	ebp,4h
	push	esi
	push	edi
	call	7251F0h
	add	esp,8h
	add	dword ptr [esi],0FFh
	mov	[esp+18h],eax
	jnz	70AEC7h

l0070AEBB:
	mov	eax,[esi+4h]
	mov	ecx,[eax+18h]
	push	esi
	call	ecx
	add	esp,4h

l0070AEC7:
	test	ebx,ebx
	jle	70AE65h

l0070AECB:
	push	ebx
	call	6DFD20h
	mov	esi,eax
	add	esp,4h
	test	esi,esi
	jnz	70AEFAh

l0070AEDA:
	add	dword ptr [edi],0FFh
	jnz	70A8FAh

l0070AEE3:
	mov	edx,[edi+4h]
	mov	eax,[edx+18h]
	push	edi
	call	eax
	add	esp,4h
	xor	edi,edi
	mov	[esp+14h],edi
	jmp	708EE4h

l0070AEFA:
	sub	ebx,1h
	js	70AF19h

l0070AEFF:
	lea	eax,[esi+ebx*4+0Ch]

l0070AF03:
	mov	ecx,[ebp-4h]
	sub	ebp,4h
	mov	[eax],ecx
	sub	ebx,1h
	sub	eax,4h
	test	ebx,ebx
	mov	[esp+10h],ecx
	jge	70AF03h

l0070AF19:
	push	esi
	push	edi
	call	725150h
	add	esp,8h
	add	dword ptr [esi],0FFh
	mov	[esp+18h],eax
	jnz	70AE65h

l0070AF30:
	mov	ecx,[esi+4h]
	mov	edx,[ecx+18h]
	push	esi
	call	edx
	add	esp,4h
	mov	[ebp+0h],edi
	add	ebp,4h
	jmp	708EE4h

l0070AF47:
	cmp	ebx,3h
	jnz	70AF58h

l0070AF4C:
	mov	eax,[ebp-4h]
	sub	ebp,4h
	mov	[esp+10h],eax
	jmp	70AF60h

l0070AF58:
	mov	dword ptr [esp+10h],0h

l0070AF60:
	mov	ecx,[esp+10h]
	mov	ebx,[ebp-4h]
	mov	esi,[ebp-8h]
	sub	ebp,4h
	push	ecx
	push	ebx
	push	esi
	call	72F1E0h
	add	esp,0Ch
	add	dword ptr [esi],0FFh
	mov	edi,eax
	mov	[esp+14h],edi
	jnz	70AF8Fh

l0070AF83:
	mov	edx,[esi+4h]
	mov	eax,[edx+18h]
	push	esi
	call	eax
	add	esp,4h

l0070AF8F:
	add	dword ptr [ebx],0FFh
	jnz	70AFA0h

l0070AF94:
	mov	ecx,[ebx+4h]
	mov	edx,[ecx+18h]
	push	ebx
	call	edx
	add	esp,4h

l0070AFA0:
	mov	eax,[esp+10h]
	test	eax,eax
	jz	7094E3h

l0070AFAC:
	add	dword ptr [eax],0FFh
	jnz	7094E3h

l0070AFB5:
	mov	ecx,[eax+4h]
	mov	edx,[ecx+18h]
	push	eax
	call	edx
	jmp	7094E0h

l0070AFC3:
	mov	eax,[esp+70h]
	mov	edx,[eax+10h]
	push	ecx
	mov	ecx,[eax+3Ch]
	push	ecx
	push	edx
	call	735550h
	add	esp,8h
	push	eax
	push	8D7B70h
	call	dword ptr [8A46CCh]
	add	eax,40h
	push	eax
	call	dword ptr [8A45E0h]
	mov	eax,[0A18720h]
	push	8D7B60h
	push	eax
	call	6E0F80h
	mov	dword ptr [esp+34h],2h
	mov	ebx,[esp+34h]
	add	esp,18h
	jmp	70B019h

l0070B00F:
	cmp	ebx,2h
	jz	70B019h

l0070B014:
	cmp	ebx,4h
	jnz	70B044h

l0070B019:
	call	6E0FC0h
	test	eax,eax
	jnz	70B044h

l0070B022:
	mov	ecx,[0A18720h]
	push	8D7B3Ch
	push	ecx
	call	6E0F80h
	mov	dword ptr [esp+24h],2h
	mov	ebx,[esp+24h]
	add	esp,8h
	jmp	70B049h

l0070B044:
	cmp	ebx,2h
	jnz	70B071h

l0070B049:
	mov	esi,[esp+70h]
	push	esi
	call	72F7F0h
	mov	ecx,[esp+2Ch]
	mov	eax,[ecx+1Ch]
	add	esp,4h
	test	eax,eax
	jz	70B08Dh

l0070B061:
	mov	edx,[ecx+24h]
	push	esi
	push	edx
	push	eax
	call	708590h
	add	esp,0Ch
	jmp	70B08Dh

l0070B071:
	cmp	ebx,4h
	jnz	70B080h

l0070B076:
	mov	dword ptr [esp+1Ch],2h
	jmp	70B089h

l0070B080:
	cmp	ebx,1h
	jz	708F23h

l0070B089:
	mov	ebx,[esp+1Ch]

l0070B08D:
	mov	edi,[esp+70h]

l0070B091:
	cmp	dword ptr [edi+44h],0h
	jle	70B239h

l0070B09B:
	push	edi
	call	73B280h
	mov	esi,eax
	add	esp,4h
	cmp	dword ptr [esi],78h
	jnz	70B0B0h

l0070B0AB:
	cmp	ebx,20h
	jz	70B109h

l0070B0B0:
	mov	eax,ebp
	sub	eax,[edi+20h]
	sar	eax,2h
	cmp	eax,[esi+8h]
	jle	70B0E8h

l0070B0BD:
	lea	ecx,[ecx+0h]

l0070B0C0:
	mov	eax,[ebp-4h]
	sub	ebp,4h
	test	eax,eax
	jz	70B0DBh

l0070B0CA:
	add	dword ptr [eax],0FFh
	jnz	70B0DBh

l0070B0CF:
	mov	ecx,[eax+4h]
	mov	edx,[ecx+18h]
	push	eax
	call	edx
	add	esp,4h

l0070B0DB:
	mov	eax,ebp
	sub	eax,[edi+20h]
	sar	eax,2h
	cmp	eax,[esi+8h]
	jg	70B0C0h

l0070B0E8:
	mov	eax,[esi]
	cmp	eax,78h
	jnz	70B0F8h

l0070B0EF:
	cmp	ebx,10h
	jz	70B206h

l0070B0F8:
	cmp	eax,7Ah
	jz	70B14Eh

l0070B0FD:
	cmp	eax,79h
	jnz	70B091h

l0070B102:
	cmp	ebx,2h
	jnz	70B091h

l0070B107:
	jmp	70B157h

l0070B109:
	mov	ecx,[esi+8h]
	mov	edx,[esi+4h]
	mov	eax,[esi]
	push	ecx
	push	edx
	push	eax
	push	edi
	call	73B240h
	mov	ecx,[esp+3Ch]
	mov	eax,[ecx+8h]
	add	eax,[esp+48h]
	add	esp,10h
	add	dword ptr [ecx],0FFh
	mov	dword ptr [esp+1Ch],1h
	mov	[esp+20h],eax
	jnz	708F23h

l0070B13D:
	mov	edx,[ecx+4h]
	mov	eax,[edx+18h]
	push	ecx
	call	eax
	add	esp,4h
	jmp	708F23h

l0070B14E:
	cmp	ebx,2h
	jnz	70B1E8h

l0070B157:
	lea	ecx,[esp+48h]
	push	ecx
	lea	edx,[esp+40h]
	push	edx
	lea	eax,[esp+54h]
	push	eax
	call	6E1130h
	add	esp,0Ch
	cmp	dword ptr [esp+3Ch],0h
	jnz	70B184h

l0070B175:
	add	dword ptr [0A163B8h],1h
	mov	dword ptr [esp+3Ch],0A163B8h

l0070B184:
	cmp	dword ptr [esi],79h
	jnz	70B1B7h

l0070B189:
	lea	ecx,[esp+48h]
	push	ecx
	lea	edx,[esp+40h]
	push	edx
	lea	eax,[esp+54h]
	push	eax
	call	6E1BD0h
	mov	ecx,[esp+54h]
	mov	edx,[esp+48h]
	mov	edi,[esp+58h]
	mov	eax,[esp+34h]
	push	ecx
	push	edx
	call	706E30h
	add	esp,14h

l0070B1B7:
	mov	eax,[esp+48h]
	test	eax,eax
	jnz	70B1CFh

l0070B1BF:
	add	dword ptr [0A163B8h],1h
	mov	dword ptr [ebp+0h],0A163B8h
	jmp	70B1D2h

l0070B1CF:
	mov	[ebp+0h],eax

l0070B1D2:
	mov	eax,[esp+3Ch]
	mov	ecx,[esp+4Ch]
	add	ebp,4h
	mov	[ebp+0h],eax
	add	ebp,4h
	mov	[ebp+0h],ecx
	jmp	70B203h

l0070B1E8:
	test	bl,28h
	jz	70B1F7h

l0070B1ED:
	mov	edx,[esp+2Ch]
	mov	[ebp+0h],edx
	add	ebp,4h

l0070B1F7:
	push	ebx
	call	7050A0h
	add	esp,4h
	mov	[ebp+0h],eax

l0070B203:
	add	ebp,4h

l0070B206:
	mov	esi,[esi+4h]
	add	esi,[esp+38h]
	mov	dword ptr [esp+1Ch],1h
	jmp	708F1Fh

l0070B21A:
	mov	eax,[ebp-4h]
	mov	ecx,[esp+70h]
	sub	ebp,4h
	mov	dword ptr [esp+1Ch],40h
	mov	ebx,[esp+1Ch]
	mov	[esp+2Ch],eax
	mov	[ecx+24h],ebp
	jmp	70B27Ah

l0070B239:
	mov	edx,ebp
	sub	edx,[edi+20h]
	test	edx,0FFFFFFFCh
	jz	70B26Dh

l0070B246:
	mov	eax,[ebp-4h]
	sub	ebp,4h
	test	eax,eax
	jz	70B261h

l0070B250:
	add	dword ptr [eax],0FFh
	jnz	70B261h

l0070B255:
	mov	ecx,[eax+4h]
	mov	edx,[ecx+18h]
	push	eax
	call	edx
	add	esp,4h

l0070B261:
	mov	eax,ebp
	sub	eax,[edi+20h]
	test	eax,0FFFFFFFCh
	jnz	70B246h

l0070B26D:
	cmp	ebx,8h
	jz	70B27Ah

l0070B272:
	mov	dword ptr [esp+2Ch],0h

l0070B27A:
	mov	edi,[esp+28h]
	cmp	dword ptr [edi+14h],0h
	pop	ebp
	jz	70B372h

l0070B289:
	mov	eax,[edi+1Ch]
	test	eax,eax
	jz	70B2BAh

l0070B290:
	cmp	ebx,8h
	jz	70B2F0h

l0070B295:
	cmp	ebx,40h
	jz	70B2F0h

l0070B29A:
	cmp	ebx,2h
	jnz	70B2BAh

l0070B29F:
	push	0h
	mov	ecx,edi
	mov	edx,[ecx+24h]
	mov	edi,[esp+70h]
	push	3h
	push	edx
	push	eax
	call	7086B0h
	mov	edi,[esp+34h]
	add	esp,10h

l0070B2BA:
	mov	esi,[esp+28h]

l0070B2BE:
	mov	eax,[edi+18h]
	test	eax,eax
	jz	70B372h

l0070B2C9:
	cmp	ebx,2h
	jnz	70B339h

l0070B2CE:
	mov	ecx,[esp+24h]
	mov	edx,[ecx+20h]
	mov	edi,[esp+6Ch]
	push	0h
	push	3h
	push	edx
	push	eax
	call	7086B0h
	mov	edi,[esp+34h]
	add	esp,10h
	jmp	70B372h

l0070B2F0:
	mov	ecx,[edi+24h]
	mov	esi,[esp+28h]
	push	ecx
	push	eax
	mov	eax,[esp+74h]
	mov	ecx,esi
	mov	edx,3h
	call	7073E0h
	add	esp,8h
	test	eax,eax
	jz	70B2BEh

l0070B310:
	test	esi,esi
	jz	70B325h

l0070B314:
	add	dword ptr [esi],0FFh
	jnz	70B325h

l0070B319:
	mov	edx,[esi+4h]
	mov	eax,[edx+18h]
	push	esi
	call	eax
	add	esp,4h

l0070B325:
	xor	esi,esi
	mov	dword ptr [esp+18h],2h
	mov	ebx,[esp+18h]
	mov	[esp+28h],esi
	jmp	70B2BEh

l0070B339:
	mov	ecx,[edi+20h]
	push	ecx
	push	eax
	mov	eax,[esp+74h]
	mov	ecx,esi
	mov	edx,3h
	call	7073E0h
	add	esp,8h
	test	eax,eax
	jz	70B372h

l0070B355:
	test	esi,esi
	jz	70B36Ah

l0070B359:
	add	dword ptr [esi],0FFh
	jnz	70B36Ah

l0070B35E:
	mov	edx,[esi+4h]
	mov	eax,[edx+18h]
	push	esi
	call	eax
	add	esp,4h

l0070B36A:
	mov	dword ptr [esp+28h],0h

l0070B372:
	mov	ecx,[edi+8h]
	cmp	dword ptr [ecx+2Ch],0h
	jz	70B382h

l0070B37B:
	mov	eax,edi
	call	706F10h

l0070B382:
	mov	eax,[0A6D67Ch]
	add	dword ptr [eax+0Ch],0FFh
	mov	edx,[esp+6Ch]
	mov	eax,[edx+0Ch]
	mov	ecx,[esp+24h]
	pop	edi
	pop	esi
	mov	[ecx+8h],eax
	mov	eax,[esp+20h]
	pop	ebx
	add	esp,5Ch
	ret
l0070B3A4	dd	0x00709397
l0070B3A8	dd	0x0070914D
l0070B3AC	dd	0x00709162
l0070B3B0	dd	0x007091A6
l0070B3B4	dd	0x00709181
l0070B3B8	dd	0x00709030
l0070B3BC	dd	0x007094C0
l0070B3C0	dd	0x007094F3
l0070B3C4	dd	0x00709526
l0070B3C8	dd	0x00709585
l0070B3CC	dd	0x00709593
l0070B3D0	dd	0x00709899
l0070B3D4	dd	0x007095BC
l0070B3D8	dd	0x00709601
l0070B3DC	dd	0x00709646
l0070B3E0	dd	0x007096C9
l0070B3E4	dd	0x007096DF
l0070B3E8	dd	0x00709764
l0070B3EC	dd	0x007097BC
l0070B3F0	dd	0x007096B0
l0070B3F4	dd	0x00709694
l0070B3F8	dd	0x00709982
l0070B3FC	dd	0x00709966
l0070B400	dd	0x00709AFB
l0070B404	dd	0x00709B87
l0070B408	dd	0x00709C3E
l0070B40C	dd	0x007099B4
l0070B410	dd	0x00709A20
l0070B414	dd	0x0070992B
l0070B418	dd	0x00709944
l0070B41C	dd	0x0070999B
l0070B420	dd	0x00709CAD
l0070B424	dd	0x00709CF7
l0070B428	dd	0x00709816
l0070B42C	dd	0x0070982F
l0070B430	dd	0x0070984B
l0070B434	dd	0x00709864
l0070B438	dd	0x0070987D
l0070B43C	dd	0x0070990D
l0070B440	dd	0x007093CD
l0070B444	dd	0x00709D3A
l0070B448	dd	0x00709DFF
l0070B44C	dd	0x00709F96
l0070B450	dd	0x00709DEF
l0070B454	dd	0x00709F88
l0070B458	dd	0x00709A78
l0070B45C	dd	0x00709A91
l0070B460	dd	0x00709AAD
l0070B464	dd	0x00709AC6
l0070B468	dd	0x00709ADF
l0070B46C	dd	0x0070AB2E
l0070B470	dd	0x0070AB89
l0070B474	dd	0x0070A07E
l0070B478	dd	0x0070A0B4
l0070B47C	dd	0x0070A941
l0070B480	dd	0x0070A0CB
l0070B484	dd	0x0070B21A
l0070B488	dd	0x0070A133
l0070B48C	dd	0x0070A17C
l0070B490	dd	0x0070A280
l0070B494	dd	0x0070A2CF
l0070B498	dd	0x0070A343
l0070B49C	dd	0x0070AA3F
l0070B4A0	dd	0x0070941E
l0070B4A4	dd	0x0070A3B0
l0070B4A8	dd	0x0070A3D5
l0070B4AC	dd	0x0070A3FC
l0070B4B0	dd	0x0070A444
l0070B4B4	dd	0x007091B7
l0070B4B8	dd	0x00709133
l0070B4BC	dd	0x0070A477
l0070B4C0	dd	0x0070A72F
l0070B4C4	dd	0x0070A771
l0070B4C8	dd	0x0070A7B1
l0070B4CC	dd	0x0070A7C7
l0070B4D0	dd	0x00709212
l0070B4D4	dd	0x0070A7FD
l0070B4D8	dd	0x0070A99F
l0070B4DC	dd	0x00709335
l0070B4E0	dd	0x0070933E
l0070B4E4	dd	0x00709371
l0070B4E8	dd	0x007098FE
l0070B4EC	dd	0x0070A54F
l0070B4F0	dd	0x0070AB3B
l0070B4F4	dd	0x0070AB64
l0070B4F8	dd	0x0070910E
l0070B4FC	dd	0x00709462
l0070B500	dd	0x0070A618
l0070B504	dd	0x0070A01A
l0070B508	dd	0x0070ACB6
l0070B50C	dd	0x0070ADBE
l0070B510	dd	0x0070AF47
l0070B514	dd	0x0070AE70
l0070B518	dd	0x0070A654
l0070B51C	dd	0x0070A66D
l0070B520	dd	0x0070A6F6
l0070B524	dd	0x0070ACDD
l0070B528	dd	0x007090EC
l0070B52C	dd	0x0070AFC3
l0070B530	db	0x00
l0070B531	db	0x01
l0070B532	db	0x02
l0070B533	db	0x03
l0070B534	db	0x04
l0070B535	db	0x62
l0070B536	db	0x62
l0070B537	db	0x62
l0070B538	db	0x05
l0070B539	db	0x06
l0070B53A	db	0x07
l0070B53B	db	0x08
l0070B53C	db	0x09
l0070B53D	db	0x62
l0070B53E	db	0x0A
l0070B53F	db	0x62
l0070B540	db	0x62
l0070B541	db	0x0B
l0070B542	db	0x0C
l0070B543	db	0x0D
l0070B544	db	0x0E
l0070B545	db	0x0F
l0070B546	db	0x10
l0070B547	db	0x11
l0070B548	db	0x12
l0070B549	db	0x13
l0070B54A	db	0x14
l0070B54B	db	0x15
l0070B54C	db	0x16
l0070B54D	db	0x17
l0070B54E	db	0x17
l0070B54F	db	0x17
l0070B550	db	0x17
l0070B551	db	0x62
l0070B552	db	0x62
l0070B553	db	0x62
l0070B554	db	0x62
l0070B555	db	0x62
l0070B556	db	0x62
l0070B557	db	0x18
l0070B558	db	0x18
l0070B559	db	0x18
l0070B55A	db	0x18
l0070B55B	db	0x62
l0070B55C	db	0x62
l0070B55D	db	0x62
l0070B55E	db	0x62
l0070B55F	db	0x62
l0070B560	db	0x62
l0070B561	db	0x19
l0070B562	db	0x19
l0070B563	db	0x19
l0070B564	db	0x19
l0070B565	db	0x62
l0070B566	db	0x1A
l0070B567	db	0x1B
l0070B568	db	0x1C
l0070B569	db	0x1D
l0070B56A	db	0x1E
l0070B56B	db	0x1F
l0070B56C	db	0x20
l0070B56D	db	0x21
l0070B56E	db	0x22
l0070B56F	db	0x23
l0070B570	db	0x24
l0070B571	db	0x25
l0070B572	db	0x26
l0070B573	db	0x27
l0070B574	db	0x62
l0070B575	db	0x28
l0070B576	db	0x29
l0070B577	db	0x2A
l0070B578	db	0x2B
l0070B579	db	0x2C
l0070B57A	db	0x2D
l0070B57B	db	0x2E
l0070B57C	db	0x2F
l0070B57D	db	0x30
l0070B57E	db	0x31
l0070B57F	db	0x32
l0070B580	db	0x33
l0070B581	db	0x34
l0070B582	db	0x35
l0070B583	db	0x36
l0070B584	db	0x37
l0070B585	db	0x38
l0070B586	db	0x39
l0070B587	db	0x3A
l0070B588	db	0x3B
l0070B589	db	0x3C
l0070B58A	db	0x3D
l0070B58B	db	0x3E
l0070B58C	db	0x3F
l0070B58D	db	0x62
l0070B58E	db	0x40
l0070B58F	db	0x41
l0070B590	db	0x42
l0070B591	db	0x43
l0070B592	db	0x44
l0070B593	db	0x45
l0070B594	db	0x46
l0070B595	db	0x47
l0070B596	db	0x48
l0070B597	db	0x49
l0070B598	db	0x4A
l0070B599	db	0x4B
l0070B59A	db	0x4C
l0070B59B	db	0x4D
l0070B59C	db	0x62
l0070B59D	db	0x4E
l0070B59E	db	0x4F
l0070B59F	db	0x50
l0070B5A0	db	0x51
l0070B5A1	db	0x62
l0070B5A2	db	0x62
l0070B5A3	db	0x52
l0070B5A4	db	0x62
l0070B5A5	db	0x62
l0070B5A6	db	0x53
l0070B5A7	db	0x54
l0070B5A8	db	0x54
l0070B5A9	db	0x54
l0070B5AA	db	0x62
l0070B5AB	db	0x55
l0070B5AC	db	0x56
l0070B5AD	db	0x57
l0070B5AE	db	0x62
l0070B5AF	db	0x62
l0070B5B0	db	0x62
l0070B5B1	db	0x58
l0070B5B2	db	0x59
l0070B5B3	db	0x5A
l0070B5B4	db	0x5B
l0070B5B5	db	0x5C
l0070B5B6	db	0x5D
l0070B5B7	db	0x5E
l0070B5B8	db	0x5F
l0070B5B9	db	0x62
l0070B5BA	db	0x62
l0070B5BB	db	0x60
l0070B5BC	db	0x60
l0070B5BD	db	0x60
l0070B5BE	db	0x61
0070B5BF                                              90                .
l0070B5C0	dd	0x00709248
l0070B5C4	dd	0x00709253
l0070B5C8	dd	0x0070925E
l0070B5CC	dd	0x00709269
l0070B5D0	dd	0x00709274
l0070B5D4	dd	0x0070927F
l0070B5D8	dd	0x007092AD
l0070B5DC	dd	0x007092AD
l0070B5E0	dd	0x0070928A
l0070B5E4	dd	0x00709293
l0070B5E8	dd	0x0070A046
l0070B5EC	dd	0x0070A03C
l0070B5F0	dd	0x0070A036
l0070B5F4	dd	0x0070A030
0070B5F8                         CC CC CC CC CC CC CC CC         ........

;; fn0070B600: 0070B600
;;   Called from:
;;     0070793A (in fn00707850)
;;     0070BCAD (in fn0070BC90)
fn0070B600 proc
	sub	esp,18h
	mov	eax,[esp+20h]
	test	eax,eax
	mov	ecx,[0A6D67Ch]
	mov	dword ptr [esp+0Ch],0h
	mov	[esp+14h],ecx
	jnz	70B636h

l0070B61D:
	mov	eax,[0A18720h]
	push	8D7E98h
	push	eax
	call	6E0F80h
	add	esp,8h
	xor	eax,eax
	add	esp,18h
	ret

l0070B636:
	mov	edx,[esp+24h]
	push	edi
	mov	edi,[esp+20h]
	push	edx
	push	eax
	push	edi
	push	ecx
	call	73AFB0h
	add	esp,10h
	test	eax,eax
	mov	[esp+24h],eax
	jnz	70B658h

l0070B653:
	pop	edi
	add	esp,18h
	ret

l0070B658:
	cmp	dword ptr [edi+8h],0h
	mov	ecx,[edi+0Ch]
	push	ebx
	push	ebp
	lea	edx,[eax+ecx*4+138h]
	push	esi
	lea	esi,[eax+138h]
	mov	[esp+20h],edx
	jg	70B6B8h

l0070B675:
	test	byte ptr [edi+14h],0Ch
	jnz	70B6B8h

l0070B67B:
	mov	eax,[esp+3Ch]
	test	eax,eax
	mov	ecx,[esp+44h]
	jg	70B68Fh

l0070B687:
	test	ecx,ecx
	jle	70BAA6h

l0070B68F:
	add	eax,ecx
	push	eax
	mov	eax,[edi+34h]
	push	eax
	call	6ECC50h
	mov	ecx,[0A16B7Ch]
	add	esp,4h
	push	eax
	push	8D79A8h
	push	ecx
	call	6E15D0h
	add	esp,10h
	jmp	70BC5Eh

l0070B6B8:
	test	byte ptr [edi+14h],8h
	mov	ebx,[esp+3Ch]
	mov	ebp,ebx
	mov	[esp+10h],ebp
	mov	dword ptr [esp+18h],0h
	jz	70B70Ah

l0070B6D0:
	call	6FDCC0h
	mov	edx,eax
	test	edx,edx
	mov	[esp+18h],edx
	jz	70BC5Eh

l0070B6E3:
	test	byte ptr [edi+14h],4h
	mov	ecx,[edi+8h]
	jz	70B6EFh

l0070B6EC:
	add	ecx,1h

l0070B6EF:
	mov	eax,[esi+ecx*4]
	test	eax,eax
	mov	[esi+ecx*4],edx
	jz	70B70Ah

l0070B6F9:
	add	dword ptr [eax],0FFh
	jnz	70B70Ah

l0070B6FE:
	mov	edx,[eax+4h]
	push	eax
	mov	eax,[edx+18h]
	call	eax
	add	esp,4h

l0070B70A:
	mov	eax,[edi+8h]
	cmp	ebx,eax
	jle	70B779h

l0070B711:
	test	byte ptr [edi+14h],4h
	jnz	70B773h

l0070B717:
	cmp	eax,1h
	mov	esi,8A698Fh
	jz	70B726h

l0070B721:
	mov	esi,8B22ACh

l0070B726:
	cmp	dword ptr [esp+44h],0h
	mov	edx,8D7E88h
	jnz	70B737h

l0070B732:
	mov	edx,8A698Fh

l0070B737:
	cmp	dword ptr [esp+4Ch],0h
	mov	ecx,8D3C28h
	jnz	70B748h

l0070B743:
	mov	ecx,8D3C3Ch

l0070B748:
	push	ebx
	push	esi
	push	edx
	push	eax
	push	ecx
	mov	ecx,[edi+34h]
	push	ecx
	call	6ECC50h
	mov	edx,[0A16B7Ch]
	add	esp,4h
	push	eax
	push	8D7E58h
	push	edx
	call	6E15D0h
	add	esp,20h
	jmp	70BC5Eh

l0070B773:
	mov	ebp,eax
	mov	[esp+10h],eax

l0070B779:
	test	ebp,ebp
	jle	70B7AEh

l0070B77D:
	mov	edi,[esp+38h]
	mov	ebp,[esp+10h]
	sub	edi,esi

l0070B787:
	mov	eax,[edi+esi]
	add	dword ptr [eax],1h
	mov	ecx,[esi]
	test	ecx,ecx
	mov	[esi],eax
	jz	70B7A6h

l0070B795:
	add	dword ptr [ecx],0FFh
	jnz	70B7A6h

l0070B79A:
	mov	eax,[ecx+4h]
	push	ecx
	mov	ecx,[eax+18h]
	call	ecx
	add	esp,4h

l0070B7A6:
	add	esi,4h
	sub	ebp,1h
	jnz	70B787h

l0070B7AE:
	mov	edx,[esp+2Ch]
	test	byte ptr [edx+14h],4h
	mov	edi,[esp+10h]
	jz	70B824h

l0070B7BC:
	mov	eax,ebx
	sub	eax,edi
	push	eax
	call	6DFD20h
	mov	esi,eax
	add	esp,4h
	test	esi,esi
	jz	70BC5Eh

l0070B7D3:
	mov	ecx,[esp+2Ch]
	mov	edx,[ecx+8h]
	mov	ebp,[esp+30h]
	lea	eax,[ebp+138h]
	mov	ecx,[eax+edx*4]
	test	ecx,ecx
	lea	eax,[eax+edx*4]
	mov	[eax],esi
	jz	70B801h

l0070B7F0:
	add	dword ptr [ecx],0FFh
	jnz	70B801h

l0070B7F5:
	mov	eax,[ecx+4h]
	push	ecx
	mov	ecx,[eax+18h]
	call	ecx
	add	esp,4h

l0070B801:
	cmp	edi,ebx
	mov	ecx,edi
	jge	70B828h

l0070B807:
	lea	edx,[esi+0Ch]
	mov	esi,[esp+38h]
	mov	edi,edi

l0070B810:
	mov	eax,[esi+ecx*4]
	add	dword ptr [eax],1h
	mov	[edx],eax
	add	ecx,1h
	add	edx,4h
	cmp	ecx,ebx
	jl	70B810h

l0070B822:
	jmp	70B828h

l0070B824:
	mov	ebp,[esp+30h]

l0070B828:
	cmp	dword ptr [esp+44h],0h
	mov	dword ptr [esp+14h],0h
	jle	70B933h

l0070B83B:
	mov	edi,[esp+2Ch]
	mov	eax,[esp+14h]

l0070B843:
	mov	ecx,[esp+40h]
	mov	ebp,[ecx+eax*8]
	test	ebp,ebp
	mov	ebx,[ecx+eax*8+4h]
	jz	70B9DAh

l0070B856:
	mov	eax,[ebp+4h]
	cmp	eax,0A1B450h
	jz	70B876h

l0070B860:
	push	0A1B450h
	push	eax
	call	6D5670h
	add	esp,8h
	test	eax,eax
	jz	70B9DAh

l0070B876:
	xor	esi,esi
	cmp	[edi+8h],esi
	jle	70B8B1h

l0070B87D:
	mov	edi,0Ch

l0070B882:
	mov	edx,[esp+2Ch]
	mov	eax,[edx+24h]
	mov	eax,[edi+eax]
	push	2h
	push	eax
	push	ebp
	call	6DF5A0h
	add	esp,0Ch
	test	eax,eax
	jg	70B8B1h

l0070B89C:
	jl	70BC5Eh

l0070B8A2:
	mov	ecx,[esp+2Ch]
	add	esi,1h
	add	edi,4h
	cmp	esi,[ecx+8h]
	jl	70B882h

l0070B8B1:
	call	6E0FC0h
	test	eax,eax
	jnz	70BC5Eh

l0070B8BE:
	mov	edi,[esp+2Ch]
	cmp	esi,[edi+8h]
	jl	70B8E0h

l0070B8C7:
	mov	eax,[esp+18h]
	test	eax,eax
	jz	70B97Ah

l0070B8D3:
	push	ebx
	push	ebp
	push	eax
	call	6FBD90h
	add	esp,0Ch
	jmp	70B912h

l0070B8E0:
	mov	ecx,[esp+30h]
	add	ecx,138h
	cmp	dword ptr [ecx+esi*4],0h
	jnz	70B9AAh

l0070B8F4:
	add	dword ptr [ebx],1h
	mov	eax,[ecx+esi*4]
	test	eax,eax
	mov	[ecx+esi*4],ebx
	jz	70B912h

l0070B901:
	add	dword ptr [eax],0FFh
	jnz	70B912h

l0070B906:
	mov	edx,[eax+4h]
	push	eax
	mov	eax,[edx+18h]
	call	eax
	add	esp,4h

l0070B912:
	mov	eax,[esp+14h]
	add	eax,1h
	cmp	eax,[esp+44h]
	mov	[esp+14h],eax
	jl	70B843h

l0070B927:
	mov	ebx,[esp+3Ch]
	mov	ebp,[esp+30h]
	mov	edi,[esp+10h]

l0070B933:
	mov	ecx,[esp+2Ch]
	mov	eax,[ecx+8h]
	cmp	ebx,eax
	jge	70BAA6h

l0070B942:
	mov	esi,[esp+4Ch]
	sub	eax,esi
	cmp	ebx,eax
	mov	ecx,ebx
	jge	70B96Bh

l0070B94E:
	mov	edi,edi

l0070B950:
	cmp	dword ptr [ebp+ecx*4+138h],0h
	lea	edx,[ebp+138h]
	jz	70B9FCh

l0070B964:
	add	ecx,1h
	cmp	ecx,eax
	jl	70B950h

l0070B96B:
	cmp	edi,eax
	jle	70BA61h

l0070B973:
	sub	edi,eax
	jmp	70BA63h

l0070B97A:
	push	ebp
	call	6ECC50h
	mov	ecx,[edi+34h]
	add	esp,4h
	push	eax
	push	ecx
	call	6ECC50h
	mov	edx,[0A16B7Ch]
	add	esp,4h
	push	eax
	push	8D7E20h
	push	edx
	call	6E15D0h
	add	esp,10h
	jmp	70BC5Eh

l0070B9AA:
	push	ebp
	call	6ECC50h
	add	esp,4h
	push	eax
	mov	eax,[edi+34h]
	push	eax
	call	6ECC50h
	mov	ecx,[0A16B7Ch]
	add	esp,4h
	push	eax
	push	8D7DE4h
	push	ecx
	call	6E15D0h
	add	esp,10h
	jmp	70BC5Eh

l0070B9DA:
	mov	edx,[edi+34h]
	push	edx
	call	6ECC50h
	push	eax
	mov	eax,[0A16B7Ch]
	push	8D7DC0h
	push	eax
	call	6E15D0h
	add	esp,10h
	jmp	70BC5Eh

l0070B9FC:
	cmp	eax,1h
	mov	edi,8A698Fh
	jz	70BA0Bh

l0070BA06:
	mov	edi,8B22ACh

l0070BA0B:
	cmp	dword ptr [esp+44h],0h
	mov	esi,8D7E88h
	jnz	70BA1Ch

l0070BA17:
	mov	esi,8A698Fh

l0070BA1C:
	mov	ebx,[esp+2Ch]
	test	byte ptr [ebx+14h],4h
	jnz	70BA32h

l0070BA26:
	cmp	dword ptr [esp+4Ch],0h
	mov	edx,8D3C3Ch
	jz	70BA37h

l0070BA32:
	mov	edx,8D3C30h

l0070BA37:
	push	ecx
	push	edi
	push	esi
	push	eax
	push	edx
	mov	edx,[ebx+34h]
	push	edx
	call	6ECC50h
	add	esp,4h
	push	eax
	mov	eax,[0A16B7Ch]
	push	8D7E58h
	push	eax
	call	6E15D0h
	add	esp,20h
	jmp	70BC5Eh

l0070BA61:
	xor	edi,edi

l0070BA63:
	cmp	edi,esi
	jge	70BAA6h

l0070BA67:
	mov	ebx,[esp+48h]
	add	eax,edi
	lea	esi,[ebp+138h]
	lea	esi,[esi+eax*4]

l0070BA76:
	cmp	dword ptr [esi],0h
	jnz	70BA9Ah

l0070BA7B:
	mov	eax,[ebx+edi*4]
	add	dword ptr [eax],1h
	mov	ecx,[esi]
	test	ecx,ecx
	mov	[esi],eax
	jz	70BA9Ah

l0070BA89:
	add	dword ptr [ecx],0FFh
	jnz	70BA9Ah

l0070BA8E:
	mov	edx,[ecx+4h]
	mov	eax,[edx+18h]
	push	ecx
	call	eax
	add	esp,4h

l0070BA9A:
	add	edi,1h
	add	esi,4h
	cmp	edi,[esp+4Ch]
	jl	70BA76h

l0070BAA6:
	mov	ebp,[esp+2Ch]
	mov	eax,[ebp+2Ch]
	mov	edx,[eax+8h]
	test	edx,edx
	jz	70BBA4h

l0070BAB8:
	mov	ecx,[ebp+8h]
	mov	[esp+10h],ecx
	mov	ecx,[ebp+14h]
	test	cl,4h
	jz	70BACCh

l0070BAC7:
	add	dword ptr [esp+10h],1h

l0070BACC:
	test	cl,8h
	jz	70BAD6h

l0070BAD1:
	add	dword ptr [esp+10h],1h

l0070BAD6:
	test	edx,edx
	mov	dword ptr [esp+14h],0h
	jle	70BBA4h

l0070BAE6:
	mov	dword ptr [esp+18h],0Ch
	mov	edi,edi

l0070BAF0:
	mov	edx,[esp+18h]
	mov	ebx,[eax+edx]
	xor	edi,edi
	add	ebx,14h
	cmp	[esp+10h],edi
	jle	70BB49h

l0070BB02:
	mov	esi,[ebp+24h]
	add	esi,0Ch

l0070BB08:
	mov	eax,[esi]
	add	eax,14h
	mov	ecx,ebx
	nop

l0070BB10:
	mov	dl,[ecx]
	cmp	dl,[eax]
	jnz	70BB30h

l0070BB16:
	test	dl,dl
	jz	70BB2Ch

l0070BB1A:
	mov	dl,[ecx+1h]
	cmp	dl,[eax+1h]
	jnz	70BB30h

l0070BB22:
	add	ecx,2h
	add	eax,2h
	test	dl,dl
	jnz	70BB10h

l0070BB2C:
	xor	eax,eax
	jmp	70BB35h

l0070BB30:
	sbb	eax,eax
	sbb	eax,0FFh

l0070BB35:
	test	eax,eax
	jz	70BC1Eh

l0070BB3D:
	add	edi,1h
	add	esi,4h
	cmp	edi,[esp+10h]
	jl	70BB08h

l0070BB49:
	push	0h
	call	750380h
	add	esp,4h
	test	eax,eax
	jz	70BC5Eh

l0070BB5B:
	mov	edx,[ebp+0Ch]
	add	edx,[esp+14h]
	mov	ecx,[esp+30h]
	add	ecx,138h
	lea	ecx,[ecx+edx*4]
	mov	edx,[ecx]
	test	edx,edx
	mov	[ecx],eax
	jz	70BB88h

l0070BB77:
	add	dword ptr [edx],0FFh
	jnz	70BB88h

l0070BB7C:
	mov	eax,[edx+4h]
	mov	ecx,[eax+18h]
	push	edx
	call	ecx
	add	esp,4h

l0070BB88:
	mov	ecx,[esp+14h]
	mov	eax,[ebp+2Ch]
	add	dword ptr [esp+18h],4h
	add	ecx,1h
	cmp	ecx,[eax+8h]
	mov	[esp+14h],ecx
	jl	70BAF0h

l0070BBA4:
	mov	edx,[ebp+28h]
	mov	eax,[edx+8h]
	test	eax,eax
	jz	70BBDEh

l0070BBAE:
	xor	ecx,ecx
	test	eax,eax
	jle	70BBDEh

l0070BBB4:
	mov	edx,[esp+50h]
	mov	esi,[esp+20h]
	add	edx,0Ch
	nop

l0070BBC0:
	mov	eax,[edx]
	add	dword ptr [eax],1h
	mov	edi,[ebp+2Ch]
	mov	edi,[edi+8h]
	add	edi,ecx
	mov	[esi+edi*4],eax
	mov	eax,[ebp+28h]
	add	ecx,1h
	add	edx,4h
	cmp	ecx,[eax+8h]
	jl	70BBC0h

l0070BBDE:
	test	byte ptr [ebp+14h],20h
	jz	70BC4Bh

l0070BBE4:
	mov	esi,[esp+30h]
	mov	eax,[esi+0Ch]
	test	eax,eax
	jz	70BC06h

l0070BBEF:
	add	dword ptr [eax],0FFh
	mov	eax,[esi+0Ch]
	cmp	dword ptr [eax],0h
	jnz	70BC06h

l0070BBFA:
	mov	ecx,[eax+4h]
	mov	edx,[ecx+18h]
	push	eax
	call	edx
	add	esp,4h

l0070BC06:
	push	esi
	mov	dword ptr [esi+0Ch],0h
	call	7500E0h
	add	esp,4h
	pop	esi
	pop	ebp
	pop	ebx
	pop	edi
	add	esp,18h
	ret

l0070BC1E:
	mov	esi,[esp+30h]
	mov	eax,[esi+edi*4+138h]
	add	esi,138h
	push	eax
	call	750380h
	add	esp,4h
	test	eax,eax
	jz	70BC5Eh

l0070BC3C:
	mov	ecx,[ebp+0Ch]
	add	ecx,[esp+14h]
	mov	[esi+ecx*4],eax
	jmp	70BB88h

l0070BC4B:
	mov	eax,[esp+30h]
	push	0h
	push	eax
	call	708DC0h
	add	esp,8h
	mov	[esp+1Ch],eax

l0070BC5E:
	mov	esi,[esp+24h]
	mov	eax,[esp+30h]
	add	dword ptr [esi+0Ch],1h
	add	dword ptr [eax],0FFh
	jnz	70BC7Bh

l0070BC6F:
	mov	ecx,[eax+4h]
	mov	edx,[ecx+18h]
	push	eax
	call	edx
	add	esp,4h

l0070BC7B:
	add	dword ptr [esi+0Ch],0FFh
	mov	eax,[esp+1Ch]
	pop	esi
	pop	ebp
	pop	ebx
	pop	edi
	add	esp,18h
	ret
0070BC8B                                  CC CC CC CC CC            .....

;; fn0070BC90: 0070BC90
;;   Called from:
;;     006E8405 (in fn006E83E0)
;;     006F6550 (in fn006F6490)
;;     0070BF05 (in fn0070BCC0)
fn0070BC90 proc
	mov	eax,[esp+0Ch]
	mov	ecx,[esp+8h]
	mov	edx,[esp+4h]
	push	0h
	push	0h
	push	0h
	push	0h
	push	0h
	push	0h
	push	0h
	push	eax
	push	ecx
	push	edx
	call	70B600h
	add	esp,28h
	ret
0070BCB6                   CC CC CC CC CC CC CC CC CC CC       ..........

;; fn0070BCC0: 0070BCC0
;;   Called from:
;;     0070A0E7 (in fn00708DC0)
fn0070BCC0 proc
	sub	esp,8h
	push	ebx
	push	ebp
	push	esi
	mov	esi,[esp+1Ch]
	mov	eax,[esi+4h]
	cmp	eax,0A16588h
	push	edi
	mov	dword ptr [esp+14h],0h
	jz	70BCEFh

l0070BCDD:
	push	0A16588h
	push	eax
	call	6D5670h
	add	esp,8h
	test	eax,eax
	jz	70BD4Eh

l0070BCEF:
	mov	ebx,[esp+24h]
	cmp	ebx,0A163B8h
	mov	ebp,[esp+28h]
	jnz	70BDD3h

l0070BD03:
	cmp	ebp,0A163B8h
	jnz	70BD56h

l0070BD0B:
	push	esi
	call	6DFE20h
	mov	edi,eax
	add	esp,4h
	cmp	edi,2h
	jz	70BD20h

l0070BD1B:
	cmp	edi,3h
	jnz	70BD56h

l0070BD20:
	push	1h
	push	esi
	call	6DFE60h
	add	esp,8h
	cmp	edi,3h
	mov	ebx,eax
	jnz	70BD3Fh

l0070BD32:
	push	2h
	push	esi
	call	6DFE60h
	add	esp,8h
	mov	ebp,eax

l0070BD3F:
	push	0h
	push	esi
	call	6DFE60h
	add	esp,8h
	mov	esi,eax
	jmp	70BD56h

l0070BD4E:
	mov	ebp,[esp+28h]
	mov	ebx,[esp+24h]

l0070BD56:
	cmp	ebx,0A163B8h
	jnz	70BDD3h

l0070BD5E:
	mov	eax,[0A6D67Ch]
	push	eax
	call	dword ptr [0A6D680h]
	add	esp,4h
	test	eax,eax
	jnz	70BD75h

l0070BD71:
	xor	ebx,ebx
	jmp	70BD78h

l0070BD75:
	mov	ebx,[eax+18h]

l0070BD78:
	cmp	ebp,0A163B8h
	jnz	70BDADh

l0070BD80:
	mov	eax,[0A6D67Ch]
	push	eax
	call	dword ptr [0A6D680h]
	mov	edi,eax
	add	esp,4h
	test	edi,edi
	jnz	70BD99h

l0070BD95:
	xor	ebp,ebp
	jmp	70BDA5h

l0070BD99:
	push	edi
	call	73B3D0h
	mov	ebp,[edi+1Ch]
	add	esp,4h

l0070BDA5:
	mov	dword ptr [esp+14h],1h

l0070BDAD:
	test	ebx,ebx
	jz	70BDB5h

l0070BDB1:
	test	ebp,ebp
	jnz	70BDDDh

l0070BDB5:
	mov	eax,[0A18720h]
	push	8D7F7Ch
	push	eax
	call	6E0F80h
	add	esp,8h

l0070BDC8:
	pop	edi
	pop	esi
	pop	ebp
	or	eax,0FFh
	pop	ebx
	add	esp,8h
	ret

l0070BDD3:
	cmp	ebp,0A163B8h
	jnz	70BDDDh

l0070BDDB:
	mov	ebp,ebx

l0070BDDD:
	mov	eax,[esi+4h]
	cmp	eax,0A1B450h
	jz	70BE57h

l0070BDE7:
	push	0A1B450h
	push	eax
	call	6D5670h
	add	esp,8h
	test	eax,eax
	jnz	70BE57h

l0070BDF9:
	mov	eax,[esi+4h]
	cmp	eax,0A23B20h
	jz	70BE57h

l0070BE03:
	push	0A23B20h
	push	eax
	call	6D5670h
	add	esp,8h
	test	eax,eax
	jnz	70BE57h

l0070BE15:
	mov	eax,[esi+4h]
	cmp	eax,0A27458h
	jz	70BE57h

l0070BE1F:
	cmp	eax,0A26EF0h
	jz	70BE57h

l0070BE26:
	push	0A26EF0h
	push	eax
	call	6D5670h
	add	esp,8h
	test	eax,eax
	jnz	70BE57h

l0070BE38:
	push	8D7F48h

l0070BE3D:
	mov	ecx,[0A16B7Ch]
	push	ecx
	call	6E0F80h
	add	esp,8h
	pop	edi
	pop	esi
	pop	ebp
	or	eax,0FFh
	pop	ebx
	add	esp,8h
	ret

l0070BE57:
	mov	eax,[ebx+4h]
	cmp	eax,0A1D1B8h
	jz	70BE92h

l0070BE61:
	push	0A1D1B8h
	push	eax
	call	6D5670h
	add	esp,8h
	test	eax,eax
	jnz	70BE92h

l0070BE73:
	mov	edx,[0A16B7Ch]
	push	8D7F1Ch
	push	edx
	call	6E0F80h
	add	esp,8h
	pop	edi
	pop	esi
	pop	ebp
	or	eax,0FFh
	pop	ebx
	add	esp,8h
	ret

l0070BE92:
	push	ebp
	call	703640h
	add	esp,4h
	test	eax,eax
	jnz	70BEBDh

l0070BE9F:
	mov	eax,[0A16B7Ch]
	push	8D7EF4h
	push	eax
	call	6E0F80h
	add	esp,8h
	pop	edi
	pop	esi
	pop	ebp
	or	eax,0FFh
	pop	ebx
	add	esp,8h
	ret

l0070BEBD:
	push	8D41A4h
	push	ebx
	call	6FD8B0h
	add	esp,8h
	test	eax,eax
	jnz	70BEE5h

l0070BECF:
	mov	ecx,[esp+1Ch]
	mov	edx,[ecx+14h]
	push	edx
	push	8D41A4h
	push	ebx
	call	6FD8F0h
	add	esp,0Ch

l0070BEE5:
	mov	eax,[esi+4h]
	cmp	eax,0A27458h
	jnz	70BF12h

l0070BEEF:
	mov	eax,[esi+28h]
	cmp	dword ptr [eax+8h],0h
	jle	70BF02h

l0070BEF8:
	push	8D7EB8h
	jmp	70BE3Dh

l0070BF02:
	push	ebp
	push	ebx
	push	esi
	call	70BC90h
	add	esp,0Ch
	jmp	70C033h

l0070BF12:
	cmp	eax,0A26EF0h
	jz	70BFDDh

l0070BF1D:
	push	0A26EF0h
	push	eax
	call	6D5670h
	add	esp,8h
	test	eax,eax
	jnz	70BFDDh

l0070BF33:
	mov	eax,[esi+4h]
	xor	edi,edi
	cmp	eax,0A23B20h
	mov	[esp+24h],edi
	jz	70BF55h

l0070BF43:
	push	0A23B20h
	push	eax
	call	6D5670h
	add	esp,8h
	test	eax,eax
	jz	70BF72h

l0070BF55:
	push	esi
	call	718B50h
	mov	edi,eax
	add	esp,4h
	test	edi,edi
	jz	70BDC8h

l0070BF68:
	or	dword ptr [esp+24h],100h
	mov	esi,edi

l0070BF72:
	push	0h
	lea	edx,[esp+24h]
	push	edx
	push	esi
	call	6EA420h
	add	esp,0Ch
	test	eax,eax
	jnz	70BDC8h

l0070BF8A:
	lea	eax,[esp+24h]
	push	eax
	call	707600h
	add	esp,4h
	test	eax,eax
	jz	70BFAEh

l0070BF9B:
	mov	edx,[esp+20h]
	lea	ecx,[esp+24h]
	push	ecx
	push	ebp
	push	ebx
	push	101h
	push	edx
	jmp	70BFBCh

l0070BFAE:
	mov	eax,[esp+20h]
	push	0h
	push	ebp
	push	ebx
	push	101h
	push	eax

l0070BFBC:
	call	6E9040h
	add	esp,14h
	test	edi,edi
	mov	esi,eax
	jz	70C035h

l0070BFCA:
	add	dword ptr [edi],0FFh
	jnz	70C035h

l0070BFCF:
	mov	ecx,[edi+4h]
	mov	edx,[ecx+18h]
	push	edi
	call	edx
	add	esp,4h
	jmp	70C035h

l0070BFDD:
	push	esi
	call	72FC60h
	push	esi
	mov	edi,eax
	call	72FC90h
	push	eax
	call	6ECC50h
	mov	esi,eax
	add	esp,0Ch
	test	esi,esi
	jz	70BDC8h

l0070BFFE:
	lea	eax,[esp+10h]
	push	eax
	mov	dword ptr [esp+14h],0h
	call	707600h
	add	esp,4h
	test	eax,eax
	jz	70C01Eh

l0070C017:
	lea	ecx,[esp+10h]
	push	ecx
	jmp	70C020h

l0070C01E:
	push	0h

l0070C020:
	push	0h
	push	ebp
	push	ebx
	push	101h
	push	esi
	push	edi
	call	6E90B0h
	add	esp,1Ch

l0070C033:
	mov	esi,eax

l0070C035:
	cmp	dword ptr [esp+14h],0h
	jz	70C04Bh

l0070C03C:
	mov	edx,[esp+1Ch]
	push	0h
	push	edx
	call	73B4E0h
	add	esp,8h

l0070C04B:
	test	esi,esi
	jz	70BDC8h

l0070C053:
	add	dword ptr [esi],0FFh
	jnz	70C064h

l0070C058:
	mov	eax,[esi+4h]
	mov	ecx,[eax+18h]
	push	esi
	call	ecx
	add	esp,4h

l0070C064:
	pop	edi
	pop	esi
	pop	ebp
	xor	eax,eax
	pop	ebx
	add	esp,8h
	ret
0070C06E                                           CC CC               ..
0070C070 E8 9B 51 04 00 50 E8 35 51 04 00 50 68 B4 7F 8D ..Q..P.5Q..Ph...
0070C080 00 68 A0 7F 8D 00 68 FA 00 00 00 68 80 D2 A6 00 .h....h....h....
0070C090 E8 4B 8F 01 00 83 C4 18 B8 80 D2 A6 00 C3 CC CC .K..............
0070C0A0 B8 BC 7F 8D 00 C3 CC CC CC CC CC CC CC CC CC CC ................
0070C0B0 56 8B 74 24 08 8B 4E F0 8B 46 F4 C7 46 F8 FE FF V.t$..N..F..F...
0070C0C0 FF FF 89 08 8B 56 F0 8B 46 F4 89 42 04 C7 46 F0 .....V..F..B..F.
0070C0D0 00 00 00 00 8B 46 08 83 00 FF 8B 4E 08 83 39 00 .....F.....N..9.
0070C0E0 75 0E 8B C1 8B 50 04 50 8B 42 18 FF D0 83 C4 04 u....P.P.B......
0070C0F0 8B 46 0C 83 00 FF 8B 4E 0C 83 39 00 75 0E 8B C1 .F.....N..9.u...
0070C100 8B 50 04 50 8B 42 18 FF D0 83 C4 04 83 7E 10 00 .P.P.B.......~..
0070C110 74 1C 8B 46 10 83 00 FF 8B 4E 10 83 39 00 75 0E t..F.....N..9.u.
0070C120 8B C1 8B 50 04 50 8B 42 18 FF D0 83 C4 04 83 7E ...P.P.B.......~
0070C130 14 00 74 1C 8B 46 14 83 00 FF 8B 4E 14 83 39 00 ..t..F.....N..9.
0070C140 75 0E 8B C1 8B 50 04 50 8B 42 18 FF D0 83 C4 04 u....P.P.B......
0070C150 83 7E 18 00 74 1C 8B 46 18 83 00 FF 8B 4E 18 83 .~..t..F.....N..
0070C160 39 00 75 0E 8B C1 8B 50 04 50 8B 42 18 FF D0 83 9.u....P.P.B....
0070C170 C4 04 83 7E 1C 00 74 1C 8B 46 1C 83 00 FF 8B 4E ...~..t..F.....N
0070C180 1C 83 39 00 75 0E 8B C1 8B 50 04 50 8B 42 18 FF ..9.u....P.P.B..
0070C190 D0 83 C4 04 56 E8 36 2E FF FF 83 C4 04 5E C3 CC ....V.6......^..

;; fn0070C1A0: 0070C1A0
;;   Called from:
;;     0070C1F0 (in fn0070C1A0)
;;     0070CA05 (in fn0070C9E0)
fn0070C1A0 proc
	push	ebx
	mov	ebx,[esp+0Ch]
	push	edi
	mov	edi,[esp+0Ch]
	mov	eax,[edi+0Ch]
	push	ebx
	push	eax
	call	6FBCC0h
	add	esp,8h
	test	eax,eax
	jz	70C1C4h

l0070C1BB:
	mov	ecx,[esp+14h]
	mov	[ecx],edi
	pop	edi
	pop	ebx
	ret

l0070C1C4:
	mov	edx,[edi+8h]
	push	ebp
	push	esi
	push	edx
	call	6DFE20h
	add	esp,4h
	xor	esi,esi
	test	eax,eax
	mov	[esp+14h],eax
	jle	70C205h

l0070C1DC:
	mov	ebp,[esp+1Ch]

l0070C1E0:
	mov	eax,[edi+8h]
	push	ebp
	push	ebx
	push	esi
	push	eax
	call	6DFE60h
	add	esp,8h
	push	eax
	call	70C1A0h
	add	esp,0Ch
	test	eax,eax
	jnz	70C207h

l0070C1FC:
	add	esi,1h
	cmp	esi,[esp+14h]
	jl	70C1E0h

l0070C205:
	xor	eax,eax

l0070C207:
	pop	esi
	pop	ebp
	pop	edi
	pop	ebx
	ret
0070C20C                                     CC CC CC CC             ....
0070C210 51 53 55 8B 6C 24 14 56 57 55 E8 31 0A FE FF 8B QSU.l$.VWU.1....
0070C220 D8 83 C4 04 80 3B 5F 0F 85 A4 00 00 00 80 7B 01 .....;_.......{.
0070C230 5F 0F 85 9A 00 00 00 BF 7C C1 8A 00 8B F3 B9 09 _.......|.......
0070C240 00 00 00 33 C0 F3 A6 75 38 E8 82 B3 FF FF 85 C0 ...3...u8.......
0070C250 74 1C 8B 0D E0 75 A1 00 68 E4 80 8D 00 51 E8 1D t....u..h....Q..
0070C260 4D FD FF 83 C4 08 5F 5E 5D 33 C0 5B 59 C3 8B 4C M....._^]3.[Y..L
0070C270 24 18 8B 41 0C 83 00 01 8B 41 0C 5F 5E 5D 5B 59 $..A.....A._^][Y
0070C280 C3 BF 60 0D 8D 00 8B F3 B9 0A 00 00 00 33 D2 F3 ..`..........3..
0070C290 A6 75 13 8B 4C 24 18 8B 41 08 83 00 01 8B 41 08 .u..L$..A.....A.
0070C2A0 5F 5E 5D 5B 59 C3 BF 18 A8 8C 00 8B F3 B9 09 00 _^][Y...........
0070C2B0 00 00 33 C0 F3 A6 75 19 8B 4C 24 18 8B 41 10 85 ..3...u..L$..A..
0070C2C0 C0 75 05 B8 B8 63 A1 00 83 00 01 5F 5E 5D 5B 59 .u...c....._^][Y
0070C2D0 C3 8B 74 24 18 8D 54 24 10 52 55 56 E8 BF FE FF ..t$..T$.RUV....
0070C2E0 FF 83 C4 0C 85 C0 75 24 8B 46 10 8B 0D F0 78 A1 ......u$.F....x.
0070C2F0 00 53 83 C0 14 50 68 BC 80 8D 00 51 E8 CF 52 FD .S...Ph....Q..R.
0070C300 FF 83 C4 10 5F 5E 5D 33 C0 5B 59 C3 8B 48 04 F7 ...._^]3.[Y..H..
0070C310 41 54 00 01 00 00 74 B0 8B 89 88 00 00 00 85 C9 AT....t.........
0070C320 74 A6 56 6A 00 50 FF D1 83 C4 0C 5F 5E 5D 5B 59 t.Vj.P....._^][Y
0070C330 C3 CC CC CC CC CC CC CC CC CC CC CC CC CC CC CC ................
0070C340 85 C9 8B 02 74 03 83 01 01 85 C0 89 0A 74 0F 83 ....t........t..
0070C350 00 FF 75 0A 8B 48 04 8B 51 18 50 FF D2 59 C3 CC ..u..H..Q.P..Y..
0070C360 51 8B 0D 94 D3 A6 00 8D 04 24 50 51 56 E8 2E FE Q........$PQV...
0070C370 FF FF 8B 4E 14 83 C4 0C 85 C0 74 03 83 00 01 85 ...N......t.....
0070C380 C9 89 46 14 74 11 83 01 FF 75 0C 8B 51 04 8B 42 ..F.t....u..Q..B
0070C390 18 51 FF D0 83 C4 04 8B 15 A8 D3 A6 00 8D 0C 24 .Q.............$
0070C3A0 51 52 56 E8 F8 FD FF FF 8B 4E 18 83 C4 0C 85 C0 QRV......N......
0070C3B0 74 03 83 00 01 85 C9 89 46 18 74 11 83 01 FF 75 t.......F.t....u
0070C3C0 0C 8B 41 04 51 8B 48 18 FF D1 83 C4 04 A1 CC D3 ..A.Q.H.........
0070C3D0 A6 00 8D 14 24 52 50 56 E8 C3 FD FF FF 8B 4E 1C ....$RPV......N.
0070C3E0 83 C4 0C 85 C0 74 03 83 00 01 85 C9 89 46 1C 74 .....t.......F.t
0070C3F0 11 83 01 FF 75 0C 8B 51 04 8B 42 18 51 FF D0 83 ....u..Q..B.Q...
0070C400 C4 04 59 C3 CC CC CC CC CC CC CC CC CC CC CC CC ..Y.............
0070C410 85 FF 56 8B F0 74 46 8B 47 04 3D B8 D1 A1 00 74 ..V..tF.G.=....t
0070C420 12 68 B8 D1 A1 00 50 E8 44 92 FC FF 83 C4 08 85 .h....P.D.......
0070C430 C0 74 2A 8B 46 0C 83 07 01 85 C0 89 7E 0C 74 11 .t*.F.......~.t.
0070C440 83 00 FF 75 0C 8B 48 04 8B 51 18 50 FF D2 83 C4 ...u..H..Q.P....
0070C450 04 E8 0A FF FF FF B8 8F 69 8A 00 5E C3 B8 18 81 ........i..^....
0070C460 8D 00 5E C3 CC CC CC CC CC CC CC CC CC CC CC CC ..^.............
0070C470 85 F6 74 5C 8B 46 04 3D 50 B4 A1 00 74 12 68 50 ..t\.F.=P...t.hP
0070C480 B4 A1 00 50 E8 E7 91 FC FF 83 C4 08 85 C0 74 40 ...P..........t@
0070C490 8D 46 14 8D 50 01 8A 08 83 C0 01 84 C9 75 F7 2B .F..P........u.+
0070C4A0 C2 3B 46 08 74 06 B8 C0 13 8D 00 C3 8B 47 10 83 .;F.t........G..
0070C4B0 06 01 85 C0 89 77 10 74 11 83 00 FF 75 0C 8B 48 .....w.t....u..H
0070C4C0 04 8B 51 18 50 FF D2 83 C4 04 B8 8F 69 8A 00 C3 ..Q.P.......i...
0070C4D0 B8 40 81 8D 00 C3 CC CC CC CC CC CC CC CC CC CC .@..............
0070C4E0 53 56 8B 74 24 0C 8B 46 0C 57 68 98 85 8C 00 50 SV.t$..F.Wh....P
0070C4F0 E8 BB 13 FF FF 8B F8 8B 46 10 83 C4 08 85 C0 74 ........F......t
0070C500 2C 8B 40 04 3D 50 B4 A1 00 74 12 68 50 B4 A1 00 ,.@.=P...t.hP...
0070C510 50 E8 5A 91 FC FF 83 C4 08 85 C0 74 10 8B 4E 10 P.Z........t..N.
0070C520 51 E8 2A 07 FE FF 83 C4 04 8B D8 EB 05 BB 38 0E Q.*...........8.
0070C530 8D 00 85 FF 74 39 8B 47 04 3D 50 B4 A1 00 74 12 ....t9.G.=P...t.
0070C540 68 50 B4 A1 00 50 E8 25 91 FC FF 83 C4 08 85 C0 hP...P.%........
0070C550 74 1D 56 53 57 E8 F6 06 FE FF 83 C4 04 50 68 78 t.VSW........Phx
0070C560 81 8D 00 E8 08 5B FE FF 83 C4 10 5F 5E 5B C3 56 .....[....._^[.V
0070C570 53 68 64 81 8D 00 E8 F5 5A FE FF 83 C4 0C 5F 5E Shd.....Z....._^
0070C580 5B C3 CC CC CC CC CC CC CC CC CC CC CC CC CC CC [...............
0070C590 51 53 56 57 8B 7C 24 14 8B 47 0C 68 98 85 8C 00 QSVW.|$..G.h....
0070C5A0 50 E8 0A 13 FF FF 8B 5F 10 83 C4 08 85 DB 8B F0 P......_........
0070C5B0 89 74 24 14 0F 84 9A 00 00 00 8B 43 04 3D 50 B4 .t$........C.=P.
0070C5C0 A1 00 74 12 68 50 B4 A1 00 50 E8 A1 90 FC FF 83 ..t.hP...P......
0070C5D0 C4 08 85 C0 74 7E 85 F6 74 70 8B 46 04 3D 50 B4 ....t~..tp.F.=P.
0070C5E0 A1 00 74 12 68 50 B4 A1 00 50 E8 81 90 FC FF 83 ..t.hP...P......
0070C5F0 C4 08 85 C0 74 54 8B 43 08 8B 7E 08 55 8D 4C 38 ....tT.C..~.U.L8
0070C600 01 51 6A 00 89 44 24 18 E8 A3 03 FE FF 8B E8 83 .Qj..D$.........
0070C610 C4 08 85 ED 74 2C 8B 54 24 18 57 83 C2 14 52 8D ....t,.T$.W...R.
0070C620 75 14 56 E8 08 8A F8 FF 8B 44 24 1C 03 F7 50 C6 u.V......D$...P.
0070C630 06 2E 83 C3 14 53 83 C6 01 56 E8 F1 89 F8 FF 83 .....S...V......
0070C640 C4 18 8B C5 5D 5F 5E 5B 59 C3 83 03 01 5F 5E 8B ....]_^[Y...._^.
0070C650 C3 5B 59 C3 57 E8 86 FE FF FF 83 C4 04 5F 5E 5B .[Y.W........_^[
0070C660 59 C3 CC CC CC CC CC CC CC CC CC CC CC CC CC CC Y...............
0070C670 53 8B 5C 24 08 8B 43 08 85 C0 56 8B 74 24 14 57 S.\$..C...V.t$.W
0070C680 8B 7C 24 14 74 0B 56 50 FF D7 83 C4 08 85 C0 75 .|$.t.VP.......u
0070C690 5C 8B 43 0C 85 C0 74 0B 56 50 FF D7 83 C4 08 85 \.C...t.VP......
0070C6A0 C0 75 4A 8B 43 10 85 C0 74 0B 56 50 FF D7 83 C4 .uJ.C...t.VP....
0070C6B0 08 85 C0 75 38 8B 43 14 85 C0 74 0B 56 50 FF D7 ...u8.C...t.VP..
0070C6C0 83 C4 08 85 C0 75 26 8B 43 18 85 C0 74 0B 56 50 .....u&.C...t.VP
0070C6D0 FF D7 83 C4 08 85 C0 75 14 8B 43 1C 85 C0 74 0B .......u..C...t.
0070C6E0 56 50 FF D7 83 C4 08 85 C0 75 02 33 C0 5F 5E 5B VP.......u.3._^[
0070C6F0 C3 CC CC CC CC CC CC CC CC CC CC CC CC CC CC CC ................

;; fn0070C700: 0070C700
;;   Called from:
;;     00703D4B (in fn00703D00)
;;     00703F3A (in fn00703F10)
;;     0070C767 (in fn0070C700)
;;     0070C79E (in fn0070C700)
fn0070C700 proc
	push	ebp
	mov	ebp,[esp+0Ch]
	push	esi
	mov	esi,[esp+0Ch]
	cmp	esi,ebp
	jnz	70C716h

l0070C70E:
	pop	esi
	mov	eax,1h
	pop	ebp
	ret

l0070C716:
	mov	eax,[ebp+4h]
	cmp	eax,0A16588h
	push	edi
	jz	70C789h

l0070C721:
	push	0A16588h
	push	eax
	call	6D5670h
	add	esp,8h
	test	eax,eax
	jnz	70C789h

l0070C733:
	test	esi,esi
	jz	70C77Ah

l0070C737:
	cmp	dword ptr [esi+4h],0A1E968h
	jnz	70C77Ah

l0070C740:
	mov	eax,[esi+8h]
	push	eax
	call	6DFE20h
	mov	edi,eax
	add	esp,4h
	xor	esi,esi
	test	edi,edi
	jle	70C77Ah

l0070C754:
	mov	ecx,[esp+10h]
	mov	edx,[ecx+8h]
	push	ebp
	push	esi
	push	edx
	call	6DFE60h
	add	esp,8h
	push	eax
	call	70C700h
	add	esp,8h
	test	eax,eax
	jnz	70C780h

l0070C773:
	add	esi,1h
	cmp	esi,edi
	jl	70C754h

l0070C77A:
	pop	edi
	pop	esi
	xor	eax,eax
	pop	ebp
	ret

l0070C780:
	pop	edi
	pop	esi
	mov	eax,1h
	pop	ebp
	ret

l0070C789:
	push	ebx
	mov	ebx,[ebp+8h]
	xor	esi,esi
	test	ebx,ebx
	jle	70C7B4h

l0070C793:
	lea	edi,[ebp+0Ch]

l0070C796:
	mov	eax,[edi]
	mov	ecx,[esp+14h]
	push	eax
	push	ecx
	call	70C700h
	add	esp,8h
	test	eax,eax
	jnz	70C7BBh

l0070C7AA:
	add	esi,1h
	add	edi,4h
	cmp	esi,ebx
	jl	70C796h

l0070C7B4:
	pop	ebx
	pop	edi
	pop	esi
	xor	eax,eax
	pop	ebp
	ret

l0070C7BB:
	pop	ebx
	pop	edi
	pop	esi
	mov	eax,1h
	pop	ebp
	ret
0070C7C5                CC CC CC CC CC CC CC CC CC CC CC      ...........
0070C7D0 53 8B 5C 24 08 81 7B 04 68 E9 A1 00 74 16 68 F4 S.\$..{.h...t.h.
0070C7E0 01 00 00 68 A0 80 8D 00 E8 D3 55 FD FF 83 C4 08 ...h......U.....
0070C7F0 33 C0 5B C3 57 8B 7C 24 10 85 FF 75 0E E8 BE 14 3.[.W.|$...u....
0070C800 FF FF 8B F8 85 FF 75 39 5F 5B C3 8B 47 04 3D B8 ......u9_[..G.=.
0070C810 D1 A1 00 74 29 68 B8 D1 A1 00 50 E8 50 8E FC FF ...t)h....P.P...
0070C820 83 C4 08 85 C0 75 17 68 FE 01 00 00 68 A0 80 8D .....u.h....h...
0070C830 00 E8 8A 55 FD FF 83 C4 08 5F 33 C0 5B C3 83 07 ...U....._3.[...
0070C840 01 56 68 98 EB A1 00 E8 E4 26 FF FF 8B F0 83 C4 .Vh......&......
0070C850 04 85 F6 75 17 83 07 FF 75 0C 8B 47 04 8B 48 18 ...u....u..G..H.
0070C860 57 FF D1 83 C4 04 5E 5F 33 C0 5B C3 C7 46 10 00 W.....^_3.[..F..
0070C870 00 00 00 83 03 01 89 7E 0C 8D 7E F0 89 5E 08 83 .......~..~..^..
0070C880 7F 08 FE 74 0D 68 04 0E 8D 00 E8 61 BE FD FF 83 ...t.h.....a....
0070C890 C4 04 C7 47 08 FD FF FF FF 8B 15 58 D5 A1 00 89 ...G.......X....
0070C8A0 17 A1 58 D5 A1 00 8B 40 04 89 47 04 89 38 8B 0D ..X....@..G..8..
0070C8B0 58 D5 A1 00 8B C6 5E 89 79 04 5F 5B C3 CC CC CC X.....^.y._[....
0070C8C0 83 EC 08 8B 54 24 10 8D 04 24 50 8D 4C 24 08 51 ....T$...$P.L$.Q
0070C8D0 68 68 E9 A1 00 68 C0 81 8D 00 52 C7 44 24 14 B8 hh...h....R.D$..
0070C8E0 63 A1 00 E8 98 B3 FD FF 83 C4 14 85 C0 74 54 8B c............tT.
0070C8F0 04 24 3D B8 63 A1 00 75 18 8B 54 24 04 33 C0 50 .$=.c..u..T$.3.P
0070C900 52 89 44 24 08 E8 C6 FE FF FF 83 C4 08 83 C4 08 R.D$............
0070C910 C3 81 78 04 B8 D1 A1 00 74 32 8B 40 04 68 B8 D1 ..x.....t2.@.h..
0070C920 A1 00 50 E8 48 8D FC FF 83 C4 08 85 C0 75 1A 8B ..P.H........u..
0070C930 0D 7C 6B A1 00 68 8C 81 8D 00 51 E8 40 46 FD FF .|k..h....Q.@F..
0070C940 83 C4 08 33 C0 83 C4 08 C3 8B 04 24 8B 54 24 04 ...3.......$.T$.
0070C950 50 52 E8 79 FE FF FF 83 C4 08 83 C4 08 C3 CC CC PR.y............
0070C960 51 56 57 8B F0 8B F9 8B 47 0C 56 50 E8 4F F3 FE QVW.....G.VP.O..
0070C970 FF 83 C4 08 85 C0 74 07 83 00 01 5F 5E 59 C3 8B ......t...._^Y..
0070C980 57 08 8D 4C 24 08 51 56 52 E8 12 F8 FF FF 8B F0 W..L$.QVR.......
0070C990 83 C4 0C 85 F6 74 39 8B 46 04 83 06 01 F7 40 54 .....t9.F.....@T
0070C9A0 00 01 00 00 74 2A 8B 80 88 00 00 00 85 C0 74 20 ....t*........t 
0070C9B0 8B 4F 08 51 57 56 FF D0 83 C4 0C 83 06 FF 8B F8 .O.QWV..........
0070C9C0 75 0C 8B 56 04 8B 42 18 56 FF D0 83 C4 04 8B F7 u..V..B.V.......
0070C9D0 5F 8B C6 5E 59 C3 CC CC CC CC CC CC CC CC CC CC _..^Y...........

;; fn0070C9E0: 0070C9E0
;;   Called from:
;;     006FE096 (in fn006FE070)
;;     006FE2FD (in fn006FE2A0)
fn0070C9E0 proc
	push	esi
	mov	esi,[esp+0Ch]
	push	edi
	mov	edi,[esp+0Ch]
	mov	eax,[edi+0Ch]
	push	esi
	push	eax
	call	6FBCC0h
	add	esp,8h
	test	eax,eax
	jnz	70CA0Dh

l0070C9FB:
	mov	edx,[edi+8h]
	lea	ecx,[esp+0Ch]
	push	ecx
	push	esi
	push	edx
	call	70C1A0h
	add	esp,0Ch

l0070CA0D:
	pop	edi
	pop	esi
	ret
0070CA10 85 C0 56 8B F1 75 3A 8B 47 0C 53 56 50 E8 3E F4 ..V..u:.G.SVP.>.
0070CA20 FE FF 8B D8 83 C4 08 85 DB 7D 21 8B 4F 08 8B 51 .........}!.O..Q
0070CA30 10 A1 F0 78 A1 00 83 C6 14 56 83 C2 14 52 68 D0 ...x.....V...Rh.
0070CA40 81 8D 00 50 E8 87 4B FD FF 83 C4 10 8B C3 5B 5E ...P..K.......[^
0070CA50 C3 8B 4F 0C 50 56 51 E8 34 F3 FE FF 83 C4 0C 5E ..O.PVQ.4......^
0070CA60 C3 CC CC CC CC CC CC CC CC CC CC CC CC CC CC CC ................
0070CA70 53 8B 5C 24 0C 55 56 57 53 E8 D2 01 FE FF 8B E8 S.\$.UVWS.......
0070CA80 83 C4 04 80 7D 00 5F 0F 85 58 01 00 00 80 7D 01 ....}._..X....}.
0070CA90 5F 0F 85 4E 01 00 00 53 E8 63 01 FE FF 83 C4 04 _..N...S.c......
0070CAA0 80 7C 28 FF 5F 0F 85 3A 01 00 00 80 7C 28 FE 5F .|(._..:....|(._
0070CAB0 0F 85 2F 01 00 00 BF 7C C1 8A 00 8B F5 B9 09 00 ../....|........
0070CAC0 00 00 33 C0 F3 A6 0F 85 8E 00 00 00 E8 FF AA FF ..3.............
0070CAD0 FF 85 C0 74 1C 8B 0D E0 75 A1 00 68 74 82 8D 00 ...t....u..ht...
0070CAE0 51 E8 9A 44 FD FF 83 C4 08 5F 5E 5D 83 C8 FF 5B Q..D....._^]...[
0070CAF0 C3 8B 74 24 1C 85 F6 74 45 8B 46 04 3D B8 D1 A1 ..t$...tE.F.=...
0070CB00 00 74 12 68 B8 D1 A1 00 50 E8 62 8B FC FF 83 C4 .t.h....P.b.....
0070CB10 08 85 C0 74 29 8B 4C 24 14 8B 41 0C 83 06 01 89 ...t).L$..A.....
0070CB20 71 0C 83 00 FF 0F 85 45 01 00 00 8B 50 04 50 8B q......E....P.P.
0070CB30 42 18 FF D0 83 C4 04 5F 5E 5D 33 C0 5B C3 8B 0D B......_^]3.[...
0070CB40 7C 6B A1 00 68 4C 82 8D 00 51 E8 31 44 FD FF 83 |k..hL...Q.1D...
0070CB50 C4 08 5F 5E 5D 83 C8 FF 5B C3 BF 9C 29 8B 00 8B .._^]...[...)...
0070CB60 F5 B9 0A 00 00 00 33 D2 F3 A6 75 79 E8 5F AA FF ......3...uy._..
0070CB70 FF 85 C0 74 1B A1 E0 75 A1 00 68 20 82 8D 00 50 ...t...u..h ...P
0070CB80 E8 FB 43 FD FF 83 C4 08 5F 5E 5D 83 C8 FF 5B C3 ..C....._^]...[.
0070CB90 8B 4C 24 1C 85 C9 74 32 81 79 04 68 E9 A1 00 75 .L$...t2.y.h...u
0070CBA0 29 8B 54 24 14 8B 42 08 83 01 01 89 4A 08 83 00 ).T$..B.....J...
0070CBB0 FF 0F 85 B9 00 00 00 8B 48 04 8B 51 18 50 FF D2 ........H..Q.P..
0070CBC0 83 C4 04 5F 5E 5D 33 C0 5B C3 A1 7C 6B A1 00 68 ..._^]3.[..|k..h
0070CBD0 FC 81 8D 00 50 E8 A6 43 FD FF 83 C4 08 5F 5E 5D ....P..C....._^]
0070CBE0 83 C8 FF 5B C3 8B 44 24 1C 85 C0 8B 7C 24 14 75 ...[..D$....|$.u
0070CBF0 08 8B 4F 08 8B 69 1C EB 06 8B 57 08 8B 6A 18 85 ..O..i....W..j..
0070CC00 ED 75 0C 8B CB E8 06 FE FF FF 5F 5E 5D 5B C3 85 .u........_^][..
0070CC10 C0 75 0E 53 57 6A 02 E8 64 33 FD FF 83 C4 0C EB .u.SWj..d3......
0070CC20 0D 50 53 57 6A 03 E8 55 33 FD FF 83 C4 10 8B F0 .PSWj..U3.......
0070CC30 85 F6 0F 84 B1 FE FF FF 6A 00 56 55 E8 3F AA FF ........j.VU.?..
0070CC40 FF 83 C4 0C 83 06 FF 8B F8 75 0C 8B 46 04 8B 48 .........u..F..H
0070CC50 18 56 FF D1 83 C4 04 85 FF 0F 84 8A FE FF FF 83 .V..............
0070CC60 07 FF 75 0C 8B 57 04 8B 42 18 57 FF D0 83 C4 04 ..u..W..B.W.....
0070CC70 5F 5E 5D 33 C0 5B C3 CC CC CC CC CC CC CC CC CC _^]3.[..........
0070CC80 57 50 51 E8 D8 2A FD FF 8B F8 83 C4 08 85 FF 75 WPQ..*.........u
0070CC90 28 8B 15 F0 78 A1 00 52 E8 73 44 FD FF 83 C4 04 (...x..R.sD.....
0070CCA0 85 C0 75 02 5F C3 E8 B5 44 FD FF 83 05 80 64 A1 ..u._...D.....d.
0070CCB0 00 01 B8 80 64 A1 00 5F C3 8B 44 24 08 56 50 6A ....d.._..D$.VPj
0070CCC0 01 E8 BA 32 FD FF 8B F0 83 C4 08 85 F6 75 16 83 ...2.........u..
0070CCD0 07 FF 75 0C 8B 4F 04 8B 51 18 57 FF D2 83 C4 04 ..u..O..Q.W.....
0070CCE0 5E 33 C0 5F C3 53 6A 00 56 57 E8 91 A9 FF FF 83 ^3._.Sj.VW......
0070CCF0 C4 0C 83 06 FF 8B D8 75 0C 8B 46 04 8B 48 18 56 .......u..F..H.V
0070CD00 FF D1 83 C4 04 83 07 FF 75 0C 8B 57 04 8B 42 18 ........u..W..B.
0070CD10 57 FF D0 83 C4 04 8B C3 5B 5E 5F C3 CC CC CC CC W.......[^_.....
0070CD20 55 8B 6C 24 08 81 7D 04 98 EB A1 00 74 0E 83 05 U.l$..}.....t...
0070CD30 80 64 A1 00 01 B8 80 64 A1 00 5D C3 A1 D4 D3 A6 .d.....d..].....
0070CD40 00 85 C0 75 18 68 98 04 8D 00 E8 21 4D FE FF 83 ...u.h.....!M...
0070CD50 C4 04 85 C0 A3 D4 D3 A6 00 75 02 5D C3 53 50 55 .........u.].SPU
0070CD60 E8 CB 15 FD FF 8B D8 83 C4 08 85 DB 75 30 A1 F0 ............u0..
0070CD70 78 A1 00 50 E8 97 43 FD FF 83 C4 04 85 C0 75 03 x..P..C.......u.
0070CD80 5B 5D C3 E8 D8 43 FD FF 8B 4C 24 10 8B 44 24 14 []...C...L$..D$.
0070CD90 51 8B CD E8 E8 FE FF FF 83 C4 04 5B 5D C3 8B 54 Q..........[]..T
0070CDA0 24 10 57 52 6A 01 E8 D5 31 FD FF 8B F8 83 C4 08 $.WRj...1.......
0070CDB0 85 FF 75 17 83 03 FF 75 0C 8B 43 04 8B 48 18 53 ..u....u..C..H.S
0070CDC0 FF D1 83 C4 04 5F 5B 33 C0 5D C3 56 6A 00 57 53 ....._[3.].Vj.WS
0070CDD0 E8 AB A8 FF FF 83 C4 0C 83 07 FF 8B F0 75 0C 8B .............u..
0070CDE0 57 04 8B 42 18 57 FF D0 83 C4 04 83 03 FF 75 0C W..B.W........u.
0070CDF0 8B 4B 04 8B 51 18 53 FF D2 83 C4 04 85 F6 74 67 .K..Q.S.......tg
0070CE00 81 FE B8 63 A1 00 0F 84 04 01 00 00 81 FE 80 64 ...c...........d
0070CE10 A1 00 0F 84 F8 00 00 00 8B 46 04 3D 88 65 A1 00 .........F.=.e..
0070CE20 74 12 68 88 65 A1 00 50 E8 43 88 FC FF 83 C4 08 t.h.e..P.C......
0070CE30 85 C0 74 0E 56 E8 E6 2F FD FF 83 C4 04 83 F8 02 ..t.V../........
0070CE40 74 2C 83 06 FF 75 0C 8B 46 04 8B 48 18 56 FF D1 t,...u..F..H.V..
0070CE50 83 C4 04 8B 15 7C 6B A1 00 68 B0 82 8D 00 52 E8 .....|k..h....R.
0070CE60 1C 41 FD FF 83 C4 08 5E 5F 5B 33 C0 5D C3 6A 00 .A.....^_[3.].j.
0070CE70 56 E8 EA 2F FD FF 6A 01 56 8B F8 E8 E0 2F FD FF V../..j.V..../..
0070CE80 8B D8 8B 45 04 83 C4 10 39 47 04 75 1A 3D 98 EB ...E....9G.u.=..
0070CE90 A1 00 75 13 8B 44 24 1C 53 8B CF E8 E0 FD FF FF ..u..D$.S.......
0070CEA0 83 C4 04 8B F8 EB 51 A1 7C D6 A6 00 83 40 0C 01 ......Q.|....@..
0070CEB0 A1 AC E8 A1 00 8B 0D 7C D6 A6 00 83 E8 01 A3 AC .......|........
0070CEC0 E8 A1 00 39 41 0C 7E 11 68 A0 82 8D 00 E8 EE 9E ...9A.~.h.......
0070CED0 FF FF 83 C4 04 85 C0 75 8E 83 7C 24 24 00 74 04 .......u..|$$.t.
0070CEE0 57 53 EB 02 53 57 FF 54 24 28 8B F8 A1 7C D6 A6 WS..SW.T$(...|..
0070CEF0 00 83 C4 08 83 40 0C FF 83 06 FF 75 0C 8B 56 04 .....@.....u..V.
0070CF00 8B 42 18 56 FF D0 83 C4 04 5E 8B C7 5F 5B 5D C3 .B.V.....^.._[].
0070CF10 83 06 FF 75 0C 8B 4E 04 8B 51 18 56 FF D2 83 C4 ...u..N..Q.V....
0070CF20 04 8B 44 24 18 50 8B 44 24 20 8B CD E8 4F FD FF ..D$.P.D$ ...O..
0070CF30 FF 83 C4 04 5E 5F 5B 5D C3 CC CC CC CC CC CC CC ....^_[]........
0070CF40 6A 00 56 50 57 53 E8 D5 FD FF FF 83 C4 14 3D 80 j.VPWS........=.
0070CF50 64 A1 00 75 4D 83 00 FF 75 0C 8B 48 04 8B 51 18 d..uM...u..H..Q.
0070CF60 50 FF D2 83 C4 04 8B 44 24 04 6A 00 56 50 57 53 P......D$.j.VPWS
0070CF70 E8 AB FD FF FF 83 C4 14 3D 80 64 A1 00 75 23 83 ........=.d..u#.
0070CF80 00 FF 75 0C 8B 48 04 8B 51 18 50 FF D2 83 C4 04 ..u..H..Q.P.....
0070CF90 8B 44 24 08 6A 01 56 50 53 57 E8 81 FD FF FF 83 .D$.j.VPSW......
0070CFA0 C4 14 C3 CC CC CC CC CC CC CC CC CC CC CC CC CC ................
0070CFB0 8B 44 24 08 55 8B 6C 24 08 56 8B 75 00 57 8B 38 .D$.U.l$.V.u.W.8
0070CFC0 A1 D4 D3 A6 00 85 C0 75 1D 68 98 04 8D 00 E8 9D .......u.h......
0070CFD0 4A FE FF 83 C4 04 85 C0 A3 D4 D3 A6 00 75 07 5F J............u._
0070CFE0 5E 83 C8 FF 5D C3 53 50 56 E8 42 13 FD FF 8B D8 ^...].SPV.B.....
0070CFF0 83 C4 08 85 DB 75 26 8B 0D F0 78 A1 00 51 E8 0D .....u&...x..Q..
0070D000 41 FD FF 83 C4 04 85 C0 0F 84 BF 00 00 00 E8 4D A..............M
0070D010 41 FD FF 5B 5F 5E B8 01 00 00 00 5D C3 57 6A 01 A..[_^.....].Wj.
0070D020 E8 5B 2F FD FF 8B F8 83 C4 08 85 FF 0F 84 9B 00 .[/.............
0070D030 00 00 6A 00 57 53 E8 45 A6 FF FF 83 C4 0C 83 07 ..j.WS.E........
0070D040 FF 8B F0 75 0C 8B 57 04 8B 42 18 57 FF D0 83 C4 ...u..W..B.W....
0070D050 04 83 03 FF 75 0C 8B 4B 04 8B 51 18 53 FF D2 83 ....u..K..Q.S...
0070D060 C4 04 85 F6 74 67 81 FE B8 63 A1 00 0F 84 A2 00 ....tg...c......
0070D070 00 00 81 FE 80 64 A1 00 0F 84 96 00 00 00 8B 46 .....d.........F
0070D080 04 3D 88 65 A1 00 74 12 68 88 65 A1 00 50 E8 DD .=.e..t.h.e..P..
0070D090 85 FC FF 83 C4 08 85 C0 74 0E 56 E8 80 2D FD FF ........t.V..-..
0070D0A0 83 C4 04 83 F8 02 74 2D 83 06 FF 75 0C 8B 46 04 ......t-...u..F.
0070D0B0 8B 48 18 56 FF D1 83 C4 04 8B 15 7C 6B A1 00 68 .H.V.......|k..h
0070D0C0 B0 82 8D 00 52 E8 B6 3E FD FF 83 C4 08 5B 5F 5E ....R..>.....[_^
0070D0D0 83 C8 FF 5D C3 6A 00 56 E8 83 2D FD FF 6A 01 56 ...].j.V..-..j.V
0070D0E0 89 45 00 E8 78 2D FD FF 8B 4C 24 28 89 01 8B 45 .E..x-...L$(...E
0070D0F0 00 83 00 01 8B 01 83 00 01 83 C4 10 83 06 FF 75 ...............u
0070D100 0C 8B 46 04 8B 48 18 56 FF D1 83 C4 04 5B 5F 5E ..F..H.V.....[_^
0070D110 33 C0 5D C3 83 06 FF 75 0C 8B 56 04 8B 42 18 56 3.]....u..V..B.V
0070D120 FF D0 83 C4 04 5B 5F 5E B8 01 00 00 00 5D C3 CC .....[_^.....]..
0070D130 56 8B 74 24 0C 57 8B 7C 24 0C 6A 00 68 D0 20 70 V.t$.W.|$.j.h. p
0070D140 00 68 DC 04 8D 00 56 57 E8 D3 FB FF FF 83 C4 14 .h....VW........
0070D150 3D 80 64 A1 00 75 27 83 00 FF 75 0C 8B 48 04 8B =.d..u'...u..H..
0070D160 51 18 50 FF D2 83 C4 04 6A 01 68 D0 20 70 00 68 Q.P.....j.h. p.h
0070D170 BC 04 8D 00 57 56 E8 A5 FB FF FF 83 C4 14 5F 5E ....WV........_^
0070D180 C3 CC CC CC CC CC CC CC CC CC CC CC CC CC CC CC ................
0070D190 56 8B 74 24 0C 57 8B 7C 24 0C 6A 00 68 90 21 70 V.t$.W.|$.j.h.!p
0070D1A0 00 68 64 05 8D 00 56 57 E8 73 FB FF FF 83 C4 14 .hd...VW.s......
0070D1B0 3D 80 64 A1 00 75 27 83 00 FF 75 0C 8B 48 04 8B =.d..u'...u..H..
0070D1C0 51 18 50 FF D2 83 C4 04 6A 01 68 90 21 70 00 68 Q.P.....j.h.!p.h
0070D1D0 40 05 8D 00 57 56 E8 45 FB FF FF 83 C4 14 5F 5E @...WV.E......_^
0070D1E0 C3 CC CC CC CC CC CC CC CC CC CC CC CC CC CC CC ................
0070D1F0 56 8B 74 24 0C 57 8B 7C 24 0C 6A 00 68 30 21 70 V.t$.W.|$.j.h0!p
0070D200 00 68 20 05 8D 00 56 57 E8 13 FB FF FF 83 C4 14 .h ...VW........
0070D210 3D 80 64 A1 00 75 27 83 00 FF 75 0C 8B 48 04 8B =.d..u'...u..H..
0070D220 51 18 50 FF D2 83 C4 04 6A 01 68 30 21 70 00 68 Q.P.....j.h0!p.h
0070D230 FC 04 8D 00 57 56 E8 E5 FA FF FF 83 C4 14 5F 5E ....WV........_^
0070D240 C3 CC CC CC CC CC CC CC CC CC CC CC CC CC CC CC ................
0070D250 56 8B 74 24 0C 57 8B 7C 24 0C 6A 00 68 F0 21 70 V.t$.W.|$.j.h.!p
0070D260 00 68 00 06 8D 00 56 57 E8 B3 FA FF FF 83 C4 14 .h....VW........
0070D270 3D 80 64 A1 00 75 27 83 00 FF 75 0C 8B 48 04 8B =.d..u'...u..H..
0070D280 51 18 50 FF D2 83 C4 04 6A 01 68 F0 21 70 00 68 Q.P.....j.h.!p.h
0070D290 D8 05 8D 00 57 56 E8 85 FA FF FF 83 C4 14 5F 5E ....WV........_^
0070D2A0 C3 CC CC CC CC CC CC CC CC CC CC CC CC CC CC CC ................
0070D2B0 56 8B 74 24 0C 57 8B 7C 24 0C 6A 00 68 50 22 70 V.t$.W.|$.j.hP"p
0070D2C0 00 68 B0 05 8D 00 56 57 E8 53 FA FF FF 83 C4 14 .h....VW.S......
0070D2D0 3D 80 64 A1 00 75 27 83 00 FF 75 0C 8B 48 04 8B =.d..u'...u..H..
0070D2E0 51 18 50 FF D2 83 C4 04 6A 01 68 50 22 70 00 68 Q.P.....j.hP"p.h
0070D2F0 88 05 8D 00 57 56 E8 25 FA FF FF 83 C4 14 5F 5E ....WV.%......_^
0070D300 C3 CC CC CC CC CC CC CC CC CC CC CC CC CC CC CC ................
0070D310 56 8B 74 24 0C 57 8B 7C 24 0C 6A 00 68 D0 23 70 V.t$.W.|$.j.h.#p
0070D320 00 68 68 0B 8D 00 56 57 E8 F3 F9 FF FF 83 C4 14 .hh...VW........
0070D330 3D 80 64 A1 00 75 27 83 00 FF 75 0C 8B 48 04 8B =.d..u'...u..H..
0070D340 51 18 50 FF D2 83 C4 04 6A 01 68 D0 23 70 00 68 Q.P.....j.h.#p.h
0070D350 88 08 8D 00 57 56 E8 C5 F9 FF FF 83 C4 14 5F 5E ....WV........_^
0070D360 C3 CC CC CC CC CC CC CC CC CC CC CC CC CC CC CC ................
0070D370 56 8B 74 24 0C 57 8B 7C 24 0C 6A 00 68 B0 22 70 V.t$.W.|$.j.h."p
0070D380 00 68 68 08 8D 00 56 57 E8 93 F9 FF FF 83 C4 14 .hh...VW........
0070D390 3D 80 64 A1 00 75 27 83 00 FF 75 0C 8B 48 04 8B =.d..u'...u..H..
0070D3A0 51 18 50 FF D2 83 C4 04 6A 01 68 B0 22 70 00 68 Q.P.....j.h."p.h
0070D3B0 44 08 8D 00 57 56 E8 65 F9 FF FF 83 C4 14 5F 5E D...WV.e......_^
0070D3C0 C3 CC CC CC CC CC CC CC CC CC CC CC CC CC CC CC ................
0070D3D0 56 8B 74 24 0C 57 8B 7C 24 0C 6A 00 68 60 45 70 V.t$.W.|$.j.h`Ep
0070D3E0 00 68 48 0B 8D 00 56 57 E8 33 F9 FF FF 83 C4 14 .hH...VW.3......
0070D3F0 3D 80 64 A1 00 75 27 83 00 FF 75 0C 8B 48 04 8B =.d..u'...u..H..
0070D400 51 18 50 FF D2 83 C4 04 6A 01 68 60 45 70 00 68 Q.P.....j.h`Ep.h
0070D410 24 0B 8D 00 57 56 E8 05 F9 FF FF 83 C4 14 5F 5E $...WV........_^
0070D420 C3 CC CC CC CC CC CC CC CC CC CC CC CC CC CC CC ................
0070D430 56 8B 74 24 0C 57 8B 7C 24 0C 6A 00 68 10 23 70 V.t$.W.|$.j.h.#p
0070D440 00 68 F4 07 8D 00 56 57 E8 D3 F8 FF FF 83 C4 14 .h....VW........
0070D450 3D 80 64 A1 00 75 27 83 00 FF 75 0C 8B 48 04 8B =.d..u'...u..H..
0070D460 51 18 50 FF D2 83 C4 04 6A 01 68 10 23 70 00 68 Q.P.....j.h.#p.h
0070D470 D0 07 8D 00 57 56 E8 A5 F8 FF FF 83 C4 14 5F 5E ....WV........_^
0070D480 C3 CC CC CC CC CC CC CC CC CC CC CC CC CC CC CC ................
0070D490 56 8B 74 24 0C 57 8B 7C 24 0C 6A 00 68 10 25 70 V.t$.W.|$.j.h.%p
0070D4A0 00 68 B0 07 8D 00 56 57 E8 73 F8 FF FF 83 C4 14 .h....VW.s......
0070D4B0 3D 80 64 A1 00 75 27 83 00 FF 75 0C 8B 48 04 8B =.d..u'...u..H..
0070D4C0 51 18 50 FF D2 83 C4 04 6A 01 68 10 25 70 00 68 Q.P.....j.h.%p.h
0070D4D0 8C 07 8D 00 57 56 E8 45 F8 FF FF 83 C4 14 5F 5E ....WV.E......_^
0070D4E0 C3 CC CC CC CC CC CC CC CC CC CC CC CC CC CC CC ................
0070D4F0 56 8B 74 24 0C 57 8B 7C 24 0C 6A 00 68 70 23 70 V.t$.W.|$.j.hp#p
0070D500 00 68 68 07 8D 00 56 57 E8 13 F8 FF FF 83 C4 14 .hh...VW........
0070D510 3D 80 64 A1 00 75 27 83 00 FF 75 0C 8B 48 04 8B =.d..u'...u..H..
0070D520 51 18 50 FF D2 83 C4 04 6A 01 68 70 23 70 00 68 Q.P.....j.hp#p.h
0070D530 38 07 8D 00 57 56 E8 E5 F7 FF FF 83 C4 14 5F 5E 8...WV........_^
0070D540 C3 CC CC CC CC CC CC CC CC CC CC CC CC CC CC CC ................
0070D550 56 8B 74 24 0C 57 8B 7C 24 0C 6A 00 68 50 24 70 V.t$.W.|$.j.hP$p
0070D560 00 68 04 02 8D 00 56 57 E8 B3 F7 FF FF 83 C4 14 .h....VW........
0070D570 3D 80 64 A1 00 75 27 83 00 FF 75 0C 8B 48 04 8B =.d..u'...u..H..
0070D580 51 18 50 FF D2 83 C4 04 6A 01 68 50 24 70 00 68 Q.P.....j.hP$p.h
0070D590 D8 01 8D 00 57 56 E8 85 F7 FF FF 83 C4 14 5F 5E ....WV........_^
0070D5A0 C3 CC CC CC CC CC CC CC CC CC CC CC CC CC CC CC ................
0070D5B0 56 8B 74 24 0C 57 8B 7C 24 0C 6A 00 68 B0 24 70 V.t$.W.|$.j.h.$p
0070D5C0 00 68 AC 01 8D 00 56 57 E8 53 F7 FF FF 83 C4 14 .h....VW.S......
0070D5D0 3D 80 64 A1 00 75 27 83 00 FF 75 0C 8B 48 04 8B =.d..u'...u..H..
0070D5E0 51 18 50 FF D2 83 C4 04 6A 01 68 B0 24 70 00 68 Q.P.....j.h.$p.h
0070D5F0 80 01 8D 00 57 56 E8 25 F7 FF FF 83 C4 14 5F 5E ....WV.%......_^
0070D600 C3 CC CC CC CC CC CC CC CC CC CC CC CC CC CC CC ................
0070D610 53 8B 5C 24 08 56 57 8B 7C 24 14 68 BC 04 8D 00 S.\$.VW.|$.h....
0070D620 68 DC 04 8D 00 BE 70 26 70 00 B8 2C 02 8D 00 E8 h.....p&p..,....
0070D630 0C F9 FF FF 83 C4 08 5F 5E 5B C3 CC CC CC CC CC ......._^[......
0070D640 53 8B 5C 24 08 56 57 8B 7C 24 14 68 FC 04 8D 00 S.\$.VW.|$.h....
0070D650 68 20 05 8D 00 BE A0 26 70 00 B8 4C 02 8D 00 E8 h .....&p..L....
0070D660 DC F8 FF FF 83 C4 08 5F 5E 5B C3 CC CC CC CC CC ......._^[......
0070D670 53 8B 5C 24 08 56 57 8B 7C 24 14 68 40 05 8D 00 S.\$.VW.|$.h@...
0070D680 68 64 05 8D 00 BE D0 26 70 00 B8 70 02 8D 00 E8 hd.....&p..p....
0070D690 AC F8 FF FF 83 C4 08 5F 5E 5B C3 CC CC CC CC CC ......._^[......
0070D6A0 53 8B 5C 24 08 56 57 8B 7C 24 14 68 D8 05 8D 00 S.\$.VW.|$.h....
0070D6B0 68 00 06 8D 00 BE F0 26 70 00 B8 C0 02 8D 00 E8 h......&p.......
0070D6C0 7C F8 FF FF 83 C4 08 5F 5E 5B C3 CC CC CC CC CC |......_^[......
0070D6D0 53 8B 5C 24 08 56 57 8B 7C 24 14 68 88 05 8D 00 S.\$.VW.|$.h....
0070D6E0 68 B0 05 8D 00 BE 10 27 70 00 B8 98 02 8D 00 E8 h......'p.......
0070D6F0 4C F8 FF FF 83 C4 08 5F 5E 5B C3 CC CC CC CC CC L......_^[......
0070D700 53 8B 5C 24 08 56 57 8B 7C 24 14 68 88 08 8D 00 S.\$.VW.|$.h....
0070D710 68 68 0B 8D 00 BE D0 27 70 00 B8 D0 08 8D 00 E8 hh.....'p.......
0070D720 1C F8 FF FF 83 C4 08 5F 5E 5B C3 CC CC CC CC CC ......._^[......
0070D730 53 8B 5C 24 08 56 57 8B 7C 24 14 68 44 08 8D 00 S.\$.VW.|$.hD...
0070D740 68 68 08 8D 00 BE 30 27 70 00 B8 68 03 8D 00 E8 hh....0'p..h....
0070D750 EC F7 FF FF 83 C4 08 5F 5E 5B C3 CC CC CC CC CC ......._^[......
0070D760 53 8B 5C 24 08 56 57 8B 7C 24 14 68 24 0B 8D 00 S.\$.VW.|$.h$...
0070D770 68 48 0B 8D 00 BE 10 46 70 00 B8 AC 08 8D 00 E8 hH.....Fp.......
0070D780 BC F7 FF FF 83 C4 08 5F 5E 5B C3 CC CC CC CC CC ......._^[......
0070D790 53 8B 5C 24 08 56 57 8B 7C 24 14 68 D0 07 8D 00 S.\$.VW.|$.h....
0070D7A0 68 F4 07 8D 00 BE 50 27 70 00 B8 2C 03 8D 00 E8 h.....P'p..,....
0070D7B0 8C F7 FF FF 83 C4 08 5F 5E 5B C3 CC CC CC CC CC ......._^[......
0070D7C0 53 8B 5C 24 08 56 57 8B 7C 24 14 68 8C 07 8D 00 S.\$.VW.|$.h....
0070D7D0 68 B0 07 8D 00 BE A0 28 70 00 B8 08 03 8D 00 E8 h......(p.......
0070D7E0 5C F7 FF FF 83 C4 08 5F 5E 5B C3 CC CC CC CC CC \......_^[......
0070D7F0 53 8B 5C 24 08 56 57 8B 7C 24 14 68 D8 01 8D 00 S.\$.VW.|$.h....
0070D800 68 04 02 8D 00 BE 70 27 70 00 B8 54 01 8D 00 E8 h.....p'p..T....
0070D810 2C F7 FF FF 83 C4 08 5F 5E 5B C3 CC CC CC CC CC ,......_^[......
0070D820 53 8B 5C 24 08 56 57 8B 7C 24 14 68 80 01 8D 00 S.\$.VW.|$.h....
0070D830 68 AC 01 8D 00 BE A0 27 70 00 B8 24 01 8D 00 E8 h......'p..$....
0070D840 FC F6 FF FF 83 C4 08 5F 5E 5B C3 CC CC CC CC CC ......._^[......
0070D850 A1 B8 D3 A6 00 85 C0 75 1C 68 B8 00 8D 00 E8 0D .......u.h......
0070D860 42 FE FF 83 C4 04 85 C0 A3 B8 D3 A6 00 75 06 B8 B............u..
0070D870 FE FF FF FF C3 53 50 8B 44 24 0C 50 E8 AF 0A FD .....SP.D$.P....
0070D880 FF 8B D8 83 C4 08 85 DB 75 26 8B 0D F0 78 A1 00 ........u&...x..
0070D890 51 E8 7A 38 FD FF 83 C4 04 85 C0 75 07 B8 FE FF Q.z8.......u....
0070D8A0 FF FF 5B C3 E8 B7 38 FD FF B8 02 00 00 00 5B C3 ..[...8.......[.
0070D8B0 8B 54 24 0C 57 52 6A 01 E8 C3 26 FD FF 8B F8 83 .T$.WRj...&.....
0070D8C0 C4 08 85 FF 75 19 83 03 FF 75 0C 8B 43 04 8B 48 ....u....u..C..H
0070D8D0 18 53 FF D1 83 C4 04 5F B8 FE FF FF FF 5B C3 56 .S....._.....[.V
0070D8E0 6A 00 57 53 E8 97 9D FF FF 83 C4 0C 83 07 FF 8B j.WS............
0070D8F0 F0 75 0C 8B 57 04 8B 42 18 57 FF D0 83 C4 04 83 .u..W..B.W......
0070D900 03 FF 75 0C 8B 4B 04 8B 51 18 53 FF D2 83 C4 04 ..u..K..Q.S.....
0070D910 85 F6 74 60 81 FE 80 64 A1 00 75 1A 83 06 FF 75 ..t`...d..u....u
0070D920 0C 8B 46 04 8B 48 18 56 FF D1 83 C4 04 5E 5F B8 ..F..H.V.....^_.
0070D930 02 00 00 00 5B C3 56 E8 64 78 FF FF 83 C4 04 83 ....[.V.dx......
0070D940 06 FF 8B F8 75 0C 8B 56 04 8B 42 18 56 FF D0 83 ....u..V..B.V...
0070D950 C4 04 83 FF FF 75 26 E8 64 36 FD FF 85 C0 74 21 .....u&.d6....t!
0070D960 8B 0D 7C 6B A1 00 68 D8 82 8D 00 51 E8 0F 36 FD ..|k..h....Q..6.
0070D970 FF 83 C4 08 5E 5F B8 FE FF FF FF 5B C3 85 FF 7D ....^_.....[...}
0070D980 07 5E 5F 83 C8 FF 5B C3 33 C0 5E 85 FF 5F 0F 9F .^_...[.3.^.._..
0070D990 C0 5B C3 CC CC CC CC CC CC CC CC CC CC CC CC CC .[..............
0070D9A0 8D 44 24 08 50 8D 4C 24 08 51 E8 71 11 FD FF 83 .D$.P.L$.Q.q....
0070D9B0 C4 08 85 C0 7D 06 B8 FE FF FF FF C3 56 57 85 C0 ....}.......VW..
0070D9C0 8B 44 24 0C BF 98 EB A1 00 75 7B 39 78 04 8B 4C .D$......u{9x..L
0070D9D0 24 10 0F 84 85 00 00 00 39 79 04 74 7B 51 50 E8 $.......9y.t{QP.
0070D9E0 EC 19 FD FF 8B F0 8B 44 24 14 83 00 FF 8B 44 24 .......D$.....D$
0070D9F0 14 83 C4 08 83 38 00 75 0C 8B 50 04 50 8B 42 18 .....8.u..P.P.B.
0070DA00 FF D0 83 C4 04 8B 44 24 10 83 00 FF 8B 44 24 10 ......D$.....D$.
0070DA10 83 38 00 75 0C 8B 48 04 8B 51 18 50 FF D2 83 C4 .8.u..H..Q.P....
0070DA20 04 E8 9A 35 FD FF 85 C0 74 08 5F B8 FE FF FF FF ...5....t._.....
0070DA30 5E C3 85 F6 7D 06 5F 83 C8 FF 5E C3 33 C0 85 F6 ^...}._...^.3...
0070DA40 5F 0F 9F C0 5E C3 83 00 01 8B 44 24 10 83 00 01 _...^.....D$....
0070DA50 8B 4C 24 10 8B 44 24 0C 39 78 04 75 52 51 50 E8 .L$..D$.9x.uRQP.
0070DA60 EC FD FF FF 8B F0 8B 44 24 14 83 C4 08 83 FE 01 .......D$.......
0070DA70 7F 39 83 00 FF 8B 44 24 0C 83 38 00 75 0C 8B 48 .9....D$..8.u..H
0070DA80 04 8B 51 18 50 FF D2 83 C4 04 8B 44 24 10 83 00 ..Q.P......D$...
0070DA90 FF 8B 44 24 10 83 38 00 75 0C 8B 48 04 8B 51 18 ..D$..8.u..H..Q.
0070DAA0 50 FF D2 83 C4 04 5F 8B C6 5E C3 8B 4C 24 10 39 P....._..^..L$.9
0070DAB0 79 04 75 55 50 51 E8 95 FD FF FF 8B F0 8B 44 24 y.uUPQ........D$
0070DAC0 14 83 C4 08 83 FE 01 7F 40 83 00 FF 8B 44 24 0C ........@....D$.
0070DAD0 83 38 00 75 0C 8B 48 04 8B 51 18 50 FF D2 83 C4 .8.u..H..Q.P....
0070DAE0 04 8B 44 24 10 83 00 FF 8B 44 24 10 83 38 00 75 ..D$.....D$..8.u
0070DAF0 0C 8B 48 04 8B 51 18 50 FF D2 83 C4 04 83 FE FF ..H..Q.P........
0070DB00 7C 02 F7 DE 5F 8B C6 5E C3 83 00 FF 8B 44 24 0C |..._..^.....D$.
0070DB10 83 38 00 75 0C 8B 48 04 8B 51 18 50 FF D2 83 C4 .8.u..H..Q.P....
0070DB20 04 8B 44 24 10 83 00 FF 8B 44 24 10 83 38 00 75 ..D$.....D$..8.u
0070DB30 0C 8B 48 04 8B 51 18 50 FF D2 83 C4 04 5F B8 02 ..H..Q.P....._..
0070DB40 00 00 00 5E C3 CC CC CC CC CC CC CC CC CC CC CC ...^............
0070DB50 8B 44 24 08 8B 4C 24 04 68 B8 63 A1 00 50 51 E8 .D$..L$.h.c..PQ.
0070DB60 0C 4A FF FF 83 C4 0C C3 CC CC CC CC CC CC CC CC .J..............
0070DB70 56 57 8B 7C 24 14 81 FF B8 63 A1 00 75 53 8B 74 VW.|$....c..uS.t
0070DB80 24 10 8B 7C 24 0C 6A 00 68 50 DB 70 00 68 0C 07 $..|$.j.hP.p.h..
0070DB90 8D 00 56 57 E8 87 F1 FF FF 83 C4 14 3D 80 64 A1 ..VW........=.d.
0070DBA0 00 0F 85 A2 00 00 00 83 00 FF 75 0C 8B 48 04 8B ..........u..H..
0070DBB0 51 18 50 FF D2 83 C4 04 6A 01 68 50 DB 70 00 68 Q.P.....j.hP.p.h
0070DBC0 D8 06 8D 00 57 56 E8 55 F1 FF FF 83 C4 14 5F 5E ....WV.U......_^
0070DBD0 C3 8B 44 24 0C 68 0C 07 8D 00 50 E8 80 1B FD FF ..D$.h....P.....
0070DBE0 8B F0 83 C4 08 85 F6 74 27 8B 4C 24 10 57 51 6A .......t'.L$.WQj
0070DBF0 02 E8 8A 23 FD FF 8B F8 83 C4 0C 85 FF 75 16 83 ...#.........u..
0070DC00 06 FF 75 0C 8B 56 04 8B 42 18 56 FF D0 83 C4 04 ..u..V..B.V.....
0070DC10 5F 33 C0 5E C3 53 6A 00 57 56 E8 61 9A FF FF 83 _3.^.Sj.WV.a....
0070DC20 C4 0C 83 06 FF 8B D8 75 0C 8B 4E 04 8B 51 18 56 .......u..N..Q.V
0070DC30 FF D2 83 C4 04 83 07 FF 75 0C 8B 47 04 8B 48 18 ........u..G..H.
0070DC40 57 FF D1 83 C4 04 8B C3 5B 5F 5E C3 CC CC CC CC W.......[_^.....
0070DC50 8B 44 24 08 8B 4C 24 04 68 B8 63 A1 00 50 51 E8 .D$..L$.h.c..PQ.
0070DC60 5C 4C FF FF 83 C4 0C C3 CC CC CC CC CC CC CC CC \L..............
0070DC70 53 8B 5C 24 10 81 FB B8 63 A1 00 56 57 75 28 8B S.\$....c..VWu(.
0070DC80 7C 24 14 8B 5C 24 10 68 D8 06 8D 00 68 0C 07 8D |$..\$.h....h...
0070DC90 00 BE 50 DC 70 00 B8 E4 02 8D 00 E8 A0 F2 FF FF ..P.p...........
0070DCA0 83 C4 08 5F 5E 5B C3 8B 7C 24 10 68 E4 02 8D 00 ..._^[..|$.h....
0070DCB0 57 E8 AA 1A FD FF 8B F0 83 C4 08 85 F6 75 2A A1 W............u*.
0070DCC0 F0 78 A1 00 50 E8 46 34 FD FF 83 C4 04 85 C0 74 .x..P.F4.......t
0070DCD0 3F E8 8A 34 FD FF 8B 4C 24 14 53 51 57 E8 8E FE ?..4...L$.SQW...
0070DCE0 FF FF 83 C4 0C 5F 5E 5B C3 8B 54 24 14 53 52 6A ....._^[..T$.SRj
0070DCF0 02 E8 8A 22 FD FF 8B F8 83 C4 0C 85 FF 75 17 83 ...".........u..
0070DD00 06 FF 75 0C 8B 46 04 8B 48 18 56 FF D1 83 C4 04 ..u..F..H.V.....
0070DD10 5F 5E 33 C0 5B C3 6A 00 57 56 E8 61 99 FF FF 83 _^3.[.j.WV.a....
0070DD20 C4 0C 83 06 FF 8B D8 75 0C 8B 56 04 8B 42 18 56 .......u..V..B.V
0070DD30 FF D0 83 C4 04 83 07 FF 75 0C 8B 4F 04 8B 51 18 ........u..O..Q.
0070DD40 57 FF D2 83 C4 04 5F 5E 8B C3 5B C3 CC CC CC CC W....._^..[.....
0070DD50 83 EC 18 6A 18 C7 44 24 04 B8 0B 8D 00 C7 44 24 ...j..D$......D$
0070DD60 08 B0 0B 8D 00 C7 44 24 0C A8 0B 8D 00 C7 44 24 ......D$......D$
0070DD70 10 A0 0B 8D 00 C7 44 24 14 98 0B 8D 00 C7 44 24 ......D$......D$
0070DD80 18 90 0B 8D 00 FF 15 BC 45 8A 00 83 C4 04 85 C0 ........E.......
0070DD90 A3 14 D4 A6 00 75 07 83 C8 FF 83 C4 18 C3 56 33 .....u........V3
0070DDA0 F6 8B 44 34 04 50 E8 C5 3C FE FF 8B 0D 14 D4 A6 ..D4.P..<.......
0070DDB0 00 83 C4 04 85 C0 89 04 0E 74 0F 83 C6 04 83 FE .........t......
0070DDC0 18 7C DE 33 C0 5E 83 C4 18 C3 83 C8 FF 5E 83 C4 .|.3.^.......^..
0070DDD0 18 C3 CC CC CC CC CC CC CC CC CC CC CC CC CC CC ................
0070DDE0 56 57 8B F8 A1 14 D4 A6 00 85 C0 8B F1 75 12 E8 VW...........u..
0070DDF0 5C FF FF FF 85 C0 0F 8C 82 00 00 00 A1 14 D4 A6 \...............
0070DE00 00 8B 4E 08 83 79 14 00 75 0C 8B 04 B8 8B CE E8 ..N..y..u.......
0070DE10 4C EB FF FF EB 0D 8B 14 B8 52 56 E8 10 05 FD FF L........RV.....
0070DE20 83 C4 08 8B F8 85 FF 75 2F E8 92 31 FD FF 85 C0 .......u/..1....
0070DE30 74 17 A1 F0 78 A1 00 50 E8 D3 32 FD FF 83 C4 04 t...x..P..2.....
0070DE40 85 C0 74 3A E8 17 33 FD FF 83 05 80 64 A1 00 01 ..t:..3.....d...
0070DE50 5F B8 80 64 A1 00 5E C3 8B 4C 24 0C 51 6A 01 E8 _..d..^..L$.Qj..
0070DE60 1C 21 FD FF 8B F0 83 C4 08 85 F6 75 16 83 07 FF .!.........u....
0070DE70 75 0C 8B 57 04 8B 42 18 57 FF D0 83 C4 04 5F 33 u..W..B.W....._3
0070DE80 C0 5E C3 53 6A 00 56 57 E8 F3 97 FF FF 83 C4 0C .^.Sj.VW........
0070DE90 83 06 FF 8B D8 75 0C 8B 4E 04 8B 51 18 56 FF D2 .....u..N..Q.V..
0070DEA0 83 C4 04 83 07 FF 75 0C 8B 47 04 8B 48 18 57 FF ......u..G..H.W.
0070DEB0 D1 83 C4 04 8B C3 5B 5F 5E C3 CC CC CC CC CC CC ......[_^.......
0070DEC0 53 8B 5C 24 10 56 8B 74 24 0C 81 7E 04 98 EB A1 S.\$.V.t$..~....
0070DED0 00 57 8B 7C 24 14 75 25 57 8B C3 8B CE E8 FE FE .W.|$.u%W.......
0070DEE0 FF FF 83 C4 04 3D 80 64 A1 00 75 50 83 00 FF 75 .....=.d..uP...u
0070DEF0 0C 8B 48 04 8B 51 18 50 FF D2 83 C4 04 81 7F 04 ..H..Q.P........
0070DF00 98 EB A1 00 75 2A 8B 04 9D C8 62 A1 00 56 8B CF ....u*....b..V..
0070DF10 E8 CB FE FF FF 83 C4 04 3D 80 64 A1 00 75 1D 83 ........=.d..u..
0070DF20 00 FF 75 0C 8B 48 04 8B 51 18 50 FF D2 83 C4 04 ..u..H..Q.P.....
0070DF30 83 05 80 64 A1 00 01 B8 80 64 A1 00 5F 5E 5B C3 ...d.....d.._^[.
0070DF40 56 57 8B 7C 24 0C 68 68 00 8D 00 57 E8 0F 18 FD VW.|$.hh...W....
0070DF50 FF 8B F0 83 C4 08 85 F6 75 3C A1 F0 78 A1 00 50 ........u<..x..P
0070DF60 E8 AB 31 FD FF 83 C4 04 85 C0 74 25 E8 EF 31 FD ..1.......t%..1.
0070DF70 FF 8B 4F 08 8B 51 10 52 E8 D3 EC FD FF 50 A1 F0 ..O..Q.R.....P..
0070DF80 78 A1 00 68 FC 82 8D 00 50 E8 42 36 FD FF 83 C4 x..h....P.B6....
0070DF90 10 5F 33 C0 5E C3 A1 7C D6 A6 00 83 40 0C 01 A1 ._3.^..|....@...
0070DFA0 AC E8 A1 00 8B 0D 7C D6 A6 00 83 E8 01 A3 AC E8 ......|.........
0070DFB0 A1 00 39 41 0C 7E 15 68 90 16 8D 00 E8 FF 8D FF ..9A.~.h........
0070DFC0 FF 83 C4 04 85 C0 74 04 33 FF EB 1E 8B 54 24 14 ......t.3....T$.
0070DFD0 8B 44 24 10 52 50 56 E8 34 57 FF FF 8B F8 A1 7C .D$.RPV.4W.....|
0070DFE0 D6 A6 00 83 C4 0C 83 40 0C FF 83 06 FF 75 0C 8B .......@.....u..
0070DFF0 4E 04 8B 51 18 56 FF D2 83 C4 04 8B C7 5F 5E C3 N..Q.V......._^.
0070E000 57 8B 7C 24 08 57 E8 65 18 FD FF 83 C4 04 85 C0 W.|$.W.e........
0070E010 75 16 68 85 08 00 00 68 A0 80 8D 00 E8 9F 3D FD u.h....h......=.
0070E020 FF 83 C4 08 33 C0 5F C3 56 8B 35 7C D3 A6 00 85 ....3._.V.5|....
0070E030 F6 74 7E 8B 46 0C A3 7C D3 A6 00 C7 46 04 20 ED .t~.F..|....F. .
0070E040 A1 00 C7 06 01 00 00 00 8B 44 24 10 C7 46 14 00 .........D$..F..
0070E050 00 00 00 83 07 01 85 C0 89 7E 08 74 03 83 00 01 .........~.t....
0070E060 89 46 0C 8B 44 24 14 85 C0 74 03 83 00 01 8D 7E .F..D$...t.....~
0070E070 F0 89 46 10 83 7F 08 FE 74 0D 68 04 0E 8D 00 E8 ..F.....t.h.....
0070E080 6C A6 FD FF 83 C4 04 C7 47 08 FD FF FF FF 8B 0D l.......G.......
0070E090 58 D5 A1 00 89 0F 8B 15 58 D5 A1 00 8B 42 04 89 X.......X....B..
0070E0A0 47 04 89 38 A1 58 D5 A1 00 89 78 04 8B C6 5E 5F G..8.X....x...^_
0070E0B0 C3 68 20 ED A1 00 E8 75 0E FF FF 8B F0 83 C4 04 .h ....u........
0070E0C0 85 F6 75 84 5E 5F C3 CC CC CC CC CC CC CC CC CC ..u.^_..........
0070E0D0 A1 F0 D3 A6 00 85 C0 75 17 68 58 0D 8D 00 E8 8D .......u.hX.....
0070E0E0 39 FE FF 83 C4 04 85 C0 A3 F0 D3 A6 00 75 01 C3 9............u..
0070E0F0 89 44 24 08 8B 44 24 04 8B 48 08 89 4C 24 04 E9 .D$..D$..H..L$..
0070E100 2C 02 FD FF CC CC CC CC CC CC CC CC CC CC CC CC ,...............
0070E110 53 8B 5C 24 0C 56 57 8B 7C 24 10 8B 77 04 F7 46 S.\$.VW.|$..w..F
0070E120 54 00 01 00 00 74 56 83 BE 84 00 00 00 00 75 13 T....tV.......u.
0070E130 56 E8 8A C4 FC FF 83 C4 04 85 C0 7D 06 5F 5E 33 V..........}._^3
0070E140 C0 5B C3 53 56 E8 16 7F FC FF 83 C4 08 85 C0 74 .[.SV..........t
0070E150 2C 8B 48 04 F7 41 54 00 01 00 00 74 19 8B 89 88 ,.H..AT....t....
0070E160 00 00 00 85 C9 74 0F 8B 57 04 52 57 50 FF D1 83 .....t..W.RWP...
0070E170 C4 0C 5F 5E 5B C3 83 00 01 5F 5E 5B C3 8B 47 08 .._^[...._^[..G.
0070E180 53 50 E8 A9 01 FD FF 83 C4 08 5F 5E 5B C3 CC CC SP........_^[...
0070E190 83 EC 0C 8B 44 24 18 50 68 C4 7F 8D 00 C7 44 24 ....D$.Ph.....D$
0070E1A0 08 00 00 00 00 E8 56 7A FD FF 83 C4 08 85 C0 74 ......Vz.......t
0070E1B0 4C 8D 0C 24 51 8B 4C 24 18 8D 54 24 08 52 8D 44 L..$Q.L$..T$.R.D
0070E1C0 24 10 50 6A 03 6A 02 68 C4 7F 8D 00 51 E8 FE 78 $.Pj.j.h....Q..x
0070E1D0 FD FF 83 C4 1C 85 C0 74 24 8B 54 24 08 52 E8 8D .......t$.T$.R..
0070E1E0 16 FD FF 83 C4 04 85 C0 75 19 A1 7C 6B A1 00 68 ........u..|k..h
0070E1F0 50 83 8D 00 50 E8 86 2D FD FF 83 C4 08 33 C0 83 P...P..-.....3..
0070E200 C4 0C C3 8B 44 24 04 3D B8 63 A1 00 8B 0C 24 75 ....D$.=.c....$u
0070E210 08 33 C0 89 44 24 04 EB 04 85 C0 75 1E 85 C9 75 .3..D$.....u...u
0070E220 1A 8B 0D 7C 6B A1 00 68 24 83 8D 00 51 E8 4E 2D ...|k..h$...Q.N-
0070E230 FD FF 83 C4 08 33 C0 83 C4 0C C3 8B 54 24 08 51 .....3......T$.Q
0070E240 50 52 E8 B9 FD FF FF 83 C4 0C 83 C4 0C C3 CC CC PR..............
0070E250 56 8B 74 24 08 8B 46 F4 8B 4E F0 C7 46 F8 FE FF V.t$..F..N..F...
0070E260 FF FF 89 08 8B 56 F0 8B 46 F4 89 42 04 C7 46 F0 .....V..F..B..F.
0070E270 00 00 00 00 83 7E 14 00 74 09 56 E8 10 D3 FE FF .....~..t.V.....
0070E280 83 C4 04 8B 46 08 83 00 FF 8B 46 08 83 38 00 75 ....F.....F..8.u
0070E290 0C 8B 48 04 8B 51 18 50 FF D2 83 C4 04 8B 46 0C ..H..Q.P......F.
0070E2A0 85 C0 74 17 83 00 FF 8B 46 0C 83 38 00 75 0C 8B ..t.....F..8.u..
0070E2B0 48 04 8B 51 18 50 FF D2 83 C4 04 8B 46 10 85 C0 H..Q.P......F...
0070E2C0 74 27 83 00 FF 8B 46 10 83 38 00 75 2D 8B 48 04 t'....F..8.u-.H.
0070E2D0 8B 51 18 50 FF D2 A1 7C D3 A6 00 83 C4 04 89 46 .Q.P...|.......F
0070E2E0 0C 89 35 7C D3 A6 00 5E C3 8B 0D 7C D3 A6 00 89 ..5|...^...|....
0070E2F0 4E 0C 89 35 7C D3 A6 00 5E C3 8B 15 7C D3 A6 00 N..5|...^...|...
0070E300 89 56 0C 89 35 7C D3 A6 00 5E C3 CC CC CC CC CC .V..5|...^......
0070E310 56 8B 74 24 0C 8B 46 08 57 8B 7C 24 0C 8B 4F 08 V.t$..F.W.|$..O.
0070E320 50 51 E8 A9 10 FD FF 83 C4 08 85 C0 75 30 8B 47 PQ..........u0.G
0070E330 0C 8B 4E 0C 3B C1 75 05 5F 33 C0 5E C3 85 C0 74 ..N.;.u._3.^...t
0070E340 13 85 C9 74 0F 5F 5E 89 4C 24 08 89 44 24 04 E9 ...t._^.L$..D$..
0070E350 7C 10 FD FF 3B C1 1B C0 83 E0 FE 83 C0 01 5F 5E |...;........._^
0070E360 C3 CC CC CC CC CC CC CC CC CC CC CC CC CC CC CC ................
0070E370 83 EC 08 8B 44 24 0C 8B 48 0C 53 55 56 8B 70 10 ....D$..H.SUV.p.
0070E380 57 89 4C 24 14 8B 48 08 68 18 A8 8C 00 33 DB BD W.L$..H.h....3..
0070E390 38 0E 8D 00 51 89 5C 24 18 89 6C 24 24 E8 BE 13 8...Q.\$..l$$...
0070E3A0 FD FF 8B F8 83 C4 08 3B FB 75 24 8B 15 F0 78 A1 .......;.u$...x.
0070E3B0 00 52 E8 59 2D FD FF 83 C4 04 85 C0 75 0A 5F 5E .R.Y-.......u._^
0070E3C0 5D 33 C0 5B 83 C4 08 C3 E8 93 2D FD FF EB 38 8B ]3.[......-...8.
0070E3D0 47 04 3D 50 B4 A1 00 74 27 68 50 B4 A1 00 50 E8 G.=P...t'hP...P.
0070E3E0 8C 72 FC FF 83 C4 08 85 C0 75 15 83 07 FF 75 0C .r.......u....u.
0070E3F0 8B 47 04 8B 48 18 57 FF D1 83 C4 04 33 FF EB 07 .G..H.W.....3...
0070E400 8D 57 14 89 54 24 1C 3B F3 74 61 68 18 A8 8C 00 .W..T$.;.tah....
0070E410 56 E8 4A 13 FD FF 8B D8 83 C4 08 85 DB 75 19 A1 V.J..........u..
0070E420 F0 78 A1 00 50 E8 E6 2C FD FF 83 C4 04 85 C0 74 .x..P..,.......t
0070E430 8D E8 2A 2D FD FF EB 34 8B 43 04 3D 50 B4 A1 00 ..*-...4.C.=P...
0070E440 74 27 68 50 B4 A1 00 50 E8 23 72 FC FF 83 C4 08 t'hP...P.#r.....
0070E450 85 C0 75 15 83 03 FF 75 0C 8B 4B 04 8B 51 18 53 ..u....u..K..Q.S
0070E460 FF D2 83 C4 04 33 DB EB 03 8D 6B 14 8B 44 24 14 .....3....k..D$.
0070E470 85 C0 75 19 8B 44 24 1C 50 55 68 8C 83 8D 00 E8 ..u..D$.PUh.....
0070E480 EC 3B FE FF 83 C4 0C 89 44 24 10 EB 67 50 E8 1D .;......D$..gP..
0070E490 F9 FC FF 8B F0 83 C4 04 85 F6 74 58 8B 46 04 3D ..........tX.F.=
0070E4A0 50 B4 A1 00 74 22 68 50 B4 A1 00 50 E8 BF 71 FC P...t"hP...P..q.
0070E4B0 FF 83 C4 08 85 C0 75 10 83 06 FF 75 37 8B 4E 04 ......u....u7.N.
0070E4C0 8B 51 18 56 FF D2 EB 29 8B 4C 24 1C 8D 46 14 50 .Q.V...).L$..F.P
0070E4D0 51 55 68 70 83 8D 00 E8 94 3B FE FF 83 C4 10 83 QUhp.....;......
0070E4E0 06 FF 89 44 24 10 75 0C 8B 56 04 8B 42 18 56 FF ...D$.u..V..B.V.
0070E4F0 D0 83 C4 04 85 FF 74 11 83 07 FF 75 0C 8B 4F 04 ......t....u..O.
0070E500 8B 51 18 57 FF D2 83 C4 04 85 DB 74 11 83 03 FF .Q.W.......t....
0070E510 75 0C 8B 43 04 8B 48 18 53 FF D1 83 C4 04 8B 44 u..C..H.S......D
0070E520 24 10 5F 5E 5D 5B 83 C4 08 C3 CC CC CC CC CC CC $._^][..........
0070E530 56 57 8B 7C 24 0C 8B 47 0C 85 C0 75 07 68 B8 63 VW.|$..G...u.h.c
0070E540 A1 00 EB 01 50 E8 96 FD FC FF 8B F0 83 C4 04 83 ....P...........
0070E550 FE FF 75 06 5F 83 C8 FF 5E C3 8B 47 08 50 E8 7D ..u._...^..G.P.}
0070E560 FD FC FF 83 C4 04 83 F8 FF 74 E9 33 F0 83 FE FF .........t.3....
0070E570 75 05 BE FE FF FF FF 5F 8B C6 5E C3 CC CC CC CC u......_..^.....
0070E580 85 C0 66 C7 07 3F 00 74 5D 56 68 18 A8 8C 00 50 ..f..?.t]Vh....P
0070E590 E8 CB 11 FD FF 8B F0 83 C4 08 85 F6 75 06 5E E9 ............u.^.
0070E5A0 BC 2B FD FF 8B 46 04 3D 50 B4 A1 00 74 12 68 50 .+...F.=P...t.hP
0070E5B0 B4 A1 00 50 E8 B7 70 FC FF 83 C4 08 85 C0 74 14 ...P..p.......t.
0070E5C0 53 8D 46 14 50 57 FF 15 DC 45 8A 00 83 C4 0C C6 S.F.PW...E......
0070E5D0 44 1F FF 00 83 06 FF 75 0C 8B 4E 04 8B 51 18 56 D......u..N..Q.V
0070E5E0 FF D2 83 C4 04 5E C3 CC CC CC CC CC CC CC CC CC .....^..........
0070E5F0 53 8B D9 85 DB 57 8B F8 75 13 A1 A4 83 8D 00 89 S....W..u.......
0070E600 07 8B 0D A8 83 8D 00 89 4F 04 5F 5B C3 56 68 9C ........O._[.Vh.
0070E610 29 8B 00 53 E8 47 11 FD FF 8B F0 83 C4 08 85 F6 )..S.G..........
0070E620 75 0B E8 39 2B FD FF 8B 73 04 83 06 01 8B 5C 24 u..9+...s.....\$
0070E630 10 8B C6 E8 48 FF FF FF 85 F6 74 11 83 06 FF 75 ....H.....t....u
0070E640 0C 8B 56 04 8B 42 18 56 FF D0 83 C4 04 5E 5F 5B ..V..B.V.....^_[
0070E650 C3 CC CC CC CC CC CC CC CC CC CC CC CC CC CC CC ................
0070E660 81 EC 0C 02 00 00 A1 88 41 A1 00 33 C4 89 84 24 ........A..3...$
0070E670 08 02 00 00 8B 84 24 10 02 00 00 8B 8C 24 18 02 ......$......$..
0070E680 00 00 8B 50 08 53 55 8B 68 10 56 8B 70 0C 57 8B ...P.SU.h.V.p.W.
0070E690 BC 24 24 02 00 00 57 89 4C 24 18 89 54 24 14 E8 .$$...W.L$..T$..
0070E6A0 7C 17 FD FF 85 F6 0F 85 92 00 00 00 83 C4 04 83 |...............
0070E6B0 F8 01 7C 17 8B 77 0C 85 F6 74 10 55 56 E8 2E 58 ..|..w...t.UV..X
0070E6C0 FF FF 83 C4 08 85 C0 7C 6C 75 6E BB 00 01 00 00 .......|lun.....
0070E6D0 8D BC 24 18 01 00 00 8B C5 E8 A2 FE FF FF 53 8D ..$...........S.
0070E6E0 44 24 1C 8B CE E8 06 FF FF FF 83 C4 04 85 F6 B8 D$..............
0070E6F0 8F 69 8A 00 74 05 B8 5C 79 8D 00 8B 74 24 10 50 .i..t..\y...t$.P
0070E700 8D 44 24 1C 50 8D 8C 24 20 01 00 00 51 56 E8 AD .D$.P..$ ...QV..
0070E710 90 FF FF 83 C4 04 50 56 E8 33 90 FF FF 8B 15 7C ......PV.3.....|
0070E720 6B A1 00 83 C4 04 50 68 B0 83 8D 00 52 E8 9E 2E k.....Ph....R...
0070E730 FD FF 83 C4 1C 33 C0 EB 67 83 07 01 EB 3A 8B D8 .....3..g....:..
0070E740 8D 43 01 50 E8 D7 15 FD FF 83 C4 08 85 C0 74 E5 .C.P..........t.
0070E750 83 06 01 85 DB 89 70 0C 7E 1C 8D 50 10 8D 77 0C ......p.~..P..w.
0070E760 8B 0E 85 C9 74 03 83 01 01 89 0A 83 C6 04 83 C2 ....t...........
0070E770 04 83 EB 01 75 EA 8B F8 8B 4C 24 14 8B 54 24 10 ....u....L$..T$.
0070E780 51 57 52 E8 88 4F FF FF 83 C4 0C 83 07 FF 8B F0 QWR..O..........
0070E790 75 0C 8B 47 04 8B 48 18 57 FF D1 83 C4 04 8B C6 u..G..H.W.......
0070E7A0 8B 8C 24 18 02 00 00 5F 5E 5D 5B 33 CC E8 DC 63 ..$...._^][3...c
0070E7B0 F8 FF 81 C4 0C 02 00 00 C3 CC CC CC CC CC CC CC ................
0070E7C0 56 8B 74 24 08 83 7E 0C 00 74 07 83 06 01 8B C6 V.t$..~..t......
0070E7D0 5E C3 8B 46 10 85 C0 57 8B 7C 24 14 74 21 85 FF ^..F...W.|$.t!..
0070E7E0 74 1D 50 57 E8 37 58 FF FF 83 C4 08 85 C0 7D 05 t.PW.7X.......}.
0070E7F0 5F 33 C0 5E C3 75 08 83 06 01 5F 8B C6 5E C3 8B _3.^.u...._..^..
0070E800 44 24 10 8B 4E 08 57 50 51 E8 F2 F7 FF FF 83 C4 D$..N.WPQ.......
0070E810 0C 5F 5E C3 CC CC CC CC CC CC CC CC CC CC CC CC ._^.............

;; fn0070E820: 0070E820
;;   Called from:
;;     006E898A (in fn006E8910)
fn0070E820 proc
	mov	eax,[0A6D37Ch]
	test	eax,eax
	jz	70E84Bh

l0070E829:
	lea	esp,[esp+0h]

l0070E830:
	mov	ecx,[eax+0Ch]
	push	eax
	mov	[0A6D37Ch],ecx
	call	6FEFD0h
	mov	eax,[0A6D37Ch]
	add	esp,4h
	test	eax,eax
	jnz	70E830h

l0070E84B:
	ret
0070E84C                                     CC CC CC CC             ....
0070E850 51 83 3D 8C D3 A6 00 00 75 1A 68 58 0D 8D 00 E8 Q.=.....u.hX....
0070E860 0C 32 FE FF 83 C4 04 85 C0 A3 8C D3 A6 00 75 04 .2............u.
0070E870 33 C0 59 C3 83 3D FC D3 A6 00 00 75 16 68 98 85 3.Y..=.....u.h..
0070E880 8C 00 E8 E9 31 FE FF 83 C4 04 85 C0 A3 FC D3 A6 ....1...........
0070E890 00 74 DD 83 3D A4 D3 A6 00 00 75 16 68 18 A8 8C .t..=.....u.h...
0070E8A0 00 E8 CA 31 FE FF 83 C4 04 85 C0 A3 A4 D3 A6 00 ...1............
0070E8B0 74 BE 55 8B 6C 24 14 85 ED 0F 84 D5 02 00 00 8B t.U.l$..........
0070E8C0 45 04 3D 50 B4 A1 00 74 16 68 50 B4 A1 00 50 E8 E.=P...t.hP...P.
0070E8D0 9C 6D FC FF 83 C4 08 85 C0 0F 84 B5 02 00 00 53 .m.............S
0070E8E0 8B 5C 24 14 85 DB 0F 84 8F 02 00 00 8B 43 04 3D .\$..........C.=
0070E8F0 B8 D1 A1 00 74 16 68 B8 D1 A1 00 50 E8 6F 6D FC ....t.h....P.om.
0070E900 FF 83 C4 08 85 C0 0F 84 6F 02 00 00 A1 8C D3 A6 ........o.......
0070E910 00 50 53 E8 A8 D3 FE FF 83 C4 08 85 C0 75 1D 8B .PS..........u..
0070E920 0D 8C D3 A6 00 68 B8 63 A1 00 51 53 E8 5F D4 FE .....h.c..QS._..
0070E930 FF 83 C4 0C 85 C0 0F 8C 52 02 00 00 8B 15 FC D3 ........R.......
0070E940 A6 00 52 53 E8 77 D3 FE FF 83 C4 08 85 C0 75 36 ..RS.w........u6
0070E950 E8 0B 9F FF FF 85 C0 74 2D 8B 0D A4 D3 A6 00 51 .......t-......Q
0070E960 50 E8 5A D3 FE FF 83 C4 08 85 C0 74 19 8B 15 FC P.Z........t....
0070E970 D3 A6 00 50 52 53 E8 15 D4 FE FF 83 C4 0C 85 C0 ...PRS..........
0070E980 0F 8C 08 02 00 00 56 57 8B 7C 24 18 85 FF 75 17 ......VW.|$...u.
0070E990 57 E8 8A 13 FD FF 8B F8 83 C4 04 85 FF 75 6D 5F W............um_
0070E9A0 5E 5B 33 C0 5D 59 C3 8B 47 04 3D 88 65 A1 00 74 ^[3.]Y..G.=.e..t
0070E9B0 2D 68 88 65 A1 00 50 E8 B4 6C FC FF 83 C4 08 85 -h.e..P..l......
0070E9C0 C0 75 1B A1 7C 6B A1 00 68 7C 84 8D 00 50 E8 AD .u..|k..h|...P..
0070E9D0 25 FD FF 83 C4 08 5F 5E 5B 33 C0 5D 59 C3 57 E8 %....._^[3.]Y.W.
0070E9E0 3C 14 FD FF 83 C4 04 33 C9 85 C0 7E 1C 8D 57 0C <......3...~..W.
0070E9F0 8B 32 81 7E 04 68 E9 A1 00 0F 85 88 00 00 00 83 .2.~.h..........
0070EA00 C1 01 83 C2 04 3B C8 7C E7 83 07 01 83 3D 94 D3 .....;.|.....=..
0070EA10 A6 00 00 75 42 68 04 00 8D 00 E8 51 30 FE FF 83 ...uBh.....Q0...
0070EA20 C4 04 85 C0 A3 94 D3 A6 00 74 3F 68 F8 FF 8C 00 .........t?h....
0070EA30 E8 3B 30 FE FF 83 C4 04 85 C0 A3 A8 D3 A6 00 74 .;0............t
0070EA40 29 68 B8 FF 8C 00 E8 25 30 FE FF 83 C4 04 85 C0 )h.....%0.......
0070EA50 A3 CC D3 A6 00 74 13 68 68 E9 A1 00 E8 CF 04 FF .....t.hh.......
0070EA60 FF 8B F0 83 C4 04 85 F6 75 5F 83 07 FF 0F 85 2C ........u_.....,
0070EA70 FF FF FF 8B 4F 04 8B 51 18 57 FF D2 83 C4 04 5F ....O..Q.W....._
0070EA80 5E 5B 33 C0 5D 59 C3 8B 4E 04 51 E8 E0 0D FD FF ^[3.]Y..N.Q.....
0070EA90 83 C4 04 85 C0 74 17 8B 56 04 6A 00 53 57 55 52 .....t..V.j.SWUR
0070EAA0 E8 4B 50 FF FF 83 C4 14 5F 5E 5B 5D 59 C3 A1 7C .KP....._^[]Y..|
0070EAB0 6B A1 00 68 58 84 8D 00 50 E8 C2 24 FD FF 83 C4 k..hX...P..$....
0070EAC0 08 5F 5E 5B 33 C0 5D 59 C3 8B 0D 94 D3 A6 00 8D ._^[3.]Y........
0070EAD0 44 24 10 50 89 7E 08 83 03 01 51 89 5E 0C 83 45 D$.P.~....Q.^..E
0070EAE0 00 01 56 89 6E 10 E8 B5 D6 FF FF 8D 54 24 1C 89 ..V.n.......T$..
0070EAF0 46 14 A1 A8 D3 A6 00 52 50 56 E8 A1 D6 FF FF 8B F......RPV......
0070EB00 15 CC D3 A6 00 8D 4C 24 28 51 52 56 89 46 18 E8 ......L$(QRV.F..
0070EB10 8C D6 FF FF 89 46 1C 8B 46 14 83 C4 24 85 C0 74 .....F..F...$..t
0070EB20 03 83 00 01 8B 46 18 85 C0 74 03 83 00 01 8B 46 .....F...t.....F
0070EB30 1C 85 C0 74 03 83 00 01 83 7E F8 FE 8D 7E F0 74 ...t.....~...~.t
0070EB40 0D 68 04 0E 8D 00 E8 A5 9B FD FF 83 C4 04 C7 47 .h.............G
0070EB50 08 FD FF FF FF A1 58 D5 A1 00 89 07 8B 0D 58 D5 ......X.......X.
0070EB60 A1 00 8B 41 04 89 47 04 89 38 8B 15 58 D5 A1 00 ...A..G..8..X...
0070EB70 89 7A 04 5F 8B C6 5E 5B 5D 59 C3 A1 7C 6B A1 00 .z._..^[]Y..|k..
0070EB80 68 30 84 8D 00 50 E8 F5 23 FD FF 83 C4 08 5B 33 h0...P..#.....[3
0070EB90 C0 5D 59 C3 8B 0D 7C 6B A1 00 68 0C 84 8D 00 51 .]Y...|k..h....Q
0070EBA0 E8 DB 23 FD FF 83 C4 08 33 C0 5D 59 C3 CC CC CC ..#.....3.]Y....
0070EBB0 83 EC 0C 8D 44 24 04 50 8B 44 24 1C 8D 4C 24 0C ....D$.P.D$..L$.
0070EBC0 51 8B 4C 24 1C 8D 54 24 08 52 68 4C E9 A1 00 68 Q.L$..T$.RhL...h
0070EBD0 A0 84 8D 00 50 51 E8 25 8F FD FF 83 C4 1C 85 C0 ....PQ.%........
0070EBE0 75 04 83 C4 0C C3 8B 14 24 8B 44 24 04 8B 4C 24 u.......$.D$..L$
0070EBF0 08 52 50 51 E8 57 FC FF FF 83 C4 0C 83 C4 0C C3 .RPQ.W..........
0070EC00 85 DB 0F 84 A2 00 00 00 8B 43 04 3D 88 65 A1 00 .........C.=.e..
0070EC10 74 16 68 88 65 A1 00 50 E8 53 6A FC FF 83 C4 08 t.h.e..P.Sj.....
0070EC20 85 C0 0F 84 82 00 00 00 55 56 57 53 E8 EF 11 FD ........UVWS....
0070EC30 FF 8B F0 83 C4 04 33 FF 85 F6 7E 2C 8D 6B 0C 90 ......3...~,.k..
0070EC40 8B 45 00 81 78 04 68 E9 A1 00 75 4C 8B 4C 24 10 .E..x.h...uL.L$.
0070EC50 51 50 E8 A9 DA FF FF 83 C4 08 85 C0 75 43 83 C7 QP..........uC..
0070EC60 01 83 C5 04 3B FE 7C D8 8B 74 24 10 8B 46 08 83 ....;.|..t$..F..
0070EC70 03 01 85 C0 89 5E 08 74 11 83 00 FF 75 0C 8B 50 .....^.t....u..P
0070EC80 04 50 8B 42 18 FF D0 83 C4 04 E8 D1 D6 FF FF 5F .P.B..........._
0070EC90 5E B8 8F 69 8A 00 5D C3 5F 5E B8 C8 84 8D 00 5D ^..i..]._^.....]
0070ECA0 C3 5F 5E B8 68 19 8D 00 5D C3 B8 A4 84 8D 00 C3 ._^.h...].......
0070ECB0 E8 1B 89 FF FF 85 C0 74 17 A1 E0 75 A1 00 68 E8 .......t...u..h.
0070ECC0 84 8D 00 50 E8 B7 22 FD FF 83 C4 08 83 C8 FF C3 ...P..".........
0070ECD0 53 55 56 8B 74 24 14 57 56 E8 72 DF FD FF 8B 5C SUV.t$.WV.r....\
0070ECE0 24 20 8B E8 83 C4 04 80 7D 00 5F 0F 85 BA 00 00 $ ......}._.....
0070ECF0 00 80 7D 01 5F 0F 85 B0 00 00 00 56 E8 FF DE FD ..}._......V....
0070ED00 FF 83 C4 04 80 7C 28 FF 5F 0F 85 9C 00 00 00 80 .....|(._.......
0070ED10 7C 28 FE 5F 0F 85 91 00 00 00 BF 7C C1 8A 00 8B |(._.......|....
0070ED20 F5 B9 09 00 00 00 33 D2 F3 A6 75 1F 8B 44 24 14 ......3...u..D$.
0070ED30 8B FB E8 D9 D6 FF FF 85 C0 74 70 80 38 00 0F 85 .........tp.8...
0070ED40 EA 00 00 00 5F 5E 5D 33 C0 5B C3 BF 60 0D 8D 00 ...._^]3.[..`...
0070ED50 8B F5 B9 0A 00 00 00 33 C0 F3 A6 75 0F 8B 4C 24 .......3...u..L$
0070ED60 14 51 E8 99 FE FF FF 83 C4 04 EB CB BF 18 A8 8C .Q..............
0070ED70 00 8B F5 B9 09 00 00 00 33 D2 F3 A6 75 0D 8B 7C ........3...u..|
0070ED80 24 14 8B F3 E8 E7 D6 FF FF EB AC BF 04 00 8D 00 $...............
0070ED90 8B F5 B9 0C 00 00 00 33 C0 F3 A6 75 58 8B 54 24 .......3...uX.T$
0070EDA0 14 83 C2 14 8B CB E8 95 D5 FF FF 85 DB 8B 44 24 ..............D$
0070EDB0 14 8B 54 24 18 8B 48 0C 0F 85 88 00 00 00 52 51 ..T$..H.......RQ
0070EDC0 E8 9B D0 FE FF 8B F0 83 C4 08 85 F6 7D 20 8B 54 ............} .T
0070EDD0 24 14 8B 42 10 8B 0D F0 78 A1 00 55 83 C0 14 50 $..B....x..U...P
0070EDE0 68 BC 80 8D 00 51 E8 E5 27 FD FF 83 C4 10 5F 8B h....Q..'....._.
0070EDF0 C6 5E 5D 5B C3 BF F8 FF 8C 00 8B F5 B9 0C 00 00 .^][............
0070EE00 00 33 D2 F3 A6 75 09 8B 54 24 14 83 C2 18 EB 94 .3...u..T$......
0070EE10 BF B8 FF 8C 00 8B F5 B9 0C 00 00 00 33 C0 F3 A6 ............3...
0070EE20 75 89 8B 54 24 14 83 C2 1C E9 76 FF FF FF 8B 0D u..T$.....v.....
0070EE30 7C 6B A1 00 50 51 E8 45 21 FD FF 83 C4 08 5F 5E |k..PQ.E!....._^
0070EE40 5D 83 C8 FF 5B C3 53 52 51 E8 42 CF FE FF 83 C4 ]...[.SRQ.B.....
0070EE50 0C 5F 5E 5D 5B C3 CC CC CC CC CC CC CC CC CC CC ._^][...........
0070EE60 83 3D 04 D4 A6 00 00 75 17 68 3C 2D 8B 00 E8 FD .=.....u.h<-....
0070EE70 2B FE FF 83 C4 04 85 C0 A3 04 D4 A6 00 75 01 C3 +............u..
0070EE80 8B 44 24 04 56 6A 00 50 E8 43 D9 FF FF 8B F0 83 .D$.Vj.P.C......
0070EE90 C4 08 85 F6 75 02 5E C3 A1 04 D4 A6 00 57 8B CE ....u.^......W..
0070EEA0 E8 BB DA FF FF 8B F8 85 FF 0F 85 B4 00 00 00 E8 ................
0070EEB0 0C 21 FD FF 85 C0 74 16 83 06 FF 75 0C 8B 4E 04 .!....t....u..N.
0070EEC0 8B 51 18 56 FF D2 83 C4 04 5F 33 C0 5E C3 8B 7C .Q.V....._3.^..|
0070EED0 24 10 85 FF 74 29 8B 47 04 3D 88 65 A1 00 74 12 $...t).G.=.e..t.
0070EEE0 68 88 65 A1 00 50 E8 85 67 FC FF 83 C4 08 85 C0 h.e..P..g.......
0070EEF0 74 46 57 E8 28 0F FD FF 83 C4 04 85 C0 75 39 8B tFW.(........u9.
0070EF00 7C 24 14 85 FF 0F 84 DC 00 00 00 8B 47 04 3D B8 |$..........G.=.
0070EF10 D1 A1 00 74 12 68 B8 D1 A1 00 50 E8 50 67 FC FF ...t.h....P.Pg..
0070EF20 83 C4 08 85 C0 74 11 57 E8 F3 DF FE FF 83 C4 04 .....t.W........
0070EF30 85 C0 0F 84 AF 00 00 00 A1 7C 6B A1 00 68 34 85 .........|k..h4.
0070EF40 8D 00 50 E8 38 20 FD FF 83 C4 08 83 06 FF 75 0C ..P.8 ........u.
0070EF50 8B 4E 04 8B 51 18 56 FF D2 83 C4 04 33 F6 5F 8B .N..Q.V.....3._.
0070EF60 C6 5E C3 8B 44 24 14 8B 4C 24 10 53 50 51 57 E8 .^..D$..L$.SPQW.
0070EF70 0C 87 FF FF 83 C4 0C 83 07 FF 8B D8 75 0C 8B 57 ............u..W
0070EF80 04 8B 42 18 57 FF D0 83 C4 04 85 DB 75 19 83 06 ..B.W.......u...
0070EF90 FF 75 0C 8B 4E 04 8B 51 18 56 FF D2 83 C4 04 5B .u..N..Q.V.....[
0070EFA0 33 F6 5F 8B C6 5E C3 81 FB B8 63 A1 00 74 26 A1 3._..^....c..t&.
0070EFB0 7C 6B A1 00 68 14 85 8D 00 50 E8 C1 1F FD FF 83 |k..h....P......
0070EFC0 C4 08 83 06 FF 75 0C 8B 4E 04 8B 51 18 56 FF D2 .....u..N..Q.V..
0070EFD0 83 C4 04 33 F6 83 03 FF 75 0C 8B 43 04 8B 48 18 ...3....u..C..H.
0070EFE0 53 FF D1 83 C4 04 5B 5F 8B C6 5E C3 CC CC CC CC S.....[_..^.....
0070EFF0 83 EC 08 56 8B 74 24 10 8B 46 F4 8B 4E F0 57 8D ...V.t$..F..N.W.
0070F000 7E F0 C7 47 08 FE FF FF FF 89 08 8B 17 8B 47 04 ~..G..........G.
0070F010 89 42 04 C7 07 00 00 00 00 83 7E 10 00 74 09 56 .B........~..t.V
0070F020 E8 6B C5 FE FF 83 C4 04 8D 4C 24 14 51 8D 54 24 .k.......L$.Q.T$
0070F030 0C 52 8D 44 24 14 50 C7 06 01 00 00 00 E8 EE 20 .R.D$.P........ 
0070F040 FD FF A1 E4 D3 A6 00 83 C4 0C 85 C0 75 28 68 D8 ............u(h.
0070F050 FD 8C 00 E8 18 2A FE FF 83 C4 04 85 C0 A3 E4 D3 .....*..........
0070F060 A6 00 75 12 56 E8 16 27 FD FF A1 E4 D3 A6 00 83 ..u.V..'........
0070F070 C4 04 85 C0 74 4A 53 8B CE E8 E2 D8 FF FF 8B D8 ....tJS.........
0070F080 85 DB 74 3B 6A 00 6A 00 53 E8 F2 85 FF FF 83 C4 ..t;j.j.S.......
0070F090 0C 85 C0 75 08 53 E8 E5 26 FD FF EB 0E 83 00 FF ...u.S..&.......
0070F0A0 75 0C 8B 48 04 8B 51 18 50 FF D2 83 C4 04 83 03 u..H..Q.P.......
0070F0B0 FF 75 0C 8B 43 04 8B 48 18 53 FF D1 83 C4 04 5B .u..C..H.S.....[
0070F0C0 8B 54 24 14 8B 44 24 08 8B 4C 24 0C 52 50 51 E8 .T$..D$..L$.RPQ.
0070F0D0 2C 1D FD FF 83 C4 0C 83 06 FF 8B 06 75 5F 83 7E ,...........u_.~
0070F0E0 10 00 74 12 8B 56 10 52 E8 83 AB FE FF 83 C4 04 ..t..V.R........
0070F0F0 83 7E 10 00 75 EE 8B 46 08 83 00 FF 8B 46 08 83 .~..u..F.....F..
0070F100 38 00 75 0C 8B 48 04 8B 51 18 50 FF D2 83 C4 04 8.u..H..Q.P.....
0070F110 8B 46 0C 85 C0 74 17 83 00 FF 8B 46 0C 83 38 00 .F...t.....F..8.
0070F120 75 0C 8B 48 04 8B 51 18 50 FF D2 83 C4 04 56 E8 u..H..Q.P.....V.
0070F130 9C FE FE FF 83 C4 04 5F 5E 83 C4 08 C3 89 06 83 ......._^.......
0070F140 7F 08 FE 74 0D 68 04 0E 8D 00 E8 A1 95 FD FF 83 ...t.h..........
0070F150 C4 04 C7 47 08 FD FF FF FF A1 58 D5 A1 00 89 07 ...G......X.....
0070F160 8B 0D 58 D5 A1 00 8B 41 04 89 47 04 89 38 8B 15 ..X....A..G..8..
0070F170 58 D5 A1 00 89 7A 04 5F 5E 83 C4 08 C3 CC CC CC X....z._^.......
0070F180 8B 44 24 08 53 55 8B 6C 24 0C 56 57 50 E8 BE DA .D$.SU.l$.VWP...
0070F190 FD FF 8B D8 83 C4 04 80 3B 5F 75 69 80 7B 01 5F ........;_ui.{._
0070F1A0 75 63 BF 7C C1 8A 00 8B F3 B9 09 00 00 00 33 D2 uc.|..........3.
0070F1B0 F3 A6 75 31 E8 17 84 FF FF 85 C0 74 1A A1 E0 75 ..u1.......t...u
0070F1C0 A1 00 68 58 85 8D 00 50 E8 B3 1D FD FF 83 C4 08 ..hX...P........
0070F1D0 5F 5E 5D 33 C0 5B C3 8B 45 0C 83 00 01 8B 45 0C _^]3.[..E.....E.
0070F1E0 5F 5E 5D 5B C3 BF 9C 29 8B 00 8B F3 B9 0A 00 00 _^][...)........
0070F1F0 00 33 D2 F3 A6 75 0E 8B 45 08 83 00 01 8B 45 08 .3...u..E.....E.
0070F200 5F 5E 5D 5B C3 8B 44 24 18 8B CD E8 50 D7 FF FF _^][..D$....P...
0070F210 8B F0 85 F6 75 28 E8 A5 1D FD FF 85 C0 75 1F 8B ....u(.......u..
0070F220 45 08 8B 48 10 8B 15 F0 78 A1 00 53 83 C1 14 51 E..H....x..S...Q
0070F230 68 D0 81 8D 00 52 E8 95 23 FD FF 83 C4 10 5F 8B h....R..#....._.
0070F240 C6 5E 5D 5B C3 CC CC CC CC CC CC CC CC CC CC CC .^][............
0070F250 53 55 8B 6C 24 10 56 8B 74 24 10 57 55 56 E8 1D SU.l$.V.t$.WUV..
0070F260 FF FF FF 8B F8 83 C4 08 85 FF 75 5A 8B 46 08 8B ..........uZ.F..
0070F270 58 14 85 DB 74 50 8B 0D F0 78 A1 00 51 E8 8E 1E X...tP...x..Q...
0070F280 FD FF 83 C4 04 85 C0 75 07 5F 5E 5D 33 C0 5B C3 .......u._^]3.[.
0070F290 E8 CB 1E FD FF 55 56 6A 02 E8 E2 0C FD FF 8B F0 .....UVj........
0070F2A0 83 C4 0C 85 F6 74 E2 6A 00 56 53 E8 D0 83 FF FF .....t.j.VS.....
0070F2B0 83 C4 0C 83 06 FF 8B F8 75 0C 8B 56 04 8B 42 18 ........u..V..B.
0070F2C0 56 FF D0 83 C4 04 8B C7 5F 5E 5D 5B C3 CC CC CC V......._^][....
0070F2D0 A1 88 D3 A6 00 85 C0 75 17 68 DC 00 8D 00 E8 8D .......u.h......
0070F2E0 27 FE FF 83 C4 04 85 C0 A3 88 D3 A6 00 75 01 C3 '............u..
0070F2F0 53 8B 5C 24 08 56 57 50 53 E8 52 FF FF FF 8B F0 S.\$.VWPS.R.....
0070F300 83 C4 08 85 F6 0F 85 B6 00 00 00 A1 F0 78 A1 00 .............x..
0070F310 50 E8 FA 1D FD FF 83 C4 04 85 C0 75 04 5F 5E 5B P..........u._^[
0070F320 C3 E8 3A 1E FD FF 8B 43 08 8B 48 0C 8B 70 10 68 ..:....C..H..p.h
0070F330 98 85 8C 00 51 E8 76 E5 FE FF 83 C4 08 85 F6 8B ....Q.v.........
0070F340 F8 74 29 8B 46 04 3D 50 B4 A1 00 74 12 68 50 B4 .t).F.=P...t.hP.
0070F350 A1 00 50 E8 18 63 FC FF 83 C4 08 85 C0 74 0D 56 ..P..c.......t.V
0070F360 E8 EB D8 FD FF 83 C4 04 8B F0 EB 05 BE 38 0E 8D .............8..
0070F370 00 85 FF 74 39 8B 47 04 3D 50 B4 A1 00 74 12 68 ...t9.G.=P...t.h
0070F380 50 B4 A1 00 50 E8 E6 62 FC FF 83 C4 08 85 C0 74 P...P..b.......t
0070F390 1D 53 56 57 E8 B7 D8 FD FF 83 C4 04 50 68 A4 85 .SVW........Ph..
0070F3A0 8D 00 E8 C9 2C FE FF 83 C4 10 5F 5E 5B C3 53 56 ....,....._^[.SV
0070F3B0 68 8C 85 8D 00 E8 B6 2C FE FF 83 C4 0C 5F 5E 5B h......,....._^[
0070F3C0 C3 6A 00 6A 00 56 E8 B5 82 FF FF 83 C4 0C 83 06 .j.j.V..........
0070F3D0 FF 8B F8 75 0C 8B 56 04 8B 42 18 56 FF D0 83 C4 ...u..V..B.V....
0070F3E0 04 8B C7 5F 5E 5B C3 CC CC CC CC CC CC CC CC CC ..._^[..........
0070F3F0 A1 98 D3 A6 00 85 C0 75 17 68 00 01 8D 00 E8 6D .......u.h.....m
0070F400 26 FE FF 83 C4 04 85 C0 A3 98 D3 A6 00 75 01 C3 &............u..
0070F410 56 57 8B 7C 24 0C 50 57 E8 33 FE FF FF 8B F0 83 VW.|$.PW.3......
0070F420 C4 08 85 F6 75 26 A1 F0 78 A1 00 50 E8 DF 1C FD ....u&..x..P....
0070F430 FF 83 C4 04 85 C0 75 03 5F 5E C3 E8 20 1D FD FF ......u._^.. ...
0070F440 57 E8 8A FE FF FF 83 C4 04 5F 5E C3 6A 00 6A 00 W........_^.j.j.
0070F450 56 E8 2A 82 FF FF 83 C4 0C 83 06 FF 8B F8 75 0C V.*...........u.
0070F460 8B 4E 04 8B 51 18 56 FF D2 83 C4 04 8B C7 5F 5E .N..Q.V......._^
0070F470 C3 CC CC CC CC CC CC CC CC CC CC CC CC CC CC CC ................
0070F480 A1 C8 D3 A6 00 85 C0 75 1A 68 90 00 8D 00 E8 DD .......u.h......
0070F490 25 FE FF 83 C4 04 85 C0 A3 C8 D3 A6 00 75 04 83 %............u..
0070F4A0 C8 FF C3 56 57 8B 7C 24 0C 50 57 E8 A0 FD FF FF ...VW.|$.PW.....
0070F4B0 8B F0 83 C4 08 85 F6 0F 85 DF 00 00 00 A1 F0 78 ...............x
0070F4C0 A1 00 50 E8 48 1C FD FF 83 C4 04 85 C0 0F 84 C3 ..P.H...........
0070F4D0 00 00 00 E8 88 1C FD FF A1 DC D3 A6 00 85 C0 75 ...............u
0070F4E0 1A 68 A8 0B 8D 00 E8 85 25 FE FF 83 C4 04 85 C0 .h......%.......
0070F4F0 A3 DC D3 A6 00 0F 84 9B 00 00 00 50 57 E8 4E FD ...........PW.N.
0070F500 FF FF 83 C4 08 85 C0 75 69 8B 0D F0 78 A1 00 51 .......ui...x..Q
0070F510 E8 FB 1B FD FF 83 C4 04 85 C0 74 7A E8 3F 1C FD ..........tz.?..
0070F520 FF A1 C4 D3 A6 00 85 C0 75 16 68 B8 00 8D 00 E8 ........u.h.....
0070F530 3C 25 FE FF 83 C4 04 85 C0 A3 C4 D3 A6 00 74 56 <%............tV
0070F540 50 57 E8 09 FD FF FF 83 C4 08 85 C0 75 24 8B 15 PW..........u$..
0070F550 F0 78 A1 00 52 E8 B6 1B FD FF 83 C4 04 85 C0 74 .x..R..........t
0070F560 35 E8 FA 1B FD FF 57 E8 64 ED FC FF 83 C4 04 5F 5.....W.d......_
0070F570 5E C3 83 00 FF 75 0C 8B 48 04 8B 51 18 50 FF D2 ^....u..H..Q.P..
0070F580 83 C4 04 A1 7C 6B A1 00 68 DC 85 8D 00 50 E8 ED ....|k..h....P..
0070F590 19 FD FF 83 C4 08 5F 83 C8 FF 5E C3 6A 00 6A 00 ......_...^.j.j.
0070F5A0 56 E8 DA 80 FF FF 83 C4 0C 83 06 FF 8B F8 75 0C V.............u.
0070F5B0 8B 4E 04 8B 51 18 56 FF D2 83 C4 04 85 FF 74 D6 .N..Q.V.......t.
0070F5C0 8B 47 04 3D E8 E7 A1 00 74 46 68 E8 E7 A1 00 50 .G.=....tFh....P
0070F5D0 E8 9B 60 FC FF 83 C4 08 85 C0 75 34 8B 47 04 3D ..`.......u4.G.=
0070F5E0 00 F4 A1 00 74 2A 68 00 F4 A1 00 50 E8 7F 60 FC ....t*h....P..`.
0070F5F0 FF 83 C4 08 85 C0 75 18 A1 7C 6B A1 00 68 BC 85 ......u..|k..h..
0070F600 8D 00 50 E8 78 19 FD FF 83 C4 08 83 CE FF EB 0E ..P.x...........
0070F610 8B 4F 04 8B 51 3C 57 FF D2 83 C4 04 8B F0 83 07 .O..Q<W.........
0070F620 FF 75 0C 8B 47 04 8B 48 18 57 FF D1 83 C4 04 5F .u..G..H.W....._
0070F630 8B C6 5E C3 CC CC CC CC CC CC CC CC CC CC CC CC ..^.............
0070F640 A1 0C D4 A6 00 85 C0 75 1A 68 88 0B 8D 00 E8 1D .......u.h......
0070F650 24 FE FF 83 C4 04 85 C0 A3 0C D4 A6 00 75 04 83 $............u..
0070F660 C8 FF C3 56 50 8B 44 24 0C 50 E8 E1 FB FF FF 8B ...VP.D$.P......
0070F670 F0 83 C4 08 85 F6 75 05 83 C8 FF 5E C3 57 6A 00 ......u....^.Wj.
0070F680 6A 00 56 E8 F8 7F FF FF 83 C4 0C 83 06 FF 8B F8 j.V.............
0070F690 75 0C 8B 4E 04 8B 51 18 56 FF D2 83 C4 04 85 FF u..N..Q.V.......
0070F6A0 74 51 8B 47 04 3D E8 E7 A1 00 74 1E 68 E8 E7 A1 tQ.G.=....t.h...
0070F6B0 00 50 E8 B9 5F FC FF 83 C4 08 85 C0 75 0C A1 7C .P.._.......u..|
0070F6C0 6B A1 00 68 F0 85 8D 00 EB 3D 57 E8 F0 5B FF FF k..h.....=W..[..
0070F6D0 8B F0 83 C4 04 83 FE FF 75 1F E8 E1 18 FD FF 85 ........u.......
0070F6E0 C0 74 16 01 37 75 0C 8B 4F 04 8B 51 18 57 FF D2 .t..7u..O..Q.W..
0070F6F0 83 C4 04 5F 83 C8 FF 5E C3 85 F6 7D 16 A1 2C 7E ..._...^...}..,~
0070F700 A1 00 68 D8 15 8D 00 50 E8 73 18 FD FF 83 C4 08 ..h....P.s......
0070F710 83 CE FF 83 07 FF 75 0C 8B 4F 04 8B 51 18 57 FF ......u..O..Q.W.
0070F720 D2 83 C4 04 5F 8B C6 5E C3 CC CC CC CC CC CC CC ...._..^........
0070F730 A1 A0 D3 A6 00 85 C0 75 17 68 00 0B 8D 00 E8 2D .......u.h.....-
0070F740 23 FE FF 83 C4 04 85 C0 A3 A0 D3 A6 00 75 01 C3 #............u..
0070F750 56 50 8B 44 24 0C 50 E8 F4 FA FF FF 8B F0 83 C4 VP.D$.P.........
0070F760 08 85 F6 75 02 5E C3 8B 4C 24 0C 57 51 6A 01 E8 ...u.^..L$.WQj..
0070F770 0C 08 FD FF 8B F8 83 C4 08 85 FF 75 16 83 06 FF ...........u....
0070F780 75 0C 8B 56 04 8B 42 18 56 FF D0 83 C4 04 5F 33 u..V..B.V....._3
0070F790 C0 5E C3 53 6A 00 57 56 E8 E3 7E FF FF 83 C4 0C .^.Sj.WV..~.....
0070F7A0 83 06 FF 8B D8 75 0C 8B 4E 04 8B 51 18 56 FF D2 .....u..N..Q.V..
0070F7B0 83 C4 04 83 07 FF 75 0C 8B 47 04 8B 48 18 57 FF ......u..G..H.W.
0070F7C0 D1 83 C4 04 8B C3 5B 5F 5E C3 CC CC CC CC CC CC ......[_^.......
0070F7D0 56 57 8B 7C 24 14 85 FF 75 27 A1 C0 D3 A6 00 85 VW.|$...u'......
0070F7E0 C0 75 16 68 30 0A 8D 00 E8 83 22 FE FF 83 C4 04 .u.h0.....".....
0070F7F0 85 C0 A3 C0 D3 A6 00 74 77 50 8B 44 24 10 50 EB .......twP.D$.P.
0070F800 25 A1 90 D3 A6 00 85 C0 75 16 68 5C 0A 8D 00 E8 %.......u.h\....
0070F810 5C 22 FE FF 83 C4 04 85 C0 A3 90 D3 A6 00 74 50 \"............tP
0070F820 8B 4C 24 0C 50 51 E8 25 FA FF FF 8B F0 83 C4 08 .L$.PQ.%........
0070F830 85 F6 74 3C 85 FF 75 11 8B 54 24 10 52 6A 01 E8 ..t<..u..T$.Rj..
0070F840 3C 07 FD FF 83 C4 08 EB 10 8B 44 24 10 57 50 6A <.........D$.WPj
0070F850 02 E8 2A 07 FD FF 83 C4 0C 8B F8 85 FF 75 17 83 ..*..........u..
0070F860 06 FF 75 0C 8B 4E 04 8B 51 18 56 FF D2 83 C4 04 ..u..N..Q.V.....
0070F870 5F 83 C8 FF 5E C3 53 6A 00 57 56 E8 00 7E FF FF _...^.Sj.WV..~..
0070F880 83 C4 0C 83 06 FF 8B D8 75 0C 8B 46 04 8B 48 18 ........u..F..H.
0070F890 56 FF D1 83 C4 04 83 07 FF 75 0C 8B 57 04 8B 42 V........u..W..B
0070F8A0 18 57 FF D0 83 C4 04 85 DB 75 07 5B 5F 83 C8 FF .W.......u.[_...
0070F8B0 5E C3 83 03 FF 75 0C 8B 4B 04 8B 51 18 53 FF D2 ^....u..K..Q.S..
0070F8C0 83 C4 04 5B 5F 33 C0 5E C3 CC CC CC CC CC CC CC ...[_3.^........
0070F8D0 A1 A0 D3 A6 00 85 C0 75 17 68 00 0B 8D 00 E8 8D .......u.h......
0070F8E0 21 FE FF 83 C4 04 85 C0 A3 A0 D3 A6 00 75 01 C3 !............u..
0070F8F0 56 50 8B 44 24 0C 50 E8 54 F9 FF FF 8B F0 83 C4 VP.D$.P.T.......
0070F900 08 85 F6 75 02 5E C3 8B 4C 24 0C 57 51 68 10 86 ...u.^..L$.WQh..
0070F910 8D 00 56 E8 E8 3E FF FF 83 C4 0C 83 06 FF 8B F8 ..V..>..........
0070F920 75 0C 8B 56 04 8B 42 18 56 FF D0 83 C4 04 8B C7 u..V..B.V.......
0070F930 5F 5E C3 CC CC CC CC CC CC CC CC CC CC CC CC CC _^..............
0070F940 A1 D8 D3 A6 00 85 C0 75 17 68 D4 0A 8D 00 E8 1D .......u.h......
0070F950 21 FE FF 83 C4 04 85 C0 A3 D8 D3 A6 00 75 01 C3 !............u..
0070F960 56 57 8B 7C 24 0C 50 57 E8 E3 F8 FF FF 8B F0 83 VW.|$.PW........
0070F970 C4 08 85 F6 75 69 A1 F0 78 A1 00 50 E8 8F 17 FD ....ui..x..P....
0070F980 FF 83 C4 04 85 C0 0F 84 81 00 00 00 E8 CF 17 FD ................
0070F990 FF A1 A0 D3 A6 00 85 C0 75 16 68 00 0B 8D 00 E8 ........u.h.....
0070F9A0 CC 20 FE FF 83 C4 04 85 C0 A3 A0 D3 A6 00 74 5D . ............t]
0070F9B0 50 57 E8 99 F8 FF FF 8B F0 83 C4 08 85 F6 74 4D PW............tM
0070F9C0 8B 4C 24 14 8B 54 24 10 51 52 E8 61 F8 01 00 50 .L$..T$.QR.a...P
0070F9D0 68 5C 1F 8D 00 E8 26 A8 FD FF 83 C4 10 EB 17 8B h\....&.........
0070F9E0 44 24 14 8B 4C 24 10 50 51 68 F8 15 8D 00 E8 0D D$..L$.PQh......
0070F9F0 A8 FD FF 83 C4 0C 8B F8 85 FF 75 16 83 06 FF 75 ..........u....u
0070FA00 0C 8B 56 04 8B 42 18 56 FF D0 83 C4 04 5F 33 C0 ..V..B.V....._3.
0070FA10 5E C3 53 6A 00 57 56 E8 64 7C FF FF 83 C4 0C 83 ^.Sj.WV.d|......
0070FA20 06 FF 8B D8 75 0C 8B 4E 04 8B 51 18 56 FF D2 83 ....u..N..Q.V...
0070FA30 C4 04 83 07 FF 75 0C 8B 47 04 8B 48 18 57 FF D1 .....u..G..H.W..
0070FA40 83 C4 04 8B C3 5B 5F 5E C3 CC CC CC CC CC CC CC .....[_^........
0070FA50 56 57 8B 7C 24 14 85 FF 75 27 A1 C0 D3 A6 00 85 VW.|$...u'......
0070FA60 C0 75 16 68 30 0A 8D 00 E8 03 20 FE FF 83 C4 04 .u.h0..... .....
0070FA70 85 C0 A3 C0 D3 A6 00 74 78 50 8B 44 24 10 50 EB .......txP.D$.P.
0070FA80 25 A1 90 D3 A6 00 85 C0 75 16 68 5C 0A 8D 00 E8 %.......u.h\....
0070FA90 DC 1F FE FF 83 C4 04 85 C0 A3 90 D3 A6 00 74 51 ..............tQ
0070FAA0 8B 4C 24 0C 50 51 E8 A5 F7 FF FF 8B F0 83 C4 08 .L$.PQ..........
0070FAB0 85 F6 74 3D 85 FF 75 0F 8B 54 24 10 52 E8 5E 56 ..t=..u..T$.R.^V
0070FAC0 FF FF 83 C4 04 EB 13 8B 44 24 10 57 50 68 00 16 ........D$.WPh..
0070FAD0 8D 00 E8 29 A7 FD FF 83 C4 0C 8B F8 85 FF 75 17 ...)..........u.
0070FAE0 83 06 FF 75 0C 8B 4E 04 8B 51 18 56 FF D2 83 C4 ...u..N..Q.V....
0070FAF0 04 5F 83 C8 FF 5E C3 53 6A 00 57 56 E8 7F 7B FF ._...^.Sj.WV..{.
0070FB00 FF 83 C4 0C 83 06 FF 8B D8 75 0C 8B 46 04 8B 48 .........u..F..H
0070FB10 18 56 FF D1 83 C4 04 83 07 FF 75 0C 8B 57 04 8B .V........u..W..
0070FB20 42 18 57 FF D0 83 C4 04 85 DB 75 07 5B 5F 83 C8 B.W.......u.[_..
0070FB30 FF 5E C3 83 03 FF 75 0C 8B 4B 04 8B 51 18 53 FF .^....u..K..Q.S.
0070FB40 D2 83 C4 04 5B 5F 33 C0 5E C3 CC CC CC CC CC CC ....[_3.^.......
0070FB50 53 8B 5C 24 14 85 DB 56 57 0F 85 BF 00 00 00 A1 S.\$...VW.......
0070FB60 AC D3 A6 00 85 C0 75 1A 68 80 09 8D 00 E8 FE 1E ......u.h.......
0070FB70 FE FF 83 C4 04 85 C0 A3 AC D3 A6 00 0F 84 70 01 ..............p.
0070FB80 00 00 8B 7C 24 10 50 57 E8 C3 F6 FF FF 8B F0 83 ...|$.PW........
0070FB90 C4 08 85 F6 75 6C A1 F0 78 A1 00 50 E8 6F 15 FD ....ul..x..P.o..
0070FBA0 FF 83 C4 04 85 C0 0F 84 46 01 00 00 E8 AF 15 FD ........F.......
0070FBB0 FF A1 C0 D3 A6 00 85 C0 75 1A 68 30 0A 8D 00 E8 ........u.h0....
0070FBC0 AC 1E FE FF 83 C4 04 85 C0 A3 C0 D3 A6 00 0F 84 ................
0070FBD0 1E 01 00 00 50 57 E8 75 F6 FF FF 8B F0 83 C4 08 ....PW.u........
0070FBE0 85 F6 0F 84 0A 01 00 00 8B 4C 24 18 8B 54 24 14 .........L$..T$.
0070FBF0 51 52 E8 39 F6 01 00 50 68 5C 1F 8D 00 E9 D1 00 QR.9...Ph\......
0070FC00 00 00 8B 44 24 18 8B 4C 24 14 50 51 68 F8 15 8D ...D$..L$.PQh...
0070FC10 00 E8 EA A5 FD FF 83 C4 0C E9 BD 00 00 00 A1 E8 ................
0070FC20 D3 A6 00 85 C0 75 1A 68 00 0A 8D 00 E8 3F 1E FE .....u.h.....?..
0070FC30 FF 83 C4 04 85 C0 A3 E8 D3 A6 00 0F 84 B1 00 00 ................
0070FC40 00 8B 7C 24 10 50 57 E8 04 F6 FF FF 8B F0 83 C4 ..|$.PW.........
0070FC50 08 85 F6 75 6E 8B 15 F0 78 A1 00 52 E8 AF 14 FD ...un...x..R....
0070FC60 FF 83 C4 04 85 C0 0F 84 86 00 00 00 E8 EF 14 FD ................
0070FC70 FF A1 90 D3 A6 00 85 C0 75 16 68 5C 0A 8D 00 E8 ........u.h\....
0070FC80 EC 1D FE FF 83 C4 04 85 C0 A3 90 D3 A6 00 74 62 ..............tb
0070FC90 50 57 E8 B9 F5 FF FF 8B F0 83 C4 08 85 F6 74 52 PW............tR
0070FCA0 8B 44 24 18 8B 4C 24 14 53 50 51 E8 80 F5 01 00 .D$..L$.SPQ.....
0070FCB0 83 C4 08 50 68 C0 10 8D 00 E8 42 A5 FD FF 83 C4 ...Ph.....B.....
0070FCC0 0C EB 18 8B 54 24 18 8B 44 24 14 53 52 50 68 0C ....T$..D$.SRPh.
0070FCD0 16 8D 00 E8 28 A5 FD FF 83 C4 10 8B F8 85 FF 75 ....(..........u
0070FCE0 18 83 06 FF 75 0C 8B 4E 04 8B 51 18 56 FF D2 83 ....u..N..Q.V...
0070FCF0 C4 04 5F 5E 83 C8 FF 5B C3 6A 00 57 56 E8 7E 79 .._^...[.j.WV.~y
0070FD00 FF FF 83 C4 0C 83 06 FF 8B D8 75 0C 8B 46 04 8B ..........u..F..
0070FD10 48 18 56 FF D1 83 C4 04 83 07 FF 75 0C 8B 57 04 H.V........u..W.
0070FD20 8B 42 18 57 FF D0 83 C4 04 85 DB 74 C5 83 03 FF .B.W.......t....
0070FD30 75 0C 8B 4B 04 8B 51 18 53 FF D2 83 C4 04 5F 5E u..K..Q.S....._^
0070FD40 33 C0 5B C3 CC CC CC CC CC CC CC CC CC CC CC CC 3.[.............
0070FD50 A1 EC D3 A6 00 85 C0 75 1A 68 FC 08 8D 00 E8 0D .......u.h......
0070FD60 1D FE FF 83 C4 04 85 C0 A3 EC D3 A6 00 75 04 83 .............u..
0070FD70 C8 FF C3 56 57 8B 7C 24 0C 50 57 E8 D0 F4 FF FF ...VW.|$.PW.....
0070FD80 8B F0 83 C4 08 85 F6 0F 84 84 00 00 00 8B 44 24 ..............D$
0070FD90 10 53 50 6A 01 E8 E6 01 FD FF 8B D8 83 C4 08 85 .SPj............
0070FDA0 DB 75 18 83 06 FF 75 0C 8B 4E 04 8B 51 18 56 FF .u....u..N..Q.V.
0070FDB0 D2 83 C4 04 5B 5F 83 C8 FF 5E C3 6A 00 53 56 E8 ....[_...^.j.SV.
0070FDC0 BC 78 FF FF 83 C4 0C 83 06 FF 8B F8 75 0C 8B 46 .x..........u..F
0070FDD0 04 8B 48 18 56 FF D1 83 C4 04 83 03 FF 75 0C 8B ..H.V........u..
0070FDE0 53 04 8B 42 18 53 FF D0 83 C4 04 85 FF 74 C5 57 S..B.S.......t.W
0070FDF0 E8 9B EC FC FF 83 C4 04 83 07 FF 8B F0 75 0C 8B .............u..
0070FE00 4F 04 8B 51 18 57 FF D2 83 C4 04 5B 5F 8B C6 5E O..Q.W.....[_..^
0070FE10 C3 A1 F0 78 A1 00 50 E8 F4 12 FD FF 83 C4 04 85 ...x..P.........
0070FE20 C0 74 25 E8 38 13 FD FF 8B 4C 24 10 6A 03 51 57 .t%.8....L$.j.QW
0070FE30 E8 0B 50 FF FF 83 C4 0C 85 C0 7C 0C 33 D2 85 C0 ..P.......|.3...
0070FE40 0F 9F C2 5F 5E 8B C2 C3 5F 83 C8 FF 5E C3 CC CC ..._^..._...^...
0070FE50 A1 00 D4 A6 00 85 C0 75 17 68 A8 06 8D 00 E8 0D .......u.h......
0070FE60 1C FE FF 83 C4 04 85 C0 A3 00 D4 A6 00 75 01 C3 .............u..
0070FE70 56 50 8B 44 24 0C 50 E8 D4 F3 FF FF 8B F0 83 C4 VP.D$.P.........
0070FE80 08 85 F6 75 02 5E C3 57 6A 00 6A 00 56 E8 EE 77 ...u.^.Wj.j.V..w
0070FE90 FF FF 83 C4 0C 83 06 FF 8B F8 75 0C 8B 4E 04 8B ..........u..N..
0070FEA0 51 18 56 FF D2 83 C4 04 8B C7 5F 5E C3 CC CC CC Q.V......._^....
0070FEB0 A1 D0 D3 A6 00 85 C0 75 17 68 8C 06 8D 00 E8 AD .......u.h......
0070FEC0 1B FE FF 83 C4 04 85 C0 A3 D0 D3 A6 00 75 01 C3 .............u..
0070FED0 56 50 8B 44 24 0C 50 E8 74 F3 FF FF 8B F0 83 C4 VP.D$.P.t.......
0070FEE0 08 85 F6 75 02 5E C3 57 6A 00 6A 00 56 E8 8E 77 ...u.^.Wj.j.V..w
0070FEF0 FF FF 83 C4 0C 83 06 FF 8B F8 75 0C 8B 4E 04 8B ..........u..N..
0070FF00 51 18 56 FF D2 83 C4 04 8B C7 5F 5E C3 CC CC CC Q.V......._^....
0070FF10 A1 F4 D3 A6 00 85 C0 75 17 68 70 06 8D 00 E8 4D .......u.hp....M
0070FF20 1B FE FF 83 C4 04 85 C0 A3 F4 D3 A6 00 75 01 C3 .............u..
0070FF30 56 50 8B 44 24 0C 50 E8 14 F3 FF FF 8B F0 83 C4 VP.D$.P.........
0070FF40 08 85 F6 75 02 5E C3 57 6A 00 6A 00 56 E8 2E 77 ...u.^.Wj.j.V..w
0070FF50 FF FF 83 C4 0C 83 06 FF 8B F8 75 0C 8B 4E 04 8B ..........u..N..
0070FF60 51 18 56 FF D2 83 C4 04 8B C7 5F 5E C3 CC CC CC Q.V......._^....
0070FF70 A1 80 D3 A6 00 85 C0 75 1A 68 4C 06 8D 00 E8 ED .......u.hL.....
0070FF80 1A FE FF 83 C4 04 85 C0 A3 80 D3 A6 00 75 04 83 .............u..
0070FF90 C8 FF C3 56 57 8B 7C 24 0C 50 57 E8 B0 F2 FF FF ...VW.|$.PW.....
0070FFA0 8B F0 83 C4 08 85 F6 75 72 A1 F0 78 A1 00 50 E8 .......ur..x..P.
0070FFB0 5C 11 FD FF 83 C4 04 85 C0 0F 84 F9 00 00 00 E8 \...............
0070FFC0 9C 11 FD FF A1 0C D4 A6 00 85 C0 75 1A 68 88 0B ...........u.h..
0070FFD0 8D 00 E8 99 1A FE FF 83 C4 04 85 C0 A3 0C D4 A6 ................
0070FFE0 00 0F 84 D1 00 00 00 50 57 E8 62 F2 FF FF 8B F0 .......PW.b.....
0070FFF0 83 C4 08 85 F6 75 24 8B 0D F0 78 A1 00 51 E8 0D .....u$...x..Q..
00710000 11 FD FF 83 C4 04 85 C0 0F 84 AA 00 00 00 E8 4D ...............M
00710010 11 FD FF 5F B8 01 00 00 00 5E C3 6A 00 6A 00 56 ..._.....^.j.j.V
00710020 E8 5B 76 FF FF 83 C4 0C 83 06 FF 8B F8 75 0C 8B .[v..........u..
00710030 56 04 8B 42 18 56 FF D0 83 C4 04 85 FF 74 79 8B V..B.V.......ty.
00710040 47 04 3D E8 E7 A1 00 74 3C 68 E8 E7 A1 00 50 E8 G.=....t<h....P.
00710050 1C 56 FC FF 83 C4 08 85 C0 75 2A 83 07 FF 75 0C .V.......u*...u.
00710060 8B 4F 04 8B 51 18 57 FF D2 83 C4 04 A1 7C 6B A1 .O..Q.W......|k.
00710070 00 68 34 86 8D 00 50 E8 04 0F FD FF 83 C4 08 5F .h4...P........_
00710080 83 C8 FF 5E C3 57 E8 15 51 FF FF 83 C4 04 83 07 ...^.W..Q.......
00710090 FF 8B F0 75 0C 8B 4F 04 8B 51 18 57 FF D2 83 C4 ...u..O..Q.W....
007100A0 04 85 F6 7D 19 A1 2C 7E A1 00 68 14 86 8D 00 50 ...}..,~..h....P
007100B0 E8 CB 0E FD FF 83 C4 08 5F 83 C8 FF 5E C3 33 C0 ........_...^.3.
007100C0 85 F6 5F 0F 9F C0 5E C3 CC CC CC CC CC CC CC CC .._...^.........
007100D0 A1 10 D4 A6 00 85 C0 75 17 68 B8 03 8D 00 E8 8D .......u.h......
007100E0 19 FE FF 83 C4 04 85 C0 A3 10 D4 A6 00 75 01 C3 .............u..
007100F0 56 50 8B 44 24 0C 50 E8 54 F1 FF FF 8B F0 83 C4 VP.D$.P.T.......
00710100 08 85 F6 75 30 8B 0D F0 78 A1 00 51 E8 FF 0F FD ...u0...x..Q....
00710110 FF 83 C4 04 85 C0 74 19 E8 43 10 FD FF 8B 15 7C ......t..C.....|
00710120 6B A1 00 68 58 86 8D 00 52 E8 52 0E FD FF 83 C4 k..hX...R.R.....
00710130 08 33 C0 5E C3 57 6A 00 6A 00 56 E8 40 75 FF FF .3.^.Wj.j.V.@u..
00710140 83 C4 0C 83 06 FF 8B F8 75 0C 8B 46 04 8B 48 18 ........u..F..H.
00710150 56 FF D1 83 C4 04 8B C7 5F 5E C3 CC CC CC CC CC V......._^......
00710160 A1 E0 D3 A6 00 85 C0 75 17 68 24 06 8D 00 E8 FD .......u.h$.....
00710170 18 FE FF 83 C4 04 85 C0 A3 E0 D3 A6 00 75 01 C3 .............u..
00710180 56 50 8B 44 24 0C 50 E8 C4 F0 FF FF 8B F0 83 C4 VP.D$.P.........
00710190 08 85 F6 75 02 5E C3 57 6A 00 6A 00 56 E8 DE 74 ...u.^.Wj.j.V..t
007101A0 FF FF 83 C4 0C 83 06 FF 8B F8 75 0C 8B 4E 04 8B ..........u..N..
007101B0 51 18 56 FF D2 83 C4 04 8B C7 5F 5E C3 CC CC CC Q.V......._^....
007101C0 A1 BC D3 A6 00 85 C0 75 17 68 6C 04 8D 00 E8 9D .......u.hl.....
007101D0 18 FE FF 83 C4 04 85 C0 A3 BC D3 A6 00 75 01 C3 .............u..
007101E0 56 50 8B 44 24 0C 50 E8 64 F0 FF FF 8B F0 83 C4 VP.D$.P.d.......
007101F0 08 85 F6 75 02 5E C3 57 6A 00 6A 00 56 E8 7E 74 ...u.^.Wj.j.V.~t
00710200 FF FF 83 C4 0C 83 06 FF 8B F8 75 0C 8B 4E 04 8B ..........u..N..
00710210 51 18 56 FF D2 83 C4 04 8B C7 5F 5E C3 CC CC CC Q.V......._^....
00710220 A1 B0 D3 A6 00 85 C0 75 17 68 48 04 8D 00 E8 3D .......u.hH....=
00710230 18 FE FF 83 C4 04 85 C0 A3 B0 D3 A6 00 75 01 C3 .............u..
00710240 56 8B 74 24 08 50 56 E8 A4 E1 FC FF 83 C4 08 85 V.t$.PV.........
00710250 C0 74 3D A1 B0 D3 A6 00 50 56 E8 F1 EF FF FF 8B .t=.....PV......
00710260 F0 83 C4 08 85 F6 75 02 5E C3 57 6A 00 6A 00 56 ......u.^.Wj.j.V
00710270 E8 0B 74 FF FF 83 C4 0C 83 06 FF 8B F8 75 0C 8B ..t..........u..
00710280 4E 04 8B 51 18 56 FF D2 83 C4 04 8B C7 5F 5E C3 N..Q.V......._^.
00710290 56 E8 2A FF FF FF 83 C4 04 5E C3 CC CC CC CC CC V.*......^......
007102A0 A1 B4 D3 A6 00 85 C0 75 17 68 20 04 8D 00 E8 BD .......u.h .....
007102B0 17 FE FF 83 C4 04 85 C0 A3 B4 D3 A6 00 75 01 C3 .............u..
007102C0 56 50 8B 44 24 0C 50 E8 84 EF FF FF 8B F0 83 C4 VP.D$.P.........
007102D0 08 85 F6 75 02 5E C3 57 6A 00 6A 00 56 E8 9E 73 ...u.^.Wj.j.V..s
007102E0 FF FF 83 C4 0C 83 06 FF 8B F8 75 0C 8B 4E 04 8B ..........u..N..
007102F0 51 18 56 FF D2 83 C4 04 8B C7 5F 5E C3 CC CC CC Q.V......._^....
00710300 A1 84 D3 A6 00 85 C0 75 17 68 FC 03 8D 00 E8 5D .......u.h.....]
00710310 17 FE FF 83 C4 04 85 C0 A3 84 D3 A6 00 75 01 C3 .............u..
00710320 56 50 8B 44 24 0C 50 E8 24 EF FF FF 8B F0 83 C4 VP.D$.P.$.......
00710330 08 85 F6 75 02 5E C3 57 6A 00 6A 00 56 E8 3E 73 ...u.^.Wj.j.V.>s
00710340 FF FF 83 C4 0C 83 06 FF 8B F8 75 0C 8B 4E 04 8B ..........u..N..
00710350 51 18 56 FF D2 83 C4 04 8B C7 5F 5E C3 CC CC CC Q.V......._^....
00710360 A1 08 D4 A6 00 85 C0 75 17 68 DC 03 8D 00 E8 FD .......u.h......
00710370 16 FE FF 83 C4 04 85 C0 A3 08 D4 A6 00 75 01 C3 .............u..
00710380 56 50 8B 44 24 0C 50 E8 C4 EE FF FF 8B F0 83 C4 VP.D$.P.........
00710390 08 85 F6 75 02 5E C3 57 6A 00 6A 00 56 E8 DE 72 ...u.^.Wj.j.V..r
007103A0 FF FF 83 C4 0C 83 06 FF 8B F8 75 0C 8B 4E 04 8B ..........u..N..
007103B0 51 18 56 FF D2 83 C4 04 8B C7 5F 5E C3 CC CC CC Q.V......._^....
007103C0 A1 F8 D3 A6 00 85 C0 75 19 68 F4 FE 8C 00 E8 9D .......u.h......
007103D0 16 FE FF 83 C4 04 85 C0 A3 F8 D3 A6 00 75 03 33 .............u.3
007103E0 C0 C3 83 3D A0 D3 A6 00 00 75 1B 68 00 0B 8D 00 ...=.....u.h....
007103F0 E8 7B 16 FE FF 83 C4 04 85 C0 A3 A0 D3 A6 00 74 .{.............t
00710400 DE A1 F8 D3 A6 00 56 57 8B 7C 24 0C 50 57 E8 3D ......VW.|$.PW.=
00710410 EE FF FF 8B F0 83 C4 08 85 F6 74 62 6A 00 6A 00 ..........tbj.j.
00710420 56 E8 5A 72 FF FF 83 C4 0C 83 06 FF 8B F8 75 0C V.Zr..........u.
00710430 8B 46 04 8B 48 18 56 FF D1 83 C4 04 85 FF 74 39 .F..H.V.......t9
00710440 8B 47 04 F6 40 54 80 74 06 83 78 70 00 75 2A 8B .G..@T.t..xp.u*.
00710450 50 0C A1 7C 6B A1 00 52 68 A0 86 8D 00 50 E8 6D P..|k..Rh....P.m
00710460 11 FD FF 83 C4 0C 83 07 FF 75 0C 8B 4F 04 8B 51 .........u..O..Q
00710470 18 57 FF D2 83 C4 04 33 FF 8B C7 5F 5E C3 A1 F0 .W.....3..._^...
00710480 78 A1 00 50 E8 87 0C FD FF 83 C4 04 85 C0 74 2D x..P..........t-
00710490 E8 CB 0C FD FF 8B 0D A0 D3 A6 00 51 57 E8 AE ED ...........QW...
007104A0 FF FF 83 C4 08 85 C0 75 19 8B 15 7C 6B A1 00 68 .......u...|k..h
007104B0 84 86 8D 00 52 E8 C6 0A FD FF 83 C4 08 5F 33 C0 ....R........_3.
007104C0 5E C3 83 00 FF 75 0C 8B 48 04 8B 51 18 50 FF D2 ^....u..H..Q.P..
007104D0 83 C4 04 57 E8 C7 58 01 00 83 C4 04 5F 5E C3 CC ...W..X....._^..
007104E0 A1 9C D3 A6 00 85 C0 75 17 68 D0 FE 8C 00 E8 7D .......u.h.....}
007104F0 15 FE FF 83 C4 04 85 C0 A3 9C D3 A6 00 75 01 C3 .............u..
00710500 56 50 8B 44 24 0C 50 E8 44 ED FF FF 8B F0 83 C4 VP.D$.P.D.......
00710510 08 85 F6 74 46 57 6A 00 6A 00 56 E8 60 71 FF FF ...tFWj.j.V.`q..
00710520 83 C4 0C 83 06 FF 8B F8 75 0C 8B 4E 04 8B 51 18 ........u..N..Q.
00710530 56 FF D2 83 C4 04 85 FF 74 05 8B C7 5F 5E C3 A1 V.......t..._^..
00710540 00 6D A1 00 50 E8 C6 0B FD FF 83 C4 04 85 C0 74 .m..P..........t
00710550 05 E8 0A 0C FD FF 5F 33 C0 5E C3 8B 0D 7C 6B A1 ......_3.^...|k.
00710560 00 68 D0 86 8D 00 51 E8 14 0A FD FF 83 C4 08 33 .h....Q........3
00710570 C0 5E C3 CC CC CC CC CC CC CC CC CC CC CC CC CC .^..............
00710580 56 57 8B 78 08 85 FF 8B F7 7D 02 F7 DE 85 F6 8B VW.x.....}......
00710590 CE 7E 21 8D 54 70 0A 66 83 3A 00 75 0A 83 E9 01 .~!.Tp.f.:.u....
007105A0 83 EA 02 85 C9 7F F0 3B CE 74 09 85 FF 7D 02 F7 .......;.t...}..
007105B0 D9 89 48 08 5F 5E C3 CC CC CC CC CC CC CC CC CC ..H._^..........

;; fn007105C0: 007105C0
;;   Called from:
;;     00712324 (in fn007120F0)
;;     0073691B (in fn007367D0)
fn007105C0 proc
	mov	eax,[esp+4h]
	cmp	eax,7FFFFFFFh
	jle	7105D3h

l007105CB:
	call	6E1210h
	xor	eax,eax
	ret

l007105D3:
	mov	ecx,[0A1F414h]
	mov	edx,[0A1F410h]
	imul	ecx,eax
	push	eax
	lea	eax,[ecx+edx+3h]
	and	eax,0FCh
	push	0A1F400h
	push	eax
	call	723860h
	add	esp,4h
	push	eax
	call	6DDD50h
	add	esp,0Ch
	ret
00710602       CC CC CC CC CC CC CC CC CC CC CC CC CC CC   ..............
00710610 56 57 8B 7C 24 0C 8B 77 08 85 F6 7D 02 F7 DE 81 VW.|$..w...}....
00710620 FE FF FF FF 7F 7E 0A E8 E4 0B FD FF 5F 33 C0 5E .....~......_3.^
00710630 C3 A1 14 F4 A1 00 8B 0D 10 F4 A1 00 0F AF C6 56 ...............V
00710640 8D 54 08 03 83 E2 FC 68 00 F4 A1 00 52 E8 0E 32 .T.....h....R..2
00710650 01 00 83 C4 04 50 E8 F5 D6 FC FF 83 C4 0C 85 C0 .....P..........
00710660 74 24 83 EE 01 8B 4F 08 89 48 08 78 19 8B D7 8D t$....O..H.x....
00710670 4C 70 0C 2B D0 66 8B 3C 0A 66 89 39 83 EE 01 83 Lp.+.f.<.f.9....
00710680 E9 02 85 F6 7D EF 5F 5E C3 CC CC CC CC CC CC CC ....}._^........

;; fn00710690: 00710690
;;   Called from:
;;     00710CC3 (in fn00710CB0)
fn00710690 proc
	push	ebx
	push	esi
	push	edi
	mov	edi,[esp+10h]
	xor	esi,esi
	xor	ebx,ebx
	test	edi,edi
	jge	7106A6h

l0071069F:
	neg	edi
	mov	ebx,1h

l007106A6:
	test	edi,edi
	mov	eax,edi
	jz	7106CBh

l007106AC:
	lea	esp,[esp+0h]

l007106B0:
	add	esi,1h
	shr	eax,0Fh
	jnz	7106B0h

l007106B8:
	cmp	esi,7FFFFFFFh
	jle	7106CBh

l007106C0:
	call	6E1210h
	pop	edi
	pop	esi
	xor	eax,eax
	pop	ebx
	ret

l007106CB:
	mov	eax,[0A1F414h]
	mov	ecx,[0A1F410h]
	imul	eax,esi
	push	esi
	lea	edx,[eax+ecx+3h]
	and	edx,0FCh
	push	0A1F400h
	push	edx
	call	723860h
	add	esp,4h
	push	eax
	call	6DDD50h
	add	esp,0Ch
	test	eax,eax
	jz	710723h

l007106FC:
	test	ebx,ebx
	lea	edx,[eax+0Ch]
	jz	710705h

l00710703:
	neg	esi

l00710705:
	test	edi,edi
	mov	[eax+8h],esi
	mov	ecx,edi
	jz	710723h

l0071070E:
	mov	edi,edi

l00710710:
	mov	esi,ecx
	and	esi,7FFFh
	mov	[edx],si
	add	edx,2h
	shr	ecx,0Fh
	jnz	710710h

l00710723:
	pop	edi
	pop	esi
	pop	ebx
	ret
00710727                      CC CC CC CC CC CC CC CC CC        .........

;; fn00710730: 00710730
;;   Called from:
;;     006E9CDC (in fn006E9BD0)
;;     0071128C (in fn00711280)
fn00710730 proc
	push	esi
	push	edi
	mov	edi,[esp+0Ch]
	xor	esi,esi
	test	edi,edi
	mov	eax,edi
	jz	71075Ah

l0071073E:
	mov	edi,edi

l00710740:
	add	esi,1h
	shr	eax,0Fh
	jnz	710740h

l00710748:
	cmp	esi,7FFFFFFFh
	jle	71075Ah

l00710750:
	call	6E1210h
	pop	edi
	xor	eax,eax
	pop	esi
	ret

l0071075A:
	mov	eax,[0A1F414h]
	mov	ecx,[0A1F410h]
	imul	eax,esi
	push	esi
	lea	edx,[eax+ecx+3h]
	and	edx,0FCh
	push	0A1F400h
	push	edx
	call	723860h
	add	esp,4h
	push	eax
	call	6DDD50h
	add	esp,0Ch
	test	eax,eax
	jz	7107A8h

l0071078B:
	test	edi,edi
	lea	ecx,[eax+0Ch]
	mov	[eax+8h],esi
	jz	7107A8h

l00710795:
	mov	edx,edi
	and	edx,7FFFh
	mov	[ecx],dx
	add	ecx,2h
	shr	edi,0Fh
	jnz	710795h

l007107A8:
	pop	edi
	pop	esi
	ret
007107AB                                  CC CC CC CC CC            .....
007107B0 55 8B EC 83 E4 C0 83 EC 34 DD 45 08 53 56 57 83 U.......4.E.SVW.
007107C0 EC 08 DD 1C 24 C7 44 24 3C 00 00 00 00 FF 15 D4 ....$.D$<.......
007107D0 46 8A 00 83 C4 08 85 C0 75 32 DD 45 08 83 EC 08 F.......u2.E....
007107E0 DD 1C 24 FF 15 D8 45 8A 00 83 C4 08 85 C0 75 1C ..$...E.......u.
007107F0 A1 98 85 A1 00 68 F8 86 8D 00 50 E8 80 07 FD FF .....h....P.....
00710800 83 C4 08 33 C0 5F 5E 5B 8B E5 5D C3 DD 45 08 D9 ...3._^[..]..E..
00710810 EE DF F1 76 0A C7 44 24 34 01 00 00 00 D9 E0 8D ...v..D$4.......
00710820 4C 24 30 51 83 EC 08 DD 1C 24 FF 15 D0 46 8A 00 L$0Q.....$...F..
00710830 8B 44 24 3C DD 5C 24 44 83 C4 0C 85 C0 7F 11 6A .D$<.\$D.......j
00710840 00 E8 4A FE FF FF 83 C4 04 5F 5E 5B 8B E5 5D C3 ..J......_^[..].
00710850 8D 48 FF B8 89 88 88 88 F7 E9 03 D1 C1 FA 03 8B .H..............
00710860 C2 C1 E8 1F 8D 74 02 01 56 E8 52 FD FF FF 8B D8 .....t..V.R.....
00710870 83 C4 04 85 DB 74 8C 8B 44 24 30 DD 44 24 38 83 .....t..D$0.D$8.
00710880 C0 FF 99 B9 0F 00 00 00 F7 F9 83 C2 01 52 83 EC .............R..
00710890 08 DD 1C 24 FF 15 1C 47 8A 00 83 C4 0C 83 C6 FF ...$...G........
007108A0 78 31 8D 7C 73 0C D9 C0 E8 93 47 F8 FF 89 44 24 x1.|s.....G...D$
007108B0 38 DA 64 24 38 6A 0F 83 EC 08 66 89 07 DD 1C 24 8.d$8j....f....$
007108C0 FF 15 1C 47 8A 00 83 EE 01 83 C4 0C 83 EF 02 85 ...G............
007108D0 F6 7D D3 83 7C 24 34 00 DD D8 74 08 8B 53 08 F7 .}..|$4...t..S..
007108E0 DA 89 53 08 5F 5E 8B C3 5B 8B E5 5D C3 CC CC CC ..S._^..[..]....

;; fn007108F0: 007108F0
;;   Called from:
;;     0070525F (in fn007051A0)
fn007108F0 proc
	push	esi
	mov	esi,[esp+8h]
	test	esi,esi
	jz	7109B2h

l007108FD:
	mov	eax,[esi+4h]
	cmp	eax,0A1F400h
	jz	710919h

l00710907:
	push	0A1F400h
	push	eax
	call	6D5670h
	add	esp,8h
	test	eax,eax
	jz	71098Bh

l00710919:
	mov	ecx,[esi+8h]
	xor	eax,eax
	test	ecx,ecx
	push	edi
	mov	edi,1h
	jge	71092Dh

l00710928:
	or	edi,0FFh
	neg	ecx

l0071092D:
	sub	ecx,1h
	push	ebx
	js	71095Bh

l00710933:
	lea	edx,[esi+ecx*2+0Ch]

l00710937:
	movzx	ebx,word ptr [edx]
	mov	esi,eax
	shl	eax,0Fh
	add	eax,ebx
	mov	ebx,eax
	shr	ebx,0Fh
	cmp	ebx,esi
	jnz	710971h

l0071094A:
	sub	ecx,1h
	sub	edx,2h
	test	ecx,ecx
	jge	710937h

l00710954:
	cmp	eax,7FFFFFFFh
	ja	710962h

l0071095B:
	pop	ebx
	imul	eax,edi
	pop	edi
	pop	esi
	ret

l00710962:
	test	edi,edi
	jge	710971h

l00710966:
	cmp	eax,80000000h
	jnz	710971h

l0071096D:
	pop	ebx
	pop	edi
	pop	esi
	ret

l00710971:
	mov	eax,[0A18598h]
	push	8D8738h
	push	eax
	call	6E0F80h
	add	esp,8h
	pop	ebx
	pop	edi
	or	eax,0FFh
	pop	esi
	ret

l0071098B:
	mov	eax,[esi+4h]
	cmp	eax,0A1E7E8h
	jz	7109A7h

l00710995:
	push	0A1E7E8h
	push	eax
	call	6D5670h
	add	esp,8h
	test	eax,eax
	jz	7109B2h

l007109A7:
	push	esi
	call	7051A0h
	add	esp,4h
	pop	esi
	ret

l007109B2:
	push	0DFh
	push	8D8720h
	call	6E1DC0h
	add	esp,8h
	or	eax,0FFh
	pop	esi
	ret
007109C9                            CC CC CC CC CC CC CC          .......

;; fn007109D0: 007109D0
;;   Called from:
;;     00705325 (in fn007052C0)
fn007109D0 proc
	push	esi
	mov	esi,[esp+8h]
	test	esi,esi
	jz	710A6Bh

l007109DD:
	mov	eax,[esi+4h]
	cmp	eax,0A1F400h
	jz	7109F9h

l007109E7:
	push	0A1F400h
	push	eax
	call	6D5670h
	add	esp,8h
	test	eax,eax
	jz	710A6Bh

l007109F9:
	mov	ecx,[esi+8h]
	xor	eax,eax
	test	ecx,ecx
	push	edi
	mov	edi,1h
	jge	710A0Dh

l00710A08:
	or	edi,0FFh
	neg	ecx

l00710A0D:
	sub	ecx,1h
	push	ebx
	js	710A3Bh

l00710A13:
	lea	edx,[esi+ecx*2+0Ch]

l00710A17:
	movzx	ebx,word ptr [edx]
	mov	esi,eax
	shl	eax,0Fh
	add	eax,ebx
	mov	ebx,eax
	shr	ebx,0Fh
	cmp	ebx,esi
	jnz	710A51h

l00710A2A:
	sub	ecx,1h
	sub	edx,2h
	test	ecx,ecx
	jge	710A17h

l00710A34:
	cmp	eax,7FFFFFFFh
	ja	710A42h

l00710A3B:
	pop	ebx
	imul	eax,edi
	pop	edi
	pop	esi
	ret

l00710A42:
	test	edi,edi
	jge	710A51h

l00710A46:
	cmp	eax,80000000h
	jnz	710A51h

l00710A4D:
	pop	ebx
	pop	edi
	pop	esi
	ret

l00710A51:
	mov	eax,[0A18598h]
	push	8D8738h
	push	eax
	call	6E0F80h
	add	esp,8h
	pop	ebx
	pop	edi
	or	eax,0FFh
	pop	esi
	ret

l00710A6B:
	push	10Ch
	push	8D8720h
	call	6E1DC0h
	add	esp,8h
	or	eax,0FFh
	pop	esi
	ret
00710A82       CC CC CC CC CC CC CC CC CC CC CC CC CC CC   ..............
00710A90 56 8B 74 24 08 85 F6 0F 84 C3 00 00 00 8B 46 04 V.t$..........F.
00710AA0 3D 00 F4 A1 00 74 12 68 00 F4 A1 00 50 E8 BE 4B =....t.h....P..K
00710AB0 FC FF 83 C4 08 85 C0 74 65 8B 4E 08 33 C0 85 C9 .......te.N.3...
00710AC0 7D 18 A1 98 85 A1 00 68 80 87 8D 00 50 E8 AE 04 }......h....P...
00710AD0 FD FF 83 C4 08 83 C8 FF 5E C3 83 E9 01 57 78 21 ........^....Wx!
00710AE0 8D 54 4E 0C 0F B7 3A 8B F0 C1 E0 0F 03 C7 8B F8 .TN...:.........
00710AF0 C1 EF 0F 3B FE 75 0D 83 E9 01 83 EA 02 85 C9 7D ...;.u.........}
00710B00 E3 5F 5E C3 8B 0D 98 85 A1 00 68 60 87 8D 00 51 ._^.......h`...Q
00710B10 E8 6B 04 FD FF 83 C4 08 5F 83 C8 FF 5E C3 8B 46 .k......_...^..F
00710B20 04 3D E8 E7 A1 00 74 12 68 E8 E7 A1 00 50 E8 3D .=....t.h....P.=
00710B30 4B FC FF 83 C4 08 85 C0 74 26 56 E8 60 46 FF FF K.......t&V.`F..
00710B40 83 C4 04 85 C0 7D BB 8B 15 98 85 A1 00 68 80 87 .....}.......h..
00710B50 8D 00 52 E8 28 04 FD FF 83 C4 08 83 C8 FF 5E C3 ..R.(.........^.
00710B60 68 42 01 00 00 68 20 87 8D 00 E8 51 12 FD FF 83 hB...h ....Q....
00710B70 C4 08 83 C8 FF 5E C3 CC CC CC CC CC CC CC CC CC .....^..........

;; fn00710B80: 00710B80
;;   Called from:
;;     006E5F91 (in fn006E5C60)
;;     0070538B (in fn00705340)
;;     00705426 (in fn00705340)
fn00710B80 proc
	push	esi
	mov	esi,[esp+8h]
	test	esi,esi
	jz	710C01h

l00710B89:
	mov	eax,[esi+4h]
	cmp	eax,0A1F400h
	jz	710BA5h

l00710B93:
	push	0A1F400h
	push	eax
	call	6D5670h
	add	esp,8h
	test	eax,eax
	jz	710BDAh

l00710BA5:
	mov	ecx,[esi+8h]
	xor	eax,eax
	test	ecx,ecx
	push	edi
	mov	edi,1h
	jge	710BB9h

l00710BB4:
	or	edi,0FFh
	neg	ecx

l00710BB9:
	sub	ecx,1h
	js	710BD4h

l00710BBE:
	lea	edx,[esi+ecx*2+0Ch]

l00710BC2:
	movzx	esi,word ptr [edx]
	shl	eax,0Fh
	sub	ecx,1h
	add	eax,esi
	sub	edx,2h
	test	ecx,ecx
	jge	710BC2h

l00710BD4:
	imul	eax,edi
	pop	edi
	pop	esi
	ret

l00710BDA:
	mov	eax,[esi+4h]
	cmp	eax,0A1E7E8h
	jz	710BF6h

l00710BE4:
	push	0A1E7E8h
	push	eax
	call	6D5670h
	add	esp,8h
	test	eax,eax
	jz	710C01h

l00710BF6:
	push	esi
	call	705340h
	add	esp,4h
	pop	esi
	ret

l00710C01:
	push	167h
	push	8D8720h
	call	6E1DC0h
	add	esp,8h
	or	eax,0FFh
	pop	esi
	ret
00710C18                         CC CC CC CC CC CC CC CC         ........

;; fn00710C20: 00710C20
;;   Called from:
;;     00702C87 (in fn00702C30)
fn00710C20 proc
	mov	eax,[esp+4h]
	mov	eax,[eax+8h]
	test	eax,eax
	jnz	710C2Ch

l00710C2B:
	ret

l00710C2C:
	xor	ecx,ecx
	test	eax,eax
	setge	cl
	lea	ecx,[ecx+ecx-1h]
	mov	eax,ecx
	ret
00710C3A                               CC CC CC CC CC CC           ......
00710C40 8B 54 24 04 8B 42 08 33 C9 85 C0 7D 04 F7 D8 85 .T$..B.3...}....
00710C50 C0 7E 37 0F B7 4C 42 0A 56 8D 70 FF 89 4C 24 08 .~7..LB.V.p..L$.
00710C60 8B CE C1 E1 04 2B CE B8 89 88 88 88 F7 E1 C1 EA .....+..........
00710C70 03 3B D6 5E 75 17 66 8B 44 24 04 EB 03 8D 49 00 .;.^u.f.D$....I.
00710C80 83 C1 01 74 08 66 D1 E8 75 F6 8B C1 C3 8B 15 98 ...t.f..u.......
00710C90 85 A1 00 68 B0 87 8D 00 52 E8 E2 02 FD FF 83 C4 ...h....R.......
00710CA0 08 83 C8 FF C3 CC CC CC CC CC CC CC CC CC CC CC ................

;; fn00710CB0: 00710CB0
;;   Called from:
;;     007114B3 (in fn00705120)
;;     007367B2 (in fn00736780)
fn00710CB0 proc
	sub	esp,8h
	mov	edx,[esp+10h]
	test	edx,edx
	mov	dword ptr [esp],0h
	jnz	710CCFh

l00710CC2:
	push	edx
	call	710690h
	add	esp,4h
	add	esp,8h
	ret

l00710CCF:
	cmp	dword ptr [esp+14h],0h
	push	ebx
	push	edi
	jz	710CECh

l00710CD8:
	mov	eax,[esp+14h]
	mov	ebx,eax
	lea	edi,[eax+edx-1h]
	mov	dword ptr [esp+0Ch],1h
	jmp	710CFCh

l00710CEC:
	mov	edi,[esp+14h]
	lea	ebx,[edi+edx-1h]
	mov	dword ptr [esp+0Ch],0FFFFFFFFh

l00710CFC:
	push	ebp
	mov	ebp,[esp+24h]
	test	ebp,ebp
	jz	710D13h

l00710D05:
	cmp	byte ptr [edi],80h
	sbb	eax,eax
	add	eax,1h
	mov	[esp+24h],eax
	mov	ebp,eax

l00710D13:
	mov	ecx,[esp+10h]
	neg	ecx
	mov	eax,ebp
	neg	eax
	sbb	al,al
	push	esi
	xor	esi,esi
	and	eax,0FFh
	test	edx,edx
	jbe	710D3Dh

l00710D2B:
	jmp	710D30h
00710D2D                                        8D 49 00              .I.

l00710D30:
	cmp	[edi],al
	jnz	710D3Dh

l00710D34:
	add	esi,1h
	add	edi,ecx
	cmp	esi,edx
	jc	710D30h

l00710D3D:
	mov	edi,edx
	sub	edi,esi
	test	ebp,ebp
	jz	710D4Ch

l00710D45:
	cmp	edi,edx
	jnc	710D4Ch

l00710D49:
	add	edi,1h

l00710D4C:
	lea	ecx,[000Eh+edi*8]
	mov	eax,88888889h
	mul	ecx
	shr	edx,3h
	cmp	edx,7FFFFFFFh
	jbe	710D71h

l00710D65:
	pop	esi
	pop	ebp
	pop	edi
	pop	ebx
	add	esp,8h
	jmp	6E1210h

l00710D71:
	jle	710D82h

l00710D73:
	call	6E1210h
	pop	esi
	pop	ebp
	pop	edi
	xor	eax,eax
	pop	ebx
	add	esp,8h
	ret

l00710D82:
	mov	eax,[0A1F414h]
	mov	ecx,[0A1F410h]
	imul	eax,edx
	push	edx
	lea	edx,[eax+ecx+3h]
	and	edx,0FCh
	push	0A1F400h
	push	edx
	call	723860h
	add	esp,4h
	push	eax
	call	6DDD50h
	mov	edx,eax
	add	esp,0Ch
	test	edx,edx
	mov	[esp+20h],edx
	jnz	710DC1h

l00710DB9:
	pop	esi
	pop	ebp
	pop	edi
	pop	ebx
	add	esp,8h
	ret

l00710DC1:
	xor	esi,esi
	xor	ecx,ecx
	test	edi,edi
	mov	ebp,1h
	mov	eax,ebx
	jbe	710E36h

l00710DD0:
	lea	ebx,[edx+0Ch]

l00710DD3:
	cmp	dword ptr [esp+28h],0h
	movzx	edx,byte ptr [eax]
	jz	710DF0h

l00710DDD:
	xor	edx,0FFh
	add	edx,ebp
	mov	ebp,edx
	shr	ebp,8h
	and	edx,0FFh

l00710DF0:
	shl	edx,cl
	add	ecx,8h
	or	esi,edx
	cmp	ecx,0Fh
	jc	710E15h

l00710DFC:
	add	dword ptr [esp+10h],1h
	mov	edx,esi
	and	edx,7FFFh
	mov	[ebx],dx
	add	ebx,2h
	shr	esi,0Fh
	sub	ecx,0Fh

l00710E15:
	add	eax,[esp+14h]
	sub	edi,1h
	jnz	710DD3h

l00710E1E:
	test	ecx,ecx
	mov	eax,[esp+10h]
	mov	edx,[esp+20h]
	jz	710E38h

l00710E2A:
	mov	ecx,edx
	mov	[ecx+eax*2+0Ch],si
	add	eax,1h
	jmp	710E38h

l00710E36:
	mov	eax,ecx

l00710E38:
	cmp	dword ptr [esp+28h],0h
	jz	710E41h

l00710E3F:
	neg	eax

l00710E41:
	test	eax,eax
	mov	[edx+8h],eax
	mov	esi,eax
	jge	710E4Ch

l00710E4A:
	neg	esi

l00710E4C:
	test	esi,esi
	mov	ecx,esi
	jle	710E7Bh

l00710E52:
	lea	edx,[edx+esi*2+0Ah]

l00710E56:
	cmp	word ptr [edx],0h
	jnz	710E66h

l00710E5C:
	sub	ecx,1h
	sub	edx,2h
	test	ecx,ecx
	jg	710E56h

l00710E66:
	cmp	ecx,esi
	jz	710E77h

l00710E6A:
	test	eax,eax
	jge	710E70h

l00710E6E:
	neg	ecx

l00710E70:
	mov	edx,[esp+20h]
	mov	[edx+8h],ecx

l00710E77:
	mov	edx,[esp+20h]

l00710E7B:
	pop	esi
	pop	ebp
	pop	edi
	mov	eax,edx
	pop	ebx
	add	esp,8h
	ret
00710E85                CC CC CC CC CC CC CC CC CC CC CC      ...........

;; fn00710E90: 00710E90
;;   Called from:
;;     00711672 (in fn007114E0)
fn00710E90 proc
	mov	eax,[esp+4h]
	mov	eax,[eax+8h]
	sub	esp,18h
	xor	ecx,ecx
	cmp	eax,ecx
	push	ebp
	mov	ebp,1h
	jge	710ED4h

l00710EA6:
	neg	eax
	cmp	[esp+30h],ecx
	mov	[esp+8h],eax
	jnz	710ECEh

l00710EB2:
	mov	ecx,[0A16B7Ch]
	push	8D8800h
	push	ecx
	call	6E0F80h
	add	esp,8h
	or	eax,0FFh
	pop	ebp
	add	esp,18h
	ret

l00710ECE:
	mov	[esp+4h],ebp
	jmp	710EDCh

l00710ED4:
	mov	[esp+8h],eax
	mov	[esp+4h],ecx

l00710EDC:
	cmp	[esp+2Ch],ecx
	push	esi
	jz	710EE9h

l00710EE3:
	mov	esi,[esp+28h]
	jmp	710EF8h

l00710EE9:
	mov	edx,[esp+28h]
	mov	eax,[esp+2Ch]
	lea	esi,[edx+eax-1h]
	or	ebp,0FFh

l00710EF8:
	push	ebx
	xor	edx,edx
	push	edi
	xor	edi,edi
	xor	ebx,ebx
	cmp	[esp+10h],ecx
	mov	[esp+20h],ebp
	setnz	dl
	cmp	[esp+14h],ecx
	mov	[esp+24h],edi
	mov	[esp+18h],ecx
	mov	[esp+1Ch],edx
	jle	710FFEh

l00710F21:
	mov	eax,[esp+2Ch]
	add	eax,0Ch
	mov	[esp+2Ch],eax
	lea	esp,[esp+0h]

l00710F30:
	cmp	dword ptr [esp+10h],0h
	mov	edx,[esp+2Ch]
	movzx	eax,word ptr [edx]
	jz	710F55h

l00710F3E:
	xor	eax,7FFFh
	add	eax,[esp+1Ch]
	mov	edx,eax
	shr	edx,0Fh
	mov	[esp+1Ch],edx
	and	eax,7FFFh

l00710F55:
	mov	edx,eax
	shl	edx,cl
	add	ecx,0Fh
	or	ebx,edx
	mov	edx,[esp+14h]
	add	edx,0FFh
	cmp	[esp+18h],edx
	jnz	710FA2h

l00710F6B:
	mov	ebp,[esp+10h]
	shl	eax,11h
	mov	edi,eax
	mov	edx,0h
	mov	eax,edx
	sets	al
	cmp	eax,ebp
	jnz	710F98h

l00710F82:
	cmp	edx,0Fh
	jnc	710F98h

l00710F87:
	add	edx,1h
	add	edi,edi
	mov	eax,0h
	sets	al
	cmp	eax,ebp
	jz	710F82h

l00710F98:
	mov	ebp,[esp+20h]
	mov	edi,[esp+24h]
	sub	ecx,edx

l00710FA2:
	cmp	ecx,8h
	jc	710FC3h

l00710FA7:
	cmp	edi,[esp+34h]
	jnc	711022h

l00710FAD:
	mov	[esi],bl
	add	edi,1h
	sub	ecx,8h
	add	esi,ebp
	shr	ebx,8h
	cmp	ecx,8h
	mov	[esp+24h],edi
	jnc	710FA7h

l00710FC3:
	add	dword ptr [esp+18h],1h
	mov	edx,[esp+14h]
	add	dword ptr [esp+2Ch],2h
	cmp	[esp+18h],edx
	jl	710F30h

l00710FDB:
	test	ecx,ecx
	jbe	710FFEh

l00710FDF:
	mov	edx,[esp+34h]
	cmp	edi,edx
	jnc	711022h

l00710FE7:
	add	edi,1h
	cmp	dword ptr [esp+10h],0h
	jz	710FF8h

l00710FF1:
	or	eax,0FFh
	shl	eax,cl
	or	ebx,eax

l00710FF8:
	mov	[esi],bl
	add	esi,ebp
	jmp	711045h

l00710FFE:
	cmp	edi,[esp+34h]
	jnz	711041h
