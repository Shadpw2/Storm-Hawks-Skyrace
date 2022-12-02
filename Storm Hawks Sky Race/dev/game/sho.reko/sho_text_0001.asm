;;; Segment .text (00401000)

;; fn00411910: 00411910
;;   Called from:
;;     00411E11 (in fn00411D40)
;;     00411E9F (in fn00411D40)
fn00411910 proc
	push	esi
	mov	esi,[esp+0Ch]
	test	esi,esi
	push	edi
	mov	edi,[esp+0Ch]
	mov	eax,esi
	mov	ecx,edi
	jbe	411934h

l00411922:
	mov	edx,[esp+14h]

l00411926:
	fld	dword ptr [edx]
	sub	eax,1h
	fstp	dword ptr [ecx]
	add	ecx,4h
	test	eax,eax
	ja	411926h

l00411934:
	lea	eax,[edi+esi*4]
	pop	edi
	pop	esi
	ret	0Ch
0041193C                                     CC CC CC CC             ....
00411940 51 8B 54 24 10 56 8B 74 24 10 57 8B 7C 24 10 C6 Q.T$.V.t$.W.|$..
00411950 44 24 08 00 8B 44 24 08 50 8B 44 24 1C 52 51 50 D$...D$.P.D$.RQP
00411960 56 57 E8 D9 C8 FF FF 83 C4 18 8D 0C F5 00 00 00 VW..............
00411970 00 2B CE 8D 04 8F 5F 5E 59 C2 0C 00 CC CC CC CC .+...._^Y.......

;; fn00411980: 00411980
;;   Called from:
;;     0041202E (in fn00411F00)
;;     004120EC (in fn00411F00)
fn00411980 proc
	push	ecx
	mov	edx,[esp+10h]
	push	esi
	mov	esi,[esp+10h]
	push	edi
	mov	edi,[esp+10h]
	mov	byte ptr [esp+8h],0h
	mov	eax,[esp+8h]
	push	eax
	mov	eax,[esp+1Ch]
	push	edx
	push	ecx
	push	eax
	push	esi
	push	edi
	call	5410E0h
	mov	eax,esi
	add	esp,18h
	shl	eax,6h
	add	eax,edi
	pop	edi
	pop	esi
	pop	ecx
	ret	0Ch
004119B7                      CC CC CC CC CC CC CC CC CC        .........

;; fn004119C0: 004119C0
;;   Called from:
;;     00412E94 (in fn00412E50)
;;     00623BB9 (in fn00623A00)
;;     00623CA0 (in fn00623A00)
fn004119C0 proc
	mov	eax,[esp+0Ch]
	push	ebx
	push	esi
	mov	esi,ecx
	mov	ecx,[eax]
	mov	[esp+14h],ecx
	mov	ecx,[esi+4h]
	test	ecx,ecx
	push	edi
	jnz	4119DAh

l004119D6:
	xor	edi,edi
	jmp	4119E2h

l004119DA:
	mov	edi,[esi+0Ch]
	sub	edi,ecx
	sar	edi,2h

l004119E2:
	mov	ebx,[esp+14h]
	test	ebx,ebx
	jz	411B6Fh

l004119EE:
	test	ecx,ecx
	jnz	4119F6h

l004119F2:
	xor	eax,eax
	jmp	4119FEh

l004119F6:
	mov	eax,[esi+8h]
	sub	eax,ecx
	sar	eax,2h

l004119FE:
	mov	edx,3FFFFFFFh
	sub	edx,eax
	cmp	edx,ebx
	jnc	411A0Eh

l00411A09:
	call	40DA20h

l00411A0E:
	test	ecx,ecx
	jnz	411A16h

l00411A12:
	xor	eax,eax
	jmp	411A1Eh

l00411A16:
	mov	eax,[esi+8h]
	sub	eax,ecx
	sar	eax,2h

l00411A1E:
	add	eax,ebx
	cmp	edi,eax
	push	ebp
	jnc	411ADDh

l00411A29:
	mov	eax,edi
	shr	eax,1h
	mov	edx,3FFFFFFFh
	sub	edx,eax
	cmp	edx,edi
	jnc	411A3Ch

l00411A38:
	xor	edi,edi
	jmp	411A3Eh

l00411A3C:
	add	edi,eax

l00411A3E:
	test	ecx,ecx
	jnz	411A46h

l00411A42:
	xor	eax,eax
	jmp	411A4Eh

l00411A46:
	mov	eax,[esi+8h]
	sub	eax,ecx
	sar	eax,2h

l00411A4E:
	add	eax,ebx
	cmp	edi,eax
	jnc	411A66h

l00411A54:
	test	ecx,ecx
	jnz	411A5Ch

l00411A58:
	xor	edi,edi
	jmp	411A64h

l00411A5C:
	mov	edi,[esi+8h]
	sub	edi,ecx
	sar	edi,2h

l00411A64:
	add	edi,ebx

l00411A66:
	push	0h
	push	edi
	call	7B2480h
	mov	ecx,[esi+4h]
	add	esp,8h
	mov	ebp,eax
	mov	eax,[esp+14h]
	push	ebp
	push	eax
	push	ecx
	mov	ecx,esi
	call	7B2800h
	lea	edx,[esp+1Ch]
	push	edx
	push	ebx
	push	eax
	mov	ecx,esi
	call	669E20h
	mov	ecx,[esp+14h]
	push	eax
	mov	eax,[esi+8h]
	push	eax
	push	ecx
	mov	ecx,esi
	call	7B2800h
	mov	eax,[esi+4h]
	test	eax,eax
	jnz	411AAEh

l00411AAA:
	xor	ecx,ecx
	jmp	411AB6h

l00411AAE:
	mov	ecx,[esi+8h]
	sub	ecx,eax
	sar	ecx,2h

l00411AB6:
	add	ebx,ecx
	test	eax,eax
	jz	411AC5h

l00411ABC:
	push	eax
	call	694FC6h
	add	esp,4h

l00411AC5:
	lea	edx,[ebp+edi*4+0h]
	lea	eax,[ebp+ebx*4+0h]
	mov	[esi+4h],ebp
	pop	ebp
	pop	edi
	mov	[esi+0Ch],edx
	mov	[esi+8h],eax
	pop	esi
	pop	ebx
	ret	0Ch

l00411ADD:
	mov	ebp,[esi+8h]
	mov	edi,[esp+14h]
	mov	ecx,ebp
	sub	ecx,edi
	sar	ecx,2h
	lea	eax,[0000h+ebx*4]
	cmp	ecx,ebx
	mov	[esp+14h],eax
	mov	ecx,esi
	jnc	411B42h

l00411AFC:
	add	eax,edi
	push	eax
	push	ebp
	push	edi
	call	7B2800h
	mov	eax,[esi+8h]
	mov	ecx,eax
	sub	ecx,edi
	sar	ecx,2h
	lea	edx,[esp+1Ch]
	push	edx
	sub	ebx,ecx
	push	ebx
	push	eax
	mov	ecx,esi
	call	669E20h
	mov	eax,[esp+14h]
	add	[esi+8h],eax
	mov	esi,[esi+8h]
	lea	edx,[esp+1Ch]
	push	edx
	sub	esi,eax
	push	esi
	push	edi
	call	4B3770h
	add	esp,0Ch
	pop	ebp
	pop	edi
	pop	esi
	pop	ebx
	ret	0Ch

l00411B42:
	push	ebp
	mov	ebx,ebp
	sub	ebx,eax
	push	ebp
	push	ebx
	call	7B2800h
	push	ebp
	push	ebx
	push	edi
	mov	[esi+8h],eax
	call	50AAA0h
	mov	ecx,[esp+20h]
	lea	eax,[esp+28h]
	push	eax
	add	ecx,edi
	push	ecx
	push	edi
	call	4B3770h
	add	esp,18h
	pop	ebp

l00411B6F:
	pop	edi
	pop	esi
	pop	ebx
	ret	0Ch
00411B75                CC CC CC CC CC CC CC CC CC CC CC      ...........
00411B80 8B 44 24 0C 53 56 8B F1 8B 08 89 4C 24 14 8B 4E .D$.SV.....L$..N
00411B90 04 85 C9 57 75 04 33 FF EB 08 8B 7E 0C 2B F9 C1 ...Wu.3....~.+..
00411BA0 FF 02 8B 5C 24 14 85 DB 0F 84 81 01 00 00 85 C9 ...\$...........
00411BB0 75 04 33 C0 EB 08 8B 46 08 2B C1 C1 F8 02 BA FF u.3....F.+......
00411BC0 FF FF 3F 2B D0 3B D3 73 05 E8 B2 BE FF FF 85 C9 ..?+.;.s........
00411BD0 75 04 33 C0 EB 08 8B 46 08 2B C1 C1 F8 02 03 C3 u.3....F.+......
00411BE0 3B F8 55 0F 83 B4 00 00 00 8B C7 D1 E8 BA FF FF ;.U.............
00411BF0 FF 3F 2B D0 3B D7 73 04 33 FF EB 02 03 F8 85 C9 .?+.;.s.3.......
00411C00 75 04 33 C0 EB 08 8B 46 08 2B C1 C1 F8 02 03 C3 u.3....F.+......
00411C10 3B F8 73 12 85 C9 75 04 33 FF EB 08 8B 7E 08 2B ;.s...u.3....~.+
00411C20 F9 C1 FF 02 03 FB 6A 00 57 E8 52 08 3A 00 8B 4E ......j.W.R.:..N
00411C30 04 83 C4 08 8B E8 8B 44 24 14 55 50 51 8B CE E8 .......D$.UPQ...
00411C40 BC 0B 3A 00 8D 54 24 1C 52 53 50 8B CE E8 CE 81 ..:..T$.RSP.....
00411C50 25 00 8B 4C 24 14 50 8B 46 08 50 51 8B CE E8 9D %..L$.P.F.PQ....
00411C60 0B 3A 00 8B 46 04 85 C0 75 04 33 C9 EB 08 8B 4E .:..F...u.3....N
00411C70 08 2B C8 C1 F9 02 03 D9 85 C0 74 09 50 E8 44 33 .+........t.P.D3
00411C80 28 00 83 C4 04 8D 54 BD 00 8D 44 9D 00 89 6E 04 (.....T...D...n.
00411C90 5D 5F 89 56 0C 89 46 08 5E 5B C2 0C 00 8B 6E 08 ]_.V..F.^[....n.
00411CA0 8B 7C 24 14 8B CD 2B CF C1 F9 02 8D 04 9D 00 00 .|$...+.........
00411CB0 00 00 3B CB 89 44 24 14 8B CE 73 46 03 C7 50 55 ..;..D$...sF..PU
00411CC0 57 E8 3A 0B 3A 00 8B 46 08 8B C8 2B CF C1 F9 02 W.:.:..F...+....
00411CD0 8D 54 24 1C 52 2B D9 53 50 8B CE E8 40 81 25 00 .T$.R+.SP...@.%.
00411CE0 8B 44 24 14 01 46 08 8B 76 08 8D 54 24 1C 52 2B .D$..F..v..T$.R+
00411CF0 F0 56 57 E8 78 1A 0A 00 83 C4 0C 5D 5F 5E 5B C2 .VW.x......]_^[.
00411D00 0C 00 55 8B DD 2B D8 55 53 E8 F2 0A 3A 00 55 53 ..U..+.US...:.US
00411D10 57 89 46 08 E8 87 8D 0F 00 8B 4C 24 20 8D 44 24 W.F.......L$ .D$
00411D20 28 50 03 CF 51 57 E8 45 1A 0A 00 83 C4 18 5D 5F (P..QW.E......]_
00411D30 5E 5B C2 0C 00 CC CC CC CC CC CC CC CC CC CC CC ^[..............

;; fn00411D40: 00411D40
;;   Called from:
;;     00412EE5 (in fn00412EA0)
fn00411D40 proc
	mov	eax,[esp+0Ch]
	movss	xmm0,dword ptr [eax]
	push	ebx
	push	esi
	mov	esi,ecx
	mov	ecx,[esi+4h]
	test	ecx,ecx
	push	edi
	movss	dword ptr [esp+18h],xmm0
	jnz	411D5Eh

l00411D5A:
	xor	edi,edi
	jmp	411D66h

l00411D5E:
	mov	edi,[esi+0Ch]
	sub	edi,ecx
	sar	edi,2h

l00411D66:
	mov	ebx,[esp+14h]
	test	ebx,ebx
	jz	411EF3h

l00411D72:
	test	ecx,ecx
	jnz	411D7Ah

l00411D76:
	xor	eax,eax
	jmp	411D82h

l00411D7A:
	mov	eax,[esi+8h]
	sub	eax,ecx
	sar	eax,2h

l00411D82:
	mov	edx,3FFFFFFFh
	sub	edx,eax
	cmp	edx,ebx
	jnc	411D92h

l00411D8D:
	call	40DAE0h

l00411D92:
	test	ecx,ecx
	jnz	411D9Ah

l00411D96:
	xor	eax,eax
	jmp	411DA2h

l00411D9A:
	mov	eax,[esi+8h]
	sub	eax,ecx
	sar	eax,2h

l00411DA2:
	add	eax,ebx
	cmp	edi,eax
	push	ebp
	jnc	411E61h

l00411DAD:
	mov	eax,edi
	shr	eax,1h
	mov	edx,3FFFFFFFh
	sub	edx,eax
	cmp	edx,edi
	jnc	411DC0h

l00411DBC:
	xor	edi,edi
	jmp	411DC2h

l00411DC0:
	add	edi,eax

l00411DC2:
	test	ecx,ecx
	jnz	411DCAh

l00411DC6:
	xor	eax,eax
	jmp	411DD2h

l00411DCA:
	mov	eax,[esi+8h]
	sub	eax,ecx
	sar	eax,2h

l00411DD2:
	add	eax,ebx
	cmp	edi,eax
	jnc	411DEAh

l00411DD8:
	test	ecx,ecx
	jnz	411DE0h

l00411DDC:
	xor	edi,edi
	jmp	411DE8h

l00411DE0:
	mov	edi,[esi+8h]
	sub	edi,ecx
	sar	edi,2h

l00411DE8:
	add	edi,ebx

l00411DEA:
	push	0h
	push	edi
	call	7B2480h
	mov	ecx,[esi+4h]
	add	esp,8h
	mov	ebp,eax
	mov	eax,[esp+14h]
	push	ebp
	push	eax
	push	ecx
	mov	ecx,esi
	call	7B2800h
	lea	edx,[esp+1Ch]
	push	edx
	push	ebx
	push	eax
	mov	ecx,esi
	call	411910h
	mov	ecx,[esp+14h]
	push	eax
	mov	eax,[esi+8h]
	push	eax
	push	ecx
	mov	ecx,esi
	call	7B2800h
	mov	eax,[esi+4h]
	test	eax,eax
	jnz	411E32h

l00411E2E:
	xor	ecx,ecx
	jmp	411E3Ah

l00411E32:
	mov	ecx,[esi+8h]
	sub	ecx,eax
	sar	ecx,2h

l00411E3A:
	add	ebx,ecx
	test	eax,eax
	jz	411E49h

l00411E40:
	push	eax
	call	694FC6h
	add	esp,4h

l00411E49:
	lea	edx,[ebp+edi*4+0h]
	lea	eax,[ebp+ebx*4+0h]
	mov	[esi+4h],ebp
	pop	ebp
	pop	edi
	mov	[esi+0Ch],edx
	mov	[esi+8h],eax
	pop	esi
	pop	ebx
	ret	0Ch

l00411E61:
	mov	ebp,[esi+8h]
	mov	edi,[esp+14h]
	mov	ecx,ebp
	sub	ecx,edi
	sar	ecx,2h
	lea	eax,[0000h+ebx*4]
	cmp	ecx,ebx
	mov	[esp+14h],eax
	mov	ecx,esi
	jnc	411EC6h

l00411E80:
	add	eax,edi
	push	eax
	push	ebp
	push	edi
	call	7B2800h
	mov	eax,[esi+8h]
	mov	ecx,eax
	sub	ecx,edi
	sar	ecx,2h
	lea	edx,[esp+1Ch]
	push	edx
	sub	ebx,ecx
	push	ebx
	push	eax
	mov	ecx,esi
	call	411910h
	mov	eax,[esp+14h]
	add	[esi+8h],eax
	mov	esi,[esi+8h]
	lea	edx,[esp+1Ch]
	push	edx
	sub	esi,eax
	push	esi
	push	edi
	call	40DF60h
	add	esp,0Ch
	pop	ebp
	pop	edi
	pop	esi
	pop	ebx
	ret	0Ch

l00411EC6:
	push	ebp
	mov	ebx,ebp
	sub	ebx,eax
	push	ebp
	push	ebx
	call	7B2800h
	push	ebp
	push	ebx
	push	edi
	mov	[esi+8h],eax
	call	50AAA0h
	mov	ecx,[esp+20h]
	lea	eax,[esp+28h]
	push	eax
	add	ecx,edi
	push	ecx
	push	edi
	call	40DF60h
	add	esp,18h
	pop	ebp

l00411EF3:
	pop	edi
	pop	esi
	pop	ebx
	ret	0Ch
00411EF9                            CC CC CC CC CC CC CC          .......

;; fn00411F00: 00411F00
;;   Called from:
;;     00412F54 (in fn00412EF0)
fn00411F00 proc
	push	ebx
	mov	ebx,esp
	sub	esp,8h
	and	esp,0F0h
	add	esp,4h
	push	ebp
	mov	ebp,[ebx+4h]
	mov	[esp+4h],ebp
	mov	ebp,esp
	push	0FFh
	push	82D990h
	mov	eax,fs:[0000h]
	push	eax
	push	ecx
	push	ebx
	sub	esp,60h
	push	esi
	push	edi
	mov	eax,[0A14188h]
	xor	eax,ebp
	push	eax
	lea	eax,[ebp-0Ch]
	mov	fs:[0000h],eax
	mov	[ebp-10h],esp
	mov	edx,ecx
	mov	[ebp-24h],edx
	mov	esi,[ebx+10h]
	mov	ecx,10h
	lea	edi,[ebp-70h]

l00411F4F:
	rep movsd

l00411F51:
	mov	edi,[edx+4h]
	test	edi,edi
	jnz	411F5Ch

l00411F58:
	xor	eax,eax
	jmp	411F64h

l00411F5C:
	mov	eax,[edx+0Ch]
	sub	eax,edi
	sar	eax,6h

l00411F64:
	mov	esi,[ebx+0Ch]
	test	esi,esi
	jz	41215Ah

l00411F6F:
	test	edi,edi
	jnz	411F77h

l00411F73:
	xor	ecx,ecx
	jmp	411F7Fh

l00411F77:
	mov	ecx,[edx+8h]
	sub	ecx,edi
	sar	ecx,6h

l00411F7F:
	mov	edi,3FFFFFFh
	sub	edi,ecx
	cmp	edi,esi
	jnc	411F91h

l00411F8A:
	mov	ecx,edx
	call	40DCC0h

l00411F91:
	mov	edi,[edx+4h]
	test	edi,edi
	jnz	411F9Ch

l00411F98:
	xor	ecx,ecx
	jmp	411FA4h

l00411F9C:
	mov	ecx,[edx+8h]
	sub	ecx,edi
	sar	ecx,6h

l00411FA4:
	add	ecx,esi
	cmp	eax,ecx
	jnc	4120A8h

l00411FAE:
	mov	ecx,eax
	shr	ecx,1h
	mov	edi,3FFFFFFh
	sub	edi,ecx
	cmp	edi,eax
	jnc	411FC1h

l00411FBD:
	xor	eax,eax
	jmp	411FC3h

l00411FC1:
	add	eax,ecx

l00411FC3:
	mov	edi,[edx+4h]
	test	edi,edi
	jnz	411FCEh

l00411FCA:
	xor	ecx,ecx
	jmp	411FD6h

l00411FCE:
	mov	ecx,[edx+8h]
	sub	ecx,edi
	sar	ecx,6h

l00411FD6:
	add	ecx,esi
	cmp	eax,ecx
	jnc	411FEFh

l00411FDC:
	test	edi,edi
	jnz	411FE4h

l00411FE0:
	xor	edx,edx
	jmp	411FECh

l00411FE4:
	mov	edx,[edx+8h]
	sub	edx,edi
	sar	edx,6h

l00411FEC:
	lea	eax,[edx+esi]

l00411FEF:
	shl	eax,6h
	push	10h
	push	eax
	mov	[ebp-2Ch],eax
	call	dword ptr [8A4624h]
	mov	edi,[ebp-24h]
	mov	ecx,[edi+4h]
	xor	edx,edx
	mov	[ebp-4h],edx
	mov	[ebp-24h],dl
	mov	edx,[ebp-24h]
	push	edx
	mov	edx,[ebp-2Ch]
	push	edx
	push	edi
	push	eax
	mov	[ebp-28h],eax
	mov	eax,[ebx+8h]
	push	eax
	push	ecx
	call	5F8FB0h
	add	esp,20h
	lea	ecx,[ebp-70h]
	push	ecx
	push	esi
	push	eax
	mov	ecx,edi
	call	411980h
	mov	ecx,[edi+8h]
	mov	byte ptr [ebp-24h],0h
	mov	edx,[ebp-24h]
	push	edx
	mov	edx,[ebp-2Ch]
	push	edx
	push	edi
	push	eax
	mov	eax,[ebx+8h]
	push	ecx
	push	eax
	call	5F8FB0h
	mov	ecx,[edi+4h]
	add	esp,18h
	test	ecx,ecx
	jnz	41205Ch

l00412058:
	xor	eax,eax
	jmp	412064h

l0041205C:
	mov	eax,[edi+8h]
	sub	eax,ecx
	sar	eax,6h

l00412064:
	add	esi,eax
	test	ecx,ecx
	jz	412074h

l0041206A:
	push	ecx
	call	dword ptr [8A4628h]
	add	esp,4h

l00412074:
	mov	eax,[ebp-28h]
	mov	ecx,[ebp-2Ch]
	add	ecx,eax
	shl	esi,6h
	add	esi,eax
	mov	[edi+0Ch],ecx
	mov	[edi+8h],esi
	mov	[edi+4h],eax
	jmp	41215Ah
0041208F                                              8B                .
00412090 5D EC 8B 55 D8 52 FF 15 28 46 8A 00 83 C4 04 6A ]..U.R..(F.....j
004120A0 00 6A 00 E8 24 2F 28 00                         .j..$/(.       

l004120A8:
	mov	eax,[edx+8h]
	mov	edi,[ebx+8h]
	mov	ecx,eax
	sub	ecx,edi
	sar	ecx,6h
	cmp	ecx,esi
	mov	[ebp-2Ch],eax
	jnc	41211Bh

l004120BC:
	mov	ecx,esi
	shl	ecx,6h
	mov	[ebp-28h],ecx
	add	ecx,edi
	push	ecx
	push	eax
	push	edi
	mov	ecx,edx
	call	4EA120h
	mov	ecx,[ebp-24h]
	mov	eax,[ecx+8h]
	lea	edx,[ebp-70h]
	push	edx
	mov	edx,eax
	sub	edx,edi
	sar	edx,6h
	sub	esi,edx
	push	esi
	push	eax
	mov	dword ptr [ebp-4h],2h
	call	411980h
	mov	ecx,[ebp-28h]
	mov	eax,[ebp-24h]
	add	[eax+8h],ecx
	mov	eax,[eax+8h]
	sub	eax,ecx
	lea	ecx,[ebp-70h]
	push	ecx
	push	eax
	push	edi
	call	540F70h
	add	esp,0Ch
	jmp	41215Ah
0041210F                                              8B                .
00412110 5D EC 6A 00 6A 00 E8 B1 2E 28 00                ].j.j....(.    

l0041211B:
	shl	esi,6h
	mov	ecx,esi
	push	eax
	mov	esi,eax
	sub	esi,ecx
	push	eax
	mov	[ebp-28h],ecx
	push	esi
	mov	ecx,edx
	call	4EA120h
	mov	edx,[ebp-24h]
	mov	[edx+8h],eax
	mov	eax,[ebp-2Ch]
	push	eax
	push	esi
	lea	ecx,[ebp-2Ch]
	push	edi
	push	ecx
	call	40E060h
	mov	edx,[ebp-28h]
	lea	ecx,[ebp-70h]
	push	ecx
	lea	eax,[edx+edi]
	push	eax
	push	edi
	call	540F70h
	add	esp,1Ch

l0041215A:
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	mov	esp,ebp
	pop	ebp
	mov	esp,ebx
	pop	ebx
	ret	0Ch
00412170 56 8B 74 24 08 57 8B 7C 24 10 3B F7 74 11 8B FF V.t$.W.|$.;.t...
00412180 8B CE FF 15 28 44 8A 00 83 C6 1C 3B F7 75 F1 5F ....(D.....;.u._
00412190 5E C2 08 00 CC CC CC CC CC CC CC CC CC CC CC CC ^...............
004121A0 55 8B EC 6A FF 68 B9 D9 82 00 64 A1 00 00 00 00 U..j.h....d.....
004121B0 50 83 EC 38 A1 88 41 A1 00 33 C5 89 45 EC 53 56 P..8..A..3..E.SV
004121C0 57 50 8D 45 F4 64 A3 00 00 00 00 89 65 F0 8B 45 WP.E.d......e..E
004121D0 10 8B F1 50 8D 4D D0 89 75 BC FF 15 1C 44 8A 00 ...P.M..u....D..
004121E0 8B 5E 04 33 C0 3B D8 89 45 FC 74 18 8B 4E 0C 2B .^.3.;..E.t..N.+
004121F0 CB B8 93 24 49 92 F7 E9 03 D1 C1 FA 04 8B C2 C1 ...$I...........
00412200 E8 1F 03 C2 8B 7D 0C 85 FF 89 45 CC 0F 84 9B 02 .....}....E.....
00412210 00 00 85 DB 75 04 33 C0 EB 18 8B 4E 08 2B CB B8 ....u.3....N.+..
00412220 93 24 49 92 F7 E9 03 D1 C1 FA 04 8B C2 C1 E8 1F .$I.............
00412230 03 C2 B9 49 92 24 09 2B C8 3B CF 73 05 E8 FE B8 ...I.$.+.;.s....
00412240 FF FF 85 DB 75 04 33 C0 EB 18 8B 4E 08 2B CB B8 ....u.3....N.+..
00412250 93 24 49 92 F7 E9 03 D1 C1 FA 04 8B C2 C1 E8 1F .$I.............
00412260 03 C2 8B 4D CC 03 C7 3B C8 0F 83 41 01 00 00 8B ...M...;...A....
00412270 C1 D1 E8 BA 49 92 24 09 2B D0 3B D1 73 09 C7 45 ....I.$.+.;.s..E
00412280 CC 00 00 00 00 EB 05 03 C8 89 4D CC 85 DB 75 04 ..........M...u.
00412290 33 C0 EB 18 8B 4E 08 2B CB B8 93 24 49 92 F7 E9 3....N.+...$I...
004122A0 03 D1 C1 FA 04 8B C2 C1 E8 1F 03 C2 03 C7 39 45 ..............9E
004122B0 CC 73 0C 8B CE E8 76 B6 FF FF 03 C7 89 45 CC 8B .s....v......E..
004122C0 45 CC 6A 00 50 E8 16 BB FF FF 8B 5D 08 8B 4E 04 E.j.P......]..N.
004122D0 C6 45 C4 00 8B 55 C4 52 8B 55 C4 52 56 50 53 51 .E...U.R.U.RVPSQ
004122E0 89 45 C0 89 45 C8 C6 45 FC 01 E8 01 BE FF FF 83 .E..E..E........
004122F0 C4 20 8D 4D D0 51 57 50 8B CE 89 45 C8 E8 3E F6 . .M.QWP...E..>.
00412300 FF FF 8B 4E 08 C6 45 C4 00 8B 55 C4 52 8B 55 C4 ...N..E...U.R.U.
00412310 52 56 50 51 53 89 45 C8 E8 D3 BD FF FF 8B 5E 04 RVPQS.E.......^.
00412320 33 C0 83 C4 18 3B D8 89 45 FC 74 18 8B 4E 08 2B 3....;..E.t..N.+
00412330 CB B8 93 24 49 92 F7 E9 03 D1 C1 FA 04 8B C2 C1 ...$I...........
00412340 E8 1F 03 C2 03 F8 85 DB 74 18 8B 46 08 50 53 8B ........t..F.PS.
00412350 CE E8 1A FE FF FF 8B 46 04 50 E8 67 2C 28 00 83 .......F.P.g,(..
00412360 C4 04 8B 45 CC 8D 0C C5 00 00 00 00 2B C8 8B 45 ...E........+..E
00412370 C0 8D 14 88 8D 0C FD 00 00 00 00 2B CF 89 56 0C ...........+..V.
00412380 8D 14 88 89 56 08 89 46 04 E9 1F 01 00 00 8B 45 ....V..F.......E
00412390 C8 8B 75 C0 8B 4D BC 50 56 E8 D2 FD FF FF 56 E8 ..u..M.PV.....V.
004123A0 22 2C 28 00 83 C4 04 6A 00 6A 00 E8 1C 2C 28 00 ",(....j.j...,(.
004123B0 8B 4E 08 8B 5D 08 8B D1 2B D3 89 55 C4 B8 93 24 .N..]...+..U...$
004123C0 49 92 F7 EA 03 55 C4 89 4D C0 C1 FA 04 8B C2 C1 I....U..M.......
004123D0 E8 1F 03 C2 3B C7 8D 04 FD 00 00 00 00 0F 83 92 ....;...........
004123E0 00 00 00 2B C7 03 C0 03 C0 89 45 C8 03 C3 50 51 ...+......E...PQ
004123F0 53 8B CE E8 D8 E6 FF FF 8B 4E 08 2B CB 8D 55 D0 S........N.+..U.
00412400 52 B8 93 24 49 92 F7 E9 03 D1 C1 FA 04 8B C2 C1 R..$I...........
00412410 E8 1F 03 C2 2B F8 8B 46 08 57 50 8B CE C6 45 FC ....+..F.WP...E.
00412420 03 E8 1A F5 FF FF 8B 45 C8 01 46 08 8B 76 08 8D .......E..F..v..
00412430 4D D0 51 2B F0 56 53 C7 45 FC 00 00 00 00 E8 3D M.Q+.VS.E......=
00412440 BB FF FF 83 C4 0C EB 65 8B 4D 0C 8D 04 CD 00 00 .......e.M......
00412450 00 00 2B C1 8B 4D BC 8B 51 08 03 C0 03 C0 03 D0 ..+..M..Q.......
00412460 52 8B 55 08 03 C2 50 E8 04 FD FF FF 6A 00 6A 00 R.U...P.....j.j.
00412470 E8 57 2B 28 00 2B C7 03 C0 51 03 C0 8B F9 51 2B .W+(.+...Q....Q+
00412480 F8 57 8B CE 89 45 C8 E8 44 E6 FF FF 89 46 08 8B .W...E..D....F..
00412490 45 C0 50 57 53 E8 96 BB FF FF 8B 55 C8 8D 4D D0 E.PWS......U..M.
004124A0 51 03 D3 52 53 E8 D6 BA FF FF 83 C4 18 8D 4D D0 Q..RS.........M.
004124B0 C7 45 FC FF FF FF FF FF 15 28 44 8A 00 8B 4D F4 .E.......(D...M.
004124C0 64 89 0D 00 00 00 00 59 5F 5E 5B 8B 4D EC 33 CD d......Y_^[.M.3.
004124D0 E8 B9 26 28 00 8B E5 5D C2 0C 00 CC CC CC CC CC ..&(...]........
004124E0 55 8B EC 6A FF 68 E0 D9 82 00 64 A1 00 00 00 00 U..j.h....d.....
004124F0 50 83 EC 10 53 56 57 A1 88 41 A1 00 33 C5 50 8D P...SVW..A..3.P.
00412500 45 F4 64 A3 00 00 00 00 89 65 F0 8B F1 8B 45 10 E.d......e....E.
00412510 8B 08 8B 50 04 8B 46 04 85 C0 89 4D E4 89 55 E8 ...P..F....M..U.
00412520 75 04 33 FF EB 08 8B 7E 0C 2B F8 C1 FF 03 8B 55 u.3....~.+.....U
00412530 0C 85 D2 0F 84 E9 01 00 00 85 C0 75 04 33 C9 EB ...........u.3..
00412540 08 8B 4E 08 2B C8 C1 F9 03 BB FF FF FF 1F 2B D9 ..N.+.........+.
00412550 3B DA 73 05 E8 47 B6 FF FF 85 C0 75 04 33 C9 EB ;.s..G.....u.3..
00412560 08 8B 4E 08 2B C8 C1 F9 03 03 CA 3B F9 0F 83 FC ..N.+......;....
00412570 00 00 00 8B CF D1 E9 BB FF FF FF 1F 2B D9 3B DF ............+.;.
00412580 73 04 33 FF EB 02 03 F9 85 C0 75 04 33 C9 EB 08 s.3.......u.3...
00412590 8B 4E 08 2B C8 C1 F9 03 03 CA 3B F9 73 13 85 C0 .N.+......;.s...
004125A0 75 04 33 C9 EB 08 8B 4E 08 2B C8 C1 F9 03 8D 3C u.3....N.+.....<
004125B0 11 6A 00 57 E8 57 6E 1C 00 8B 55 0C C6 45 10 00 .j.W.Wn...U..E..
004125C0 8B 4D 10 51 8B 4D 08 52 8B D8 8B 46 04 56 53 51 .M.Q.M.R...F.VSQ
004125D0 50 89 5D EC C7 45 FC 00 00 00 00 E8 A0 1A 20 00 P.]..E........ .
004125E0 8B 4D 0C 83 C4 20 8D 55 E4 52 51 50 8B CE E8 0D .M... .U.RQP....
004125F0 91 1A 00 8B 4E 08 C6 45 10 00 8B 55 10 52 8B 55 ....N..E...U.R.U
00412600 0C 52 56 50 8B 45 08 51 50 E8 72 1A 20 00 8B 4E .RVP.E.QP.r. ..N
00412610 04 83 C4 18 85 C9 75 04 33 C0 EB 08 8B 46 08 2B ......u.3....F.+
00412620 C1 C1 F8 03 01 45 0C 85 C9 74 09 51 E8 95 29 28 .....E...t.Q..)(
00412630 00 83 C4 04 8B 55 0C 8D 0C FB 8D 04 D3 89 4E 0C .....U........N.
00412640 89 46 08 89 5E 04 8B 4D F4 64 89 0D 00 00 00 00 .F..^..M.d......
00412650 59 5F 5E 5B 8B E5 5D C2 0C 00 8B 4D EC 51 E8 63 Y_^[..]....M.Q.c
00412660 29 28 00 83 C4 04 6A 00 6A 00 E8 5D 29 28 00 8B )(....j.j..])(..
00412670 5E 08 8B 7D 08 8B C3 2B C7 C1 F8 03 3B C2 73 66 ^..}...+....;.sf
00412680 8D 04 D5 00 00 00 00 89 45 08 03 C7 50 53 57 8B ........E...PSW.
00412690 CE E8 2A 54 00 00 8B 46 08 8B D0 8D 4D E4 51 8B ..*T...F....M.Q.
004126A0 4D 0C 2B D7 C1 FA 03 2B CA 51 50 8B CE C7 45 FC M.+....+.QP...E.
004126B0 02 00 00 00 E8 47 90 1A 00 8B 45 08 01 46 08 8B .....G....E..F..
004126C0 76 08 8D 4D E4 51 2B F0 56 57 E8 D1 3F 00 00 83 v..M.Q+.VW..?...
004126D0 C4 0C 8B 4D F4 64 89 0D 00 00 00 00 59 5F 5E 5B ...M.d......Y_^[
004126E0 8B E5 5D C2 0C 00 8D 0C D5 00 00 00 00 53 8B C3 ..]..........S..
004126F0 2B C1 53 89 4D 08 50 8B CE 89 45 0C E8 BF 53 00 +.S.M.P...E...S.
00412700 00 8B 55 0C 53 52 57 89 46 08 E8 91 1A 25 00 8B ..U.SRW.F....%..
00412710 4D 08 8D 45 E4 50 03 CF 51 57 E8 81 3F 00 00 83 M..E.P..QW..?...
00412720 C4 18 8B 4D F4 64 89 0D 00 00 00 00 59 5F 5E 5B ...M.d......Y_^[
00412730 8B E5 5D C2 0C 00 CC CC CC CC CC CC CC CC CC CC ..].............
00412740 55 8B EC 6A FF 68 00 DA 82 00 64 A1 00 00 00 00 U..j.h....d.....
00412750 50 83 EC 10 53 56 57 A1 88 41 A1 00 33 C5 50 8D P...SVW..A..3.P.
00412760 45 F4 64 A3 00 00 00 00 89 65 F0 8B F1 8B 45 10 E.d......e....E.
00412770 8B 08 8B 50 04 8B 40 08 89 4D E4 8B 4E 04 85 C9 ...P..@..M..N...
00412780 89 55 E8 89 45 EC 75 04 33 DB EB 15 8B 56 0C 2B .U..E.u.3....V.+
00412790 D1 B8 AB AA AA 2A F7 EA D1 FA 8B DA C1 EB 1F 03 .....*..........
004127A0 DA 8B 7D 0C 85 FF 0F 84 2C 02 00 00 85 C9 75 04 ..}.....,.....u.
004127B0 33 C0 EB 15 8B 56 08 2B D1 B8 AB AA AA 2A F7 EA 3....V.+.....*..
004127C0 D1 FA 8B C2 C1 E8 1F 03 C2 BA 55 55 55 15 2B D0 ..........UUU.+.
004127D0 3B D7 73 05 E8 27 B4 FF FF 85 C9 75 04 33 C0 EB ;.s..'.....u.3..
004127E0 15 8B 56 08 2B D1 B8 AB AA AA 2A F7 EA D1 FA 8B ..V.+.....*.....
004127F0 C2 C1 E8 1F 03 C2 03 C7 3B D8 0F 83 0E 01 00 00 ........;.......
00412800 8B C3 D1 E8 BA 55 55 55 15 2B D0 3B D3 73 04 33 .....UUU.+.;.s.3
00412810 DB EB 02 03 D8 85 C9 75 04 33 C0 EB 15 8B 56 08 .......u.3....V.
00412820 2B D1 B8 AB AA AA 2A F7 EA D1 FA 8B C2 C1 E8 1F +.....*.........
00412830 03 C2 03 C7 3B D8 73 0B 8B CE E8 B1 01 03 00 8B ....;.s.........
00412840 D8 03 DF 6A 00 53 E8 55 71 28 00 8B 4E 04 C6 45 ...j.S.Uq(..N..E
00412850 0C 00 8B 55 0C 52 8B 55 08 52 56 50 89 45 10 8B ...U.R.U.RVP.E..
00412860 45 08 50 51 C7 45 FC 00 00 00 00 E8 A0 85 40 00 E.PQ.E........@.
00412870 83 C4 20 8D 4D E4 51 57 50 8B CE E8 D0 8F 40 00 .. .M.QWP.....@.
00412880 8B 4E 08 C6 45 0C 00 8B 55 0C 52 8B 55 08 52 56 .N..E...U.R.U.RV
00412890 50 8B 45 08 51 50 E8 75 85 40 00 8B 4E 04 83 C4 P.E.QP.u.@..N...
004128A0 18 85 C9 75 04 33 C0 EB 15 8B 56 08 2B D1 B8 AB ...u.3....V.+...
004128B0 AA AA 2A F7 EA D1 FA 8B C2 C1 E8 1F 03 C2 03 F8 ..*.............
004128C0 85 C9 74 09 51 E8 FC 26 28 00 83 C4 04 8B 45 10 ..t.Q..&(.....E.
004128D0 8D 0C 5B 8D 14 88 8D 0C 7F 89 56 0C 8D 14 88 89 ..[.......V.....
004128E0 56 08 89 46 04 8B 4D F4 64 89 0D 00 00 00 00 59 V..F..M.d......Y
004128F0 5F 5E 5B 8B E5 5D C2 0C 00 8B 45 10 50 E8 C4 26 _^[..]....E.P..&
00412900 28 00 83 C4 04 6A 00 6A 00 E8 BE 26 28 00 8B 4E (....j.j...&(..N
00412910 08 8B 5D 08 8B D1 2B D3 B8 AB AA AA 2A F7 EA D1 ..]...+.....*...
00412920 FA 8B C2 C1 E8 1F 03 C2 3B C7 89 4D 10 73 70 8D ........;..M.sp.
00412930 04 7F 03 C0 03 C0 89 45 08 03 C3 50 51 53 8B CE .......E...PQS..
00412940 E8 5B 92 40 00 8B 4E 08 8D 55 E4 52 8B D1 2B D3 .[.@..N..U.R..+.
00412950 B8 AB AA AA 2A F7 EA D1 FA 8B C2 C1 E8 1F 03 C2 ....*...........
00412960 2B F8 57 51 8B CE C7 45 FC 02 00 00 00 E8 DE 8E +.WQ...E........
00412970 40 00 8B 45 08 01 46 08 8B 76 08 8D 4D E4 51 2B @..E..F..v..M.Q+
00412980 F0 56 53 E8 98 15 20 00 83 C4 0C 8B 4D F4 64 89 .VS... .....M.d.
00412990 0D 00 00 00 00 59 5F 5E 5B 8B E5 5D C2 0C 00 8D .....Y_^[..]....
004129A0 3C 7F 51 03 FF 8B C1 03 FF 2B C7 51 50 8B CE 89 <.Q......+.QP...
004129B0 45 08 E8 E9 91 40 00 8B 55 10 89 46 08 8B 45 08 E....@..U..F..E.
004129C0 52 50 53 E8 18 1B 20 00 8D 4D E4 51 03 FB 57 53 RPS... ..M.Q..WS
004129D0 E8 4B 15 20 00 83 C4 18 8B 4D F4 64 89 0D 00 00 .K. .....M.d....
004129E0 00 00 59 5F 5E 5B 8B E5 5D C2 0C 00 CC CC CC CC ..Y_^[..].......
004129F0 55 8B EC 6A FF 68 20 DA 82 00 64 A1 00 00 00 00 U..j.h ...d.....
00412A00 50 83 EC 14 53 56 57 A1 88 41 A1 00 33 C5 50 8D P...SVW..A..3.P.
00412A10 45 F4 64 A3 00 00 00 00 89 65 F0 8B F1 8B 45 10 E.d......e....E.
00412A20 8B 08 8B 50 04 89 4D E0 8B 48 08 89 55 E4 8B 50 ...P..M..H..U..P
00412A30 0C 8B 46 04 85 C0 89 4D E8 89 55 EC 75 04 33 DB ..F....M..U.u.3.
00412A40 EB 08 8B 5E 0C 2B D8 C1 FB 04 8B 7D 0C 85 FF 0F ...^.+.....}....
00412A50 84 DF 01 00 00 85 C0 75 04 33 C9 EB 08 8B 4E 08 .......u.3....N.
00412A60 2B C8 C1 F9 04 BA FF FF FF 0F 2B D1 3B D7 73 05 +.........+.;.s.
00412A70 E8 EB B1 FF FF 85 C0 75 04 33 C9 EB 08 8B 4E 08 .......u.3....N.
00412A80 2B C8 C1 F9 04 03 CF 3B D9 0F 83 F9 00 00 00 8B +......;........
00412A90 CB D1 E9 BA FF FF FF 0F 2B D1 3B D3 73 04 33 DB ........+.;.s.3.
00412AA0 EB 02 03 D9 85 C0 75 04 33 C9 EB 08 8B 4E 08 2B ......u.3....N.+
00412AB0 C8 C1 F9 04 03 CF 3B D9 73 12 85 C0 75 04 33 DB ......;.s...u.3.
00412AC0 EB 08 8B 5E 08 2B D8 C1 FB 04 03 DF 6A 00 53 E8 ...^.+......j.S.
00412AD0 8C BD 1C 00 8B 4E 04 C6 45 0C 00 8B 55 0C 52 8B .....N..E...U.R.
00412AE0 55 08 52 56 50 89 45 10 8B 45 08 50 51 C7 45 FC U.RVP.E..E.PQ.E.
00412AF0 00 00 00 00 E8 47 67 1E 00 83 C4 20 8D 4D E0 51 .....Gg.... .M.Q
00412B00 57 50 8B CE E8 57 53 28 00 8B 4E 08 C6 45 0C 00 WP...WS(..N..E..
00412B10 8B 55 0C 52 8B 55 08 52 56 50 8B 45 08 51 50 E8 .U.R.U.RVP.E.QP.
00412B20 1C 67 1E 00 8B 4E 04 83 C4 18 85 C9 75 04 33 C0 .g...N......u.3.
00412B30 EB 08 8B 46 08 2B C1 C1 F8 04 03 F8 85 C9 74 09 ...F.+........t.
00412B40 51 E8 80 24 28 00 83 C4 04 8B 45 10 C1 E3 04 03 Q..$(.....E.....
00412B50 D8 C1 E7 04 03 F8 89 5E 0C 89 7E 08 89 46 04 8B .......^..~..F..
00412B60 4D F4 64 89 0D 00 00 00 00 59 5F 5E 5B 8B E5 5D M.d......Y_^[..]
00412B70 C2 0C 00 8B 4D 10 51 E8 4A 24 28 00 83 C4 04 6A ....M.Q.J$(....j
00412B80 00 6A 00 E8 44 24 28 00 8B 46 08 8B 5D 08 8B D0 .j..D$(..F..]...
00412B90 2B D3 C1 FA 04 3B D7 89 45 10 73 61 8B CF C1 E1 +....;..E.sa....
00412BA0 04 89 4D 08 03 CB 51 50 53 8B CE E8 C0 BF 18 00 ..M...QPS.......
00412BB0 8B 46 08 8B D0 2B D3 8D 4D E0 51 C1 FA 04 2B FA .F...+..M.Q...+.
00412BC0 57 50 8B CE C7 45 FC 02 00 00 00 E8 90 52 28 00 WP...E.......R(.
00412BD0 8B 45 08 01 46 08 8B 76 08 8D 4D E0 51 2B F0 56 .E..F..v..M.Q+.V
00412BE0 53 E8 7A E7 16 00 83 C4 0C 8B 4D F4 64 89 0D 00 S.z.......M.d...
00412BF0 00 00 00 59 5F 5E 5B 8B E5 5D C2 0C 00 C1 E7 04 ...Y_^[..]......
00412C00 8B CF 50 8B F8 2B F9 50 89 4D 08 57 8B CE E8 5D ..P..+.P.M.W...]
00412C10 BF 18 00 8B 55 10 52 57 53 89 46 08 E8 3F 0F 0C ....U.RWS.F..?..
00412C20 00 8B 4D 08 8D 45 E0 50 03 CB 51 53 E8 2F E7 16 ..M..E.P..QS./..
00412C30 00 83 C4 18 8B 4D F4 64 89 0D 00 00 00 00 59 5F .....M.d......Y_
00412C40 5E 5B 8B E5 5D C2 0C 00 CC CC CC CC CC CC CC CC ^[..]...........
00412C50 8B 44 24 0C 53 56 8B F1 8B 08 89 4C 24 14 8B 4E .D$.SV.....L$..N
00412C60 04 85 C9 57 75 04 33 FF EB 08 8B 7E 0C 2B F9 C1 ...Wu.3....~.+..
00412C70 FF 02 8B 5C 24 14 85 DB 0F 84 81 01 00 00 85 C9 ...\$...........
00412C80 75 04 33 C0 EB 08 8B 46 08 2B C1 C1 F8 02 BA FF u.3....F.+......
00412C90 FF FF 3F 2B D0 3B D3 73 05 E8 E2 B0 FF FF 85 C9 ..?+.;.s........
00412CA0 75 04 33 C0 EB 08 8B 46 08 2B C1 C1 F8 02 03 C3 u.3....F.+......
00412CB0 3B F8 55 0F 83 B4 00 00 00 8B C7 D1 E8 BA FF FF ;.U.............
00412CC0 FF 3F 2B D0 3B D7 73 04 33 FF EB 02 03 F8 85 C9 .?+.;.s.3.......
00412CD0 75 04 33 C0 EB 08 8B 46 08 2B C1 C1 F8 02 03 C3 u.3....F.+......
00412CE0 3B F8 73 12 85 C9 75 04 33 FF EB 08 8B 7E 08 2B ;.s...u.3....~.+
00412CF0 F9 C1 FF 02 03 FB 6A 00 57 E8 82 F7 39 00 8B 4E ......j.W...9..N
00412D00 04 83 C4 08 8B E8 8B 44 24 14 55 50 51 8B CE E8 .......D$.UPQ...
00412D10 EC FA 39 00 8D 54 24 1C 52 53 50 8B CE E8 FE 70 ..9..T$.RSP....p
00412D20 25 00 8B 4C 24 14 50 8B 46 08 50 51 8B CE E8 CD %..L$.P.F.PQ....
00412D30 FA 39 00 8B 46 04 85 C0 75 04 33 C9 EB 08 8B 4E .9..F...u.3....N
00412D40 08 2B C8 C1 F9 02 03 D9 85 C0 74 09 50 E8 74 22 .+........t.P.t"
00412D50 28 00 83 C4 04 8D 54 BD 00 8D 44 9D 00 89 6E 04 (.....T...D...n.
00412D60 5D 5F 89 56 0C 89 46 08 5E 5B C2 0C 00 8B 6E 08 ]_.V..F.^[....n.
00412D70 8B 7C 24 14 8B CD 2B CF C1 F9 02 8D 04 9D 00 00 .|$...+.........
00412D80 00 00 3B CB 89 44 24 14 8B CE 73 46 03 C7 50 55 ..;..D$...sF..PU
00412D90 57 E8 6A FA 39 00 8B 46 08 8B C8 2B CF C1 F9 02 W.j.9..F...+....
00412DA0 8D 54 24 1C 52 2B D9 53 50 8B CE E8 70 70 25 00 .T$.R+.SP...pp%.
00412DB0 8B 44 24 14 01 46 08 8B 76 08 8D 54 24 1C 52 2B .D$..F..v..T$.R+
00412DC0 F0 56 57 E8 A8 09 0A 00 83 C4 0C 5D 5F 5E 5B C2 .VW........]_^[.
00412DD0 0C 00 55 8B DD 2B D8 55 53 E8 22 FA 39 00 55 53 ..U..+.US.".9.US
00412DE0 57 89 46 08 E8 B7 7C 0F 00 8B 4C 24 20 8D 44 24 W.F...|...L$ .D$
00412DF0 28 50 03 CF 51 57 E8 75 09 0A 00 83 C4 18 5D 5F (P..QW.u......]_
00412E00 5E 5B C2 0C 00 CC CC CC CC CC CC CC CC CC CC CC ^[..............

;; fn00412E10: 00412E10
;;   Called from:
;;     00414B6E (in fn00414B50)
;;     00414C94 (in fn00414B80)
;;     00414CC5 (in fn00414B80)
;;     0041824C (in fn00418150)
;;     0041828E (in fn00418150)
fn00412E10 proc
	push	ebx
	mov	ebx,[esp+0Ch]
	push	esi
	mov	esi,[esp+0Ch]
	cmp	esi,ebx
	jz	412E44h

l00412E1E:
	push	edi
	mov	edi,[esp+18h]

l00412E23:
	test	edi,edi
	jz	412E34h

l00412E27:
	mov	ecx,[esi]
	test	ecx,ecx
	mov	[edi],ecx
	jz	412E34h

l00412E2F:
	call	401AD0h

l00412E34:
	add	esi,4h
	add	edi,4h
	cmp	esi,ebx
	jnz	412E23h

l00412E3E:
	mov	eax,edi
	pop	edi
	pop	esi
	pop	ebx
	ret

l00412E44:
	mov	eax,[esp+14h]
	pop	esi
	pop	ebx
	ret
00412E4B                                  CC CC CC CC CC            .....

;; fn00412E50: 00412E50
;;   Called from:
;;     006240C6 (in fn00623E00)
fn00412E50 proc
	push	esi
	mov	esi,[ecx+4h]
	test	esi,esi
	jnz	412E5Ch

l00412E58:
	xor	edx,edx
	jmp	412E64h

l00412E5C:
	mov	edx,[ecx+8h]
	sub	edx,esi
	sar	edx,2h

l00412E64:
	test	esi,esi
	jz	412E89h

l00412E68:
	mov	eax,[ecx+0Ch]
	sub	eax,esi
	sar	eax,2h
	cmp	edx,eax
	jnc	412E89h

l00412E74:
	mov	eax,[ecx+8h]
	mov	edx,[esp+8h]
	mov	edx,[edx]
	mov	[eax],edx
	add	eax,4h
	mov	[ecx+8h],eax
	pop	esi
	ret	4h

l00412E89:
	mov	edx,[esp+8h]
	mov	eax,[ecx+8h]
	push	edx
	push	1h
	push	eax
	call	4119C0h
	pop	esi
	ret	4h
00412E9D                                        CC CC CC              ...

;; fn00412EA0: 00412EA0
;;   Called from:
;;     0081DEC5 (in fn0081DE90)
fn00412EA0 proc
	push	esi
	mov	esi,[ecx+4h]
	test	esi,esi
	jnz	412EACh

l00412EA8:
	xor	edx,edx
	jmp	412EB4h

l00412EAC:
	mov	edx,[ecx+8h]
	sub	edx,esi
	sar	edx,2h

l00412EB4:
	test	esi,esi
	jz	412EDAh

l00412EB8:
	mov	eax,[ecx+0Ch]
	sub	eax,esi
	sar	eax,2h
	cmp	edx,eax
	jnc	412EDAh

l00412EC4:
	mov	eax,[ecx+8h]
	mov	edx,[esp+8h]
	fld	dword ptr [edx]
	add	eax,4h
	fstp	dword ptr [eax-4h]
	mov	[ecx+8h],eax
	pop	esi
	ret	4h

l00412EDA:
	mov	edx,[esp+8h]
	mov	eax,[ecx+8h]
	push	edx
	push	1h
	push	eax
	call	411D40h
	pop	esi
	ret	4h
00412EEE                                           CC CC               ..

;; fn00412EF0: 00412EF0
;;   Called from:
;;     0042A324 (in fn0042A300)
fn00412EF0 proc
	push	ecx
	push	esi
	mov	esi,ecx
	mov	edx,[esi+4h]
	test	edx,edx
	jnz	412EFFh

l00412EFB:
	xor	ecx,ecx
	jmp	412F07h

l00412EFF:
	mov	ecx,[esi+8h]
	sub	ecx,edx
	sar	ecx,6h

l00412F07:
	test	edx,edx
	jz	412F47h

l00412F0B:
	mov	eax,[esi+0Ch]
	sub	eax,edx
	sar	eax,6h
	cmp	ecx,eax
	jnc	412F47h

l00412F17:
	mov	ecx,[esp+0Ch]
	mov	edx,[esp+0Ch]
	push	edi
	mov	edi,[esi+8h]
	mov	byte ptr [esp+8h],0h
	mov	eax,[esp+8h]
	push	eax
	push	ecx
	push	esi
	push	edx
	push	1h
	push	edi
	call	5410E0h
	add	esp,18h
	add	edi,40h
	mov	[esi+8h],edi
	pop	edi
	pop	esi
	pop	ecx
	ret	4h

l00412F47:
	mov	ecx,[esp+0Ch]
	mov	eax,[esi+8h]
	push	ecx
	push	1h
	push	eax
	mov	ecx,esi
	call	411F00h
	pop	esi
	pop	ecx
	ret	4h
00412F5E                                           CC CC               ..
00412F60 53 8B 5C 24 0C 56 57 8B F9 8B 77 04 85 F6 74 1A S.\$.VW...w...t.
00412F70 8B 4F 08 2B CE B8 93 24 49 92 F7 E9 03 D1 C1 FA .O.+...$I.......
00412F80 04 8B C2 C1 E8 1F 03 C2 75 04 33 F6 EB 17 8B CB ........u.3.....
00412F90 2B CE B8 93 24 49 92 F7 E9 03 D1 C1 FA 04 8B F2 +...$I..........
00412FA0 C1 EE 1F 03 F2 8B 4C 24 18 51 6A 01 53 8B CF E8 ......L$.Qj.S...
00412FB0 EC F1 FF FF 8B 47 04 8D 14 F5 00 00 00 00 2B D6 .....G........+.
00412FC0 5F 8D 0C 90 8B 44 24 0C 5E 89 08 5B C2 0C 00 CC _....D$.^..[....
00412FD0 53 8B 5C 24 0C 56 57 8B F9 8B 77 04 85 F6 74 17 S.\$.VW...w...t.
00412FE0 8B 4F 08 2B CE B8 AB AA AA 2A F7 E9 D1 FA 8B C2 .O.+.....*......
00412FF0 C1 E8 1F 03 C2 75 04 33 F6 EB 14 8B CB 2B CE B8 .....u.3.....+..
00413000 AB AA AA 2A F7 E9 D1 FA 8B F2 C1 EE 1F 03 F2 8B ...*............
00413010 4C 24 18 51 6A 01 53 8B CF E8 22 F7 FF FF 8B 47 L$.Qj.S..."....G
00413020 04 8D 14 76 5F 8D 0C 90 8B 44 24 0C 5E 89 08 5B ...v_....D$.^..[
00413030 C2 0C 00 CC CC CC CC CC CC CC CC CC CC CC CC CC ................
00413040 8B 51 04 85 D2 75 04 33 C0 EB 08 8B 41 08 2B C2 .Q...u.3....A.+.
00413050 C1 F8 02 56 8B 74 24 08 3B C6 57 73 26 85 D2 75 ...V.t$.;.Ws&..u
00413060 04 33 C0 EB 08 8B 41 08 2B C2 C1 F8 02 8B 51 08 .3....A.+.....Q.
00413070 8D 7C 24 10 57 2B F0 56 52 E8 D2 FB FF FF 5F 5E .|$.W+.VR....._^
00413080 C2 08 00 85 D2 74 1D 8B 79 08 8B C7 2B C2 C1 F8 .....t..y...+...
00413090 02 3B F0 73 0F 8D 04 B2 57 50 8D 44 24 14 50 E8 .;.s....WP.D$.P.
004130A0 4C B1 FF FF 5F 5E C2 08 00 CC CC CC CC CC CC CC L..._^..........
004130B0 55 8B EC 83 E4 F8 6A FF 68 7A DA 82 00 64 A1 00 U.....j.hz...d..
004130C0 00 00 00 50 83 EC 68 A1 88 41 A1 00 33 C4 89 44 ...P..h..A..3..D
004130D0 24 60 53 56 57 A1 88 41 A1 00 33 C4 50 8D 44 24 $`SVW..A..3.P.D$
004130E0 78 64 A3 00 00 00 00 8B 45 0C 8B 5D 08 33 FF 8B xd......E..].3..
004130F0 F1 89 44 24 28 89 7C 24 14 89 BC 24 80 00 00 00 ..D$(.|$...$....
00413100 89 7C 24 18 89 7C 24 1C 8D 4C 24 54 C6 84 24 80 .|$..|$..L$T..$.
00413110 00 00 00 01 FF 15 B0 43 8A 00 57 8D 4C 24 58 51 .......C..W.L$XQ
00413120 53 8D 54 24 1C 52 8B CE C6 84 24 90 00 00 00 02 S.T$.R....$.....
00413130 E8 0B CE FF FF 8B 00 85 C0 74 13 8B D8 85 DB 89 .........t......
00413140 5C 24 14 74 0D 8B CB E8 84 E9 FE FF EB 04 8B 5C \$.t...........\
00413150 24 14 8B 4C 24 10 85 C9 C6 84 24 80 00 00 00 02 $..L$.....$.....
00413160 74 1A 8B F1 E8 77 E9 FE FF 83 F8 01 75 0E 85 F6 t....w......u...
00413170 74 0A 8B 06 8B 10 6A 01 8B CE FF D2 85 DB 75 17 t.....j.......u.
00413180 8D 4C 24 54 C6 84 24 80 00 00 00 01 FF 15 38 43 .L$T..$.......8C
00413190 8A 00 E9 1D 02 00 00 8D 44 24 20 50 8B CB E8 8D ........D$ P....
004131A0 BB FF FF 8B F0 8B 06 85 C0 74 11 8B F8 85 FF 89 .........t......
004131B0 7C 24 18 74 07 8B CF E8 14 E9 FE FF 8B 4E 04 89 |$.t.........N..
004131C0 4C 24 1C 8B 4C 24 20 85 C9 C6 84 24 80 00 00 00 L$..L$ ....$....
004131D0 02 74 1D 8B F1 E8 06 E9 FE FF 83 F8 01 75 11 85 .t...........u..
004131E0 F6 74 0D 8B 16 50 8B 02 8B CE FF D0 8D 64 24 00 .t...P.......d$.
004131F0 8D 4C 24 30 51 8B CB E8 E4 BB FF FF 8B 54 24 1C .L$0Q........T$.
00413200 3B 50 04 75 08 3B 38 75 04 32 DB EB 02 B3 01 8B ;P.u.;8u.2......
00413210 4C 24 30 85 C9 74 1A 8B F1 E8 C2 E8 FE FF 83 F8 L$0..t..........
00413220 01 75 0E 85 F6 74 0A 8B 06 8B 10 6A 01 8B CE FF .u...t.....j....
00413230 D2 33 F6 84 DB 89 74 24 30 0F 84 1E 01 00 00 8D .3....t$0.......
00413240 44 24 10 50 8D 4C 24 1C E8 23 B1 FF FF 8B 4C 24 D$.P.L$..#....L$
00413250 10 8B 11 8B 52 2C 8D 44 24 38 50 C6 84 24 84 00 ....R,.D$8P..$..
00413260 00 00 05 FF D2 8D 4C 24 54 51 50 C6 84 24 88 00 ......L$TQP..$..
00413270 00 00 06 FF 15 34 44 8A 00 83 C4 08 8D 4C 24 38 .....4D......L$8
00413280 8A D8 C6 84 24 80 00 00 00 05 FF 15 38 43 8A 00 ....$.......8C..
00413290 84 DB 74 52 8B 4C 24 10 8B 11 8B 42 48 56 FF D0 ..tR.L$....BHV..
004132A0 8B 7C 24 28 8B 57 04 3B D6 89 44 24 2C 74 08 8B .|$(.W.;..D$,t..
004132B0 77 08 2B F2 C1 FE 02 85 D2 74 19 8B 4F 0C 2B CA w.+......t..O.+.
004132C0 C1 F9 02 3B F1 73 0D 8B 4F 08 89 01 83 C1 04 89 ...;.s..O.......
004132D0 4F 08 EB 12 8B 47 08 8D 4C 24 2C 51 6A 01 50 8B O....G..L$,Qj.P.
004132E0 CF E8 DA E6 FF FF 8B 4C 24 10 85 C9 C6 84 24 80 .......L$.....$.
004132F0 00 00 00 02 74 19 8B F1 E8 E3 E7 FE FF 83 F8 01 ....t...........
00413300 75 0D 85 F6 74 09 8B 16 50 8B 02 8B CE FF D0 6A u...t...P......j
00413310 00 8D 4C 24 24 51 8D 4C 24 20 C7 44 24 18 00 00 ..L$$Q.L$ .D$...
00413320 00 00 E8 D9 B1 FF FF 8B 4C 24 20 85 C9 74 19 8B ........L$ ..t..
00413330 F1 E8 AA E7 FE FF 83 F8 01 75 0D 85 F6 74 09 8B .........u...t..
00413340 16 50 8B 02 8B CE FF D0 8B 7C 24 18 8B 5C 24 14 .P.......|$..\$.
00413350 C7 44 24 20 00 00 00 00 E9 93 FE FF FF 8D 4C 24 .D$ ..........L$
00413360 54 C6 84 24 80 00 00 00 01 FF 15 38 43 8A 00 3B T..$.......8C..;
00413370 FE C6 84 24 80 00 00 00 00 74 15 8B CF E8 5E E7 ...$.....t....^.
00413380 FE FF 83 F8 01 75 09 8B 17 50 8B 02 8B CF FF D0 .....u...P......
00413390 8B 74 24 14 8B CE C7 84 24 80 00 00 00 FF FF FF .t$.....$.......
004133A0 FF E8 3A E7 FE FF 83 F8 01 75 09 8B 16 50 8B 02 ..:......u...P..
004133B0 8B CE FF D0 8B 4C 24 78 64 89 0D 00 00 00 00 59 .....L$xd......Y
004133C0 5F 5E 5B 8B 4C 24 60 33 CC E8 C0 17 28 00 8B E5 _^[.L$`3....(...
004133D0 5D C2 08 00 CC CC CC CC CC CC CC CC CC CC CC CC ]...............
004133E0 55 8B EC 83 E4 F8 6A FF 68 EA DA 82 00 64 A1 00 U.....j.h....d..
004133F0 00 00 00 50 83 EC 68 A1 88 41 A1 00 33 C4 89 44 ...P..h..A..3..D
00413400 24 60 53 56 57 A1 88 41 A1 00 33 C4 50 8D 44 24 $`SVW..A..3.P.D$
00413410 78 64 A3 00 00 00 00 8B 45 0C 8B 5D 08 33 FF 8B xd......E..].3..
00413420 F1 89 44 24 2C 89 7C 24 10 89 BC 24 80 00 00 00 ..D$,.|$...$....
00413430 89 7C 24 1C 89 7C 24 20 8D 4C 24 54 C6 84 24 80 .|$..|$ .L$T..$.
00413440 00 00 00 01 FF 15 B0 43 8A 00 57 8D 4C 24 58 51 .......C..W.L$XQ
00413450 53 8D 54 24 24 52 8B CE C6 84 24 90 00 00 00 02 S.T$$R....$.....
00413460 E8 DB CA FF FF 8B 00 85 C0 74 13 8B D8 85 DB 89 .........t......
00413470 5C 24 10 74 0D 8B CB E8 54 E6 FE FF EB 04 8B 5C \$.t....T......\
00413480 24 10 8B 4C 24 18 85 C9 C6 84 24 80 00 00 00 02 $..L$.....$.....
00413490 74 1A 8B F1 E8 47 E6 FE FF 83 F8 01 75 0E 85 F6 t....G......u...
004134A0 74 0A 8B 06 8B 10 6A 01 8B CE FF D2 85 DB 75 17 t.....j.......u.
004134B0 8D 4C 24 54 C6 84 24 80 00 00 00 01 FF 15 38 43 .L$T..$.......8C
004134C0 8A 00 E9 30 02 00 00 8D 44 24 24 50 8B CB E8 5D ...0....D$$P...]
004134D0 B8 FF FF 8B F0 8B 06 85 C0 74 11 8B F8 85 FF 89 .........t......
004134E0 7C 24 1C 74 07 8B CF E8 E4 E5 FE FF 8B 4E 04 89 |$.t.........N..
004134F0 4C 24 20 8B 4C 24 24 85 C9 C6 84 24 80 00 00 00 L$ .L$$....$....
00413500 02 74 1D 8B F1 E8 D6 E5 FE FF 83 F8 01 75 11 85 .t...........u..
00413510 F6 74 0D 8B 16 50 8B 02 8B CE FF D0 8D 64 24 00 .t...P.......d$.
00413520 8D 4C 24 30 51 8B CB E8 B4 B8 FF FF 8B 54 24 20 .L$0Q........T$ 
00413530 3B 50 04 75 08 3B 38 75 04 32 DB EB 02 B3 01 8B ;P.u.;8u.2......
00413540 4C 24 30 85 C9 74 1A 8B F1 E8 92 E5 FE FF 83 F8 L$0..t..........
00413550 01 75 0E 85 F6 74 0A 8B 06 8B 10 6A 01 8B CE FF .u...t.....j....
00413560 D2 84 DB C7 44 24 30 00 00 00 00 0F 84 2F 01 00 ....D$0....../..
00413570 00 8D 44 24 14 50 8D 4C 24 20 E8 F1 AD FF FF 8B ..D$.P.L$ ......
00413580 4C 24 14 8B 11 8B 52 2C 8D 44 24 38 50 C6 84 24 L$....R,.D$8P..$
00413590 84 00 00 00 05 FF D2 8D 4C 24 54 51 50 C6 84 24 ........L$TQP..$
004135A0 88 00 00 00 06 FF 15 34 44 8A 00 83 C4 08 8D 4C .......4D......L
004135B0 24 38 8A D8 C6 84 24 80 00 00 00 05 FF 15 38 43 $8....$.......8C
004135C0 8A 00 84 DB 74 63 8B 4C 24 14 D9 EE 8B 11 8B 42 ....tc.L$......B
004135D0 50 51 D9 1C 24 FF D0 8B 74 24 2C D9 5C 24 18 8B PQ..$...t$,.\$..
004135E0 56 04 85 D2 75 04 33 C9 EB 08 8B 4E 08 2B CA C1 V...u.3....N.+..
004135F0 F9 02 85 D2 74 21 8B 46 0C 2B C2 C1 F8 02 3B C8 ....t!.F.+....;.
00413600 73 15 8B 46 08 F3 0F 10 44 24 18 F3 0F 11 00 83 s..F....D$......
00413610 C0 04 89 46 08 EB 12 8B 46 08 8D 4C 24 18 51 6A ...F....F..L$.Qj
00413620 01 50 8B CE E8 17 E7 FF FF 8B 4C 24 14 85 C9 C6 .P........L$....
00413630 84 24 80 00 00 00 02 74 19 8B F1 E8 A0 E4 FE FF .$.....t........
00413640 83 F8 01 75 0D 85 F6 74 09 8B 16 50 8B 02 8B CE ...u...t...P....
00413650 FF D0 6A 00 8D 4C 24 28 51 8D 4C 24 24 C7 44 24 ..j..L$(Q.L$$.D$
00413660 1C 00 00 00 00 E8 96 AE FF FF 8B 4C 24 24 85 C9 ...........L$$..
00413670 74 19 8B F1 E8 67 E4 FE FF 83 F8 01 75 0D 85 F6 t....g......u...
00413680 74 09 8B 16 50 8B 02 8B CE FF D0 8B 7C 24 1C 8B t...P.......|$..
00413690 5C 24 10 C7 44 24 24 00 00 00 00 E9 80 FE FF FF \$..D$$.........
004136A0 8D 4C 24 54 C6 84 24 80 00 00 00 01 FF 15 38 43 .L$T..$.......8C
004136B0 8A 00 85 FF C6 84 24 80 00 00 00 00 74 15 8B CF ......$.....t...
004136C0 E8 1B E4 FE FF 83 F8 01 75 09 8B 17 50 8B 02 8B ........u...P...
004136D0 CF FF D0 8B 74 24 10 8B CE C7 84 24 80 00 00 00 ....t$.....$....
004136E0 FF FF FF FF E8 F7 E3 FE FF 83 F8 01 75 09 8B 16 ............u...
004136F0 50 8B 02 8B CE FF D0 8B 4C 24 78 64 89 0D 00 00 P.......L$xd....
00413700 00 00 59 5F 5E 5B 8B 4C 24 60 33 CC E8 7D 14 28 ..Y_^[.L$`3..}.(
00413710 00 8B E5 5D C2 08 00 CC CC CC CC CC CC CC CC CC ...]............
00413720 51 53 56 57 8B F9 8B 5F 04 85 DB 75 04 33 F6 EB QSVW..._...u.3..
00413730 18 8B 4F 08 2B CB B8 93 24 49 92 F7 E9 03 D1 C1 ..O.+...$I......
00413740 FA 04 8B F2 C1 EE 1F 03 F2 85 DB 74 4C 8B 4F 0C ...........tL.O.
00413750 2B CB B8 93 24 49 92 F7 E9 03 D1 C1 FA 04 8B C2 +...$I..........
00413760 C1 E8 1F 03 C2 3B F0 73 30 8B 4C 24 14 8B 54 24 .....;.s0.L$..T$
00413770 14 8B 77 08 C6 44 24 0C 00 8B 44 24 0C 50 51 57 ..w..D$...D$.PQW
00413780 52 6A 01 56 E8 B7 AA FF FF 83 C4 18 83 C6 1C 89 Rj.V............
00413790 77 08 5F 5E 5B 59 C2 04 00 8B 4C 24 14 8B 47 08 w._^[Y....L$..G.
004137A0 51 50 8D 54 24 1C 52 8B CF E8 B2 F7 FF FF 5F 5E QP.T$.R......._^
004137B0 5B 59 C2 04 00 CC CC CC CC CC CC CC CC CC CC CC [Y..............
004137C0 51 56 8B F1 8B 56 04 85 D2 75 04 33 C9 EB 08 8B QV...V...u.3....
004137D0 4E 08 2B CA C1 F9 03 85 D2 74 3C 8B 46 0C 2B C2 N.+......t<.F.+.
004137E0 C1 F8 03 3B C8 73 30 8B 4C 24 0C 8B 54 24 0C 57 ...;.s0.L$..T$.W
004137F0 8B 7E 08 C6 44 24 08 00 8B 44 24 08 50 51 56 52 .~..D$...D$.PQVR
00413800 6A 01 57 E8 68 F5 3A 00 83 C4 18 83 C7 08 89 7E j.W.h.:........~
00413810 08 5F 5E 59 C2 04 00 8B 4C 24 0C 8B 46 08 51 6A ._^Y....L$..F.Qj
00413820 01 50 8B CE E8 B7 EC FF FF 5E 59 C2 04 00 CC CC .P.......^Y.....
00413830 51 56 8B F1 57 8B 7E 04 85 FF 75 04 33 C9 EB 15 QV..W.~...u.3...
00413840 8B 4E 08 2B CF B8 AB AA AA 2A F7 E9 D1 FA 8B CA .N.+.....*......
00413850 C1 E9 1F 03 CA 85 FF 74 48 8B 56 0C 2B D7 B8 AB .......tH.V.+...
00413860 AA AA 2A F7 EA D1 FA 8B C2 C1 E8 1F 03 C2 3B C8 ..*...........;.
00413870 73 2F 8B 4C 24 10 8B 54 24 10 8B 7E 08 C6 44 24 s/.L$..T$..~..D$
00413880 08 00 8B 44 24 08 50 51 56 52 6A 01 57 E8 6E FD ...D$.PQVRj.W.n.
00413890 02 00 83 C4 18 83 C7 0C 89 7E 08 5F 5E 59 C2 04 .........~._^Y..
004138A0 00 8B 4C 24 10 8B 46 08 51 50 8D 54 24 18 52 8B ..L$..F.QP.T$.R.
004138B0 CE E8 1A F7 FF FF 5F 5E 59 C2 04 00 CC CC CC CC ......_^Y.......
004138C0 51 56 8B F1 8B 56 04 85 D2 75 04 33 C9 EB 08 8B QV...V...u.3....
004138D0 4E 08 2B CA C1 F9 04 85 D2 74 3C 8B 46 0C 2B C2 N.+......t<.F.+.
004138E0 C1 F8 04 3B C8 73 30 8B 4C 24 0C 8B 54 24 0C 57 ...;.s0.L$..T$.W
004138F0 8B 7E 08 C6 44 24 08 00 8B 44 24 08 50 51 56 52 .~..D$...D$.PQVR
00413900 6A 01 57 E8 28 41 28 00 83 C4 18 83 C7 10 89 7E j.W.(A(........~
00413910 08 5F 5E 59 C2 04 00 8B 4C 24 0C 8B 46 08 51 6A ._^Y....L$..F.Qj
00413920 01 50 8B CE E8 C7 F0 FF FF 5E 59 C2 04 00 CC CC .P.......^Y.....
00413930 53 8B 5C 24 08 55 8B 6C 24 14 56 8B F1 8B 46 08 S.\$.U.l$.V...F.
00413940 2B D8 C1 FB 02 C1 E3 05 03 5C 24 14 85 ED 57 0F +........\$...W.
00413950 84 B3 00 00 00 8B 06 83 C9 FF 2B C8 3B CD 73 07 ..........+.;.s.
00413960 8B CE E8 B9 A3 FF FF 8D 54 28 1F 6A 00 C1 EA 05 ........T(.j....
00413970 52 8D 4E 04 E8 C7 F6 FF FF 8B 3E 85 FF 75 0D 8B R.N.......>..u..
00413980 FD 89 3E 8B C3 5F 5E 5D 5B C2 0C 00 85 FF 8B 46 ..>.._^][......F
00413990 08 89 44 24 14 C7 44 24 18 00 00 00 00 76 0A 57 ..D$..D$.....v.W
004139A0 8D 4C 24 18 E8 B7 9F FF FF 8B 46 08 83 EC 08 03 .L$.......F.....
004139B0 FD 89 3E 8B CC 89 01 C7 41 04 00 00 00 00 8B 06 ..>.....A.......
004139C0 85 C0 76 06 50 E8 96 9F FF FF 8B 4C 24 1C 8B 54 ..v.P......L$..T
004139D0 24 20 83 EC 08 8B C4 83 EC 08 89 08 8B CC 53 89 $ ............S.
004139E0 50 04 8B 46 08 51 8D 4C 24 34 89 44 24 34 C7 44 P..F.Q.L$4.D$4.D
004139F0 24 38 00 00 00 00 E8 F5 A5 FF FF 8D 54 24 2C 52 $8..........T$,R
00413A00 E8 FB D0 FF FF 83 C4 1C 5F 5E 5D 8B C3 5B C2 0C ........_^]..[..
00413A10 00 CC CC CC CC CC CC CC CC CC CC CC CC CC CC CC ................

;; fn00413A20: 00413A20
;;   Called from:
;;     004044C2 (in fn00404190)
fn00413A20 proc
	push	ebp
	mov	ebp,esp
	and	esp,0F8h
	push	0FFh
	push	82DB7Eh
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,0A0h
	mov	eax,[0A14188h]
	xor	eax,esp
	mov	[esp+98h],eax
	push	ebx
	push	esi
	push	edi
	mov	eax,[0A14188h]
	xor	eax,esp
	push	eax
	lea	eax,[esp+0B0h]
	mov	fs:[0000h],eax
	mov	eax,[ebp+0Ch]
	mov	ebx,[ebp+8h]
	xor	edi,edi
	mov	esi,ecx
	mov	[esp+2Ch],eax
	mov	[esp+18h],edi
	mov	[esp+0B8h],edi
	mov	[esp+1Ch],edi
	mov	[esp+20h],edi
	lea	ecx,[esp+8Ch]
	mov	byte ptr [esp+0B8h],1h
	call	dword ptr [8A43B0h]
	push	edi
	lea	ecx,[esp+90h]
	push	ecx
	push	ebx
	lea	edx,[esp+20h]
	push	edx
	mov	ecx,esi
	mov	byte ptr [esp+0C8h],2h
	call	40FF40h
	mov	eax,[eax]
	test	eax,eax
	jz	413ACDh

l00413ABA:
	mov	ebx,eax
	test	ebx,ebx
	mov	[esp+18h],ebx
	jz	413AD1h

l00413AC4:
	mov	ecx,ebx
	call	401AD0h
	jmp	413AD1h

l00413ACD:
	mov	ebx,[esp+18h]

l00413AD1:
	mov	ecx,[esp+14h]
	test	ecx,ecx
	mov	byte ptr [esp+0B8h],2h
	jz	413AFBh

l00413AE1:
	mov	esi,ecx
	call	401AE0h
	cmp	eax,1h
	jnz	413AFBh

l00413AED:
	test	esi,esi
	jz	413AFBh

l00413AF1:
	mov	eax,[esi]
	mov	edx,[eax]
	push	1h
	mov	ecx,esi
	call	edx

l00413AFB:
	test	ebx,ebx
	jnz	413B19h

l00413AFF:
	lea	ecx,[esp+8Ch]
	mov	byte ptr [esp+0B8h],1h
	call	dword ptr [8A4338h]
	jmp	413D51h

l00413B19:
	lea	eax,[esp+24h]
	push	eax
	mov	ecx,ebx
	call	40ED30h
	mov	esi,eax
	mov	eax,[esi]
	test	eax,eax
	jz	413B3Eh

l00413B2D:
	mov	edi,eax
	test	edi,edi
	mov	[esp+1Ch],edi
	jz	413B3Eh

l00413B37:
	mov	ecx,edi
	call	401AD0h

l00413B3E:
	mov	ecx,[esi+4h]
	mov	[esp+20h],ecx
	mov	ecx,[esp+24h]
	test	ecx,ecx
	mov	byte ptr [esp+0B8h],2h
	jz	413B70h

l00413B55:
	mov	esi,ecx
	call	401AE0h
	cmp	eax,1h
	jnz	413B70h

l00413B61:
	test	esi,esi
	jz	413B70h

l00413B65:
	mov	edx,[esi]
	push	eax
	mov	eax,[edx]
	mov	ecx,esi
	call	eax
	mov	edi,edi

l00413B70:
	lea	ecx,[esp+30h]
	push	ecx
	mov	ecx,ebx
	call	40EDE0h
	mov	edx,[esp+20h]
	cmp	edx,[eax+4h]
	jnz	413B8Dh

l00413B85:
	cmp	edi,[eax]
	jnz	413B8Dh

l00413B89:
	xor	bl,bl
	jmp	413B8Fh

l00413B8D:
	mov	bl,1h

l00413B8F:
	mov	ecx,[esp+30h]
	test	ecx,ecx
	jz	413BB1h

l00413B97:
	mov	esi,ecx
	call	401AE0h
	cmp	eax,1h
	jnz	413BB1h

l00413BA3:
	test	esi,esi
	jz	413BB1h

l00413BA7:
	mov	eax,[esi]
	mov	edx,[eax]
	push	1h
	mov	ecx,esi
	call	edx

l00413BB1:
	test	bl,bl
	mov	dword ptr [esp+30h],0h
	jz	413CF7h

l00413BC1:
	lea	eax,[esp+14h]
	push	eax
	lea	ecx,[esp+20h]
	call	40E370h
	mov	ecx,[esp+14h]
	mov	edx,[ecx]
	mov	edx,[edx+2Ch]
	lea	eax,[esp+54h]
	push	eax
	mov	byte ptr [esp+0BCh],5h
	call	edx
	lea	ecx,[esp+8Ch]
	push	ecx
	push	eax
	mov	byte ptr [esp+0C0h],6h
	call	dword ptr [8A4434h]
	add	esp,8h
	lea	ecx,[esp+54h]
	mov	bl,al
	mov	byte ptr [esp+0B8h],5h
	call	dword ptr [8A4338h]
	test	bl,bl
	jz	413C7Fh

l00413C19:
	push	8A698Fh
	lea	ecx,[esp+3Ch]
	call	dword ptr [8A4334h]
	mov	eax,[ebp+10h]
	mov	ecx,[esp+14h]
	mov	edx,[ecx]
	mov	edx,[edx+58h]
	push	eax
	lea	eax,[esp+3Ch]
	push	eax
	lea	eax,[esp+78h]
	push	eax
	mov	byte ptr [esp+0C4h],7h
	call	edx
	mov	ecx,[esp+2Ch]
	push	eax
	mov	byte ptr [esp+0BCh],8h
	call	403ED0h
	lea	ecx,[esp+70h]
	mov	byte ptr [esp+0B8h],7h
	call	dword ptr [8A4338h]
	lea	ecx,[esp+38h]
	mov	byte ptr [esp+0B8h],5h
	call	dword ptr [8A4338h]

l00413C7F:
	mov	ecx,[esp+14h]
	test	ecx,ecx
	mov	byte ptr [esp+0B8h],2h
	jz	413CA9h

l00413C8F:
	mov	esi,ecx
	call	401AE0h
	cmp	eax,1h
	jnz	413CA9h

l00413C9B:
	test	esi,esi
	jz	413CA9h

l00413C9F:
	mov	eax,[esi]
	mov	edx,[eax]
	push	1h
	mov	ecx,esi
	call	edx

l00413CA9:
	push	0h
	lea	eax,[esp+28h]
	push	eax
	lea	ecx,[esp+24h]
	mov	dword ptr [esp+1Ch],0h
	call	40E500h
	mov	ecx,[esp+24h]
	test	ecx,ecx
	jz	413CE2h

l00413CC9:
	mov	esi,ecx
	call	401AE0h
	cmp	eax,1h
	jnz	413CE2h

l00413CD5:
	test	esi,esi
	jz	413CE2h

l00413CD9:
	mov	edx,[esi]
	push	eax
	mov	eax,[edx]
	mov	ecx,esi
	call	eax

l00413CE2:
	mov	edi,[esp+1Ch]
	mov	ebx,[esp+18h]
	mov	dword ptr [esp+24h],0h
	jmp	413B70h

l00413CF7:
	lea	ecx,[esp+8Ch]
	mov	byte ptr [esp+0B8h],1h
	call	dword ptr [8A4338h]
	test	edi,edi
	mov	byte ptr [esp+0B8h],0h
	jz	413D2Dh

l00413D18:
	mov	ecx,edi
	call	401AE0h
	cmp	eax,1h
	jnz	413D2Dh

l00413D24:
	mov	edx,[edi]
	push	eax
	mov	eax,[edx]
	mov	ecx,edi
	call	eax

l00413D2D:
	mov	esi,[esp+18h]
	mov	ecx,esi
	mov	dword ptr [esp+0B8h],0FFFFFFFFh
	call	401AE0h
	cmp	eax,1h
	jnz	413D51h

l00413D48:
	mov	edx,[esi]
	push	eax
	mov	eax,[edx]
	mov	ecx,esi
	call	eax

l00413D51:
	mov	ecx,[esp+0B0h]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebx
	mov	ecx,[esp+98h]
	xor	ecx,esp
	call	694B8Eh
	mov	esp,ebp
	pop	ebp
	ret	0Ch
00413D77                      CC CC CC CC CC CC CC CC CC        .........
00413D80 55 8B EC 83 E4 F8 6A FF 68 0E DC 82 00 64 A1 00 U.....j.h....d..
00413D90 00 00 00 50 81 EC A0 00 00 00 A1 88 41 A1 00 33 ...P........A..3
00413DA0 C4 89 84 24 98 00 00 00 53 56 57 A1 88 41 A1 00 ...$....SVW..A..
00413DB0 33 C4 50 8D 84 24 B0 00 00 00 64 A3 00 00 00 00 3.P..$....d.....
00413DC0 8B 45 0C 8B 5D 08 33 FF 8B F1 89 44 24 2C 89 7C .E..].3....D$,.|
00413DD0 24 18 89 BC 24 B8 00 00 00 89 7C 24 1C 89 7C 24 $...$.....|$..|$
00413DE0 20 8D 8C 24 8C 00 00 00 C6 84 24 B8 00 00 00 01  ..$......$.....
00413DF0 FF 15 B0 43 8A 00 57 8D 8C 24 90 00 00 00 51 53 ...C..W..$....QS
00413E00 8D 54 24 20 52 8B CE C6 84 24 C8 00 00 00 02 E8 .T$ R....$......
00413E10 2C C1 FF FF 8B 00 85 C0 74 13 8B D8 85 DB 89 5C ,.......t......\
00413E20 24 18 74 0D 8B CB E8 A5 DC FE FF EB 04 8B 5C 24 $.t...........\$
00413E30 18 8B 4C 24 14 85 C9 C6 84 24 B8 00 00 00 02 74 ..L$.....$.....t
00413E40 1A 8B F1 E8 98 DC FE FF 83 F8 01 75 0E 85 F6 74 ...........u...t
00413E50 0A 8B 06 8B 10 6A 01 8B CE FF D2 85 DB 75 1A 8D .....j.......u..
00413E60 8C 24 8C 00 00 00 C6 84 24 B8 00 00 00 01 FF 15 .$......$.......
00413E70 38 43 8A 00 E9 38 02 00 00 8D 44 24 24 50 8B CB 8C...8....D$$P..
00413E80 E8 AB AE FF FF 8B F0 8B 06 85 C0 74 11 8B F8 85 ...........t....
00413E90 FF 89 7C 24 1C 74 07 8B CF E8 32 DC FE FF 8B 4E ..|$.t....2....N
00413EA0 04 89 4C 24 20 8B 4C 24 24 85 C9 C6 84 24 B8 00 ..L$ .L$$....$..
00413EB0 00 00 02 74 1B 8B F1 E8 24 DC FE FF 83 F8 01 75 ...t....$......u
00413EC0 0F 85 F6 74 0B 8B 16 50 8B 02 8B CE FF D0 8B FF ...t...P........
00413ED0 8D 4C 24 30 51 8B CB E8 04 AF FF FF 8B 54 24 20 .L$0Q........T$ 
00413EE0 3B 50 04 75 08 3B 38 75 04 32 DB EB 02 B3 01 8B ;P.u.;8u.2......
00413EF0 4C 24 30 85 C9 74 1A 8B F1 E8 E2 DB FE FF 83 F8 L$0..t..........
00413F00 01 75 0E 85 F6 74 0A 8B 06 8B 10 6A 01 8B CE FF .u...t.....j....
00413F10 D2 84 DB C7 44 24 30 00 00 00 00 0F 84 36 01 00 ....D$0......6..
00413F20 00 8D 44 24 14 50 8D 4C 24 20 E8 41 A4 FF FF 8B ..D$.P.L$ .A....
00413F30 4C 24 14 8B 11 8B 52 2C 8D 44 24 54 50 C6 84 24 L$....R,.D$TP..$
00413F40 BC 00 00 00 05 FF D2 8D 8C 24 8C 00 00 00 51 50 .........$....QP
00413F50 C6 84 24 C0 00 00 00 06 FF 15 34 44 8A 00 83 C4 ..$.......4D....
00413F60 08 8D 4C 24 54 8A D8 C6 84 24 B8 00 00 00 05 FF ..L$T....$......
00413F70 15 38 43 8A 00 84 DB 74 66 68 D8 77 8A 00 8D 4C .8C....tfh.w...L
00413F80 24 3C FF 15 3C 44 8A 00 8B 45 10 8B 4C 24 14 8B $<..<D...E..L$..
00413F90 11 8B 52 5C 50 8D 44 24 3C 50 8D 44 24 78 50 C6 ..R\P.D$<P.D$xP.
00413FA0 84 24 C4 00 00 00 07 FF D2 8B 4C 24 2C 50 C6 84 .$........L$,P..
00413FB0 24 BC 00 00 00 08 E8 65 F7 FF FF 8D 4C 24 70 C6 $......e....L$p.
00413FC0 84 24 B8 00 00 00 07 FF 15 28 44 8A 00 8D 4C 24 .$.......(D...L$
00413FD0 38 C6 84 24 B8 00 00 00 05 FF 15 28 44 8A 00 8B 8..$.......(D...
00413FE0 4C 24 14 85 C9 C6 84 24 B8 00 00 00 02 74 1A 8B L$.....$.....t..
00413FF0 F1 E8 EA DA FE FF 83 F8 01 75 0E 85 F6 74 0A 8B .........u...t..
00414000 06 8B 10 6A 01 8B CE FF D2 6A 00 8D 44 24 28 50 ...j.....j..D$(P
00414010 8D 4C 24 24 C7 44 24 1C 00 00 00 00 E8 DF A4 FF .L$$.D$.........
00414020 FF 8B 4C 24 24 85 C9 74 19 8B F1 E8 B0 DA FE FF ..L$$..t........
00414030 83 F8 01 75 0D 85 F6 74 09 8B 16 50 8B 02 8B CE ...u...t...P....
00414040 FF D0 8B 7C 24 1C 8B 5C 24 18 C7 44 24 24 00 00 ...|$..\$..D$$..
00414050 00 00 E9 79 FE FF FF 8D 8C 24 8C 00 00 00 C6 84 ...y.....$......
00414060 24 B8 00 00 00 01 FF 15 38 43 8A 00 85 FF C6 84 $.......8C......
00414070 24 B8 00 00 00 00 74 15 8B CF E8 61 DA FE FF 83 $.....t....a....
00414080 F8 01 75 09 8B 17 50 8B 02 8B CF FF D0 8B 74 24 ..u...P.......t$
00414090 18 8B CE C7 84 24 B8 00 00 00 FF FF FF FF E8 3D .....$.........=
004140A0 DA FE FF 83 F8 01 75 09 8B 16 50 8B 02 8B CE FF ......u...P.....
004140B0 D0 8B 8C 24 B0 00 00 00 64 89 0D 00 00 00 00 59 ...$....d......Y
004140C0 5F 5E 5B 8B 8C 24 98 00 00 00 33 CC E8 BD 0A 28 _^[..$....3....(
004140D0 00 8B E5 5D C2 0C 00 CC CC CC CC CC CC CC CC CC ...]............
004140E0 55 8B EC 83 E4 F8 6A FF 68 7A DC 82 00 64 A1 00 U.....j.hz...d..
004140F0 00 00 00 50 83 EC 78 A1 88 41 A1 00 33 C4 89 44 ...P..x..A..3..D
00414100 24 70 53 56 57 A1 88 41 A1 00 33 C4 50 8D 84 24 $pSVW..A..3.P..$
00414110 88 00 00 00 64 A3 00 00 00 00 8B 45 0C 8B 5D 08 ....d......E..].
00414120 33 FF 8B F1 89 44 24 2C 89 7C 24 18 89 BC 24 90 3....D$,.|$...$.
00414130 00 00 00 89 7C 24 1C 89 7C 24 20 8D 4C 24 64 C6 ....|$..|$ .L$d.
00414140 84 24 90 00 00 00 01 FF 15 B0 43 8A 00 57 8D 4C .$........C..W.L
00414150 24 68 51 53 8D 54 24 20 52 8B CE C6 84 24 A0 00 $hQS.T$ R....$..
00414160 00 00 02 E8 D8 BD FF FF 8B 00 85 C0 74 13 8B D8 ............t...
00414170 85 DB 89 5C 24 18 74 0D 8B CB E8 51 D9 FE FF EB ...\$.t....Q....
00414180 04 8B 5C 24 18 8B 4C 24 14 85 C9 C6 84 24 90 00 ..\$..L$.....$..
00414190 00 00 02 74 1A 8B F1 E8 44 D9 FE FF 83 F8 01 75 ...t....D......u
004141A0 0E 85 F6 74 0A 8B 06 8B 10 6A 01 8B CE FF D2 85 ...t.....j......
004141B0 DB 75 17 8D 4C 24 64 C6 84 24 90 00 00 00 01 FF .u..L$d..$......
004141C0 15 38 43 8A 00 E9 FD 01 00 00 8D 44 24 24 50 8B .8C........D$$P.
004141D0 CB E8 5A AB FF FF 8B F0 8B 06 85 C0 74 11 8B F8 ..Z.........t...
004141E0 85 FF 89 7C 24 1C 74 07 8B CF E8 E1 D8 FE FF 8B ...|$.t.........
004141F0 4E 04 89 4C 24 20 8B 4C 24 24 85 C9 C6 84 24 90 N..L$ .L$$....$.
00414200 00 00 00 02 74 1A 8B F1 E8 D3 D8 FE FF 83 F8 01 ....t...........
00414210 75 0E 85 F6 74 0A 8B 16 50 8B 02 8B CE FF D0 90 u...t...P.......
00414220 8D 4C 24 30 51 8B CB E8 B4 AB FF FF 8B 54 24 20 .L$0Q........T$ 
00414230 3B 50 04 75 08 3B 38 75 04 32 DB EB 02 B3 01 8B ;P.u.;8u.2......
00414240 4C 24 30 85 C9 74 1A 8B F1 E8 92 D8 FE FF 83 F8 L$0..t..........
00414250 01 75 0E 85 F6 74 0A 8B 06 8B 10 6A 01 8B CE FF .u...t.....j....
00414260 D2 84 DB C7 44 24 30 00 00 00 00 0F 84 FF 00 00 ....D$0.........
00414270 00 8D 44 24 14 50 8D 4C 24 20 E8 F1 A0 FF FF 8B ..D$.P.L$ ......
00414280 4C 24 14 8B 11 8B 52 2C 8D 44 24 48 50 C6 84 24 L$....R,.D$HP..$
00414290 94 00 00 00 05 FF D2 8D 4C 24 64 51 50 C6 84 24 ........L$dQP..$
004142A0 98 00 00 00 06 FF 15 34 44 8A 00 83 C4 08 8D 4C .......4D......L
004142B0 24 48 8A D8 C6 84 24 90 00 00 00 05 FF 15 38 43 $H....$.......8C
004142C0 8A 00 84 DB 74 32 A1 C8 3F A5 00 8B 15 C4 3F A5 ....t2..?.....?.
004142D0 00 8B 4C 24 14 89 44 24 3C 8D 44 24 38 89 54 24 ..L$..D$<.D$8.T$
004142E0 38 8B 11 8B 52 60 50 8D 44 24 44 50 FF D2 8B 4C 8...R`P.D$DP...L
004142F0 24 2C 50 E8 C8 F4 FF FF 8B 4C 24 14 85 C9 C6 84 $,P......L$.....
00414300 24 90 00 00 00 02 74 1A 8B F1 E8 D1 D7 FE FF 83 $.....t.........
00414310 F8 01 75 0E 85 F6 74 0A 8B 06 8B 10 6A 01 8B CE ..u...t.....j...
00414320 FF D2 6A 00 8D 44 24 28 50 8D 4C 24 24 C7 44 24 ..j..D$(P.L$$.D$
00414330 1C 00 00 00 00 E8 C6 A1 FF FF 8B 4C 24 24 85 C9 ...........L$$..
00414340 74 19 8B F1 E8 97 D7 FE FF 83 F8 01 75 0D 85 F6 t...........u...
00414350 74 09 8B 16 50 8B 02 8B CE FF D0 8B 7C 24 1C 8B t...P.......|$..
00414360 5C 24 18 C7 44 24 24 00 00 00 00 E9 B0 FE FF FF \$..D$$.........
00414370 8D 4C 24 64 C6 84 24 90 00 00 00 01 FF 15 38 43 .L$d..$.......8C
00414380 8A 00 85 FF C6 84 24 90 00 00 00 00 74 15 8B CF ......$.....t...
00414390 E8 4B D7 FE FF 83 F8 01 75 09 8B 17 50 8B 02 8B .K......u...P...
004143A0 CF FF D0 8B 74 24 18 8B CE C7 84 24 90 00 00 00 ....t$.....$....
004143B0 FF FF FF FF E8 27 D7 FE FF 83 F8 01 75 09 8B 16 .....'......u...
004143C0 50 8B 02 8B CE FF D0 8B 8C 24 88 00 00 00 64 89 P........$....d.
004143D0 0D 00 00 00 00 59 5F 5E 5B 8B 4C 24 70 33 CC E8 .....Y_^[.L$p3..
004143E0 AA 07 28 00 8B E5 5D C2 08 00 CC CC CC CC CC CC ..(...].........
004143F0 55 8B EC 83 E4 F8 6A FF 68 F3 DC 82 00 64 A1 00 U.....j.h....d..
00414400 00 00 00 50 81 EC 80 00 00 00 A1 88 41 A1 00 33 ...P........A..3
00414410 C4 89 44 24 78 53 56 57 A1 88 41 A1 00 33 C4 50 ..D$xSVW..A..3.P
00414420 8D 84 24 90 00 00 00 64 A3 00 00 00 00 8B 45 0C ..$....d......E.
00414430 8B 5D 08 33 FF 8B F1 89 44 24 2C 89 7C 24 18 89 .].3....D$,.|$..
00414440 BC 24 98 00 00 00 89 7C 24 1C 89 7C 24 20 8D 4C .$.....|$..|$ .L
00414450 24 6C C6 84 24 98 00 00 00 01 FF 15 B0 43 8A 00 $l..$........C..
00414460 57 8D 4C 24 70 51 53 8D 54 24 20 52 8B CE C6 84 W.L$pQS.T$ R....
00414470 24 A8 00 00 00 02 E8 C5 BA FF FF 8B 00 85 C0 74 $..............t
00414480 13 8B D8 85 DB 89 5C 24 18 74 0D 8B CB E8 3E D6 ......\$.t....>.
00414490 FE FF EB 04 8B 5C 24 18 8B 4C 24 14 85 C9 C6 84 .....\$..L$.....
004144A0 24 98 00 00 00 02 74 1A 8B F1 E8 31 D6 FE FF 83 $.....t....1....
004144B0 F8 01 75 0E 85 F6 74 0A 8B 06 8B 10 6A 01 8B CE ..u...t.....j...
004144C0 FF D2 85 DB 75 17 8D 4C 24 6C C6 84 24 98 00 00 ....u..L$l..$...
004144D0 00 01 FF 15 38 43 8A 00 E9 06 02 00 00 8D 44 24 ....8C........D$
004144E0 24 50 8B CB E8 47 A8 FF FF 8B F0 8B 06 85 C0 74 $P...G.........t
004144F0 11 8B F8 85 FF 89 7C 24 1C 74 07 8B CF E8 CE D5 ......|$.t......
00414500 FE FF 8B 4E 04 89 4C 24 20 8B 4C 24 24 85 C9 C6 ...N..L$ .L$$...
00414510 84 24 98 00 00 00 02 74 19 8B F1 E8 C0 D5 FE FF .$.....t........
00414520 83 F8 01 75 0D 85 F6 74 09 8B 16 50 8B 02 8B CE ...u...t...P....
00414530 FF D0 8D 4C 24 30 51 8B CB E8 A2 A8 FF FF 8B 54 ...L$0Q........T
00414540 24 20 3B 50 04 75 08 3B 38 75 04 32 DB EB 02 B3 $ ;P.u.;8u.2....
00414550 01 8B 4C 24 30 85 C9 74 1A 8B F1 E8 80 D5 FE FF ..L$0..t........
00414560 83 F8 01 75 0E 85 F6 74 0A 8B 06 8B 10 6A 01 8B ...u...t.....j..
00414570 CE FF D2 84 DB C7 44 24 30 00 00 00 00 0F 84 09 ......D$0.......
00414580 01 00 00 8D 44 24 14 50 8D 4C 24 20 E8 DF 9D FF ....D$.P.L$ ....
00414590 FF 8B 4C 24 14 8B 11 8B 52 2C 8D 44 24 50 50 C6 ..L$....R,.D$PP.
004145A0 84 24 9C 00 00 00 05 FF D2 8D 4C 24 6C 51 50 C6 .$........L$lQP.
004145B0 84 24 A0 00 00 00 06 FF 15 34 44 8A 00 83 C4 08 .$.......4D.....
004145C0 8D 4C 24 50 8A D8 C6 84 24 98 00 00 00 05 FF 15 .L$P....$.......
004145D0 38 43 8A 00 84 DB 74 3C A1 D0 3F A5 00 8B 0D D4 8C....t<..?.....
004145E0 3F A5 00 8B 15 CC 3F A5 00 89 44 24 3C 89 4C 24 ?.....?...D$<.L$
004145F0 40 8B 4C 24 14 8D 44 24 38 89 54 24 38 8B 11 8B @.L$..D$8.T$8...
00414600 52 64 50 8D 44 24 48 50 FF D2 8B 4C 24 2C 50 E8 RdP.D$HP...L$,P.
00414610 1C F2 FF FF 8B 4C 24 14 85 C9 C6 84 24 98 00 00 .....L$.....$...
00414620 00 02 74 1A 8B F1 E8 B5 D4 FE FF 83 F8 01 75 0E ..t...........u.
00414630 85 F6 74 0A 8B 06 8B 10 6A 01 8B CE FF D2 6A 00 ..t.....j.....j.
00414640 8D 44 24 28 50 8D 4C 24 24 C7 44 24 1C 00 00 00 .D$(P.L$$.D$....
00414650 00 E8 AA 9E FF FF 8B 4C 24 24 85 C9 74 19 8B F1 .......L$$..t...
00414660 E8 7B D4 FE FF 83 F8 01 75 0D 85 F6 74 09 8B 16 .{......u...t...
00414670 50 8B 02 8B CE FF D0 8B 7C 24 1C 8B 5C 24 18 C7 P.......|$..\$..
00414680 44 24 24 00 00 00 00 E9 A6 FE FF FF 8D 4C 24 6C D$$..........L$l
00414690 C6 84 24 98 00 00 00 01 FF 15 38 43 8A 00 85 FF ..$.......8C....
004146A0 C6 84 24 98 00 00 00 00 74 15 8B CF E8 2F D4 FE ..$.....t..../..
004146B0 FF 83 F8 01 75 09 8B 17 50 8B 02 8B CF FF D0 8B ....u...P.......
004146C0 74 24 18 8B CE C7 84 24 98 00 00 00 FF FF FF FF t$.....$........
004146D0 E8 0B D4 FE FF 83 F8 01 75 09 8B 16 50 8B 02 8B ........u...P...
004146E0 CE FF D0 8B 8C 24 90 00 00 00 64 89 0D 00 00 00 .....$....d.....
004146F0 00 59 5F 5E 5B 8B 4C 24 78 33 CC E8 8E 04 28 00 .Y_^[.L$x3....(.
00414700 8B E5 5D C2 08 00 CC CC CC CC CC CC CC CC CC CC ..].............
00414710 55 8B EC 83 E4 F8 6A FF 68 76 DD 82 00 64 A1 00 U.....j.hv...d..
00414720 00 00 00 50 81 EC 88 00 00 00 A1 88 41 A1 00 33 ...P........A..3
00414730 C4 89 84 24 80 00 00 00 53 56 57 A1 88 41 A1 00 ...$....SVW..A..
00414740 33 C4 50 8D 84 24 98 00 00 00 64 A3 00 00 00 00 3.P..$....d.....
00414750 8B 45 0C 8B 5D 08 33 FF 8B F1 89 44 24 2C 89 7C .E..].3....D$,.|
00414760 24 18 89 BC 24 A0 00 00 00 89 7C 24 1C 89 7C 24 $...$.....|$..|$
00414770 20 8D 4C 24 74 C6 84 24 A0 00 00 00 01 FF 15 B0  .L$t..$........
00414780 43 8A 00 57 8D 4C 24 78 51 53 8D 54 24 20 52 8B C..W.L$xQS.T$ R.
00414790 CE C6 84 24 B0 00 00 00 02 E8 A2 B7 FF FF 8B 00 ...$............
004147A0 85 C0 74 13 8B D8 85 DB 89 5C 24 18 74 0D 8B CB ..t......\$.t...
004147B0 E8 1B D3 FE FF EB 04 8B 5C 24 18 8B 4C 24 14 85 ........\$..L$..
004147C0 C9 C6 84 24 A0 00 00 00 02 74 1A 8B F1 E8 0E D3 ...$.....t......
004147D0 FE FF 83 F8 01 75 0E 85 F6 74 0A 8B 06 8B 10 6A .....u...t.....j
004147E0 01 8B CE FF D2 85 DB 75 17 8D 4C 24 74 C6 84 24 .......u..L$t..$
004147F0 A0 00 00 00 01 FF 15 38 43 8A 00 E9 0F 02 00 00 .......8C.......
00414800 8D 44 24 24 50 8B CB E8 24 A5 FF FF 8B F0 8B 06 .D$$P...$.......
00414810 85 C0 74 11 8B F8 85 FF 89 7C 24 1C 74 07 8B CF ..t......|$.t...
00414820 E8 AB D2 FE FF 8B 4E 04 89 4C 24 20 8B 4C 24 24 ......N..L$ .L$$
00414830 85 C9 C6 84 24 A0 00 00 00 02 74 19 8B F1 E8 9D ....$.....t.....
00414840 D2 FE FF 83 F8 01 75 0D 85 F6 74 09 8B 16 50 8B ......u...t...P.
00414850 02 8B CE FF D0 8D 4C 24 30 51 8B CB E8 7F A5 FF ......L$0Q......
00414860 FF 8B 54 24 20 3B 50 04 75 08 3B 38 75 04 32 DB ..T$ ;P.u.;8u.2.
00414870 EB 02 B3 01 8B 4C 24 30 85 C9 74 1A 8B F1 E8 5D .....L$0..t....]
00414880 D2 FE FF 83 F8 01 75 0E 85 F6 74 0A 8B 06 8B 10 ......u...t.....
00414890 6A 01 8B CE FF D2 84 DB C7 44 24 30 00 00 00 00 j........D$0....
004148A0 0F 84 12 01 00 00 8D 44 24 14 50 8D 4C 24 20 E8 .......D$.P.L$ .
004148B0 BC 9A FF FF 8B 4C 24 14 8B 11 8B 52 2C 8D 44 24 .....L$....R,.D$
004148C0 48 50 C6 84 24 A4 00 00 00 05 FF D2 8D 4C 24 74 HP..$........L$t
004148D0 51 50 C6 84 24 A8 00 00 00 06 FF 15 34 44 8A 00 QP..$.......4D..
004148E0 83 C4 08 8D 4C 24 48 8A D8 C6 84 24 A0 00 00 00 ....L$H....$....
004148F0 05 FF 15 38 43 8A 00 84 DB 74 46 8B 15 D8 3F A5 ...8C....tF...?.
00414900 00 8B 0D E0 3F A5 00 A1 DC 3F A5 00 89 54 24 38 ....?....?...T$8
00414910 8B 15 E4 3F A5 00 89 54 24 44 89 4C 24 40 8B 4C ...?...T$D.L$@.L
00414920 24 14 8D 54 24 38 89 44 24 3C 8B 01 8B 40 68 52 $..T$8.D$<...@hR
00414930 8D 54 24 68 52 FF D0 8B 4C 24 2C 50 E8 7F EF FF .T$hR...L$,P....
00414940 FF 8B 4C 24 14 85 C9 C6 84 24 A0 00 00 00 02 74 ..L$.....$.....t
00414950 19 8B F1 E8 88 D1 FE FF 83 F8 01 75 0D 85 F6 74 ...........u...t
00414960 09 8B 16 50 8B 02 8B CE FF D0 6A 00 8D 4C 24 28 ...P......j..L$(
00414970 51 8D 4C 24 24 C7 44 24 1C 00 00 00 00 E8 7E 9B Q.L$$.D$......~.
00414980 FF FF 8B 4C 24 24 85 C9 74 19 8B F1 E8 4F D1 FE ...L$$..t....O..
00414990 FF 83 F8 01 75 0D 85 F6 74 09 8B 16 50 8B 02 8B ....u...t...P...
004149A0 CE FF D0 8B 7C 24 1C 8B 5C 24 18 C7 44 24 24 00 ....|$..\$..D$$.
004149B0 00 00 00 E9 9D FE FF FF 8D 4C 24 74 C6 84 24 A0 .........L$t..$.
004149C0 00 00 00 01 FF 15 38 43 8A 00 85 FF C6 84 24 A0 ......8C......$.
004149D0 00 00 00 00 74 15 8B CF E8 03 D1 FE FF 83 F8 01 ....t...........
004149E0 75 09 8B 17 50 8B 02 8B CF FF D0 8B 74 24 18 8B u...P.......t$..
004149F0 CE C7 84 24 A0 00 00 00 FF FF FF FF E8 DF D0 FE ...$............
00414A00 FF 83 F8 01 75 09 8B 16 50 8B 02 8B CE FF D0 8B ....u...P.......
00414A10 8C 24 98 00 00 00 64 89 0D 00 00 00 00 59 5F 5E .$....d......Y_^
00414A20 5B 8B 8C 24 80 00 00 00 33 CC E8 5F 01 28 00 8B [..$....3.._.(..
00414A30 E5 5D C2 08 00 CC CC CC CC CC CC CC CC CC CC CC .]..............
00414A40 83 EC 08 8B 54 24 10 53 8B 5C 24 18 56 57 53 8B ....T$.S.\$.VWS.
00414A50 F1 8B 4C 24 1C 83 EC 08 8B C4 89 08 8B CE 89 50 ..L$...........P
00414A60 04 E8 CA EE FF FF 8B 76 08 8B F8 8D 04 1F 50 8D .......v......P.
00414A70 4C 24 1C 89 74 24 1C C7 44 24 20 00 00 00 00 E8 L$..t$..D$ .....
00414A80 DC 8E FF FF 57 8D 4C 24 10 89 74 24 10 C7 44 24 ....W.L$..t$..D$
00414A90 14 00 00 00 00 E8 C6 8E FF FF 8B 54 24 18 8D 4C ...........T$..L
00414AA0 24 24 51 8B 4C 24 20 83 EC 08 8B C4 89 10 8B 54 $$Q.L$ ........T
00414AB0 24 18 89 48 04 8B 4C 24 1C 83 EC 08 8B C4 89 10 $..H..L$........
00414AC0 89 48 04 E8 D8 95 FF FF 83 C4 14 5F 5E 5B 83 C4 .H........._^[..
00414AD0 08 C2 10 00 CC CC CC CC CC CC CC CC CC CC CC CC ................
00414AE0 8B 54 24 0C 56 57 8B F9 8B 47 08 8B 4C 24 10 8B .T$.VW...G..L$..
00414AF0 F1 2B F0 8B 44 24 18 50 6A 01 83 EC 08 8B C4 C1 .+..D$.Pj.......
00414B00 FE 02 89 08 C1 E6 05 8B CF 03 F2 89 50 04 E8 2D ............P..-
00414B10 FF FF FF 8B 4F 08 89 4C 24 10 56 8D 4C 24 14 C7 ....O..L$.V.L$..
00414B20 44 24 18 00 00 00 00 E8 34 8E FF FF 8B 44 24 0C D$......4....D$.
00414B30 8B 54 24 10 8B 4C 24 14 5F 89 10 89 48 04 5E C2 .T$..L$._...H.^.
00414B40 10 00 CC CC CC CC CC CC CC CC CC CC CC CC CC CC ................

;; fn00414B50: 00414B50
;;   Called from:
;;     00414D66 (in fn00414B80)
;;     00414DE7 (in fn00414B80)
;;     0041833D (in fn00418150)
;;     004183CC (in fn00418150)
fn00414B50 proc
	push	ecx
	mov	edx,[esp+10h]
	mov	byte ptr [esp],0h
	mov	eax,[esp]
	push	eax
	mov	eax,[esp+14h]
	push	edx
	mov	edx,[esp+10h]
	push	ecx
	mov	ecx,[esp+18h]
	push	eax
	push	ecx
	push	edx
	call	412E10h
	add	esp,1Ch
	ret	0Ch
00414B79                            CC CC CC CC CC CC CC          .......

;; fn00414B80: 00414B80
;;   Called from:
;;     00414EB4 (in fn00414E50)
fn00414B80 proc
	push	ebp
	mov	ebp,esp
	push	0FFh
	push	82DDB8h
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,18h
	push	ebx
	push	esi
	push	edi
	mov	eax,[0A14188h]
	xor	eax,ebp
	push	eax
	lea	eax,[ebp-0Ch]
	mov	fs:[0000h],eax
	mov	[ebp-10h],esp
	mov	esi,ecx
	mov	[ebp-1Ch],esi
	mov	eax,[ebp+10h]
	mov	ebx,[eax]
	xor	edi,edi
	cmp	ebx,edi
	mov	[ebp-14h],ebx
	jz	414BC5h

l00414BBE:
	mov	ecx,ebx
	call	401AD0h

l00414BC5:
	mov	ecx,[esi+4h]
	cmp	ecx,edi
	mov	[ebp-4h],edi
	jz	414BD7h

l00414BCF:
	mov	edi,[esi+0Ch]
	sub	edi,ecx
	sar	edi,2h

l00414BD7:
	mov	edx,[ebp+0Ch]
	test	edx,edx
	mov	[ebp+10h],edi
	jz	414E10h

l00414BE5:
	test	ecx,ecx
	jnz	414BEDh

l00414BE9:
	xor	eax,eax
	jmp	414BF5h

l00414BED:
	mov	eax,[esi+8h]
	sub	eax,ecx
	sar	eax,2h

l00414BF5:
	mov	ebx,3FFFFFFFh
	sub	ebx,eax
	cmp	ebx,edx
	jnc	414C05h

l00414C00:
	call	40D9C0h

l00414C05:
	test	ecx,ecx
	jnz	414C0Dh

l00414C09:
	xor	eax,eax
	jmp	414C15h

l00414C0D:
	mov	eax,[esi+8h]
	sub	eax,ecx
	sar	eax,2h

l00414C15:
	add	eax,edx
	cmp	edi,eax
	jnc	414D44h

l00414C1F:
	mov	eax,edi
	shr	eax,1h
	mov	edi,3FFFFFFFh
	sub	edi,eax
	cmp	edi,[ebp+10h]
	jnc	414C38h

l00414C2F:
	mov	dword ptr [ebp+10h],0h
	jmp	414C3Bh

l00414C38:
	add	[ebp+10h],eax

l00414C3B:
	test	ecx,ecx
	jnz	414C43h

l00414C3F:
	xor	eax,eax
	jmp	414C4Bh

l00414C43:
	mov	eax,[esi+8h]
	sub	eax,ecx
	sar	eax,2h

l00414C4B:
	add	eax,edx
	cmp	[ebp+10h],eax
	jnc	414C67h

l00414C52:
	test	ecx,ecx
	jnz	414C5Ah

l00414C56:
	xor	eax,eax
	jmp	414C62h

l00414C5A:
	mov	eax,[esi+8h]
	sub	eax,ecx
	sar	eax,2h

l00414C62:
	add	eax,edx
	mov	[ebp+10h],eax

l00414C67:
	mov	ecx,[ebp+10h]
	push	0h
	push	ecx
	call	7B2480h
	mov	ecx,[ebp+0Ch]
	mov	ebx,[ebp+8h]
	mov	byte ptr [ebp-20h],0h
	mov	edx,[ebp-20h]
	push	edx
	push	ecx
	mov	edi,eax
	mov	eax,[esi+4h]
	push	esi
	push	edi
	push	ebx
	push	eax
	mov	[ebp-24h],edi
	mov	[ebp-18h],edi
	mov	byte ptr [ebp-4h],1h
	call	412E10h
	mov	ecx,[ebp+0Ch]
	add	esp,20h
	lea	edx,[ebp-14h]
	push	edx
	push	ecx
	push	eax
	mov	ecx,esi
	mov	[ebp-18h],eax
	call	4CDDA0h
	mov	ecx,[esi+8h]
	mov	byte ptr [ebp+8h],0h
	mov	edx,[ebp+8h]
	push	edx
	mov	edx,[ebp+0Ch]
	push	edx
	push	esi
	push	eax
	push	ecx
	push	ebx
	mov	[ebp-18h],eax
	call	412E10h
	mov	ecx,[esi+4h]
	add	esp,18h
	test	ecx,ecx
	mov	dword ptr [ebp-4h],0h
	jnz	414CDFh

l00414CDB:
	xor	eax,eax
	jmp	414CE7h

l00414CDF:
	mov	eax,[esi+8h]
	sub	eax,ecx
	sar	eax,2h

l00414CE7:
	mov	ebx,[ebp+0Ch]
	add	ebx,eax
	test	ecx,ecx
	jz	414D0Bh

l00414CF0:
	mov	edx,[ebp+0Ch]
	mov	eax,[esi+8h]
	push	edx
	push	esi
	push	eax
	push	ecx
	call	44F600h
	mov	eax,[esi+4h]
	push	eax
	call	694FC6h
	add	esp,14h

l00414D0B:
	mov	eax,[ebp+10h]
	lea	ecx,[edi+eax*4]
	lea	edx,[edi+ebx*4]
	mov	[esi+0Ch],ecx
	mov	[esi+8h],edx
	mov	[esi+4h],edi
	jmp	414E0Dh
00414D22       8B 45 E8 8B 75 DC 8B 4D E4 50 56 E8 CE B6   .E..u..M.PV...
00414D30 03 00 56 E8 8E 02 28 00 83 C4 04 6A 00 6A 00 E8 ..V...(....j.j..
00414D40 88 02 28 00                                     ..(.           

l00414D44:
	mov	ebx,[esi+8h]
	mov	edi,[ebp+8h]
	mov	ecx,ebx
	sub	ecx,edi
	sar	ecx,2h
	cmp	ecx,edx
	jnc	414DD1h

l00414D55:
	lea	eax,[0000h+edx*4]
	mov	[ebp+10h],eax
	add	eax,edi
	push	eax
	push	ebx
	push	edi
	mov	ecx,esi
	call	414B50h
	mov	eax,[esi+8h]
	mov	ecx,[ebp+0Ch]
	lea	edx,[ebp-14h]
	push	edx
	mov	edx,eax
	sub	edx,edi
	sar	edx,2h
	sub	ecx,edx
	push	ecx
	push	eax
	mov	ecx,esi
	mov	byte ptr [ebp-4h],3h
	call	4CDDA0h
	mov	eax,[ebp+10h]
	add	[esi+8h],eax
	mov	esi,[esi+8h]
	sub	esi,eax
	lea	eax,[ebp-14h]
	push	eax
	push	esi
	push	edi
	mov	dword ptr [ebp-4h],0h
	call	5C9BA0h
	add	esp,0Ch
	jmp	414E0Dh
00414DAD                                        8B 45 0C              .E.
00414DB0 8B 4D E4 8B 51 08 03 C0 03 C0 03 D0 52 8B 55 08 .M..Q.......R.U.
00414DC0 03 C2 50 E8 38 B6 03 00 6A 00 6A 00 E8 FB 01 28 ..P.8...j.j....(
00414DD0 00                                              .              

l00414DD1:
	lea	ecx,[0000h+edx*4]
	push	ebx
	mov	eax,ebx
	sub	eax,ecx
	push	ebx
	mov	[ebp+10h],ecx
	push	eax
	mov	ecx,esi
	mov	[ebp+0Ch],eax
	call	414B50h
	mov	[esi+8h],eax
	mov	eax,[ebp+0Ch]
	push	ebx
	push	eax
	push	edi
	call	417A50h
	mov	edx,[ebp+10h]
	lea	ecx,[ebp-14h]
	push	ecx
	add	edx,edi
	push	edx
	push	edi
	call	5C9BA0h
	add	esp,18h

l00414E0D:
	mov	ebx,[ebp-14h]

l00414E10:
	test	ebx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	jz	414E31h

l00414E1B:
	mov	ecx,ebx
	call	401AE0h
	cmp	eax,1h
	jnz	414E31h

l00414E27:
	mov	eax,[ebx]
	mov	edx,[eax]
	push	1h
	mov	ecx,ebx
	call	edx

l00414E31:
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret	0Ch
00414E45                CC CC CC CC CC CC CC CC CC CC CC      ...........

;; fn00414E50: 00414E50
;;   Called from:
;;     007B2E13 (in fn007B2D10)
fn00414E50 proc
	push	ecx
	push	esi
	mov	esi,ecx
	mov	edx,[esi+4h]
	test	edx,edx
	jnz	414E5Fh

l00414E5B:
	xor	ecx,ecx
	jmp	414E67h

l00414E5F:
	mov	ecx,[esi+8h]
	sub	ecx,edx
	sar	ecx,2h

l00414E67:
	test	edx,edx
	jz	414EA7h

l00414E6B:
	mov	eax,[esi+0Ch]
	sub	eax,edx
	sar	eax,2h
	cmp	ecx,eax
	jnc	414EA7h

l00414E77:
	mov	ecx,[esp+0Ch]
	mov	edx,[esp+0Ch]
	push	edi
	mov	edi,[esi+8h]
	mov	byte ptr [esp+8h],0h
	mov	eax,[esp+8h]
	push	eax
	push	ecx
	push	esi
	push	edx
	push	1h
	push	edi
	call	417C60h
	add	esp,18h
	add	edi,4h
	mov	[esi+8h],edi
	pop	edi
	pop	esi
	pop	ecx
	ret	4h

l00414EA7:
	mov	ecx,[esp+0Ch]
	mov	eax,[esi+8h]
	push	ecx
	push	1h
	push	eax
	mov	ecx,esi
	call	414B80h
	pop	esi
	pop	ecx
	ret	4h
00414EBE                                           CC CC               ..
00414EC0 55 8B EC 83 E4 F8 6A FF 68 23 DE 82 00 64 A1 00 U.....j.h#...d..
00414ED0 00 00 00 50 83 EC 48 53 56 57 A1 88 41 A1 00 33 ...P..HSVW..A..3
00414EE0 C4 50 8D 44 24 58 64 A3 00 00 00 00 8B D9 89 5C .P.D$Xd........\
00414EF0 24 1C 33 C0 89 44 24 14 8B 7D 08 50 68 50 6A 8A $.3..D$..}.PhPj.
00414F00 00 8B CF 89 44 24 68 FF 15 60 43 8A 00 8B F0 85 ....D$h..`C.....
00414F10 F6 0F 8C D0 00 00 00 8B CF FF 15 5C 43 8A 00 3B ...........\C..;
00414F20 F0 0F 8D C0 00 00 00 56 6A 00 8D 44 24 40 50 8B .......Vj..D$@P.
00414F30 CF FF 15 40 43 8A 00 8B 13 8B 52 1C 50 8D 44 24 ...@C.....R.P.D$
00414F40 1C 50 8B CB C6 44 24 68 01 FF D2 8B 00 85 C0 74 .P...D$h.......t
00414F50 0B 8B C8 89 44 24 14 E8 74 CB FE FF 8B 4C 24 18 ....D$..t....L$.
00414F60 85 C9 C6 44 24 60 01 74 1D 8B D9 E8 70 CB FE FF ...D$`.t....p...
00414F70 83 F8 01 75 0E 85 DB 74 0A 8B 03 8B 10 6A 01 8B ...u...t.....j..
00414F80 CB FF D2 8B 7D 08 8D 4C 24 38 C7 44 24 18 00 00 ....}..L$8.D$...
00414F90 00 00 C6 44 24 60 00 FF 15 38 43 8A 00 8B 5C 24 ...D$`...8C...\$
00414FA0 14 85 DB 0F 84 DF 01 00 00 A1 4C 43 8A 00 8B 08 ..........LC....
00414FB0 51 83 C6 01 56 8D 54 24 40 52 8B CF FF 15 40 43 Q...V.T$@R....@C
00414FC0 8A 00 8B 4D 0C 51 50 8B CB C6 44 24 68 03 E8 ED ...M.QP...D$h...
00414FD0 FE FF FF 8D 4C 24 38 C6 44 24 60 00 FF 15 38 43 ....L$8.D$`...8C
00414FE0 8A 00 E9 A1 01 00 00 33 FF 89 7C 24 20 89 7C 24 .......3..|$ .|$
00414FF0 24 8D 54 24 30 52 8B CB C6 44 24 64 04 E8 2E 9D $.T$0R...D$d....
00415000 FF FF 8B F0 8B 06 85 C0 74 11 8B F8 85 FF 89 7C ........t......|
00415010 24 20 74 07 8B CF E8 B5 CA FE FF 8B 4C 24 30 85 $ t.........L$0.
00415020 C9 8B 46 04 89 44 24 24 C6 44 24 60 04 74 19 8B ..F..D$$.D$`.t..
00415030 F1 E8 AA CA FE FF 83 F8 01 75 0D 85 F6 74 09 8B .........u...t..
00415040 16 50 8B 02 8B CE FF D0 8D 4C 24 28 51 8B CB E8 .P.......L$(Q...
00415050 8C 9D FF FF 8B 54 24 24 3B 50 04 75 08 3B 38 75 .....T$$;P.u.;8u
00415060 04 32 DB EB 02 B3 01 8B 4C 24 28 85 C9 74 1A 8B .2......L$(..t..
00415070 F1 E8 6A CA FE FF 83 F8 01 75 0E 85 F6 74 0A 8B ..j......u...t..
00415080 06 8B 10 6A 01 8B CE FF D2 84 DB C7 44 24 28 00 ...j........D$(.
00415090 00 00 00 0F 84 CD 00 00 00 8D 44 24 18 50 8D 4C ..........D$.P.L
004150A0 24 24 E8 C9 92 FF FF 8B 4C 24 18 8B 11 8B 52 2C $$......L$....R,
004150B0 8D 44 24 38 50 C6 44 24 64 06 FF D2 8B 4D 08 51 .D$8P.D$d....M.Q
004150C0 50 C6 44 24 68 07 FF 15 34 44 8A 00 83 C4 08 8D P.D$h...4D......
004150D0 4C 24 38 8A D8 C6 44 24 60 06 FF 15 38 43 8A 00 L$8...D$`...8C..
004150E0 84 DB 74 0D 8B 4D 0C 8D 54 24 18 52 E8 5F FD FF ..t..M..T$.R._..
004150F0 FF 8B 4C 24 18 85 C9 C6 44 24 60 04 74 1A 8B F1 ..L$....D$`.t...
00415100 E8 DB C9 FE FF 83 F8 01 75 0E 85 F6 74 0A 8B 06 ........u...t...
00415110 8B 10 6A 01 8B CE FF D2 6A 00 8D 44 24 34 50 8D ..j.....j..D$4P.
00415120 4C 24 28 C7 44 24 20 00 00 00 00 E8 D0 93 FF FF L$(.D$ .........
00415130 8B 4C 24 30 85 C9 74 19 8B F1 E8 A1 C9 FE FF 83 .L$0..t.........
00415140 F8 01 75 0D 85 F6 74 09 8B 16 50 8B 02 8B CE FF ..u...t...P.....
00415150 D0 8B 7C 24 20 8B 5C 24 1C C7 44 24 30 00 00 00 ..|$ .\$..D$0...
00415160 00 E9 E2 FE FF FF 85 FF C6 44 24 60 00 74 15 8B .........D$`.t..
00415170 CF E8 6A C9 FE FF 83 F8 01 75 09 8B 17 50 8B 02 ..j......u...P..
00415180 8B CF FF D0 8B 5C 24 14 85 DB C7 44 24 60 FF FF .....\$....D$`..
00415190 FF FF 74 15 8B CB E8 45 C9 FE FF 83 F8 01 75 09 ..t....E......u.
004151A0 8B 13 50 8B 02 8B CB FF D0 8B 4C 24 58 64 89 0D ..P.......L$Xd..
004151B0 00 00 00 00 59 5F 5E 5B 8B E5 5D C2 08 00 CC CC ....Y_^[..].....
004151C0 51 8B 41 08 85 C0 56 8B 74 24 0C C7 44 24 04 00 Q.A...V.t$..D$..
004151D0 00 00 00 74 10 50 8B CE FF 15 34 43 8A 00 8B C6 ...t.P....4C....
004151E0 5E 59 C2 04 00 83 C1 10 51 8B CE FF 15 3C 43 8A ^Y......Q....<C.
004151F0 00 8B C6 5E 59 C2 04 00 CC CC CC CC CC CC CC CC ...^Y...........
00415200 6A FF 68 52 DE 82 00 64 A1 00 00 00 00 50 83 EC j.hR...d.....P..
00415210 3C A1 88 41 A1 00 33 C4 89 44 24 38 56 A1 88 41 <..A..3..D$8V..A
00415220 A1 00 33 C4 50 8D 44 24 44 64 A3 00 00 00 00 8B ..3.P.D$Dd......
00415230 F1 68 8F 69 8A 00 8D 4C 24 0C FF 15 34 43 8A 00 .h.i...L$...4C..
00415240 8B 06 8B 40 58 6A 00 8D 4C 24 0C 51 8D 54 24 2C ...@Xj..L$.Q.T$,
00415250 52 8B CE C7 44 24 58 00 00 00 00 FF D0 8D 4C 24 R...D$X.......L$
00415260 08 C6 44 24 4C 02 FF 15 38 43 8A 00 8D 4C 24 24 ..D$L...8C...L$$
00415270 68 8F 69 8A 00 51 FF 15 E4 43 8A 00 83 C4 08 84 h.i..Q...C......
00415280 C0 8D 4C 24 24 74 28 FF 15 54 43 8A 00 50 FF 15 ..L$$t(..TC..P..
00415290 8C 46 8A 00 83 C4 04 8D 4C 24 24 8B F0 C7 44 24 .F......L$$...D$
004152A0 4C FF FF FF FF FF 15 38 43 8A 00 8B C6 EB 12 C7 L......8C.......
004152B0 44 24 4C FF FF FF FF FF 15 38 43 8A 00 8B 44 24 D$L......8C...D$
004152C0 54 8B 4C 24 44 64 89 0D 00 00 00 00 59 5E 8B 4C T.L$Dd......Y^.L
004152D0 24 38 33 CC E8 B5 F8 27 00 83 C4 48 C2 04 00 CC $83....'...H....
004152E0 6A FF 68 92 DE 82 00 64 A1 00 00 00 00 50 83 EC j.h....d.....P..
004152F0 3C A1 88 41 A1 00 33 C4 89 44 24 38 56 A1 88 41 <..A..3..D$8V..A
00415300 A1 00 33 C4 50 8D 44 24 44 64 A3 00 00 00 00 8B ..3.P.D$Dd......
00415310 F1 68 8F 69 8A 00 8D 4C 24 0C FF 15 34 43 8A 00 .h.i...L$...4C..
00415320 8B 06 8B 40 58 6A 00 8D 4C 24 0C 51 8D 54 24 2C ...@Xj..L$.Q.T$,
00415330 52 8B CE C7 44 24 58 00 00 00 00 FF D0 8D 4C 24 R...D$X.......L$
00415340 08 C6 44 24 4C 02 FF 15 38 43 8A 00 8D 4C 24 24 ..D$L...8C...L$$
00415350 68 8F 69 8A 00 51 FF 15 E4 43 8A 00 83 C4 08 84 h.i..Q...C......
00415360 C0 8D 4C 24 24 74 28 FF 15 54 43 8A 00 50 FF 15 ..L$$t(..TC..P..
00415370 20 46 8A 00 83 C4 04 8D 4C 24 24 8B F0 C7 44 24  F......L$$...D$
00415380 4C FF FF FF FF FF 15 38 43 8A 00 8B C6 EB 12 C7 L......8C.......
00415390 44 24 4C FF FF FF FF FF 15 38 43 8A 00 8B 44 24 D$L......8C...D$
004153A0 54 8B 4C 24 44 64 89 0D 00 00 00 00 59 5E 8B 4C T.L$Dd......Y^.L
004153B0 24 38 33 CC E8 D5 F7 27 00 83 C4 48 C2 04 00 CC $83....'...H....
004153C0 6A FF 68 D2 DE 82 00 64 A1 00 00 00 00 50 83 EC j.h....d.....P..
004153D0 44 A1 88 41 A1 00 33 C4 89 44 24 40 56 A1 88 41 D..A..3..D$@V..A
004153E0 A1 00 33 C4 50 8D 44 24 4C 64 A3 00 00 00 00 8B ..3.P.D$Ld......
004153F0 F1 68 8F 69 8A 00 8D 4C 24 14 FF 15 34 43 8A 00 .h.i...L$...4C..
00415400 8B 06 8B 40 58 6A 00 8D 4C 24 14 51 8D 54 24 34 ...@Xj..L$.Q.T$4
00415410 52 8B CE C7 44 24 60 00 00 00 00 FF D0 8D 4C 24 R...D$`.......L$
00415420 10 C6 44 24 54 02 FF 15 38 43 8A 00 8D 4C 24 2C ..D$T...8C...L$,
00415430 68 8F 69 8A 00 51 FF 15 E4 43 8A 00 83 C4 08 84 h.i..Q...C......
00415440 C0 8D 4C 24 2C 74 2C FF 15 54 43 8A 00 50 FF 15 ..L$,t,..TC..P..
00415450 1C 46 8A 00 DD 5C 24 0C 83 C4 04 8D 4C 24 2C C7 .F...\$.....L$,.
00415460 44 24 54 FF FF FF FF FF 15 38 43 8A 00 DD 44 24 D$T......8C...D$
00415470 08 EB 12 C7 44 24 54 FF FF FF FF FF 15 38 43 8A ....D$T......8C.
00415480 00 DD 44 24 5C 8B 4C 24 4C 64 89 0D 00 00 00 00 ..D$\.L$Ld......
00415490 59 5E 8B 4C 24 40 33 CC E8 F1 F6 27 00 83 C4 50 Y^.L$@3....'...P
004154A0 C2 08 00 CC CC CC CC CC CC CC CC CC CC CC CC CC ................
004154B0 51 8B 41 0C 85 C0 56 8B 74 24 0C C7 44 24 04 00 Q.A...V.t$..D$..
004154C0 00 00 00 74 10 50 8B CE FF 15 34 43 8A 00 8B C6 ...t.P....4C....
004154D0 5E 59 C2 0C 00 83 C1 2C 51 8B CE FF 15 3C 43 8A ^Y.....,Q....<C.
004154E0 00 8B C6 5E 59 C2 0C 00 CC CC CC CC CC CC CC CC ...^Y...........
004154F0 6A FF 68 2C DF 82 00 64 A1 00 00 00 00 50 83 EC j.h,...d.....P..
00415500 44 A1 88 41 A1 00 33 C4 89 44 24 40 55 56 57 A1 D..A..3..D$@UVW.
00415510 88 41 A1 00 33 C4 50 8D 44 24 54 64 A3 00 00 00 .A..3.P.D$Td....
00415520 00 8B 7C 24 64 8B F1 68 8F 69 8A 00 8D 4C 24 1C ..|$d..h.i...L$.
00415530 C7 44 24 60 00 00 00 00 89 7C 24 18 C7 44 24 14 .D$`.....|$..D$.
00415540 00 00 00 00 FF 15 34 43 8A 00 8B 06 8B 40 58 6A ......4C.....@Xj
00415550 00 8D 4C 24 1C 51 8D 54 24 3C 52 8B CE C7 44 24 ..L$.Q.T$<R...D$
00415560 68 01 00 00 00 FF D0 8D 4C 24 18 C6 44 24 5C 03 h.......L$..D$\.
00415570 FF 15 38 43 8A 00 8D 4C 24 34 FF 15 44 43 8A 00 ..8C...L$4..DC..
00415580 8B E8 55 E8 01 F6 27 00 8B F0 55 8D 4C 24 3C 56 ..U...'...U.L$<V
00415590 51 E8 BA AA 20 00 83 C4 10 50 56 8B CF FF 15 40 Q... ....PV....@
004155A0 44 8A 00 56 C7 44 24 14 01 00 00 00 E8 69 FA 27 D..V.D$......i.'
004155B0 00 83 C4 04 8D 4C 24 34 C6 44 24 5C 00 FF 15 38 .....L$4.D$\...8
004155C0 43 8A 00 8B C7 8B 4C 24 54 64 89 0D 00 00 00 00 C.....L$Td......
004155D0 59 5F 5E 5D 8B 4C 24 40 33 CC E8 AF F5 27 00 83 Y_^].L$@3....'..
004155E0 C4 50 C2 08 00 CC CC CC CC CC CC CC CC CC CC CC .P..............
004155F0 6A FF 68 6C DF 82 00 64 A1 00 00 00 00 50 81 EC j.hl...d.....P..
00415600 20 02 00 00 A1 88 41 A1 00 33 C4 89 84 24 1C 02  .....A..3...$..
00415610 00 00 53 56 A1 88 41 A1 00 33 C4 50 8D 84 24 2C ..SV..A..3.P..$,
00415620 02 00 00 64 A3 00 00 00 00 80 BC 24 3C 02 00 00 ...d.......$<...
00415630 00 8B 84 24 40 02 00 00 8B F1 B9 E4 77 8A 00 75 ...$@.......w..u
00415640 05 B9 DC 77 8A 00 51 50 8D 44 24 30 50 FF 15 50 ...w..QP.D$0P..P
00415650 46 8A 00 83 C4 0C 8D 4C 24 28 51 8D 4C 24 10 FF F......L$(Q.L$..
00415660 15 34 43 8A 00 8B 16 8B 92 8C 00 00 00 8D 44 24 .4C...........D$
00415670 0C 50 8B CE C7 84 24 38 02 00 00 00 00 00 00 FF .P....$8........
00415680 D2 8D 4C 24 0C 8A D8 C7 84 24 34 02 00 00 FF FF ..L$.....$4.....
00415690 FF FF FF 15 38 43 8A 00 8A C3 8B 8C 24 2C 02 00 ....8C......$,..
004156A0 00 64 89 0D 00 00 00 00 59 5E 5B 8B 8C 24 1C 02 .d......Y^[..$..
004156B0 00 00 33 CC E8 D5 F4 27 00 81 C4 2C 02 00 00 C2 ..3....'...,....
004156C0 08 00 CC CC CC CC CC CC CC CC CC CC CC CC CC CC ................
004156D0 6A FF 68 AC DF 82 00 64 A1 00 00 00 00 50 81 EC j.h....d.....P..
004156E0 20 02 00 00 A1 88 41 A1 00 33 C4 89 84 24 1C 02  .....A..3...$..
004156F0 00 00 53 56 A1 88 41 A1 00 33 C4 50 8D 84 24 2C ..SV..A..3.P..$,
00415700 02 00 00 64 A3 00 00 00 00 8B 84 24 40 02 00 00 ...d.......$@...
00415710 8B F1 8B 8C 24 3C 02 00 00 51 50 8D 54 24 30 52 ....$<...QP.T$0R
00415720 FF 15 50 46 8A 00 83 C4 0C 8D 44 24 28 50 8D 4C ..PF......D$(P.L
00415730 24 10 FF 15 34 43 8A 00 8B 16 8B 92 8C 00 00 00 $...4C..........
00415740 8D 44 24 0C 50 8B CE C7 84 24 38 02 00 00 00 00 .D$.P....$8.....
00415750 00 00 FF D2 8D 4C 24 0C 8A D8 C7 84 24 34 02 00 .....L$.....$4..
00415760 00 FF FF FF FF FF 15 38 43 8A 00 8A C3 8B 8C 24 .......8C......$
00415770 2C 02 00 00 64 89 0D 00 00 00 00 59 5E 5B 8B 8C ,...d......Y^[..
00415780 24 1C 02 00 00 33 CC E8 02 F4 27 00 81 C4 2C 02 $....3....'...,.
00415790 00 00 C2 08 00 CC CC CC CC CC CC CC CC CC CC CC ................
004157A0 6A FF 68 EC DF 82 00 64 A1 00 00 00 00 50 81 EC j.h....d.....P..
004157B0 20 02 00 00 A1 88 41 A1 00 33 C4 89 84 24 1C 02  .....A..3...$..
004157C0 00 00 53 56 A1 88 41 A1 00 33 C4 50 8D 84 24 2C ..SV..A..3.P..$,
004157D0 02 00 00 64 A3 00 00 00 00 8B 84 24 40 02 00 00 ...d.......$@...
004157E0 8B F1 8B 8C 24 3C 02 00 00 51 50 8D 54 24 30 52 ....$<...QP.T$0R
004157F0 FF 15 50 46 8A 00 83 C4 0C 8D 44 24 28 50 8D 4C ..PF......D$(P.L
00415800 24 10 FF 15 34 43 8A 00 8B 16 8B 92 8C 00 00 00 $...4C..........
00415810 8D 44 24 0C 50 8B CE C7 84 24 38 02 00 00 00 00 .D$.P....$8.....
00415820 00 00 FF D2 8D 4C 24 0C 8A D8 C7 84 24 34 02 00 .....L$.....$4..
00415830 00 FF FF FF FF FF 15 38 43 8A 00 8A C3 8B 8C 24 .......8C......$
00415840 2C 02 00 00 64 89 0D 00 00 00 00 59 5E 5B 8B 8C ,...d......Y^[..
00415850 24 1C 02 00 00 33 CC E8 32 F3 27 00 81 C4 2C 02 $....3..2.'...,.
00415860 00 00 C2 08 00 CC CC CC CC CC CC CC CC CC CC CC ................
00415870 6A FF 68 2C E0 82 00 64 A1 00 00 00 00 50 81 EC j.h,...d.....P..
00415880 20 02 00 00 A1 88 41 A1 00 33 C4 89 84 24 1C 02  .....A..3...$..
00415890 00 00 53 56 A1 88 41 A1 00 33 C4 50 8D 84 24 2C ..SV..A..3.P..$,
004158A0 02 00 00 64 A3 00 00 00 00 8B 84 24 40 02 00 00 ...d.......$@...
004158B0 D9 84 24 3C 02 00 00 83 EC 08 DD 1C 24 50 8D 44 ..$<........$P.D
004158C0 24 34 50 8B F1 FF 15 50 46 8A 00 83 C4 10 8D 4C $4P....PF......L
004158D0 24 28 51 8D 4C 24 10 FF 15 34 43 8A 00 8B 16 8B $(Q.L$...4C.....
004158E0 92 8C 00 00 00 8D 44 24 0C 50 8B CE C7 84 24 38 ......D$.P....$8
004158F0 02 00 00 00 00 00 00 FF D2 8D 4C 24 0C 8A D8 C7 ..........L$....
00415900 84 24 34 02 00 00 FF FF FF FF FF 15 38 43 8A 00 .$4.........8C..
00415910 8A C3 8B 8C 24 2C 02 00 00 64 89 0D 00 00 00 00 ....$,...d......
00415920 59 5E 5B 8B 8C 24 1C 02 00 00 33 CC E8 5D F2 27 Y^[..$....3..].'
00415930 00 81 C4 2C 02 00 00 C2 08 00 CC CC CC CC CC CC ...,............
00415940 6A FF 68 6C E0 82 00 64 A1 00 00 00 00 50 81 EC j.hl...d.....P..
00415950 20 02 00 00 A1 88 41 A1 00 33 C4 89 84 24 1C 02  .....A..3...$..
00415960 00 00 53 56 A1 88 41 A1 00 33 C4 50 8D 84 24 2C ..SV..A..3.P..$,
00415970 02 00 00 64 A3 00 00 00 00 8B 84 24 44 02 00 00 ...d.......$D...
00415980 DD 84 24 3C 02 00 00 83 EC 08 DD 1C 24 50 8D 44 ..$<........$P.D
00415990 24 34 50 8B F1 FF 15 50 46 8A 00 83 C4 10 8D 4C $4P....PF......L
004159A0 24 28 51 8D 4C 24 10 FF 15 34 43 8A 00 8B 16 8B $(Q.L$...4C.....
004159B0 92 8C 00 00 00 8D 44 24 0C 50 8B CE C7 84 24 38 ......D$.P....$8
004159C0 02 00 00 00 00 00 00 FF D2 8D 4C 24 0C 8A D8 C7 ..........L$....
004159D0 84 24 34 02 00 00 FF FF FF FF FF 15 38 43 8A 00 .$4.........8C..
004159E0 8A C3 8B 8C 24 2C 02 00 00 64 89 0D 00 00 00 00 ....$,...d......
004159F0 59 5E 5B 8B 8C 24 1C 02 00 00 33 CC E8 8D F1 27 Y^[..$....3....'
00415A00 00 81 C4 2C 02 00 00 C2 0C 00 CC CC CC CC CC CC ...,............
00415A10 8B 44 24 04 C7 41 0C 00 00 00 00 50 83 C1 2C FF .D$..A.....P..,.
00415A20 15 58 43 8A 00 B0 01 C2 04 00 CC CC CC CC CC CC .XC.............
00415A30 6A FF 68 AC E0 82 00 64 A1 00 00 00 00 50 81 EC j.h....d.....P..
00415A40 20 02 00 00 A1 88 41 A1 00 33 C4 89 84 24 1C 02  .....A..3...$..
00415A50 00 00 53 56 A1 88 41 A1 00 33 C4 50 8D 84 24 2C ..SV..A..3.P..$,
00415A60 02 00 00 64 A3 00 00 00 00 8B 84 24 3C 02 00 00 ...d.......$<...
00415A70 D9 40 04 83 EC 10 DD 5C 24 08 8B F1 D9 00 8B 8C .@.....\$.......
00415A80 24 50 02 00 00 DD 1C 24 51 8D 44 24 3C 50 FF 15 $P.....$Q.D$<P..
00415A90 50 46 8A 00 83 C4 18 8D 4C 24 28 51 8D 4C 24 10 PF......L$(Q.L$.
00415AA0 FF 15 34 43 8A 00 8B 16 8B 92 8C 00 00 00 8D 44 ..4C...........D
00415AB0 24 0C 50 8B CE C7 84 24 38 02 00 00 00 00 00 00 $.P....$8.......
00415AC0 FF D2 8D 4C 24 0C 8A D8 C7 84 24 34 02 00 00 FF ...L$.....$4....
00415AD0 FF FF FF FF 15 38 43 8A 00 8A C3 8B 8C 24 2C 02 .....8C......$,.
00415AE0 00 00 64 89 0D 00 00 00 00 59 5E 5B 8B 8C 24 1C ..d......Y^[..$.
00415AF0 02 00 00 33 CC E8 94 F0 27 00 81 C4 2C 02 00 00 ...3....'...,...
00415B00 C2 08 00 CC CC CC CC CC CC CC CC CC CC CC CC CC ................
00415B10 6A FF 68 EC E0 82 00 64 A1 00 00 00 00 50 81 EC j.h....d.....P..
00415B20 20 02 00 00 A1 88 41 A1 00 33 C4 89 84 24 1C 02  .....A..3...$..
00415B30 00 00 53 56 A1 88 41 A1 00 33 C4 50 8D 84 24 2C ..SV..A..3.P..$,
00415B40 02 00 00 64 A3 00 00 00 00 8B 84 24 3C 02 00 00 ...d.......$<...
00415B50 D9 40 08 83 EC 18 DD 5C 24 10 8B F1 D9 40 04 8B .@.....\$....@..
00415B60 8C 24 58 02 00 00 DD 5C 24 08 D9 00 8D 44 24 40 .$X....\$....D$@
00415B70 DD 1C 24 51 50 FF 15 50 46 8A 00 83 C4 20 8D 4C ..$QP..PF.... .L
00415B80 24 28 51 8D 4C 24 10 FF 15 34 43 8A 00 8B 16 8B $(Q.L$...4C.....
00415B90 92 8C 00 00 00 8D 44 24 0C 50 8B CE C7 84 24 38 ......D$.P....$8
00415BA0 02 00 00 00 00 00 00 FF D2 8D 4C 24 0C 8A D8 C7 ..........L$....
00415BB0 84 24 34 02 00 00 FF FF FF FF FF 15 38 43 8A 00 .$4.........8C..
00415BC0 8A C3 8B 8C 24 2C 02 00 00 64 89 0D 00 00 00 00 ....$,...d......
00415BD0 59 5E 5B 8B 8C 24 1C 02 00 00 33 CC E8 AD EF 27 Y^[..$....3....'
00415BE0 00 81 C4 2C 02 00 00 C2 08 00 CC CC CC CC CC CC ...,............
00415BF0 6A FF 68 29 E1 82 00 64 A1 00 00 00 00 50 83 EC j.h)...d.....P..
00415C00 20 A1 88 41 A1 00 33 C4 89 44 24 1C 53 56 57 A1  ..A..3..D$.SVW.
00415C10 88 41 A1 00 33 C4 50 8D 44 24 30 64 A3 00 00 00 .A..3.P.D$0d....
00415C20 00 8B 7C 24 40 8B F1 8B CF FF 15 44 43 8A 00 50 ..|$@......DC..P
00415C30 8B CF FF 15 44 44 8A 00 50 8D 44 24 18 50 E8 7D ....DD..P.D$.P.}
00415C40 A2 20 00 83 C4 0C 8B 16 8B 92 8C 00 00 00 8D 44 . .............D
00415C50 24 10 50 8B CE C7 44 24 3C 00 00 00 00 FF D2 8D $.P...D$<.......
00415C60 4C 24 10 8A D8 C7 44 24 38 FF FF FF FF FF 15 38 L$....D$8......8
00415C70 43 8A 00 8A C3 8B 4C 24 30 64 89 0D 00 00 00 00 C.....L$0d......
00415C80 59 5F 5E 5B 8B 4C 24 1C 33 CC E8 FF EE 27 00 83 Y_^[.L$.3....'..
00415C90 C4 2C C2 04 00 CC CC CC CC CC CC CC CC CC CC CC .,..............

;; fn00415CA0: 00415CA0
;;   Called from:
;;     00417048 (in fn00417030)
;;     0041912E (in fn00418D40)
fn00415CA0 proc
	mov	al,[esp+4h]
	cmp	al,20h
	jz	415CB7h

l00415CA8:
	cmp	al,9h
	jz	415CB7h

l00415CAC:
	cmp	al,0Dh
	jz	415CB7h

l00415CB0:
	cmp	al,0Ah
	jz	415CB7h

l00415CB4:
	xor	eax,eax
	ret

l00415CB7:
	mov	eax,1h
	ret
00415CBD                                        CC CC CC              ...

;; fn00415CC0: 00415CC0
;;   Called from:
;;     004181C2 (in fn00418150)
fn00415CC0 proc
	push	0FFh
	push	82E169h
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,44h
	mov	eax,[0A14188h]
	xor	eax,esp
	push	eax
	lea	eax,[esp+48h]
	mov	fs:[0000h],eax
	push	8A6998h
	lea	ecx,[esp+8h]
	call	dword ptr [8A4334h]
	lea	eax,[esp+4h]
	push	eax
	lea	ecx,[esp+24h]
	mov	dword ptr [esp+54h],0h
	call	4019E0h
	push	999C68h
	lea	ecx,[esp+24h]
	push	ecx
	mov	dword ptr [esp+28h],990030h
	call	694FCCh
	int	3h
	push	0FFh
	push	82E199h
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,44h
	mov	eax,[0A14188h]
	xor	eax,esp
	push	eax
	lea	eax,[esp+48h]
	mov	fs:[0000h],eax
	push	8A6998h
	lea	ecx,[esp+8h]
	call	dword ptr [8A4334h]
	lea	eax,[esp+4h]
	push	eax
	lea	ecx,[esp+24h]
	mov	dword ptr [esp+54h],0h
	call	4019E0h
	push	999C68h
	lea	ecx,[esp+24h]
	push	ecx
	mov	dword ptr [esp+28h],990030h
	call	694FCCh
	int	3h

;; fn00415D80: 00415D80
;;   Called from:
;;     004178D9 (in fn00417890)
fn00415D80 proc
	push	0FFh
	push	82E1C9h
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,44h
	mov	eax,[0A14188h]
	xor	eax,esp
	push	eax
	lea	eax,[esp+48h]
	mov	fs:[0000h],eax
	push	8A6998h
	lea	ecx,[esp+8h]
	call	dword ptr [8A4334h]
	lea	eax,[esp+4h]
	push	eax
	lea	ecx,[esp+24h]
	mov	dword ptr [esp+54h],0h
	call	4019E0h
	push	999C68h
	lea	ecx,[esp+24h]
	push	ecx
	mov	dword ptr [esp+28h],990030h
	call	694FCCh
	int	3h
	mov	eax,ecx
	ret
00415DE3          CC CC CC CC CC CC CC CC CC CC CC CC CC    .............
00415DF0 8B 51 4C 85 D2 75 03 33 C0 C3 8B 41 50 2B C2 C1 .QL..u.3...AP+..
00415E00 F8 02 C3 CC CC CC CC CC CC CC CC CC CC CC CC CC ................
00415E10 6A FF 68 0B E2 82 00 64 A1 00 00 00 00 50 83 EC j.h....d.....P..
00415E20 58 A1 88 41 A1 00 33 C4 89 44 24 54 56 57 A1 88 X..A..3..D$TVW..
00415E30 41 A1 00 33 C4 50 8D 44 24 64 64 A3 00 00 00 00 A..3.P.D$dd.....
00415E40 8B F1 68 8F 69 8A 00 8D 4C 24 10 FF 15 34 43 8A ..h.i...L$...4C.
00415E50 00 8B 06 8B 40 58 6A 01 8D 4C 24 10 51 8D 54 24 ....@Xj..L$.Q.T$
00415E60 4C 52 8B CE C7 44 24 78 00 00 00 00 FF D0 8D 4C LR...D$x.......L
00415E70 24 0C C6 44 24 6C 02 FF 15 38 43 8A 00 68 E4 77 $..D$l...8C..h.w
00415E80 8A 00 8D 4C 24 48 FF 15 54 43 8A 00 8B 3D B4 46 ...L$H..TC...=.F
00415E90 8A 00 50 FF D7 83 C4 08 85 C0 8D 4C 24 44 75 15 ..P........L$Du.
00415EA0 C7 44 24 6C FF FF FF FF FF 15 38 43 8A 00 B0 01 .D$l......8C....
00415EB0 E9 84 00 00 00 68 DC 77 8A 00 FF 15 54 43 8A 00 .....h.w....TC..
00415EC0 50 FF D7 83 C4 08 85 C0 75 16 8D 4C 24 44 C7 44 P.......u..L$D.D
00415ED0 24 6C FF FF FF FF FF 15 38 43 8A 00 32 C0 EB 59 $l......8C..2..Y
00415EE0 8B 16 8B 52 2C 8D 44 24 28 50 8B CE FF D2 8B C8 ...R,.D$(P......
00415EF0 C6 44 24 6C 03 FF 15 54 43 8A 00 50 8D 4C 24 48 .D$l...TC..P.L$H
00415F00 FF 15 54 43 8A 00 50 68 EC 77 8A 00 E8 6F AD 10 ..TC..Ph.w...o..
00415F10 00 83 C4 0C 8D 4C 24 28 C6 44 24 6C 02 FF 15 38 .....L$(.D$l...8
00415F20 43 8A 00 8D 4C 24 44 C7 44 24 6C FF FF FF FF FF C...L$D.D$l.....
00415F30 15 38 43 8A 00 8A 44 24 74 8B 4C 24 64 64 89 0D .8C...D$t.L$dd..
00415F40 00 00 00 00 59 5F 5E 8B 4C 24 54 33 CC E8 3C EC ....Y_^.L$T3..<.
00415F50 27 00 83 C4 64 C2 04 00 CC CC CC CC CC CC CC CC '...d...........
00415F60 6A FF 68 5B E2 82 00 64 A1 00 00 00 00 50 83 EC j.h[...d.....P..
00415F70 60 A1 88 41 A1 00 33 C4 89 44 24 5C 56 57 A1 88 `..A..3..D$\VW..
00415F80 41 A1 00 33 C4 50 8D 44 24 6C 64 A3 00 00 00 00 A..3.P.D$ld.....
00415F90 8B 7C 24 7C 8B F1 68 8F 69 8A 00 8D 4C 24 18 FF .|$|..h.i...L$..
00415FA0 15 34 43 8A 00 8B 06 8B 40 58 6A 00 8D 4C 24 18 .4C.....@Xj..L$.
00415FB0 51 8D 54 24 54 52 8B CE C7 84 24 80 00 00 00 00 Q.T$TR....$.....
00415FC0 00 00 00 FF D0 8D 4C 24 14 C6 44 24 74 02 FF 15 ......L$..D$t...
00415FD0 38 43 8A 00 8D 4C 24 10 51 8D 54 24 10 52 68 54 8C...L$.Q.T$.RhT
00415FE0 78 8A 00 8D 4C 24 58 FF 15 54 43 8A 00 50 FF 15 x...L$X..TC..P..
00415FF0 18 46 8A 00 83 C4 10 83 F8 02 74 56 8B 06 8B 50 .F........tV...P
00416000 2C 8D 4C 24 30 51 8B CE FF D2 8B C8 C6 44 24 74 ,.L$0Q.......D$t
00416010 03 FF 15 54 43 8A 00 50 8D 4C 24 50 FF 15 54 43 ...TC..P.L$P..TC
00416020 8A 00 50 68 1C 78 8A 00 E8 53 AC 10 00 83 C4 0C ..Ph.x...S......
00416030 8D 4C 24 30 C6 44 24 74 02 FF 15 38 43 8A 00 8B .L$0.D$t...8C...
00416040 84 24 80 00 00 00 8B 08 89 0F 8B 50 04 89 57 04 .$.........P..W.
00416050 EB 0D 8B 44 24 0C 8B 4C 24 10 89 07 89 4F 04 8D ...D$..L$....O..
00416060 4C 24 4C C7 44 24 74 FF FF FF FF FF 15 38 43 8A L$L.D$t......8C.
00416070 00 8B C7 8B 4C 24 6C 64 89 0D 00 00 00 00 59 5F ....L$ld......Y_
00416080 5E 8B 4C 24 5C 33 CC E8 02 EB 27 00 83 C4 6C C2 ^.L$\3....'...l.
00416090 08 00 CC CC CC CC CC CC CC CC CC CC CC CC CC CC ................
004160A0 6A FF 68 AB E2 82 00 64 A1 00 00 00 00 50 83 EC j.h....d.....P..
004160B0 64 A1 88 41 A1 00 33 C4 89 44 24 60 56 57 A1 88 d..A..3..D$`VW..
004160C0 41 A1 00 33 C4 50 8D 44 24 70 64 A3 00 00 00 00 A..3.P.D$pd.....
004160D0 8B B4 24 80 00 00 00 8B F9 68 8F 69 8A 00 8D 4C ..$......h.i...L
004160E0 24 1C FF 15 34 43 8A 00 8B 07 8B 40 58 6A 00 8D $...4C.....@Xj..
004160F0 4C 24 1C 51 8D 54 24 58 52 8B CF C7 84 24 84 00 L$.Q.T$XR....$..
00416100 00 00 00 00 00 00 FF D0 8D 4C 24 18 C6 44 24 78 .........L$..D$x
00416110 02 FF 15 38 43 8A 00 8D 4C 24 14 51 8D 54 24 14 ...8C...L$.Q.T$.
00416120 52 8D 44 24 14 50 68 94 78 8A 00 8D 4C 24 60 FF R.D$.Ph.x...L$`.
00416130 15 54 43 8A 00 50 FF 15 18 46 8A 00 83 C4 14 83 .TC..P...F......
00416140 F8 03 74 59 8B 17 8B 52 2C 8D 44 24 34 50 8B CF ..tY...R,.D$4P..
00416150 FF D2 8B C8 C6 44 24 78 03 FF 15 54 43 8A 00 50 .....D$x...TC..P
00416160 8D 4C 24 54 FF 15 54 43 8A 00 50 68 5C 78 8A 00 .L$T..TC..Ph\x..
00416170 E8 0B AB 10 00 83 C4 0C 8D 4C 24 34 C6 44 24 78 .........L$4.D$x
00416180 02 FF 15 38 43 8A 00 8B 84 24 84 00 00 00 8B 08 ...8C....$......
00416190 89 0E 8B 50 04 89 56 04 8B 40 08 EB 11 8B 4C 24 ...P..V..@....L$
004161A0 0C 8B 54 24 10 8B 44 24 14 89 0E 89 56 04 8D 4C ..T$..D$....V..L
004161B0 24 50 C7 44 24 78 FF FF FF FF 89 46 08 FF 15 38 $P.D$x.....F...8
004161C0 43 8A 00 8B C6 8B 4C 24 70 64 89 0D 00 00 00 00 C.....L$pd......
004161D0 59 5F 5E 8B 4C 24 60 33 CC E8 B0 E9 27 00 83 C4 Y_^.L$`3....'...
004161E0 70 C2 08 00 CC CC CC CC CC CC CC CC CC CC CC CC p...............
004161F0 6A FF 68 FB E2 82 00 64 A1 00 00 00 00 50 83 EC j.h....d.....P..
00416200 68 A1 88 41 A1 00 33 C4 89 44 24 64 56 57 A1 88 h..A..3..D$dVW..
00416210 41 A1 00 33 C4 50 8D 44 24 74 64 A3 00 00 00 00 A..3.P.D$td.....
00416220 8B B4 24 84 00 00 00 8B F9 68 8F 69 8A 00 8D 4C ..$......h.i...L
00416230 24 20 FF 15 34 43 8A 00 8B 07 8B 40 58 6A 00 8D $ ..4C.....@Xj..
00416240 4C 24 20 51 8D 54 24 5C 52 8B CF C7 84 24 88 00 L$ Q.T$\R....$..
00416250 00 00 00 00 00 00 FF D0 8D 4C 24 1C C6 44 24 7C .........L$..D$|
00416260 02 FF 15 38 43 8A 00 8D 4C 24 18 51 8D 54 24 18 ...8C...L$.Q.T$.
00416270 52 8D 44 24 18 50 8D 4C 24 18 51 68 D4 78 8A 00 R.D$.P.L$.Qh.x..
00416280 8D 4C 24 68 FF 15 54 43 8A 00 50 FF 15 18 46 8A .L$h..TC..P...F.
00416290 00 83 C4 18 83 F8 04 74 62 8B 17 8B 52 2C 8D 44 .......tb...R,.D
004162A0 24 38 50 8B CF FF D2 8B C8 C6 44 24 7C 03 FF 15 $8P.......D$|...
004162B0 54 43 8A 00 50 8D 4C 24 58 FF 15 54 43 8A 00 50 TC..P.L$X..TC..P
004162C0 68 9C 78 8A 00 E8 B6 A9 10 00 83 C4 0C 8D 4C 24 h.x...........L$
004162D0 38 C6 44 24 7C 02 FF 15 38 43 8A 00 8B 84 24 88 8.D$|...8C....$.
004162E0 00 00 00 8B 08 89 0E 8B 50 04 89 56 04 8B 48 08 ........P..V..H.
004162F0 89 4E 08 8B 50 0C 89 56 0C EB 1B 8B 44 24 0C 8B .N..P..V....D$..
00416300 4C 24 10 8B 54 24 14 89 06 8B 44 24 18 89 4E 04 L$..T$....D$..N.
00416310 89 56 08 89 46 0C 8D 4C 24 54 C7 44 24 7C FF FF .V..F..L$T.D$|..
00416320 FF FF FF 15 38 43 8A 00 8B C6 8B 4C 24 74 64 89 ....8C.....L$td.
00416330 0D 00 00 00 00 59 5F 5E 8B 4C 24 64 33 CC E8 4B .....Y_^.L$d3..K
00416340 E8 27 00 83 C4 74 C2 08 00 CC CC CC CC CC CC CC .'...t..........
00416350 6A FF 68 3C E3 82 00 64 A1 00 00 00 00 50 81 EC j.h<...d.....P..
00416360 20 02 00 00 A1 88 41 A1 00 33 C4 89 84 24 1C 02  .....A..3...$..
00416370 00 00 53 56 A1 88 41 A1 00 33 C4 50 8D 84 24 2C ..SV..A..3.P..$,
00416380 02 00 00 64 A3 00 00 00 00 8B 84 24 3C 02 00 00 ...d.......$<...
00416390 D9 40 0C 83 EC 20 DD 5C 24 18 8B F1 D9 40 08 8B .@... .\$....@..
004163A0 8C 24 60 02 00 00 DD 5C 24 10 D9 40 04 DD 5C 24 .$`....\$..@..\$
004163B0 08 D9 00 8D 44 24 48 DD 1C 24 51 50 FF 15 50 46 ....D$H..$QP..PF
004163C0 8A 00 83 C4 28 8D 4C 24 28 51 8D 4C 24 10 FF 15 ....(.L$(Q.L$...
004163D0 34 43 8A 00 8B 16 8B 92 8C 00 00 00 8D 44 24 0C 4C...........D$.
004163E0 50 8B CE C7 84 24 38 02 00 00 00 00 00 00 FF D2 P....$8.........
004163F0 8D 4C 24 0C 8A D8 C7 84 24 34 02 00 00 FF FF FF .L$.....$4......
00416400 FF FF 15 38 43 8A 00 8A C3 8B 8C 24 2C 02 00 00 ...8C......$,...
00416410 64 89 0D 00 00 00 00 59 5E 5B 8B 8C 24 1C 02 00 d......Y^[..$...
00416420 00 33 CC E8 66 E7 27 00 81 C4 2C 02 00 00 C2 08 .3..f.'...,.....
00416430 00 CC CC CC CC CC CC CC CC CC CC CC CC CC CC CC ................
00416440 6A FF 68 94 E3 82 00 64 A1 00 00 00 00 50 83 EC j.h....d.....P..
00416450 38 53 55 56 57 A1 88 41 A1 00 33 C4 50 8D 44 24 8SUVW..A..3.P.D$
00416460 4C 64 A3 00 00 00 00 8B F1 68 F8 78 8A 00 8D 4C Ld.......h.x...L
00416470 24 18 FF 15 34 43 8A 00 8B 7C 24 60 8B 6C 24 5C $...4C...|$`.l$\
00416480 57 55 8D 44 24 1C 50 8B CE C7 44 24 60 00 00 00 WU.D$.P...D$`...
00416490 00 E8 DA 96 FF FF 8A D8 8D 4C 24 14 80 E3 01 C7 .........L$.....
004164A0 44 24 54 FF FF FF FF FF 15 38 43 8A 00 68 F0 78 D$T......8C..h.x
004164B0 8A 00 8D 4C 24 18 FF 15 34 43 8A 00 57 8D 4D 10 ...L$...4C..W.M.
004164C0 51 8D 54 24 1C 52 8B CE C7 44 24 60 01 00 00 00 Q.T$.R...D$`....
004164D0 E8 9B 96 FF FF 8D 4C 24 14 22 D8 C7 44 24 54 FF ......L$."..D$T.
004164E0 FF FF FF FF 15 38 43 8A 00 68 E8 78 8A 00 8D 4C .....8C..h.x...L
004164F0 24 18 FF 15 34 43 8A 00 57 8D 45 20 50 8D 4C 24 $...4C..W.E P.L$
00416500 1C 51 8B CE C7 44 24 60 02 00 00 00 E8 5F 96 FF .Q...D$`....._..
00416510 FF 8D 4C 24 14 22 D8 C7 44 24 54 FF FF FF FF FF ..L$."..D$T.....
00416520 15 38 43 8A 00 68 E0 78 8A 00 8D 4C 24 34 FF 15 .8C..h.x...L$4..
00416530 34 43 8A 00 57 83 C5 30 55 8D 54 24 38 52 8B CE 4C..W..0U.T$8R..
00416540 C7 44 24 60 03 00 00 00 E8 23 96 FF FF 8D 4C 24 .D$`.....#....L$
00416550 30 22 D8 C7 44 24 54 FF FF FF FF FF 15 38 43 8A 0"..D$T......8C.
00416560 00 8A C3 8B 4C 24 4C 64 89 0D 00 00 00 00 59 5F ....L$Ld......Y_
00416570 5E 5D 5B 83 C4 44 C2 08 00 CC CC CC CC CC CC CC ^][..D..........
00416580 81 EC 08 02 00 00 A1 88 41 A1 00 33 C4 89 84 24 ........A..3...$
00416590 04 02 00 00 56 8B B4 24 14 02 00 00 57 8B BC 24 ....V..$....W..$
004165A0 14 02 00 00 8B CE C7 44 24 08 00 00 00 00 FF 15 .......D$.......
004165B0 5C 43 8A 00 85 C0 75 07 68 D8 77 8A 00 EB 6B 51 \C....u.h.w...kQ
004165C0 8B C4 8B CE 89 64 24 0C C7 00 00 00 00 00 FF 15 .....d$.........
004165D0 DC 43 8A 00 80 38 21 75 23 8B CE FF 15 54 43 8A .C...8!u#....TC.
004165E0 00 50 8D 44 24 10 68 0C 79 8A 00 50 FF 15 5C 48 .P.D$.h.y..P..\H
004165F0 8A 00 83 C4 0C 8D 4C 24 0E 51 EB 2E 68 00 02 00 ......L$.Q..h...
00416600 00 8D 54 24 10 52 56 E8 44 9A 20 00 83 C4 0C 85 ..T$.RV.D. .....
00416610 C0 7C 12 D1 E8 50 8D 44 24 10 50 8B CF FF 15 48 .|...P.D$.P....H
00416620 44 8A 00 EB 0D 68 00 79 8A 00 8B CF FF 15 3C 44 D....h.y......<D
00416630 8A 00 8B 8C 24 0C 02 00 00 8B C7 5F 5E 33 CC E8 ....$......_^3..
00416640 4A E5 27 00 81 C4 08 02 00 00 C3 CC CC CC CC CC J.'.............
00416650 51 56 8B 74 24 10 8B CE C7 44 24 04 00 00 00 00 QV.t$....D$.....
00416660 FF 15 50 44 8A 00 03 C0 50 51 8B C4 8B CE 89 64 ..PD....PQ.....d
00416670 24 0C C7 00 00 00 00 00 FF 15 4C 44 8A 00 8B 74 $.........LD...t
00416680 24 10 50 56 E8 37 98 20 00 83 C4 0C 8B C6 5E 59 $.PV.7. ......^Y
00416690 C3 CC CC CC CC CC CC CC CC CC CC CC CC CC CC CC ................

;; fn004166A0: 004166A0
;;   Called from:
;;     00622D2A (in fn00622B40)
;;     00622D7A (in fn00622B40)
fn004166A0 proc
	mov	eax,[esp+4h]
	mov	edx,[esp+8h]
	cmp	eax,edx
	jz	4166C3h

l004166AC:
	mov	ecx,[esp+0Ch]
	push	esi

l004166B1:
	mov	esi,[ecx]
	mov	[eax],esi
	mov	esi,[ecx+4h]
	mov	[eax+4h],esi
	add	eax,8h
	cmp	eax,edx
	jnz	4166B1h

l004166C2:
	pop	esi

l004166C3:
	ret
004166C4             CC CC CC CC CC CC CC CC CC CC CC CC     ............
004166D0 8B 41 5C 83 EC 08 85 C0 74 05 8B 40 0C EB 02 33 .A\.....t..@...3
004166E0 C0 89 04 24 3D 00 04 00 00 C7 44 24 04 00 04 00 ...$=.....D$....
004166F0 00 8D 04 24 7F 04 8D 44 24 04 8B 00 83 C4 08 C3 ...$...D$.......
00416700 6A FF 68 DC E3 82 00 64 A1 00 00 00 00 50 83 EC j.h....d.....P..
00416710 3C 56 A1 88 41 A1 00 33 C4 50 8D 44 24 44 64 A3 <V..A..3.P.D$Dd.
00416720 00 00 00 00 8B F1 68 8F 69 8A 00 8D 4C 24 10 C7 ......h.i...L$..
00416730 44 24 0C 00 00 00 00 FF 15 34 43 8A 00 8B 06 8B D$.......4C.....
00416740 40 58 6A 00 8D 4C 24 10 51 8D 54 24 30 52 8B CE @Xj..L$.Q.T$0R..
00416750 C7 44 24 58 01 00 00 00 FF D0 8B 74 24 54 50 56 .D$X.......t$TPV
00416760 C6 44 24 54 02 E8 16 FE FF FF 83 C4 08 8D 4C 24 .D$T..........L$
00416770 28 C7 44 24 08 01 00 00 00 C6 44 24 4C 01 FF 15 (.D$......D$L...
00416780 38 43 8A 00 8D 4C 24 0C C6 44 24 4C 00 FF 15 38 8C...L$..D$L...8
00416790 43 8A 00 8B C6 8B 4C 24 44 64 89 0D 00 00 00 00 C.....L$Dd......
004167A0 59 5E 83 C4 48 C2 0C 00 CC CC CC CC CC CC CC CC Y^..H...........
004167B0 55 8B EC 83 E4 F0 6A FF 68 24 E4 82 00 64 A1 00 U.....j.h$...d..
004167C0 00 00 00 50 83 EC 58 53 56 57 A1 88 41 A1 00 33 ...P..XSVW..A..3
004167D0 C4 50 8D 44 24 68 64 A3 00 00 00 00 8B F9 8B 75 .P.D$hd........u
004167E0 08 6A 40 6A 00 56 E8 35 E8 27 00 F3 0F 10 05 1C .j@j.V.5.'......
004167F0 79 8A 00 83 C4 0C 68 F8 78 8A 00 8D 4C 24 30 F3 y.....h.x...L$0.
00416800 0F 11 46 3C FF 15 34 43 8A 00 8B 5D 0C 53 8D 44 ..F<..4C...].S.D
00416810 24 30 50 8D 4C 24 1C 51 8B CF C7 44 24 7C 00 00 $0P.L$.Q...D$|..
00416820 00 00 E8 59 8B FF FF 8B 10 89 16 8B 48 04 89 4E ...Y........H..N
00416830 04 8B 50 08 8D 4C 24 2C 89 56 08 C7 44 24 70 FF ..P..L$,.V..D$p.
00416840 FF FF FF FF 15 38 43 8A 00 68 F0 78 8A 00 8D 4C .....8C..h.x...L
00416850 24 30 FF 15 34 43 8A 00 8D 43 10 50 8D 4C 24 30 $0..4C...C.P.L$0
00416860 51 8D 54 24 1C 52 8B CF C7 44 24 7C 01 00 00 00 Q.T$.R...D$|....
00416870 E8 0B 8B FF FF 8B 08 89 4E 10 8B 50 04 89 56 14 ........N..P..V.
00416880 8B 40 08 8D 4C 24 2C 89 46 18 C7 44 24 70 FF FF .@..L$,.F..D$p..
00416890 FF FF FF 15 38 43 8A 00 68 E8 78 8A 00 8D 4C 24 ....8C..h.x...L$
004168A0 30 FF 15 34 43 8A 00 8D 4B 20 51 8D 54 24 30 52 0..4C...K Q.T$0R
004168B0 8D 44 24 1C 50 8B CF C7 44 24 7C 02 00 00 00 E8 .D$.P...D$|.....
004168C0 BC 8A FF FF 8B 08 89 4E 20 8B 50 04 89 56 24 8B .......N .P..V$.
004168D0 40 08 8D 4C 24 2C 89 46 28 C7 44 24 70 FF FF FF @..L$,.F(.D$p...
004168E0 FF FF 15 38 43 8A 00 68 E0 78 8A 00 8D 4C 24 4C ...8C..h.x...L$L
004168F0 FF 15 34 43 8A 00 83 C3 30 C7 44 24 70 03 00 00 ..4C....0.D$p...
00416900 00 53 8D 4C 24 4C 51 8D 54 24 28 52 8B CF E8 6D .S.L$LQ.T$(R...m
00416910 8A FF FF 8B 08 89 4E 30 8B 50 04 89 56 34 8B 40 ......N0.P..V4.@
00416920 08 8D 4C 24 48 89 46 38 C7 44 24 70 FF FF FF FF ..L$H.F8.D$p....
00416930 FF 15 38 43 8A 00 8B C6 8B 4C 24 68 64 89 0D 00 ..8C.....L$hd...
00416940 00 00 00 59 5F 5E 5B 8B E5 5D C2 08 00 CC CC CC ...Y_^[..]......
00416950 6A FF 68 49 E4 82 00 64 A1 00 00 00 00 50 83 EC j.hI...d.....P..
00416960 1C 56 A1 88 41 A1 00 33 C4 50 8D 44 24 24 64 A3 .V..A..3.P.D$$d.
00416970 00 00 00 00 8B F1 8B 44 24 34 50 8D 4C 24 0C 51 .......D$4P.L$.Q
00416980 E8 CB FC FF FF 83 C4 08 8B 16 50 8B 82 8C 00 00 ..........P.....
00416990 00 8B CE C7 44 24 30 00 00 00 00 FF D0 8D 4C 24 ....D$0.......L$
004169A0 08 C7 44 24 2C FF FF FF FF FF 15 38 43 8A 00 B0 ..D$,......8C...
004169B0 01 8B 4C 24 24 64 89 0D 00 00 00 00 59 5E 83 C4 ..L$$d......Y^..
004169C0 28 C2 04 00 CC CC CC CC CC CC CC CC CC CC CC CC (...............

;; fn004169D0: 004169D0
;;   Called from:
;;     00417042 (in fn00417030)
fn004169D0 proc
	mov	eax,[ecx]
	mov	ecx,[ecx+4h]
	cmp	ecx,[eax+0Ch]
	jc	4169DDh

l004169DA:
	xor	al,al
	ret

l004169DD:
	mov	eax,[eax+8h]
	mov	al,[ecx+eax]
	ret
004169E4             CC CC CC CC CC CC CC CC CC CC CC CC     ............

;; fn004169F0: 004169F0
;;   Called from:
;;     00416BDF (in fn00416A10)
;;     00416BEE (in fn00416A10)
;;     00416BFD (in fn00416A10)
;;     00416C22 (in fn00416A10)
;;     00416C39 (in fn00416A10)
;;     00416C44 (in fn00416A10)
fn004169F0 proc
	mov	eax,[ecx]
	mov	edx,[ecx+4h]
	cmp	edx,[eax+0Ch]
	jc	4169FDh

l004169FA:
	xor	al,al
	ret

l004169FD:
	mov	eax,[eax+8h]
	mov	al,[edx+eax]
	add	edx,1h
	mov	[ecx+4h],edx
	ret
00416A0A                               CC CC CC CC CC CC           ......

;; fn00416A10: 00416A10
;;   Called from:
;;     00418F2E (in fn00418D40)
fn00416A10 proc
	push	0FFh
	push	82E48Bh
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,58h
	push	ebx
	push	ebp
	push	esi
	push	edi
	mov	eax,[0A14188h]
	xor	eax,esp
	push	eax
	lea	eax,[esp+6Ch]
	mov	fs:[0000h],eax
	mov	esi,[esp+7Ch]
	mov	eax,[esi]
	mov	edx,[eax+0Ch]
	mov	ecx,[esi+4h]
	cmp	ecx,edx
	jnc	416A4Dh

l00416A47:
	add	ecx,1h
	mov	[esi+4h],ecx

l00416A4D:
	mov	edx,[eax+0Ch]
	mov	ecx,[esi+4h]
	cmp	ecx,edx
	jnc	416B5Fh

l00416A5B:
	mov	edx,[eax+8h]
	mov	dl,[ecx+edx]
	add	ecx,1h
	cmp	dl,2Dh
	mov	[esi+4h],ecx
	jnz	416B7Fh

l00416A70:
	cmp	ecx,[eax+0Ch]
	jnc	416A86h

l00416A75:
	mov	edx,[eax+8h]
	mov	dl,[ecx+edx]
	add	ecx,1h
	cmp	dl,2Dh
	mov	[esi+4h],ecx
	jz	416AA9h

l00416A86:
	push	8A7A70h
	call	520C80h
	add	esp,4h
	xor	al,al
	mov	ecx,[esp+6Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebp
	pop	ebx
	add	esp,64h
	ret

l00416AA9:
	cmp	ecx,[eax+0Ch]
	mov	edi,1h
	mov	byte ptr [esp+7Ch],0h
	jc	416ABCh

l00416AB8:
	xor	bl,bl
	jmp	416AC7h

l00416ABC:
	mov	edx,[eax+8h]
	mov	bl,[ecx+edx]
	add	ecx,edi
	mov	[esi+4h],ecx

l00416AC7:
	mov	ecx,[esi+4h]
	cmp	ecx,[eax+0Ch]
	jc	416AD3h

l00416ACF:
	xor	dl,dl
	jmp	416ADEh

l00416AD3:
	mov	edx,[eax+8h]
	mov	dl,[ecx+edx]
	add	ecx,edi
	mov	[esi+4h],ecx

l00416ADE:
	mov	ecx,[esi+4h]
	cmp	ecx,[eax+0Ch]
	jnc	416B4Ah

l00416AE6:
	test	edi,edi
	jz	416B4Ah

l00416AEA:
	mov	cl,[esp+7Ch]
	mov	[esp+17h],cl
	mov	ecx,[esi+4h]
	cmp	ecx,[eax+0Ch]
	mov	[esp+7Ch],bl
	mov	bl,dl
	jc	416B04h

l00416B00:
	xor	dl,dl
	jmp	416B10h

l00416B04:
	mov	edx,[eax+8h]
	mov	dl,[ecx+edx]
	add	ecx,1h
	mov	[esi+4h],ecx

l00416B10:
	cmp	byte ptr [esp+7Ch],2Dh
	jnz	416B26h

l00416B17:
	cmp	bl,2Dh
	jnz	416B26h

l00416B1C:
	cmp	dl,3Eh
	jnz	416B26h

l00416B21:
	sub	edi,1h
	jmp	416B40h

l00416B26:
	cmp	byte ptr [esp+17h],3Ch
	jnz	416B40h

l00416B2D:
	cmp	byte ptr [esp+7Ch],21h
	jnz	416B40h

l00416B34:
	cmp	bl,2Dh
	jnz	416B40h

l00416B39:
	cmp	dl,bl
	jnz	416B40h

l00416B3D:
	add	edi,1h

l00416B40:
	mov	ebp,[esi+4h]
	mov	ecx,eax
	cmp	ebp,[ecx+0Ch]
	jc	416AE6h

l00416B4A:
	mov	edx,[esi+4h]
	cmp	edx,[eax+0Ch]
	jc	416B5Fh

l00416B52:
	push	8A7A40h

l00416B57:
	call	520C80h
	add	esp,4h

l00416B5F:
	mov	eax,[esi]
	mov	ecx,[esi+4h]
	cmp	ecx,[eax+0Ch]
	sbb	eax,eax
	neg	eax
	mov	ecx,[esp+6Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebp
	pop	ebx
	add	esp,64h
	ret

l00416B7F:
	cmp	dl,5Bh
	jnz	416B5Fh

l00416B84:
	cmp	ecx,[eax+0Ch]
	jnc	416D62h

l00416B8D:
	mov	edi,[eax+8h]
	mov	dl,[ecx+edi]
	add	ecx,1h
	cmp	dl,43h
	mov	[esi+4h],ecx
	jnz	416D62h

l00416BA2:
	cmp	ecx,[eax+0Ch]
	jnc	416D62h

l00416BAB:
	mov	edi,[eax+8h]
	mov	dl,[ecx+edi]
	add	ecx,1h
	cmp	dl,44h
	mov	[esi+4h],ecx
	jnz	416D62h

l00416BC0:
	cmp	ecx,[eax+0Ch]
	jnc	416D62h

l00416BC9:
	mov	eax,[eax+8h]
	mov	al,[ecx+eax]
	add	ecx,1h
	cmp	al,41h
	mov	[esi+4h],ecx
	jnz	416D62h

l00416BDD:
	mov	ecx,esi
	call	4169F0h
	cmp	al,54h
	jnz	416D62h

l00416BEC:
	mov	ecx,esi
	call	4169F0h
	cmp	al,41h
	jnz	416D62h

l00416BFB:
	mov	ecx,esi
	call	4169F0h
	cmp	al,5Bh
	jnz	416D62h

l00416C0A:
	mov	eax,[esi]
	mov	ecx,[esi+4h]
	cmp	ecx,[eax+0Ch]
	mov	edx,[eax+8h]
	lea	ebx,[ecx+edx]
	jnc	416C57h

l00416C1A:
	lea	ebx,[ebx+0h]

l00416C20:
	mov	ecx,esi
	call	4169F0h
	cmp	al,5Dh
	jnz	416C4Dh

l00416C2B:
	mov	eax,[esi]
	mov	ecx,[esi+4h]
	mov	eax,[eax+8h]
	lea	edi,[ecx+eax-1h]
	mov	ecx,esi
	call	4169F0h
	cmp	al,5Dh
	jnz	416C4Dh

l00416C42:
	mov	ecx,esi
	call	4169F0h
	cmp	al,3Eh
	jz	416C61h

l00416C4D:
	mov	edx,[esi]
	mov	eax,[esi+4h]
	cmp	eax,[edx+0Ch]
	jc	416C20h

l00416C57:
	push	8A7A0Ch
	jmp	416B57h

l00416C61:
	mov	esi,[esp+80h]
	test	esi,esi
	mov	byte ptr [edi],0h
	jnz	416C92h

l00416C6F:
	push	8A79D8h
	call	520C80h
	add	esp,4h
	xor	al,al
	mov	ecx,[esp+6Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebp
	pop	ebx
	add	esp,64h
	ret

l00416C92:
	cmp	dword ptr [esi+0Ch],0h
	jnz	416CB1h

l00416C98:
	mov	[esi+0Ch],ebx
	mov	al,1h
	mov	ecx,[esp+6Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebp
	pop	ebx
	add	esp,64h
	ret

l00416CB1:
	push	8A698Fh
	lea	ecx,[esp+1Ch]
	call	dword ptr [8A4334h]
	mov	edx,[esi]
	mov	edx,[edx+58h]
	push	0h
	lea	eax,[esp+1Ch]
	push	eax
	lea	ecx,[esp+58h]
	push	ecx
	mov	ecx,esi
	mov	dword ptr [esp+80h],0h
	call	edx
	mov	edi,eax
	mov	eax,[esi]
	mov	edx,[eax+2Ch]
	lea	ecx,[esp+34h]
	push	ecx
	mov	ecx,esi
	mov	byte ptr [esp+78h],1h
	call	edx
	mov	esi,eax
	push	ebx
	mov	ecx,edi
	mov	byte ptr [esp+78h],2h
	call	dword ptr [8A4354h]
	push	eax
	mov	ecx,esi
	call	dword ptr [8A4354h]
	push	eax
	push	8A7970h
	call	520C80h
	add	esp,10h
	lea	ecx,[esp+34h]
	mov	byte ptr [esp+74h],1h
	call	dword ptr [8A4338h]
	lea	ecx,[esp+50h]
	mov	byte ptr [esp+74h],0h
	call	dword ptr [8A4338h]
	lea	ecx,[esp+18h]
	mov	dword ptr [esp+74h],0FFFFFFFFh
	call	dword ptr [8A4338h]
	xor	al,al
	mov	ecx,[esp+6Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebp
	pop	ebx
	add	esp,64h
	ret

l00416D62:
	push	8A7920h
	call	520C80h
	add	esp,4h
	xor	al,al
	mov	ecx,[esp+6Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebp
	pop	ebx
	add	esp,64h
	ret
00416D85                CC CC CC CC CC CC CC CC CC CC CC      ...........

;; fn00416D90: 00416D90
;;   Called from:
;;     00418F4F (in fn00418D40)
fn00416D90 proc
	mov	eax,[esp+4h]
	mov	ecx,[eax+4h]
	push	esi
	mov	esi,[eax]
	cmp	ecx,[esi+0Ch]
	push	edi
	jnc	416DA6h

l00416DA0:
	add	ecx,1h
	mov	[eax+4h],ecx

l00416DA6:
	mov	ecx,[eax+4h]
	cmp	ecx,[esi+0Ch]
	push	ebx
	jc	416DB3h

l00416DAF:
	xor	bl,bl
	jmp	416DBFh

l00416DB3:
	mov	edx,[esi+8h]
	mov	bl,[ecx+edx]
	add	ecx,1h
	mov	[eax+4h],ecx

l00416DBF:
	mov	ecx,[eax+4h]
	cmp	ecx,[esi+0Ch]
	jc	416DCBh

l00416DC7:
	xor	dl,dl
	jmp	416DD7h

l00416DCB:
	mov	edx,[esi+8h]
	mov	dl,[ecx+edx]
	add	ecx,1h
	mov	[eax+4h],ecx

l00416DD7:
	mov	ecx,[eax+4h]
	cmp	ecx,[esi+0Ch]
	jnc	416E0Eh

l00416DDF:
	nop

l00416DE0:
	cmp	bl,3Fh
	jnz	416DEAh

l00416DE5:
	cmp	dl,3Eh
	jz	416E0Eh

l00416DEA:
	mov	ecx,[eax+4h]
	cmp	ecx,[esi+0Ch]
	mov	bl,dl
	jc	416DF8h

l00416DF4:
	xor	dl,dl
	jmp	416E04h

l00416DF8:
	mov	edx,[esi+8h]
	mov	dl,[ecx+edx]
	add	ecx,1h
	mov	[eax+4h],ecx

l00416E04:
	mov	edi,[eax+4h]
	mov	ecx,esi
	cmp	edi,[ecx+0Ch]
	jc	416DE0h

l00416E0E:
	mov	esi,[esi+0Ch]
	mov	edi,[eax+4h]
	cmp	edi,esi
	pop	ebx
	jc	416E28h

l00416E19:
	push	8A7ABCh
	call	520C80h
	add	esp,4h
	cmp	edi,esi

l00416E28:
	sbb	eax,eax
	pop	edi
	neg	eax
	pop	esi
	ret
00416E2F                                              CC                .
00416E30 55 8B EC 6A FF 68 B8 E4 82 00 64 A1 00 00 00 00 U..j.h....d.....
00416E40 50 83 EC 18 53 56 57 A1 88 41 A1 00 33 C5 50 8D P...SVW..A..3.P.
00416E50 45 F4 64 A3 00 00 00 00 89 65 F0 8B 75 08 33 FF E.d......e..u.3.
00416E60 56 8D 4D DC 89 7D EC E8 04 AF FE FF 80 7D E0 00 V.M..}.......}..
00416E70 89 7D FC 0F 84 6A 01 00 00 8B 06 8B 48 04 03 CE .}...j......H...
00416E80 FF 15 A8 43 8A 00 83 F8 01 7E 12 8B 0E 8B 49 04 ...C.....~....I.
00416E90 03 CE FF 15 A8 43 8A 00 8B F8 83 EF 01 8B 16 8B .....C..........
00416EA0 4A 04 03 CE C6 45 FC 01 FF 15 A4 43 8A 00 25 C0 J....E.....C..%.
00416EB0 01 00 00 83 F8 40 74 68 EB 06 8D 9B 00 00 00 00 .....@th........
00416EC0 83 7D EC 00 0F 85 F3 00 00 00 85 FF 7E 52 8B 06 .}..........~R..
00416ED0 8B 48 04 03 CE FF 15 A0 43 8A 00 8B 0E 8B 49 04 .H......C.....I.
00416EE0 03 CE 8A D8 FF 15 6C 43 8A 00 53 8B C8 FF 15 9C ......lC..S.....
00416EF0 43 8A 00 89 45 E8 FF 15 98 43 8A 00 8D 55 E8 89 C...E....C...U..
00416F00 45 E4 52 8D 45 E4 50 FF 15 94 43 8A 00 83 C4 08 E.R.E.P...C.....
00416F10 84 C0 74 07 C7 45 EC 04 00 00 00 83 EF 01 EB A0 ..t..E..........
00416F20 8B 0E 8B 49 04 03 CE FF 15 6C 43 8A 00 8B 55 0C ...I.....lC...U.
00416F30 52 8B C8 FF 15 9C 43 8A 00 89 45 E4 FF 15 98 43 R.....C...E....C
00416F40 8A 00 89 45 E8 8D 45 E4 50 8D 4D E8 51 FF 15 94 ...E..E.P.M.Q...
00416F50 43 8A 00 83 C4 08 84 C0 74 07 C7 45 EC 04 00 00 C.......t..E....
00416F60 00 83 7D EC 00 75 56 85 FF 7E 52 8B 16 8B 4A 04 ..}..uV..~R...J.
00416F70 03 CE FF 15 A0 43 8A 00 8A D8 8B 06 8B 48 04 03 .....C.......H..
00416F80 CE FF 15 6C 43 8A 00 53 8B C8 FF 15 9C 43 8A 00 ...lC..S.....C..
00416F90 89 45 E4 FF 15 98 43 8A 00 8D 4D E4 51 8D 55 E8 .E....C...M.Q.U.
00416FA0 52 89 45 E8 FF 15 94 43 8A 00 83 C4 08 84 C0 74 R.E....C.......t
00416FB0 07 C7 45 EC 04 00 00 00 83 EF 01 EB A4 C7 45 FC ..E...........E.
00416FC0 00 00 00 00 EB 1D 8B 45 08 8B 08 8B 49 04 6A 01 .......E....I.j.
00416FD0 6A 04 03 C8 FF 15 88 43 8A 00 B8 E0 6F 41 00 C3 j......C....oA..
00416FE0 8B 75 08 8B 16 8B 4A 04 6A 00 03 CE FF 15 8C 43 .u....J.j......C
00416FF0 8A 00 8B 0E 8B 45 EC 8B 49 04 6A 00 50 03 CE FF .....E..I.j.P...
00417000 15 88 43 8A 00 8D 4D DC C7 45 FC FF FF FF FF E8 ..C...M..E......
00417010 1C AE FE FF 8B C6 8B 4D F4 64 89 0D 00 00 00 00 .......M.d......
00417020 59 5F 5E 5B 8B E5 5D C3 CC CC CC CC CC CC CC CC Y_^[..].........

;; fn00417030: 00417030
;;   Called from:
;;     00418E9E (in fn00418D40)
fn00417030 proc
	push	esi
	mov	esi,[esp+8h]
	mov	eax,[esi+4h]
	push	edi
	mov	edi,[esi]
	cmp	eax,[edi+0Ch]
	jnc	41706Ch

l00417040:
	mov	ecx,esi
	call	4169D0h
	push	eax
	call	415CA0h
	add	esp,4h
	test	al,al
	jz	41706Ch

l00417054:
	mov	eax,[esi+4h]
	cmp	eax,[edi+0Ch]
	jnc	417062h

l0041705C:
	add	eax,1h
	mov	[esi+4h],eax

l00417062:
	mov	edx,[esi+4h]
	mov	ecx,edi
	cmp	edx,[ecx+0Ch]
	jc	417040h

l0041706C:
	pop	edi
	pop	esi
	ret
0041706F                                              CC                .
00417070 6A FF 68 98 E5 82 00 64 A1 00 00 00 00 50 81 EC j.h....d.....P..
00417080 98 00 00 00 A1 88 41 A1 00 33 C4 89 84 24 94 00 ......A..3...$..
00417090 00 00 53 55 56 57 A1 88 41 A1 00 33 C4 50 8D 84 ..SUVW..A..3.P..
004170A0 24 AC 00 00 00 64 A3 00 00 00 00 8B B4 24 C0 00 $....d.......$..
004170B0 00 00 85 F6 8B BC 24 BC 00 00 00 8B E9 C7 44 24 ......$.......D$
004170C0 14 00 00 00 00 7E 1B 8B DE 8D A4 24 00 00 00 00 .....~.....$....
004170D0 6A 09 57 E8 58 FD FF FF 83 C4 08 83 EB 01 75 F0 j.W.X.........u.
004170E0 85 F6 75 21 68 20 6C 8A 00 8D 4C 24 3C FF 15 34 ..u!h l...L$<..4
004170F0 43 8A 00 C7 84 24 B4 00 00 00 00 00 00 00 BB 01 C....$..........
00417100 00 00 00 EB 1F 8B 45 00 8B 50 2C 8D 4C 24 1C 51 ......E..P,.L$.Q
00417110 8B CD FF D2 C7 84 24 B4 00 00 00 01 00 00 00 BB ......$.........
00417120 02 00 00 00 6A 3E 50 6A 3C 57 89 5C 24 24 E8 FD ....j>Pj<W.\$$..
00417130 FC FF FF 83 C4 08 50 FF 15 84 44 8A 00 83 C4 08 ......P...D.....
00417140 50 E8 EA FC FF FF 83 C4 08 F6 C3 02 C7 84 24 B4 P.............$.
00417150 00 00 00 00 00 00 00 74 11 83 E3 FD 8D 4C 24 1C .......t.....L$.
00417160 89 5C 24 14 FF 15 38 43 8A 00 F6 C3 01 C7 84 24 .\$...8C.......$
00417170 B4 00 00 00 FF FF FF FF 74 11 83 E3 FE 8D 4C 24 ........t.....L$
00417180 38 89 5C 24 14 FF 15 38 43 8A 00 8B 45 0C 85 C0 8.\$...8C...E...
00417190 74 1F 50 8D 4C 24 3C FF 15 34 43 8A 00 83 CB 04 t.P.L$<..4C.....
004171A0 C7 84 24 B4 00 00 00 02 00 00 00 89 5C 24 14 EB ..$.........\$..
004171B0 03 8D 45 2C 50 8D 8C 24 90 00 00 00 FF 15 3C 43 ..E,P..$......<C
004171C0 8A 00 F6 C3 04 C7 84 24 B4 00 00 00 04 00 00 00 .......$........
004171D0 74 11 83 E3 FB 8D 4C 24 38 89 5C 24 14 FF 15 38 t.....L$8.\$...8
004171E0 43 8A 00 8D 84 24 8C 00 00 00 68 8F 69 8A 00 50 C....$....h.i..P
004171F0 FF 15 E4 43 8A 00 83 C4 08 84 C0 74 65 8D 8C 24 ...C.......te..$
00417200 8C 00 00 00 FF 15 54 43 8A 00 50 8D 4C 24 20 51 ......TC..P.L$ Q
00417210 E8 8B 7A 00 00 83 C4 08 50 8D 8C 24 90 00 00 00 ..z.....P..$....
00417220 C6 84 24 B8 00 00 00 05 FF 15 58 43 8A 00 8D 4C ..$.......XC...L
00417230 24 1C C6 84 24 B4 00 00 00 04 FF 15 38 43 8A 00 $...$.......8C..
00417240 8D 8C 24 8C 00 00 00 FF 15 54 43 8A 00 50 6A 09 ..$......TC..Pj.
00417250 57 E8 DA FB FF FF 83 C4 08 50 E8 C1 AC FE FF 83 W........P......
00417260 C4 08 8B 45 4C 85 C0 74 60 8B 55 50 2B D0 C1 FA ...EL..t`.UP+...
00417270 02 74 56 A1 58 44 8A 00 50 8B CF FF 15 54 44 8A .tV.XD..P....TD.
00417280 00 8B 75 4C 3B 75 50 74 1B 8B 84 24 C0 00 00 00 ..uL;uPt...$....
00417290 8B 0E 83 C0 01 50 57 E8 D4 FD FF FF 83 C6 04 3B .....PW........;
004172A0 75 50 75 E5 8B B4 24 C0 00 00 00 85 F6 7E 25 90 uPu...$......~%.
004172B0 6A 09 57 E8 78 FB FF FF 83 C4 08 83 EE 01 75 F0 j.W.x.........u.
004172C0 8B B4 24 C0 00 00 00 EB 0B 6A 09 57 E8 5F FB FF ..$......j.W._..
004172D0 FF 83 C4 08 85 F6 75 1C 68 20 6C 8A 00 8D 4C 24 ......u.h l...L$
004172E0 74 FF 15 34 43 8A 00 C6 84 24 B4 00 00 00 06 83 t..4C....$......
004172F0 CB 08 EB 1D 8B 55 00 8B 52 2C 8D 44 24 54 50 8B .....U..R,.D$TP.
00417300 CD FF D2 C7 84 24 B4 00 00 00 07 00 00 00 83 CB .....$..........
00417310 10 8B 0D 58 44 8A 00 51 6A 3E 50 68 F8 7A 8A 00 ...XD..Qj>Ph.z..
00417320 57 89 5C 24 28 E8 F6 AB FE FF 83 C4 08 50 FF 15 W.\$(........P..
00417330 84 44 8A 00 83 C4 08 50 E8 F3 FA FF FF 83 C4 08 .D.....P........
00417340 8B C8 FF 15 54 44 8A 00 F6 C3 10 C7 84 24 B4 00 ....TD.......$..
00417350 00 00 06 00 00 00 74 11 83 E3 EF 8D 4C 24 54 89 ......t.....L$T.
00417360 5C 24 14 FF 15 38 43 8A 00 F6 C3 08 C7 84 24 B4 \$...8C.......$.
00417370 00 00 00 04 00 00 00 74 0A 8D 4C 24 70 FF 15 38 .......t..L$p..8
00417380 43 8A 00 8D 8C 24 8C 00 00 00 C7 84 24 B4 00 00 C....$......$...
00417390 00 FF FF FF FF FF 15 38 43 8A 00 B0 01 8B 8C 24 .......8C......$
004173A0 AC 00 00 00 64 89 0D 00 00 00 00 59 5F 5E 5D 5B ....d......Y_^][
004173B0 8B 8C 24 94 00 00 00 33 CC E8 D0 D7 27 00 81 C4 ..$....3....'...
004173C0 A4 00 00 00 C2 08 00 CC CC CC CC CC CC CC CC CC ................

;; fn004173D0: 004173D0
;;   Called from:
;;     00417A72 (in fn00417A50)
fn004173D0 proc
	push	ebx
	mov	ebx,[esp+0Ch]
	push	ebp
	mov	ebp,[esp+0Ch]
	cmp	ebp,ebx
	jz	417424h

l004173DE:
	push	esi
	push	edi
	mov	edi,[esp+1Ch]

l004173E4:
	mov	ecx,[ebx-4h]
	mov	esi,[edi-4h]
	sub	ebx,4h
	sub	edi,4h
	cmp	esi,ecx
	jz	417419h

l004173F4:
	test	ecx,ecx
	mov	[edi],ecx
	jz	4173FFh

l004173FA:
	call	401AD0h

l004173FF:
	test	esi,esi
	jz	417419h

l00417403:
	mov	ecx,esi
	call	401AE0h
	cmp	eax,1h
	jnz	417419h

l0041740F:
	mov	eax,[esi]
	mov	edx,[eax]
	push	1h
	mov	ecx,esi
	call	edx

l00417419:
	cmp	ebx,ebp
	jnz	4173E4h

l0041741D:
	mov	eax,edi
	pop	edi
	pop	esi
	pop	ebp
	pop	ebx
	ret

l00417424:
	mov	eax,[esp+14h]
	pop	ebp
	pop	ebx
	ret
0041742B                                  CC CC CC CC CC            .....

;; fn00417430: 00417430
;;   Called from:
;;     00417880 (in fn00417860)
fn00417430 proc
	push	0FFh
	push	82E5D8h
	mov	eax,fs:[0000h]
	push	eax
	push	ebx
	push	ebp
	push	esi
	push	edi
	mov	eax,[0A14188h]
	xor	eax,esp
	push	eax
	lea	eax,[esp+14h]
	mov	fs:[0000h],eax
	mov	ebp,[esp+24h]
	cmp	ebp,[esp+28h]
	jz	4174F1h

l00417462:
	mov	ebx,[esp+2Ch]

l00417466:
	mov	esi,[ebp+0h]
	test	esi,esi
	mov	[esp+2Ch],esi
	jz	417478h

l00417471:
	mov	ecx,esi
	call	401AD0h

l00417478:
	mov	edi,[ebx]
	cmp	edi,esi
	mov	dword ptr [esp+1Ch],0h
	jz	4174ADh

l00417486:
	test	esi,esi
	mov	[ebx],esi
	jz	417493h

l0041748C:
	mov	ecx,esi
	call	401AD0h

l00417493:
	test	edi,edi
	jz	4174ADh

l00417497:
	mov	ecx,edi
	call	401AE0h
	cmp	eax,1h
	jnz	4174ADh

l004174A3:
	mov	eax,[edi]
	mov	edx,[eax]
	push	1h
	mov	ecx,edi
	call	edx

l004174AD:
	test	esi,esi
	mov	dword ptr [esp+1Ch],0FFFFFFFFh
	jz	4174CFh

l004174B9:
	mov	ecx,esi
	call	401AE0h
	cmp	eax,1h
	jnz	4174CFh

l004174C5:
	mov	eax,[esi]
	mov	edx,[eax]
	push	1h
	mov	ecx,esi
	call	edx

l004174CF:
	add	ebp,4h
	add	ebx,4h
	cmp	ebp,[esp+28h]
	jnz	417466h

l004174DB:
	mov	eax,ebx
	mov	ecx,[esp+14h]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebp
	pop	ebx
	add	esp,0Ch
	ret

l004174F1:
	mov	eax,[esp+2Ch]
	mov	ecx,[esp+14h]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebp
	pop	ebx
	add	esp,0Ch
	ret
00417509                            CC CC CC CC CC CC CC          .......
00417510 51 8B 51 4C 85 D2 56 8B 74 24 10 C7 44 24 04 00 Q.QL..V.t$..D$..
00417520 00 00 00 74 27 8B 41 50 2B C2 C1 F8 02 3B F0 73 ...t'.AP+....;.s
00417530 1B 8B C2 8B 0C B0 85 C9 8B 74 24 0C 89 0E 74 05 .........t$...t.
00417540 E8 8B A5 FE FF 8B C6 5E 59 C2 08 00 8B C2 85 C0 .......^Y.......
00417550 75 04 33 C9 EB 08 8B 49 50 2B C8 C1 F9 02 51 56 u.3....IP+....QV
00417560 68 FC 7A 8A 00 E8 16 97 10 00 8B 44 24 18 83 C4 h.z........D$...
00417570 0C C7 00 00 00 00 00 5E 59 C2 08 00 CC CC CC CC .......^Y.......
00417580 6A FF 68 09 E6 82 00 64 A1 00 00 00 00 50 83 EC j.h....d.....P..
00417590 24 53 55 56 57 A1 88 41 A1 00 33 C4 50 8D 44 24 $SUVW..A..3.P.D$
004175A0 38 64 A3 00 00 00 00 89 4C 24 14 8B 71 4C 3B 71 8d......L$..qL;q
004175B0 50 C7 44 24 18 00 00 00 00 74 4B 8B 7C 24 4C 8B P.D$.....tK.|$L.
004175C0 2D 34 44 8A 00 8B 0E 8B 01 8B 40 2C 8D 54 24 1C -4D.......@,.T$.
004175D0 52 FF D0 57 50 C7 44 24 48 00 00 00 00 FF D5 83 R..WP.D$H.......
004175E0 C4 08 8D 4C 24 1C 8A D8 C7 44 24 40 FF FF FF FF ...L$....D$@....
004175F0 FF 15 38 43 8A 00 84 DB 75 2C 8B 4C 24 14 83 C6 ..8C....u,.L$...
00417600 04 3B 71 50 75 BF 8B 44 24 48 C7 00 00 00 00 00 .;qPu..D$H......
00417610 8B 4C 24 38 64 89 0D 00 00 00 00 59 5F 5E 5D 5B .L$8d......Y_^][
00417620 83 C4 30 C2 08 00 8B 36 85 F6 8B 7C 24 48 89 37 ..0....6...|$H.7
00417630 74 07 8B CE E8 97 A4 FE FF 8B C7 EB D3 CC CC CC t...............
00417640 6A FF 68 38 E6 82 00 64 A1 00 00 00 00 50 56 57 j.h8...d.....PVW
00417650 A1 88 41 A1 00 33 C4 50 8D 44 24 0C 64 A3 00 00 ..A..3.P.D$.d...
00417660 00 00 8B 79 58 8B 74 24 1C 3B FE C7 44 24 14 00 ...yX.t$.;..D$..
00417670 00 00 00 74 28 85 F6 89 71 58 74 07 8B CE E8 4D ...t(...qXt....M
00417680 A4 FE FF 85 FF 74 16 8B CF E8 52 A4 FE FF 83 F8 .....t....R.....
00417690 01 75 0A 8B 07 8B 10 6A 01 8B CF FF D2 85 F6 C7 .u.....j........
004176A0 44 24 14 FF FF FF FF 74 16 8B CE E8 30 A4 FE FF D$.....t....0...
004176B0 83 F8 01 75 0A 8B 06 8B 10 6A 01 8B CE FF D2 8B ...u.....j......
004176C0 4C 24 0C 64 89 0D 00 00 00 00 59 5F 5E 83 C4 0C L$.d......Y_^...
004176D0 C2 04 00 CC CC CC CC CC CC CC CC CC CC CC CC CC ................
004176E0 6A FF 68 99 E6 82 00 64 A1 00 00 00 00 50 81 EC j.h....d.....P..
004176F0 A8 00 00 00 53 56 A1 88 41 A1 00 33 C4 50 8D 84 ....SV..A..3.P..
00417700 24 B4 00 00 00 64 A3 00 00 00 00 8B F1 BB 01 00 $....d..........
00417710 00 00 53 6A 03 8D 4C 24 1C C7 44 24 14 00 00 00 ..Sj..L$..D$....
00417720 00 FF 15 90 44 8A 00 6A 00 8D 44 24 20 50 8B CE ....D..j..D$ P..
00417730 89 9C 24 C4 00 00 00 E8 34 F9 FF FF 84 C0 75 13 ..$.....4.....u.
00417740 8B B4 24 C4 00 00 00 C7 06 00 00 00 00 89 5C 24 ..$...........\$
00417750 0C EB 79 6A 14 E8 7E D8 27 00 8B F0 83 C4 04 89 ..yj..~.'.......
00417760 74 24 10 85 F6 C6 84 24 BC 00 00 00 02 74 26 8D t$.....$.....t&.
00417770 8C 24 9C 00 00 00 51 8D 4C 24 20 FF 15 8C 44 8A .$....Q.L$ ...D.
00417780 00 8B 48 08 03 08 8D 54 24 14 51 52 8B CE E8 7D ..H....T$.QR...}
00417790 31 00 00 EB 02 33 C0 85 C0 88 9C 24 BC 00 00 00 1....3.....$....
004177A0 74 03 01 58 04 85 C0 8B B4 24 C4 00 00 00 89 06 t..X.....$......
004177B0 74 03 01 58 04 85 C0 89 5C 24 0C 74 0F 83 40 04 t..X....\$.t..@.
004177C0 FF 75 09 8B 10 8B C8 8B 02 53 FF D0 8D 4C 24 14 .u.......S...L$.
004177D0 C6 84 24 BC 00 00 00 00 FF 15 88 44 8A 00 8B C6 ..$........D....
004177E0 8B 8C 24 B4 00 00 00 64 89 0D 00 00 00 00 59 5E ..$....d......Y^
004177F0 5B 81 C4 B4 00 00 00 C2 04 00 CC CC CC CC CC CC [...............
00417800 8B 44 24 04 83 78 14 00 56 57 8B F1 74 15 8D 4E .D$..x..VW..t..N
00417810 10 51 8D 56 58 52 50 E8 04 8B FF FF 83 C4 0C 84 .Q.VXRP.........
00417820 C0 74 14 8B 7E 58 85 FF 75 14 68 34 7B 8A 00 E8 .t..~X..u.h4{...
00417830 4C 94 10 00 83 C4 04 32 C0 5F 5E C2 04 00 6A 00 L......2._^...j.
00417840 51 8B C4 8B CE 89 64 24 14 89 30 E8 80 A2 FE FF Q.....d$..0.....
00417850 8B 07 8B 50 38 8B CF FF D2 5F 5E C2 04 00 CC CC ...P8...._^.....

;; fn00417860: 00417860
;;   Called from:
;;     00418379 (in fn00418150)
;;     004183E8 (in fn00418150)
fn00417860 proc
	push	ecx
	mov	byte ptr [esp],0h
	mov	eax,[esp]
	mov	ecx,[esp]
	mov	edx,[esp]
	push	eax
	mov	eax,[esp+14h]
	push	ecx
	mov	ecx,[esp+14h]
	push	edx
	mov	edx,[esp+14h]
	push	eax
	push	ecx
	push	edx
	call	417430h
	add	esp,1Ch
	ret
00417889                            CC CC CC CC CC CC CC          .......

;; fn00417890: 00417890
;;   Called from:
;;     00417F84 (in fn00417F40)
fn00417890 proc
	mov	eax,[esp+0Ch]
	push	ebx
	push	esi
	mov	esi,ecx
	mov	ecx,[eax]
	mov	[esp+14h],ecx
	mov	ecx,[esi+4h]
	test	ecx,ecx
	push	edi
	jnz	4178AAh

l004178A6:
	xor	edi,edi
	jmp	4178B2h

l004178AA:
	mov	edi,[esi+0Ch]
	sub	edi,ecx
	sar	edi,2h

l004178B2:
	mov	ebx,[esp+14h]
	test	ebx,ebx
	jz	417A3Fh

l004178BE:
	test	ecx,ecx
	jnz	4178C6h

l004178C2:
	xor	eax,eax
	jmp	4178CEh

l004178C6:
	mov	eax,[esi+8h]
	sub	eax,ecx
	sar	eax,2h

l004178CE:
	mov	edx,3FFFFFFFh
	sub	edx,eax
	cmp	edx,ebx
	jnc	4178DEh

l004178D9:
	call	415D80h

l004178DE:
	test	ecx,ecx
	jnz	4178E6h

l004178E2:
	xor	eax,eax
	jmp	4178EEh

l004178E6:
	mov	eax,[esi+8h]
	sub	eax,ecx
	sar	eax,2h

l004178EE:
	add	eax,ebx
	cmp	edi,eax
	push	ebp
	jnc	4179ADh

l004178F9:
	mov	eax,edi
	shr	eax,1h
	mov	edx,3FFFFFFFh
	sub	edx,eax
	cmp	edx,edi
	jnc	41790Ch

l00417908:
	xor	edi,edi
	jmp	41790Eh

l0041790C:
	add	edi,eax

l0041790E:
	test	ecx,ecx
	jnz	417916h

l00417912:
	xor	eax,eax
	jmp	41791Eh

l00417916:
	mov	eax,[esi+8h]
	sub	eax,ecx
	sar	eax,2h

l0041791E:
	add	eax,ebx
	cmp	edi,eax
	jnc	417936h

l00417924:
	test	ecx,ecx
	jnz	41792Ch

l00417928:
	xor	edi,edi
	jmp	417934h

l0041792C:
	mov	edi,[esi+8h]
	sub	edi,ecx
	sar	edi,2h

l00417934:
	add	edi,ebx

l00417936:
	push	0h
	push	edi
	call	7B2480h
	mov	ecx,[esi+4h]
	add	esp,8h
	mov	ebp,eax
	mov	eax,[esp+14h]
	push	ebp
	push	eax
	push	ecx
	mov	ecx,esi
	call	7B2800h
	lea	edx,[esp+1Ch]
	push	edx
	push	ebx
	push	eax
	mov	ecx,esi
	call	669E20h
	mov	ecx,[esp+14h]
	push	eax
	mov	eax,[esi+8h]
	push	eax
	push	ecx
	mov	ecx,esi
	call	7B2800h
	mov	eax,[esi+4h]
	test	eax,eax
	jnz	41797Eh

l0041797A:
	xor	ecx,ecx
	jmp	417986h

l0041797E:
	mov	ecx,[esi+8h]
	sub	ecx,eax
	sar	ecx,2h

l00417986:
	add	ebx,ecx
	test	eax,eax
	jz	417995h

l0041798C:
	push	eax
	call	694FC6h
	add	esp,4h

l00417995:
	lea	edx,[ebp+edi*4+0h]
	lea	eax,[ebp+ebx*4+0h]
	mov	[esi+4h],ebp
	pop	ebp
	pop	edi
	mov	[esi+0Ch],edx
	mov	[esi+8h],eax
	pop	esi
	pop	ebx
	ret	0Ch

l004179AD:
	mov	ebp,[esi+8h]
	mov	edi,[esp+14h]
	mov	ecx,ebp
	sub	ecx,edi
	sar	ecx,2h
	lea	eax,[0000h+ebx*4]
	cmp	ecx,ebx
	mov	[esp+14h],eax
	mov	ecx,esi
	jnc	417A12h

l004179CC:
	add	eax,edi
	push	eax
	push	ebp
	push	edi
	call	7B2800h
	mov	eax,[esi+8h]
	mov	ecx,eax
	sub	ecx,edi
	sar	ecx,2h
	lea	edx,[esp+1Ch]
	push	edx
	sub	ebx,ecx
	push	ebx
	push	eax
	mov	ecx,esi
	call	669E20h
	mov	eax,[esp+14h]
	add	[esi+8h],eax
	mov	esi,[esi+8h]
	lea	edx,[esp+1Ch]
	push	edx
	sub	esi,eax
	push	esi
	push	edi
	call	4B3770h
	add	esp,0Ch
	pop	ebp
	pop	edi
	pop	esi
	pop	ebx
	ret	0Ch

l00417A12:
	push	ebp
	mov	ebx,ebp
	sub	ebx,eax
	push	ebp
	push	ebx
	call	7B2800h
	push	ebp
	push	ebx
	push	edi
	mov	[esi+8h],eax
	call	50AAA0h
	mov	ecx,[esp+20h]
	lea	eax,[esp+28h]
	push	eax
	add	ecx,edi
	push	ecx
	push	edi
	call	4B3770h
	add	esp,18h
	pop	ebp

l00417A3F:
	pop	edi
	pop	esi
	pop	ebx
	ret	0Ch
00417A45                CC CC CC CC CC CC CC CC CC CC CC      ...........

;; fn00417A50: 00417A50
;;   Called from:
;;     00414DF5 (in fn00414B80)
;;     004183DA (in fn00418150)
fn00417A50 proc
	push	ecx
	mov	ecx,[esp+10h]
	mov	edx,[esp+10h]
	mov	byte ptr [esp],0h
	mov	eax,[esp]
	push	eax
	mov	eax,[esp+14h]
	push	ecx
	mov	ecx,[esp+14h]
	push	edx
	mov	edx,[esp+14h]
	push	eax
	push	ecx
	push	edx
	call	4173D0h
	add	esp,1Ch
	ret
00417A7B                                  CC CC CC CC CC            .....
00417A80 56 57 8B 7C 24 0C 8B 37 85 F6 74 1A 8B CE E8 4D VW.|$..7..t....M
00417A90 A0 FE FF 83 F8 01 75 0E 85 F6 74 0A 8B 06 8B 10 ......u...t.....
00417AA0 6A 01 8B CE FF D2 C7 07 00 00 00 00 5F 5E C2 04 j..........._^..
00417AB0 00 CC CC CC CC CC CC CC CC CC CC CC CC CC CC CC ................

;; fn00417AC0: 00417AC0
;;   Called from:
;;     00622CF1 (in fn00622B40)
;;     00622D5C (in fn00622B40)
fn00417AC0 proc
	push	ecx
	mov	edx,[esp+10h]
	mov	byte ptr [esp],0h
	mov	eax,[esp]
	push	eax
	mov	eax,[esp+14h]
	push	edx
	mov	edx,[esp+10h]
	push	ecx
	mov	ecx,[esp+18h]
	push	eax
	push	ecx
	push	edx
	call	614080h
	add	esp,1Ch
	ret	0Ch
00417AE9                            CC CC CC CC CC CC CC          .......

;; fn00417AF0: 00417AF0
;;   Called from:
;;     00417FAE (in fn00417F90)
;;     0041826D (in fn00418150)
fn00417AF0 proc
	push	ebp
	mov	ebp,esp
	push	0FFh
	push	82E6C0h
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,8h
	push	ebx
	push	esi
	push	edi
	mov	eax,[0A14188h]
	xor	eax,ebp
	push	eax
	lea	eax,[ebp-0Ch]
	mov	fs:[0000h],eax
	mov	[ebp-10h],esp
	mov	ebx,[ebp+10h]
	mov	edi,[ebp+8h]
	mov	[ebp-14h],ebx
	mov	dword ptr [ebp-4h],0h
	jmp	417B30h
00417B2D                                        8D 49 00              .I.

l00417B30:
	cmp	edi,[ebp+0Ch]
	jz	417B9Dh

l00417B35:
	mov	esi,[edi]
	test	esi,esi
	jz	417B42h

l00417B3B:
	mov	ecx,esi
	call	401AD0h

l00417B42:
	test	ebx,ebx
	jz	417B53h

l00417B46:
	test	esi,esi
	mov	[ebx],esi
	jz	417B6Dh

l00417B4C:
	mov	ecx,esi
	call	401AD0h

l00417B53:
	test	esi,esi
	jz	417B6Dh

l00417B57:
	mov	ecx,esi
	call	401AE0h
	cmp	eax,1h
	jnz	417B6Dh

l00417B63:
	mov	eax,[esi]
	mov	edx,[eax]
	push	1h
	mov	ecx,esi
	call	edx

l00417B6D:
	add	ebx,4h
	mov	[ebp+10h],ebx
	add	edi,4h
	jmp	417B30h
00417B78                         8B 75 EC 8B 7D 10 3B F7         .u..}.;.
00417B80 74 12 8B 5D 14 56 8B CB E8 F3 FE FF FF 83 C6 04 t..].V..........
00417B90 3B F7 75 F1 6A 00 6A 00 E8 2F D4 27 00          ;.u.j.j../.'.  

l00417B9D:
	mov	eax,ebx
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret
00417BB1    CC CC CC CC CC CC CC CC CC CC CC CC CC CC CC  ...............

;; fn00417BC0: 00417BC0
;;   Called from:
;;     00417F30 (in fn00417F00)
;;     004198AC (in fn00419800)
fn00417BC0 proc
	push	esi
	mov	esi,[esp+8h]
	cmp	dword ptr [esi],0h
	push	edi
	mov	edi,ecx
	jz	417BDFh

l00417BCD:
	mov	eax,[esp+10h]
	add	dword ptr [eax],0FFh
	mov	eax,[esi]
	mov	ecx,[eax]
	pop	edi
	mov	[esi],ecx
	pop	esi
	ret	10h

l00417BDF:
	push	ebx
	mov	ebx,[esp+1Ch]
	push	ebp
	mov	ebp,[esp+1Ch]
	cmp	dword ptr [ebp+0h],0h
	jnz	417C2Fh

l00417BEF:
	push	esi
	call	41DBE0h
	mov	ecx,[esp+18h]
	add	[ecx],eax
	cmp	dword ptr [esi],0h
	mov	eax,[ecx]
	jz	417C14h

l00417C02:
	add	eax,0FFh
	mov	[ecx],eax
	mov	eax,[esi]
	mov	edx,[eax]
	pop	ebp
	pop	ebx
	pop	edi
	mov	[esi],edx
	pop	esi
	ret	10h

l00417C14:
	mov	eax,[edi+1Ch]
	lea	eax,[eax+eax*2]
	shl	eax,5h
	push	eax
	call	694B89h
	mov	[ebp+0h],eax
	add	esp,4h
	mov	dword ptr [ebx],0h

l00417C2F:
	mov	ecx,[ebx]
	lea	eax,[ecx+ecx*2]
	shl	eax,5h
	add	eax,[ebp+0h]
	add	ecx,1h
	mov	[ebx],ecx
	cmp	ecx,[edi+1Ch]
	jnz	417C4Bh

l00417C44:
	mov	dword ptr [ebp+0h],0h

l00417C4B:
	pop	ebp
	pop	ebx
	pop	edi
	pop	esi
	ret	10h
00417C52       CC CC CC CC CC CC CC CC CC CC CC CC CC CC   ..............

;; fn00417C60: 00417C60
;;   Called from:
;;     00414E93 (in fn00414E50)
;;     004CDDC2 (in fn004CDDA0)
fn00417C60 proc
	push	edi
	mov	edi,[esp+0Ch]
	test	edi,edi
	jbe	417C90h

l00417C69:
	push	ebx
	mov	ebx,[esp+14h]
	push	esi
	mov	esi,[esp+10h]

l00417C73:
	test	esi,esi
	jz	417C84h

l00417C77:
	mov	ecx,[ebx]
	test	ecx,ecx
	mov	[esi],ecx
	jz	417C84h

l00417C7F:
	call	401AD0h

l00417C84:
	sub	edi,1h
	add	esi,4h
	test	edi,edi
	ja	417C73h

l00417C8E:
	pop	esi
	pop	ebx

l00417C90:
	pop	edi
	ret
00417C92       CC CC CC CC CC CC CC CC CC CC CC CC CC CC   ..............
00417CA0 55 8B EC 6A FF 68 E0 E6 82 00 64 A1 00 00 00 00 U..j.h....d.....
00417CB0 50 83 EC 10 53 56 57 A1 88 41 A1 00 33 C5 50 8D P...SVW..A..3.P.
00417CC0 45 F4 64 A3 00 00 00 00 89 65 F0 8B F1 8B 45 10 E.d......e....E.
00417CD0 8B 08 8B 50 04 8B 46 04 85 C0 89 4D E4 89 55 E8 ...P..F....M..U.
00417CE0 75 04 33 FF EB 08 8B 7E 0C 2B F8 C1 FF 03 8B 55 u.3....~.+.....U
00417CF0 0C 85 D2 0F 84 E9 01 00 00 85 C0 75 04 33 C9 EB ...........u.3..
00417D00 08 8B 4E 08 2B C8 C1 F9 03 BB FF FF FF 1F 2B D9 ..N.+.........+.
00417D10 3B DA 73 05 E8 07 E0 FF FF 85 C0 75 04 33 C9 EB ;.s........u.3..
00417D20 08 8B 4E 08 2B C8 C1 F9 03 03 CA 3B F9 0F 83 FC ..N.+......;....
00417D30 00 00 00 8B CF D1 E9 BB FF FF FF 1F 2B D9 3B DF ............+.;.
00417D40 73 04 33 FF EB 02 03 F9 85 C0 75 04 33 C9 EB 08 s.3.......u.3...
00417D50 8B 4E 08 2B C8 C1 F9 03 03 CA 3B F9 73 13 85 C0 .N.+......;.s...
00417D60 75 04 33 C9 EB 08 8B 4E 08 2B C8 C1 F9 03 8D 3C u.3....N.+.....<
00417D70 11 6A 00 57 E8 97 16 1C 00 8B 55 0C C6 45 10 00 .j.W......U..E..
00417D80 8B 4D 10 51 8B 4D 08 52 8B D8 8B 46 04 56 53 51 .M.Q.M.R...F.VSQ
00417D90 50 89 5D EC C7 45 FC 00 00 00 00 E8 E0 C2 1F 00 P.]..E..........
00417DA0 8B 4D 0C 83 C4 20 8D 55 E4 52 51 50 8B CE E8 4D .M... .U.RQP...M
00417DB0 39 1A 00 8B 4E 08 C6 45 10 00 8B 55 10 52 8B 55 9...N..E...U.R.U
00417DC0 0C 52 56 50 8B 45 08 51 50 E8 B2 C2 1F 00 8B 4E .RVP.E.QP......N
00417DD0 04 83 C4 18 85 C9 75 04 33 C0 EB 08 8B 46 08 2B ......u.3....F.+
00417DE0 C1 C1 F8 03 01 45 0C 85 C9 74 09 51 E8 D5 D1 27 .....E...t.Q...'
00417DF0 00 83 C4 04 8B 55 0C 8D 0C FB 8D 04 D3 89 4E 0C .....U........N.
00417E00 89 46 08 89 5E 04 8B 4D F4 64 89 0D 00 00 00 00 .F..^..M.d......
00417E10 59 5F 5E 5B 8B E5 5D C2 0C 00 8B 4D EC 51 E8 A3 Y_^[..]....M.Q..
00417E20 D1 27 00 83 C4 04 6A 00 6A 00 E8 9D D1 27 00 8B .'....j.j....'..
00417E30 5E 08 8B 7D 08 8B C3 2B C7 C1 F8 03 3B C2 73 66 ^..}...+....;.sf
00417E40 8D 04 D5 00 00 00 00 89 45 08 03 C7 50 53 57 8B ........E...PSW.
00417E50 CE E8 6A FC FF FF 8B 46 08 8B D0 8D 4D E4 51 8B ..j....F....M.Q.
00417E60 4D 0C 2B D7 C1 FA 03 2B CA 51 50 8B CE C7 45 FC M.+....+.QP...E.
00417E70 02 00 00 00 E8 87 38 1A 00 8B 45 08 01 46 08 8B ......8...E..F..
00417E80 76 08 8D 4D E4 51 2B F0 56 57 E8 11 E8 FF FF 83 v..M.Q+.VW......
00417E90 C4 0C 8B 4D F4 64 89 0D 00 00 00 00 59 5F 5E 5B ...M.d......Y_^[
00417EA0 8B E5 5D C2 0C 00 8D 0C D5 00 00 00 00 53 8B C3 ..]..........S..
00417EB0 2B C1 53 89 4D 08 50 8B CE 89 45 0C E8 FF FB FF +.S.M.P...E.....
00417EC0 FF 8B 55 0C 53 52 57 89 46 08 E8 D1 C2 24 00 8B ..U.SRW.F....$..
00417ED0 4D 08 8D 45 E4 50 03 CF 51 57 E8 C1 E7 FF FF 83 M..E.P..QW......
00417EE0 C4 18 8B 4D F4 64 89 0D 00 00 00 00 59 5F 5E 5B ...M.d......Y_^[
00417EF0 8B E5 5D C2 0C 00 CC CC CC CC CC CC CC CC CC CC ..].............

;; fn00417F00: 00417F00
;;   Called from:
;;     00419025 (in fn00418D40)
;;     00419217 (in fn00418D40)
fn00417F00 proc
	mov	ecx,fs:[002Ch]
	mov	eax,[0A6B0F4h]
	mov	eax,[ecx+eax*4]
	lea	edx,[eax+28h]
	push	edx
	lea	ecx,[eax+24h]
	push	ecx
	lea	edx,[eax+20h]
	push	edx
	lea	eax,[eax+1Ch]
	push	eax
	mov	ecx,0A53F34h
	call	417BC0h
	ret
00417F36                   CC CC CC CC CC CC CC CC CC CC       ..........

;; fn00417F40: 00417F40
;;   Called from:
;;     00417FE4 (in fn00417FC0)
fn00417F40 proc
	push	esi
	mov	esi,[ecx+4h]
	test	esi,esi
	jnz	417F4Ch

l00417F48:
	xor	edx,edx
	jmp	417F54h

l00417F4C:
	mov	edx,[ecx+8h]
	sub	edx,esi
	sar	edx,2h

l00417F54:
	test	esi,esi
	jz	417F79h

l00417F58:
	mov	eax,[ecx+0Ch]
	sub	eax,esi
	sar	eax,2h
	cmp	edx,eax
	jnc	417F79h

l00417F64:
	mov	eax,[ecx+8h]
	mov	edx,[esp+8h]
	mov	edx,[edx]
	mov	[eax],edx
	add	eax,4h
	mov	[ecx+8h],eax
	pop	esi
	ret	4h

l00417F79:
	mov	edx,[esp+8h]
	mov	eax,[ecx+8h]
	push	edx
	push	1h
	push	eax
	call	417890h
	pop	esi
	ret	4h
00417F8D                                        CC CC CC              ...

;; fn00417F90: 00417F90
;;   Called from:
;;     00418361 (in fn00418150)
fn00417F90 proc
	push	ecx
	mov	edx,[esp+10h]
	mov	byte ptr [esp],0h
	mov	eax,[esp]
	push	eax
	mov	eax,[esp+14h]
	push	edx
	mov	edx,[esp+10h]
	push	ecx
	mov	ecx,[esp+18h]
	push	eax
	push	ecx
	push	edx
	call	417AF0h
	add	esp,1Ch
	ret	0Ch
00417FB9                            CC CC CC CC CC CC CC          .......

;; fn00417FC0: 00417FC0
;;   Called from:
;;     00419266 (in fn00418D40)
;;     0041931F (in fn00418D40)
fn00417FC0 proc
	push	esi
	mov	esi,ecx
	mov	ecx,[esi+4h]
	test	ecx,ecx
	jnz	417FCEh

l00417FCA:
	xor	eax,eax
	jmp	417FD6h

l00417FCE:
	mov	eax,[esi+8h]
	sub	eax,ecx
	sar	eax,2h

l00417FD6:
	mov	edx,[esi+10h]
	cmp	eax,edx
	mov	eax,[esp+8h]
	ja	418008h

l00417FE1:
	push	eax
	mov	ecx,esi
	call	417F40h
	mov	ecx,[esi+4h]
	test	ecx,ecx
	jnz	417FF9h

l00417FF0:
	xor	eax,eax
	mov	[esi+10h],eax
	pop	esi
	ret	4h

l00417FF9:
	mov	eax,[esi+8h]
	sub	eax,ecx
	sar	eax,2h
	mov	[esi+10h],eax
	pop	esi
	ret	4h

l00418008:
	mov	eax,[eax]
	mov	[ecx+edx*4],eax
	add	dword ptr [esi+10h],1h
	pop	esi
	ret	4h
00418015                CC CC CC CC CC CC CC CC CC CC CC      ...........
00418020 51 56 8B F1 8B 56 04 85 D2 75 04 33 C9 EB 08 8B QV...V...u.3....
00418030 4E 08 2B CA C1 F9 03 85 D2 74 3C 8B 46 0C 2B C2 N.+......t<.F.+.
00418040 C1 F8 03 3B C8 73 30 8B 4C 24 0C 8B 54 24 0C 57 ...;.s0.L$..T$.W
00418050 8B 7E 08 C6 44 24 08 00 8B 44 24 08 50 51 56 52 .~..D$...D$.PQVR
00418060 6A 01 57 E8 08 AD 3A 00 83 C4 18 83 C7 08 89 7E j.W...:........~
00418070 08 5F 5E 59 C2 04 00 8B 4C 24 0C 8B 46 08 51 6A ._^Y....L$..F.Qj
00418080 01 50 8B CE E8 17 FC FF FF 5E 59 C2 04 00 CC CC .P.......^Y.....
00418090 6A FF 68 08 E7 82 00 64 A1 00 00 00 00 50 83 EC j.h....d.....P..
004180A0 08 53 55 56 57 A1 88 41 A1 00 33 C4 50 8D 44 24 .SUVW..A..3.P.D$
004180B0 1C 64 A3 00 00 00 00 8B E9 8B 5C 24 2C 8B 33 85 .d........\$,.3.
004180C0 F6 8B 4D 18 8B C1 74 13 83 E8 01 85 C0 7E 08 8B ..M...t......~..
004180D0 36 85 F6 75 F3 EB 04 85 F6 75 13 50 51 68 68 7B 6..u.....u.PQhh{
004180E0 8A 00 E8 99 8B 10 00 83 C4 0C 33 C0 EB 4B 8B 45 ..........3..K.E
004180F0 10 8D 7D 10 6A FF 50 89 7C 24 34 FF 15 F4 40 8A ..}.j.P.|$4...@.
00418100 00 C6 47 04 01 8B 0B 8B 16 8D 44 24 14 89 4C 24 ..G.......D$..L$
00418110 14 50 8B CD C7 44 24 28 00 00 00 00 89 74 24 1C .P...D$(.....t$.
00418120 89 13 E8 F9 FE FF FF 8B 0F 8B 6D 18 51 C6 47 04 ..........m.Q.G.
00418130 00 FF 15 F0 40 8A 00 8B C5 8B 4C 24 1C 64 89 0D ....@.....L$.d..
00418140 00 00 00 00 59 5F 5E 5D 5B 83 C4 14 C2 04 00 CC ....Y_^][.......

;; fn00418150: 00418150
;;   Called from:
;;     00418B49 (in fn00418AF0)
fn00418150 proc
	push	ebp
	mov	ebp,esp
	push	0FFh
	push	82E730h
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,18h
	push	ebx
	push	esi
	push	edi
	mov	eax,[0A14188h]
	xor	eax,ebp
	push	eax
	lea	eax,[ebp-0Ch]
	mov	fs:[0000h],eax
	mov	[ebp-10h],esp
	mov	esi,ecx
	mov	[ebp-1Ch],esi
	mov	eax,[ebp+10h]
	sub	eax,[ebp+0Ch]
	mov	ecx,[esi+4h]
	sar	eax,2h
	test	ecx,ecx
	mov	[ebp-14h],eax
	jnz	418197h

l00418193:
	xor	ebx,ebx
	jmp	41819Fh

l00418197:
	mov	ebx,[esi+0Ch]
	sub	ebx,ecx
	sar	ebx,2h

l0041819F:
	test	eax,eax
	jz	4183F0h

l004181A7:
	test	ecx,ecx
	jnz	4181AFh

l004181AB:
	xor	edx,edx
	jmp	4181B7h

l004181AF:
	mov	edx,[esi+8h]
	sub	edx,ecx
	sar	edx,2h

l004181B7:
	mov	edi,3FFFFFFFh
	sub	edi,edx
	cmp	edi,eax
	jnc	4181C7h

l004181C2:
	call	415CC0h

l004181C7:
	test	ecx,ecx
	jnz	4181CFh

l004181CB:
	xor	edx,edx
	jmp	4181D7h

l004181CF:
	mov	edx,[esi+8h]
	sub	edx,ecx
	sar	edx,2h

l004181D7:
	add	edx,eax
	cmp	ebx,edx
	jnc	41831Ah

l004181E1:
	mov	edx,ebx
	shr	edx,1h
	mov	edi,3FFFFFFFh
	sub	edi,edx
	cmp	edi,ebx
	jnc	4181F4h

l004181F0:
	xor	ebx,ebx
	jmp	4181F6h

l004181F4:
	add	ebx,edx

l004181F6:
	test	ecx,ecx
	jnz	4181FEh

l004181FA:
	xor	edx,edx
	jmp	418206h

l004181FE:
	mov	edx,[esi+8h]
	sub	edx,ecx
	sar	edx,2h

l00418206:
	add	edx,eax
	cmp	ebx,edx
	jnc	41821Fh

l0041820C:
	test	ecx,ecx
	jnz	418214h

l00418210:
	xor	edx,edx
	jmp	41821Ch

l00418214:
	mov	edx,[esi+8h]
	sub	edx,ecx
	sar	edx,2h

l0041821C:
	lea	ebx,[edx+eax]

l0041821F:
	push	0h
	push	ebx
	call	7B2480h
	mov	edx,[ebp+0Ch]
	mov	byte ptr [ebp-20h],0h
	mov	ecx,[ebp-20h]
	push	ecx
	mov	ecx,[ebp+8h]
	push	edx
	mov	edi,eax
	mov	eax,[esi+4h]
	push	esi
	push	edi
	push	ecx
	push	eax
	mov	[ebp-24h],edi
	mov	[ebp-18h],edi
	mov	dword ptr [ebp-4h],0h
	call	412E10h
	mov	ecx,[ebp+0Ch]
	add	esp,20h
	mov	byte ptr [ebp-20h],0h
	mov	edx,[ebp-20h]
	push	edx
	mov	edx,[ebp+10h]
	push	ecx
	push	esi
	push	eax
	mov	[ebp-18h],eax
	mov	eax,[ebp+0Ch]
	push	edx
	push	eax
	call	417AF0h
	mov	ecx,[esi+8h]
	add	esp,18h
	mov	byte ptr [ebp+0Ch],0h
	mov	edx,[ebp+0Ch]
	push	edx
	mov	edx,[ebp+0Ch]
	push	edx
	push	esi
	push	eax
	mov	[ebp-18h],eax
	mov	eax,[ebp+8h]
	push	ecx
	push	eax
	call	412E10h
	mov	ecx,[esi+4h]
	add	esp,18h
	test	ecx,ecx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	jnz	4182A8h

l004182A4:
	xor	eax,eax
	jmp	4182B0h

l004182A8:
	mov	eax,[esi+8h]
	sub	eax,ecx
	sar	eax,2h

l004182B0:
	add	[ebp-14h],eax
	test	ecx,ecx
	jz	4182D2h

l004182B7:
	mov	edx,[ebp+0Ch]
	mov	eax,[esi+8h]
	push	edx
	push	esi
	push	eax
	push	ecx
	call	44F600h
	mov	ecx,[esi+4h]
	push	ecx
	call	694FC6h
	add	esp,14h

l004182D2:
	mov	eax,[ebp-14h]
	lea	edx,[edi+ebx*4]
	lea	ecx,[edi+eax*4]
	mov	[esi+0Ch],edx
	mov	[esi+8h],ecx
	mov	[esi+4h],edi
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret	10h
004182F8                         8B 55 E8 8B 75 DC 8B 4D         .U..u..M
00418300 E4 52 56 E8 F8 80 03 00 56 E8 B8 CC 27 00 83 C4 .RV.....V...'...
00418310 04 6A 00 6A 00 E8 B2 CC 27 00                   .j.j....'.     

l0041831A:
	mov	ebx,[esi+8h]
	mov	edi,[ebp+8h]
	mov	ecx,ebx
	sub	ecx,edi
	sar	ecx,2h
	cmp	ecx,eax
	jnc	4183B9h

l0041832F:
	add	eax,eax
	add	eax,eax
	mov	[ebp-24h],eax
	add	eax,edi
	push	eax
	push	ebx
	push	edi
	mov	ecx,esi
	call	414B50h
	mov	eax,[esi+8h]
	mov	ecx,[ebp+0Ch]
	mov	edx,eax
	sub	edx,edi
	sar	edx,2h
	lea	ebx,[ecx+edx*4]
	mov	edx,[ebp+10h]
	push	eax
	push	edx
	push	ebx
	mov	ecx,esi
	mov	dword ptr [ebp-4h],2h
	call	417F90h
	mov	ecx,[ebp+0Ch]
	mov	eax,[ebp-24h]
	add	[esi+8h],eax
	push	edi
	push	ebx
	push	ecx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	417860h
	add	esp,0Ch
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret	10h
00418395                8B 45 EC 8B 4D E4 8B 51 08 03 C0      .E..M..Q...
004183A0 03 C0 03 D0 52 8B 55 08 03 C2 50 E8 50 80 03 00 ....R.U...P.P...
004183B0 6A 00 6A 00 E8 13 CC 27 00                      j.j....'.      

l004183B9:
	lea	ecx,[0000h+eax*4]
	push	ebx
	mov	eax,ebx
	sub	eax,ecx
	push	ebx
	push	eax
	mov	ecx,esi
	mov	[ebp+8h],eax
	call	414B50h
	mov	edx,[ebp+8h]
	push	ebx
	push	edx
	push	edi
	mov	[esi+8h],eax
	call	417A50h
	mov	eax,[ebp+10h]
	mov	ecx,[ebp+0Ch]
	push	edi
	push	eax
	push	ecx
	call	417860h
	add	esp,18h

l004183F0:
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret	10h
00418404             CC CC CC CC CC CC CC CC CC CC CC CC     ............

;; fn00418410: 00418410
;;   Called from:
;;     004198EA (in fn00419800)
fn00418410 proc
	push	0FFh
	push	82E770h
	mov	eax,fs:[0000h]
	push	eax
	push	ecx
	push	esi
	push	edi
	mov	eax,[0A14188h]
	xor	eax,esp
	push	eax
	lea	eax,[esp+10h]
	mov	fs:[0000h],eax
	mov	esi,ecx
	mov	[esp+0Ch],esi
	xor	edi,edi
	mov	[esi+4h],edi
	mov	eax,[esp+20h]
	push	eax
	lea	ecx,[esi+10h]
	mov	[esp+1Ch],edi
	mov	dword ptr [esi],8A7B98h
	mov	[esi+8h],edi
	mov	[esi+0Ch],edi
	call	dword ptr [8A433Ch]
	lea	ecx,[esi+2Ch]
	mov	byte ptr [esp+18h],1h
	call	dword ptr [8A43B0h]
	mov	[esi+4Ch],edi
	mov	[esi+50h],edi
	mov	[esi+54h],edi
	mov	[esi+58h],edi
	mov	[esi+5Ch],edi
	mov	eax,esi
	mov	ecx,[esp+10h]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	add	esp,10h
	ret	4h
0041848F                                              CC                .
00418490 8B 01 D9 44 24 04 8B 50 54 83 EC 08 DD 1C 24 FF ...D$..PT.....$.
004184A0 D2 C2 04 00 CC CC CC CC CC CC CC CC CC CC CC CC ................

;; fn004184B0: 004184B0
;;   Called from:
;;     00419042 (in fn00418D40)
;;     00419234 (in fn00418D40)
fn004184B0 proc
	push	0FFh
	push	82E7B0h
	mov	eax,fs:[0000h]
	push	eax
	push	ecx
	push	esi
	push	edi
	mov	eax,[0A14188h]
	xor	eax,esp
	push	eax
	lea	eax,[esp+10h]
	mov	fs:[0000h],eax
	mov	esi,ecx
	mov	[esp+0Ch],esi
	xor	edi,edi
	mov	[esi+4h],edi
	mov	eax,[esp+20h]
	lea	ecx,[esi+10h]
	mov	[esp+18h],edi
	mov	dword ptr [esi],8A7B98h
	mov	[esi+8h],eax
	mov	[esi+0Ch],edi
	call	dword ptr [8A43B0h]
	lea	ecx,[esi+2Ch]
	mov	byte ptr [esp+18h],1h
	call	dword ptr [8A43B0h]
	mov	[esi+4Ch],edi
	mov	[esi+50h],edi
	mov	[esi+54h],edi
	mov	[esi+58h],edi
	mov	[esi+5Ch],edi
	mov	eax,esi
	mov	ecx,[esp+10h]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	add	esp,10h
	ret	8h
0041852E                                           CC CC               ..
00418530 6A FF 68 D9 E7 82 00 64 A1 00 00 00 00 50 83 EC j.h....d.....P..
00418540 20 53 55 56 57 A1 88 41 A1 00 33 C4 50 8D 44 24  SUVW..A..3.P.D$
00418550 34 64 A3 00 00 00 00 89 4C 24 14 8B 71 4C 3B 71 4d......L$..qL;q
00418560 50 74 5E 8B 7C 24 44 8B 2D 34 44 8A 00 8D 49 00 Pt^.|$D.-4D...I.
00418570 8B 0E 8B 01 8B 40 2C 8D 54 24 18 52 FF D0 57 50 .....@,.T$.R..WP
00418580 C7 44 24 44 00 00 00 00 FF D5 83 C4 08 8D 4C 24 .D$D..........L$
00418590 18 8A D8 C7 44 24 3C FF FF FF FF FF 15 38 43 8A ....D$<......8C.
004185A0 00 84 DB 8B 4C 24 14 75 0A 83 C6 04 3B 71 50 75 ....L$.u....;qPu
004185B0 BF EB 0E 56 8D 54 24 48 52 83 C1 48 E8 AF 82 03 ...V.T$HR..H....
004185C0 00 8B 4C 24 34 64 89 0D 00 00 00 00 59 5F 5E 5D ..L$4d......Y_^]
004185D0 5B 83 C4 2C C2 04 00 CC CC CC CC CC CC CC CC CC [..,............
004185E0 6A FF 68 08 E8 82 00 64 A1 00 00 00 00 50 51 56 j.h....d.....PQV
004185F0 A1 88 41 A1 00 33 C4 50 8D 44 24 0C 64 A3 00 00 ..A..3.P.D$.d...
00418600 00 00 8B 41 4C 8B 51 50 3B C2 8B 74 24 1C C7 44 ...AL.QP;..t$..D
00418610 24 14 00 00 00 00 74 1B 39 30 74 09 83 C0 04 3B $.....t.90t....;
00418620 C2 75 F5 EB 0E 50 8D 44 24 0C 50 83 C1 48 E8 3D .u...P.D$.P..H.=
00418630 82 03 00 85 F6 C7 44 24 14 FF FF FF FF 74 15 8B ......D$.....t..
00418640 CE E8 9A 94 FE FF 83 F8 01 75 09 8B 16 50 8B 02 .........u...P..
00418650 8B CE FF D0 8B 4C 24 0C 64 89 0D 00 00 00 00 59 .....L$.d......Y
00418660 5E 83 C4 10 C2 04 00 CC CC CC CC CC CC CC CC CC ^...............
00418670 6A FF 68 66 E8 82 00 64 A1 00 00 00 00 50 51 53 j.hf...d.....PQS
00418680 56 57 A1 88 41 A1 00 33 C4 50 8D 44 24 14 64 A3 VW..A..3.P.D$.d.
00418690 00 00 00 00 8B F1 89 74 24 10 C7 06 98 7B 8A 00 .......t$....{..
004186A0 8B 4E 5C 33 DB 3B CB C7 44 24 1C 04 00 00 00 74 .N\3.;..D$.....t
004186B0 0E 83 41 04 FF 75 08 8B 01 8B 10 6A 01 FF D2 89 ..A..u.....j....
004186C0 5E 5C 8B 7E 58 3B FB C6 44 24 1C 03 74 1A 8B CF ^\.~X;..D$..t...
004186D0 E8 0B 94 FE FF 83 F8 01 75 0E 3B FB 74 0A 8B 07 ........u.;.t...
004186E0 8B 10 6A 01 8B CF FF D2 8D 7E 48 89 5E 58 8B 47 ..j......~H.^X.G
004186F0 04 3B C3 C6 44 24 1C 02 74 1C 8B 54 24 10 8B 4F .;..D$..t..T$..O
00418700 08 52 57 51 50 E8 F6 6E 03 00 8B 47 04 50 E8 B3 .RWQP..n...G.P..
00418710 C8 27 00 83 C4 14 8D 4E 2C 89 5F 04 89 5F 08 89 .'.....N,._.._..
00418720 5F 0C C6 44 24 1C 01 FF 15 38 43 8A 00 8D 4E 10 _..D$....8C...N.
00418730 88 5C 24 1C FF 15 38 43 8A 00 8B CE C7 44 24 1C .\$...8C.....D$.
00418740 FF FF FF FF E8 97 57 FF FF 8B 4C 24 14 64 89 0D ......W...L$.d..
00418750 00 00 00 00 59 5F 5E 5B 83 C4 10 C3 CC CC CC CC ....Y_^[........
00418760 55 8B EC 6A FF 68 98 E8 82 00 64 A1 00 00 00 00 U..j.h....d.....
00418770 50 83 EC 18 53 56 57 A1 88 41 A1 00 33 C5 50 8D P...SVW..A..3.P.
00418780 45 F4 64 A3 00 00 00 00 89 65 F0 8B F1 89 75 E4 E.d......e....u.
00418790 8B 45 10 8B 18 33 FF 3B DF 89 5D EC 74 07 8B CB .E...3.;..].t...
004187A0 E8 2B 93 FE FF 8B 4E 04 3B CF 89 7D FC 74 08 8B .+....N.;..}.t..
004187B0 7E 0C 2B F9 C1 FF 02 8B 55 0C 85 D2 89 7D 10 0F ~.+.....U....}..
004187C0 84 2B 02 00 00 85 C9 75 04 33 C0 EB 08 8B 46 08 .+.....u.3....F.
004187D0 2B C1 C1 F8 02 BB FF FF FF 3F 2B D8 3B DA 73 05 +........?+.;.s.
004187E0 E8 DB D4 FF FF 85 C9 75 04 33 C0 EB 08 8B 46 08 .......u.3....F.
004187F0 2B C1 C1 F8 02 03 C2 3B F8 0F 83 25 01 00 00 8B +......;...%....
00418800 C7 D1 E8 BF FF FF FF 3F 2B F8 3B 7D 10 73 09 C7 .......?+.;}.s..
00418810 45 10 00 00 00 00 EB 03 01 45 10 85 C9 75 04 33 E........E...u.3
00418820 C0 EB 08 8B 46 08 2B C1 C1 F8 02 03 C2 39 45 10 ....F.+......9E.
00418830 73 15 85 C9 75 04 33 C0 EB 08 8B 46 08 2B C1 C1 s...u.3....F.+..
00418840 F8 02 03 C2 89 45 10 8B 4D 10 6A 00 51 E8 2E 9C .....E..M.j.Q...
00418850 39 00 8B 4D 0C 8B 5D 08 C6 45 E0 00 8B 55 E0 52 9..M..]..E...U.R
00418860 51 8B F8 8B 46 04 56 57 53 50 89 7D DC 89 7D E8 Q...F.VWSP.}..}.
00418870 C6 45 FC 01 E8 97 A5 FF FF 8B 4D 0C 83 C4 20 8D .E........M... .
00418880 55 EC 52 51 50 8B CE 89 45 E8 E8 11 55 0B 00 8B U.RQP...E...U...
00418890 4E 08 C6 45 08 00 8B 55 08 52 8B 55 0C 52 56 50 N..E...U.R.U.RVP
004188A0 51 53 89 45 E8 E8 66 A5 FF FF 8B 4E 04 83 C4 18 QS.E..f....N....
004188B0 85 C9 C7 45 FC 00 00 00 00 75 04 33 C0 EB 08 8B ...E.....u.3....
004188C0 46 08 2B C1 C1 F8 02 8B 5D 0C 03 D8 85 C9 74 1B F.+.....].....t.
004188D0 8B 55 0C 8B 46 08 52 56 50 51 E8 21 6D 03 00 8B .U..F.RVPQ.!m...
004188E0 46 04 50 E8 DE C6 27 00 83 C4 14 8B 45 10 8D 0C F.P...'.....E...
004188F0 87 8D 14 9F 89 4E 0C 89 56 08 89 7E 04 E9 EB 00 .....N..V..~....
00418900 00 00 8B 45 E8 8B 75 DC 8B 4D E4 50 56 E8 EE 7A ...E..u..M.PV..z
00418910 03 00 56 E8 AE C6 27 00 83 C4 04 6A 00 6A 00 E8 ..V...'....j.j..
00418920 A8 C6 27 00 8B 5E 08 8B 7D 08 8B CB 2B CF C1 F9 ..'..^..}...+...
00418930 02 3B CA 73 7C 8D 04 95 00 00 00 00 89 45 10 03 .;.s|........E..
00418940 C7 50 53 57 8B CE E8 05 C2 FF FF 8B 46 08 8B 4D .PSW........F..M
00418950 0C 8D 55 EC 52 8B D0 2B D7 C1 FA 02 2B CA 51 50 ..U.R..+....+.QP
00418960 8B CE C6 45 FC 03 E8 35 54 0B 00 8B 45 10 01 46 ...E...5T...E..F
00418970 08 8B 76 08 2B F0 8D 45 EC 50 56 57 C7 45 FC 00 ..v.+..E.PVW.E..
00418980 00 00 00 E8 18 12 1B 00 83 C4 0C EB 60 8B 45 0C ............`.E.
00418990 8B 4D E4 8B 51 08 03 C0 03 C0 03 D0 52 8B 55 08 .M..Q.......R.U.
004189A0 03 C2 50 E8 58 7A 03 00 6A 00 6A 00 E8 1B C6 27 ..P.Xz..j.j....'
004189B0 00 8D 0C 95 00 00 00 00 53 8B C3 2B C1 53 89 4D ........S..+.S.M
004189C0 10 50 8B CE 89 45 0C E8 84 C1 FF FF 89 46 08 8B .P...E.......F..
004189D0 45 0C 53 50 57 E8 76 F0 FF FF 8B 55 10 8D 4D EC E.SPW.v....U..M.
004189E0 51 03 D7 52 57 E8 B6 11 1B 00 83 C4 18 8B 5D EC Q..RW.........].
004189F0 85 DB C7 45 FC FF FF FF FF 74 16 8B CB E8 DE 90 ...E.....t......
00418A00 FE FF 83 F8 01 75 0A 8B 03 8B 10 6A 01 8B CB FF .....u.....j....
00418A10 D2 8B 4D F4 64 89 0D 00 00 00 00 59 5F 5E 5B 8B ..M.d......Y_^[.
00418A20 E5 5D C2 0C 00 CC CC CC CC CC CC CC CC CC CC CC .]..............
00418A30 A1 F4 B0 A6 00 64 8B 0D 2C 00 00 00 56 8B 34 81 .....d..,...V.4.
00418A40 8B 96 1C 00 00 00 8B 4C 24 08 8D 86 1C 00 00 00 .......L$.......
00418A50 89 11 83 86 20 00 00 00 01 8B 15 4C 3F A5 00 89 .... ......L?...
00418A60 08 8B 8E 20 00 00 00 03 D2 3B CA 7C 11 50 B9 34 ... .....;.|.P.4
00418A70 3F A5 00 E8 18 F6 FF FF 29 86 20 00 00 00 5E C3 ?.......). ...^.
00418A80 56 8B F1 E8 E8 FB FF FF F6 44 24 08 01 74 09 56 V........D$..t.V
00418A90 E8 9B FF FF FF 83 C4 04 8B C6 5E C2 04 00 CC CC ..........^.....
00418AA0 51 8B 41 50 56 8D 71 48 8B 4E 04 3B C8 74 36 57 Q.APV.qH.N.;.t6W
00418AB0 C6 44 24 08 00 8B 54 24 08 52 8B 54 24 0C 52 8B .D$...T$.R.T$.R.
00418AC0 54 24 10 52 51 50 50 E8 74 10 1B 00 8B 4E 08 8B T$.RQPP.t....N..
00418AD0 F8 8B 44 24 20 50 56 51 57 E8 22 6B 03 00 83 C4 ..D$ PVQW."k....
00418AE0 28 89 7E 08 5F 5E 59 C3 CC CC CC CC CC CC CC CC (.~._^Y.........

;; fn00418AF0: 00418AF0
;;   Called from:
;;     00419175 (in fn00418D40)
fn00418AF0 proc
	push	ecx
	push	esi
	mov	esi,ecx
	mov	eax,[esi+8h]
	mov	ecx,[esi+4h]
	cmp	ecx,eax
	jz	418B34h

l00418AFE:
	push	edi
	mov	byte ptr [esp+8h],0h
	mov	edx,[esp+8h]
	push	edx
	mov	edx,[esp+18h]
	push	edx
	mov	edx,[esp+1Ch]
	push	edx
	push	ecx
	push	eax
	push	eax
	call	5C9B40h
	mov	ecx,[esi+8h]
	mov	edi,eax
	mov	eax,[esp+2Ch]
	push	eax
	push	esi
	push	ecx
	push	edi
	call	44F600h
	add	esp,28h
	mov	[esi+8h],edi
	pop	edi

l00418B34:
	mov	edx,[esp+10h]
	mov	ecx,[esp+10h]
	mov	eax,[esi+4h]
	push	edx
	mov	edx,[esp+10h]
	push	ecx
	push	edx
	push	eax
	mov	ecx,esi
	call	418150h
	pop	esi
	pop	ecx
	ret	0Ch
00418B53          CC CC CC CC CC CC CC CC CC CC CC CC CC    .............
00418B60 51 56 8B F1 8B 56 04 85 D2 75 04 33 C9 EB 08 8B QV...V...u.3....
00418B70 4E 08 2B CA C1 F9 02 85 D2 74 3C 8B 46 0C 2B C2 N.+......t<.F.+.
00418B80 C1 F8 02 3B C8 73 30 8B 4C 24 0C 8B 54 24 0C 57 ...;.s0.L$..T$.W
00418B90 8B 7E 08 C6 44 24 08 00 8B 44 24 08 50 51 56 52 .~..D$...D$.PQVR
00418BA0 6A 01 57 E8 B8 F0 FF FF 83 C4 18 83 C7 04 89 7E j.W............~
00418BB0 08 5F 5E 59 C2 04 00 8B 4C 24 0C 8B 46 08 51 6A ._^Y....L$..F.Qj
00418BC0 01 50 8B CE E8 97 FB FF FF 5E 59 C2 04 00 CC CC .P.......^Y.....
00418BD0 6A FF 68 DB E8 82 00 64 A1 00 00 00 00 50 51 53 j.h....d.....PQS
00418BE0 55 56 57 A1 88 41 A1 00 33 C4 50 8D 44 24 18 64 UVW..A..3.P.D$.d
00418BF0 A3 00 00 00 00 8B E9 64 8B 0D 2C 00 00 00 A1 F4 .......d..,.....
00418C00 B0 A6 00 8B 04 81 8D 90 28 00 00 00 52 8D 88 24 ........(...R..$
00418C10 00 00 00 51 8D 90 20 00 00 00 52 8D 80 1C 00 00 ...Q.. ...R.....
00418C20 00 50 B9 34 3F A5 00 E8 94 EF FF FF 89 44 24 14 .P.4?........D$.
00418C30 85 C0 C7 44 24 20 00 00 00 00 74 12 8B 4C 24 28 ...D$ ....t..L$(
00418C40 6A 01 51 8B C8 E8 66 F8 FF FF 8B F0 EB 02 33 F6 j.Q...f.......3.
00418C50 8B 5C 24 2C 83 FB FF 75 50 85 F6 89 74 24 28 74 .\$,...uP...t$(t
00418C60 07 8B CE E8 68 8E FE FF 8D 54 24 28 52 8D 4D 48 ....h....T$(R.MH
00418C70 C7 44 24 24 01 00 00 00 E8 E3 FE FF FF 85 F6 C7 .D$$............
00418C80 44 24 20 FF FF FF FF 0F 84 95 00 00 00 8B CE E8 D$ .............
00418C90 4C 8E FE FF 83 F8 01 0F 85 85 00 00 00 8B 06 8B L...............
00418CA0 10 6A 01 8B CE FF D2 EB 79 8B 4D 4C 85 C9 8D 7D .j......y.ML...}
00418CB0 48 75 04 33 C0 EB 08 8B 47 08 2B C1 C1 F8 02 3B Hu.3....G.+....;
00418CC0 D8 7E 12 8B C1 85 C0 75 04 33 DB EB 08 8B 5F 08 .~.....u.3...._.
00418CD0 2B D8 C1 FB 02 85 F6 89 74 24 28 74 07 8B CE E8 +.......t$(t....
00418CE0 EC 8D FE FF 8B 45 4C 8D 4C 24 28 51 8D 04 98 6A .....EL.L$(Q...j
00418CF0 01 50 8B CF C7 44 24 2C 02 00 00 00 E8 5F FA FF .P...D$,....._..
00418D00 FF 85 F6 C7 44 24 20 FF FF FF FF 74 15 8B CE E8 ....D$ ....t....
00418D10 CC 8D FE FF 83 F8 01 75 09 8B 16 50 8B 02 8B CE .......u...P....
00418D20 FF D0 8B C6 8B 4C 24 18 64 89 0D 00 00 00 00 59 .....L$.d......Y
00418D30 5F 5E 5D 5B 83 C4 10 C2 08 00 CC CC CC CC CC CC _^][............

;; fn00418D40: 00418D40
;;   Called from:
;;     004043EF (in fn00404190)
;;     00410226 (in fn004100F0)
;;     004197BB (in fn004196F0)
fn00418D40 proc
	push	0FFh
	push	82E9E9h
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,88h
	push	ebx
	push	ebp
	push	esi
	push	edi
	mov	eax,[0A14188h]
	xor	eax,esp
	push	eax
	lea	eax,[esp+9Ch]
	mov	fs:[0000h],eax
	xor	edi,edi
	mov	[esp+24h],edi
	mov	eax,[0A6B0F4h]
	mov	ecx,fs:[002Ch]
	mov	esi,[ecx+eax*4]
	cmp	[esi+14h],edi
	mov	ebx,1h
	mov	[esp+0A4h],ebx
	mov	byte ptr [esp+22h],0h
	mov	[esp+34h],esi
	jnz	418DCBh

l00418D9F:
	push	14h
	call	694FD8h
	add	esp,4h
	cmp	eax,edi
	jz	418DBBh

l00418DAD:
	mov	[eax+4h],edi
	mov	[eax+8h],edi
	mov	[eax+0Ch],edi
	mov	[eax+10h],edi
	jmp	418DBDh

l00418DBB:
	xor	eax,eax

l00418DBD:
	mov	byte ptr [esp+0A4h],1h
	mov	[esi+14h],eax

l00418DCB:
	cmp	[esi+18h],edi
	mov	eax,[esi+14h]
	mov	[eax+10h],edi
	jnz	418E00h

l00418DDC:
	push	14h
	call	694FD8h
	add	esp,4h
	cmp	eax,edi
	jz	418DF8h

l00418DEA:
	mov	[eax+4h],edi
	mov	[eax+8h],edi
	mov	[eax+0Ch],edi
	mov	[eax+10h],edi
	jmp	418DFAh

l00418DF8:
	xor	eax,eax

l00418DFA:
	mov	[esi+18h],eax

l00418E00:
	mov	eax,[esi+18h]
	mov	edx,[esp+0ACh]
	mov	[eax+10h],edi
	mov	[esp+2Ch],edi
	mov	[edx],edi
	mov	[esp+24h],ebx
	mov	esi,[esp+0B4h]
	cmp	esi,edi
	mov	byte ptr [esp+0A4h],1h
	jz	418E30h

l00418E2D:
	add	[esi+4h],ebx

l00418E30:
	cmp	esi,edi
	mov	[esp+40h],esi
	jz	418E3Bh

l00418E38:
	add	[esi+4h],ebx

l00418E3B:
	xor	ebp,ebp
	cmp	esi,edi
	mov	[esp+44h],ebp
	jz	418E54h

l00418E45:
	add	dword ptr [esi+4h],0FFh
	jnz	418E54h

l00418E4B:
	mov	eax,[esi]
	mov	edx,[eax]
	push	ebx
	mov	ecx,esi
	call	edx

l00418E54:
	mov	eax,[esi+8h]
	add	esi,0Ch
	cmp	[esi],edi
	mov	byte ptr [esp+0A4h],5h
	mov	[esp+30h],eax
	mov	[esp+28h],esi
	ja	418E72h

l00418E6E:
	xor	bl,bl
	jmp	418E7Ah

l00418E72:
	mov	bl,[eax]
	jmp	418E7Ah

l00418E76:
	mov	esi,[esp+28h]

l00418E7A:
	cmp	bl,20h
	jz	418E8Eh

l00418E7F:
	cmp	bl,9h
	jz	418E8Eh

l00418E84:
	cmp	bl,0Dh
	jz	418E8Eh

l00418E89:
	cmp	bl,0Ah
	jnz	418F00h

l00418E8E:
	cmp	ebp,[esi]
	jnc	418E99h

l00418E92:
	add	ebp,1h
	mov	[esp+44h],ebp

l00418E99:
	lea	eax,[esp+40h]
	push	eax
	call	417030h
	mov	edx,[esp+44h]
	mov	eax,[edx+0Ch]
	mov	ebp,[esp+48h]
	lea	ecx,[edx+0Ch]
	add	esp,4h
	cmp	ebp,eax
	mov	[esp+28h],ecx
	jc	418EF8h

l00418EBC:
	xor	bl,bl

l00418EBE:
	mov	ecx,[ecx]
	cmp	ebp,ecx
	jc	419385h

l00418EC8:
	test	edi,edi
	jz	41934Eh

l00418ED0:
	mov	edx,[edi]
	mov	edx,[edx+2Ch]
	lea	eax,[esp+48h]
	push	eax
	mov	ecx,edi
	call	edx
	or	dword ptr [esp+24h],2h
	mov	ecx,eax
	mov	byte ptr [esp+0A4h],0Bh
	call	dword ptr [8A4354h]
	jmp	419353h

l00418EF8:
	mov	eax,[edx+8h]
	mov	bl,[eax+ebp]
	jmp	418F04h

l00418F00:
	mov	edx,[esp+40h]

l00418F04:
	cmp	bl,3Ch
	mov	ecx,[esp+28h]
	jnz	418EBEh

l00418F0D:
	mov	ecx,[ecx]
	cmp	ebp,ecx
	jnc	418F6Bh

l00418F13:
	add	ebp,1h
	cmp	ebp,ecx
	mov	[esp+44h],ebp
	jnc	418F6Bh

l00418F1E:
	mov	eax,[edx+8h]
	mov	al,[eax+ebp]
	cmp	al,21h
	jnz	418F46h

l00418F28:
	lea	edx,[esp+40h]
	push	edi
	push	edx
	call	416A10h
	mov	ebp,[esp+4Ch]
	add	esp,8h
	test	al,al
	setz	byte ptr [esp+22h]
	jmp	41932Ch

l00418F46:
	cmp	al,3Fh
	jnz	418F67h

l00418F4A:
	lea	eax,[esp+40h]
	push	eax
	call	416D90h
	mov	ebp,[esp+48h]
	add	esp,4h
	test	al,al
	setz	byte ptr [esp+22h]
	jmp	41932Ch

l00418F67:
	cmp	ebp,ecx
	jc	418F6Fh

l00418F6B:
	xor	al,al
	jmp	418F75h

l00418F6F:
	mov	eax,[edx+8h]
	mov	al,[eax+ebp]

l00418F75:
	cmp	al,2Fh
	setz	al
	test	al,al
	mov	[esp+23h],al
	jz	418F8Dh

l00418F82:
	cmp	ebp,ecx
	jnc	418F8Dh

l00418F86:
	add	ebp,1h
	mov	[esp+44h],ebp

l00418F8D:
	cmp	ebp,ecx
	mov	eax,[esp+30h]
	lea	ebx,[eax+ebp]
	mov	eax,[edx+8h]
	mov	[esp+28h],ebx
	jnc	418FB3h

l00418F9F:
	nop

l00418FA0:
	mov	dl,[eax+ebp]
	add	ebp,1h
	cmp	dl,3Eh
	jz	418FCAh

l00418FAB:
	cmp	ebp,ecx
	jc	418FA0h

l00418FAF:
	mov	[esp+44h],ebp

l00418FB3:
	push	8A7E10h
	call	520C80h
	add	esp,4h
	mov	byte ptr [esp+22h],1h
	jmp	41932Ch

l00418FCA:
	lea	esi,[eax+ebp-1h]
	test	esi,esi
	mov	[esp+44h],ebp
	jz	418FB3h

l00418FD6:
	cmp	esi,ebx
	mov	byte ptr [esi],0h
	jbe	418FFAh

l00418FDD:
	lea	ecx,[ecx+0h]

l00418FE0:
	mov	al,[esi-1h]
	cmp	al,20h
	jz	418FF3h

l00418FE7:
	cmp	al,9h
	jz	418FF3h

l00418FEB:
	cmp	al,0Dh
	jz	418FF3h

l00418FEF:
	cmp	al,0Ah
	jnz	418FFAh

l00418FF3:
	add	esi,0FFh
	cmp	esi,ebx
	ja	418FE0h

l00418FFA:
	test	edi,edi
	mov	byte ptr [esi],0h
	jnz	4190A7h

l00419005:
	cmp	byte ptr [esp+23h],0h
	jz	419023h

l0041900C:
	push	8A7DC8h
	call	520C80h
	add	esp,4h
	mov	byte ptr [esp+22h],1h
	jmp	41932Ch

l00419023:
	push	60h
	call	417F00h
	add	esp,4h
	mov	[esp+3Ch],eax
	test	eax,eax
	mov	byte ptr [esp+0A4h],6h
	jz	41904Bh

l0041903D:
	push	1h
	push	ebx
	mov	ecx,eax
	call	4184B0h
	mov	edi,eax
	jmp	41904Dh

l0041904B:
	xor	edi,edi

l0041904D:
	test	edi,edi
	mov	[esp+2Ch],edi
	mov	[esp+3Ch],edi
	jz	419060h

l00419059:
	mov	ecx,edi
	call	401AD0h

l00419060:
	mov	ecx,[esp+0ACh]
	lea	eax,[esp+3Ch]
	push	eax
	mov	byte ptr [esp+0A8h],7h
	call	5CF0C0h
	test	edi,edi
	mov	byte ptr [esp+0A4h],5h
	jz	41932Ch

l00419089:
	mov	ecx,edi
	call	401AE0h
	cmp	eax,1h
	jnz	41932Ch

l00419099:
	mov	edx,[edi]
	push	eax
	mov	eax,[edx]
	mov	ecx,edi
	call	eax
	jmp	41932Ch

l004190A7:
	cmp	byte ptr [esp+23h],0h
	jz	419215h

l004190B2:
	mov	edx,[edi]
	mov	edx,[edx+2Ch]
	lea	eax,[esp+48h]
	push	eax
	mov	ecx,edi
	call	edx
	mov	ecx,[esp+28h]
	push	ecx
	push	eax
	mov	byte ptr [esp+0ACh],8h
	call	dword ptr [8A43E4h]
	add	esp,8h
	lea	ecx,[esp+48h]
	mov	bl,al
	mov	byte ptr [esp+0A4h],5h
	call	dword ptr [8A4338h]
	test	bl,bl
	jz	419146h

l004190EF:
	mov	edx,[edi+8h]
	mov	eax,[esp+28h]
	mov	[esp+38h],edx
	lea	esi,[eax+1h]
	lea	ecx,[ecx+0h]

l00419100:
	mov	cl,[eax]
	add	eax,1h
	test	cl,cl
	jnz	419100h

l00419109:
	mov	ebx,[esp+28h]
	sub	eax,esi
	mov	esi,eax
	push	esi
	push	ebx
	push	edx
	call	dword ptr [8A4614h]
	add	esp,0Ch
	test	eax,eax
	jnz	4191C3h

l00419125:
	mov	edx,[esp+38h]
	movzx	eax,byte ptr [esi+edx]
	push	eax
	call	415CA0h
	add	esp,4h
	test	al,al
	jz	4191C3h

l0041913E:
	mov	ecx,[esp+38h]
	mov	byte ptr [esi+ecx],0h

l00419146:
	mov	ebx,[esp+34h]
	mov	eax,[ebx+18h]
	mov	ecx,[eax+4h]
	mov	edx,[eax+10h]
	mov	eax,[eax+10h]
	lea	edx,[ecx+edx*4]
	lea	eax,[ecx+eax*4]
	mov	ecx,[edi+5Ch]
	lea	esi,[edi+5Ch]
	add	ecx,ecx
	add	ecx,ecx
	sub	eax,ecx
	lea	ecx,[edi+48h]
	mov	edi,[esp+3Ch]
	push	edi
	push	edx
	push	eax
	call	418AF0h
	mov	ecx,[ebx+18h]
	mov	eax,[ecx+10h]
	sub	eax,[esi]
	lea	edx,[esp+0B4h]
	mov	[ecx+10h],eax
	push	edx
	mov	ecx,esi
	mov	dword ptr [esi],0h
	call	529B70h
	mov	eax,[ebx+14h]
	cmp	dword ptr [eax+10h],0h
	jz	4191BCh

l004191A9:
	mov	ecx,[eax+4h]
	mov	edx,[eax+10h]
	mov	edi,[ecx+edx*4-4h]
	add	dword ptr [eax+10h],0FFh
	jmp	419328h

l004191BC:
	xor	edi,edi
	jmp	419328h

l004191C3:
	mov	eax,[edi]
	mov	edx,[eax+2Ch]
	lea	ecx,[esp+48h]
	push	ecx
	mov	ecx,edi
	call	edx
	push	ebx
	mov	ecx,eax
	mov	byte ptr [esp+0A8h],9h
	call	dword ptr [8A4354h]
	push	eax
	push	8A7D70h
	call	520C80h
	add	esp,0Ch
	lea	ecx,[esp+48h]
	mov	byte ptr [esp+0A4h],5h
	call	dword ptr [8A4338h]
	mov	eax,[esp+0ACh]
	mov	ecx,[eax]
	call	401AD0h
	jmp	41932Ch

l00419215:
	push	60h
	call	417F00h
	add	esp,4h
	mov	[esp+3Ch],eax
	test	eax,eax
	mov	byte ptr [esp+0A4h],0Ah
	jz	41923Fh

l0041922F:
	push	1h
	push	ebx
	mov	ecx,eax
	call	4184B0h
	mov	[esp+28h],eax
	jmp	419247h

l0041923F:
	mov	dword ptr [esp+28h],0h

l00419247:
	mov	ecx,[esp+28h]
	mov	eax,[esp+34h]
	lea	edx,[esp+3Ch]
	mov	[esp+3Ch],ecx
	mov	ecx,[eax+18h]
	push	edx
	mov	byte ptr [esp+0A8h],5h
	call	417FC0h
	add	dword ptr [edi+5Ch],1h
	cmp	byte ptr [esi-1h],2Fh
	lea	ecx,[esi-1h]
	jnz	419310h

l0041927C:
	cmp	ecx,ebx
	jbe	41929Ah

l00419280:
	mov	al,[ecx-1h]
	cmp	al,20h
	jz	419293h

l00419287:
	cmp	al,9h
	jz	419293h

l0041928B:
	cmp	al,0Dh
	jz	419293h

l0041928F:
	cmp	al,0Ah
	jnz	41929Ah

l00419293:
	add	ecx,0FFh
	cmp	ecx,ebx
	ja	419280h

l0041929A:
	mov	byte ptr [ecx],0h
	cmp	byte ptr [ebx],0h
	mov	esi,ebx
	jz	4192BEh

l004192A4:
	mov	al,[esi]
	cmp	al,20h
	jz	4192BEh

l004192AA:
	cmp	al,9h
	jz	4192BEh

l004192AE:
	cmp	al,0Dh
	jz	4192BEh

l004192B2:
	cmp	al,0Ah
	jz	4192BEh

l004192B6:
	add	esi,1h
	cmp	byte ptr [esi],0h
	jnz	4192A4h

l004192BE:
	cmp	byte ptr [esi],0h
	jz	4192FAh

l004192C3:
	push	3Dh
	push	esi
	call	dword ptr [8A46B0h]
	add	esp,8h
	test	eax,eax
	jz	4192ECh

l004192D3:
	lea	ecx,[esp+0B4h]
	push	ecx
	mov	ecx,[esp+2Ch]
	add	ecx,5Ch
	mov	byte ptr [esi],0h
	call	529B70h
	jmp	41932Ch

l004192EC:
	push	ebx
	push	8A7D2Ch
	call	520C80h
	add	esp,8h

l004192FA:
	lea	ecx,[esp+0B4h]
	push	ecx
	mov	ecx,[esp+2Ch]
	add	ecx,5Ch
	call	529B70h
	jmp	41932Ch

l00419310:
	mov	eax,[esp+34h]
	mov	ecx,[eax+14h]
	lea	edx,[esp+2Ch]
	push	edx
	call	417FC0h
	mov	edi,[esp+28h]

l00419328:
	mov	[esp+2Ch],edi

l0041932C:
	mov	eax,[esp+40h]
	cmp	ebp,[eax+0Ch]
	lea	ecx,[eax+0Ch]
	mov	[esp+28h],ecx
	jc	419343h

l0041933C:
	xor	bl,bl
	jmp	419545h

l00419343:
	mov	eax,[eax+8h]
	mov	bl,[eax+ebp]
	jmp	419545h

l0041934E:
	mov	eax,8A7D24h

l00419353:
	push	eax
	push	8A7CF0h
	call	520C80h
	add	esp,8h
	test	byte ptr [esp+24h],2h
	mov	dword ptr [esp+0A4h],5h
	jz	419540h

l00419377:
	and	dword ptr [esp+24h],0FDh
	lea	ecx,[esp+48h]
	jmp	41953Ah

l00419385:
	test	edi,edi
	jnz	4193A0h

l00419389:
	push	8A7CB4h
	call	520C80h
	add	esp,4h
	mov	byte ptr [esp+22h],1h
	jmp	419549h

l004193A0:
	cmp	ebp,ecx
	mov	[esp+3Ch],ebp
	mov	[esp+38h],ebp
	jnc	4193EBh

l004193AC:
	mov	esi,ebp

l004193AE:
	mov	eax,[edx+8h]
	cmp	byte ptr [eax+ebp],3Ch
	jz	4193E3h

l004193B7:
	cmp	ebp,ecx
	jc	4193BFh

l004193BB:
	xor	al,al
	jmp	4193C8h

l004193BF:
	mov	eax,[edx+8h]
	mov	al,[eax+ebp]
	add	ebp,1h

l004193C8:
	add	esi,1h
	cmp	al,20h
	jz	4193DFh

l004193CF:
	cmp	al,9h
	jz	4193DFh

l004193D3:
	cmp	al,0Dh
	jz	4193DFh

l004193D7:
	cmp	al,0Ah
	jz	4193DFh

l004193DB:
	mov	[esp+38h],esi

l004193DF:
	cmp	ebp,ecx
	jc	4193AEh

l004193E3:
	cmp	ebp,ecx
	mov	[esp+44h],ebp
	jc	4193EFh

l004193EB:
	xor	bl,bl
	jmp	4193F5h

l004193EF:
	mov	eax,[edx+8h]
	mov	bl,[eax+ebp]

l004193F5:
	mov	eax,[esp+30h]
	mov	ecx,[esp+38h]
	mov	edx,[esp+28h]
	mov	byte ptr [ecx+eax],0h
	cmp	ebp,[edx]
	jnc	4194E8h

l0041940D:
	cmp	dword ptr [edi+0Ch],0h
	jz	4194D1h

l00419417:
	push	8A698Fh
	lea	ecx,[esp+4Ch]
	call	dword ptr [8A4334h]
	mov	eax,[edi]
	mov	eax,[eax+58h]
	push	0h
	lea	ecx,[esp+4Ch]
	push	ecx
	lea	edx,[esp+88h]
	push	edx
	mov	ecx,edi
	mov	byte ptr [esp+0B0h],0Ch
	call	eax
	mov	esi,eax
	mov	edx,[edi]
	mov	edx,[edx+2Ch]
	lea	eax,[esp+64h]
	push	eax
	mov	ecx,edi
	mov	byte ptr [esp+0A8h],0Dh
	call	edx
	mov	ebp,eax
	mov	eax,[esp+30h]
	mov	ecx,[esp+3Ch]
	add	ecx,eax
	push	ecx
	mov	ecx,esi
	mov	byte ptr [esp+0A8h],0Eh
	call	dword ptr [8A4354h]
	push	eax
	mov	ecx,ebp
	call	dword ptr [8A4354h]
	push	eax
	push	8A7C48h
	call	520C80h
	add	esp,10h
	lea	ecx,[esp+64h]
	mov	byte ptr [esp+0A4h],0Dh
	call	dword ptr [8A4338h]
	lea	ecx,[esp+80h]
	mov	byte ptr [esp+0A4h],0Ch
	call	dword ptr [8A4338h]
	lea	ecx,[esp+48h]
	mov	byte ptr [esp+0A4h],5h
	call	dword ptr [8A4338h]
	mov	ebp,[esp+44h]
	jmp	419540h

l004194D1:
	mov	edx,eax
	mov	eax,[esp+3Ch]
	lea	esi,[eax+edx]
	push	esi
	call	41EE00h
	add	esp,4h
	mov	[edi+0Ch],esi
	jmp	419545h

l004194E8:
	mov	edx,[edi]
	mov	edx,[edx+2Ch]
	lea	eax,[esp+80h]
	push	eax
	mov	ecx,edi
	call	edx
	or	dword ptr [esp+24h],4h
	mov	ecx,eax
	mov	byte ptr [esp+0A4h],0Fh
	call	dword ptr [8A4354h]
	push	eax
	push	8A7CF0h
	call	520C80h
	add	esp,8h
	test	byte ptr [esp+24h],4h
	mov	dword ptr [esp+0A4h],5h
	jz	419540h

l0041952E:
	and	dword ptr [esp+24h],0FBh
	lea	ecx,[esp+80h]

l0041953A:
	call	dword ptr [8A4338h]

l00419540:
	mov	byte ptr [esp+22h],1h

l00419545:
	test	edi,edi
	jnz	419559h

l00419549:
	mov	eax,[esp+0ACh]
	cmp	dword ptr [eax],0h
	jnz	41965Fh

l00419559:
	cmp	byte ptr [esp+22h],0h
	jz	418E76h

l00419564:
	test	edi,edi
	jz	41956Fh

l00419568:
	mov	dword ptr [edi+5Ch],0h

l0041956F:
	mov	ecx,[esp+34h]
	mov	eax,[ecx+14h]
	cmp	dword ptr [eax+10h],0h
	jz	41959Eh

l0041957F:
	or	esi,0FFh

l00419582:
	mov	ecx,[eax+4h]
	mov	edx,[eax+10h]
	mov	ecx,[ecx+edx*4-4h]
	add	ecx,5Ch
	mov	dword ptr [ecx],0h
	add	[eax+10h],esi
	cmp	dword ptr [eax+10h],0h
	jnz	419582h

l0041959E:
	mov	dword ptr [esp+3Ch],0h
	mov	eax,[esp+0ACh]
	mov	esi,[eax]
	test	esi,esi
	mov	byte ptr [esp+0A4h],10h
	jz	4195D6h

l004195BB:
	mov	ecx,esi
	mov	dword ptr [eax],0h
	call	401AE0h
	cmp	eax,1h
	jnz	4195D6h

l004195CD:
	mov	edx,[esi]
	push	eax
	mov	eax,[edx]
	mov	ecx,esi
	call	eax

l004195D6:
	mov	byte ptr [esp+0A4h],5h

l004195DE:
	mov	esi,[esp+0ACh]
	mov	eax,[esi]
	test	eax,eax
	jz	41960Bh

l004195EB:
	mov	ecx,[esp+0B0h]
	cmp	dword ptr [ecx+14h],0h
	jz	41960Bh

l004195F8:
	mov	dword ptr [eax+8h],0h
	mov	eax,[esi]
	push	ecx
	lea	ecx,[eax+10h]
	call	dword ptr [8A4358h]

l0041960B:
	mov	ecx,[esp+40h]
	or	edi,0FFh
	add	[ecx+4h],edi
	mov	byte ptr [esp+0A4h],1h
	jnz	419627h

l0041961F:
	mov	edx,[ecx]
	mov	eax,[edx]
	push	1h
	call	eax

l00419627:
	mov	ecx,[esp+0B4h]
	add	[ecx+4h],edi
	mov	byte ptr [esp+0A4h],0h
	jnz	419643h

l0041963B:
	mov	edx,[ecx]
	mov	eax,[edx]
	push	1h
	call	eax

l00419643:
	mov	eax,esi
	mov	ecx,[esp+9Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebp
	pop	ebx
	add	esp,94h
	ret

l0041965F:
	cmp	byte ptr [esp+22h],0h
	jz	4195DEh

l0041966A:
	jmp	41956Fh
0041966F                                              CC                .
00419670 51 56 57 6A FF 6A 00 C7 44 24 10 00 00 00 00 E8 QVWj.j..D$......
00419680 4C F5 FF FF 8B F0 8B 44 24 14 50 8D 4E 10 FF 15 L......D$.P.N...
00419690 58 43 8A 00 85 F6 8B 7C 24 10 89 37 74 07 8B CE XC.....|$..7t...
004196A0 E8 2B 84 FE FF 8B C7 5F 5E 59 C2 08 00 CC CC CC .+....._^Y......
004196B0 51 8B 44 24 10 56 57 50 6A 00 C7 44 24 10 00 00 Q.D$.VWPj..D$...
004196C0 00 00 E8 09 F5 FF FF 8B 4C 24 14 8B F0 51 8D 4E ........L$...Q.N
004196D0 10 FF 15 58 43 8A 00 85 F6 8B 7C 24 10 89 37 74 ...XC.....|$..7t
004196E0 07 8B CE E8 E8 83 FE FF 8B C7 5F 5E 59 C2 0C 00 .........._^Y...

;; fn004196F0: 004196F0
;;   Called from:
;;     00419993 (in fn00419800)
fn004196F0 proc
	push	0FFh
	push	82EA3Ch
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,24h
	push	ebp
	push	esi
	push	edi
	mov	eax,[0A14188h]
	xor	eax,esp
	push	eax
	lea	eax,[esp+34h]
	mov	fs:[0000h],eax
	mov	edi,[esp+4Ch]
	lea	eax,[esp+1Ch]
	push	eax
	mov	ecx,edi
	mov	dword ptr [esp+14h],0h
	call	dword ptr [8A4498h]
	mov	esi,[eax+8h]
	add	esi,[eax]
	push	2h
	push	0h
	mov	ecx,edi
	call	dword ptr [8A4494h]
	lea	ecx,[esp+1Ch]
	push	ecx
	mov	ecx,edi
	call	dword ptr [8A4498h]
	mov	ebp,[eax+8h]
	push	0h
	sub	ebp,esi
	add	ebp,[eax]
	push	esi
	mov	ecx,edi
	call	dword ptr [8A4494h]
	push	14h
	call	694FD8h
	add	esp,4h
	mov	[esp+14h],eax
	test	eax,eax
	mov	ecx,1h
	mov	[esp+3Ch],ecx
	jz	41978Ch

l0041977A:
	push	ebp
	push	edi
	mov	ecx,eax
	call	41A910h
	mov	esi,eax
	mov	ecx,1h
	jmp	41978Eh

l0041978C:
	xor	esi,esi

l0041978E:
	test	esi,esi
	mov	[esp+14h],esi
	jz	419799h

l00419796:
	add	[esi+4h],ecx

l00419799:
	test	esi,esi
	push	ecx
	mov	eax,esp
	mov	dword ptr [esp+40h],2h
	mov	[esp+1Ch],esp
	mov	[eax],esi
	jz	4197B1h

l004197AE:
	add	[esi+4h],ecx

l004197B1:
	mov	edx,[esp+4Ch]
	mov	edi,[esp+48h]
	push	edx
	push	edi
	call	418D40h
	add	esp,0Ch
	test	esi,esi
	mov	dword ptr [esp+10h],1h
	mov	byte ptr [esp+3Ch],0h
	jz	4197E4h

l004197D4:
	add	dword ptr [esi+4h],0FFh
	jnz	4197E4h

l004197DA:
	mov	eax,[esi]
	mov	edx,[eax]
	push	1h
	mov	ecx,esi
	call	edx

l004197E4:
	mov	eax,edi
	mov	ecx,[esp+34h]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebp
	add	esp,30h
	ret
004197F9                            CC CC CC CC CC CC CC          .......

;; fn00419800: 00419800
;;   Called from:
;;     007B20D6 (in fn007B20A0)
fn00419800 proc
	push	0FFh
	push	82EAD3h
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,0B4h
	push	ebx
	push	esi
	push	edi
	mov	eax,[0A14188h]
	xor	eax,esp
	push	eax
	lea	eax,[esp+0C4h]
	mov	fs:[0000h],eax
	mov	esi,[esp+0D8h]
	push	1h
	push	40h
	push	1h
	xor	ebx,ebx
	push	esi
	lea	ecx,[esp+48h]
	mov	[esp+20h],ebx
	call	dword ptr [8A44A0h]
	mov	eax,[esp+38h]
	mov	ecx,[eax+4h]
	lea	ecx,[esp+ecx+38h]
	mov	dword ptr [esp+0CCh],1h
	call	dword ptr [8A437Ch]
	test	al,al
	jnz	41996Dh

l0041986E:
	cmp	[esp+0DCh],al
	jz	419948h

l0041987B:
	mov	ecx,[0A6B0F4h]
	mov	edx,fs:[002Ch]
	mov	eax,[edx+ecx*4]
	lea	ecx,[eax+28h]
	push	ecx
	lea	edx,[eax+24h]
	push	edx
	lea	ecx,[eax+20h]
	push	ecx
	lea	edx,[eax+1Ch]
	push	edx
	mov	ecx,0A53F34h
	call	417BC0h
	mov	esi,eax
	mov	[esp+18h],esi
	test	esi,esi
	mov	byte ptr [esp+0CCh],2h
	jz	4198F1h

l004198C3:
	push	8A6C20h
	lea	ecx,[esp+20h]
	call	dword ptr [8A4334h]
	lea	eax,[esp+1Ch]
	mov	ebx,1h
	push	eax
	mov	ecx,esi
	mov	byte ptr [esp+0D0h],3h
	mov	[esp+14h],ebx
	call	418410h
	jmp	4198F3h

l004198F1:
	xor	eax,eax

l004198F3:
	test	eax,eax
	mov	esi,[esp+0D4h]
	mov	[esi],eax
	jz	419907h

l00419900:
	mov	ecx,eax
	call	401AD0h

l00419907:
	or	ebx,2h
	test	bl,1h
	mov	[esp+10h],ebx
	mov	dword ptr [esp+0CCh],1h
	jz	41992Fh

l0041991E:
	and	ebx,0FEh
	lea	ecx,[esp+1Ch]
	mov	[esp+10h],ebx
	call	dword ptr [8A4338h]

l0041992F:
	lea	ecx,[esp+38h]
	mov	byte ptr [esp+0CCh],0h
	call	dword ptr [8A449Ch]
	mov	eax,esi
	jmp	419A10h

l00419948:
	push	esi
	push	8A7E3Ch
	call	520C80h
	mov	esi,[esp+0DCh]
	add	esp,8h
	mov	dword ptr [esi],0h
	mov	dword ptr [esp+10h],2h
	jmp	41992Fh

l0041996D:
	push	8A6C20h
	lea	ecx,[esp+20h]
	call	dword ptr [8A4334h]
	lea	ecx,[esp+38h]
	push	ecx
	lea	edx,[esp+20h]
	push	edx
	lea	eax,[esp+1Ch]
	push	eax
	mov	byte ptr [esp+0D8h],5h
	call	4196F0h
	add	esp,0Ch
	lea	ecx,[esp+1Ch]
	mov	byte ptr [esp+0CCh],7h
	call	dword ptr [8A4338h]
	mov	ecx,[esp+14h]
	test	ecx,ecx
	mov	edi,[esp+0D4h]
	mov	[edi],ecx
	jz	4199C7h

l004199BE:
	call	401AD0h
	mov	ecx,[esp+14h]

l004199C7:
	test	ecx,ecx
	mov	dword ptr [esp+10h],2h
	mov	byte ptr [esp+0CCh],1h
	jz	4199F4h

l004199DB:
	mov	esi,ecx
	call	401AE0h
	cmp	eax,1h
	jnz	4199F4h

l004199E7:
	test	esi,esi
	jz	4199F4h

l004199EB:
	mov	edx,[esi]
	push	eax
	mov	eax,[edx]
	mov	ecx,esi
	call	eax

l004199F4:
	lea	ecx,[esp+38h]
	mov	dword ptr [esp+14h],0h
	mov	byte ptr [esp+0CCh],0h
	call	dword ptr [8A449Ch]
	mov	eax,edi

l00419A10:
	mov	ecx,[esp+0C4h]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebx
	add	esp,0C0h
	ret
00419A29                            CC CC CC CC CC CC CC          .......
00419A30 80 39 00 74 18 8B 4C 24 04 FF 15 54 43 8A 00 50 .9.t..L$...TC..P
00419A40 68 5C 7E 8A 00 E8 36 72 10 00 83 C4 08 C2 04 00 h\~...6r........

;; fn00419A50: 00419A50
;;   Called from:
;;     0042B634 (in fn0042B310)
fn00419A50 proc
	mov	eax,1h
	test	[0A53F58h],al
	jnz	419A6Ah

l00419A5D:
	or	[0A53F58h],eax
	mov	byte ptr [0A53F54h],0h

l00419A6A:
	mov	eax,0A53F54h
	ret
00419A70 83 EC 38 A1 88 41 A1 00 33 C4 89 44 24 34 33 C0 ..8..A..3..D$43.
00419A80 56 8B 74 24 40 89 44 24 14 89 44 24 04 89 44 24 V.t$@.D$..D$..D$
00419A90 08 89 44 24 0C 89 44 24 10 8D 44 24 04 50 8D 4C ..D$..D$..D$.P.L
00419AA0 24 48 51 FF 15 E4 40 8A 00 0F B7 54 24 04 0F B7 $HQ...@....T$...
00419AB0 44 24 10 0F B7 4C 24 0E 52 0F B7 54 24 10 50 0F D$...L$.R..T$.P.
00419AC0 B7 44 24 12 51 0F B7 4C 24 12 52 8B 14 8D E0 D0 .D$.Q..L$.R.....
00419AD0 A0 00 50 0F B7 44 24 1C 8B 0C 85 C4 D0 A0 00 52 ..P..D$........R
00419AE0 51 8D 54 24 34 68 B8 70 8A 00 52 FF 15 50 46 8A Q.T$4h.p..R..PF.
00419AF0 00 83 C4 24 8D 44 24 18 50 8B CE FF 15 34 43 8A ...$.D$.P....4C.
00419B00 00 8B 4C 24 38 8B C6 5E 33 CC E8 7F B0 27 00 83 ..L$8..^3....'..
00419B10 C4 38 C2 0C 00 CC CC CC CC CC CC CC CC CC CC CC .8..............
00419B20 6A FF 68 09 EB 82 00 64 A1 00 00 00 00 50 83 EC j.h....d.....P..
00419B30 1C 53 A1 88 41 A1 00 33 C4 50 8D 44 24 24 64 A3 .S..A..3.P.D$$d.
00419B40 00 00 00 00 8B 44 24 34 50 83 C1 04 51 8D 4C 24 .....D$4P...Q.L$
00419B50 10 51 FF 15 50 43 8A 00 83 C4 0C 6A 00 8B C8 C7 .Q..PC.....j....
00419B60 44 24 30 00 00 00 00 FF 15 54 43 8A 00 50 FF 15 D$0......TC..P..
00419B70 E0 40 8A 00 83 F8 01 8D 4C 24 08 0F 94 C3 C7 44 .@......L$.....D
00419B80 24 2C FF FF FF FF FF 15 38 43 8A 00 8A C3 8B 4C $,......8C.....L
00419B90 24 24 64 89 0D 00 00 00 00 59 5B 83 C4 28 C2 04 $$d......Y[..(..
00419BA0 00 CC CC CC CC CC CC CC CC CC CC CC CC CC CC CC ................
00419BB0 6A FF 68 39 EB 82 00 64 A1 00 00 00 00 50 83 EC j.h9...d.....P..
00419BC0 20 A1 88 41 A1 00 33 C4 89 44 24 1C 56 A1 88 41  ..A..3..D$.V..A
00419BD0 A1 00 33 C4 50 8D 44 24 28 64 A3 00 00 00 00 8B ..3.P.D$(d......
00419BE0 44 24 38 8B 74 24 3C 50 83 C1 04 51 8D 44 24 10 D$8.t$<P...Q.D$.
00419BF0 50 FF 15 50 43 8A 00 83 C4 0C 56 8D 4C 24 0C C7 P..PC.....V.L$..
00419C00 44 24 34 00 00 00 00 FF 15 54 43 8A 00 50 FF 15 D$4......TC..P..
00419C10 40 46 8A 00 83 C4 08 8D 4C 24 08 8B F0 C7 44 24 @F......L$....D$
00419C20 30 FF FF FF FF FF 15 38 43 8A 00 85 F6 75 04 33 0......8C....u.3
00419C30 C0 EB 02 8B C6 8B 4C 24 28 64 89 0D 00 00 00 00 ......L$(d......
00419C40 59 5E 8B 4C 24 1C 33 CC E8 41 AF 27 00 83 C4 2C Y^.L$.3..A.'...,
00419C50 C2 08 00 CC CC CC CC CC CC CC CC CC CC CC CC CC ................
00419C60 6A FF 68 82 EB 82 00 64 A1 00 00 00 00 50 83 EC j.h....d.....P..
00419C70 38 53 55 56 57 A1 88 41 A1 00 33 C4 50 8D 44 24 8SUVW..A..3.P.D$
00419C80 4C 64 A3 00 00 00 00 8B 44 24 60 8B 3D 50 43 8A Ld......D$`.=PC.
00419C90 00 8D 71 04 50 8D 4C 24 34 56 51 FF D7 8B E8 8B ..q.P.L$4VQ.....
00419CA0 54 24 68 52 8D 44 24 24 56 50 C7 44 24 6C 00 00 T$hR.D$$VP.D$l..
00419CB0 00 00 FF D7 83 C4 18 8B F0 6A 01 8B CD C6 44 24 .........j....D$
00419CC0 58 01 FF 15 54 43 8A 00 50 8B CE FF 15 54 43 8A X...TC..P....TC.
00419CD0 00 50 FF 15 DC 40 8A 00 85 C0 8D 4C 24 14 0F 95 .P...@.....L$...
00419CE0 C3 C6 44 24 54 00 FF 15 38 43 8A 00 8D 4C 24 30 ..D$T...8C...L$0
00419CF0 C7 44 24 54 FF FF FF FF FF 15 38 43 8A 00 8A C3 .D$T......8C....
00419D00 8B 4C 24 4C 64 89 0D 00 00 00 00 59 5F 5E 5D 5B .L$Ld......Y_^][
00419D10 83 C4 44 C2 08 00 CC CC CC CC CC CC CC CC CC CC ..D.............

;; fn00419D20: 00419D20
;;   Called from:
;;     0042AE57 (in fn0042ACF0)
;;     0042AEBA (in fn0042ACF0)
;;     0042AF91 (in fn0042ACF0)
fn00419D20 proc
	rdtsc
	mov	[ecx+8h],eax
	mov	[ecx+0Ch],edx
	ret
00419D29                            CC CC CC CC CC CC CC          .......

;; fn00419D30: 00419D30
;;   Called from:
;;     00408FF2 (in fn00408FB0)
fn00419D30 proc
	push	0FFh
	push	82EBA8h
	mov	eax,fs:[0000h]
	push	eax
	push	ecx
	push	esi
	mov	eax,[0A14188h]
	xor	eax,esp
	push	eax
	lea	eax,[esp+0Ch]
	mov	fs:[0000h],eax
	mov	esi,ecx
	mov	[esp+8h],esi
	mov	eax,[esp+1Ch]
	push	eax
	lea	ecx,[esi+4h]
	mov	dword ptr [esp+18h],0h
	mov	dword ptr [esi],8A7E74h
	call	dword ptr [8A433Ch]
	mov	eax,esi
	mov	ecx,[esp+0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	esi
	add	esp,10h
	ret	4h
00419D89                            CC CC CC CC CC CC CC          .......
00419D90 6A FF 68 D8 EB 82 00 64 A1 00 00 00 00 50 51 56 j.h....d.....PQV
00419DA0 A1 88 41 A1 00 33 C4 50 8D 44 24 0C 64 A3 00 00 ..A..3.P.D$.d...
00419DB0 00 00 8B F1 89 74 24 08 C7 06 74 7E 8A 00 8D 4E .....t$...t~...N
00419DC0 04 C7 44 24 14 00 00 00 00 FF 15 38 43 8A 00 C7 ..D$.......8C...
00419DD0 06 5C 70 8A 00 8B 4C 24 0C 64 89 0D 00 00 00 00 .\p...L$.d......
00419DE0 59 5E 83 C4 10 C3 CC CC CC CC CC CC CC CC CC CC Y^..............
00419DF0 6A FF 68 1B EC 82 00 64 A1 00 00 00 00 50 83 EC j.h....d.....P..
00419E00 5C 53 56 57 A1 88 41 A1 00 33 C4 50 8D 44 24 6C \SVW..A..3.P.D$l
00419E10 64 A3 00 00 00 00 8B D9 68 A4 7E 8A 00 8D 4C 24 d.......h.~...L$
00419E20 14 FF 15 34 43 8A 00 8B 7C 24 7C 8D 44 24 10 50 ...4C...|$|.D$.P
00419E30 57 C7 44 24 7C 00 00 00 00 E8 F2 7D FE FF 83 C4 W.D$|......}....
00419E40 08 8D 4C 24 10 C7 44 24 74 FF FF FF FF FF 15 38 ..L$..D$t......8
00419E50 43 8A 00 83 7F 14 00 0F 84 FD 00 00 00 68 A0 7E C............h.~
00419E60 8A 00 8D 4C 24 14 FF 15 34 43 8A 00 8D 4C 24 10 ...L$...4C...L$.
00419E70 51 C7 44 24 78 01 00 00 00 E8 E2 6F 20 00 8B C8 Q.D$x......o ...
00419E80 E8 5B 6D 20 00 8D 4C 24 10 8B F0 C7 44 24 74 FF .[m ..L$....D$t.
00419E90 FF FF FF FF 15 38 43 8A 00 57 83 C3 04 8D 54 24 .....8C..W....T$
00419EA0 30 53 52 FF 15 50 43 8A 00 83 C4 0C 8D 4C 24 48 0SR..PC......L$H
00419EB0 51 6A 00 8B C8 C7 44 24 7C 02 00 00 00 FF 15 54 Qj....D$|......T
00419EC0 43 8A 00 50 FF 15 D8 40 8A 00 8D 4C 24 2C 8B F8 C..P...@...L$,..
00419ED0 C7 44 24 74 FF FF FF FF FF 15 38 43 8A 00 8B CE .D$t......8C....
00419EE0 E8 3B FE FF FF 85 FF 74 71 8B 44 24 48 83 F8 FF .;.....tq.D$H...
00419EF0 74 68 8B 8C 24 80 00 00 00 85 C9 74 3F 8B 7C 24 th..$......t?.|$
00419F00 68 8B 74 24 64 33 D2 0B D7 89 11 8B 54 24 4C 89 h.t$d3......T$L.
00419F10 51 08 8B 54 24 50 89 51 0C 8B 54 24 5C 89 51 10 Q..T$P.Q..T$\.Q.
00419F20 8B 54 24 60 89 51 14 8B 54 24 54 33 DB 89 51 18 .T$`.Q..T$T3..Q.
00419F30 8B 54 24 58 0B F3 89 71 04 89 51 1C 24 10 F6 D8 .T$X...q..Q.$...
00419F40 1B C0 83 C0 02 8B 4C 24 6C 64 89 0D 00 00 00 00 ......L$ld......
00419F50 59 5F 5E 5B 83 C4 68 C2 08 00 33 C0 8B 4C 24 6C Y_^[..h...3..L$l
00419F60 64 89 0D 00 00 00 00 59 5F 5E 5B 83 C4 68 C2 08 d......Y_^[..h..
00419F70 00 CC CC CC CC CC CC CC CC CC CC CC CC CC CC CC ................
00419F80 6A FF 68 4B EC 82 00 64 A1 00 00 00 00 50 51 56 j.hK...d.....PQV
00419F90 A1 88 41 A1 00 33 C4 50 8D 44 24 0C 64 A3 00 00 ..A..3.P.D$.d...
00419FA0 00 00 8B F1 6A 20 E8 2D B0 27 00 83 C4 04 89 44 ....j .-.'.....D
00419FB0 24 08 85 C0 C7 44 24 14 00 00 00 00 74 1C 83 C6 $....D$.....t...
00419FC0 04 56 8B C8 E8 67 FD FF FF 8B 4C 24 0C 64 89 0D .V...g....L$.d..
00419FD0 00 00 00 00 59 5E 83 C4 10 C3 33 C0 8B 4C 24 0C ....Y^....3..L$.
00419FE0 64 89 0D 00 00 00 00 59 5E 83 C4 10 C3 CC CC CC d......Y^.......
00419FF0 56 8B F1 E8 98 FD FF FF F6 44 24 08 01 74 09 56 V........D$..t.V
0041A000 E8 C1 AF 27 00 83 C4 04 8B C6 5E C2 04 00 CC CC ...'......^.....
0041A010 6A FF 68 B7 EC 82 00 64 A1 00 00 00 00 50 83 EC j.h....d.....P..
0041A020 54 53 55 56 57 A1 88 41 A1 00 33 C4 50 8D 44 24 TSUVW..A..3.P.D$
0041A030 68 64 A3 00 00 00 00 8B F1 68 3C 7F 8A 00 8D 4C hd.......h<....L
0041A040 24 34 C7 44 24 1C 00 00 00 00 FF 15 34 43 8A 00 $4.D$.......4C..
0041A050 8B 5C 24 7C 8D 44 24 30 50 53 C7 44 24 78 01 00 .\$|.D$0PS.D$x..
0041A060 00 00 E8 C9 7B FE FF 83 C4 08 8D 4C 24 30 C6 44 ....{......L$0.D
0041A070 24 70 00 FF 15 38 43 8A 00 68 38 7F 8A 00 8D 4C $p...8C..h8....L
0041A080 24 50 FF 15 34 43 8A 00 8D 4C 24 4C 51 C7 44 24 $P..4C...L$LQ.D$
0041A090 74 02 00 00 00 E8 C6 6D 20 00 8B C8 E8 3F 6B 20 t......m ....?k 
0041A0A0 00 8D 4C 24 4C 8B E8 C6 44 24 70 00 FF 15 38 43 ..L$L...D$p...8C
0041A0B0 8A 00 8B 16 8B 42 24 68 44 77 8A 00 53 8B CE FF .....B$hDw..S...
0041A0C0 D0 8B CD 8B F8 E8 56 FC FF FF 85 FF 75 0B 8B 44 ......V.....u..D
0041A0D0 24 78 89 38 E9 D2 01 00 00 8B 35 4C 46 8A 00 6A $x.8......5LF..j
0041A0E0 02 6A 00 57 FF D6 57 FF 15 10 46 8A 00 6A 00 8B .j.W..W...F..j..
0041A0F0 E8 6A 00 57 89 6C 24 30 FF D6 83 C4 1C 85 ED 7F .j.W.l$0........
0041A100 2F 8B CB FF 15 54 43 8A 00 50 68 18 7F 8A 00 E8 /....TC..Ph.....
0041A110 6C 6B 10 00 57 FF 15 44 46 8A 00 8B 84 24 84 00 lk..W..DF....$..
0041A120 00 00 83 C4 0C C7 00 00 00 00 00 E9 7B 01 00 00 ............{...
0041A130 6A 14 E8 A1 AE 27 00 83 C4 04 89 44 24 28 85 C0 j....'.....D$(..
0041A140 C7 44 24 70 03 00 00 00 74 1B 51 8B D4 89 64 24 .D$p....t.Q...d$
0041A150 28 55 6A 00 8B C8 C7 02 00 00 00 00 E8 CF 06 00 (Uj.............
0041A160 00 8B F0 EB 02 33 F6 85 F6 89 74 24 2C 74 04 83 .....3....t$,t..
0041A170 46 04 01 8B 46 08 85 C0 BB 04 00 00 00 89 5C 24 F...F.........\$
0041A180 70 89 44 24 24 75 40 55 68 EC 7E 8A 00 E8 EE 6A p.D$$u@Uh.~....j
0041A190 10 00 57 FF 15 44 46 8A 00 8B BC 24 84 00 00 00 ..W..DF....$....
0041A1A0 83 C4 0C C7 07 00 00 00 00 83 46 04 FF C7 44 24 ..........F...D$
0041A1B0 18 01 00 00 00 C6 44 24 70 00 0F 85 E9 00 00 00 ......D$p.......
0041A1C0 6A 01 E9 DA 00 00 00 68 E8 7E 8A 00 8D 4C 24 50 j......h.~...L$P
0041A1D0 FF 15 34 43 8A 00 8D 4C 24 4C 51 C6 44 24 74 05 ..4C...L$LQ.D$t.
0041A1E0 E8 7B 6C 20 00 8B C8 E8 F4 69 20 00 8D 4C 24 4C .{l .....i ..L$L
0041A1F0 89 44 24 28 88 5C 24 70 FF 15 38 43 8A 00 33 DB .D$(.\$p..8C..3.
0041A200 39 5C 24 14 BD 01 00 00 00 7E 4C C7 44 24 1C 00 9\$......~L.D$..
0041A210 00 02 00 8B 44 24 14 2B C3 89 44 24 20 3D 00 00 ....D$.+..D$ =..
0041A220 02 00 8D 44 24 1C 7F 04 8D 44 24 20 8B 00 8B 54 ...D$....D$ ...T
0041A230 24 24 57 6A 01 50 89 44 24 2C 8D 04 13 50 FF 15 $$Wj.P.D$,...P..
0041A240 3C 46 8A 00 8B E8 83 C4 10 85 ED 74 0A 03 5C 24 <F.........t..\$
0041A250 20 3B 5C 24 14 7C BC 8B 4C 24 28 E8 C0 FA FF FF  ;\$.|..L$(.....
0041A260 85 ED 75 15 8B 4C 24 7C FF 15 54 43 8A 00 50 68 ..u..L$|..TC..Ph
0041A270 C0 7E 8A 00 E9 14 FF FF FF 57 FF 15 44 46 8A 00 .~.......W..DF..
0041A280 8B 7C 24 7C B8 01 00 00 00 89 37 01 46 04 83 C4 .|$|......7.F...
0041A290 04 83 46 04 FF 89 44 24 18 C6 44 24 70 00 75 09 ..F...D$..D$p.u.
0041A2A0 50 8B 16 8B 02 8B CE FF D0 8B C7 8B 4C 24 68 64 P...........L$hd
0041A2B0 89 0D 00 00 00 00 59 5F 5E 5D 5B 83 C4 60 C2 08 ......Y_^][..`..
0041A2C0 00 CC CC CC CC CC CC CC CC CC CC CC CC CC CC CC ................
0041A2D0 6A FF 68 E8 EC 82 00 64 A1 00 00 00 00 50 83 EC j.h....d.....P..
0041A2E0 08 55 56 57 A1 88 41 A1 00 33 C4 50 8D 44 24 18 .UVW..A..3.P.D$.
0041A2F0 64 A3 00 00 00 00 80 7C 24 30 00 C7 44 24 20 00 d......|$0..D$ .
0041A300 00 00 00 B8 88 7F 8A 00 75 05 B8 84 7F 8A 00 8B ........u.......
0041A310 11 8B 6C 24 28 50 8B 42 24 55 FF D0 8B F8 85 FF ..l$(P.B$U......
0041A320 75 33 8B 4C 24 2C 83 C8 FF 85 C9 89 44 24 20 74 u3.L$,......D$ t
0041A330 0D 01 41 04 75 08 8B 11 8B 02 6A 01 FF D0 32 C0 ..A.u.....j...2.
0041A340 8B 4C 24 18 64 89 0D 00 00 00 00 59 5F 5E 5D 83 .L$.d......Y_^].
0041A350 C4 14 C2 0C 00 8B 74 24 2C 8B 46 0C 85 C0 74 78 ......t$,.F...tx
0041A360 8B 4E 08 57 6A 01 50 51 FF 15 48 46 8A 00 83 C4 .N.Wj.PQ..HF....
0041A370 10 83 F8 01 74 62 57 FF 15 44 46 8A 00 83 C4 04 ....tbW..DF.....
0041A380 8B CD C7 44 24 10 00 00 00 00 C7 44 24 14 06 00 ...D$......D$...
0041A390 00 00 FF 15 54 43 8A 00 50 8D 4C 24 14 68 54 7F ....TC..P.L$.hT.
0041A3A0 8A 00 51 E8 A8 58 20 00 83 C8 FF 83 C4 0C 01 46 ..Q..X ........F
0041A3B0 04 89 44 24 20 75 0A 8B 16 8B 02 6A 01 8B CE FF ..D$ u.....j....
0041A3C0 D0 32 C0 8B 4C 24 18 64 89 0D 00 00 00 00 59 5F .2..L$.d......Y_
0041A3D0 5E 5D 83 C4 14 C2 0C 00 57 FF 15 44 46 8A 00 83 ^]......W..DF...
0041A3E0 C8 FF 83 C4 04 01 46 04 89 44 24 20 75 0A 8B 16 ......F..D$ u...
0041A3F0 8B 02 6A 01 8B CE FF D0 B0 01 8B 4C 24 18 64 89 ..j........L$.d.
0041A400 0D 00 00 00 00 59 5F 5E 5D 83 C4 14 C2 0C 00 CC .....Y_^].......
0041A410 6A FF 68 61 ED 82 00 64 A1 00 00 00 00 50 81 EC j.ha...d.....P..
0041A420 C8 01 00 00 A1 88 41 A1 00 33 C4 89 84 24 C4 01 ......A..3...$..
0041A430 00 00 53 55 56 57 A1 88 41 A1 00 33 C4 50 8D 84 ..SUVW..A..3.P..
0041A440 24 DC 01 00 00 64 A3 00 00 00 00 8B AC 24 EC 01 $....d.......$..
0041A450 00 00 8B B4 24 F0 01 00 00 8B F9 33 DB 68 98 7F ....$......3.h..
0041A460 8A 00 8D 4C 24 48 89 6C 24 30 89 5C 24 1C FF 15 ...L$H.l$0.\$...
0041A470 34 43 8A 00 8D 44 24 44 50 56 C7 84 24 EC 01 00 4C...D$DPV..$...
0041A480 00 01 00 00 00 E8 A6 77 FE FF 83 C4 08 8D 4C 24 .......w......L$
0041A490 44 88 9C 24 E4 01 00 00 FF 15 38 43 8A 00 89 5C D..$......8C...\
0041A4A0 24 20 89 5C 24 24 89 5C 24 28 56 83 C7 04 8D 4C $ .\$$.\$(V....L
0041A4B0 24 64 57 51 C7 84 24 F0 01 00 00 02 00 00 00 88 $dWQ..$.........
0041A4C0 5C 24 23 FF 15 50 43 8A 00 83 C4 0C 39 5C 24 74 \$#..PC.....9\$t
0041A4D0 C6 84 24 E4 01 00 00 03 74 45 8D 54 24 38 52 8D ..$.....tE.T$8R.
0041A4E0 4C 24 64 FF 15 C0 43 8A 00 8B 48 04 8B 40 08 80 L$d...C...H..@..
0041A4F0 78 FF 5C 89 4C 24 30 74 26 8D 54 24 38 52 8D 4C x.\.L$0t&.T$8R.L
0041A500 24 64 FF 15 C0 43 8A 00 8B 48 04 8B 40 08 80 78 $d...C...H..@..x
0041A510 FF 2F 89 4C 24 30 74 07 68 94 7F 8A 00 EB 05 68 ./.L$0t.h......h
0041A520 90 7F 8A 00 8D 4C 24 64 FF 15 B8 43 8A 00 8D 94 .....L$d...C....
0041A530 24 98 00 00 00 52 8D 4C 24 64 FF 15 54 43 8A 00 $....R.L$d..TC..
0041A540 50 FF 15 CC 40 8A 00 8B F8 83 FF FF 75 11 8D 44 P...@.......u..D
0041A550 24 1C 50 8B CD E8 86 F7 FE FF E9 A9 00 00 00 8B $.P.............
0041A560 35 E4 43 8A 00 EB 09 8D A4 24 00 00 00 00 8B FF 5.C......$......
0041A570 8D 8C 24 C4 00 00 00 51 8D 8C 24 80 00 00 00 FF ..$....Q..$.....
0041A580 15 34 43 8A 00 8D 54 24 7C 68 90 69 8A 00 52 C6 .4C...T$|h.i..R.
0041A590 84 24 EC 01 00 00 04 FF D6 83 C4 08 84 C0 74 21 .$............t!
0041A5A0 8D 44 24 7C 68 8C 7F 8A 00 50 FF D6 83 C4 08 84 .D$|h....P......
0041A5B0 C0 74 0E 8D 4C 24 7C 51 8D 4C 24 20 E8 0F 99 FE .t..L$|Q.L$ ....
0041A5C0 FF 8D 94 24 98 00 00 00 52 57 FF 15 D0 40 8A 00 ...$....RW...@..
0041A5D0 85 C0 75 05 C6 44 24 17 01 8D 4C 24 7C C6 84 24 ..u..D$...L$|..$
0041A5E0 E4 01 00 00 03 FF 15 38 43 8A 00 38 5C 24 17 0F .......8C..8\$..
0041A5F0 84 7B FF FF FF 57 FF 15 A0 41 8A 00 8D 44 24 1C .{...W...A...D$.
0041A600 50 8B CD E8 D8 F6 FE FF 8D 4C 24 60 C7 44 24 18 P........L$`.D$.
0041A610 01 00 00 00 C6 84 24 E4 01 00 00 02 FF 15 38 43 ......$.......8C
0041A620 8A 00 8D 4C 24 1C 88 9C 24 E4 01 00 00 E8 CE 92 ...L$...$.......
0041A630 FE FF 8B C5 8B 8C 24 DC 01 00 00 64 89 0D 00 00 ......$....d....
0041A640 00 00 59 5F 5E 5D 5B 8B 8C 24 C4 01 00 00 33 CC ..Y_^][..$....3.
0041A650 E8 39 A5 27 00 81 C4 D4 01 00 00 C2 08 00 CC CC .9.'............
0041A660 6A FF 68 BC ED 82 00 64 A1 00 00 00 00 50 83 EC j.h....d.....P..
0041A670 48 53 55 56 57 A1 88 41 A1 00 33 C4 50 8D 44 24 HSUVW..A..3.P.D$
0041A680 5C 64 A3 00 00 00 00 8B F1 8B 06 8B 7C 24 6C 8B \d..........|$l.
0041A690 50 04 33 ED 55 57 FF D2 83 F8 02 75 44 57 83 C6 P.3.UW.....uDW..
0041A6A0 04 8D 44 24 28 56 50 FF 15 50 43 8A 00 83 C4 0C ..D$(VP..PC.....
0041A6B0 8B C8 89 6C 24 64 FF 15 54 43 8A 00 50 FF 15 C4 ...l$d..TC..P...
0041A6C0 40 8A 00 85 C0 8D 4C 24 24 0F 95 C3 C7 44 24 64 @.....L$$....D$d
0041A6D0 FF FF FF FF FF 15 38 43 8A 00 8A C3 E9 E0 00 00 ......8C........
0041A6E0 00 83 F8 01 0F 85 D5 00 00 00 8B 16 8B 52 0C 57 .............R.W
0041A6F0 8D 44 24 18 50 8B CE FF D2 C7 44 24 64 01 00 00 .D$.P.....D$d...
0041A700 00 89 6C 24 6C EB 09 8D A4 24 00 00 00 00 8B FF ..l$l....$......
0041A710 8B 44 24 18 85 C0 0F 84 BB 00 00 00 8B 4C 24 1C .D$..........L$.
0041A720 2B C8 B8 93 24 49 92 F7 E9 03 D1 C1 FA 04 8B C2 +...$I..........
0041A730 C1 E8 1F 03 C2 39 44 24 6C 0F 83 98 00 00 00 68 .....9D$l......h
0041A740 50 6A 8A 00 8D 44 24 44 57 50 FF 15 D4 43 8A 00 Pj...D$DWP...C..
0041A750 8B 4C 24 24 03 CD 51 50 8D 54 24 38 52 C6 44 24 .L$$..QP.T$8R.D$
0041A760 7C 02 FF 15 50 43 8A 00 83 C4 18 8B 16 50 8B 42 |...PC.......P.B
0041A770 20 8B CE C6 44 24 68 03 FF D0 84 C0 8D 4C 24 24  ...D$h......L$$
0041A780 0F 94 C3 C6 44 24 64 02 FF 15 38 43 8A 00 8D 4C ....D$d...8C...L
0041A790 24 40 C6 44 24 64 01 FF 15 38 43 8A 00 84 DB 75 $@.D$d...8C....u
0041A7A0 0D 83 44 24 6C 01 83 C5 1C E9 62 FF FF FF 8D 4C ..D$l.....b....L
0041A7B0 24 14 C7 44 24 64 FF FF FF FF E8 41 91 FE FF 32 $..D$d.....A...2
0041A7C0 C0 8B 4C 24 5C 64 89 0D 00 00 00 00 59 5F 5E 5D ..L$\d......Y_^]
0041A7D0 5B 83 C4 54 C2 04 00 57 83 C6 04 8D 4C 24 44 56 [..T...W....L$DV
0041A7E0 51 FF 15 50 43 8A 00 83 C4 0C 8B C8 C6 44 24 64 Q..PC........D$d
0041A7F0 04 FF 15 54 43 8A 00 50 FF 15 C8 40 8A 00 85 C0 ...TC..P...@....
0041A800 8D 4C 24 40 0F 95 C3 C6 44 24 64 01 FF 15 38 43 .L$@....D$d...8C
0041A810 8A 00 8D 4C 24 14 C7 44 24 64 FF FF FF FF E8 DD ...L$..D$d......
0041A820 90 FE FF 8A C3 EB 9A CC CC CC CC CC CC CC CC CC ................

;; fn0041A830: 0041A830
;;   Called from:
;;     0040E406 (in fn0040E370)
;;     004101D4 (in fn004100F0)
fn0041A830 proc
	push	0FFh
	push	82EDFBh
	mov	eax,fs:[0000h]
	push	eax
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	eax,[0A14188h]
	xor	eax,esp
	push	eax
	lea	eax,[esp+14h]
	mov	fs:[0000h],eax
	mov	esi,ecx
	mov	[esp+10h],esi
	mov	dword ptr [esp+1Ch],0h
	mov	dword ptr [esi+4h],0h
	mov	edi,[esp+2Ch]
	test	edi,edi
	mov	ebx,[esp+28h]
	mov	dword ptr [esi],8A7FB8h
	mov	[esi+0Ch],ebx
	mov	[esi+10h],edi
	jz	41A885h

l0041A881:
	add	dword ptr [edi+4h],1h

l0041A885:
	test	edi,edi
	mov	byte ptr [esp+1Ch],2h
	jnz	41A8C9h

l0041A88E:
	push	ebx
	call	694B89h
	add	esp,4h
	test	eax,eax
	mov	[esi+8h],eax
	jz	41A8C0h

l0041A89E:
	mov	ecx,[esp+24h]
	test	ecx,ecx
	push	ebx
	jz	41A8B3h

l0041A8A7:
	push	ecx
	push	eax
	call	695030h
	add	esp,0Ch
	jmp	41A8D0h

l0041A8B3:
	push	0h
	push	eax
	call	695020h
	add	esp,0Ch
	jmp	41A8D0h

l0041A8C0:
	mov	dword ptr [esi+0Ch],0h
	jmp	41A8D0h

l0041A8C9:
	mov	eax,[esp+24h]
	mov	[esi+8h],eax

l0041A8D0:
	or	eax,0FFh
	test	edi,edi
	mov	[esp+1Ch],eax
	jz	41A8EAh

l0041A8DB:
	add	[edi+4h],eax
	jnz	41A8EAh

l0041A8E0:
	mov	edx,[edi]
	mov	eax,[edx]
	push	1h
	mov	ecx,edi
	call	eax

l0041A8EA:
	mov	eax,esi
	mov	ecx,[esp+14h]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebx
	add	esp,10h
	ret	0Ch
0041A901    CC CC CC CC CC CC CC CC CC CC CC CC CC CC CC  ...............

;; fn0041A910: 0041A910
;;   Called from:
;;     0041977E (in fn004196F0)
fn0041A910 proc
	push	0FFh
	push	82EE33h
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,38h
	push	ebx
	push	ebp
	push	esi
	push	edi
	mov	eax,[0A14188h]
	xor	eax,esp
	push	eax
	lea	eax,[esp+4Ch]
	mov	fs:[0000h],eax
	mov	esi,ecx
	mov	[esp+18h],esi
	xor	edi,edi
	mov	[esi+4h],edi
	mov	eax,[esp+60h]
	lea	ebx,[esi+0Ch]
	mov	dword ptr [esi],8A7FB8h
	mov	[ebx],eax
	mov	[esp+54h],edi
	mov	[esi+10h],edi
	mov	ecx,[ebx]
	push	ecx
	mov	byte ptr [esp+58h],1h
	call	694B89h
	mov	ebp,[esp+60h]
	add	esp,4h
	lea	edx,[esp+1Ch]
	push	edx
	mov	ecx,ebp
	mov	[esp+18h],eax
	mov	[esi+8h],eax
	call	dword ptr [8A4498h]
	lea	eax,[esp+34h]
	push	eax
	push	2h
	push	edi
	mov	ecx,ebp
	call	dword ptr [8A4494h]
	mov	ecx,eax
	call	dword ptr [8A4498h]
	mov	ecx,[esp+24h]
	mov	edi,[esp+3Ch]
	mov	edx,[esp+1Ch]
	sub	edi,ecx
	sub	esp,18h
	mov	eax,esp
	mov	[eax],edx
	sub	edi,edx
	mov	edx,[esp+38h]
	add	edi,[esp+4Ch]
	mov	[eax+4h],edx
	mov	edx,[esp+44h]
	mov	[eax+8h],ecx
	mov	ecx,[esp+40h]
	mov	[eax+0Ch],ecx
	mov	ecx,[esp+48h]
	mov	[eax+10h],edx
	mov	[eax+14h],ecx
	mov	ecx,ebp
	mov	[esp+78h],edi
	call	dword ptr [8A44A8h]
	cmp	[ebx],edi
	mov	eax,ebx
	jl	41A9E8h

l0041A9E4:
	lea	eax,[esp+60h]

l0041A9E8:
	mov	edx,[eax]
	mov	edi,[esp+14h]
	push	edx
	push	edi
	mov	ecx,ebp
	call	dword ptr [8A44A4h]
	mov	ebp,[ebp+4h]
	mov	eax,[ebx]
	cmp	ebp,eax
	jge	41AA12h

l0041AA01:
	sub	eax,ebp
	push	eax
	lea	eax,[edi+ebp]
	push	0h
	push	eax
	call	695020h
	add	esp,0Ch

l0041AA12:
	mov	eax,esi
	mov	[ebx],ebp
	mov	ecx,[esp+4Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebp
	pop	ebx
	add	esp,44h
	ret	8h
0041AA2C                                     CC CC CC CC             ....
0041AA30 6A FF 68 58 EE 82 00 64 A1 00 00 00 00 50 51 56 j.hX...d.....PQV
0041AA40 57 A1 88 41 A1 00 33 C4 50 8D 44 24 10 64 A3 00 W..A..3.P.D$.d..
0041AA50 00 00 00 8B F1 89 74 24 0C C7 06 B8 7F 8A 00 33 ......t$.......3
0041AA60 FF 39 7E 10 89 7C 24 18 75 0C 8B 46 08 50 E8 A7 .9~..|$.u..F.P..
0041AA70 A5 27 00 83 C4 04 8B 4E 10 3B CF 74 0E 83 41 04 .'.....N.;.t..A.
0041AA80 FF 75 08 8B 11 8B 02 6A 01 FF D0 89 7E 10 C7 06 .u.....j....~...
0041AA90 78 6D 8A 00 8B 4C 24 10 64 89 0D 00 00 00 00 59 xm...L$.d......Y
0041AAA0 5F 5E 83 C4 10 C3 CC CC CC CC CC CC CC CC CC CC _^..............
0041AAB0 56 8B F1 E8 78 FF FF FF F6 44 24 08 01 74 09 56 V...x....D$..t.V
0041AAC0 E8 01 A5 27 00 83 C4 04 8B C6 5E C2 04 00 CC CC ...'......^.....
0041AAD0 8B 41 24 85 C0 74 04 8B 40 0C C3 33 C0 C3 CC CC .A$..t..@..3....
0041AAE0 6A FF 68 88 EE 82 00 64 A1 00 00 00 00 50 56 57 j.h....d.....PVW
0041AAF0 A1 88 41 A1 00 33 C4 50 8D 44 24 0C 64 A3 00 00 ..A..3.P.D$.d...
0041AB00 00 00 8B 79 3C 8B 74 24 1C 3B FE C7 44 24 14 00 ...y<.t$.;..D$..
0041AB10 00 00 00 74 28 85 F6 89 71 3C 74 07 8B CE E8 AD ...t(...q<t.....
0041AB20 6F FE FF 85 FF 74 16 8B CF E8 B2 6F FE FF 83 F8 o....t.....o....
0041AB30 01 75 0A 8B 07 8B 10 6A 01 8B CF FF D2 85 F6 C7 .u.....j........
0041AB40 44 24 14 FF FF FF FF 74 16 8B CE E8 90 6F FE FF D$.....t.....o..
0041AB50 83 F8 01 75 0A 8B 06 8B 10 6A 01 8B CE FF D2 8B ...u.....j......
0041AB60 4C 24 0C 64 89 0D 00 00 00 00 59 5F 5E 83 C4 0C L$.d......Y_^...
0041AB70 C2 04 00 CC CC CC CC CC CC CC CC CC CC CC CC CC ................
0041AB80 8B 44 24 04 83 78 14 00 56 57 8B F1 74 1C 8D 4E .D$..x..VW..t..N
0041AB90 08 51 8D 56 3C 52 50 E8 84 57 FF FF 83 C4 0C 84 .Q.V<RP..W......
0041ABA0 C0 75 07 32 C0 5F 5E C2 04 00 8B 7E 3C 85 FF 74 .u.2._^....~<..t
0041ABB0 F2 6A 01 51 8B C4 8B CE 89 64 24 14 89 30 E8 0D .j.Q.....d$..0..
0041ABC0 6F FE FF 8B 07 8B 50 38 8B CF FF D2 5F 5E C2 04 o.....P8...._^..
0041ABD0 00 CC CC CC CC CC CC CC CC CC CC CC CC CC CC CC ................
0041ABE0 51 56 8B F1 8B 46 04 85 C0 74 1C 8B 4C 24 04 8B QV...F...t..L$..
0041ABF0 56 08 51 56 52 50 E8 05 4A 03 00 8B 46 04 50 E8 V.QVRP..J...F.P.
0041AC00 C2 A3 27 00 83 C4 14 C7 46 04 00 00 00 00 C7 46 ..'.....F......F
0041AC10 08 00 00 00 00 C7 46 0C 00 00 00 00 5E 59 C3 CC ......F.....^Y..

;; fn0041AC20: 0041AC20
;;   Called from:
;;     0040E44F (in fn0040E370)
;;     004102A2 (in fn004100F0)
fn0041AC20 proc
	push	0FFh
	push	82EED7h
	mov	eax,fs:[0000h]
	push	eax
	push	ecx
	push	ebx
	push	esi
	mov	eax,[0A14188h]
	xor	eax,esp
	push	eax
	lea	eax,[esp+10h]
	mov	fs:[0000h],eax
	mov	esi,ecx
	mov	[esp+0Ch],esi
	xor	ebx,ebx
	mov	[esp+18h],ebx
	mov	[esi+4h],ebx
	mov	eax,[esp+20h]
	push	eax
	lea	ecx,[esi+8h]
	mov	byte ptr [esp+1Ch],1h
	mov	dword ptr [esi],8A7FC0h
	call	dword ptr [8A433Ch]
	mov	ecx,[esp+24h]
	cmp	ecx,ebx
	mov	[esi+24h],ecx
	jz	41AC7Ah

l0041AC76:
	add	dword ptr [ecx+4h],1h

l0041AC7A:
	mov	[esi+28h],bl
	or	eax,0FFh
	cmp	ecx,ebx
	mov	[esi+30h],ebx
	mov	[esi+34h],ebx
	mov	[esi+38h],ebx
	mov	[esi+3Ch],ebx
	mov	[esp+18h],eax
	jz	41ACA1h

l0041AC94:
	add	[ecx+4h],eax
	jnz	41ACA1h

l0041AC99:
	mov	edx,[ecx]
	mov	eax,[edx]
	push	1h
	call	eax

l0041ACA1:
	mov	eax,esi
	mov	ecx,[esp+10h]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	esi
	pop	ebx
	add	esp,10h
	ret	8h
0041ACB7                      CC CC CC CC CC CC CC CC CC        .........
0041ACC0 32 C0 C3 CC CC CC CC CC CC CC CC CC CC CC CC CC 2...............
0041ACD0 6A FF 68 2A EF 82 00 64 A1 00 00 00 00 50 51 53 j.h*...d.....PQS
0041ACE0 56 57 A1 88 41 A1 00 33 C4 50 8D 44 24 14 64 A3 VW..A..3.P.D$.d.
0041ACF0 00 00 00 00 8B F9 89 7C 24 10 C7 07 C0 7F 8A 00 .......|$.......
0041AD00 8B 77 3C 33 DB 3B F3 C7 44 24 1C 03 00 00 00 74 .w<3.;..D$.....t
0041AD10 1A 8B CE E8 C8 6D FE FF 83 F8 01 75 0E 3B F3 74 .....m.....u.;.t
0041AD20 0A 8B 06 8B 10 6A 01 8B CE FF D2 8D 77 2C 89 5F .....j......w,._
0041AD30 3C 8B 46 04 3B C3 C6 44 24 1C 02 74 1C 8B 54 24 <.F.;..D$..t..T$
0041AD40 10 8B 4E 08 52 56 51 50 E8 B3 48 03 00 8B 46 04 ..N.RVQP..H...F.
0041AD50 50 E8 70 A2 27 00 83 C4 14 89 5E 04 89 5E 08 89 P.p.'.....^..^..
0041AD60 5E 0C 8B 4F 24 83 CE FF 3B CB C6 44 24 1C 01 74 ^..O$...;..D$..t
0041AD70 0D 01 71 04 75 08 8B 01 8B 10 6A 01 FF D2 8D 4F ..q.u.....j....O
0041AD80 08 89 5F 24 88 5C 24 1C FF 15 38 43 8A 00 8B CF .._$.\$...8C....
0041AD90 89 74 24 1C E8 47 31 FF FF 8B 4C 24 14 64 89 0D .t$..G1...L$.d..
0041ADA0 00 00 00 00 59 5F 5E 5B 83 C4 10 C3 CC CC CC CC ....Y_^[........
0041ADB0 56 8B F1 E8 18 FF FF FF F6 44 24 08 01 74 09 56 V........D$..t.V
0041ADC0 E8 01 A2 27 00 83 C4 04 8B C6 5E C2 04 00 CC CC ...'......^.....
0041ADD0 6A FF 68 63 EF 82 00 64 A1 00 00 00 00 50 83 EC j.hc...d.....P..
0041ADE0 08 55 56 57 A1 88 41 A1 00 33 C4 50 8D 44 24 18 .UVW..A..3.P.D$.
0041ADF0 64 A3 00 00 00 00 8B E9 8D 75 2C C6 45 28 01 8B d........u,.E(..
0041AE00 46 08 8B 4E 04 3B C8 74 34 C6 44 24 10 00 8B 54 F..N.;.t4.D$...T
0041AE10 24 10 52 8B 54 24 14 52 8B 54 24 18 52 51 50 50 $.R.T$.R.T$.RQPP
0041AE20 E8 1B ED 1A 00 8B 4C 24 28 51 8B F8 8B 46 08 56 ......L$(Q...F.V
0041AE30 50 57 E8 C9 47 03 00 83 C4 28 89 7E 08 6A 14 E8 PW..G....(.~.j..
0041AE40 94 A1 27 00 83 C4 04 89 44 24 10 85 C0 C7 44 24 ..'.....D$....D$
0041AE50 20 00 00 00 00 74 1C 51 8B D4 89 64 24 18 6A 00  ....t.Q...d$.j.
0041AE60 6A 00 8B C8 C7 02 00 00 00 00 E8 C1 F9 FF FF 8B j...............
0041AE70 F0 EB 02 33 F6 85 F6 89 74 24 14 74 04 83 46 04 ...3....t$.t..F.
0041AE80 01 8B 4D 24 B8 01 00 00 00 83 CF FF 3B CE 89 44 ..M$........;..D
0041AE90 24 20 74 1A 85 F6 89 75 24 74 03 01 46 04 85 C9 $ t....u$t..F...
0041AEA0 74 0C 01 79 04 75 07 8B 11 50 8B 02 FF D0 85 F6 t..y.u...P......
0041AEB0 89 7C 24 20 74 0F 01 7E 04 75 0A 8B 16 8B 02 6A .|$ t..~.u.....j
0041AEC0 01 8B CE FF D0 8B 4C 24 18 64 89 0D 00 00 00 00 ......L$.d......
0041AED0 59 5F 5E 5D 83 C4 14 C3 CC CC CC CC CC CC CC CC Y_^]............
0041AEE0 6A FF 68 88 EF 82 00 64 A1 00 00 00 00 50 51 55 j.h....d.....PQU
0041AEF0 56 57 A1 88 41 A1 00 33 C4 50 8D 44 24 14 64 A3 VW..A..3.P.D$.d.
0041AF00 00 00 00 00 8B F1 8B 4E 24 8B 7C 24 24 3B CF C7 .......N$.|$$;..
0041AF10 44 24 1C 00 00 00 00 74 1D 85 FF 89 7E 24 74 04 D$.....t....~$t.
0041AF20 83 47 04 01 85 C9 74 0E 83 41 04 FF 75 08 8B 01 .G....t..A..u...
0041AF30 8B 10 6A 01 FF D2 C6 46 28 00 8B 46 34 8B 4E 30 ..j....F(..F4.N0
0041AF40 83 C6 2C 3B C8 74 34 C6 44 24 10 00 8B 54 24 10 ..,;.t4.D$...T$.
0041AF50 52 8B 54 24 28 52 8B 54 24 2C 52 51 50 50 E8 DD R.T$(R.T$,RQPP..
0041AF60 EB 1A 00 8B 4C 24 3C 51 8B E8 8B 46 08 56 50 55 ....L$<Q...F.VPU
0041AF70 E8 8B 46 03 00 83 C4 28 89 6E 08 83 C8 FF 85 FF ..F....(.n......
0041AF80 89 44 24 1C 74 0F 01 47 04 75 0A 8B 17 8B 02 6A .D$.t..G.u.....j
0041AF90 01 8B CF FF D0 B0 01 8B 4C 24 14 64 89 0D 00 00 ........L$.d....
0041AFA0 00 00 59 5F 5E 5D 83 C4 10 C2 04 00 CC CC CC CC ..Y_^]..........
0041AFB0 6A FF 68 FC EF 82 00 64 A1 00 00 00 00 50 83 EC j.h....d.....P..
0041AFC0 78 A1 88 41 A1 00 33 C4 89 44 24 74 53 55 56 57 x..A..3..D$tSUVW
0041AFD0 A1 88 41 A1 00 33 C4 50 8D 84 24 8C 00 00 00 64 ..A..3.P..$....d
0041AFE0 A3 00 00 00 00 8B 84 24 9C 00 00 00 33 ED 89 6C .......$....3..l
0041AFF0 24 30 8B F9 89 44 24 18 BB 04 00 00 00 89 6C 24 $0...D$.......l$
0041B000 20 89 6C 24 24 89 6C 24 28 C7 84 24 94 00 00 00  .l$$.l$(..$....
0041B010 01 00 00 00 33 F6 8B 4F 30 3B CD 74 6D 8B 47 34 ....3..O0;.tm.G4
0041B020 2B C1 C1 F8 02 3B F0 73 61 8B 0C B1 8B 11 8B 52 +....;.sa......R
0041B030 70 8D 44 24 14 50 FF D2 50 8D 4C 24 20 C6 84 24 p.D$.P..P.L$ ..$
0041B040 98 00 00 00 02 E8 16 F3 FE FF 8B 44 24 14 3B C5 ...........D$.;.
0041B050 C6 84 24 94 00 00 00 01 74 15 83 40 04 FF 8B C8 ..$.....t..@....
0041B060 83 C0 04 39 28 75 08 8B 01 8B 10 6A 01 FF D2 8B ...9(u.....j....
0041B070 44 24 24 8B 48 FC 8B 51 0C 83 C2 03 83 E2 FC 03 D$$.H..Q........
0041B080 DA 89 6C 24 14 83 C6 01 EB 8C 8D 4C 24 50 FF 15 ..l$.......L$P..
0041B090 B0 43 8A 00 C6 84 24 94 00 00 00 03 33 F6 8B FF .C....$.....3...
0041B0A0 8B 4F 30 3B CD 0F 84 AF 00 00 00 8B 47 34 2B C1 .O0;........G4+.
0041B0B0 C1 F8 02 3B F0 0F 83 9F 00 00 00 8B C1 8B 0C B0 ...;............
0041B0C0 8B 11 8B 52 2C 8D 44 24 6C 50 FF D2 8B 44 24 20 ...R,.D$lP...D$ 
0041B0D0 8B 04 B0 8B 48 0C 89 4C 24 34 8D 4C 24 6C C6 84 ....H..L$4.L$l..
0041B0E0 24 94 00 00 00 04 89 6C 24 38 89 6C 24 3C 89 6C $......l$8.l$<.l
0041B0F0 24 40 89 6C 24 44 FF 15 44 43 8A 00 6A 18 8D 54 $@.l$D..DC..j..T
0041B100 24 38 52 8D 4C 24 58 89 44 24 50 FF 15 B0 44 8A $8R.L$X.D$P...D.
0041B110 00 8B 44 24 48 50 8D 4C 24 70 FF 15 44 44 8A 00 ..D$HP.L$p..DD..
0041B120 50 8D 4C 24 58 FF 15 B0 44 8A 00 8B 4C 24 48 F7 P.L$X...D...L$H.
0041B130 D9 83 E1 03 55 51 8D 4C 24 58 FF 15 AC 44 8A 00 ....UQ.L$X...D..
0041B140 8D 4C 24 6C C6 84 24 94 00 00 00 03 FF 15 38 43 .L$l..$.......8C
0041B150 8A 00 83 C6 01 E9 46 FF FF FF 8D 4C 24 50 FF 15 ......F....L$P..
0041B160 44 43 8A 00 6A 04 8D 54 24 30 52 8D 4C 24 58 89 DC..j..T$0R.L$X.
0041B170 44 24 34 FF 15 B0 44 8A 00 8D 4C 24 50 FF 15 44 D$4...D...L$P..D
0041B180 43 8A 00 6A 14 03 D8 E8 4C 9E 27 00 83 C4 04 89 C..j....L.'.....
0041B190 44 24 14 3B C5 C6 84 24 94 00 00 00 05 74 14 51 D$.;...$.....t.Q
0041B1A0 8B CC 89 64 24 50 53 89 29 55 8B C8 E8 7F F6 FF ...d$PS.)U......
0041B1B0 FF EB 02 33 C0 3B C5 8B 4C 24 18 C6 84 24 94 00 ...3.;..L$...$..
0041B1C0 00 00 03 89 01 74 04 83 40 04 01 8B 01 8B 70 08 .....t..@.....p.
0041B1D0 C7 06 65 4E A1 42 83 C6 04 C7 44 24 30 01 00 00 ..eN.B....D$0...
0041B1E0 00 33 DB 8B 4F 30 3B CD 74 33 8B 47 34 2B C1 C1 .3..O0;.t3.G4+..
0041B1F0 F8 02 3B D8 73 27 8B 44 24 20 8B 04 98 8B 68 0C ..;.s'.D$ ....h.
0041B200 8B 48 08 55 51 56 E8 25 9E 27 00 83 C5 03 83 E5 .H.UQV.%.'......
0041B210 FC 83 C4 0C 03 F5 83 C3 01 33 ED EB C6 8D 4C 24 .........3....L$
0041B220 50 FF 15 44 43 8A 00 50 8D 4C 24 54 FF 15 44 44 P..DC..P.L$T..DD
0041B230 8A 00 50 56 E8 F7 9D 27 00 83 C4 0C 8D 4C 24 50 ..PV...'.....L$P
0041B240 C6 84 24 94 00 00 00 01 FF 15 38 43 8A 00 8B 5C ..$.......8C...\
0041B250 24 20 3B DD C6 84 24 94 00 00 00 00 74 30 8B 7C $ ;...$.....t0.|
0041B260 24 24 3B DF 8B F3 74 1D 8B 0E 3B CD 74 0E 83 41 $$;...t...;.t..A
0041B270 04 FF 75 08 8B 11 8B 02 6A 01 FF D0 89 2E 83 C6 ..u.....j.......
0041B280 04 3B F7 75 E3 53 E8 3B 9D 27 00 83 C4 04 8B 44 .;.u.S.;.'.....D
0041B290 24 18 8B 8C 24 8C 00 00 00 64 89 0D 00 00 00 00 $...$....d......
0041B2A0 59 5F 5E 5D 5B 8B 4C 24 74 33 CC E8 DE 98 27 00 Y_^][.L$t3....'.
0041B2B0 81 C4 84 00 00 00 C2 04 00 CC CC CC CC CC CC CC ................
0041B2C0 6A FF 68 54 F0 82 00 64 A1 00 00 00 00 50 83 EC j.hT...d.....P..
0041B2D0 44 A1 88 41 A1 00 33 C4 89 44 24 40 53 55 56 57 D..A..3..D$@SUVW
0041B2E0 A1 88 41 A1 00 33 C4 50 8D 44 24 58 64 A3 00 00 ..A..3.P.D$Xd...
0041B2F0 00 00 A1 5C 3F A5 00 6A FF 8B F1 50 89 74 24 24 ...\?..j...P.t$$
0041B300 C7 44 24 38 5C 3F A5 00 FF 15 F4 40 8A 00 C6 05 .D$8\?.....@....
0041B310 60 3F A5 00 01 33 D2 38 56 28 89 54 24 60 74 12 `?...3.8V(.T$`t.
0041B320 8B 0D 5C 3F A5 00 88 15 60 3F A5 00 51 E9 33 02 ..\?....`?..Q.3.
0041B330 00 00 8B 46 24 3B C2 C6 46 28 01 75 12 88 15 60 ...F$;..F(.u...`
0041B340 3F A5 00 8B 15 5C 3F A5 00 52 E9 16 02 00 00 83 ?....\?..R......
0041B350 78 0C 0C 7D 0B 88 15 60 3F A5 00 E9 FF 01 00 00 x..}...`?.......
0041B360 8B 58 08 81 3B 65 4E A1 42 8B 48 0C 89 4C 24 20 .X..;eN.B.H..L$ 
0041B370 89 54 24 14 89 54 24 18 75 10 C7 44 24 14 04 00 .T$..T$.u..D$...
0041B380 00 00 C7 44 24 18 03 00 00 00 8B 44 19 FC 8B D1 ...D$......D....
0041B390 2B D0 8D 72 FC 3B 74 24 14 89 54 24 28 0F 8C B5 +..r.;t$..T$(...
0041B3A0 01 00 00 8D 41 FC 3B F0 0F 8D AA 01 00 00 8D 41 ....A.;........A
0041B3B0 F4 3B F0 7E 23 8B 15 5C 3F A5 00 C6 05 60 3F A5 .;.~#..\?....`?.
0041B3C0 00 00 52 E9 9D 01 00 00 EB 06 8D 9B 00 00 00 00 ..R.............
0041B3D0 8B 4C 24 20 8B 54 24 28 8B 2C 1E 83 C6 04 85 ED .L$ .T$(.,......
0041B3E0 78 07 83 7C 24 18 00 74 12 8D 46 10 8D 79 F8 3B x..|$..t..F..y.;
0041B3F0 C7 77 08 81 E5 FF FF FF 7F 8B F0 8B 3C 1E 83 C6 .w..........<...
0041B400 04 81 FD 00 00 10 10 0F 87 2F 01 00 00 8B 44 24 ........./....D$
0041B410 14 03 C5 83 C2 FC 3B C2 0F 87 1E 01 00 00 81 FF ......;.........
0041B420 00 10 00 00 0F 87 12 01 00 00 8D 14 37 83 C1 FC ............7...
0041B430 3B D1 0F 87 04 01 00 00 57 8D 04 1E 50 8D 4C 24 ;.......W...P.L$
0041B440 40 FF 15 40 44 8A 00 8B 44 24 18 03 F8 F7 D0 23 @..@D...D$.....#
0041B450 F8 6A 14 C6 44 24 64 01 03 F7 E8 79 9B 27 00 83 .j..D$d....y.'..
0041B460 C4 04 89 44 24 34 85 C0 C6 44 24 60 02 74 29 51 ...D$4...D$`.t)Q
0041B470 8B 4C 24 20 8B 49 24 85 C9 8B D4 89 64 24 30 89 .L$ .I$.....d$0.
0041B480 0A 74 04 83 41 04 01 8B 54 24 18 55 03 D3 52 8B .t..A...T$.U..R.
0041B490 C8 E8 9A F3 FF FF EB 02 33 C0 85 C0 6A 00 51 8B ........3...j.Q.
0041B4A0 CC C6 44 24 68 01 89 64 24 34 89 01 74 04 83 40 ..D$h..d$4..t..@
0041B4B0 04 01 8D 44 24 40 50 8D 4C 24 30 51 E8 2F 4C FF ...D$@P.L$0Q./L.
0041B4C0 FF 83 C4 10 8B 4C 24 1C 50 83 C1 2C C6 44 24 64 .....L$.P..,.D$d
0041B4D0 03 E8 7A 99 FF FF 8B 4C 24 24 85 C9 C6 44 24 60 ..z....L$$...D$`
0041B4E0 01 74 19 8B F9 E8 F6 65 FE FF 83 F8 01 75 0D 85 .t.....e.....u..
0041B4F0 FF 74 09 8B 17 50 8B 02 8B CF FF D0 83 C5 03 83 .t...P..........
0041B500 E5 FC 01 6C 24 14 8D 4C 24 38 C7 44 24 24 00 00 ...l$..L$8.D$$..
0041B510 00 00 C6 44 24 60 00 FF 15 38 43 8A 00 8B 44 24 ...D$`...8C...D$
0041B520 20 83 C0 F4 3B F0 0F 8E A4 FE FF FF 8B 15 5C 3F  ...;.........\?
0041B530 A5 00 C6 05 60 3F A5 00 00 52 EB 29 8B 4C 24 1C ....`?...R.).L$.
0041B540 83 C1 2C E8 B8 30 0B 00 8B 0D 5C 3F A5 00 C6 05 ..,..0....\?....
0041B550 60 3F A5 00 00 51 EB 0D C6 05 60 3F A5 00 00 A1 `?...Q....`?....
0041B560 5C 3F A5 00 50 FF 15 F0 40 8A 00 8B 4C 24 58 64 \?..P...@...L$Xd
0041B570 89 0D 00 00 00 00 59 5F 5E 5D 5B 8B 4C 24 40 33 ......Y_^][.L$@3
0041B580 CC E8 08 96 27 00 83 C4 50 C3 CC CC CC CC CC CC ....'...P.......
0041B590 56 8B F1 80 7E 28 00 75 05 E8 22 FD FF FF 8B 4E V...~(.u.."....N
0041B5A0 30 85 C9 75 04 33 C0 5E C3 8B 46 34 2B C1 C1 F8 0..u.3.^..F4+...
0041B5B0 02 5E C3 CC CC CC CC CC CC CC CC CC CC CC CC CC .^..............
0041B5C0 51 56 8B F1 80 7E 28 00 C7 44 24 04 00 00 00 00 QV...~(..D$.....
0041B5D0 75 05 E8 E9 FC FF FF 8B 4E 30 85 C9 74 2C 8B 46 u.......N0..t,.F
0041B5E0 34 2B C1 8B 4C 24 10 C1 F8 02 3B C8 73 1C 8B 46 4+..L$....;.s..F
0041B5F0 30 8B 0C 88 85 C9 8B 74 24 0C 89 0E 74 05 E8 CD 0......t$...t...
0041B600 64 FE FF 8B C6 5E 59 C2 08 00 8B 44 24 0C C7 00 d....^Y....D$...
0041B610 00 00 00 00 5E 59 C2 08 00 CC CC CC CC CC CC CC ....^Y..........
0041B620 6A FF 68 AF F0 82 00 64 A1 00 00 00 00 50 83 EC j.h....d.....P..
0041B630 10 56 57 A1 88 41 A1 00 33 C4 50 8D 44 24 1C 64 .VW..A..3.P.D$.d
0041B640 A3 00 00 00 00 8B F9 C7 44 24 0C 00 00 00 00 80 ........D$......
0041B650 7F 28 00 C7 44 24 24 00 00 00 00 75 05 E8 5E FC .(..D$$....u..^.
0041B660 FF FF 6A 40 E8 6F 99 27 00 8B F0 83 C4 04 89 74 ..j@.o.'.......t
0041B670 24 10 85 F6 C7 44 24 24 01 00 00 00 74 57 6A 14 $....D$$....tWj.
0041B680 E8 53 99 27 00 83 C4 04 89 44 24 14 85 C0 C6 44 .S.'.....D$....D
0041B690 24 24 02 74 1A 51 8B D4 89 64 24 1C 6A 00 6A 00 $$.t.Q...d$.j.j.
0041B6A0 8B C8 C7 02 00 00 00 00 E8 83 F1 FF FF EB 02 33 ...............3
0041B6B0 C0 85 C0 51 8B CC C6 44 24 28 01 89 64 24 1C 89 ...Q...D$(..d$..
0041B6C0 01 74 04 83 40 04 01 8B 44 24 34 50 8B CE E8 4D .t..@...D$4P...M
0041B6D0 F5 FF FF EB 02 33 C0 85 C0 8B 74 24 2C 89 06 74 .....3....t$,..t
0041B6E0 07 8B C8 E8 E8 63 FE FF 56 8D 4F 2C C7 44 24 28 .....c..V.O,.D$(
0041B6F0 00 00 00 00 C7 44 24 10 01 00 00 00 E8 4F 97 FF .....D$......O..
0041B700 FF 8B C6 8B 4C 24 1C 64 89 0D 00 00 00 00 59 5F ....L$.d......Y_
0041B710 5E 83 C4 1C C2 08 00 CC CC CC CC CC CC CC CC CC ^...............
0041B720 6A FF 68 D9 F0 82 00 64 A1 00 00 00 00 50 83 EC j.h....d.....P..
0041B730 20 53 55 56 57 A1 88 41 A1 00 33 C4 50 8D 44 24  SUVW..A..3.P.D$
0041B740 34 64 A3 00 00 00 00 8B F1 33 FF 80 7E 28 00 89 4d.......3..~(..
0041B750 7C 24 14 75 05 E8 66 FB FF FF 8B 6C 24 48 8B FF |$.u..f....l$H..
0041B760 8B 4E 30 85 C9 74 66 8B 46 34 2B C1 C1 F8 02 3B .N0..tf.F4+....;
0041B770 F8 73 5A 8B C1 8B 0C B8 8B 11 8B 52 2C 8D 44 24 .sZ........R,.D$
0041B780 18 50 FF D2 55 50 C7 44 24 44 00 00 00 00 FF 15 .P..UP.D$D......
0041B790 34 44 8A 00 83 C4 08 8D 4C 24 18 8A D8 C7 44 24 4D......L$....D$
0041B7A0 3C FF FF FF FF FF 15 38 43 8A 00 84 DB 75 05 83 <......8C....u..
0041B7B0 C7 01 EB AC 8B 46 30 8B 0C B8 85 C9 8B 74 24 44 .....F0......t$D
0041B7C0 89 0E 74 05 E8 07 63 FE FF 8B C6 EB 0A 8B 44 24 ..t...c.......D$
0041B7D0 44 C7 00 00 00 00 00 8B 4C 24 34 64 89 0D 00 00 D.......L$4d....
0041B7E0 00 00 59 5F 5E 5D 5B 83 C4 2C C2 08 00 CC CC CC ..Y_^][..,......
0041B7F0 6A FF 68 09 F1 82 00 64 A1 00 00 00 00 50 83 EC j.h....d.....P..
0041B800 1C 53 55 56 57 A1 88 41 A1 00 33 C4 50 8D 44 24 .SUVW..A..3.P.D$
0041B810 30 64 A3 00 00 00 00 8B E9 80 7D 28 00 75 05 E8 0d........}(.u..
0041B820 9C FA FF FF 33 F6 8D 7D 2C 8D A4 24 00 00 00 00 ....3..},..$....
0041B830 8B 4F 04 85 C9 0F 84 98 00 00 00 8B 47 08 2B C1 .O..........G.+.
0041B840 C1 F8 02 3B F0 0F 83 88 00 00 00 8B 45 30 8B 0C ...;........E0..
0041B850 B0 8B 11 8B 52 2C 8D 44 24 14 50 FF D2 8B 4C 24 ....R,.D$.P...L$
0041B860 40 51 50 C7 44 24 40 00 00 00 00 FF 15 34 44 8A @QP.D$@......4D.
0041B870 00 83 C4 08 8D 4C 24 14 8A D8 C7 44 24 38 FF FF .....L$....D$8..
0041B880 FF FF FF 15 38 43 8A 00 84 DB 75 05 83 C6 01 EB ....8C....u.....
0041B890 9F 8B 55 30 8D 04 B2 C6 44 24 40 00 8B 4C 24 40 ..U0....D$@..L$@
0041B8A0 8B 54 24 40 51 8B 4C 24 44 52 8B 57 08 51 50 52 .T$@Q.L$DR.W.QPR
0041B8B0 83 C0 04 50 E8 87 E2 1A 00 8B 4C 24 58 8B 47 08 ...P......L$X.G.
0041B8C0 51 57 50 83 C0 FC 50 E8 34 3D 03 00 83 C4 28 83 QWP...P.4=....(.
0041B8D0 47 08 FC 8B 4C 24 30 64 89 0D 00 00 00 00 59 5F G...L$0d......Y_
0041B8E0 5E 5D 5B 83 C4 28 C2 04 00 CC CC CC CC CC CC CC ^][..(..........
0041B8F0 6A FF 68 38 F1 82 00 64 A1 00 00 00 00 50 51 56 j.h8...d.....PQV
0041B900 57 A1 88 41 A1 00 33 C4 50 8D 44 24 10 64 A3 00 W..A..3.P.D$.d..
0041B910 00 00 00 8B F1 80 7E 28 00 C7 44 24 18 00 00 00 ......~(..D$....
0041B920 00 75 05 E8 98 F9 FF FF 8B 4E 34 8B 46 30 3B C1 .u.......N4.F0;.
0041B930 8B 7C 24 20 74 1D 39 38 74 07 83 C0 04 3B C1 75 .|$ t.98t....;.u
0041B940 F5 3B C1 74 0E 50 8D 44 24 10 50 8D 4E 2C E8 1D .;.t.P.D$.P.N,..
0041B950 4F 03 00 85 FF C7 44 24 18 FF FF FF FF 74 15 8B O.....D$.....t..
0041B960 CF E8 7A 61 FE FF 83 F8 01 75 09 8B 17 50 8B 02 ..za.....u...P..
0041B970 8B CF FF D0 8B 4C 24 10 64 89 0D 00 00 00 00 59 .....L$.d......Y
0041B980 5F 5E 83 C4 10 C2 04 00 CC CC CC CC CC CC CC CC _^..............
0041B990 51 56 8B F1 80 7E 28 00 C7 44 24 04 00 00 00 00 QV...~(..D$.....
0041B9A0 74 33 8B 46 30 85 C0 74 2C 8B 4E 34 2B C8 C1 F9 t3.F0..t,.N4+...
0041B9B0 02 74 22 51 8B D4 89 64 24 08 52 8B CE E8 EE F5 .t"Q...d$.R.....
0041B9C0 FF FF 8B 06 8B 90 A4 00 00 00 8B CE FF D2 8B CE ................
0041B9D0 E8 EB F8 FF FF 8B 76 24 85 F6 8B 44 24 0C 89 30 ......v$...D$..0
0041B9E0 74 04 83 46 04 01 5E 59 C2 04 00 CC CC CC CC CC t..F..^Y........
0041B9F0 8B 41 1C 85 C0 74 04 0F BF 00 C3 81 79 14 00 00 .A...t......y...
0041BA00 00 30 75 0C 83 79 0C 30 75 06 B8 04 00 00 00 C3 .0u..y.0u.......
0041BA10 33 C0 C3 CC CC CC CC CC CC CC CC CC CC CC CC CC 3...............
0041BA20 51 8B 41 08 56 8B 74 24 0C 50 8B CE C7 44 24 08 Q.A.V.t$.P...D$.
0041BA30 00 00 00 00 FF 15 34 43 8A 00 8B C6 5E 59 C2 04 ......4C....^Y..
0041BA40 00 CC CC CC CC CC CC CC CC CC CC CC CC CC CC CC ................
0041BA50 8B 01 8B 40 48 FF E0 CC CC CC CC CC CC CC CC CC ...@H...........
0041BA60 8B 01 DD 44 24 04 8B 50 50 51 D9 1C 24 FF D2 C2 ...D$..PPQ..$...
0041BA70 08 00 CC CC CC CC CC CC CC CC CC CC CC CC CC CC ................
0041BA80 6A FF 68 8C F1 82 00 64 A1 00 00 00 00 50 83 EC j.h....d.....P..
0041BA90 3C 56 A1 88 41 A1 00 33 C4 50 8D 44 24 44 64 A3 <V..A..3.P.D$Dd.
0041BAA0 00 00 00 00 8B F1 8D 4C 24 28 C7 44 24 08 00 00 .......L$(.D$...
0041BAB0 00 00 FF 15 B0 43 8A 00 8B 4C 24 5C 8B 16 8B 52 .....C...L$\...R
0041BAC0 58 51 50 8D 44 24 14 50 8B CE C7 44 24 58 01 00 XQP.D$.P...D$X..
0041BAD0 00 00 FF D2 8B 74 24 54 50 56 C6 44 24 54 02 E8 .....t$TPV.D$T..
0041BAE0 9C AA FF FF 83 C4 08 8D 4C 24 0C C7 44 24 08 01 ........L$..D$..
0041BAF0 00 00 00 C6 44 24 4C 01 FF 15 38 43 8A 00 8D 4C ....D$L...8C...L
0041BB00 24 28 C6 44 24 4C 00 FF 15 38 43 8A 00 8B C6 8B $(.D$L...8C.....
0041BB10 4C 24 44 64 89 0D 00 00 00 00 59 5E 83 C4 48 C2 L$Dd......Y^..H.
0041BB20 0C 00 CC CC CC CC CC CC CC CC CC CC CC CC CC CC ................

;; fn0041BB30: 0041BB30
;;   Called from:
;;     0041DA69 (in fn0041DA20)
;;     0062229F (in fn00622230)
fn0041BB30 proc
	push	0FFh
	push	82F1B9h
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,44h
	mov	eax,[0A14188h]
	xor	eax,esp
	push	eax
	lea	eax,[esp+48h]
	mov	fs:[0000h],eax
	push	8A6998h
	lea	ecx,[esp+8h]
	call	dword ptr [8A4334h]
	lea	eax,[esp+4h]
	push	eax
	lea	ecx,[esp+24h]
	mov	dword ptr [esp+54h],0h
	call	4019E0h
	push	999C68h
	lea	ecx,[esp+24h]
	push	ecx
	mov	dword ptr [esp+28h],990030h
	call	694FCCh
	int	3h
	push	0FFh
	push	82F1E9h
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,44h
	mov	eax,[0A14188h]
	xor	eax,esp
	push	eax
	lea	eax,[esp+48h]
	mov	fs:[0000h],eax
	push	8A6998h
	lea	ecx,[esp+8h]
	call	dword ptr [8A4334h]
	lea	eax,[esp+4h]
	push	eax
	lea	ecx,[esp+24h]
	mov	dword ptr [esp+54h],0h
	call	4019E0h
	push	999C68h
	lea	ecx,[esp+24h]
	push	ecx
	mov	dword ptr [esp+28h],990030h
	call	694FCCh
	int	3h

;; fn0041BBF0: 0041BBF0
;;   Called from:
;;     0041C5CF (in fn0041C4C0)
fn0041BBF0 proc
	mov	edx,[esp+8h]
	cmp	dword ptr [edx],0h
	jle	41BC2Dh

;; fn0041BBF9: 0041BBF9
;;   Called from:
;;     0041BBF7 (in fn0041BBF0)
;;     0041BBF7 (in fn0041BB30)
;;     0041BBF7 (in fn0041BB30)
fn0041BBF9 proc
	mov	ecx,[esp+4h]
	mov	al,[ecx]
	cmp	al,1h
	jnz	41BC22h

l0041BC03:
	mov	eax,1h
	mov	byte ptr [ecx],0h
	cmp	[edx],eax
	jle	41BC26h

l0041BC0F:
	nop

l0041BC10:
	xor	byte ptr [eax+ecx],9Ch
	add	eax,1h
	cmp	eax,[edx]
	jl	41BC10h

l0041BC1B:
	add	dword ptr [edx],0FFh
	lea	eax,[ecx+1h]
	ret

l0041BC22:
	test	al,al
	jnz	41BC2Dh

l0041BC26:
	add	dword ptr [edx],0FFh
	lea	eax,[ecx+1h]
	ret

l0041BC2D:
	xor	eax,eax
	ret
0041BC30 8B 41 0C 3B 41 18 7D 03 8B 41 18 C3 CC CC CC CC .A.;A.}..A......
0041BC40 8B 4C 24 04 FF 15 54 43 8A 00 50 68 74 80 8A 00 .L$...TC..Pht...
0041BC50 E8 2B 50 10 00 83 C4 08 32 C0 C2 04 00 CC CC CC .+P.....2.......
0041BC60 55 8B EC 83 E4 F0 6A FF 68 34 F2 82 00 64 A1 00 U.....j.h4...d..
0041BC70 00 00 00 50 83 EC 58 53 56 57 A1 88 41 A1 00 33 ...P..XSVW..A..3
0041BC80 C4 50 8D 44 24 68 64 A3 00 00 00 00 8B F9 8B 75 .P.D$hd........u
0041BC90 08 6A 40 6A 00 56 E8 85 93 27 00 F3 0F 10 05 1C .j@j.V...'......
0041BCA0 79 8A 00 83 C4 0C F3 0F 11 46 3C 81 7F 14 00 00 y........F<.....
0041BCB0 00 30 75 32 83 7F 0C 30 75 2C 8B 47 10 8D 4E 08 .0u2...0u,.G..N.
0041BCC0 BA 04 00 00 00 D9 00 83 C0 0C D9 59 F8 83 C1 10 ...........Y....
0041BCD0 83 EA 01 D9 40 F8 D9 59 EC D9 40 FC D9 59 F0 75 ....@..Y..@..Y.u
0041BCE0 E4 E9 3B 01 00 00 68 F8 78 8A 00 8D 4C 24 30 FF ..;...h.x...L$0.
0041BCF0 15 34 43 8A 00 8B 5D 0C 53 8D 44 24 30 50 8D 4C .4C...].S.D$0P.L
0041BD00 24 1C 51 8B CF C7 44 24 7C 00 00 00 00 E8 6E 36 $.Q...D$|.....n6
0041BD10 FF FF 8B 10 89 16 8B 48 04 89 4E 04 8B 50 08 8D .......H..N..P..
0041BD20 4C 24 2C 89 56 08 C7 44 24 70 FF FF FF FF FF 15 L$,.V..D$p......
0041BD30 38 43 8A 00 68 F0 78 8A 00 8D 4C 24 30 FF 15 34 8C..h.x...L$0..4
0041BD40 43 8A 00 8D 43 10 50 8D 4C 24 30 51 8D 54 24 1C C...C.P.L$0Q.T$.
0041BD50 52 8B CF C7 44 24 7C 01 00 00 00 E8 20 36 FF FF R...D$|..... 6..
0041BD60 8B 08 89 4E 10 8B 50 04 89 56 14 8B 40 08 8D 4C ...N..P..V..@..L
0041BD70 24 2C 89 46 18 C7 44 24 70 FF FF FF FF FF 15 38 $,.F..D$p......8
0041BD80 43 8A 00 68 E8 78 8A 00 8D 4C 24 30 FF 15 34 43 C..h.x...L$0..4C
0041BD90 8A 00 8D 4B 20 51 8D 54 24 30 52 8D 44 24 1C 50 ...K Q.T$0R.D$.P
0041BDA0 8B CF C7 44 24 7C 02 00 00 00 E8 D1 35 FF FF 8B ...D$|......5...
0041BDB0 08 89 4E 20 8B 50 04 89 56 24 8B 40 08 8D 4C 24 ..N .P..V$.@..L$
0041BDC0 2C 89 46 28 C7 44 24 70 FF FF FF FF FF 15 38 43 ,.F(.D$p......8C
0041BDD0 8A 00 68 E0 78 8A 00 8D 4C 24 4C FF 15 34 43 8A ..h.x...L$L..4C.
0041BDE0 00 83 C3 30 53 8D 4C 24 4C 51 8D 54 24 28 52 8B ...0S.L$LQ.T$(R.
0041BDF0 CF C7 44 24 7C 03 00 00 00 E8 82 35 FF FF 8B 08 ..D$|......5....
0041BE00 89 4E 30 8B 50 04 89 56 34 8B 40 08 8D 4C 24 48 .N0.P..V4.@..L$H
0041BE10 89 46 38 C7 44 24 70 FF FF FF FF FF 15 38 43 8A .F8.D$p......8C.
0041BE20 00 8B C6 8B 4C 24 68 64 89 0D 00 00 00 00 59 5F ....L$hd......Y_
0041BE30 5E 5B 8B E5 5D C2 08 00 CC CC CC CC CC CC CC CC ^[..]...........
0041BE40 56 33 C0 57 8B 7C 24 0C 3B F8 8B F1 89 46 04 89 V3.W.|$.;....F..
0041BE50 46 08 89 46 0C 75 07 5F 32 C0 5E C2 04 00 81 FF F..F.u._2.^.....
0041BE60 FF FF FF 3F 76 05 E8 C5 FC FF FF 50 57 E8 0E 66 ...?v......PW..f
0041BE70 39 00 89 46 04 89 46 08 83 C4 08 8D 04 B8 89 46 9..F..F........F
0041BE80 0C 5F B0 01 5E C2 04 00 CC CC CC CC CC CC CC CC ._..^...........
0041BE90 6A 24 E8 41 91 27 00 83 C4 04 85 C0 74 02 89 00 j$.A.'......t...
0041BEA0 8D 48 04 85 C9 74 02 89 01 C3 CC CC CC CC CC CC .H...t..........
0041BEB0 55 8B EC 6A FF 68 50 F2 82 00 64 A1 00 00 00 00 U..j.hP...d.....
0041BEC0 50 83 EC 08 53 56 57 A1 88 41 A1 00 33 C5 50 8D P...SVW..A..3.P.
0041BED0 45 F4 64 A3 00 00 00 00 89 65 F0 6A 24 E8 F6 90 E.d......e.j$...
0041BEE0 27 00 8B F0 83 C4 04 85 F6 89 75 EC C7 45 FC 00 '.........u..E..
0041BEF0 00 00 00 74 05 8B 45 08 89 06 8D 46 04 85 C0 74 ...t..E....F...t
0041BF00 05 8B 4D 0C 89 08 8B 55 10 52 8D 46 08 50 E8 DD ..M....U.R.F.P..
0041BF10 5B FE FF 83 C4 08 8B C6 8B 4D F4 64 89 0D 00 00 [........M.d....
0041BF20 00 00 59 5F 5E 5B 8B E5 5D C2 0C 00 8B 4D EC 51 ..Y_^[..]....M.Q
0041BF30 E8 91 90 27 00 83 C4 04 6A 00 6A 00 E8 8B 90 27 ...'....j.j....'
0041BF40 00 CC CC CC CC CC CC CC CC CC CC CC CC CC CC CC ................
0041BF50 6A FF 68 79 F2 82 00 64 A1 00 00 00 00 50 83 EC j.hy...d.....P..
0041BF60 44 56 A1 88 41 A1 00 33 C4 50 8D 44 24 4C 64 A3 DV..A..3.P.D$Ld.
0041BF70 00 00 00 00 8B 41 08 8B 54 24 5C BE 49 92 24 09 .....A..T$\.I.$.
0041BF80 2B F0 3B F2 73 3C 68 B0 80 8A 00 8D 4C 24 0C FF +.;.s<h.....L$..
0041BF90 15 34 43 8A 00 8D 44 24 08 50 8D 4C 24 28 C7 44 .4C...D$.P.L$(.D
0041BFA0 24 58 00 00 00 00 E8 35 5A FE FF 68 68 9C 99 00 $X.....5Z..hh...
0041BFB0 8D 4C 24 28 51 C7 44 24 2C 30 00 99 00 E8 0A 90 .L$(Q.D$,0......
0041BFC0 27 00 03 C2 89 41 08 8B 4C 24 4C 64 89 0D 00 00 '....A..L$Ld....
0041BFD0 00 00 59 5E 83 C4 50 C2 04 00 CC CC CC CC CC CC ..Y^..P.........
0041BFE0 55 8B EC 6A FF 68 B1 F2 82 00 64 A1 00 00 00 00 U..j.h....d.....
0041BFF0 50 83 EC 0C 53 56 57 A1 88 41 A1 00 33 C5 50 8D P...SVW..A..3.P.
0041C000 45 F4 64 A3 00 00 00 00 89 65 F0 6A 30 E8 C6 8F E.d......e.j0...
0041C010 27 00 8B F0 83 C4 04 89 75 EC C7 45 FC 00 00 00 '.......u..E....
0041C020 00 89 75 E8 85 F6 C6 45 FC 01 74 30 8B 4D 0C 8B ..u....E..t0.M..
0041C030 45 08 8B 55 10 8B 5D 14 89 4E 04 8D 7E 0C 53 8B E..U..]..N..~.S.
0041C040 CF 89 06 89 56 08 FF 15 3C 43 8A 00 8B 43 1C 8A ....V...<C...C..
0041C050 4D 18 89 47 1C 88 4E 2C C6 46 2D 00 8B C6 8B 4D M..G..N,.F-....M
0041C060 F4 64 89 0D 00 00 00 00 59 5F 5E 5B 8B E5 5D C2 .d......Y_^[..].
0041C070 14 00 8B 55 EC 52 E8 4B 8F 27 00 83 C4 04 6A 00 ...U.R.K.'....j.
0041C080 6A 00 E8 45 8F 27 00 CC CC CC CC CC CC CC CC CC j..E.'..........
0041C090 51 8B 49 34 85 C9 8B 44 24 08 C7 04 24 00 00 00 Q.I4...D$...$...
0041C0A0 00 89 08 74 04 83 41 04 01 59 C2 04 00 CC CC CC ...t..A..Y......

;; fn0041C0B0: 0041C0B0
;;   Called from:
;;     0040E83E (in fn0040E780)
;;     0040E89F (in fn0040E780)
;;     0040E8D6 (in fn0040E780)
;;     0040E930 (in fn0040E780)
;;     0040E9B8 (in fn0040E780)
;;     00410083 (in fn0040FF40)
;;     004100A7 (in fn0040FF40)
;;     00410249 (in fn004100F0)
fn0041C0B0 proc
	push	esi
	push	edi
	mov	edi,ecx
	mov	esi,[edi]
	test	esi,esi
	jz	41C0D4h

l0041C0BA:
	mov	ecx,esi
	call	401AE0h
	cmp	eax,1h
	jnz	41C0D4h

l0041C0C6:
	test	esi,esi
	jz	41C0D4h

l0041C0CA:
	mov	eax,[esi]
	mov	edx,[eax]
	push	1h
	mov	ecx,esi
	call	edx

l0041C0D4:
	mov	dword ptr [edi],0h
	pop	edi
	pop	esi
	ret
0041C0DD                                        CC CC CC              ...
0041C0E0 6A FF 68 D8 F2 82 00 64 A1 00 00 00 00 50 51 56 j.h....d.....PQV
0041C0F0 57 A1 88 41 A1 00 33 C4 50 8D 44 24 10 64 A3 00 W..A..3.P.D$.d..
0041C100 00 00 00 8B F9 89 7C 24 0C C7 07 C8 80 8A 00 8B ......|$........
0041C110 77 20 85 F6 C7 44 24 18 00 00 00 00 74 1A 8B CE w ...D$.....t...
0041C120 E8 BB 59 FE FF 83 F8 01 75 0E 85 F6 74 0A 8B 06 ..Y.....u...t...
0041C130 8B 10 6A 01 8B CE FF D2 8B CF C7 47 20 00 00 00 ..j........G ...
0041C140 00 C7 44 24 18 FF FF FF FF E8 92 1D FF FF 8B 4C ..D$...........L
0041C150 24 10 64 89 0D 00 00 00 00 59 5F 5E 83 C4 10 C3 $.d......Y_^....
0041C160 6A FF 68 49 F3 82 00 64 A1 00 00 00 00 50 83 EC j.hI...d.....P..
0041C170 4C A1 88 41 A1 00 33 C4 89 44 24 48 55 56 57 A1 L..A..3..D$HUVW.
0041C180 88 41 A1 00 33 C4 50 8D 44 24 5C 64 A3 00 00 00 .A..3.P.D$\d....
0041C190 00 8B 6C 24 6C 8B F1 C7 44 24 18 00 00 00 00 81 ..l$l...D$......
0041C1A0 7E 14 00 00 00 50 89 6C 24 1C 75 4F 6A 14 E8 25 ~....P.l$.uOj..%
0041C1B0 8E 27 00 8B F8 83 C4 04 89 7C 24 10 85 FF C7 44 .'.......|$....D
0041C1C0 24 64 01 00 00 00 74 21 8B 4E 20 51 8B C4 89 64 $d....t!.N Q...d
0041C1D0 24 18 50 E8 B8 FE FF FF 8B 4E 0C 8B 56 10 51 52 $.P......N..V.QR
0041C1E0 8B CF E8 49 E6 FF FF EB 02 33 C0 85 C0 89 45 00 ...I.....3....E.
0041C1F0 74 04 83 40 04 01 E9 A7 00 00 00 68 8F 69 8A 00 t..@.......h.i..
0041C200 8D 4C 24 24 FF 15 34 43 8A 00 8B 06 8B 40 74 8D .L$$..4C.....@t.
0041C210 4C 24 20 51 8D 54 24 40 52 8B CE C7 44 24 6C 02 L$ Q.T$@R...D$l.
0041C220 00 00 00 FF D0 8D 4C 24 20 C6 44 24 64 04 FF 15 ......L$ .D$d...
0041C230 38 43 8A 00 6A 14 E8 9D 8D 27 00 8B F0 83 C4 04 8C..j....'......
0041C240 89 74 24 14 85 F6 74 36 51 8B C4 89 64 24 14 C7 .t$...t6Q...d$..
0041C250 00 00 00 00 00 8D 4C 24 40 C6 44 24 68 06 FF 15 ......L$@.D$h...
0041C260 44 43 8A 00 50 8D 4C 24 44 FF 15 44 44 8A 00 50 DC..P.L$D..DD..P
0041C270 8B CE C6 44 24 70 05 E8 B4 E5 FF FF EB 02 33 C0 ...D$p........3.
0041C280 85 C0 89 45 00 74 04 83 40 04 01 8D 4C 24 3C C7 ...E.t..@...L$<.
0041C290 44 24 18 01 00 00 00 C6 44 24 64 00 FF 15 38 43 D$......D$d...8C
0041C2A0 8A 00 8B C5 8B 4C 24 5C 64 89 0D 00 00 00 00 59 .....L$\d......Y
0041C2B0 5F 5E 5D 8B 4C 24 48 33 CC E8 D0 88 27 00 83 C4 _^].L$H3....'...
0041C2C0 58 C2 04 00 CC CC CC CC CC CC CC CC CC CC CC CC X...............
0041C2D0 6A FF 68 89 F3 82 00 64 A1 00 00 00 00 50 83 EC j.h....d.....P..
0041C2E0 44 53 55 56 57 A1 88 41 A1 00 33 C4 50 8D 44 24 DSUVW..A..3.P.D$
0041C2F0 58 64 A3 00 00 00 00 8B F9 81 7F 08 FE FF FF 07 Xd..............
0041C300 72 3C 68 80 6D 8A 00 8D 4C 24 18 FF 15 34 43 8A r<h.m...L$...4C.
0041C310 00 8D 44 24 14 50 8D 4C 24 34 C7 44 24 64 00 00 ..D$.P.L$4.D$d..
0041C320 00 00 E8 B9 56 FE FF 68 68 9C 99 00 8D 4C 24 34 ....V..hh....L$4
0041C330 51 C7 44 24 38 30 00 99 00 E8 8E 8C 27 00 8B 54 Q.D$80......'..T
0041C340 24 74 8B 47 04 8B 74 24 70 6A 00 52 50 56 50 E8 $t.G..t$pj.RPVP.
0041C350 8C FC FF FF 8B E8 8B 47 04 BB 01 00 00 00 01 5F .......G......._
0041C360 08 3B F0 75 10 89 68 04 8B 47 04 89 28 8B 4F 04 .;.u..h..G..(.O.
0041C370 89 69 08 EB 22 80 7C 24 6C 00 74 0D 89 2E 8B 47 .i..".|$l.t....G
0041C380 04 3B 30 75 12 89 28 EB 0E 89 6E 08 8B 47 04 3B .;0u..(...n..G.;
0041C390 70 08 75 03 89 68 08 8B 55 04 80 7A 2C 00 8D 45 p.u..h..U..z,..E
0041C3A0 04 8B F5 0F 85 EC 00 00 00 8D A4 24 00 00 00 00 ...........$....
0041C3B0 8B 08 8B 51 04 3B 0A 75 51 8B 52 08 80 7A 2C 00 ...Q.;.uQ.R..z,.
0041C3C0 75 19 88 59 2C 88 5A 2C 8B 10 8B 4A 04 C6 41 2C u..Y,.Z,...J..A,
0041C3D0 00 8B 10 8B 72 04 E9 AA 00 00 00 3B 71 08 75 0A ....r......;q.u.
0041C3E0 8B F1 56 8B CF E8 66 5E 0C 00 8B 46 04 88 58 2C ..V...f^...F..X,
0041C3F0 8B 4E 04 8B 51 04 C6 42 2C 00 8B 46 04 8B 48 04 .N..Q..B,..F..H.
0041C400 51 8B CF E8 38 43 00 00 EB 7B 8B 12 80 7A 2C 00 Q...8C...{...z,.
0041C410 75 16 88 59 2C 88 5A 2C 8B 10 8B 4A 04 C6 41 2C u..Y,.Z,...J..A,
0041C420 00 8B 10 8B 72 04 EB 5D 3B 31 75 0A 8B F1 56 8B ....r..];1u...V.
0041C430 CF E8 0A 43 00 00 8B 46 04 88 58 2C 8B 4E 04 8B ...C...F..X,.N..
0041C440 51 04 C6 42 2C 00 8B 46 04 8B 40 04 8B 48 08 8B Q..B,..F..@..H..
0041C450 11 89 50 08 8B 11 80 7A 2D 00 75 03 89 42 04 8B ..P....z-.u..B..
0041C460 50 04 89 51 04 8B 57 04 3B 42 04 75 05 89 4A 04 P..Q..W.;B.u..J.
0041C470 EB 0E 8B 50 04 3B 02 75 04 89 0A EB 03 89 4A 08 ...P.;.u......J.
0041C480 89 01 89 48 04 8B 4E 04 80 79 2C 00 8D 46 04 0F ...H..N..y,..F..
0041C490 84 1B FF FF FF 8B 57 04 8B 42 04 88 58 2C 8B 44 ......W..B..X,.D
0041C4A0 24 68 89 28 8B 4C 24 58 64 89 0D 00 00 00 00 59 $h.(.L$Xd......Y
0041C4B0 5F 5E 5D 5B 83 C4 50 C2 10 00 CC CC CC CC CC CC _^][..P.........

;; fn0041C4C0: 0041C4C0
;;   Called from:
;;     0041E73A (in fn0041E670)
fn0041C4C0 proc
	push	0FFh
	push	82F3CBh
	mov	eax,fs:[0000h]
	push	eax
	push	ecx
	push	ebx
	push	ebp
	push	esi
	push	edi
	mov	eax,[0A14188h]
	xor	eax,esp
	push	eax
	lea	eax,[esp+18h]
	mov	fs:[0000h],eax
	mov	esi,ecx
	mov	[esp+14h],esi
	xor	ebx,ebx
	mov	[esp+20h],ebx
	mov	[esi+4h],ebx
	mov	eax,[esp+28h]
	mov	ebp,[esp+38h]
	cmp	ebp,ebx
	mov	ecx,[esp+30h]
	mov	edx,[esp+2Ch]
	mov	[esi+8h],eax
	mov	eax,[esp+34h]
	lea	edi,[esi+0Ch]
	mov	dword ptr [esi],8A80C8h
	mov	[edi],ecx
	mov	[esi+10h],edx
	mov	[esi+14h],eax
	mov	[esi+18h],ebx
	mov	[esi+1Ch],ebx
	mov	[esi+20h],ebp
	jz	41C530h

l0041C529:
	mov	ecx,ebp
	call	401AD0h

l0041C530:
	cmp	[esi+14h],ebx
	mov	byte ptr [esp+20h],2h
	jnz	41C5C1h

l0041C53E:
	mov	eax,[edi]
	cmp	eax,2h
	mov	ecx,[esi+10h]
	mov	[esi+1Ch],ecx
	mov	[esi+18h],eax
	jge	41C565h

l0041C54E:
	mov	edx,[esi+8h]
	push	edx
	push	eax
	push	8A81C8h
	call	520C80h
	add	esp,0Ch
	jmp	41C5E5h

l0041C565:
	mov	eax,[esi]
	mov	edx,[eax+4h]
	mov	ecx,esi
	call	edx
	mov	ecx,[esi+1Ch]
	lea	eax,[eax+eax*2+3h]
	add	eax,eax
	cmp	ecx,ebx
	jz	41C580h

l0041C57B:
	lea	edx,[ecx+2h]
	jmp	41C582h

l0041C580:
	xor	edx,edx

l0041C582:
	mov	edx,[edx]
	and	edx,0FFFFFFFh
	cmp	ecx,ebx
	mov	[edi],edx
	jz	41C595h

l0041C590:
	lea	edx,[ecx+2h]
	jmp	41C597h

l0041C595:
	xor	edx,edx

l0041C597:
	mov	edx,[edx]
	and	edx,0F0000000h
	cmp	eax,ebx
	mov	[esi+14h],edx
	jl	41C632h

l0041C5AA:
	mov	edx,[edi]
	mov	ebp,[esi+18h]
	add	ebp,1h
	add	edx,eax
	cmp	ebp,edx
	mov	ebp,[esp+38h]
	jl	41C632h

l0041C5BC:
	add	ecx,eax
	mov	[esi+10h],ecx

l0041C5C1:
	cmp	dword ptr [esi+14h],60000000h
	jnz	41C5F7h

l0041C5CA:
	mov	edx,[esi+10h]
	push	edi
	push	edx
	call	41BBF0h
	add	esp,8h
	cmp	eax,ebx
	mov	[esi+10h],eax
	mov	dword ptr [esi+14h],50000000h
	jnz	41C5F7h

l0041C5E5:
	mov	[esi+1Ch],ebx
	mov	[esi+18h],ebx
	mov	[esi+10h],ebx
	mov	[edi],ebx
	mov	dword ptr [esi+14h],10000000h

l0041C5F7:
	cmp	ebp,ebx
	mov	dword ptr [esp+20h],0FFFFFFFFh
	jz	41C61Ah

l0041C603:
	mov	ecx,ebp
	call	401AE0h
	cmp	eax,1h
	jnz	41C61Ah

l0041C60F:
	mov	eax,[ebp+0h]
	mov	edx,[eax]
	push	1h
	mov	ecx,ebp
	call	edx

l0041C61A:
	mov	eax,esi
	mov	ecx,[esp+18h]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebp
	pop	ebx
	add	esp,10h
	ret	14h

l0041C632:
	mov	ecx,[edi]
	mov	edx,[esp+30h]
	push	ecx
	mov	ecx,[esi+8h]
	push	edx
	push	ecx
	push	eax
	push	8A8178h
	call	520C80h
	add	esp,14h
	jmp	41C5E5h
0041C64E                                           CC CC               ..
0041C650 51 8B 44 24 08 C7 04 24 00 00 00 00 C7 00 00 00 Q.D$...$........
0041C660 00 00 59 C2 08 00 CC CC CC CC CC CC CC CC CC CC ..Y.............
0041C670 51 53 55 8B 6C 24 14 56 8B D9 57 8B 7B 04 8B 77 QSU.l$.V..W.{..w
0041C680 04 80 7E 2D 00 B0 01 88 44 24 10 75 28 8D 49 00 ..~-....D$.u(.I.
0041C690 8D 46 0C 50 55 8B FE FF 15 0C 44 8A 00 83 C4 08 .F.PU.....D.....
0041C6A0 84 C0 88 44 24 10 74 04 8B 36 EB 03 8B 76 08 80 ...D$.t..6...v..
0041C6B0 7E 2D 00 74 DB 84 C0 8B F7 89 74 24 1C 74 38 8B ~-.t......t$.t8.
0041C6C0 4B 04 3B 39 75 24 55 57 6A 01 8D 54 24 28 52 8B K.;9u$UWj..T$(R.
0041C6D0 CB E8 FA FB FF FF 8B 08 8B 44 24 18 5F 5E 5D 89 .........D$._^].
0041C6E0 08 C6 40 04 01 5B 59 C2 08 00 8D 4C 24 1C E8 CD ..@..[Y....L$...
0041C6F0 91 1D 00 8B 74 24 1C 8D 56 0C 55 52 FF 15 0C 44 ....t$..V.UR...D
0041C700 8A 00 83 C4 08 84 C0 74 27 8B 44 24 10 55 57 50 .......t'.D$.UWP
0041C710 8D 4C 24 28 51 8B CB E8 B4 FB FF FF 8B 10 8B 44 .L$(Q..........D
0041C720 24 18 5F 5E 5D 89 10 C6 40 04 01 5B 59 C2 08 00 $._^]...@..[Y...
0041C730 8B 44 24 18 5F 89 30 5E 5D C6 40 04 00 5B 59 C2 .D$._.0^].@..[Y.
0041C740 08 00 CC CC CC CC CC CC CC CC CC CC CC CC CC CC ................
0041C750 6A FF 68 F9 F3 82 00 64 A1 00 00 00 00 50 83 EC j.h....d.....P..
0041C760 48 53 55 56 57 A1 88 41 A1 00 33 C4 50 8D 44 24 HSUVW..A..3.P.D$
0041C770 5C 64 A3 00 00 00 00 8B E9 8B 44 24 70 80 78 2D \d........D$p.x-
0041C780 00 74 3C 68 94 6D 8A 00 8D 4C 24 1C FF 15 34 43 .t<h.m...L$...4C
0041C790 8A 00 8D 44 24 18 50 8D 4C 24 38 C7 44 24 68 00 ...D$.P.L$8.D$h.
0041C7A0 00 00 00 E8 38 52 FE FF 68 8C A8 99 00 8D 4C 24 ....8R..h.....L$
0041C7B0 38 51 C7 44 24 3C 3C 00 99 00 E8 0D 88 27 00 8B 8Q.D$<<......'..
0041C7C0 D8 8D 4C 24 70 89 5C 24 14 E8 F2 46 19 00 8B 03 ..L$p.\$...F....
0041C7D0 80 78 2D 00 74 05 8B 7B 08 EB 18 8B 53 08 80 7A .x-.t..{....S..z
0041C7E0 2D 00 74 04 8B F8 EB 0B 8B 4C 24 70 3B CB 8B 79 -.t......L$p;..y
0041C7F0 08 75 6B 80 7F 2D 00 8B 73 04 75 03 89 77 04 8B .uk..-..s.u..w..
0041C800 45 04 39 58 04 75 05 89 78 04 EB 0B 39 1E 75 04 E.9X.u..x...9.u.
0041C810 89 3E EB 03 89 7E 08 8B 5D 04 8B 03 3B 44 24 14 .>...~..]...;D$.
0041C820 75 15 80 7F 2D 00 74 04 8B C6 EB 09 57 E8 9E A6 u...-.t.....W...
0041C830 FE FF 83 C4 04 89 03 8B 5D 04 8B 4C 24 14 39 4B ........]..L$.9K
0041C840 08 75 72 80 7F 2D 00 74 07 8B C6 89 43 08 EB 65 .ur..-.t....C..e
0041C850 57 E8 0A A1 0C 00 83 C4 04 89 43 08 EB 57 89 48 W.........C..W.H
0041C860 04 8B 13 89 11 3B 4B 08 75 04 8B F1 EB 1A 80 7F .....;K.u.......
0041C870 2D 00 8B 71 04 75 03 89 77 04 89 3E 8B 43 08 89 -..q.u..w..>.C..
0041C880 41 08 8B 53 08 89 4A 04 8B 45 04 39 58 04 75 05 A..S..J..E.9X.u.
0041C890 89 48 04 EB 0E 8B 43 04 39 18 75 04 89 08 EB 03 .H....C.9.u.....
0041C8A0 89 48 08 8B 43 04 89 41 04 8A 53 2C 8A 41 2C 88 .H..C..A..S,.A,.
0041C8B0 51 2C 88 43 2C 8B 44 24 14 B3 01 38 58 2C 0F 85 Q,.C,.D$...8X,..
0041C8C0 F2 00 00 00 8B 4D 04 3B 79 04 0F 84 E3 00 00 00 .....M.;y.......
0041C8D0 38 5F 2C 0F 85 DA 00 00 00 8B 06 3B F8 75 63 8B 8_,........;.uc.
0041C8E0 46 08 80 78 2C 00 75 12 88 58 2C 56 8B CD C6 46 F..x,.u..X,V...F
0041C8F0 2C 00 E8 59 59 0C 00 8B 46 08 80 78 2D 00 75 72 ,..YY...F..x-.ur
0041C900 8B 10 38 5A 2C 75 08 8B 48 08 38 59 2C 74 5F 8B ..8Z,u..H.8Y,t_.
0041C910 48 08 38 59 2C 75 12 88 5A 2C 50 8B CD C6 40 2C H.8Y,u..Z,P...@,
0041C920 00 E8 1A 3E 00 00 8B 46 08 8A 4E 2C 88 48 2C 88 ...>...F..N,.H,.
0041C930 5E 2C 8B 50 08 56 8B CD 88 5A 2C E8 10 59 0C 00 ^,.P.V...Z,..Y..
0041C940 EB 71 80 78 2C 00 75 11 88 58 2C 56 8B CD C6 46 .q.x,.u..X,V...F
0041C950 2C 00 E8 E9 3D 00 00 8B 06 80 78 2D 00 75 13 8B ,...=.....x-.u..
0041C960 50 08 38 5A 2C 75 1E 8B 08 38 59 2C 75 17 C6 40 P.8Z,u...8Y,u..@
0041C970 2C 00 8B 55 04 8B FE 3B 7A 04 8B 76 04 0F 85 4D ,..U...;z..v...M
0041C980 FF FF FF EB 2E 8B 08 38 59 2C 75 11 88 5A 2C 50 .......8Y,u..Z,P
0041C990 8B CD C6 40 2C 00 E8 B5 58 0C 00 8B 06 8A 4E 2C ...@,...X.....N,
0041C9A0 88 48 2C 88 5E 2C 8B 10 56 8B CD 88 5A 2C E8 8D .H,.^,..V...Z,..
0041C9B0 3D 00 00 88 5F 2C 8B 4C 24 14 83 C1 0C FF 15 38 =..._,.L$......8
0041C9C0 43 8A 00 8B 44 24 14 50 E8 F9 85 27 00 8B 45 08 C...D$.P...'..E.
0041C9D0 83 C4 04 85 C0 76 06 83 C0 FF 89 45 08 8B 44 24 .....v.....E..D$
0041C9E0 6C 8B 4C 24 70 89 08 8B 4C 24 5C 64 89 0D 00 00 l.L$p...L$\d....
0041C9F0 00 00 59 5F 5E 5D 5B 83 C4 54 C2 08 00 CC CC CC ..Y_^][..T......
0041CA00 6A FF 68 53 F4 82 00 64 A1 00 00 00 00 50 83 EC j.hS...d.....P..
0041CA10 24 53 56 A1 88 41 A1 00 33 C4 50 8D 44 24 30 64 $SV..A..3.P.D$0d
0041CA20 A3 00 00 00 00 33 DB 89 5C 24 0C F6 05 68 3F A5 .....3..\$...h?.
0041CA30 00 01 0F 85 85 00 00 00 83 0D 68 3F A5 00 01 6A ..........h?...j
0041CA40 60 89 5C 24 3C E8 B6 B4 FF FF 8B F0 83 C4 04 89 `.\$<...........
0041CA50 74 24 10 85 F6 C6 44 24 38 01 74 2B 68 8F 69 8A t$....D$8.t+h.i.
0041CA60 00 8D 4C 24 18 FF 15 34 43 8A 00 8D 44 24 14 BB ..L$...4C...D$..
0041CA70 01 00 00 00 50 8B CE C6 44 24 3C 02 89 5C 24 10 ....P...D$<..\$.
0041CA80 E8 8B B9 FF FF EB 02 33 C0 85 C0 A3 64 3F A5 00 .......3....d?..
0041CA90 74 07 8B C8 E8 37 50 FE FF F6 C3 01 C7 44 24 38 t....7P......D$8
0041CAA0 00 00 00 00 74 0A 8D 4C 24 14 FF 15 38 43 8A 00 ....t..L$...8C..
0041CAB0 68 30 CC 89 00 E8 D2 81 27 00 83 C4 04 8B 0D 64 h0......'......d
0041CAC0 3F A5 00 85 C9 8B 74 24 40 89 0E 74 05 E8 FE 4F ?.....t$@..t...O
0041CAD0 FE FF 8B C6 8B 4C 24 30 64 89 0D 00 00 00 00 59 .....L$0d......Y
0041CAE0 5E 5B 83 C4 30 C3 CC CC CC CC CC CC CC CC CC CC ^[..0...........
0041CAF0 6A FF 68 8A F4 82 00 64 A1 00 00 00 00 50 83 EC j.h....d.....P..
0041CB00 40 A1 88 41 A1 00 33 C4 89 44 24 3C 53 56 57 A1 @..A..3..D$<SVW.
0041CB10 88 41 A1 00 33 C4 50 8D 44 24 50 64 A3 00 00 00 .A..3.P.D$Pd....
0041CB20 00 8B F9 81 7F 14 00 00 00 40 75 0D 33 C0 39 47 .........@u.3.9G
0041CB30 0C 0F 9F C0 E9 B8 00 00 00 8D 44 24 10 50 E8 BD ..........D$.P..
0041CB40 FE FF FF 8D 4C 24 18 51 C7 44 24 60 00 00 00 00 ....L$.Q.D$`....
0041CB50 E8 4B 13 FF FF 83 C4 08 8B 17 8B 52 58 6A 00 50 .K.........RXj.P
0041CB60 8D 44 24 38 50 8B CF C6 44 24 64 01 FF D2 8D 4C .D$8P...D$d....L
0041CB70 24 14 C6 44 24 58 03 FF 15 38 43 8A 00 8B 74 24 $..D$X...8C...t$
0041CB80 10 8B 06 8B 90 8C 00 00 00 8D 4C 24 30 51 8B CE ..........L$0Q..
0041CB90 FF D2 8D 4C 24 30 FF 15 54 43 8A 00 8B 4F 08 50 ...L$0..TC...O.P
0041CBA0 8B 47 14 50 51 68 08 82 8A 00 E8 D1 40 10 00 8B .G.PQh......@...
0041CBB0 16 8B 44 24 70 8B 52 44 83 C4 10 50 8B CE FF D2 ..D$p.RD...P....
0041CBC0 8D 4C 24 30 8A D8 C6 44 24 58 00 FF 15 38 43 8A .L$0...D$X...8C.
0041CBD0 00 8B CE C7 44 24 58 FF FF FF FF E8 00 4F FE FF ....D$X......O..
0041CBE0 83 F8 01 75 0A 8B 06 8B 10 6A 01 8B CE FF D2 8A ...u.....j......
0041CBF0 C3 8B 4C 24 50 64 89 0D 00 00 00 00 59 5F 5E 5B ..L$Pd......Y_^[
0041CC00 8B 4C 24 3C 33 CC E8 83 7F 27 00 83 C4 4C C2 04 .L$<3....'...L..
0041CC10 00 CC CC CC CC CC CC CC CC CC CC CC CC CC CC CC ................
0041CC20 6A FF 68 DA F4 82 00 64 A1 00 00 00 00 50 83 EC j.h....d.....P..
0041CC30 3C 56 57 A1 88 41 A1 00 33 C4 50 8D 44 24 48 64 <VW..A..3.P.D$Hd
0041CC40 A3 00 00 00 00 8B F1 81 7E 14 00 00 00 20 0F 85 ........~.... ..
0041CC50 80 00 00 00 8B 46 0C 83 F8 04 77 6A FF 24 85 94 .....F....wj.$..
0041CC60 CD 41 00 33 C0 8B 4C 24 48 64 89 0D 00 00 00 00 .A.3..L$Hd......
0041CC70 59 5F 5E 83 C4 48 C2 04 00 8B 46 10 0F BE 00 8B Y_^..H....F.....
0041CC80 4C 24 48 64 89 0D 00 00 00 00 59 5F 5E 83 C4 48 L$Hd......Y_^..H
0041CC90 C2 04 00 8B 4E 10 0F BF 01 8B 4C 24 48 64 89 0D ....N.....L$Hd..
0041CCA0 00 00 00 00 59 5F 5E 83 C4 48 C2 04 00 8B 56 10 ....Y_^..H....V.
0041CCB0 8B 02 8B 4C 24 48 64 89 0D 00 00 00 00 59 5F 5E ...L$Hd......Y_^
0041CCC0 83 C4 48 C2 04 00 50 68 88 82 8A 00 E8 AF 3F 10 ..H...Ph......?.
0041CCD0 00 83 C4 08 8B 46 14 8B 4E 08 50 51 68 4C 82 8A .....F..N.PQhL..
0041CCE0 00 E8 9A 3F 10 00 8D 54 24 18 52 E8 10 FD FF FF ...?...T$.R.....
0041CCF0 8D 44 24 3C 50 C7 44 24 64 00 00 00 00 E8 9E 11 .D$<P.D$d.......
0041CD00 FF FF 83 C4 14 8B 16 8B 52 58 6A 00 50 8D 44 24 ........RXj.P.D$
0041CD10 18 50 8B CE C6 44 24 5C 01 FF D2 8B 74 24 0C 8B .P...D$\....t$..
0041CD20 16 50 8B 82 8C 00 00 00 8B CE C6 44 24 54 02 FF .P.........D$T..
0041CD30 D0 8D 4C 24 10 C6 44 24 50 01 FF 15 38 43 8A 00 ..L$..D$P...8C..
0041CD40 8D 4C 24 2C C6 44 24 50 00 FF 15 38 43 8A 00 8B .L$,.D$P...8C...
0041CD50 16 8B 44 24 58 8B 52 48 50 8B CE FF D2 8B CE 8B ..D$X.RHP.......
0041CD60 F8 C7 44 24 50 FF FF FF FF E8 72 4D FE FF 83 F8 ..D$P.....rM....
0041CD70 01 75 0A 8B 06 8B 10 6A 01 8B CE FF D2 8B C7 8B .u.....j........
0041CD80 4C 24 48 64 89 0D 00 00 00 00 59 5F 5E 83 C4 48 L$Hd......Y_^..H
0041CD90 C2 04 00 90 63 CC 41 00 79 CC 41 00 93 CC 41 00 ....c.A.y.A...A.
0041CDA0 C6 CC 41 00 AD CC 41 00 CC CC CC CC CC CC CC CC ..A...A.........
0041CDB0 6A FF 68 23 F5 82 00 64 A1 00 00 00 00 50 83 EC j.h#...d.....P..
0041CDC0 5C A1 88 41 A1 00 33 C4 89 44 24 58 56 A1 88 41 \..A..3..D$XV..A
0041CDD0 A1 00 33 C4 50 8D 44 24 64 64 A3 00 00 00 00 8B ..3.P.D$dd......
0041CDE0 F1 8B 46 14 3D 00 00 00 30 0F 85 FF 00 00 00 8B ..F.=...0.......
0041CDF0 46 0C 85 C0 0F 84 F0 00 00 00 83 F8 04 0F 84 E0 F...............
0041CE00 00 00 00 50 68 F4 82 8A 00 E8 72 3E 10 00 83 C4 ...Ph.....r>....
0041CE10 08 8B 56 14 8B 46 08 52 50 68 B4 82 8A 00 E8 5D ..V..F.RPh.....]
0041CE20 3E 10 00 8D 4C 24 14 51 E8 D3 FB FF FF 8D 54 24 >...L$.Q......T$
0041CE30 1C 52 C7 84 24 80 00 00 00 01 00 00 00 E8 5E 10 .R..$.........^.
0041CE40 FF FF 83 C4 14 8B 16 8B 52 58 6A 00 50 8D 44 24 ........RXj.P.D$
0041CE50 30 50 8B CE C6 44 24 78 02 FF D2 8B 74 24 08 8B 0P...D$x....t$..
0041CE60 16 50 8B 82 8C 00 00 00 8B CE C6 44 24 70 03 FF .P.........D$p..
0041CE70 D0 8D 4C 24 28 C6 44 24 6C 02 FF 15 38 43 8A 00 ..L$(.D$l...8C..
0041CE80 8D 4C 24 0C C6 44 24 6C 01 FF 15 38 43 8A 00 D9 .L$..D$l...8C...
0041CE90 44 24 74 8B 16 8B 42 50 51 8B CE D9 1C 24 FF D0 D$t...BPQ....$..
0041CEA0 D9 5C 24 08 8B CE C7 44 24 6C FF FF FF FF E8 2D .\$....D$l.....-
0041CEB0 4C FE FF 83 F8 01 75 09 8B 16 50 8B 02 8B CE FF L.....u...P.....
0041CEC0 D0 D9 44 24 08 8B 4C 24 64 64 89 0D 00 00 00 00 ..D$..L$dd......
0041CED0 59 5E 8B 4C 24 58 33 CC E8 B1 7C 27 00 83 C4 68 Y^.L$X3...|'...h
0041CEE0 C2 04 00 8B 46 10 D9 00 EB DB D9 EE EB D7 3D 00 ....F.........=.
0041CEF0 00 00 20 75 13 8B 16 8B 42 48 6A 00 FF D0 89 44 .. u....BHj....D
0041CF00 24 08 DB 44 24 08 EB BD 3D 00 00 00 10 0F 85 FE $..D$...=.......
0041CF10 FE FF FF 8B 46 0C 85 C0 7E 46 8B 4E 10 50 51 8D ....F...~F.N.PQ.
0041CF20 4C 24 4C FF 15 40 44 8A 00 8D 4C 24 44 C7 44 24 L$L..@D...L$D.D$
0041CF30 6C 00 00 00 00 FF 15 54 43 8A 00 50 FF 15 1C 46 l......TC..P...F
0041CF40 8A 00 D9 5C 24 0C 83 C4 04 8D 4C 24 44 C7 44 24 ...\$.....L$D.D$
0041CF50 6C FF FF FF FF FF 15 38 43 8A 00 E9 61 FF FF FF l......8C...a...
0041CF60 D9 44 24 74 E9 5C FF FF FF CC CC CC CC CC CC CC .D$t.\..........
0041CF70 6A FF 68 9F F5 82 00 64 A1 00 00 00 00 50 81 EC j.h....d.....P..
0041CF80 10 01 00 00 53 55 56 57 A1 88 41 A1 00 33 C4 50 ....SUVW..A..3.P
0041CF90 8D 84 24 24 01 00 00 64 A3 00 00 00 00 8B F1 C7 ..$$...d........
0041CFA0 44 24 18 00 00 00 00 8B 46 14 3D 00 00 00 10 75 D$......F.=....u
0041CFB0 1C 8B 46 0C 8B 4E 10 8B B4 24 34 01 00 00 50 51 ..F..N...$4...PQ
0041CFC0 8B CE FF 15 40 44 8A 00 E9 DE 02 00 00 3D 00 00 ....@D.......=..
0041CFD0 00 50 75 1D 8B 56 0C 8B 46 10 8B B4 24 34 01 00 .Pu..V..F...$4..
0041CFE0 00 52 50 56 E8 D7 2E 20 00 83 C4 0C E9 BA 02 00 .RPV... ........
0041CFF0 00 BB 01 00 00 00 53 6A 03 8D 8C 24 A4 00 00 00 ......Sj...$....
0041D000 FF 15 90 44 8A 00 8B 46 14 3D 00 00 00 20 89 9C ...D...F.=... ..
0041D010 24 2C 01 00 00 0F 84 49 02 00 00 3D 00 00 00 30 $,.....I...=...0
0041D020 74 61 3D 00 00 00 40 74 17 8B 4E 08 51 50 68 AC ta=...@t..N.QPh.
0041D030 83 8A 00 E8 48 3C 10 00 83 C4 0C E9 3D 02 00 00 ....H<......=...
0041D040 8B 16 8B 42 44 6A 00 8B CE FF D0 84 C0 74 1A 8D ...BDj.......t..
0041D050 8C 24 A4 00 00 00 68 E4 77 8A 00 51 E8 BF 4E FE .$....h.w..Q..N.
0041D060 FF 83 C4 08 E9 14 02 00 00 8D 94 24 A4 00 00 00 ...........$....
0041D070 68 DC 77 8A 00 52 E8 A5 4E FE FF 83 C4 08 E9 FA h.w..R..N.......
0041D080 01 00 00 83 7E 0C 30 0F 84 F0 01 00 00 8B 46 0C ....~.0.......F.
0041D090 A8 03 0F 85 BC 01 00 00 8D 44 24 14 50 E8 5E F9 .........D$.P.^.
0041D0A0 FF FF 83 C4 04 8B 46 0C C1 E8 02 83 C0 FF 83 F8 ......F.........
0041D0B0 03 C6 84 24 2C 01 00 00 02 0F 87 F9 00 00 00 FF ...$,...........
0041D0C0 24 85 CC D2 41 00 8B 7C 24 14 D9 EE 8B 16 8B 2F $...A..|$....../
0041D0D0 8B 42 50 68 A8 83 8A 00 51 8B CE D9 1C 24 81 C5 .BPh....Q....$..
0041D0E0 84 00 00 00 FF D0 8B 55 00 51 8B CF D9 1C 24 FF .......U.Q....$.
0041D0F0 D2 E9 0D 01 00 00 A1 C4 3F A5 00 8B 0D C8 3F A5 ........?.....?.
0041D100 00 8B 7C 24 14 8B 16 8B 52 60 89 44 24 1C 89 4C ..|$....R`.D$..L
0041D110 24 20 8B 2F 68 A0 83 8A 00 8D 44 24 20 50 8D 4C $ ./h.....D$ P.L
0041D120 24 2C 51 8B CE 81 C5 94 00 00 00 FF D2 50 8B 45 $,Q..........P.E
0041D130 00 8B CF FF D0 E9 C9 00 00 00 8B 7C 24 14 8B 2F ...........|$../
0041D140 8B 1E 8D 4C 24 54 68 94 83 8A 00 51 81 C5 98 00 ...L$Th....Q....
0041D150 00 00 E8 F9 0C FF FF 83 C4 04 50 8B 43 64 8D 54 ..........P.Cd.T
0041D160 24 50 52 8B CE FF D0 8B 55 00 50 8B CF FF D2 BB $PR.....U.P.....
0041D170 01 00 00 00 E9 8A 00 00 00 8B 7C 24 14 8B 2F 8B ..........|$../.
0041D180 1E 8D 44 24 7C 68 88 83 8A 00 50 81 C5 9C 00 00 ..D$|h....P.....
0041D190 00 E8 DA 0C FF FF 8B 53 68 83 C4 04 50 8D 8C 24 .......Sh...P..$
0041D1A0 94 00 00 00 51 8B CE FF D2 50 8B 45 00 8B CF FF ....Q....P.E....
0041D1B0 D0 BB 01 00 00 00 EB 4B 68 58 83 8A 00 E8 BE 3A .......KhX.....:
0041D1C0 10 00 83 C4 04 68 8F 69 8A 00 8D 4C 24 30 FF 15 .....h.i...L$0..
0041D1D0 34 43 8A 00 8B 7C 24 14 8B 17 8B 92 8C 00 00 00 4C...|$.........
0041D1E0 8D 44 24 2C 50 8B CF C6 84 24 30 01 00 00 03 FF .D$,P....$0.....
0041D1F0 D2 8D 4C 24 2C C6 84 24 2C 01 00 00 02 FF 15 38 ..L$,..$,......8
0041D200 43 8A 00 8D 44 24 60 50 E8 93 0C FF FF 83 C4 04 C...D$`P........
0041D210 8B 17 8B B4 24 34 01 00 00 6A 00 50 8B 42 58 56 ....$4...j.P.BXV
0041D220 8B CF C6 84 24 38 01 00 00 04 FF D0 8D 4C 24 60 ....$8.......L$`
0041D230 89 5C 24 18 C6 84 24 2C 01 00 00 02 FF 15 38 43 .\$...$,......8C
0041D240 8A 00 8D 4C 24 14 88 9C 24 2C 01 00 00 E8 5E EE ...L$...$,....^.
0041D250 FF FF EB 42 50 68 24 83 8A 00 E8 21 3A 10 00 83 ...BPh$....!:...
0041D260 C4 08 EB 19 8B 16 8B 42 48 6A 00 8B CE FF D0 50 .......BHj.....P
0041D270 8D 8C 24 A8 00 00 00 FF 15 80 44 8A 00 8B B4 24 ..$.......D....$
0041D280 34 01 00 00 56 8D 8C 24 A0 00 00 00 FF 15 B4 44 4...V..$.......D
0041D290 8A 00 89 5C 24 18 8D 8C 24 9C 00 00 00 C6 84 24 ...\$...$......$
0041D2A0 2C 01 00 00 00 FF 15 88 44 8A 00 8B C6 8B 8C 24 ,.......D......$
0041D2B0 24 01 00 00 64 89 0D 00 00 00 00 59 5F 5E 5D 5B $...d......Y_^][
0041D2C0 81 C4 1C 01 00 00 C2 0C 00 8D 49 00 C6 D0 41 00 ..........I...A.
0041D2D0 F6 D0 41 00 3A D1 41 00 79 D1 41 00 CC CC CC CC ..A.:.A.y.A.....
0041D2E0 6A FF 68 DA F5 82 00 64 A1 00 00 00 00 50 83 EC j.h....d.....P..
0041D2F0 3C 56 57 A1 88 41 A1 00 33 C4 50 8D 44 24 48 64 <VW..A..3.P.D$Hd
0041D300 A3 00 00 00 00 8B F1 81 7E 14 00 00 00 30 75 2B ........~....0u+
0041D310 83 7E 0C 08 75 25 8B 76 10 8B 0E 8B 44 24 58 89 .~..u%.v....D$X.
0041D320 08 8B 56 04 89 50 04 8B 4C 24 48 64 89 0D 00 00 ..V..P..L$Hd....
0041D330 00 00 59 5F 5E 83 C4 48 C2 08 00 8D 44 24 0C 50 ..Y_^..H....D$.P
0041D340 E8 BB F6 FF FF 8D 4C 24 30 51 C7 44 24 58 00 00 ......L$0Q.D$X..
0041D350 00 00 E8 49 0B FF FF 83 C4 08 8B 16 8B 52 58 6A ...I.........RXj
0041D360 00 50 8D 44 24 18 50 8B CE C6 44 24 5C 01 FF D2 .P.D$.P...D$\...
0041D370 8B 74 24 0C 8B 16 50 8B 82 8C 00 00 00 8B CE C6 .t$...P.........
0041D380 44 24 54 02 FF D0 8D 4C 24 10 C6 44 24 50 01 FF D$T....L$..D$P..
0041D390 15 38 43 8A 00 8D 4C 24 2C C6 44 24 50 00 FF 15 .8C...L$,.D$P...
0041D3A0 38 43 8A 00 8B 44 24 5C 8B 16 8B 7C 24 58 8B 52 8C...D$\...|$X.R
0041D3B0 60 50 57 8B CE FF D2 8B CE C7 44 24 50 FF FF FF `PW.......D$P...
0041D3C0 FF E8 1A 47 FE FF 83 F8 01 75 0A 8B 06 8B 10 6A ...G.....u.....j
0041D3D0 01 8B CE FF D2 8B C7 8B 4C 24 48 64 89 0D 00 00 ........L$Hd....
0041D3E0 00 00 59 5F 5E 83 C4 48 C2 08 00 CC CC CC CC CC ..Y_^..H........
0041D3F0 6A FF 68 1A F6 82 00 64 A1 00 00 00 00 50 83 EC j.h....d.....P..
0041D400 3C 56 57 A1 88 41 A1 00 33 C4 50 8D 44 24 48 64 <VW..A..3.P.D$Hd
0041D410 A3 00 00 00 00 8B F1 81 7E 14 00 00 00 30 75 31 ........~....0u1
0041D420 83 7E 0C 0C 75 2B 8B 76 10 8B 0E 8B 44 24 58 89 .~..u+.v....D$X.
0041D430 08 8B 56 04 89 50 04 8B 4E 08 89 48 08 8B 4C 24 ..V..P..N..H..L$
0041D440 48 64 89 0D 00 00 00 00 59 5F 5E 83 C4 48 C2 08 Hd......Y_^..H..
0041D450 00 8D 54 24 0C 52 E8 A5 F5 FF FF 8D 44 24 30 50 ..T$.R......D$0P
0041D460 C7 44 24 58 00 00 00 00 E8 33 0A FF FF 83 C4 08 .D$X.....3......
0041D470 8B 16 8B 52 58 6A 00 50 8D 44 24 18 50 8B CE C6 ...RXj.P.D$.P...
0041D480 44 24 5C 01 FF D2 8B 74 24 0C 8B 16 50 8B 82 8C D$\....t$...P...
0041D490 00 00 00 8B CE C6 44 24 54 02 FF D0 8D 4C 24 10 ......D$T....L$.
0041D4A0 C6 44 24 50 01 FF 15 38 43 8A 00 8D 4C 24 2C C6 .D$P...8C...L$,.
0041D4B0 44 24 50 00 FF 15 38 43 8A 00 8B 44 24 5C 8B 16 D$P...8C...D$\..
0041D4C0 8B 7C 24 58 8B 52 64 50 57 8B CE FF D2 8B CE C7 .|$X.RdPW.......
0041D4D0 44 24 50 FF FF FF FF E8 04 46 FE FF 83 F8 01 75 D$P......F.....u
0041D4E0 0A 8B 06 8B 10 6A 01 8B CE FF D2 8B C7 8B 4C 24 .....j........L$
0041D4F0 48 64 89 0D 00 00 00 00 59 5F 5E 83 C4 48 C2 08 Hd......Y_^..H..
0041D500 00 CC CC CC CC CC CC CC CC CC CC CC CC CC CC CC ................
0041D510 6A FF 68 5A F6 82 00 64 A1 00 00 00 00 50 83 EC j.hZ...d.....P..
0041D520 3C 56 57 A1 88 41 A1 00 33 C4 50 8D 44 24 48 64 <VW..A..3.P.D$Hd
0041D530 A3 00 00 00 00 8B F1 81 7E 14 00 00 00 30 75 37 ........~....0u7
0041D540 83 7E 0C 10 75 31 8B 76 10 8B 0E 8B 44 24 58 89 .~..u1.v....D$X.
0041D550 08 8B 56 04 89 50 04 8B 4E 08 89 48 08 8B 56 0C ..V..P..N..H..V.
0041D560 89 50 0C 8B 4C 24 48 64 89 0D 00 00 00 00 59 5F .P..L$Hd......Y_
0041D570 5E 83 C4 48 C2 08 00 8D 44 24 0C 50 E8 7F F4 FF ^..H....D$.P....
0041D580 FF 8D 4C 24 30 51 C7 44 24 58 00 00 00 00 E8 0D ..L$0Q.D$X......
0041D590 09 FF FF 83 C4 08 8B 16 8B 52 58 6A 00 50 8D 44 .........RXj.P.D
0041D5A0 24 18 50 8B CE C6 44 24 5C 01 FF D2 8B 74 24 0C $.P...D$\....t$.
0041D5B0 8B 16 50 8B 82 8C 00 00 00 8B CE C6 44 24 54 02 ..P.........D$T.
0041D5C0 FF D0 8D 4C 24 10 C6 44 24 50 01 FF 15 38 43 8A ...L$..D$P...8C.
0041D5D0 00 8D 4C 24 2C C6 44 24 50 00 FF 15 38 43 8A 00 ..L$,.D$P...8C..
0041D5E0 8B 44 24 5C 8B 16 8B 7C 24 58 8B 52 68 50 57 8B .D$\...|$X.RhPW.
0041D5F0 CE FF D2 8B CE C7 44 24 50 FF FF FF FF E8 DE 44 ......D$P......D
0041D600 FE FF 83 F8 01 75 0A 8B 06 8B 10 6A 01 8B CE FF .....u.....j....
0041D610 D2 8B C7 8B 4C 24 48 64 89 0D 00 00 00 00 59 5F ....L$Hd......Y_
0041D620 5E 83 C4 48 C2 08 00 CC CC CC CC CC CC CC CC CC ^..H............
0041D630 6A FF 68 CF F6 82 00 64 A1 00 00 00 00 50 83 EC j.h....d.....P..
0041D640 64 A1 88 41 A1 00 33 C4 89 44 24 60 53 55 56 57 d..A..3..D$`SUVW
0041D650 A1 88 41 A1 00 33 C4 50 8D 44 24 78 64 A3 00 00 ..A..3.P.D$xd...
0041D660 00 00 8B BC 24 88 00 00 00 8B AC 24 8C 00 00 00 ....$......$....
0041D670 8B F1 C7 44 24 14 00 00 00 00 8B 46 14 3D 00 00 ...D$......F.=..
0041D680 00 50 89 7C 24 1C 75 15 8B 46 0C 8B 4E 10 50 51 .P.|$.u..F..N.PQ
0041D690 8B CF FF 15 40 44 8A 00 E9 A4 01 00 00 3D 00 00 ....@D.......=..
0041D6A0 00 10 75 18 83 7E 0C 00 75 12 68 8F 69 8A 00 8B ..u..~..u.h.i...
0041D6B0 CF FF 15 34 43 8A 00 E9 85 01 00 00 3D 00 00 00 ...4C.......=...
0041D6C0 20 74 0B 3D 00 00 00 40 0F 85 B9 00 00 00 8D 4C  t.=...@.......L
0041D6D0 24 58 FF 15 B0 43 8A 00 8D 54 24 3C 52 C7 84 24 $X...C...T$<R..$
0041D6E0 84 00 00 00 01 00 00 00 E8 B3 07 FF FF 83 C4 04 ................
0041D6F0 8B 16 8B 52 58 6A 00 50 8D 44 24 28 50 8B CE C6 ...RXj.P.D$(P...
0041D700 84 24 8C 00 00 00 02 FF D2 8D 4C 24 58 51 50 C6 .$........L$XQP.
0041D710 84 24 88 00 00 00 03 E8 64 2A 20 00 83 C4 08 8D .$......d* .....
0041D720 4C 24 20 8A D8 C6 84 24 80 00 00 00 02 FF 15 38 L$ ....$.......8
0041D730 43 8A 00 8D 4C 24 3C C6 84 24 80 00 00 00 01 FF C...L$<..$......
0041D740 15 38 43 8A 00 84 DB 74 2C 8D 54 24 58 52 8B CF .8C....t,.T$XR..
0041D750 FF 15 3C 43 8A 00 8D 4C 24 58 C7 44 24 14 01 00 ..<C...L$X.D$...
0041D760 00 00 C6 84 24 80 00 00 00 00 FF 15 38 43 8A 00 ....$.......8C..
0041D770 E9 CC 00 00 00 8D 4C 24 58 C6 84 24 80 00 00 00 ......L$X..$....
0041D780 00 FF 15 38 43 8A 00 8B 46 08 8B 4E 14 50 51 68 ...8C...F..N.PQh
0041D790 E0 83 8A 00 E8 E7 34 10 00 8D 54 24 24 52 E8 5D ......4...T$$R.]
0041D7A0 F2 FF FF 8D 44 24 30 50 C7 84 24 94 00 00 00 04 ....D$0P..$.....
0041D7B0 00 00 00 E8 E8 06 FF FF 83 C4 14 8B 16 8B 52 58 ..............RX
0041D7C0 6A 00 50 8D 44 24 44 B3 05 50 8B CE 88 9C 24 8C j.P.D$D..P....$.
0041D7D0 00 00 00 FF D2 8B 74 24 18 8B 16 50 8B 82 8C 00 ......t$...P....
0041D7E0 00 00 8B CE C6 84 24 84 00 00 00 06 FF D0 8D 4C ......$........L
0041D7F0 24 3C 88 9C 24 80 00 00 00 FF 15 38 43 8A 00 8D $<..$......8C...
0041D800 4C 24 20 C6 84 24 80 00 00 00 04 FF 15 38 43 8A L$ ..$.......8C.
0041D810 00 8B 16 8B 42 74 55 57 8B CE FF D0 8B CE C7 44 ....BtUW.......D
0041D820 24 14 01 00 00 00 C6 84 24 80 00 00 00 00 E8 AD $.......$.......
0041D830 42 FE FF 83 F8 01 75 09 8B 16 50 8B 02 8B CE FF B.....u...P.....
0041D840 D0 8B C7 8B 4C 24 78 64 89 0D 00 00 00 00 59 5F ....L$xd......Y_
0041D850 5E 5D 5B 8B 4C 24 60 33 CC E8 30 73 27 00 83 C4 ^][.L$`3..0s'...
0041D860 70 C2 08 00 CC CC CC CC CC CC CC CC CC CC CC CC p...............
0041D870 83 EC 08 56 8B F1 83 7E 08 00 57 75 21 8B 44 24 ...V...~..Wu!.D$
0041D880 1C 8B 4E 04 8B 7C 24 14 50 51 6A 01 57 8B CE E8 ..N..|$.PQj.W...
0041D890 3C EA FF FF 8B C7 5F 5E 83 C4 08 C2 0C 00 8B 46 <....._^.......F
0041D8A0 04 8B 7C 24 1C 53 8B 5C 24 1C 3B 18 55 75 32 8D ..|$.S.\$.;.Uu2.
0041D8B0 53 0C 52 57 FF 15 0C 44 8A 00 83 C4 08 84 C0 0F S.RW...D........
0041D8C0 84 3A 01 00 00 57 8B 7C 24 20 53 6A 01 57 8B CE .:...W.|$ Sj.W..
0041D8D0 E8 FB E9 FF FF 5D 5B 8B C7 5F 5E 83 C4 08 C2 0C .....][.._^.....
0041D8E0 00 3B D8 75 3B 8B 40 08 83 C0 0C 57 50 FF 15 0C .;.u;.@....WP...
0041D8F0 44 8A 00 83 C4 08 84 C0 0F 84 01 01 00 00 8B 46 D..............F
0041D900 04 8B 48 08 57 8B 7C 24 20 51 6A 00 57 8B CE E8 ..H.W.|$ Qj.W...
0041D910 BC E9 FF FF 5D 5B 8B C7 5F 5E 83 C4 08 C2 0C 00 ....][.._^......
0041D920 8D 43 0C 50 57 FF 15 0C 44 8A 00 83 C4 08 84 C0 .C.PW...D.......
0041D930 74 5B 8D 4C 24 24 89 5C 24 24 E8 81 7F 1D 00 8B t[.L$$.\$$......
0041D940 6C 24 24 57 8D 55 0C 52 8B CE E8 81 7C FE FF 84 l$$W.U.R....|...
0041D950 C0 74 3A 8B 45 08 80 78 2D 00 57 8B 7C 24 20 8B .t:.E..x-.W.|$ .
0041D960 CE 74 15 55 6A 00 57 E8 64 E9 FF FF 5D 5B 8B C7 .t.Uj.W.d...][..
0041D970 5F 5E 83 C4 08 C2 0C 00 53 6A 01 57 E8 4F E9 FF _^......Sj.W.O..
0041D980 FF 5D 5B 8B C7 5F 5E 83 C4 08 C2 0C 00 8D 43 0C .][.._^.......C.
0041D990 57 50 FF 15 0C 44 8A 00 83 C4 08 84 C0 74 60 8D WP...D.......t`.
0041D9A0 4C 24 24 89 5C 24 24 E8 14 35 19 00 8B 6C 24 24 L$$.\$$..5...l$$
0041D9B0 3B 6E 04 74 10 8D 4D 0C 51 57 8B CE E8 0F 7C FE ;n.t..M.QW....|.
0041D9C0 FF 84 C0 74 3A 8B 53 08 80 7A 2D 00 57 8B 7C 24 ...t:.S..z-.W.|$
0041D9D0 20 8B CE 74 15 53 6A 00 57 E8 F2 E8 FF FF 5D 5B  ..t.Sj.W.....][
0041D9E0 8B C7 5F 5E 83 C4 08 C2 0C 00 55 6A 01 57 E8 DD .._^......Uj.W..
0041D9F0 E8 FF FF 5D 5B 8B C7 5F 5E 83 C4 08 C2 0C 00 57 ...][.._^......W
0041DA00 8D 44 24 14 50 8B CE E8 64 EC FF FF 8B 08 8B 44 .D$.P...d......D
0041DA10 24 1C 5D 5B 5F 89 08 5E 83 C4 08 C2 0C 00 CC CC $.][_..^........

;; fn0041DA20: 0041DA20
;;   Called from:
;;     0041E2C2 (in fn0041E260)
;;     00623F6C (in fn00623E00)
fn0041DA20 proc
	mov	eax,[esp+0Ch]
	push	ebx
	push	esi
	mov	esi,ecx
	mov	ecx,[eax]
	mov	[esp+14h],ecx
	mov	ecx,[esi+4h]
	test	ecx,ecx
	push	edi
	jnz	41DA3Ah

l0041DA36:
	xor	edi,edi
	jmp	41DA42h

l0041DA3A:
	mov	edi,[esi+0Ch]
	sub	edi,ecx
	sar	edi,2h

l0041DA42:
	mov	ebx,[esp+14h]
	test	ebx,ebx
	jz	41DBCFh

l0041DA4E:
	test	ecx,ecx
	jnz	41DA56h

l0041DA52:
	xor	eax,eax
	jmp	41DA5Eh

l0041DA56:
	mov	eax,[esi+8h]
	sub	eax,ecx
	sar	eax,2h

l0041DA5E:
	mov	edx,3FFFFFFFh
	sub	edx,eax
	cmp	edx,ebx
	jnc	41DA6Eh

l0041DA69:
	call	41BB30h

l0041DA6E:
	test	ecx,ecx
	jnz	41DA76h

l0041DA72:
	xor	eax,eax
	jmp	41DA7Eh

l0041DA76:
	mov	eax,[esi+8h]
	sub	eax,ecx
	sar	eax,2h

l0041DA7E:
	add	eax,ebx
	cmp	edi,eax
	push	ebp
	jnc	41DB3Dh

l0041DA89:
	mov	eax,edi
	shr	eax,1h
	mov	edx,3FFFFFFFh
	sub	edx,eax
	cmp	edx,edi
	jnc	41DA9Ch

l0041DA98:
	xor	edi,edi
	jmp	41DA9Eh

l0041DA9C:
	add	edi,eax

l0041DA9E:
	test	ecx,ecx
	jnz	41DAA6h

l0041DAA2:
	xor	eax,eax
	jmp	41DAAEh

l0041DAA6:
	mov	eax,[esi+8h]
	sub	eax,ecx
	sar	eax,2h

l0041DAAE:
	add	eax,ebx
	cmp	edi,eax
	jnc	41DAC6h

l0041DAB4:
	test	ecx,ecx
	jnz	41DABCh

l0041DAB8:
	xor	edi,edi
	jmp	41DAC4h

l0041DABC:
	mov	edi,[esi+8h]
	sub	edi,ecx
	sar	edi,2h

l0041DAC4:
	add	edi,ebx

l0041DAC6:
	push	0h
	push	edi
	call	7B2480h
	mov	ecx,[esi+4h]
	add	esp,8h
	mov	ebp,eax
	mov	eax,[esp+14h]
	push	ebp
	push	eax
	push	ecx
	mov	ecx,esi
	call	7B2800h
	lea	edx,[esp+1Ch]
	push	edx
	push	ebx
	push	eax
	mov	ecx,esi
	call	669E20h
	mov	ecx,[esp+14h]
	push	eax
	mov	eax,[esi+8h]
	push	eax
	push	ecx
	mov	ecx,esi
	call	7B2800h
	mov	eax,[esi+4h]
	test	eax,eax
	jnz	41DB0Eh

l0041DB0A:
	xor	ecx,ecx
	jmp	41DB16h

l0041DB0E:
	mov	ecx,[esi+8h]
	sub	ecx,eax
	sar	ecx,2h

l0041DB16:
	add	ebx,ecx
	test	eax,eax
	jz	41DB25h

l0041DB1C:
	push	eax
	call	694FC6h
	add	esp,4h

l0041DB25:
	lea	edx,[ebp+edi*4+0h]
	lea	eax,[ebp+ebx*4+0h]
	mov	[esi+4h],ebp
	pop	ebp
	pop	edi
	mov	[esi+0Ch],edx
	mov	[esi+8h],eax
	pop	esi
	pop	ebx
	ret	0Ch

l0041DB3D:
	mov	ebp,[esi+8h]
	mov	edi,[esp+14h]
	mov	ecx,ebp
	sub	ecx,edi
	sar	ecx,2h
	lea	eax,[0000h+ebx*4]
	cmp	ecx,ebx
	mov	[esp+14h],eax
	mov	ecx,esi
	jnc	41DBA2h

l0041DB5C:
	add	eax,edi
	push	eax
	push	ebp
	push	edi
	call	7B2800h
	mov	eax,[esi+8h]
	mov	ecx,eax
	sub	ecx,edi
	sar	ecx,2h
	lea	edx,[esp+1Ch]
	push	edx
	sub	ebx,ecx
	push	ebx
	push	eax
	mov	ecx,esi
	call	669E20h
	mov	eax,[esp+14h]
	add	[esi+8h],eax
	mov	esi,[esi+8h]
	lea	edx,[esp+1Ch]
	push	edx
	sub	esi,eax
	push	esi
	push	edi
	call	4B3770h
	add	esp,0Ch
	pop	ebp
	pop	edi
	pop	esi
	pop	ebx
	ret	0Ch

l0041DBA2:
	push	ebp
	mov	ebx,ebp
	sub	ebx,eax
	push	ebp
	push	ebx
	call	7B2800h
	push	ebp
	push	ebx
	push	edi
	mov	[esi+8h],eax
	call	50AAA0h
	mov	ecx,[esp+20h]
	lea	eax,[esp+28h]
	push	eax
	add	ecx,edi
	push	ecx
	push	edi
	call	4B3770h
	add	esp,18h
	pop	ebp

l0041DBCF:
	pop	edi
	pop	esi
	pop	ebx
	ret	0Ch
0041DBD5                CC CC CC CC CC CC CC CC CC CC CC      ...........

;; fn0041DBE0: 0041DBE0
;;   Called from:
;;     00417BF0 (in fn00417BC0)
;;     0041DF50 (in fn0041DF20)
fn0041DBE0 proc
	push	esi
	mov	esi,ecx
	mov	eax,[esi+10h]
	push	0FFh
	push	eax
	call	dword ptr [8A40F4h]
	mov	byte ptr [esi+14h],1h
	mov	edx,[esi+4h]
	test	edx,edx
	jz	41DC39h

l0041DBFA:
	mov	ecx,[esi+8h]
	mov	eax,ecx
	sub	eax,edx
	sar	eax,3h
	jz	41DC39h

l0041DC06:
	test	eax,eax
	mov	edx,[ecx-8h]
	push	edi
	mov	edi,[ecx-4h]
	jz	41DC17h

l0041DC11:
	add	ecx,0F8h
	mov	[esi+8h],ecx

l0041DC17:
	mov	eax,[esp+0Ch]
	mov	ecx,[eax]
	mov	[edi],ecx
	mov	[eax],edx
	mov	edx,[esi+10h]
	mov	edi,[esi+18h]
	push	edx
	mov	byte ptr [esi+14h],0h
	call	dword ptr [8A40F0h]
	mov	eax,edi
	pop	edi
	pop	esi
	ret	4h

l0041DC39:
	mov	eax,[esi+10h]
	push	eax
	mov	byte ptr [esi+14h],0h
	call	dword ptr [8A40F0h]
	xor	eax,eax
	pop	esi
	ret	4h
0041DC4D                                        CC CC CC              ...

;; fn0041DC50: 0041DC50
;;   Called from:
;;     0041EADF (in fn0041EA60)
fn0041DC50 proc
	push	0FFh
	push	82F71Ch
	mov	eax,fs:[0000h]
	push	eax
	push	ecx
	push	esi
	push	edi
	mov	eax,[0A14188h]
	xor	eax,esp
	push	eax
	lea	eax,[esp+10h]
	mov	fs:[0000h],eax
	mov	esi,ecx
	mov	[esp+0Ch],esi
	xor	edi,edi
	mov	[esp+18h],edi
	mov	[esi+4h],edi
	mov	eax,[esp+20h]
	push	eax
	lea	ecx,[esi+8h]
	mov	byte ptr [esp+1Ch],1h
	mov	dword ptr [esi],8A8410h
	call	dword ptr [8A433Ch]
	mov	ecx,[esp+24h]
	cmp	ecx,edi
	mov	[esi+28h],edi
	mov	[esi+2Ch],edi
	mov	[esi+30h],edi
	mov	[esi+34h],ecx
	jz	41DCB3h

l0041DCAF:
	add	dword ptr [ecx+4h],1h

l0041DCB3:
	or	eax,0FFh
	cmp	ecx,edi
	mov	[esp+18h],eax
	jz	41DCCBh

l0041DCBE:
	add	[ecx+4h],eax
	jnz	41DCCBh

l0041DCC3:
	mov	edx,[ecx]
	mov	eax,[edx]
	push	1h
	call	eax

l0041DCCB:
	mov	eax,esi
	mov	ecx,[esp+10h]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	add	esp,10h
	ret	8h
0041DCE1    CC CC CC CC CC CC CC CC CC CC CC CC CC CC CC  ...............
0041DCF0 6A FF 68 5F F7 82 00 64 A1 00 00 00 00 50 51 53 j.h_...d.....PQS
0041DD00 56 A1 88 41 A1 00 33 C4 50 8D 44 24 10 64 A3 00 V..A..3.P.D$.d..
0041DD10 00 00 00 8B F1 89 74 24 0C 8B 4E 34 33 DB 3B CB ......t$..N43.;.
0041DD20 C7 44 24 18 02 00 00 00 74 0E 83 41 04 FF 75 08 .D$.....t..A..u.
0041DD30 8B 01 8B 10 6A 01 FF D2 89 5E 34 8B 46 28 3B C3 ....j....^4.F(;.
0041DD40 74 09 50 E8 7E 72 27 00 83 C4 04 8D 4E 08 89 5E t.P.~r'.....N..^
0041DD50 28 89 5E 2C 89 5E 30 88 5C 24 18 FF 15 38 43 8A (.^,.^0.\$...8C.
0041DD60 00 C7 06 78 6D 8A 00 8B 4C 24 10 64 89 0D 00 00 ...xm...L$.d....
0041DD70 00 00 59 5E 5B 83 C4 10 C3 CC CC CC CC CC CC CC ..Y^[...........
0041DD80 56 8B F1 E8 68 FF FF FF F6 44 24 08 01 74 09 56 V...h....D$..t.V
0041DD90 E8 31 72 27 00 83 C4 04 8B C6 5E C2 04 00 CC CC .1r'......^.....
0041DDA0 6A FF 68 88 F7 82 00 64 A1 00 00 00 00 50 83 EC j.h....d.....P..
0041DDB0 20 53 56 57 A1 88 41 A1 00 33 C4 50 8D 44 24 30  SVW..A..3.P.D$0
0041DDC0 64 A3 00 00 00 00 8B F1 8B 5C 24 40 53 E8 BE 31 d........\$@S..1
0041DDD0 19 00 8B F8 3B 7E 04 74 12 8D 47 0C 50 53 FF 15 ....;~.t..G.PS..
0041DDE0 0C 44 8A 00 83 C4 08 84 C0 74 53 53 8D 4C 24 14 .D.......tSS.L$.
0041DDF0 FF 15 3C 43 8A 00 33 C0 89 44 24 2C 8D 4C 24 10 ..<C..3..D$,.L$.
0041DE00 51 57 8D 54 24 48 52 8B CE 89 44 24 44 E8 5E FA QW.T$HR...D$D.^.
0041DE10 FF FF 8B 30 8D 4C 24 10 C7 44 24 38 FF FF FF FF ...0.L$..D$8....
0041DE20 FF 15 38 43 8A 00 8D 46 28 8B 4C 24 30 64 89 0D ..8C...F(.L$0d..
0041DE30 00 00 00 00 59 5F 5E 5B 83 C4 2C C2 04 00 8D 47 ....Y_^[..,....G
0041DE40 28 8B 4C 24 30 64 89 0D 00 00 00 00 59 5F 5E 5B (.L$0d......Y_^[
0041DE50 83 C4 2C C2 04 00 CC CC CC CC CC CC CC CC CC CC ..,.............
0041DE60 53 8B 5C 24 10 56 8B 74 24 10 57 8B F9 8B 47 04 S.\$.V.t$.W...G.
0041DE70 3B 30 75 36 3B D8 75 32 8B 40 04 50 E8 7F B7 20 ;0u6;.u2.@.P... 
0041DE80 00 8B 47 04 89 40 04 8B 47 04 C7 47 08 00 00 00 ..G..@..G..G....
0041DE90 00 89 00 8B 47 04 89 40 08 8B 4F 04 8B 11 8B 44 ....G..@..O....D
0041DEA0 24 10 5F 5E 89 10 5B C2 0C 00 3B F3 74 5A 8B FF $._^..[...;.tZ..
0041DEB0 80 7E 2D 00 8B CE 75 3F 8B 46 08 80 78 2D 00 75 .~-...u?.F..x-.u
0041DEC0 1B 8B F0 8B 06 80 78 2D 00 75 2C EB 03 8D 49 00 ......x-.u,...I.
0041DED0 8B F0 8B 06 80 78 2D 00 74 F6 EB 1B 8B 46 04 80 .....x-.t....F..
0041DEE0 78 2D 00 75 10 3B 70 08 75 0B 8B F0 8B 40 04 80 x-.u.;p.u....@..
0041DEF0 78 2D 00 74 F0 8B F0 51 8D 44 24 18 50 8B CF E8 x-.t...Q.D$.P...
0041DF00 4C E8 FF FF 3B F3 75 A8 8B 44 24 10 5F 89 30 5E L...;.u..D$._.0^
0041DF10 5B C2 0C 00 CC CC CC CC CC CC CC CC CC CC CC CC [...............

;; fn0041DF20: 0041DF20
;;   Called from:
;;     0041E6EC (in fn0041E670)
fn0041DF20 proc
	push	esi
	mov	esi,[esp+8h]
	cmp	dword ptr [esi],0h
	push	edi
	mov	edi,ecx
	jz	41DF3Fh

l0041DF2D:
	mov	eax,[esp+10h]
	add	dword ptr [eax],0FFh
	mov	eax,[esi]
	mov	ecx,[eax]
	pop	edi
	mov	[esi],ecx
	pop	esi
	ret	10h

l0041DF3F:
	push	ebx
	mov	ebx,[esp+1Ch]
	push	ebp
	mov	ebp,[esp+1Ch]
	cmp	dword ptr [ebp+0h],0h
	jnz	41DF90h

l0041DF4F:
	push	esi
	call	41DBE0h
	mov	ecx,[esp+18h]
	add	[ecx],eax
	cmp	dword ptr [esi],0h
	mov	eax,[ecx]
	jz	41DF74h

l0041DF62:
	add	eax,0FFh
	mov	[ecx],eax
	mov	eax,[esi]
	mov	edx,[eax]
	pop	ebp
	pop	ebx
	pop	edi
	mov	[esi],edx
	pop	esi
	ret	10h

l0041DF74:
	mov	eax,[edi+1Ch]
	lea	eax,[eax+eax*8]
	add	eax,eax
	add	eax,eax
	push	eax
	call	694B89h
	mov	[ebp+0h],eax
	add	esp,4h
	mov	dword ptr [ebx],0h

l0041DF90:
	mov	ecx,[ebx]
	mov	eax,[ebp+0h]
	lea	edx,[ecx+ecx*8]
	add	ecx,1h
	mov	[ebx],ecx
	cmp	ecx,[edi+1Ch]
	lea	eax,[eax+edx*4]
	jnz	41DFACh

l0041DFA5:
	mov	dword ptr [ebp+0h],0h

l0041DFAC:
	pop	ebp
	pop	ebx
	pop	edi
	pop	esi
	ret	10h
0041DFB3          CC CC CC CC CC CC CC CC CC CC CC CC CC    .............
0041DFC0 55 8B EC 6A FF 68 B0 F7 82 00 64 A1 00 00 00 00 U..j.h....d.....
0041DFD0 50 83 EC 10 53 56 57 A1 88 41 A1 00 33 C5 50 8D P...SVW..A..3.P.
0041DFE0 45 F4 64 A3 00 00 00 00 89 65 F0 8B F1 8B 45 10 E.d......e....E.
0041DFF0 8B 08 8B 50 04 8B 46 04 85 C0 89 4D E4 89 55 E8 ...P..F....M..U.
0041E000 75 04 33 FF EB 08 8B 7E 0C 2B F8 C1 FF 03 8B 55 u.3....~.+.....U
0041E010 0C 85 D2 0F 84 E9 01 00 00 85 C0 75 04 33 C9 EB ...........u.3..
0041E020 08 8B 4E 08 2B C8 C1 F9 03 BB FF FF FF 1F 2B D9 ..N.+.........+.
0041E030 3B DA 73 05 E8 57 DB FF FF 85 C0 75 04 33 C9 EB ;.s..W.....u.3..
0041E040 08 8B 4E 08 2B C8 C1 F9 03 03 CA 3B F9 0F 83 FC ..N.+......;....
0041E050 00 00 00 8B CF D1 E9 BB FF FF FF 1F 2B D9 3B DF ............+.;.
0041E060 73 04 33 FF EB 02 03 F9 85 C0 75 04 33 C9 EB 08 s.3.......u.3...
0041E070 8B 4E 08 2B C8 C1 F9 03 03 CA 3B F9 73 13 85 C0 .N.+......;.s...
0041E080 75 04 33 C9 EB 08 8B 4E 08 2B C8 C1 F9 03 8D 3C u.3....N.+.....<
0041E090 11 6A 00 57 E8 77 B3 1B 00 8B 55 0C C6 45 10 00 .j.W.w....U..E..
0041E0A0 8B 4D 10 51 8B 4D 08 52 8B D8 8B 46 04 56 53 51 .M.Q.M.R...F.VSQ
0041E0B0 50 89 5D EC C7 45 FC 00 00 00 00 E8 C0 5F 1F 00 P.]..E......._..
0041E0C0 8B 4D 0C 83 C4 20 8D 55 E4 52 51 50 8B CE E8 2D .M... .U.RQP...-
0041E0D0 D6 19 00 8B 4E 08 C6 45 10 00 8B 55 10 52 8B 55 ....N..E...U.R.U
0041E0E0 0C 52 56 50 8B 45 08 51 50 E8 92 5F 1F 00 8B 4E .RVP.E.QP.._...N
0041E0F0 04 83 C4 18 85 C9 75 04 33 C0 EB 08 8B 46 08 2B ......u.3....F.+
0041E100 C1 C1 F8 03 01 45 0C 85 C9 74 09 51 E8 B5 6E 27 .....E...t.Q..n'
0041E110 00 83 C4 04 8B 55 0C 8D 0C FB 8D 04 D3 89 4E 0C .....U........N.
0041E120 89 46 08 89 5E 04 8B 4D F4 64 89 0D 00 00 00 00 .F..^..M.d......
0041E130 59 5F 5E 5B 8B E5 5D C2 0C 00 8B 4D EC 51 E8 83 Y_^[..]....M.Q..
0041E140 6E 27 00 83 C4 04 6A 00 6A 00 E8 7D 6E 27 00 8B n'....j.j..}n'..
0041E150 5E 08 8B 7D 08 8B C3 2B C7 C1 F8 03 3B C2 73 66 ^..}...+....;.sf
0041E160 8D 04 D5 00 00 00 00 89 45 08 03 C7 50 53 57 8B ........E...PSW.
0041E170 CE E8 4A 99 FF FF 8B 46 08 8B D0 8D 4D E4 51 8B ..J....F....M.Q.
0041E180 4D 0C 2B D7 C1 FA 03 2B CA 51 50 8B CE C7 45 FC M.+....+.QP...E.
0041E190 02 00 00 00 E8 67 D5 19 00 8B 45 08 01 46 08 8B .....g....E..F..
0041E1A0 76 08 8D 4D E4 51 2B F0 56 57 E8 F1 84 FF FF 83 v..M.Q+.VW......
0041E1B0 C4 0C 8B 4D F4 64 89 0D 00 00 00 00 59 5F 5E 5B ...M.d......Y_^[
0041E1C0 8B E5 5D C2 0C 00 8D 0C D5 00 00 00 00 53 8B C3 ..]..........S..
0041E1D0 2B C1 53 89 4D 08 50 8B CE 89 45 0C E8 DF 98 FF +.S.M.P...E.....
0041E1E0 FF 8B 55 0C 53 52 57 89 46 08 E8 B1 5F 24 00 8B ..U.SRW.F..._$..
0041E1F0 4D 08 8D 45 E4 50 03 CF 51 57 E8 A1 84 FF FF 83 M..E.P..QW......
0041E200 C4 18 8B 4D F4 64 89 0D 00 00 00 00 59 5F 5E 5B ...M.d......Y_^[
0041E210 8B E5 5D C2 0C 00 CC CC CC CC CC CC CC CC CC CC ..].............
0041E220 64 8B 0D 2C 00 00 00 A1 F4 B0 A6 00 8B 04 81 8D d..,............
0041E230 90 38 00 00 00 52 8D 88 34 00 00 00 51 8D 90 30 .8...R..4...Q..0
0041E240 00 00 00 52 8D 80 2C 00 00 00 50 B9 6C 3F A5 00 ...R..,...P.l?..
0041E250 E8 CB FC FF FF C3 CC CC CC CC CC CC CC CC CC CC ................

;; fn0041E260: 0041E260
;;   Called from:
;;     0041E6B4 (in fn0041E670)
fn0041E260 proc
	mov	eax,[esp+8h]
	push	ebx
	push	ebp
	mov	ebp,[esp+0Ch]
	push	esi
	push	edi
	lea	ebx,[eax+ebp]
	cmp	ebp,ebx
	mov	edi,ebp
	mov	esi,ecx
	mov	[esp+14h],edi
	jz	41E2E4h

l0041E27B:
	jmp	41E280h
0041E27D                                        8D 49 00              .I.

l0041E280:
	cmp	byte ptr [edi],0h
	jz	41E2E0h

l0041E285:
	mov	edx,[esi+4h]
	test	edx,edx
	jnz	41E290h

l0041E28C:
	xor	ecx,ecx
	jmp	41E298h

l0041E290:
	mov	ecx,[esi+8h]
	sub	ecx,edx
	sar	ecx,2h

l0041E298:
	test	edx,edx
	jz	41E2B5h

l0041E29C:
	mov	eax,[esi+0Ch]
	sub	eax,edx
	sar	eax,2h
	cmp	ecx,eax
	jnc	41E2B5h

l0041E2A8:
	mov	eax,[esi+8h]
	mov	[eax],edi
	add	eax,4h
	mov	[esi+8h],eax
	jmp	41E2C7h

l0041E2B5:
	mov	eax,[esi+8h]
	lea	ecx,[esp+14h]
	push	ecx
	push	1h
	push	eax
	mov	ecx,esi
	call	41DA20h

l0041E2C7:
	mov	dl,[edi]
	add	edi,1h
	test	dl,dl
	mov	[esp+14h],edi
	jz	41E2DAh

l0041E2D4:
	cmp	edi,ebx
	jnz	41E2C7h

l0041E2D8:
	jmp	41E2E4h

l0041E2DA:
	cmp	edi,ebx
	jnz	41E280h

l0041E2DE:
	jmp	41E2E4h

l0041E2E0:
	cmp	edi,ebx
	jnz	41E32Bh

l0041E2E4:
	push	8A8414h
	call	520C80h
	mov	ecx,[esi+8h]
	mov	edi,[esi+4h]
	add	esp,4h
	cmp	edi,ecx
	jz	41E320h

l0041E2FB:
	mov	eax,ecx
	sub	eax,ecx
	sar	eax,2h
	test	eax,eax
	lea	edx,[0000h+eax*4]
	lea	ebx,[edx+edi]
	jle	41E31Dh

l0041E310:
	push	edx
	push	ecx
	push	edx
	push	edi
	call	dword ptr [8A465Ch]
	add	esp,10h

l0041E31D:
	mov	[esi+8h],ebx

l0041E320:
	mov	eax,[esp+18h]
	pop	edi
	pop	esi
	pop	ebp
	pop	ebx
	ret	8h

l0041E32B:
	add	edi,1h
	mov	eax,edi
	pop	edi
	pop	esi
	sub	eax,ebp
	pop	ebp
	pop	ebx
	ret	8h
0041E339                            CC CC CC CC CC CC CC          .......
0041E340 51 56 8B F1 8B 56 04 85 D2 75 04 33 C9 EB 08 8B QV...V...u.3....
0041E350 4E 08 2B CA C1 F9 03 85 D2 74 3C 8B 46 0C 2B C2 N.+......t<.F.+.
0041E360 C1 F8 03 3B C8 73 30 8B 4C 24 0C 8B 54 24 0C 57 ...;.s0.L$..T$.W
0041E370 8B 7E 08 C6 44 24 08 00 8B 44 24 08 50 51 56 52 .~..D$...D$.PQVR
0041E380 6A 01 57 E8 E8 49 3A 00 83 C4 18 83 C7 08 89 7E j.W..I:........~
0041E390 08 5F 5E 59 C2 04 00 8B 4C 24 0C 8B 46 08 51 6A ._^Y....L$..F.Qj
0041E3A0 01 50 8B CE E8 17 FC FF FF 5E 59 C2 04 00 CC CC .P.......^Y.....
0041E3B0 51 56 8B F1 8B 46 04 8B 08 50 51 8D 44 24 0C 50 QV...F...PQ.D$.P
0041E3C0 8B CE E8 99 FA FF FF 8B 4E 04 51 E8 F6 6B 27 00 ........N.Q..k'.
0041E3D0 83 C4 04 33 C0 89 46 04 89 46 08 5E 59 C3 CC CC ...3..F..F.^Y...
0041E3E0 6A FF 68 D8 F7 82 00 64 A1 00 00 00 00 50 83 EC j.h....d.....P..
0041E3F0 08 53 55 56 57 A1 88 41 A1 00 33 C4 50 8D 44 24 .SUVW..A..3.P.D$
0041E400 1C 64 A3 00 00 00 00 8B E9 8B 5C 24 2C 8B 33 85 .d........\$,.3.
0041E410 F6 8B 4D 18 8B C1 74 13 83 E8 01 85 C0 7E 08 8B ..M...t......~..
0041E420 36 85 F6 75 F3 EB 04 85 F6 75 13 50 51 68 68 7B 6..u.....u.PQhh{
0041E430 8A 00 E8 49 28 10 00 83 C4 0C 33 C0 EB 4B 8B 45 ...I(.....3..K.E
0041E440 10 8D 7D 10 6A FF 50 89 7C 24 34 FF 15 F4 40 8A ..}.j.P.|$4...@.
0041E450 00 C6 47 04 01 8B 0B 8B 16 8D 44 24 14 89 4C 24 ..G.......D$..L$
0041E460 14 50 8B CD C7 44 24 28 00 00 00 00 89 74 24 1C .P...D$(.....t$.
0041E470 89 13 E8 C9 FE FF FF 8B 0F 8B 6D 18 51 C6 47 04 ..........m.Q.G.
0041E480 00 FF 15 F0 40 8A 00 8B C5 8B 4C 24 1C 64 89 0D ....@.....L$.d..
0041E490 00 00 00 00 59 5F 5E 5D 5B 83 C4 14 C2 04 00 CC ....Y_^][.......
0041E4A0 A1 F4 B0 A6 00 64 8B 0D 2C 00 00 00 56 8B 34 81 .....d..,...V.4.
0041E4B0 8B 96 2C 00 00 00 8B 4C 24 08 8D 86 2C 00 00 00 ..,....L$...,...
0041E4C0 89 11 83 86 30 00 00 00 01 8B 15 84 3F A5 00 89 ....0.......?...
0041E4D0 08 8B 8E 30 00 00 00 03 D2 3B CA 7C 11 50 B9 6C ...0.....;.|.P.l
0041E4E0 3F A5 00 E8 F8 FE FF FF 29 86 30 00 00 00 5E C3 ?.......).0...^.
0041E4F0 56 8B F1 E8 E8 DB FF FF F6 44 24 08 01 74 09 56 V........D$..t.V
0041E500 E8 9B FF FF FF 83 C4 04 8B C6 5E C2 04 00 CC CC ..........^.....
0041E510 6A FF 68 0B F8 82 00 64 A1 00 00 00 00 50 83 EC j.h....d.....P..
0041E520 10 53 55 56 57 A1 88 41 A1 00 33 C4 50 8D 44 24 .SUVW..A..3.P.D$
0041E530 24 64 A3 00 00 00 00 8B F1 8B 46 06 8B 0E 8B 5C $d........F....\
0041E540 24 38 8B 53 10 8B F8 81 E1 FF FF FF 0F 25 FF FF $8.S.........%..
0041E550 FF 0F 2B C1 C7 44 24 18 00 00 00 00 89 44 24 18 ..+..D$......D$.
0041E560 8D 44 24 38 8D 2C 0A 50 8B CB 81 E7 00 00 00 F0 .D$8.,.P........
0041E570 E8 1B D5 0F 00 8B 08 0F B7 46 04 66 85 C0 7C 24 .........F.f..|$
0041E580 8B 51 28 85 D2 75 04 33 C9 EB 08 8B 49 2C 2B CA .Q(..u.3....I,+.
0041E590 C1 F9 02 66 3B C1 7D 0C 0F BF C8 8B 14 8A 89 54 ...f;.}........T
0041E5A0 24 14 EB 08 C7 44 24 14 00 00 00 00 8B 4C 24 38 $....D$......L$8
0041E5B0 85 C9 74 1A 8B F1 E8 25 35 FE FF 83 F8 01 75 0E ..t....%5.....u.
0041E5C0 85 F6 74 0A 8B 06 8B 10 6A 01 8B CE FF D2 64 8B ..t.....j.....d.
0041E5D0 0D 2C 00 00 00 A1 F4 B0 A6 00 8B 04 81 8D 90 38 .,.............8
0041E5E0 00 00 00 52 8D 88 34 00 00 00 51 8D 90 30 00 00 ...R..4...Q..0..
0041E5F0 00 52 8D 80 2C 00 00 00 50 B9 6C 3F A5 00 C7 44 .R..,...P.l?...D
0041E600 24 48 00 00 00 00 E8 15 F9 FF FF 8B F0 89 74 24 $H............t$
0041E610 1C 33 C0 3B F0 89 44 24 2C 74 22 51 8B CC 89 64 .3.;..D$,t"Q...d
0041E620 24 24 51 8B CB E8 66 D4 0F 00 8B 54 24 1C 8B 44 $$Q...f....T$..D
0041E630 24 18 57 52 55 50 8B CE E8 83 DE FF FF 85 C0 8B $.WRUP..........
0041E640 74 24 34 89 06 74 07 8B C8 E8 82 34 FE FF 8B C6 t$4..t.....4....
0041E650 8B 4C 24 24 64 89 0D 00 00 00 00 59 5F 5E 5D 5B .L$$d......Y_^][
0041E660 83 C4 1C C2 08 00 CC CC CC CC CC CC CC CC CC CC ................

;; fn0041E670: 0041E670
;;   Called from:
;;     0041EB05 (in fn0041EA60)
fn0041E670 proc
	push	0FFh
	push	82F843h
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,8h
	push	ebp
	push	esi
	push	edi
	mov	eax,[0A14188h]
	xor	eax,esp
	push	eax
	lea	eax,[esp+18h]
	mov	fs:[0000h],eax
	mov	esi,ecx
	mov	dword ptr [esp+10h],0h
	mov	eax,[esi+34h]
	mov	ecx,[eax+0Ch]
	mov	eax,[eax+8h]
	add	ecx,0FBh
	push	ecx
	add	eax,5h
	push	eax
	lea	ecx,[esi+24h]
	call	41E260h
	mov	ecx,fs:[002Ch]
	lea	edi,[eax+5h]
	mov	eax,[0A6B0F4h]
	mov	eax,[ecx+eax*4]
	lea	edx,[eax+38h]
	push	edx
	lea	ecx,[eax+34h]
	push	ecx
	lea	edx,[eax+30h]
	push	edx
	lea	eax,[eax+2Ch]
	push	eax
	mov	ecx,0A53F6Ch
	call	41DF20h
	mov	ebp,eax
	mov	[esp+10h],ebp
	test	ebp,ebp
	mov	dword ptr [esp+20h],0h
	jz	41E741h

l0041E703:
	push	ecx
	mov	eax,esp
	mov	ecx,esi
	mov	[esp+18h],esp
	mov	[eax],esi
	call	401AD0h
	mov	ecx,[esi+34h]
	mov	eax,[ecx+0Ch]
	mov	ecx,[ecx+8h]
	push	0h
	sub	eax,edi
	add	ecx,edi
	push	eax
	push	ecx
	lea	ecx,[esi+8h]
	mov	byte ptr [esp+30h],1h
	call	dword ptr [8A4354h]
	push	eax
	mov	ecx,ebp
	mov	byte ptr [esp+34h],0h
	call	41C4C0h
	jmp	41E743h

l0041E741:
	xor	eax,eax

l0041E743:
	test	eax,eax
	mov	esi,[esp+28h]
	mov	[esi],eax
	jz	41E754h

l0041E74D:
	mov	ecx,eax
	call	401AD0h

l0041E754:
	mov	eax,esi
	mov	ecx,[esp+18h]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebp
	add	esp,14h
	ret	4h
0041E76B                                  CC CC CC CC CC            .....
0041E770 6A FF 68 6B F8 82 00 64 A1 00 00 00 00 50 51 53 j.hk...d.....PQS
0041E780 56 57 A1 88 41 A1 00 33 C4 50 8D 44 24 14 64 A3 VW..A..3.P.D$.d.
0041E790 00 00 00 00 8B F1 8B 4E 1C 85 C9 C7 44 24 10 00 .......N....D$..
0041E7A0 00 00 00 74 2D 8B 44 24 28 56 8B 74 24 28 8D 04 ...t-.D$(V.t$(..
0041E7B0 40 56 8D 4C 41 02 E8 55 FD FF FF 8B C6 8B 4C 24 @V.LA..U......L$
0041E7C0 14 64 89 0D 00 00 00 00 59 5F 5E 5B 83 C4 10 C2 .d......Y_^[....
0041E7D0 08 00 81 7E 14 00 00 00 30 0F 85 8A 00 00 00 83 ...~....0.......
0041E7E0 7E 0C 30 0F 85 80 00 00 00 8B 7C 24 28 83 FF 03 ~.0.......|$(...
0041E7F0 77 77 6A 24 E8 27 FA FF FF 8B D8 83 C4 04 89 5C wwj$.'.........\
0041E800 24 28 85 DB C7 44 24 1C 00 00 00 00 74 31 51 8B $(...D$.....t1Q.
0041E810 CC 89 64 24 14 51 8B CE E8 73 D2 0F 00 8B 46 10 ..d$.Q...s....F.
0041E820 68 00 00 00 30 8D 14 7F 8D 0C 90 8B 14 BD 14 D1 h...0...........
0041E830 A0 00 6A 0C 51 52 8B CB E8 83 DC FF FF EB 02 33 ..j.QR.........3
0041E840 C0 85 C0 8B 74 24 24 89 06 74 07 8B C8 E8 7E 32 ....t$$..t....~2
0041E850 FE FF 8B C6 8B 4C 24 14 64 89 0D 00 00 00 00 59 .....L$.d......Y
0041E860 5F 5E 5B 83 C4 10 C2 08 00 8B 44 24 24 C7 00 00 _^[.......D$$...
0041E870 00 00 00 8B 4C 24 14 64 89 0D 00 00 00 00 59 5F ....L$.d......Y_
0041E880 5E 5B 83 C4 10 C2 08 00 CC CC CC CC CC CC CC CC ^[..............
0041E890 6A FF 68 9B F8 82 00 64 A1 00 00 00 00 50 51 53 j.h....d.....PQS
0041E8A0 55 56 57 A1 88 41 A1 00 33 C4 50 8D 44 24 18 64 UVW..A..3.P.D$.d
0041E8B0 A3 00 00 00 00 8B D9 8B 03 8B 50 04 33 F6 89 74 ..........P.3..t
0041E8C0 24 14 FF D2 8B 4B 1C 3B CE 74 03 8D 71 02 8B 7C $....K.;.t..q..|
0041E8D0 24 2C 8D 04 40 8D 2C 46 3B F5 74 4C 8D 64 24 00 $,..@.,F;.tL.d$.
0041E8E0 0F B7 56 04 66 85 D2 8B 43 20 7C 20 8B 48 28 85 ..V.f...C | .H(.
0041E8F0 C9 75 04 33 C0 EB 08 8B 40 2C 2B C1 C1 F8 02 66 .u.3....@,+....f
0041E900 3B D0 7D 08 0F BF D2 8B 0C 91 EB 02 33 C9 51 57 ;.}.........3.QW
0041E910 FF 15 B4 43 8A 00 83 C4 08 84 C0 0F 85 F6 00 00 ...C............
0041E920 00 83 C6 06 3B F5 75 B8 81 7B 14 00 00 00 30 0F ....;.u..{....0.
0041E930 85 0A 01 00 00 83 7B 0C 30 0F 85 00 01 00 00 8B ......{.0.......
0041E940 CF FF 15 5C 43 8A 00 83 F8 04 0F 85 EF 00 00 00 ...\C...........
0041E950 51 8B C4 8B CF 89 64 24 30 C7 00 00 00 00 00 FF Q.....d$0.......
0041E960 15 DC 43 8A 00 80 38 72 0F 85 D1 00 00 00 51 8B ..C...8r......Q.
0041E970 C4 8B CF 89 64 24 30 C7 00 01 00 00 00 FF 15 DC ....d$0.........
0041E980 43 8A 00 80 38 6F 0F 85 B3 00 00 00 51 8B C4 8B C...8o......Q...
0041E990 CF 89 64 24 30 C7 00 02 00 00 00 FF 15 DC 43 8A ..d$0.........C.
0041E9A0 00 80 38 77 0F 85 95 00 00 00 51 8B C4 8B CF 89 ..8w......Q.....
0041E9B0 64 24 30 C7 00 03 00 00 00 FF 15 DC 43 8A 00 0F d$0.........C...
0041E9C0 BE 30 83 EE 30 83 FE 03 77 75 6A 24 E8 4F F8 FF .0..0...wuj$.O..
0041E9D0 FF 8B F8 83 C4 04 89 7C 24 2C 85 FF C7 44 24 20 .......|$,...D$ 
0041E9E0 00 00 00 00 74 42 51 8B C4 89 64 24 18 50 8B CB ....tBQ...d$.P..
0041E9F0 E8 9B D0 0F 00 8B 53 10 68 00 00 00 30 8D 0C 76 ......S.h...0..v
0041EA00 8D 04 8A 8B 0C B5 24 D1 A0 00 6A 0C 50 51 8B CF ......$...j.PQ..
0041EA10 E8 AB DA FF FF EB 13 8B 7C 24 28 53 57 8B CE E8 ........|$(SW...
0041EA20 EC FA FF FF 8B C7 EB 21 33 C0 85 C0 8B 74 24 28 .......!3....t$(
0041EA30 89 06 74 07 8B C8 E8 95 30 FE FF 8B C6 EB 0A 8B ..t.....0.......
0041EA40 44 24 28 C7 00 00 00 00 00 8B 4C 24 18 64 89 0D D$(.......L$.d..
0041EA50 00 00 00 00 59 5F 5E 5D 5B 83 C4 10 C2 08 00 CC ....Y_^][.......

;; fn0041EA60: 0041EA60
;;   Called from:
;;     0041016F (in fn004100F0)
fn0041EA60 proc
	push	0FFh
	push	82F8F4h
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,0Ch
	push	ebx
	push	ebp
	push	esi
	push	edi
	mov	eax,[0A14188h]
	xor	eax,esp
	push	eax
	lea	eax,[esp+20h]
	mov	fs:[0000h],eax
	mov	dword ptr [esp+14h],0h
	mov	esi,[esp+38h]
	cmp	dword ptr [esi+0Ch],5h
	mov	ebx,1h
	mov	[esp+28h],ebx
	jl	41EB54h

l0041EAA6:
	mov	eax,[esi+8h]
	cmp	dword ptr [eax],62A14E45h
	jnz	41EB54h

l0041EAB5:
	push	38h
	call	694FD8h
	add	esp,4h
	mov	[esp+18h],eax
	test	eax,eax
	mov	byte ptr [esp+28h],2h
	jz	41EAE8h

l0041EACC:
	push	ecx
	mov	ecx,[esp+38h]
	mov	edx,esp
	mov	[esp+20h],esp
	push	ecx
	mov	[edx],esi
	add	[esi+4h],ebx
	mov	ecx,eax
	call	41DC50h
	mov	edi,eax
	jmp	41EAEAh

l0041EAE8:
	xor	edi,edi

l0041EAEA:
	test	edi,edi
	mov	[esp+1Ch],edi
	jz	41EAF9h

l0041EAF2:
	mov	ecx,edi
	call	401AD0h

l0041EAF9:
	mov	ebp,[esp+30h]
	push	ebp
	mov	ecx,edi
	mov	byte ptr [esp+2Ch],3h
	call	41E670h
	test	edi,edi
	mov	[esp+14h],ebx
	mov	[esp+28h],bl
	jz	41EB2Ah

l0041EB16:
	mov	ecx,edi
	call	401AE0h
	cmp	eax,ebx
	jnz	41EB2Ah

l0041EB21:
	mov	edx,[edi]
	mov	eax,[edx]
	push	ebx
	mov	ecx,edi
	call	eax

l0041EB2A:
	add	dword ptr [esi+4h],0FFh
	mov	byte ptr [esp+28h],0h
	jnz	41EB3Eh

l0041EB35:
	mov	edx,[esi]
	mov	eax,[edx]
	push	ebx
	mov	ecx,esi
	call	eax

l0041EB3E:
	mov	eax,ebp
	mov	ecx,[esp+20h]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebp
	pop	ebx
	add	esp,18h
	ret

l0041EB54:
	mov	edi,[esp+30h]
	mov	dword ptr [edi],0h
	add	dword ptr [esi+4h],0FFh
	mov	[esp+14h],ebx
	mov	byte ptr [esp+28h],0h
	jnz	41EB76h

l0041EB6D:
	mov	edx,[esi]
	mov	eax,[edx]
	push	ebx
	mov	ecx,esi
	call	eax

l0041EB76:
	mov	eax,edi
	mov	ecx,[esp+20h]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebp
	pop	ebx
	add	esp,18h
	ret
0041EB8C                                     CC CC CC CC             ....
0041EB90 6A FF 68 33 F9 82 00 64 A1 00 00 00 00 50 83 EC j.h3...d.....P..
0041EBA0 2C A1 88 41 A1 00 33 C4 89 44 24 28 53 55 56 57 ,..A..3..D$(SUVW
0041EBB0 A1 88 41 A1 00 33 C4 50 8D 44 24 40 64 A3 00 00 ..A..3.P.D$@d...
0041EBC0 00 00 8B 44 24 50 8B 6C 24 54 8B 74 24 58 8B 5C ...D$P.l$T.t$X.\
0041EBD0 24 5C 8B CD 89 44 24 14 C7 44 24 1C 00 00 00 00 $\...D$..D$.....
0041EBE0 FF 15 5C 43 8A 00 8B CE 89 44 24 18 FF 15 5C 43 ..\C.....D$...\C
0041EBF0 8A 00 8B F8 39 7C 24 18 55 73 0E 8B 74 24 18 8B ....9|$.Us..t$..
0041EC00 CE FF 15 3C 43 8A 00 EB 72 8D 4C 24 24 FF 15 3C ...<C...r.L$$..<
0041EC10 43 8A 00 6A 00 BD 01 00 00 00 56 8D 4C 24 28 89 C..j......V.L$(.
0041EC20 6C 24 50 FF 15 78 44 8A 00 8B 0D 4C 43 8A 00 3B l$P..xD....LC..;
0041EC30 01 74 24 53 57 50 8D 4C 24 2C FF 15 7C 44 8A 00 .t$SWP.L$,..|D..
0041EC40 6A 00 56 8D 4C 24 28 FF 15 78 44 8A 00 8B 15 4C j.V.L$(..xD....L
0041EC50 43 8A 00 3B 02 75 DC 8B 74 24 14 8D 44 24 20 50 C..;.u..t$..D$ P
0041EC60 8B CE FF 15 3C 43 8A 00 8D 4C 24 20 89 6C 24 1C ....<C...L$ .l$.
0041EC70 C6 44 24 48 00 FF 15 38 43 8A 00 8B C6 8B 4C 24 .D$H...8C.....L$
0041EC80 40 64 89 0D 00 00 00 00 59 5F 5E 5D 5B 8B 4C 24 @d......Y_^][.L$
0041EC90 28 33 CC E8 F6 5E 27 00 83 C4 38 C3 CC CC CC CC (3...^'...8.....
0041ECA0 6A FF 68 83 F9 82 00 64 A1 00 00 00 00 50 83 EC j.h....d.....P..
0041ECB0 3C A1 88 41 A1 00 33 C4 89 44 24 38 53 55 56 57 <..A..3..D$8SUVW
0041ECC0 A1 88 41 A1 00 33 C4 50 8D 44 24 50 64 A3 00 00 ..A..3.P.D$Pd...
0041ECD0 00 00 8B 7C 24 64 8B 5C 24 60 33 F6 8B C7 89 74 ...|$d.\$`3....t
0041ECE0 24 58 89 5C 24 18 89 74 24 14 8D 50 01 8D 49 00 $X.\$..t$..P..I.
0041ECF0 8A 08 83 C0 01 84 C9 75 F7 2B C2 8B CB 8B E8 FF .......u.+......
0041ED00 15 B0 43 8A 00 85 ED 89 74 24 58 C7 44 24 14 01 ..C.....t$X.D$..
0041ED10 00 00 00 0F 8E BA 00 00 00 8D A4 24 00 00 00 00 ...........$....
0041ED20 8D 4C 24 1C FF 15 B0 43 8A 00 8A 04 37 3C 26 C7 .L$....C....7<&.
0041ED30 44 24 58 01 00 00 00 75 07 68 70 84 8A 00 EB 4C D$X....u.hp....L
0041ED40 3C 3C 75 07 68 68 84 8A 00 EB 41 3C 3E 75 07 68 <<u.hh....A<>u.h
0041ED50 60 84 8A 00 EB 36 3C 22 75 07 68 58 84 8A 00 EB `....6<"u.hX....
0041ED60 2B 3C 27 75 07 68 50 84 8A 00 EB 20 84 C0 7D 26 +<'u.hP.... ..}&
0041ED70 0F B6 C0 50 8D 4C 24 3C 68 48 84 8A 00 51 FF 15 ...P.L$<hH...Q..
0041ED80 50 46 8A 00 83 C4 0C 8D 54 24 38 52 8D 4C 24 20 PF......T$8R.L$ 
0041ED90 FF 15 E0 43 8A 00 83 7C 24 30 00 75 0F 0F B6 04 ...C...|$0.u....
0041EDA0 37 50 8B CB FF 15 C4 43 8A 00 EB 0D 8D 4C 24 1C 7P.....C.....L$.
0041EDB0 51 8B CB FF 15 EC 43 8A 00 8D 4C 24 1C C6 44 24 Q.....C...L$..D$
0041EDC0 58 00 FF 15 38 43 8A 00 83 C6 01 3B F5 0F 8C 4D X...8C.....;...M
0041EDD0 FF FF FF 8B C3 8B 4C 24 50 64 89 0D 00 00 00 00 ......L$Pd......
0041EDE0 59 5F 5E 5D 5B 8B 4C 24 38 33 CC E8 9E 5D 27 00 Y_^][.L$83...]'.
0041EDF0 83 C4 48 C3 CC CC CC CC CC CC CC CC CC CC CC CC ..H.............

;; fn0041EE00: 0041EE00
;;   Called from:
;;     004194DB (in fn00418D40)
fn0041EE00 proc
	sub	esp,60h
	mov	eax,[0A14188h]
	xor	eax,esp
	mov	[esp+5Ch],eax
	push	ebx
	push	edi
	mov	edi,[esp+6Ch]
	mov	eax,edi
	mov	[esp+8h],edi
	lea	edx,[eax+1h]
	lea	ecx,[ecx+0h]

l0041EE20:
	mov	cl,[eax]
	add	eax,1h
	test	cl,cl
	jnz	41EE20h

l0041EE29:
	sub	eax,edx
	mov	ebx,eax
	test	ebx,ebx
	mov	[esp+18h],ebx
	jle	41F05Fh

l0041EE39:
	push	ebp
	push	esi
	mov	esi,1h
	lea	eax,[esp+24h]
	sub	eax,esi
	mov	[esp+14h],esi
	mov	[esp+18h],eax
	mov	edi,edi

l0041EE50:
	cmp	byte ptr [edi+esi-1h],26h
	jnz	41F046h

l0041EE5B:
	xor	eax,eax
	xor	edx,edx
	cmp	esi,ebx
	mov	[esp+24h],eax
	mov	[esp+28h],eax
	mov	[esp+2Ch],eax
	mov	[esp+30h],eax
	mov	[esp+34h],eax
	mov	[esp+38h],eax
	mov	[esp+3Ch],eax
	mov	[esp+40h],eax
	mov	ebp,1h
	mov	eax,esi
	jge	41EEBAh

l0041EE8A:
	lea	ebx,[ebx+0h]

l0041EE90:
	cmp	edx,1Fh
	jge	41EEB5h

l0041EE95:
	mov	cl,[edi+eax]
	add	ebp,1h
	cmp	cl,3Bh
	jz	41EEB5h

l0041EEA0:
	mov	edi,[esp+18h]
	mov	[edi+eax],cl
	mov	edi,[esp+10h]
	add	eax,1h
	add	edx,1h
	cmp	eax,ebx
	jl	41EE90h

l0041EEB5:
	cmp	ebp,2h
	jg	41EECDh

l0041EEBA:
	push	edi
	push	8A85A4h
	call	520C80h
	add	esp,8h
	jmp	41F046h

l0041EECD:
	cmp	ebp,1Fh
	jl	41EEE5h

l0041EED2:
	push	edi
	push	8A8560h
	call	520C80h
	add	esp,8h
	jmp	41F046h

l0041EEE5:
	mov	edi,8A855Ch
	lea	esi,[esp+24h]
	mov	ecx,4h
	xor	eax,eax

l0041EEF5:
	rep cmpsb

l0041EEF7:
	jnz	41EF00h

l0041EEF9:
	mov	al,26h
	jmp	41EFF2h

l0041EF00:
	mov	edi,8A8558h
	lea	esi,[esp+24h]
	mov	ecx,3h
	xor	edx,edx

l0041EF10:
	rep cmpsb

l0041EF12:
	jnz	41EF1Bh

l0041EF14:
	mov	al,3Ch
	jmp	41EFF2h

l0041EF1B:
	mov	edi,8A8554h
	lea	esi,[esp+24h]
	mov	ecx,3h
	xor	eax,eax

l0041EF2B:
	rep cmpsb

l0041EF2D:
	jnz	41EF36h

l0041EF2F:
	mov	al,3Eh
	jmp	41EFF2h

l0041EF36:
	mov	edi,8A854Ch
	lea	esi,[esp+24h]
	mov	ecx,5h
	xor	edx,edx

l0041EF46:
	rep cmpsb

l0041EF48:
	jnz	41EF51h

l0041EF4A:
	mov	al,22h
	jmp	41EFF2h

l0041EF51:
	mov	edi,8A8544h
	lea	esi,[esp+24h]
	mov	ecx,5h
	xor	eax,eax

l0041EF61:
	rep cmpsb

l0041EF63:
	jnz	41EF6Ch

l0041EF65:
	mov	al,27h
	jmp	41EFF2h

l0041EF6C:
	mov	eax,[esp+24h]
	cmp	al,23h
	jnz	41F027h

l0041EF78:
	cmp	ah,78h
	mov	dword ptr [esp+1Ch],0h
	jnz	41EFB8h

l0041EF85:
	lea	ecx,[esp+26h]
	push	ecx
	lea	edx,[esp+48h]
	push	8A853Ch
	push	edx
	call	dword ptr [8A4650h]
	lea	eax,[esp+28h]
	push	eax
	lea	ecx,[esp+54h]
	push	8A8538h
	push	ecx
	call	dword ptr [8A4618h]
	mov	ebx,[esp+34h]
	add	esp,18h
	jmp	41EFC8h

l0041EFB8:
	lea	edx,[esp+25h]
	push	edx
	call	dword ptr [8A468Ch]
	add	esp,4h
	mov	ebx,eax

l0041EFC8:
	cmp	ebx,1h
	jl	41EFD5h

l0041EFCD:
	cmp	ebx,0FFh
	jle	41EFECh

l0041EFD5:
	mov	eax,[esp+10h]
	push	eax
	lea	ecx,[esp+28h]
	push	ecx
	push	8A84A8h
	call	520C80h
	add	esp,0Ch

l0041EFEC:
	mov	al,bl
	mov	ebx,[esp+20h]

l0041EFF2:
	mov	ecx,[esp+14h]
	mov	edx,[esp+10h]
	sub	ebp,1h
	mov	[edx+ecx-1h],al
	lea	eax,[ecx+ebp]
	cmp	eax,ebx
	jge	41F01Fh

l0041F008:
	lea	eax,[edx+ecx]
	mov	ecx,ebp
	sub	ecx,edx
	nop

l0041F010:
	mov	dl,[eax+ebp]
	mov	[eax],dl
	add	eax,1h
	lea	edx,[ecx+eax]
	cmp	edx,ebx
	jl	41F010h

l0041F01F:
	sub	ebx,ebp
	mov	[esp+20h],ebx
	jmp	41F03Eh

l0041F027:
	mov	eax,[esp+10h]
	push	eax
	lea	ecx,[esp+28h]
	push	ecx
	push	8A8478h
	call	520C80h
	add	esp,0Ch

l0041F03E:
	mov	esi,[esp+14h]
	mov	edi,[esp+10h]

l0041F046:
	sub	dword ptr [esp+18h],1h
	add	esi,1h
	lea	edx,[esi-1h]
	cmp	edx,ebx
	mov	[esp+14h],esi
	jl	41EE50h

l0041F05D:
	pop	esi
	pop	ebp

l0041F05F:
	mov	ecx,[esp+64h]
	mov	byte ptr [edi+ebx],0h
	pop	edi
	pop	ebx
	xor	ecx,esp
	call	694B8Eh
	add	esp,60h
	ret
0041F074             CC CC CC CC CC CC CC CC CC CC CC CC     ............
0041F080 F3 0F 10 44 24 04 8B C1 F3 0F 11 00 F3 0F 10 44 ...D$..........D
0041F090 24 08 F3 0F 11 40 04 F3 0F 10 44 24 0C F3 0F 11 $....@....D$....
0041F0A0 40 08 C2 0C 00 CC CC CC CC CC CC CC CC CC CC CC @...............

;; fn0041F0B0: 0041F0B0
;;   Called from:
;;     0042DF68 (in fn0042DF20)
fn0041F0B0 proc
	cmp	byte ptr [0A6974Ah],0h
	jnz	41F0C6h

l0041F0B9:
	cmp	byte ptr [0A69756h],0h
	jnz	41F0C6h

l0041F0C2:
	xor	edx,edx
	jmp	41F0CBh

l0041F0C6:
	mov	edx,1h

l0041F0CB:
	cmp	byte ptr [0A6973Dh],0h
	jnz	41F0E1h

l0041F0D4:
	cmp	byte ptr [0A697BDh],0h
	jnz	41F0E1h

l0041F0DD:
	xor	ecx,ecx
	jmp	41F0E6h

l0041F0E1:
	mov	ecx,1h

l0041F0E6:
	cmp	byte ptr [0A69758h],0h
	jnz	41F0FCh

l0041F0EF:
	cmp	byte ptr [0A697D8h],0h
	jnz	41F0FCh

l0041F0F8:
	xor	eax,eax
	jmp	41F101h

l0041F0FC:
	mov	eax,1h

l0041F101:
	neg	al
	sbb	eax,eax
	and	eax,4h
	neg	cl
	sbb	ecx,ecx
	and	ecx,2h
	or	eax,ecx
	xor	ecx,ecx
	test	dl,dl
	setnz	cl
	or	eax,ecx
	ret
0041F11B                                  CC CC CC CC CC            .....

;; fn0041F120: 0041F120
;;   Called from:
;;     0042AD19 (in fn0042ACF0)
fn0041F120 proc
	push	0FFh
	push	82F9BBh
	mov	eax,fs:[0000h]
	push	eax
	push	ecx
	mov	eax,[0A14188h]
	xor	eax,esp
	push	eax
	lea	eax,[esp+8h]
	mov	fs:[0000h],eax
	mov	eax,[0A67C00h]
	test	eax,eax
	jnz	41F173h

l0041F14A:
	push	31138h
	call	694FD8h
	add	esp,4h
	mov	[esp+4h],eax
	test	eax,eax
	mov	dword ptr [esp+10h],0h
	jz	41F16Eh

l0041F167:
	mov	ecx,eax
	call	621380h

l0041F16E:
	mov	eax,[0A67C00h]

l0041F173:
	mov	ecx,[esp+8h]
	mov	fs:[0000h],ecx
	pop	ecx
	add	esp,10h
	ret
0041F183          CC CC CC CC CC CC CC CC CC CC CC CC CC    .............
0041F190 B0 01 C3 CC CC CC CC CC CC CC CC CC CC CC CC CC ................

;; fn0041F1A0: 0041F1A0
;;   Called from:
;;     004210C8 (in fn00421080)
fn0041F1A0 proc
	push	0FFh
	push	82F9E9h
	mov	eax,fs:[0000h]
	push	eax
	push	ecx
	push	esi
	mov	eax,[0A14188h]
	xor	eax,esp
	push	eax
	lea	eax,[esp+0Ch]
	mov	fs:[0000h],eax
	mov	esi,ecx
	mov	[esp+8h],esi
	call	dword ptr [8A469Ch]
	mov	eax,[esp+1Ch]
	push	eax
	lea	ecx,[esi+0Ch]
	mov	dword ptr [esp+18h],0h
	mov	dword ptr [esi],8A8634h
	call	dword ptr [8A433Ch]
	mov	eax,esi
	mov	ecx,[esp+0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	esi
	add	esp,10h
	ret	4h
0041F1FF                                              CC                .
0041F200 56 8B F1 8D 4E 0C C7 06 34 86 8A 00 FF 15 38 43 V...N...4.....8C
0041F210 8A 00 8B CE 5E FF 25 A4 46 8A 00 CC CC CC CC CC ....^.%.F.......
0041F220 83 C1 0C FF 25 54 43 8A 00 CC CC CC CC CC CC CC ....%TC.........
0041F230 C7 01 44 86 8A 00 C3 CC CC CC CC CC CC CC CC CC ..D.............
0041F240 F6 44 24 04 01 56 8B F1 C7 06 44 86 8A 00 74 09 .D$..V....D...t.
0041F250 56 E8 70 5D 27 00 83 C4 04 8B C6 5E C2 04 00 CC V.p]'......^....
0041F260 8B 44 24 04 89 01 C2 04 00 CC CC CC CC CC CC CC .D$.............
0041F270 D9 81 10 01 00 00 C3 CC CC CC CC CC CC CC CC CC ................
0041F280 C7 01 4C 86 8A 00 C3 CC CC CC CC CC CC CC CC CC ..L.............
0041F290 8B 4C 24 08 8B 54 24 0C D9 02 8B 44 24 04 D8 21 .L$..T$....D$..!
0041F2A0 D9 44 24 10 DC C9 D9 C9 D8 01 D9 18 D9 42 04 D8 .D$..........B..
0041F2B0 61 04 D8 C9 D8 41 04 D9 58 04 D9 42 08 D8 61 08 a....A..X..B..a.
0041F2C0 DE C9 D8 41 08 D9 58 08 C3 CC CC CC CC CC CC CC ...A..X.........
0041F2D0 51 8B 44 24 10 8B 54 24 08 50 8D 4C 24 04 51 52 Q.D$..T$.P.L$.QR
0041F2E0 E8 2B 83 23 00 8B 4C 24 18 8B 54 24 0C 89 11 83 .+.#..L$..T$....
0041F2F0 C4 10 C3 CC CC CC CC CC CC CC CC CC CC CC CC CC ................

;; fn0041F300: 0041F300
;;   Called from:
;;     0042E1CE (in fn0042DF20)
fn0041F300 proc
	mov	eax,[esp+10h]
	mov	ecx,[esp+0Ch]
	mov	edx,[esp+8h]
	push	esi
	push	1h
	push	eax
	mov	eax,[esp+10h]
	push	ecx
	push	edx
	push	eax
	call	657140h
	mov	esi,eax
	add	esp,14h
	test	esi,esi
	jz	41F336h

l0041F325:
	add	dword ptr [esi],0FFh
	jnz	41F336h

l0041F32A:
	mov	ecx,[esi+4h]
	mov	edx,[ecx+18h]
	push	esi
	call	edx
	add	esp,4h

l0041F336:
	xor	eax,eax
	test	esi,esi
	setnz	al
	pop	esi
	ret
0041F33F                                              CC                .
0041F340 83 79 0C 00 74 09 8B 49 0C 8B 01 8B 10 FF E2 A1 .y..t..I........
0041F350 F0 38 A5 00 C3 CC CC CC CC CC CC CC CC CC CC CC .8..............
0041F360 55 8B EC 83 E4 F0 83 EC 58 56 8B 75 08 8B D1 57 U.......XV.u...W
0041F370 B9 10 00 00 00 8D 7C 24 20 F3 A5 D9 44 24 28 D9 ......|$ ...D$(.
0041F380 C0 D8 C9 D9 44 24 24 D9 C0 D8 C9 DE C2 D9 44 24 ....D$$.......D$
0041F390 20 D9 C0 D8 C9 DE C3 D9 CA D9 FA D9 52 10 D9 44  ...........R..D
0041F3A0 24 38 D9 C0 D8 C9 D9 44 24 34 DC C8 DE C1 D9 44 $8.....D$4.....D
0041F3B0 24 30 DC C8 DE C1 D9 FA D9 54 24 10 D9 5A 14 D9 $0.......T$..Z..
0041F3C0 44 24 48 DC C8 D9 44 24 44 DC C8 DE C1 D9 44 24 D$H...D$D.....D$
0041F3D0 40 D9 C0 D8 C9 DE C2 D9 C9 D9 FA D9 52 18 D9 E8 @...........R...
0041F3E0 DE F4 D9 CD D8 CB D9 54 24 20 D9 CC D8 CB D9 54 .......T$ .....T
0041F3F0 24 24 D9 CE DE CB D9 CA D9 54 24 28 D9 E8 D8 74 $$.......T$(...t
0041F400 24 10 D9 44 24 30 D8 C9 D9 5C 24 30 D9 44 24 34 $..D$0...\$0.D$4
0041F410 D8 C9 D9 54 24 34 D9 CB DE C9 D9 54 24 38 D9 E8 ...T$4.....T$8..
0041F420 DE F6 D9 CB D8 CD D9 54 24 40 D9 44 24 44 D8 CE .......T$@.D$D..
0041F430 D9 5C 24 44 D9 44 24 48 DE CE D9 CD D9 5C 24 48 .\$D.D$H.....\$H
0041F440 D9 C2 D8 CE D9 C2 D8 CA DE E9 D9 5C 24 14 D9 44 ...........\$..D
0041F450 24 30 D9 C0 DE CA D9 CB D8 CC DE E9 D9 C9 DE CB $0..............
0041F460 D9 C9 DE CC D9 C9 DE E3 D9 44 24 48 D9 C0 DE CC .........D$H....
0041F470 D9 44 24 44 D9 C0 DE CB D9 CC DE C2 D9 C2 D8 4C .D$D...........L
0041F480 24 14 DE C2 D9 C9 D8 1D A4 77 8A 00 DF E0 F6 C4 $........w......
0041F490 05 7A 26 D9 05 70 86 8A 00 DC CA D9 CA D9 5C 24 .z&..p........\$
0041F4A0 40 D9 CA D8 C9 D9 5C 24 44 DC C9 D9 C9 D9 5C 24 @.....\$D.....\$
0041F4B0 48 D8 4A 18 D9 5A 18 EB 06 DD DA DD D9 DD D8 8B H.J..Z..........
0041F4C0 44 24 50 8B 4C 24 54 89 42 1C 8B 44 24 58 89 4A D$P.L$T.B..D$X.J
0041F4D0 20 8D 4C 24 20 51 52 89 42 24 E8 D3 77 27 00 5F  .L$ QR.B$..w'._
0041F4E0 5E 8B E5 5D C2 04 00 CC CC CC CC CC CC CC CC CC ^..]............
0041F4F0 D9 EE 56 D9 44 24 08 57 D8 D1 8B F9 DF E0 DD D9 ..V.D$.W........
0041F500 F6 C4 41 D9 E8 75 7A D8 D1 DF E0 F6 C4 41 75 71 ..A..uz......Auq
0041F510 8B 74 24 10 DD D8 51 D9 1C 24 56 57 57 E8 96 77 .t$...Q..$VWW..w
0041F520 27 00 D9 46 1C D8 67 1C D9 44 24 0C DC C9 D9 C9 '..F..g..D$.....
0041F530 D8 47 1C D9 5F 1C D9 46 20 D8 67 20 D8 C9 D8 47 .G.._..F .g ...G
0041F540 20 D9 5F 20 D9 46 24 D8 67 24 D8 C9 D8 47 24 D9  ._ .F$.g$...G$.
0041F550 5F 24 D9 46 10 D8 67 10 D8 C9 D8 47 10 D9 5F 10 _$.F..g....G.._.
0041F560 D9 46 14 D8 67 14 D8 C9 D8 47 14 D9 5F 14 D9 46 .F..g....G.._..F
0041F570 18 D8 67 18 DE C9 D8 47 18 D9 5F 18 5F 5E C2 08 ..g....G.._._^..
0041F580 00 DE D9 DF E0 F6 C4 41 7A 0B 8B 74 24 10 B9 0A .......Az..t$...
0041F590 00 00 00 F3 A5 5F 5E C2 08 00 CC CC CC CC CC CC ....._^.........
0041F5A0 56 8B 74 24 08 57 8B F9 57 56 E8 0F 77 27 00 D9 V.t$.W..WV..w'..
0041F5B0 47 10 D9 06 8D 47 1C D8 C9 8D 4E 30 D9 1E D9 46 G....G....N0...F
0041F5C0 04 D8 C9 D9 5E 04 D8 4E 08 D9 5E 08 D9 47 14 D9 ....^..N..^..G..
0041F5D0 46 10 D8 C9 D9 5E 10 D9 46 14 D8 C9 D9 5E 14 D8 F....^..F....^..
0041F5E0 4E 18 D9 5E 18 D9 47 18 5F D9 C0 D8 4E 20 D9 5E N..^..G._...N .^
0041F5F0 20 D9 C0 D8 4E 24 D9 5E 24 D8 4E 28 D9 5E 28 8B  ...N$.^$.N(.^(.
0041F600 10 89 11 8B 50 04 89 51 04 8B 40 08 89 41 08 5E ....P..Q..@..A.^
0041F610 C2 04 00 CC CC CC CC CC CC CC CC CC CC CC CC CC ................
0041F620 51 C7 01 74 86 8A 00 E8 C4 E7 3F 00 8B C8 E8 9D Q..t......?.....
0041F630 E5 3F 00 C3 CC CC CC CC CC CC CC CC CC CC CC CC .?..............
0041F640 8A 81 39 02 00 00 C3 CC CC CC CC CC CC CC CC CC ..9.............
0041F650 8A 44 24 04 88 81 39 02 00 00 C2 04 00 CC CC CC .D$...9.........
0041F660 8B 44 24 04 D9 00 D9 99 C4 00 00 00 D9 40 04 D9 .D$..........@..
0041F670 99 C8 00 00 00 D9 40 08 D9 99 CC 00 00 00 D9 40 ......@........@
0041F680 0C D9 99 D0 00 00 00 D9 40 10 D9 99 D4 00 00 00 ........@.......
0041F690 8A 40 14 88 81 D8 00 00 00 C2 04 00 CC CC CC CC .@..............
0041F6A0 56 8B 74 24 08 8B C1 57 8D 90 20 01 00 00 8B FA V.t$...W.. .....
0041F6B0 B9 10 00 00 00 F3 A5 8D 88 E0 00 00 00 51 52 05 .............QR.
0041F6C0 60 01 00 00 50 E8 E2 75 27 00 5F 5E C2 04 00 CC `...P..u'._^....
0041F6D0 D9 44 24 04 D9 99 40 02 00 00 E8 01 4A 18 00 C2 .D$...@.....J...
0041F6E0 04 00 CC CC CC CC CC CC CC CC CC CC CC CC CC CC ................
0041F6F0 D9 81 40 02 00 00 C3 CC CC CC CC CC CC CC CC CC ..@.............
0041F700 8A 81 38 02 00 00 C3 CC CC CC CC CC CC CC CC CC ..8.............
0041F710 8A 44 24 04 88 81 38 02 00 00 C2 04 00 CC CC CC .D$...8.........
0041F720 D9 41 34 C3 CC CC CC CC CC CC CC CC CC CC CC CC .A4.............
0041F730 D9 41 30 C3 CC CC CC CC CC CC CC CC CC CC CC CC .A0.............
0041F740 D9 41 2C C3 CC CC CC CC CC CC CC CC CC CC CC CC .A,.............
0041F750 D9 44 24 04 D9 59 10 C2 04 00 CC CC CC CC CC CC .D$..Y..........
0041F760 D9 41 10 C3 CC CC CC CC CC CC CC CC CC CC CC CC .A..............
0041F770 D9 41 28 C3 CC CC CC CC CC CC CC CC CC CC CC CC .A(.............
0041F780 53 56 8B 74 24 0C D9 06 57 E8 B2 58 27 00 D9 46 SV.t$...W..X'..F
0041F790 04 8B F8 E8 A8 58 27 00 D9 46 08 8B D8 E8 9E 58 .....X'..F.....X
0041F7A0 27 00 81 FF FF 00 00 00 7E 07 BF FF 00 00 00 EB '.......~.......
0041F7B0 0C 33 C9 85 FF 0F 9C C1 83 E9 01 23 F9 81 FB FF .3.........#....
0041F7C0 00 00 00 7E 07 BE FF 00 00 00 EB 0E 33 D2 85 DB ...~........3...
0041F7D0 0F 9C C2 83 EA 01 23 D3 8B F2 3D FF 00 00 00 7E ......#...=....~
0041F7E0 07 B9 FF 00 00 00 EB 0C 33 C9 85 C0 0F 9C C1 83 ........3.......
0041F7F0 E9 01 23 C8 8B 44 24 14 3D FF 00 00 00 7E 18 B8 ..#..D$.=....~..
0041F800 FF 00 00 00 C1 E0 08 0B C7 C1 E0 08 0B C6 5F C1 .............._.
0041F810 E0 08 5E 0B C1 5B C3 33 D2 85 C0 0F 9C C2 83 EA ..^..[.3........
0041F820 01 23 C2 C1 E0 08 0B C7 C1 E0 08 0B C6 5F C1 E0 .#..........._..
0041F830 08 5E 0B C1 5B C3 CC CC CC CC CC CC CC CC CC CC .^..[...........
0041F840 53 56 8B 74 24 0C D9 06 57 E8 F2 57 27 00 D9 46 SV.t$...W..W'..F
0041F850 04 8B F8 E8 E8 57 27 00 D9 46 08 8B D8 E8 DE 57 .....W'..F.....W
0041F860 27 00 81 FF FF 00 00 00 7E 07 BE FF 00 00 00 EB '.......~.......
0041F870 0E 33 C9 85 FF 0F 9C C1 83 E9 01 23 CF 8B F1 81 .3.........#....
0041F880 FB FF 00 00 00 7E 07 BA FF 00 00 00 EB 0C 33 D2 .....~........3.
0041F890 85 DB 0F 9C C2 83 EA 01 23 D3 3D FF 00 00 00 7E ........#.=....~
0041F8A0 15 8B C6 C1 E0 08 0B C2 5F B9 FF 00 00 00 C1 E0 ........_.......
0041F8B0 08 5E 0B C1 5B C3 33 C9 85 C0 0F 9C C1 5F 83 E9 .^..[.3......_..
0041F8C0 01 23 C8 8B C6 C1 E0 08 0B C2 C1 E0 08 5E 0B C1 .#...........^..
0041F8D0 5B C3 CC CC CC CC CC CC CC CC CC CC CC CC CC CC [...............
0041F8E0 8B 01 C3 CC CC CC CC CC CC CC CC CC CC CC CC CC ................
0041F8F0 51 56 8B 74 24 0C 83 C1 08 51 8B CE C7 44 24 08 QV.t$....Q...D$.
0041F900 00 00 00 00 FF 15 3C 43 8A 00 8B C6 5E 59 C2 04 ......<C....^Y..
0041F910 00 CC CC CC CC CC CC CC CC CC CC CC CC CC CC CC ................
0041F920 51 56 8B 74 24 0C 83 C1 48 51 8B CE C7 44 24 08 QV.t$...HQ...D$.
0041F930 00 00 00 00 FF 15 3C 43 8A 00 8B C6 5E 59 C2 04 ......<C....^Y..
0041F940 00 CC CC CC CC CC CC CC CC CC CC CC CC CC CC CC ................
0041F950 8B 41 40 C3 CC CC CC CC CC CC CC CC CC CC CC CC .A@.............
0041F960 51 56 8B 74 24 0C 83 C1 64 51 8B CE C7 44 24 08 QV.t$...dQ...D$.
0041F970 00 00 00 00 FF 15 3C 43 8A 00 8B C6 5E 59 C2 04 ......<C....^Y..
0041F980 00 CC CC CC CC CC CC CC CC CC CC CC CC CC CC CC ................
0041F990 51 56 8B 74 24 0C 81 C1 80 00 00 00 51 8B CE C7 QV.t$.......Q...
0041F9A0 44 24 08 00 00 00 00 FF 15 3C 43 8A 00 8B C6 5E D$.......<C....^
0041F9B0 59 C2 04 00 CC CC CC CC CC CC CC CC CC CC CC CC Y...............
0041F9C0 8B 81 9C 00 00 00 C3 CC CC CC CC CC CC CC CC CC ................
0041F9D0 8B 81 A0 00 00 00 C3 CC CC CC CC CC CC CC CC CC ................
0041F9E0 E8 DB 18 02 00 8B C8 E8 24 17 02 00 E8 8F 30 19 ........$.....0.
0041F9F0 00 8B 0D 00 40 A5 00 85 C9 74 12 8B 01 8B 10 6A ....@....t.....j
0041FA00 01 FF D2 C7 05 00 40 A5 00 00 00 00 00 8B 0D F8 ......@.........
0041FA10 3F A5 00 85 C9 74 12 8B 01 8B 10 6A 01 FF D2 C7 ?....t.....j....
0041FA20 05 F8 3F A5 00 00 00 00 00 E8 C2 7A 18 00 8B C8 ..?........z....
0041FA30 E9 BB 7D 18 00 CC CC CC CC CC CC CC CC CC CC CC ..}.............
0041FA40 6A FF 68 40 FA 82 00 64 A1 00 00 00 00 50 51 53 j.h@...d.....PQS
0041FA50 56 A1 88 41 A1 00 33 C4 50 8D 44 24 10 64 A3 00 V..A..3.P.D$.d..
0041FA60 00 00 00 8B F1 89 74 24 0C 33 DB 8D 4E 10 C6 46 ......t$.3..N..F
0041FA70 04 01 C7 06 C0 86 8A 00 89 5E 08 89 5E 0C FF 15 .........^..^...
0041FA80 B0 43 8A 00 8D 4E 2C 89 5C 24 18 FF 15 B0 43 8A .C...N,.\$....C.
0041FA90 00 8D 4E 48 C6 44 24 18 01 FF 15 B0 43 8A 00 8D ..NH.D$.....C...
0041FAA0 4E 64 C6 44 24 18 02 FF 15 B0 43 8A 00 D9 EE D9 Nd.D$.....C.....
0041FAB0 96 80 00 00 00 53 D9 96 84 00 00 00 68 B4 86 8A .....S......h...
0041FAC0 00 D9 96 88 00 00 00 56 D9 9E 8C 00 00 00 C6 44 .......V.......D
0041FAD0 24 24 03 D9 E8 89 9E 58 01 00 00 D9 96 5C 01 00 $$.....X.....\..
0041FAE0 00 88 9E 68 01 00 00 D9 96 60 01 00 00 C6 86 69 ...h.....`.....i
0041FAF0 01 00 00 01 D9 9E 64 01 00 00 88 9E 6A 01 00 00 ......d.....j...
0041FB00 E8 AB 38 20 00 50 E8 F5 42 20 00 68 C8 00 00 00 ..8 .P..B .h....
0041FB10 8D 86 90 00 00 00 53 50 E8 03 55 27 00 83 C4 1C ......SP..U'....
0041FB20 8B C6 8B 4C 24 10 64 89 0D 00 00 00 00 59 5E 5B ...L$.d......Y^[
0041FB30 83 C4 10 C3 CC CC CC CC CC CC CC CC CC CC CC CC ................
0041FB40 6A FF 68 84 FA 82 00 64 A1 00 00 00 00 50 51 56 j.h....d.....PQV
0041FB50 A1 88 41 A1 00 33 C4 50 8D 44 24 0C 64 A3 00 00 ..A..3.P.D$.d...
0041FB60 00 00 8B F1 89 74 24 08 C7 06 C0 86 8A 00 8D 4E .....t$........N
0041FB70 64 C7 44 24 14 02 00 00 00 FF 15 38 43 8A 00 8D d.D$.......8C...
0041FB80 4E 48 C6 44 24 14 01 FF 15 38 43 8A 00 8D 4E 2C NH.D$....8C...N,
0041FB90 C6 44 24 14 00 FF 15 38 43 8A 00 8D 4E 10 C7 44 .D$....8C...N..D
0041FBA0 24 14 FF FF FF FF FF 15 38 43 8A 00 8B 4C 24 0C $.......8C...L$.
0041FBB0 64 89 0D 00 00 00 00 59 5E 83 C4 10 C3 CC CC CC d......Y^.......
0041FBC0 D9 44 24 04 D9 59 08 E8 E4 F3 01 00 8B C8 E8 FD .D$..Y..........
0041FBD0 ED 01 00 E8 98 AD 02 00 8B C8 E8 41 C7 02 00 C2 ...........A....
0041FBE0 04 00 CC CC CC CC CC CC CC CC CC CC CC CC CC CC ................
0041FBF0 E8 7B 47 20 00 8B 0D F8 3F A5 00 85 C9 74 12 8B .{G ....?....t..
0041FC00 01 8B 10 6A 01 FF D2 C7 05 F8 3F A5 00 00 00 00 ...j......?.....
0041FC10 00 E9 2A C9 02 00 CC CC CC CC CC CC CC CC CC CC ..*.............
0041FC20 A1 E8 3F A5 00 DD 80 10 05 00 00 C3 CC CC CC CC ..?.............
0041FC30 E8 3B AD 02 00 8B 48 04 85 C9 74 17 A1 E8 3F A5 .;....H...t...?.
0041FC40 00 DD 80 10 05 00 00 83 EC 08 DD 1C 24 E8 6E 37 ............$.n7
0041FC50 03 00 C3 DD 05 F8 86 8A 00 C3 CC CC CC CC CC CC ................
0041FC60 8B 01 D9 44 24 04 8B 50 08 51 D9 1C 24 FF D2 C2 ...D$..P.Q..$...
0041FC70 04 00 CC CC CC CC CC CC CC CC CC CC CC CC CC CC ................
0041FC80 8B 0D 4C 45 A5 00 85 C9 74 38 83 E0 01 83 E8 00 ..LE....t8......
0041FC90 74 1B 83 E8 01 75 2B D9 05 24 87 8A 00 6A 01 51 t....u+..$...j.Q
0041FCA0 D9 1C 24 6A 03 6A 01 E8 74 45 09 00 C3 D9 05 20 ..$j.j..tE..... 
0041FCB0 87 8A 00 6A 02 51 D9 1C 24 6A 01 6A 00 E8 5E 45 ...j.Q..$j.j..^E
0041FCC0 09 00 C3 CC CC CC CC CC CC CC CC CC CC CC CC CC ................
0041FCD0 51 56 8B 74 24 10 56 E8 44 01 2C 00 83 C4 04 83 QV.t$.V.D.,.....
0041FCE0 C0 FF 75 3C 6A 00 56 E8 74 01 2C 00 68 44 87 8A ..u<j.V.t.,.hD..
0041FCF0 00 8D 4C 24 10 51 50 E8 14 79 23 00 83 C4 14 85 ..L$.QP..y#.....
0041FD00 C0 74 05 33 C0 5E 59 C3 8B 44 24 04 E8 6F FF FF .t.3.^Y..D$..o..
0041FD10 FF 83 05 B8 63 A1 00 01 B8 B8 63 A1 00 5E 59 C3 ....c.....c..^Y.
0041FD20 68 3C 87 8A 00 6A 01 6A 01 68 28 87 8A 00 E8 2D h<...j.j.h(....-
0041FD30 70 23 00 83 C4 10 5E 59 C3 CC CC CC CC CC CC CC p#....^Y........
0041FD40 E8 AB 55 20 00 8B C8 E8 64 5A 20 00 E8 1F AC 02 ..U ....dZ .....
0041FD50 00 8B C8 E8 78 A4 02 00 E8 03 51 15 00 8B C8 E8 ....x.....Q.....
0041FD60 3C 40 15 00 E9 B7 60 19 00 CC CC CC CC CC CC CC <@....`.........
0041FD70 51 56 8B F0 56 E8 A6 00 2C 00 83 C4 04 83 F8 01 QV..V...,.......
0041FD80 75 78 8D 44 24 04 50 68 B0 87 8A 00 56 E8 EE 7E ux.D$.Ph....V..~
0041FD90 2C 00 83 C4 0C 83 7C 24 04 00 0F 95 C1 88 0D 50 ,.....|$.......P
0041FDA0 D1 A0 00 33 F6 EB 09 8D A4 24 00 00 00 00 8B FF ...3.....$......
0041FDB0 8B 96 08 86 8A 00 52 E8 F4 35 20 00 8B C8 E8 1D ......R..5 .....
0041FDC0 3B 20 00 85 C0 74 09 8A 0D 50 D1 A0 00 88 48 04 ; ...t...P....H.
0041FDD0 83 C6 04 83 FE 14 72 D8 80 3D 50 D1 A0 00 00 75 ......r..=P....u
0041FDE0 0A 6A 00 E8 48 19 FE FF 83 C4 04 83 05 B8 63 A1 .j..H.........c.
0041FDF0 00 01 B8 B8 63 A1 00 5E 59 C3 56 E8 20 00 2C 00 ....c..^Y.V. .,.
0041FE00 83 C4 04 85 C0 75 13 0F B6 15 50 D1 A0 00 52 E8 .....u....P...R.
0041FE10 4C 55 2C 00 83 C4 04 5E 59 C3 A1 7C 6B A1 00 68 LU,....^Y..|k..h
0041FE20 74 87 8A 00 50 E8 56 11 2C 00 83 C4 08 33 C0 5E t...P.V.,....3.^
0041FE30 59 C3 CC CC CC CC CC CC CC CC CC CC CC CC CC CC Y...............
0041FE40 8B 44 24 08 E9 27 FF FF FF CC CC CC CC CC CC CC .D$..'..........
0041FE50 80 3D 50 D1 A0 00 00 56 8B F1 74 51 E8 BF AE 09 .=P....V..tQ....
0041FE60 00 D9 46 08 8B 10 51 8B C8 D9 1C 24 8B 02 FF D0 ..F...Q....$....
0041FE70 80 3D 50 D1 A0 00 00 74 25 B9 94 78 A5 00 E8 5D .=P....t%..x...]
0041FE80 3F 09 00 E8 98 92 09 00 8B C8 E8 F1 92 09 00 8B ?...............
0041FE90 0D 54 45 A5 00 85 C9 74 05 E8 A2 8E 09 00 E8 7D .TE....t.......}
0041FEA0 AE 09 00 8B 10 8B C8 8B 42 04 5E FF E0 5E C3 CC ........B.^..^..
0041FEB0 E8 BB 44 20 00 8B 0D F8 3F A5 00 85 C9 74 12 8B ..D ....?....t..
0041FEC0 01 8B 10 6A 01 FF D2 C7 05 F8 3F A5 00 00 00 00 ...j......?.....
0041FED0 00 E8 7A D5 27 00 8B C8 E9 83 C6 27 00 CC CC CC ..z.'......'....
0041FEE0 83 EC 08 56 8B F1 E8 05 76 18 00 D9 80 1C 02 00 ...V....v.......
0041FEF0 00 DC C0 D9 5C 24 08 E8 F4 75 18 00 D9 80 20 02 ....\$...u.... .
0041FF00 00 00 33 C9 DC C0 89 4C 24 04 D9 05 E0 87 8A 00 ..3....L$.......
0041FF10 8D 56 08 8D 86 A0 01 00 00 D8 C9 D9 44 24 08 D9 .V..........D$..
0041FF20 05 DC 87 8A 00 D8 C9 D9 EE D9 E8 EB 06 D9 C9 D9 ................
0041FF30 CD D9 C9 D9 CD 83 C1 01 D9 12 83 C2 04 DB 44 24 ..............D$
0041FF40 04 83 C0 14 83 F9 64 89 4C 24 04 D8 CB D9 58 E4 ......d.L$....X.
0041FF50 D9 C9 D9 50 E8 D9 50 EC D9 CD D9 50 F0 C7 40 F4 ...P..P....P..@.
0041FF60 00 00 FF 00 7C C7 DD DA B8 FF 00 00 00 D9 CC D9 ....|...........
0041FF70 96 48 0A 00 00 D9 C3 D8 0D D8 87 8A 00 D8 ED D9 .H..............
0041FF80 96 4C 0A 00 00 D9 C9 D9 96 50 0A 00 00 D9 CA D9 .L.......P......
0041FF90 96 54 0A 00 00 D9 CB D9 96 5C 0A 00 00 D9 C9 D9 .T.......\......
0041FFA0 9E 60 0A 00 00 D9 C9 D9 96 64 0A 00 00 D9 CA D9 .`.......d......
0041FFB0 96 68 0A 00 00 D9 CA D9 96 70 0A 00 00 D9 C3 D8 .h.......p......
0041FFC0 0D D4 87 8A 00 D8 ED D9 96 74 0A 00 00 D9 C9 D9 .........t......
0041FFD0 96 78 0A 00 00 D9 CB D9 96 7C 0A 00 00 D9 CA D9 .x.......|......
0041FFE0 96 84 0A 00 00 D9 C9 D9 9E 88 0A 00 00 D9 CA D9 ................
0041FFF0 96 8C 0A 00 00 D9 C9 D9 96 90 0A 00 00 D9 C9 D9 ................
00420000 96 98 0A 00 00 D9 CB D8 0D D0 87 8A 00 DE EC D9 ................
00420010 CB D9 96 9C 0A 00 00 D9 CA D9 96 A0 0A 00 00 D9 ................
00420020 CB D9 96 A4 0A 00 00 D9 C9 D9 9E AC 0A 00 00 D9 ................
00420030 C9 D9 9E B0 0A 00 00 D9 C9 D9 9E B4 0A 00 00 D9 ................
00420040 9E B8 0A 00 00 89 86 58 0A 00 00 89 86 6C 0A 00 .......X.....l..
00420050 00 89 86 80 0A 00 00 89 86 94 0A 00 00 B8 00 FF ................
00420060 00 00 89 86 A8 0A 00 00 89 86 BC 0A 00 00 5E 83 ..............^.
00420070 C4 08 C3 CC CC CC CC CC CC CC CC CC CC CC CC CC ................
00420080 6A FF 68 A8 FA 82 00 64 A1 00 00 00 00 50 51 56 j.h....d.....PQV
00420090 A1 88 41 A1 00 33 C4 50 8D 44 24 0C 64 A3 00 00 ..A..3.P.D$.d...
004200A0 00 00 8B F1 89 74 24 08 8D 8E 68 09 00 00 C7 44 .....t$...h....D
004200B0 24 14 00 00 00 00 E8 15 EE 18 00 8B CE C7 44 24 $.............D$
004200C0 14 FF FF FF FF E8 56 63 19 00 8B 4C 24 0C 64 89 ......Vc...L$.d.
004200D0 0D 00 00 00 00 59 5E 83 C4 10 C3 CC CC CC CC CC .....Y^.........
004200E0 6A FF 68 D9 FA 82 00 64 A1 00 00 00 00 50 83 EC j.h....d.....P..
004200F0 1C 53 56 57 A1 88 41 A1 00 33 C4 50 8D 44 24 2C .SVW..A..3.P.D$,
00420100 64 A3 00 00 00 00 8B F9 A1 4C 43 8A 00 8B 08 8B d........LC.....
00420110 74 24 40 51 8B CE FF 15 5C 43 8A 00 83 E8 04 50 t$@Q....\C.....P
00420120 8D 54 24 18 52 8B CE FF 15 40 43 8A 00 68 E8 87 .T$.R....@C..h..
00420130 8A 00 50 C7 44 24 3C 00 00 00 00 FF 15 B4 43 8A ..P.D$<.......C.
00420140 00 83 C4 08 8D 4C 24 10 8A D8 C7 44 24 34 FF FF .....L$....D$4..
00420150 FF FF FF 15 38 43 8A 00 84 DB 74 17 8B 4C 24 48 ....8C....t..L$H
00420160 FF 15 54 43 8A 00 50 FF 15 8C 46 8A 00 83 C4 04 ..TC..P...F.....
00420170 01 47 04 B0 01 8B 4C 24 2C 64 89 0D 00 00 00 00 .G....L$,d......
00420180 59 5F 5E 5B 83 C4 28 C2 10 00 CC CC CC CC CC CC Y_^[..(.........

;; fn00420190: 00420190
;;   Called from:
;;     0042B408 (in fn0042B310)
;;     0042B6B3 (in fn0042B310)
fn00420190 proc
	push	ebp
	mov	ebp,esp
	and	esp,0F8h
	sub	esp,948h
	mov	eax,[0A14188h]
	xor	eax,esp
	mov	[esp+944h],eax
	mov	ecx,[ebp+8h]
	push	esi
	push	edi
	lea	eax,[ebp+0Ch]
	push	eax
	push	ecx
	lea	edx,[esp+150h]
	push	edx
	call	dword ptr [8A4604h]
	mov	ecx,4Dh
	mov	esi,8A87F0h
	lea	edi,[esp+1Ch]

l004201D0:
	rep movsd

l004201D2:
	lea	eax,[esp+154h]
	push	eax
	movsw
	lea	ecx,[esp+20h]
	push	ecx
	lea	edx,[esp+55Ch]
	push	edx
	movsb
	call	dword ptr [8A4650h]
	lea	eax,[esp+560h]
	push	eax
	lea	ecx,[esp+24h]
	push	ecx
	mov	dword ptr [esp+28h],0h
	mov	dword ptr [esp+2Ch],6h
	call	61FC50h
	mov	ecx,[esp+96Ch]
	add	esp,20h
	pop	edi
	pop	esi
	xor	ecx,esp
	call	694B8Eh
	mov	esp,ebp
	pop	ebp
	ret
00420229                            CC CC CC CC CC CC CC          .......
00420230 85 C9 74 07 8D 81 74 51 00 00 C3 33 C0 C3 CC CC ..t...tQ...3....
00420240 E9 FB C0 09 00 CC CC CC CC CC CC CC CC CC CC CC ................
00420250 B8 00 00 04 00 C3 CC CC CC CC CC CC CC CC CC CC ................
00420260 8B 0D 78 43 A5 00 85 C9 75 03 33 C0 C3 E9 9E DD ..xC....u.3.....
00420270 03 00 CC CC CC CC CC CC CC CC CC CC CC CC CC CC ................
00420280 B8 00 00 01 00 C3 CC CC CC CC CC CC CC CC CC CC ................
00420290 8B 54 24 04 B8 01 00 00 00 39 02 75 30 80 3D 35 .T$......9.u0.=5
004202A0 98 A6 00 00 74 03 88 41 0C 80 3D 34 98 A6 00 00 ....t..A..=4....
004202B0 74 03 88 41 0C 80 3D 21 97 A6 00 00 74 03 88 41 t..A..=!....t..A
004202C0 0C 80 3D 5A 97 A6 00 00 74 03 88 41 0C C2 04 00 ..=Z....t..A....
004202D0 D9 44 24 04 D9 59 0C C2 04 00 CC CC CC CC CC CC .D$..Y..........
004202E0 8B 4C 24 10 FF 15 54 43 8A 00 8B 4C 24 08 50 FF .L$...TC...L$.P.
004202F0 15 54 43 8A 00 50 68 2C 89 8A 00 E8 80 09 10 00 .TC..Ph,........
00420300 83 C4 0C B0 01 C2 10 00 CC CC CC CC CC CC CC CC ................
00420310 8B 44 24 08 50 E8 06 FB 2B 00 83 C4 04 85 C0 77 .D$.P...+......w
00420320 0D 83 05 B8 63 A1 00 01 B8 B8 63 A1 00 C3 6A 00 ....c.....c...j.
00420330 6A 00 68 34 89 8A 00 E8 24 6A 23 00 83 C4 0C C3 j.h4....$j#.....
00420340 6A FF 68 09 FB 82 00 64 A1 00 00 00 00 50 83 EC j.h....d.....P..
00420350 1C A1 88 41 A1 00 33 C4 50 8D 44 24 20 64 A3 00 ...A..3.P.D$ d..
00420360 00 00 00 68 E8 6D 8A 00 8D 44 24 08 56 50 FF 15 ...h.m...D$.VP..
00420370 D4 43 8A 00 83 C4 0C 50 68 44 89 8A 00 B9 E0 77 .C.....PhD.....w
00420380 A5 00 C7 44 24 30 00 00 00 00 E8 C1 10 09 00 8B ...D$0..........
00420390 C8 E8 3A B4 09 00 8D 4C 24 04 C7 44 24 28 FF FF ..:....L$..D$(..
004203A0 FF FF FF 15 38 43 8A 00 8B 0D F8 3F A5 00 85 C9 ....8C.....?....
004203B0 74 09 8B 11 8B 42 10 6A 01 FF D0 8B CE FF 15 54 t....B.j.......T
004203C0 43 8A 00 50 68 5C 6D 8A 00 E8 B2 08 10 00 83 C4 C..Ph\m.........
004203D0 08 8B 4C 24 20 64 89 0D 00 00 00 00 59 83 C4 28 ..L$ d......Y..(
004203E0 C3 CC CC CC CC CC CC CC CC CC CC CC CC CC CC CC ................
004203F0 83 EC 54 80 7C 24 58 00 56 8B F1 74 4A 6A 44 8D ..T.|$X.V..tJjD.
00420400 44 24 18 6A 00 50 E8 15 4C 27 00 83 C4 0C 33 C0 D$.j.P..L'....3.
00420410 8D 4C 24 04 51 8D 54 24 18 52 50 50 50 50 50 50 .L$.Q.T$.RPPPPPP
00420420 C7 44 24 34 44 00 00 00 89 44 24 24 89 44 24 28 .D$4D....D$$.D$(
00420430 89 44 24 2C 89 44 24 30 FF 15 BC 40 8A 00 50 6A .D$,.D$0...@..Pj
00420440 00 FF 15 C0 40 8A 00 8B 86 E8 04 00 00 6A 00 6A ....@........j.j
00420450 00 6A 10 50 FF 15 60 48 8A 00 5E 83 C4 54 C2 04 .j.P..`H..^..T..
00420460 00 CC CC CC CC CC CC CC CC CC CC CC CC CC CC CC ................

;; fn00420470: 00420470
;;   Called from:
;;     0042F319 (in fn0042F170)
fn00420470 proc
	push	esi
	mov	esi,ecx
	mov	ecx,[esi+52Ch]
	test	ecx,ecx
	jz	420484h

l0042047D:
	mov	eax,[ecx]
	mov	edx,[eax+14h]
	call	edx

l00420484:
	mov	ecx,[esp+8h]
	test	ecx,ecx
	mov	[esi+52Ch],ecx
	jz	4204B8h

l00420492:
	mov	eax,[ecx]
	mov	edx,[eax+10h]
	call	edx
	cmp	byte ptr [0A696D0h],0h
	jz	4204B8h

l004204A2:
	mov	ecx,[esi+52Ch]
	mov	eax,[ecx]
	pop	esi
	mov	dword ptr [esp+4h],1h
	mov	edx,[eax+0Ch]
	jmp	edx

l004204B8:
	pop	esi
	ret	4h
004204BC                                     CC CC CC CC             ....
004204C0 51 E8 2A 70 18 00 80 78 6C 01 75 28 E8 1F 70 18 Q.*p...xl.u(..p.
004204D0 00 8A 40 6C 88 04 24 E8 14 70 18 00 8B 0C 24 8B ..@l..$..p....$.
004204E0 40 7C 6A 00 6A 00 51 50 E8 03 70 18 00 8B C8 E8 @|j.j.QP..p.....
004204F0 6C 70 18 00 59 C3 CC CC CC CC CC CC CC CC CC CC lp..Y...........
00420500 8D 81 30 05 00 00 C3 CC CC CC CC CC CC CC CC CC ..0.............

;; fn00420510: 00420510
;;   Called from:
;;     0042ADE2 (in fn0042ACF0)
fn00420510 proc
	sub	esp,8h
	push	ebx
	push	esi
	push	edi
	mov	esi,ecx
	call	dword ptr [8A48E0h]
	mov	edi,eax
	xor	ebx,ebx
	call	81DDF0h
	cmp	dword ptr [eax],2h
	jnz	42053Ah

l0042052C:
	fld	dword ptr [8A8958h]
	fstp	dword ptr [esi+4F0h]
	jmp	420587h

l0042053A:
	mov	eax,edi
	sub	eax,[esi+4F8h]
	mov	ecx,ebx
	sbb	ecx,[esi+4FCh]
	mov	[esp+0Ch],eax
	mov	[esp+10h],ecx
	fild	qword ptr [esp+0Ch]
	fmul	double ptr [8A8950h]
	fst	dword ptr [esi+4F0h]
	fld	dword ptr [8A894Ch]
	fld	dword ptr [0A544D4h]
	fcom	st(0),st(1)
	fstsw	ax
	fstp	st(1)
	test	ah,41h
	jnz	420583h

l00420579:
	fdivp	st(1),st(0)
	fstp	dword ptr [esi+4F0h]
	jmp	420587h

l00420583:
	fstp	st(1)
	fstp	st(0)

l00420587:
	call	81DDF0h
	cmp	[eax],ebx
	jz	4205B6h

l00420590:
	fld	dword ptr [esi+4F0h]
	push	ecx
	fstp	dword ptr [esp]
	call	81DDF0h
	mov	ecx,eax
	call	81DE90h
	test	al,al
	jnz	4205B6h

l004205AA:
	call	81DDF0h
	mov	ecx,eax
	call	4EC030h

l004205B6:
	fld	dword ptr [esi+4F0h]
	mov	[esi+4F8h],edi
	fadd	double ptr [esi+510h]
	pop	edi
	mov	[esi+4FCh],ebx
	fstp	double ptr [esi+510h]
	pop	esi
	pop	ebx
	add	esp,8h
	ret
004205DB                                  CC CC CC CC CC            .....
004205E0 8B 44 24 08 50 E8 36 F8 2B 00 83 C4 04 85 C0 6A .D$.P.6.+......j
004205F0 00 6A 00 77 22 8B 0D E8 3F A5 00 8B 91 E8 04 00 .j.w"...?.......
00420600 00 6A 10 52 FF 15 60 48 8A 00 83 05 B8 63 A1 00 .j.R..`H.....c..
00420610 01 B8 B8 63 A1 00 C3 68 5C 89 8A 00 E8 3F 67 23 ...c...h\....?g#
00420620 00 83 C4 0C C3 CC CC CC CC CC CC CC CC CC CC CC ................
00420630 8B 44 24 08 50 E8 E6 F7 2B 00 83 C4 04 85 C0 77 .D$.P...+......w
00420640 0D 83 05 B8 63 A1 00 01 B8 B8 63 A1 00 C3 6A 00 ....c.....c...j.
00420650 6A 00 68 64 89 8A 00 E8 04 67 23 00 83 C4 0C C3 j.hd.....g#.....
00420660 68 70 89 8A 00 E8 E6 66 23 00 83 C4 04 C3 CC CC hp.....f#.......
00420670 6A FF 68 39 FB 82 00 64 A1 00 00 00 00 50 83 EC j.h9...d.....P..
00420680 44 A1 88 41 A1 00 33 C4 50 8D 44 24 48 64 A3 00 D..A..3.P.D$Hd..
00420690 00 00 00 68 98 69 8A 00 8D 4C 24 08 FF 15 34 43 ...h.i...L$...4C
004206A0 8A 00 8D 44 24 04 50 8D 4C 24 24 C7 44 24 54 00 ...D$.P.L$$.D$T.
004206B0 00 00 00 E8 28 13 FE FF 68 68 9C 99 00 8D 4C 24 ....(...hh....L$
004206C0 24 51 C7 44 24 28 30 00 99 00 E8 FD 48 27 00 CC $Q.D$(0.....H'..
004206D0 6A FF 68 69 FB 82 00 64 A1 00 00 00 00 50 83 EC j.hi...d.....P..
004206E0 44 A1 88 41 A1 00 33 C4 50 8D 44 24 48 64 A3 00 D..A..3.P.D$Hd..
004206F0 00 00 00 68 98 69 8A 00 8D 4C 24 08 FF 15 34 43 ...h.i...L$...4C
00420700 8A 00 8D 44 24 04 50 8D 4C 24 24 C7 44 24 54 00 ...D$.P.L$$.D$T.
00420710 00 00 00 E8 C8 12 FE FF 68 68 9C 99 00 8D 4C 24 ........hh....L$
00420720 24 51 C7 44 24 28 30 00 99 00 E8 9D 48 27 00 CC $Q.D$(0.....H'..
00420730 83 C1 04 FF 25 38 43 8A 00 CC CC CC CC CC CC CC ....%8C.........

;; fn00420740: 00420740
;;   Called from:
;;     004072C1 (in fn004070F0)
;;     004072F2 (in fn004070F0)
;;     0040734E (in fn004070F0)
;;     0040ACC3 (in fn0040AB90)
;;     0040ACF1 (in fn0040AB90)
;;     00424B53 (in fn00424A20)
;;     00424B81 (in fn00424A20)
;;     004262D1 (in fn00426100)
;;     00426302 (in fn00426100)
;;     0042635E (in fn00426100)
fn00420740 proc
	mov	edx,[esp+4h]
	mov	eax,[edx]
	push	esi
	mov	esi,[eax+8h]
	mov	[edx],esi
	mov	esi,[eax+8h]
	cmp	byte ptr [esi+2Dh],0h
	jnz	420758h

l00420755:
	mov	[esi+4h],edx

l00420758:
	mov	esi,[edx+4h]
	mov	[eax+4h],esi
	mov	ecx,[ecx+4h]
	cmp	edx,[ecx+4h]
	pop	esi
	jnz	420773h

l00420767:
	mov	[ecx+4h],eax
	mov	[eax+8h],edx
	mov	[edx+4h],eax
	ret	4h

l00420773:
	mov	ecx,[edx+4h]
	cmp	edx,[ecx+8h]
	jnz	420787h

l0042077B:
	mov	[ecx+8h],eax
	mov	[eax+8h],edx
	mov	[edx+4h],eax
	ret	4h

l00420787:
	mov	[ecx],eax
	mov	[eax+8h],edx
	mov	[edx+4h],eax
	ret	4h
00420792       CC CC CC CC CC CC CC CC CC CC CC CC CC CC   ..............
004207A0 6A FF 68 99 FB 82 00 64 A1 00 00 00 00 50 83 EC j.h....d.....P..
004207B0 44 A1 88 41 A1 00 33 C4 50 8D 44 24 48 64 A3 00 D..A..3.P.D$Hd..
004207C0 00 00 00 68 98 69 8A 00 8D 4C 24 08 FF 15 34 43 ...h.i...L$...4C
004207D0 8A 00 8D 44 24 04 50 8D 4C 24 24 C7 44 24 54 00 ...D$.P.L$$.D$T.
004207E0 00 00 00 E8 F8 11 FE FF 68 68 9C 99 00 8D 4C 24 ........hh....L$
004207F0 24 51 C7 44 24 28 30 00 99 00 E8 CD 47 27 00 CC $Q.D$(0.....G'..
00420800 8B 4C 24 04 8B 54 24 08 D9 01 D8 1A DF E0 F6 C4 .L$..T$.........
00420810 41 8B C2 74 02 8B C1 C3 CC CC CC CC CC CC CC CC A..t............
00420820 8B 4C 24 08 D9 01 8B 54 24 04 D8 1A DF E0 F6 C4 .L$....T$.......
00420830 41 8B C1 74 02 8B C2 C3 CC CC CC CC CC CC CC CC A..t............

;; fn00420840: 00420840
;;   Called from:
;;     004296FE (in fn004295F0)
fn00420840 proc
	mov	eax,[ecx+4h]
	test	eax,eax
	jnz	420848h

l00420847:
	ret

l00420848:
	mov	ecx,[ecx+8h]
	sub	ecx,eax
	mov	eax,3159721Fh
	imul	ecx
	sar	edx,6h
	mov	eax,edx
	shr	eax,1Fh
	add	eax,edx
	ret
0042085F                                              CC                .

;; fn00420860: 00420860
;;   Called from:
;;     004229A6 (in fn00422980)
fn00420860 proc
	push	0FFh
	push	82FBC9h
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,44h
	mov	eax,[0A14188h]
	xor	eax,esp
	push	eax
	lea	eax,[esp+48h]
	mov	fs:[0000h],eax
	push	8A6998h
	lea	ecx,[esp+8h]
	call	dword ptr [8A4334h]
	lea	eax,[esp+4h]
	push	eax
	lea	ecx,[esp+24h]
	mov	dword ptr [esp+54h],0h
	call	4019E0h
	push	999C68h
	lea	ecx,[esp+24h]
	push	ecx
	mov	dword ptr [esp+28h],990030h
	call	694FCCh
	int	3h
	push	0FFh
	push	82FBF9h
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,44h
	mov	eax,[0A14188h]
	xor	eax,esp
	push	eax
	lea	eax,[esp+48h]
	mov	fs:[0000h],eax
	push	8A6998h
	lea	ecx,[esp+8h]
	call	dword ptr [8A4334h]
	lea	eax,[esp+4h]
	push	eax
	lea	ecx,[esp+24h]
	mov	dword ptr [esp+54h],0h
	call	4019E0h
	push	999C68h
	lea	ecx,[esp+24h]
	push	ecx
	mov	dword ptr [esp+28h],990030h
	call	694FCCh
	int	3h
	push	0FFh
	push	82FC29h
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,44h
	mov	eax,[0A14188h]
	xor	eax,esp
	push	eax
	lea	eax,[esp+48h]
	mov	fs:[0000h],eax
	push	8A6998h
	lea	ecx,[esp+8h]
	call	dword ptr [8A4334h]
	lea	eax,[esp+4h]
	push	eax
	lea	ecx,[esp+24h]
	mov	dword ptr [esp+54h],0h
	call	4019E0h
	push	999C68h
	lea	ecx,[esp+24h]
	push	ecx
	mov	dword ptr [esp+28h],990030h
	call	694FCCh
	int	3h
	push	0FFh
	push	82FC59h
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,44h
	mov	eax,[0A14188h]
	xor	eax,esp
	push	eax
	lea	eax,[esp+48h]
	mov	fs:[0000h],eax
	push	8A6998h
	lea	ecx,[esp+8h]
	call	dword ptr [8A4334h]
	lea	eax,[esp+4h]
	push	eax
	lea	ecx,[esp+24h]
	mov	dword ptr [esp+54h],0h
	call	4019E0h
	push	999C68h
	lea	ecx,[esp+24h]
	push	ecx
	mov	dword ptr [esp+28h],990030h
	call	694FCCh
	int	3h
	push	0FFh
	push	82FC89h
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,44h
	mov	eax,[0A14188h]
	xor	eax,esp
	push	eax
	lea	eax,[esp+48h]
	mov	fs:[0000h],eax
	push	8A6998h
	lea	ecx,[esp+8h]
	call	dword ptr [8A4334h]
	lea	eax,[esp+4h]
	push	eax
	lea	ecx,[esp+24h]
	mov	dword ptr [esp+54h],0h
	call	4019E0h
	push	999C68h
	lea	ecx,[esp+24h]
	push	ecx
	mov	dword ptr [esp+28h],990030h
	call	694FCCh
	int	3h
	push	0FFh
	push	82FCB9h
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,44h
	mov	eax,[0A14188h]
	xor	eax,esp
	push	eax
	lea	eax,[esp+48h]
	mov	fs:[0000h],eax
	push	8A6998h
	lea	ecx,[esp+8h]
	call	dword ptr [8A4334h]
	lea	eax,[esp+4h]
	push	eax
	lea	ecx,[esp+24h]
	mov	dword ptr [esp+54h],0h
	call	4019E0h
	push	999C68h
	lea	ecx,[esp+24h]
	push	ecx
	mov	dword ptr [esp+28h],990030h
	call	694FCCh
	int	3h

;; fn00420AA0: 00420AA0
;;   Called from:
;;     00420A9F (in fn00420860)
;;     00429696 (in fn004295F0)
fn00420AA0 proc
	push	0FFh
	push	82FCE9h
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,44h
	mov	eax,[0A14188h]
	xor	eax,esp
	push	eax
	lea	eax,[esp+48h]
	mov	fs:[0000h],eax
	push	8A6998h
	lea	ecx,[esp+8h]
	call	dword ptr [8A4334h]
	lea	eax,[esp+4h]
	push	eax
	lea	ecx,[esp+24h]
	mov	dword ptr [esp+54h],0h
	call	4019E0h
	push	999C68h
	lea	ecx,[esp+24h]
	push	ecx
	mov	dword ptr [esp+28h],990030h
	call	694FCCh
	int	3h
	push	0FFh
	push	82FD19h
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,44h
	mov	eax,[0A14188h]
	xor	eax,esp
	push	eax
	lea	eax,[esp+48h]
	mov	fs:[0000h],eax
	push	8A6998h
	lea	ecx,[esp+8h]
	call	dword ptr [8A4334h]
	lea	eax,[esp+4h]
	push	eax
	lea	ecx,[esp+24h]
	mov	dword ptr [esp+54h],0h
	call	4019E0h
	push	999C68h
	lea	ecx,[esp+24h]
	push	ecx
	mov	dword ptr [esp+28h],990030h
	call	694FCCh
	int	3h
	fld	dword ptr [esp+4h]
	fld	st(0)
	fchs
	fld	dword ptr [esp+8h]
	fcom	st(0),st(1)
	fstsw	ax
	test	ah,5h
	jpe	420B7Ah

l00420B75:
	fstp	st(2)

l00420B77:
	fstp	st(1)
	ret

l00420B7A:
	fstp	st(1)
	fcom	st(0),st(1)
	fstsw	ax
	test	ah,41h
	jnz	420B77h

l00420B85:
	fstp	st(0)
	ret
00420B88                         CC CC CC CC CC CC CC CC         ........

;; fn00420B90: 00420B90
;;   Called from:
;;     004229AD (in fn00422980)
fn00420B90 proc
	mov	ecx,[esp+4h]
	sub	esp,0Ch
	test	ecx,ecx
	ja	420BB9h

l00420B9B:
	xor	ecx,ecx

l00420B9D:
	lea	edx,[0000h+ecx*8]
	sub	edx,ecx
	add	edx,edx
	add	edx,edx
	add	edx,edx
	push	edx
	call	694FD8h
	add	esp,4h
	add	esp,0Ch
	ret

l00420BB9:
	or	eax,0FFh
	xor	edx,edx
	div	ecx
	cmp	eax,38h
	jnc	420B9Dh

l00420BC5:
	lea	eax,[esp+10h]
	push	eax
	lea	ecx,[esp+4h]
	mov	dword ptr [esp+14h],0h
	call	dword ptr [8A46ACh]
	push	999D08h
	lea	ecx,[esp+4h]
	push	ecx
	mov	dword ptr [esp+8h],990018h
	call	694FCCh
	int	3h
	int	3h
	int	3h
	int	3h
	int	3h
	int	3h
	int	3h
	int	3h
	int	3h
	int	3h
	int	3h
	int	3h
	int	3h

;; fn00420C00: 00420C00
;;   Called from:
;;     00420BFF (in fn00420B90)
;;     0042970A (in fn004295F0)
fn00420C00 proc
	mov	ecx,[esp+4h]
	sub	esp,0Ch
	test	ecx,ecx
	ja	420C20h

l00420C0B:
	xor	ecx,ecx

l00420C0D:
	imul	ecx,ecx,14Ch
	push	ecx
	call	694FD8h
	add	esp,4h
	add	esp,0Ch
	ret

l00420C20:
	or	eax,0FFh
	xor	edx,edx
	div	ecx
	cmp	eax,14Ch
	jnc	420C0Dh

l00420C2E:
	lea	eax,[esp+10h]
	push	eax
	lea	ecx,[esp+4h]
	mov	dword ptr [esp+14h],0h
	call	dword ptr [8A46ACh]
	push	999D08h
	lea	ecx,[esp+4h]
	push	ecx
	mov	dword ptr [esp+8h],990018h
	call	694FCCh
	int	3h
	int	3h
	int	3h
	int	3h
	push	0FFh
	push	82FD48h
	mov	eax,fs:[0000h]
	push	eax
	push	ecx
	push	esi
	mov	eax,[0A14188h]
	xor	eax,esp
	push	eax
	lea	eax,[esp+0Ch]
	mov	fs:[0000h],eax
	mov	esi,ecx
	mov	[esp+8h],esi
	lea	ecx,[esi+4h]
	mov	dword ptr [esp+14h],0h
	call	dword ptr [8A4338h]
	mov	ecx,esi
	mov	dword ptr [esp+14h],0FFFFFFFFh
	call	657370h
	mov	ecx,[esp+0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	esi
	add	esp,10h
	ret
00420CB9                            CC CC CC CC CC CC CC          .......
00420CC0 6A FF 68 78 FD 82 00 64 A1 00 00 00 00 50 51 56 j.hx...d.....PQV
00420CD0 A1 88 41 A1 00 33 C4 50 8D 44 24 0C 64 A3 00 00 ..A..3.P.D$.d...
00420CE0 00 00 8B F1 89 74 24 08 8D 4E 04 C7 44 24 14 00 .....t$..N..D$..
00420CF0 00 00 00 FF 15 38 43 8A 00 8B CE C7 44 24 14 FF .....8C.....D$..
00420D00 FF FF FF E8 68 66 23 00 8B 4C 24 0C 64 89 0D 00 ....hf#..L$.d...
00420D10 00 00 00 59 5E 83 C4 10 C3 CC CC CC CC CC CC CC ...Y^...........
00420D20 6A FF 68 A8 FD 82 00 64 A1 00 00 00 00 50 51 56 j.h....d.....PQV
00420D30 A1 88 41 A1 00 33 C4 50 8D 44 24 0C 64 A3 00 00 ..A..3.P.D$.d...
00420D40 00 00 8B F1 89 74 24 08 8D 4E 04 C7 44 24 14 00 .....t$..N..D$..
00420D50 00 00 00 FF 15 38 43 8A 00 8B CE C7 44 24 14 FF .....8C.....D$..
00420D60 FF FF FF E8 08 66 23 00 8B 4C 24 0C 64 89 0D 00 .....f#..L$.d...
00420D70 00 00 00 59 5E 83 C4 10 C3 CC CC CC CC CC CC CC ...Y^...........
00420D80 6A FF 68 D8 FD 82 00 64 A1 00 00 00 00 50 51 56 j.h....d.....PQV
00420D90 A1 88 41 A1 00 33 C4 50 8D 44 24 0C 64 A3 00 00 ..A..3.P.D$.d...
00420DA0 00 00 8B F1 89 74 24 08 6A FF E8 31 97 23 00 8D .....t$.j..1.#..
00420DB0 4E 04 C7 44 24 14 00 00 00 00 C7 06 78 89 8A 00 N..D$.......x...
00420DC0 FF 15 B0 43 8A 00 8B C6 8B 4C 24 0C 64 89 0D 00 ...C.....L$.d...
00420DD0 00 00 00 59 5E 83 C4 10 C3 CC CC CC CC CC CC CC ...Y^...........
00420DE0 56 8D 71 04 68 80 89 8A 00 8B CE FF 15 E0 43 8A V.q.h.........C.
00420DF0 00 68 F8 B0 A6 00 B9 D0 D1 A0 00 FF 15 18 45 8A .h............E.
00420E00 00 50 8B CE FF 15 B8 43 8A 00 5E C3 CC CC CC CC .P.....C..^.....
00420E10 6A FF 68 08 FE 82 00 64 A1 00 00 00 00 50 51 56 j.h....d.....PQV
00420E20 A1 88 41 A1 00 33 C4 50 8D 44 24 0C 64 A3 00 00 ..A..3.P.D$.d...
00420E30 00 00 8B F1 89 74 24 08 6A FF E8 A1 96 23 00 8D .....t$.j....#..
00420E40 4E 04 C7 44 24 14 00 00 00 00 C7 06 A0 89 8A 00 N..D$...........
00420E50 FF 15 B0 43 8A 00 8B C6 8B 4C 24 0C 64 89 0D 00 ...C.....L$.d...
00420E60 00 00 00 59 5E 83 C4 10 C3 CC CC CC CC CC CC CC ...Y^...........
00420E70 56 8D 71 04 68 80 89 8A 00 8B CE FF 15 E0 43 8A V.q.h.........C.
00420E80 00 68 F8 B0 A6 00 B9 08 D2 A0 00 FF 15 18 45 8A .h............E.
00420E90 00 50 8B CE FF 15 B8 43 8A 00 5E C3 CC CC CC CC .P.....C..^.....
00420EA0 6A FF 68 38 FE 82 00 64 A1 00 00 00 00 50 51 56 j.h8...d.....PQV
00420EB0 A1 88 41 A1 00 33 C4 50 8D 44 24 0C 64 A3 00 00 ..A..3.P.D$.d...
00420EC0 00 00 8B F1 89 74 24 08 6A FF E8 11 96 23 00 8D .....t$.j....#..
00420ED0 4E 04 C7 44 24 14 00 00 00 00 C7 06 A8 89 8A 00 N..D$...........
00420EE0 FF 15 B0 43 8A 00 8B C6 8B 4C 24 0C 64 89 0D 00 ...C.....L$.d...
00420EF0 00 00 00 59 5E 83 C4 10 C3 CC CC CC CC CC CC CC ...Y^...........
00420F00 56 8D 71 04 68 80 89 8A 00 8B CE FF 15 E0 43 8A V.q.h.........C.
00420F10 00 68 F8 B0 A6 00 B9 38 D2 A0 00 FF 15 18 45 8A .h.....8......E.
00420F20 00 50 8B CE FF 15 B8 43 8A 00 5E C3 CC CC CC CC .P.....C..^.....
00420F30 56 8B F1 E8 28 FD FF FF F6 44 24 08 01 74 09 56 V...(....D$..t.V
00420F40 E8 81 40 27 00 83 C4 04 8B C6 5E C2 04 00 CC CC ..@'......^.....
00420F50 56 8B F1 E8 68 FD FF FF F6 44 24 08 01 74 09 56 V...h....D$..t.V
00420F60 E8 61 40 27 00 83 C4 04 8B C6 5E C2 04 00 CC CC .a@'......^.....
00420F70 56 8B F1 E8 A8 FD FF FF F6 44 24 08 01 74 09 56 V........D$..t.V
00420F80 E8 41 40 27 00 83 C4 04 8B C6 5E C2 04 00 CC CC .A@'......^.....
00420F90 53 8B 5C 24 08 56 8B 74 24 10 3B DE 74 48 57 8B S.\$.V.t$.;.tHW.
00420FA0 7C 24 18 83 EE 38 83 EF 38 56 8B CF FF 15 58 43 |$...8..8V....XC
00420FB0 8A 00 3B F3 8B 46 1C 89 47 1C D9 46 20 D9 5F 20 ..;..F..G..F ._ 
00420FC0 D9 46 24 D9 5F 24 D9 46 28 D9 5F 28 D9 46 2C D9 .F$._$.F(._(.F,.
00420FD0 5F 2C D9 46 30 D9 5F 30 D9 46 34 D9 5F 34 75 C3 _,.F0._0.F4._4u.
00420FE0 8B C7 5F 5E 5B C3 8B 44 24 14 5E 5B C3 CC CC CC .._^[..D$.^[....
00420FF0 6A FF 68 71 FE 82 00 64 A1 00 00 00 00 50 51 56 j.hq...d.....PQV
00421000 57 A1 88 41 A1 00 33 C4 50 8D 44 24 10 64 A3 00 W..A..3.P.D$.d..
00421010 00 00 00 8B 74 24 20 89 74 24 20 89 74 24 0C 85 ....t$ .t$ .t$..
00421020 F6 C7 44 24 18 00 00 00 00 74 37 8B 7C 24 24 57 ..D$.....t7.|$$W
00421030 8B CE FF 15 3C 43 8A 00 8B 47 1C 89 46 1C D9 47 ....<C...G..F..G
00421040 20 D9 5E 20 D9 47 24 D9 5E 24 D9 47 28 D9 5E 28  .^ .G$.^$.G(.^(
00421050 D9 47 2C D9 5E 2C D9 47 30 D9 5E 30 D9 47 34 D9 .G,.^,.G0.^0.G4.
00421060 5E 34 8B 4C 24 10 64 89 0D 00 00 00 00 59 5F 5E ^4.L$.d......Y_^
00421070 83 C4 10 C3 CC CC CC CC CC CC CC CC CC CC CC CC ................
