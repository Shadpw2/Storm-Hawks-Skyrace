;;; Segment .text (00401000)
00401000 83 EC 1C 53 56 8B 35 B0 48 8A 00 57 6A 01 6A 00 ...SV.5.H..Wj.j.
00401010 6A 00 6A 00 8D 44 24 1C 50 FF D6 85 C0 74 39 8B j.j..D$.P....t9.
00401020 3D B4 48 8A 00 8B 1D B8 48 8A 00 EB 03 8D 49 00 =.H.....H.....I.
00401030 83 7C 24 10 12 74 2A 8D 4C 24 0C 51 FF D7 8D 54 .|$..t*.L$.Q...T
00401040 24 0C 52 FF D3 6A 01 6A 00 6A 00 6A 00 8D 44 24 $.R..j.j.j.j..D$
00401050 1C 50 FF D6 85 C0 75 D8 5F 5E B0 01 5B 83 C4 1C .P....u._^..[...
00401060 C3 5F 5E C6 05 D2 3E A5 00 01 32 C0 5B 83 C4 1C ._^...>...2.[...
00401070 C3 CC CC CC CC CC CC CC CC CC CC CC CC CC CC CC ................

;; fn00401080: 00401080
;;   Called from:
;;     004014E2 (in fn004014B0)
fn00401080 proc
	sub	esp,160h
	mov	eax,[0A14188h]
	xor	eax,esp
	mov	[esp+15Ch],eax
	mov	cx,[8A6978h]
	mov	eax,[esp+164h]
	mov	dl,[8A697Ah]
	push	ebp
	push	esi
	mov	[esp+8h],cx
	push	edi
	lea	ecx,[esp+0Ch]
	push	ecx
	push	eax
	mov	[esp+16h],dl
	mov	word ptr [esp+18h],22h
	xor	ebp,ebp
	call	dword ptr [8A46BCh]
	add	esp,8h
	test	eax,eax
	mov	[esp+14h],eax
	jz	40125Ch

l004010D8:
	jmp	4010E0h
004010DA                               8D 9B 00 00 00 00           ......

l004010E0:
	mov	eax,[esp+ebp*4+14h]
	mov	edi,eax
	mov	esi,8A6970h
	mov	ecx,6h
	xor	edx,edx

l004010F2:
	rep cmpsb

l004010F4:
	jz	40111Eh

l004010F6:
	mov	edi,eax
	mov	esi,8A696Ch
	mov	ecx,3h
	xor	edx,edx

l00401104:
	rep cmpsb

l00401106:
	jz	40111Eh

l00401108:
	mov	edi,eax
	mov	esi,8A6960h
	mov	ecx,0Ah
	xor	eax,eax

l00401116:
	rep cmpsb

l00401118:
	jnz	401238h

l0040111E:
	mov	edi,[8A46BCh]
	lea	ecx,[esp+0Ch]
	push	ecx
	push	0h
	add	ebp,1h
	call	edi
	add	esp,8h
	test	eax,eax
	jz	401288h

l0040113B:
	cmp	byte ptr [eax],22h
	jnz	401234h

l00401144:
	mov	ecx,eax
	lea	esi,[ecx+1h]
	lea	esp,[esp+0h]

l00401150:
	mov	dl,[ecx]
	add	ecx,1h
	test	dl,dl
	jnz	401150h

l00401159:
	sub	ecx,esi
	cmp	byte ptr [ecx+eax-1h],22h
	jnz	40118Eh

l00401162:
	mov	ecx,eax
	lea	esi,[ecx+1h]

l00401167:
	mov	dl,[ecx]
	add	ecx,1h
	test	dl,dl
	jnz	401167h

l00401170:
	sub	ecx,esi
	mov	[ecx+eax-1h],dl
	add	eax,1h
	lea	edx,[esp+64h]
	sub	edx,eax
	nop

l00401180:
	mov	cl,[eax]
	mov	[edx+eax],cl
	add	eax,1h
	test	cl,cl
	jnz	401180h

l0040118C:
	jmp	4011FCh

l0040118E:
	add	eax,1h
	lea	edx,[esp+64h]
	sub	edx,eax

l00401197:
	mov	cl,[eax]
	mov	[edx+eax],cl
	add	eax,1h
	test	cl,cl
	jnz	401197h

l004011A3:
	lea	edx,[esp+10h]
	push	edx
	push	0h
	call	edi
	lea	edi,[esp+6Ch]
	add	esp,8h
	add	edi,0FFh

l004011B6:
	mov	cl,[edi+1h]
	add	edi,1h
	test	cl,cl
	jnz	4011B6h

l004011C0:
	mov	cx,[8A695Ch]
	mov	[edi],cx
	mov	ecx,eax
	lea	esp,[esp+0h]

l004011D0:
	mov	dl,[eax]
	add	eax,1h
	test	dl,dl
	jnz	4011D0h

l004011D9:
	lea	edi,[esp+64h]
	sub	eax,ecx
	mov	esi,ecx
	add	edi,0FFh

l004011E4:
	mov	cl,[edi+1h]
	add	edi,1h
	test	cl,cl
	jnz	4011E4h

l004011EE:
	mov	ecx,eax
	shr	ecx,2h

l004011F3:
	rep movsd

l004011F5:
	mov	ecx,eax
	and	ecx,3h

l004011FA:
	rep movsb

l004011FC:
	lea	eax,[esp+64h]
	lea	edx,[eax+1h]

l00401203:
	mov	cl,[eax]
	add	eax,1h
	test	cl,cl
	jnz	401203h

l0040120C:
	sub	eax,edx
	add	eax,1h
	push	eax
	call	694B89h
	add	esp,4h
	mov	[esp+ebp*4+14h],eax
	lea	ecx,[esp+64h]
	mov	edx,eax

l00401224:
	mov	al,[ecx]
	mov	[edx],al
	add	ecx,1h
	add	edx,1h
	test	al,al
	jnz	401224h

l00401232:
	jmp	401238h

l00401234:
	mov	[esp+ebp*4+14h],eax

l00401238:
	add	ebp,1h
	cmp	ebp,14h
	jge	401288h

l00401240:
	lea	edx,[esp+0Ch]
	push	edx
	push	0h
	call	dword ptr [8A46BCh]
	add	esp,8h
	test	eax,eax
	mov	[esp+ebp*4+14h],eax
	jnz	4010E0h

l0040125C:
	lea	eax,[esp+14h]
	push	eax
	push	ebp
	call	4046D0h
	add	esp,8h
	neg	al
	pop	edi
	pop	esi
	pop	ebp
	sbb	eax,eax
	neg	eax
	mov	ecx,[esp+15Ch]
	xor	ecx,esp
	call	694B8Eh
	add	esp,160h
	ret

l00401288:
	mov	ecx,[esp+168h]
	pop	edi
	pop	esi
	pop	ebp
	xor	ecx,esp
	xor	eax,eax
	call	694B8Eh
	add	esp,160h
	ret
004012A2       CC CC CC CC CC CC CC CC CC CC CC CC CC CC   ..............
004012B0 83 EC 10 53 8B 5C 24 24 55 8B 6C 24 1C 56 8B 74 ...S.\$$U.l$.V.t
004012C0 24 24 83 FE 0F 57 8B 7C 24 2C 0F 87 32 01 00 00 $$...W.|$,..2...
004012D0 0F 84 EE 00 00 00 8D 46 FE 83 F8 04 0F 87 67 01 .......F......g.
004012E0 00 00 FF 24 85 98 14 40 00 85 FF 8B 0D E8 3F A5 ...$...@......?.
004012F0 00 75 1A 57 E8 27 0E 02 00 53 57 56 55 FF 15 98 .u.W.'...SWVU...
00401300 48 8A 00 5F 5E 5D 5B 83 C4 10 C2 10 00 6A 01 E8 H.._^][......j..
00401310 0C 0E 02 00 53 57 56 55 FF 15 98 48 8A 00 5F 5E ....SWVU...H.._^
00401320 5D 5B 83 C4 10 C2 10 00 80 3D D0 3E A5 00 00 0F ][.......=.>....
00401330 84 14 01 00 00 80 3D D1 3E A5 00 00 0F 84 07 01 ......=.>.......
00401340 00 00 8B 0D E8 3F A5 00 8B C3 C1 E8 10 50 53 E8 .....?.......PS.
00401350 7C 15 04 00 53 57 56 55 FF 15 98 48 8A 00 5F 5E |...SWVU...H.._^
00401360 5D 5B 83 C4 10 C2 10 00 83 FF 04 74 3C 83 FF 01 ][.........t<...
00401370 74 37 85 DB 74 33 80 3D D1 3E A5 00 00 C6 05 D0 t7..t3.=.>......
00401380 3E A5 00 01 0F 84 BF 00 00 00 8B 0D E8 3F A5 00 >............?..
00401390 E8 2B F1 01 00 53 57 56 55 FF 15 98 48 8A 00 5F .+...SWVU...H.._
004013A0 5E 5D 5B 83 C4 10 C2 10 00 53 57 56 55 C6 05 D0 ^][......SWVU...
004013B0 3E A5 00 00 FF 15 98 48 8A 00 5F 5E 5D 5B 83 C4 >......H.._^][..
004013C0 10 C2 10 00 80 3D D1 3E A5 00 00 75 7C 8D 4C 24 .....=.>...u|.L$
004013D0 10 51 55 FF 15 9C 48 8A 00 6A 06 8D 54 24 14 52 .QU...H..j..T$.R
004013E0 55 FF 15 A0 48 8A 00 50 FF 15 A4 48 8A 00 53 57 U...H..P...H..SW
004013F0 56 55 FF 15 98 48 8A 00 5F 5E 5D 5B 83 C4 10 C2 VU...H.._^][....
00401400 10 00 83 FE 20 74 56 83 FE 24 74 32 81 FE 12 01 .... tV..$t2....
00401410 00 00 75 35 8B C7 25 F0 FF 00 00 3D 60 F0 00 00 ..u5..%....=`...
00401420 75 27 6A 00 FF 15 A8 48 8A 00 53 57 56 55 FF 15 u'j....H..SWVU..
00401430 98 48 8A 00 5F 5E 5D 5B 83 C4 10 C2 10 00 B8 64 .H.._^][.......d
00401440 00 00 00 89 43 18 89 43 1C 53 57 56 55 FF 15 98 ....C..C.SWVU...
00401450 48 8A 00 5F 5E 5D 5B 83 C4 10 C2 10 00 E8 8E 60 H.._^][........`
00401460 1A 00 83 B8 A8 00 00 00 00 74 1D 6A 00 FF 15 AC .........t.j....
00401470 48 8A 00 E8 78 60 1A 00 8B 80 A8 00 00 00 8B 08 H...x`..........
00401480 8B 51 30 6A 01 50 FF D2 5F 5E 5D B8 01 00 00 00 .Q0j.P.._^].....
00401490 5B 83 C4 10 C2 10 00 90 22 14 40 00 28 13 40 00 [.......".@.(.@.
004014A0 49 14 40 00 68 13 40 00 E9 12 40 00 CC CC CC CC I.@.h.@...@.....

;; fn004014B0: 004014B0
;;   Called from:
;;     00694E24 (in Win32CrtStartup)
fn004014B0 proc
	push	ebp
	mov	ebp,esp
	push	0FFh
	push	82AE4Bh
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,59Ch
	push	ebx
	push	esi
	push	edi
	mov	eax,[0A14188h]
	xor	eax,ebp
	push	eax
	lea	eax,[ebp-0Ch]
	mov	fs:[0000h],eax
	mov	[ebp-10h],esp
	mov	eax,[ebp+10h]
	push	eax
	call	401080h
	add	esp,4h
	test	eax,eax
	jz	401630h

l004014F2:
	mov	ebx,[ebp+8h]
	push	3EAh
	push	ebx
	call	dword ptr [8A4844h]
	xor	ecx,ecx
	mov	[ebp-30h],ecx
	mov	[ebp-2Ch],ecx
	mov	[ebp-24h],ecx
	mov	[ebp-1Ch],ecx
	mov	[ebp-18h],ecx
	lea	ecx,[ebp-38h]
	push	ecx
	mov	dword ptr [ebp-38h],3h
	mov	dword ptr [ebp-34h],4012B0h
	mov	[ebp-28h],ebx
	mov	[ebp-20h],eax
	mov	dword ptr [ebp-14h],8A694Ch
	call	dword ptr [8A484Ch]
	test	ax,ax
	jz	401630h

l00401540:
	mov	esi,[8A4850h]
	push	20h
	call	esi
	push	21h
	mov	edi,eax
	call	esi
	push	4h
	call	esi
	push	0h
	push	ebx
	push	0h
	push	0h
	add	eax,1E0h
	push	eax
	mov	eax,[0A0D00Ch]
	lea	edx,[edi+edi+280h]
	push	edx
	push	80000000h
	push	80000000h
	push	0CF0000h
	push	eax
	push	8A694Ch
	push	0h
	call	dword ptr [8A4848h]
	mov	ecx,[ebp+14h]
	mov	esi,eax
	push	ecx
	push	esi
	mov	[ebp+10h],esi
	call	dword ptr [8A4854h]
	push	esi
	call	dword ptr [8A4890h]
	mov	edi,[8A48B0h]
	push	1h
	push	0h
	push	0h
	push	0h
	lea	edx,[ebp-70h]
	push	edx
	call	edi
	test	eax,eax
	jz	4015E6h

l004015BA:
	lea	ebx,[ebx+0h]

l004015C0:
	lea	eax,[ebp-70h]
	push	eax
	call	dword ptr [8A48B4h]
	lea	ecx,[ebp-70h]
	push	ecx
	call	dword ptr [8A48B8h]
	push	1h
	push	0h
	push	0h
	push	0h
	lea	edx,[ebp-70h]
	push	edx
	call	edi
	test	eax,eax
	jnz	4015C0h

l004015E6:
	push	1h
	call	dword ptr [8A48D8h]
	push	0A53ED4h
	lea	ecx,[ebp-5A8h]
	mov	dword ptr [ebp-4h],0h
	call	42B310h
	push	esi
	push	ebx
	lea	ecx,[ebp-5A8h]
	mov	byte ptr [ebp-4h],1h
	call	42F170h
	test	al,al
	jnz	401646h

l0040161A:
	push	esi
	call	dword ptr [8A4894h]
	lea	ecx,[ebp-5A8h]
	mov	byte ptr [ebp-4h],0h
	call	42A250h

l00401630:
	xor	eax,eax
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret	10h

l00401646:
	mov	esi,[8A48A8h]
	mov	byte ptr [0A53ED1h],1h
	mov	ebx,12h
	jmp	401660h
0040165A                               8D 9B 00 00 00 00           ......

l00401660:
	cmp	byte ptr [0A53ED2h],0h
	jnz	4016B3h

l00401669:
	push	1h
	push	0h
	push	0h
	push	0h
	lea	eax,[ebp-54h]
	push	eax
	call	edi
	test	eax,eax
	jz	401696h

l0040167B:
	cmp	[ebp-50h],ebx
	jz	4016B3h

l00401680:
	lea	ecx,[ebp-54h]
	push	ecx
	call	dword ptr [8A48B4h]
	lea	edx,[ebp-54h]
	push	edx
	call	dword ptr [8A48B8h]
	jmp	401660h

l00401696:
	movzx	eax,byte ptr [0A53ED0h]
	push	eax
	lea	ecx,[ebp-5A8h]
	call	42ACF0h
	test	al,al
	jnz	401660h

l004016AD:
	push	0h
	call	esi
	jmp	401660h

l004016B3:
	lea	ecx,[ebp-5A8h]
	mov	byte ptr [ebp-4h],0h
	call	42A250h
	push	1h
	call	dword ptr [8A48DCh]
	mov	eax,1h
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret	10h
004016E3          8B 4D 10 51 FF 15 94 48 8A 00 B8 30 16    .M.Q...H...0.
004016F0 40 00 C3 CC CC CC CC CC CC CC CC CC CC CC CC CC @...............

;; fn00401700: 00401700
;;   Called from:
;;     006572B6 (in fn00657290)
;;     007B2D71 (in fn007B2D10)
fn00401700 proc
	mov	eax,[ecx]
	mov	eax,[eax+8h]
	ret
00401706                   CC CC CC CC CC CC CC CC CC CC       ..........
00401710 E8 2B 67 00 00 8B C8 E8 74 63 00 00 E9 7F 53 00 .+g.....tc....S.
00401720 00 CC CC CC CC CC CC CC CC CC CC CC CC CC CC CC ................

;; fn00401730: 00401730
;;   Called from:
;;     0042A286 (in fn0042A250)
fn00401730 proc
	mov	eax,[0A6B0F4h]
	mov	ecx,fs:[002Ch]
	mov	edx,[ecx+eax*4]
	mov	al,[esp+4h]
	mov	[edx+4h],al
	ret
0040174A                               CC CC CC CC CC CC           ......
00401750 51 A1 4C 43 8A 00 8B 08 56 8B 74 24 10 57 51 68 Q.LC....V.t$.WQh
00401760 8C 69 8A 00 8B CE C7 44 24 10 00 00 00 00 FF 15 .i.....D$.......
00401770 48 43 8A 00 8B 15 4C 43 8A 00 8B F8 3B 3A 74 20 HC....LC....;:t 
00401780 8B CE FF 15 44 43 8A 00 50 83 C7 01 57 8B 7C 24 ....DC..P...W.|$
00401790 18 57 8B CE FF 15 40 43 8A 00 8B C7 5F 5E 59 C3 .W....@C...._^Y.
004017A0 56 8B 74 24 14 8B CE FF 15 3C 43 8A 00 5F 8B C6 V.t$.....<C.._..
004017B0 5E 59 C3 CC CC CC CC CC CC CC CC CC CC CC CC CC ^Y..............

;; fn004017C0: 004017C0
;;   Called from:
;;     0040258C (in fn004023A0)
fn004017C0 proc
	push	ecx
	mov	eax,[8A434Ch]
	mov	ecx,[eax]
	push	esi
	push	edi
	mov	edi,[esp+14h]
	push	ecx
	push	8A6990h
	mov	ecx,edi
	mov	dword ptr [esp+10h],0h
	call	dword ptr [8A4348h]
	mov	edx,[8A434Ch]
	mov	ecx,[edx]
	cmp	eax,ecx
	mov	esi,[esp+10h]
	jz	401808h

l004017F4:
	push	ecx
	add	eax,1h
	push	eax
	push	esi
	mov	ecx,edi
	call	dword ptr [8A4340h]
	pop	edi
	mov	eax,esi
	pop	esi
	pop	ecx
	ret

l00401808:
	push	8A698Fh
	mov	ecx,esi
	call	dword ptr [8A4334h]
	pop	edi
	mov	eax,esi
	pop	esi
	pop	ecx
	ret
0040181B                                  CC CC CC CC CC            .....
00401820 51 A1 4C 43 8A 00 8B 08 56 8B 74 24 10 51 68 90 Q.LC....V.t$.Qh.
00401830 69 8A 00 8B CE C7 44 24 0C 00 00 00 00 FF 15 48 i.....D$.......H
00401840 43 8A 00 8B 15 4C 43 8A 00 3B 02 74 17 57 8B 7C C....LC..;.t.W.|
00401850 24 10 50 6A 00 57 8B CE FF 15 40 43 8A 00 8B C7 $.Pj.W....@C....
00401860 5F 5E 59 C3 56 8B 74 24 10 8B CE FF 15 3C 43 8A _^Y.V.t$.....<C.
00401870 00 8B C6 5E 59 C3 CC CC CC CC CC CC CC CC CC CC ...^Y...........

;; fn00401880: 00401880
;;   Called from:
;;     004050A6 (in fn00404FF0)
fn00401880 proc
	push	esi
	mov	esi,[esp+8h]
	push	3Ah
	mov	ecx,esi
	call	dword ptr [8A4354h]
	push	eax
	call	dword ptr [8A46B0h]
	add	esp,8h
	test	eax,eax
	jnz	4018D8h

l0040189D:
	mov	ecx,esi
	call	dword ptr [8A4354h]
	cmp	byte ptr [eax],5Ch
	jz	4018D8h

l004018AA:
	mov	ecx,esi
	call	dword ptr [8A4354h]
	cmp	byte ptr [eax],2Fh
	jz	4018D8h

l004018B7:
	mov	ecx,esi
	call	dword ptr [8A4354h]
	cmp	byte ptr [eax],2Fh
	jz	4018D8h

l004018C4:
	mov	ecx,esi
	call	dword ptr [8A4354h]
	cmp	byte ptr [eax],5Ch
	jz	4018D8h

l004018D1:
	mov	eax,1h
	pop	esi
	ret

l004018D8:
	xor	eax,eax
	pop	esi
	ret
004018DC                                     CC CC CC CC             ....

;; fn004018E0: 004018E0
;;   Called from:
;;     004037D4 (in fn00403570)
fn004018E0 proc
	push	0FFh
	push	82AE93h
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,24h
	push	ebx
	push	esi
	push	edi
	mov	eax,[0A14188h]
	xor	eax,esp
	push	eax
	lea	eax,[esp+34h]
	mov	fs:[0000h],eax
	mov	esi,[esp+44h]
	mov	eax,[esp+48h]
	xor	ebx,ebx
	push	eax
	mov	ecx,esi
	mov	[esp+40h],ebx
	mov	[esp+18h],esi
	mov	[esp+14h],ebx
	call	dword ptr [8A433Ch]
	push	ebx
	push	8A6994h
	mov	ecx,esi
	mov	[esp+44h],ebx
	mov	dword ptr [esp+18h],1h
	call	dword ptr [8A4360h]
	mov	edi,eax
	cmp	edi,ebx
	jl	401989h

l00401945:
	mov	ecx,esi
	call	dword ptr [8A435Ch]
	cmp	edi,eax
	jge	401989h

l00401951:
	mov	eax,[8A434Ch]
	mov	ecx,[eax]
	push	ecx
	add	edi,1h
	push	edi
	lea	edx,[esp+20h]
	push	edx
	mov	ecx,esi
	call	dword ptr [8A4340h]
	push	eax
	mov	ecx,esi
	mov	dword ptr [esp+40h],1h
	call	dword ptr [8A4358h]
	lea	ecx,[esp+18h]
	mov	[esp+3Ch],bl
	call	dword ptr [8A4338h]

l00401989:
	mov	eax,esi
	mov	ecx,[esp+34h]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebx
	add	esp,30h
	ret
0040199E                                           CC CC               ..
004019A0 C7 01 18 00 99 00 FF 25 A4 46 8A 00 CC CC CC CC .......%.F......
004019B0 56 8B F1 C7 06 18 00 99 00 FF 15 A4 46 8A 00 F6 V...........F...
004019C0 44 24 08 01 74 09 56 E8 FA 35 29 00 83 C4 04 8B D$..t.V..5).....
004019D0 C6 5E C2 04 00 CC CC CC CC CC CC CC CC CC CC CC .^..............

;; fn004019E0: 004019E0
;;   Called from:
;;     00401AB3 (in fn00401A70)
;;     00407143 (in fn004070F0)
;;     004090F3 (in fn004090B0)
;;     00409153 (in fn004090B0)
;;     0040ABE2 (in fn0040AB90)
;;     0040C182 (in fn0040C130)
;;     0040DA03 (in fn0040D9C0)
;;     0040DA63 (in fn0040D9C0)
;;     0040DA63 (in fn0040DA20)
;;     0040DAC3 (in fn0040D9C0)
;;     0040DAC3 (in fn0040DA20)
;;     0040DB23 (in fn0040D9C0)
;;     0040DB23 (in fn0040DA20)
;;     0040DB23 (in fn0040DAE0)
;;     0040DB83 (in fn0040D9C0)
;;     0040DB83 (in fn0040DA20)
;;     0040DB83 (in fn0040DAE0)
;;     0040DBE3 (in fn0040D9C0)
;;     0040DBE3 (in fn0040DA20)
;;     0040DBE3 (in fn0040DAE0)
;;     0040DC43 (in fn0040D9C0)
;;     0040DC43 (in fn0040DA20)
;;     0040DC43 (in fn0040DAE0)
;;     0040DCA3 (in fn0040D9C0)
;;     0040DCA3 (in fn0040DA20)
;;     0040DCA3 (in fn0040DAE0)
;;     0040DD03 (in fn0040D9C0)
;;     0040DD03 (in fn0040DCC0)
;;     0040DD63 (in fn0040D9C0)
;;     0040DD63 (in fn0040DCC0)
;;     0040DDC3 (in fn0040D9C0)
;;     0040DDC3 (in fn0040DCC0)
;;     00415D03 (in fn00415CC0)
;;     00415D63 (in fn00415CC0)
;;     00415DC3 (in fn00415CC0)
;;     00415DC3 (in fn00415D80)
;;     0041BB73 (in fn0041BB30)
;;     0041BBD3 (in fn0041BB30)
;;     004208A3 (in fn00420860)
;;     00420903 (in fn00420860)
;;     00420963 (in fn00420860)
;;     004209C3 (in fn00420860)
;;     00420A23 (in fn00420860)
;;     00420A83 (in fn00420860)
;;     00420AE3 (in fn00420AA0)
;;     00420B43 (in fn00420AA0)
;;     00424A72 (in fn00424A20)
;;     00426153 (in fn00426100)
;;     0044C663 (in fn0044C620)
;;     0044C6C3 (in fn0044C620)
;;     0044C723 (in fn0044C620)
;;     0044C783 (in fn0044C620)
;;     004DB693 (in fn004DB650)
;;     004DB6F3 (in fn004DB6B0)
;;     005A37C3 (in fn005A3780)
;;     005B6166 (in fn005B6110)
;;     00621473 (in fn00621430)
;;     006214D3 (in fn00621490)
;;     00621533 (in fn00621490)
;;     00621533 (in fn006214F0)
fn004019E0 proc
	push	0FFh
	push	82AEB9h
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
	mov	dword ptr [esi],990024h
	call	dword ptr [8A433Ch]
	mov	eax,esi
	mov	ecx,[esp+0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	esi
	add	esp,10h
	ret	4h
00401A3F                                              CC                .
00401A40 56 8B F1 8D 4E 0C C7 06 24 00 99 00 FF 15 38 43 V...N...$.....8C
00401A50 8A 00 8B CE FF 15 A4 46 8A 00 F6 44 24 08 01 74 .......F...D$..t
00401A60 09 56 E8 5F 35 29 00 83 C4 04 8B C6 5E C2 04 00 .V._5)......^...

;; fn00401A70: 00401A70
;;   Called from:
;;     00401EE6 (in fn00401EC0)
;;     004039ED (in fn00403950)
fn00401A70 proc
	push	0FFh
	push	82AEE9h
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

;; fn00401AD0: 00401AD0
;;   Called from:
;;     00402825 (in fn004023A0)
;;     00402845 (in fn004023A0)
;;     004028F9 (in fn004028E0)
;;     00402A77 (in fn00402A20)
;;     00404403 (in fn00404190)
;;     00405D60 (in fn00405CE0)
;;     00406B99 (in fn00406B00)
;;     0040E464 (in fn0040E370)
;;     0040E483 (in fn0040E370)
;;     0040E53A (in fn0040E500)
;;     0040E54B (in fn0040E500)
;;     0040E572 (in fn0040E500)
;;     0040E7C2 (in fn0040E780)
;;     0040E95B (in fn0040E780)
;;     0040E9CD (in fn0040E780)
;;     0040ED61 (in fn0040ED30)
;;     0040ED68 (in fn0040ED30)
;;     0040ED8F (in fn0040ED30)
;;     0040EE18 (in fn0040EDE0)
;;     0040EE37 (in fn0040EDE0)
;;     0040EE5A (in fn0040EDE0)
;;     0040FFE6 (in fn0040FF40)
;;     0041006D (in fn0040FF40)
;;     004100C7 (in fn0040FF40)
;;     0041023C (in fn004100F0)
;;     004102B8 (in fn004100F0)
;;     00412E2F (in fn00412E10)
;;     00413AC6 (in fn00413A20)
;;     00413B39 (in fn00413A20)
;;     00414BC0 (in fn00414B80)
;;     004173FA (in fn004173D0)
;;     00417473 (in fn00417430)
;;     0041748E (in fn00417430)
;;     00417B3D (in fn00417AF0)
;;     00417B4E (in fn00417AF0)
;;     00417C7F (in fn00417C60)
;;     0041905B (in fn00418D40)
;;     0041920B (in fn00418D40)
;;     00419902 (in fn00419800)
;;     004199BE (in fn00419800)
;;     0041C52B (in fn0041C4C0)
;;     0041E70E (in fn0041E670)
;;     0041E74F (in fn0041E670)
;;     0041EAF4 (in fn0041EA60)
;;     00424E97 (in fn00424E30)
;;     00424F1F (in fn00424EC0)
;;     00424FE6 (in fn00424FD0)
;;     0042B451 (in fn0042B310)
;;     0042B491 (in fn0042B310)
;;     0042DDE3 (in fn0042DC50)
;;     0042DE1C (in fn0042DC50)
;;     0042DE55 (in fn0042DC50)
;;     0046E2CC (in fn0046E280)
;;     005C9B62 (in fn005C9B40)
;;     005C9BC2 (in fn005C9BA0)
;;     005CF0D6 (in fn005CF0C0)
;;     007B1F88 (in fn007B1F60)
;;     007B20F6 (in fn007B20A0)
;;     007B2553 (in fn007B24F7)
fn00401AD0 proc
	lock
	add	dword ptr [ecx+4h],1h
	ret
00401AD6                   CC CC CC CC CC CC CC CC CC CC       ..........

;; fn00401AE0: 00401AE0
;;   Called from:
;;     00402355 (in fn00402310)
;;     00402850 (in fn004023A0)
;;     00402872 (in fn004023A0)
;;     00402A93 (in fn00402A20)
;;     00402B02 (in fn00402A20)
;;     00402B2F (in fn00402A20)
;;     00402CEE (in fn00402B60)
;;     0040441A (in fn00404190)
;;     00404564 (in fn00404190)
;;     004045B2 (in fn00404190)
;;     00405D67 (in fn00405CE0)
;;     004070AA (in fn00407070)
;;     0040E48E (in fn0040E370)
;;     0040E4AD (in fn0040E370)
;;     0040E552 (in fn0040E500)
;;     0040E590 (in fn0040E500)
;;     0040E96F (in fn0040E780)
;;     0040E9E5 (in fn0040E780)
;;     0040ED6F (in fn0040ED30)
;;     0040EDB1 (in fn0040ED30)
;;     0040EE3E (in fn0040EDE0)
;;     0040EE74 (in fn0040EDE0)
;;     0040EF03 (in fn0040EEA0)
;;     0040EFB3 (in fn0040EF50)
;;     0040FFFA (in fn0040FF40)
;;     004102CF (in fn004100F0)
;;     00413AE3 (in fn00413A20)
;;     00413B57 (in fn00413A20)
;;     00413B99 (in fn00413A20)
;;     00413C91 (in fn00413A20)
;;     00413CCB (in fn00413A20)
;;     00413D1A (in fn00413A20)
;;     00413D3E (in fn00413A20)
;;     00414E1D (in fn00414B80)
;;     00417405 (in fn004173D0)
;;     00417499 (in fn00417430)
;;     004174BB (in fn00417430)
;;     00417B59 (in fn00417AF0)
;;     0041908B (in fn00418D40)
;;     004195C3 (in fn00418D40)
;;     004199DD (in fn00419800)
;;     0041C0BC (in fn0041C0B0)
;;     0041C605 (in fn0041C4C0)
;;     0041EB18 (in fn0041EA60)
;;     00424EA2 (in fn00424E30)
;;     0042B465 (in fn0042B310)
;;     0042B659 (in fn0042B310)
;;     0042B67A (in fn0042B310)
;;     0042DDEE (in fn0042DC50)
;;     0042DE27 (in fn0042DC50)
;;     0042DE60 (in fn0042DC50)
;;     0044F618 (in fn0044F600)
;;     0046E2D7 (in fn0046E280)
;;     0046E2F5 (in fn0046E280)
;;     0046E32E (in fn0046E280)
;;     005AEF10 (in fn005AEED0)
;;     005AEF3F (in fn005AEED0)
;;     005AEF6E (in fn005AEED0)
;;     005B87C0 (in fn005B87B0)
;;     005C9B6D (in fn005C9B40)
;;     005C9BCD (in fn005C9BA0)
;;     005CF0E1 (in fn005CF0C0)
;;     007B1F98 (in fn007B1F60)
;;     007B2101 (in fn007B20A0)
;;     007B2126 (in fn007B20A0)
;;     007B2E27 (in fn007B2D10)
;;     007B2ED8 (in fn007B2D10)
fn00401AE0 proc
	mov	eax,0FFFFFFFFh
	lock
	xadd	[ecx+4h],eax
	ret
00401AEB                                  CC CC CC CC CC            .....
00401AF0 6A FF 68 21 AF 82 00 64 A1 00 00 00 00 50 51 A1 j.h!...d.....PQ.
00401B00 88 41 A1 00 33 C4 50 8D 44 24 08 64 A3 00 00 00 .A..3.P.D$.d....
00401B10 00 8B 4C 24 18 89 4C 24 18 89 4C 24 04 85 C9 C7 ..L$..L$..L$....
00401B20 44 24 10 00 00 00 00 74 0B 8B 44 24 1C 50 FF 15 D$.....t..D$.P..
00401B30 3C 43 8A 00 8B 4C 24 08 64 89 0D 00 00 00 00 59 <C...L$.d......Y
00401B40 83 C4 10 C3 CC CC CC CC CC CC CC CC CC CC CC CC ................
00401B50 6A FF 68 49 AF 82 00 64 A1 00 00 00 00 50 51 56 j.hI...d.....PQV
00401B60 57 A1 88 41 A1 00 33 C4 50 8D 44 24 10 64 A3 00 W..A..3.P.D$.d..
00401B70 00 00 00 8B F1 89 74 24 0C 8B 7C 24 20 57 FF 15 ......t$..|$ W..
00401B80 94 46 8A 00 83 C7 0C 57 8D 4E 0C C7 44 24 1C 00 .F.....W.N..D$..
00401B90 00 00 00 C7 06 24 00 99 00 FF 15 3C 43 8A 00 8B .....$.....<C...
00401BA0 C6 8B 4C 24 10 64 89 0D 00 00 00 00 59 5F 5E 83 ..L$.d......Y_^.
00401BB0 C4 10 C2 04 00 CC CC CC CC CC CC CC CC CC CC CC ................
00401BC0 56 8B F1 8B 06 8B 08 8B 49 04 03 C8 FF 15 6C 43 V.......I.....lC
00401BD0 8A 00 85 C0 74 18 8B 06 8B 10 8B 4A 04 03 C8 FF ....t......J....
00401BE0 15 6C 43 8A 00 8B C8 5E FF 25 70 43 8A 00 5E C3 .lC....^.%pC..^.
00401BF0 8B 44 24 04 56 50 8B F1 E8 53 FF FF FF C7 06 30 .D$.VP...S.....0
00401C00 00 99 00 8B C6 5E C2 04 00 CC CC CC CC CC CC CC .....^..........
00401C10 8B 44 24 04 56 50 8B F1 FF 15 94 46 8A 00 C7 06 .D$.VP.....F....
00401C20 18 00 99 00 8B C6 5E C2 04 00 CC CC CC CC CC CC ......^.........
00401C30 A1 F4 B0 A6 00 64 8B 0D 2C 00 00 00 8B 14 81 80 .....d..,.......
00401C40 BA 04 00 00 00 00 74 23 8B 4C 24 08 FF 15 54 43 ......t#.L$...TC
00401C50 8A 00 8B 4C 24 04 50 FF 15 54 43 8A 00 50 68 AC ...L$.P..TC..Ph.
00401C60 69 8A 00 E8 18 F0 11 00 83 C4 0C C3 CC CC CC CC i...............

;; fn00401C70: 00401C70
;;   Called from:
;;     0040246F (in fn004023A0)
;;     0040271B (in fn004023A0)
fn00401C70 proc
	push	ecx
	push	esi
	mov	dword ptr [esp+4h],0h
	call	4048C0h
	mov	eax,[eax]
	mov	edx,[eax+18h]
	add	eax,14h
	test	edx,edx
	jz	401D09h

l00401C8B:
	mov	ecx,[eax+8h]
	sub	ecx,edx
	mov	eax,92492493h
	imul	ecx
	add	edx,ecx
	sar	edx,4h
	mov	eax,edx
	shr	eax,1Fh
	add	eax,edx
	jz	401D09h

l00401CA5:
	mov	esi,[esp+10h]
	test	esi,esi
	jl	401D09h

l00401CAD:
	call	4048C0h
	mov	eax,[eax]
	mov	edx,[eax+18h]
	add	eax,14h
	test	edx,edx
	jnz	401CC2h

l00401CBE:
	xor	eax,eax
	jmp	401CDAh

l00401CC2:
	mov	ecx,[eax+8h]
	sub	ecx,edx
	mov	eax,92492493h
	imul	ecx
	add	edx,ecx
	sar	edx,4h
	mov	eax,edx
	shr	eax,1Fh
	add	eax,edx

l00401CDA:
	cmp	esi,eax
	jge	401D09h

l00401CDE:
	call	4048C0h
	mov	eax,[eax]
	mov	edx,[eax+18h]
	add	eax,14h
	lea	ecx,[0000h+esi*8]
	sub	ecx,esi
	mov	esi,[esp+0Ch]
	lea	eax,[edx+ecx*4]
	push	eax
	mov	ecx,esi
	call	dword ptr [8A433Ch]
	mov	eax,esi
	pop	esi
	pop	ecx
	ret

l00401D09:
	mov	esi,[esp+0Ch]
	push	8A698Fh
	mov	ecx,esi
	call	dword ptr [8A4334h]
	mov	eax,esi
	pop	esi
	pop	ecx
	ret
00401D1F                                              CC                .
00401D20 56 8B F1 E8 B8 FD FF FF 83 F8 01 75 0E 85 F6 74 V..........u...t
00401D30 0A 8B 06 8B 10 6A 01 8B CE FF D2 5E C3 CC CC CC .....j.....^....

;; fn00401D40: 00401D40
;;   Called from:
;;     00403BEE (in fn00403950)
;;     00403C55 (in fn00403950)
fn00401D40 proc
	push	esi
	mov	esi,[esp+8h]
	push	edi
	mov	edi,[esp+10h]
	cmp	esi,edi
	jz	401D64h

l00401D4E:
	push	ebx
	mov	ebx,[esp+18h]

l00401D53:
	push	ebx
	mov	ecx,esi
	call	dword ptr [8A4358h]
	add	esi,1Ch
	cmp	esi,edi
	jnz	401D53h

l00401D63:
	pop	ebx

l00401D64:
	pop	edi
	pop	esi
	ret
00401D67                      CC CC CC CC CC CC CC CC CC        .........
00401D70 6A FF 68 78 AF 82 00 64 A1 00 00 00 00 50 51 56 j.hx...d.....PQV
00401D80 57 A1 88 41 A1 00 33 C4 50 8D 44 24 10 64 A3 00 W..A..3.P.D$.d..
00401D90 00 00 00 8B F9 89 7C 24 0C 8B 74 24 20 89 37 8B ......|$..t$ .7.
00401DA0 06 8B 48 04 03 CE FF 15 6C 43 8A 00 85 C0 74 17 ..H.....lC....t.
00401DB0 8B 07 8B 08 8B 49 04 03 C8 FF 15 6C 43 8A 00 8B .....I.....lC...
00401DC0 C8 FF 15 68 43 8A 00 8B 16 8B 4A 04 03 CE C7 44 ...hC.....J....D
00401DD0 24 18 00 00 00 00 FF 15 7C 43 8A 00 84 C0 74 26 $.......|C....t&
00401DE0 8B 06 8B 48 04 03 CE FF 15 78 43 8A 00 85 C0 74 ...H.....xC....t
00401DF0 15 8B 0E 8B 49 04 03 CE FF 15 78 43 8A 00 8B C8 ....I.....xC....
00401E00 FF 15 74 43 8A 00 8B 16 8B 4A 04 03 CE FF 15 7C ..tC.....J.....|
00401E10 43 8A 00 88 47 04 8B C7 8B 4C 24 10 64 89 0D 00 C...G....L$.d...
00401E20 00 00 00 59 5F 5E 83 C4 10 C2 04 00 CC CC CC CC ...Y_^..........
00401E30 6A FF 68 A8 AF 82 00 64 A1 00 00 00 00 50 51 56 j.h....d.....PQV
00401E40 A1 88 41 A1 00 33 C4 50 8D 44 24 0C 64 A3 00 00 ..A..3.P.D$.d...
00401E50 00 00 8B F1 89 74 24 08 C7 44 24 14 00 00 00 00 .....t$..D$.....
00401E60 FF 15 84 43 8A 00 84 C0 75 08 8B 0E FF 15 80 43 ...C....u......C
00401E70 8A 00 8B 06 8B 08 8B 49 04 03 C8 C7 44 24 14 FF .......I....D$..
00401E80 FF FF FF FF 15 6C 43 8A 00 85 C0 74 17 8B 06 8B .....lC....t....
00401E90 10 8B 4A 04 03 C8 FF 15 6C 43 8A 00 8B C8 FF 15 ..J.....lC......
00401EA0 70 43 8A 00 8B 4C 24 0C 64 89 0D 00 00 00 00 59 pC...L$.d......Y
00401EB0 5E 83 C4 10 C3 CC CC CC CC CC CC CC CC CC CC CC ^...............

;; fn00401EC0: 00401EC0
;;   Called from:
;;     004086F3 (in fn004085A0)
;;     00409D35 (in fn00409CE0)
fn00401EC0 proc
	push	esi
	xor	eax,eax
	push	edi
	mov	edi,[esp+0Ch]
	cmp	edi,eax
	mov	esi,ecx
	mov	[esi+4h],eax
	mov	[esi+8h],eax
	mov	[esi+0Ch],eax
	jnz	401EDEh

l00401ED7:
	pop	edi
	xor	al,al
	pop	esi
	ret	4h

l00401EDE:
	cmp	edi,9249249h
	jbe	401EEBh

l00401EE6:
	call	401A70h

l00401EEB:
	push	eax
	push	edi
	call	40DDE0h
	lea	ecx,[0000h+edi*8]
	sub	ecx,edi
	add	esp,8h
	lea	edx,[eax+ecx*4]
	mov	[esi+4h],eax
	mov	[esi+8h],eax
	pop	edi
	mov	[esi+0Ch],edx
	mov	al,1h
	pop	esi
	ret	4h
00401F11    CC CC CC CC CC CC CC CC CC CC CC CC CC CC CC  ...............
00401F20 55 8B EC 6A FF 68 D8 AF 82 00 64 A1 00 00 00 00 U..j.h....d.....
00401F30 50 83 EC 1C 53 56 57 A1 88 41 A1 00 33 C5 50 8D P...SVW..A..3.P.
00401F40 45 F4 64 A3 00 00 00 00 89 65 F0 8B 45 0C 33 FF E.d......e..E.3.
00401F50 50 89 7D EC FF 15 AC 43 8A 00 8B 75 08 8B 0E 8B P.}....C...u....
00401F60 49 04 8B D8 83 C4 04 03 CE 89 5D E8 FF 15 A8 43 I.........]....C
00401F70 8A 00 85 C0 7E 22 8B 16 8B 4A 04 03 CE FF 15 A8 ....~"...J......
00401F80 43 8A 00 3B C3 7E 11 8B 06 8B 48 04 03 CE FF 15 C..;.~....H.....
00401F90 A8 43 8A 00 8B F8 2B FB 56 8D 4D D8 E8 CF FD FF .C....+.V.M.....
00401FA0 FF 80 7D DC 00 C7 45 FC 00 00 00 00 75 0C C7 45 ..}...E.....u..E
00401FB0 EC 04 00 00 00 E9 29 01 00 00 8B 0E 8B 49 04 03 ......)......I..
00401FC0 CE C6 45 FC 01 FF 15 A4 43 8A 00 25 C0 01 00 00 ..E.....C..%....
00401FD0 83 F8 40 74 57 85 FF 7E 4D 8B 16 8B 4A 04 03 CE ..@tW..~M...J...
00401FE0 FF 15 A0 43 8A 00 8A D8 8B 06 8B 48 04 03 CE FF ...C.......H....
00401FF0 15 6C 43 8A 00 53 8B C8 FF 15 9C 43 8A 00 89 45 .lC..S.....C...E
00402000 E4 FF 15 98 43 8A 00 8D 4D E4 51 8D 55 E0 52 89 ....C...M.Q.U.R.
00402010 45 E0 FF 15 94 43 8A 00 8B 5D E8 83 C4 08 84 C0 E....C...]......
00402020 74 47 83 4D EC 04 83 7D EC 00 75 25 8B 06 8B 48 tG.M...}..u%...H
00402030 04 03 CE FF 15 6C 43 8A 00 8B 4D 0C 53 51 8B C8 .....lC...M.SQ..
00402040 FF 15 90 43 8A 00 3B C3 74 27 C7 45 EC 04 00 00 ...C..;.t'.E....
00402050 00 8B 06 8B 48 04 6A 00 03 CE FF 15 8C 43 8A 00 ....H.j......C..
00402060 C7 45 FC 00 00 00 00 EB 7A 83 EF 01 E9 64 FF FF .E......z....d..
00402070 FF 85 FF 7E DC 8B 16 8B 4A 04 03 CE FF 15 A0 43 ...~....J......C
00402080 8A 00 8A D8 8B 06 8B 48 04 03 CE FF 15 6C 43 8A .......H.....lC.
00402090 00 53 8B C8 FF 15 9C 43 8A 00 89 45 E0 FF 15 98 .S.....C...E....
004020A0 43 8A 00 8D 4D E0 51 8D 55 E4 52 89 45 E4 FF 15 C...M.Q.U.R.E...
004020B0 94 43 8A 00 83 C4 08 84 C0 74 06 83 4D EC 04 EB .C.......t..M...
004020C0 90 83 EF 01 EB AB 8B 45 08 8B 08 8B 49 04 6A 01 .......E....I.j.
004020D0 6A 04 03 C8 FF 15 88 43 8A 00 B8 E0 20 40 00 C3 j......C.... @..
004020E0 8B 75 08 8B 06 8B 55 EC 8B 48 04 6A 00 52 03 CE .u....U..H.j.R..
004020F0 FF 15 88 43 8A 00 8D 4D D8 C7 45 FC FF FF FF FF ...C...M..E.....
00402100 E8 2B FD FF FF 8B C6 8B 4D F4 64 89 0D 00 00 00 .+......M.d.....
00402110 00 59 5F 5E 5B 8B E5 5D C3 CC CC CC CC CC CC CC .Y_^[..]........

;; fn00402120: 00402120
;;   Called from:
;;     00403C45 (in fn00403950)
fn00402120 proc
	push	ebx
	mov	ebx,[esp+8h]
	push	esi
	mov	esi,[esp+10h]
	cmp	ebx,esi
	push	edi
	mov	edi,[esp+18h]
	jz	402146h

l00402133:
	sub	esi,1Ch
	sub	edi,1Ch
	push	esi
	mov	ecx,edi
	call	dword ptr [8A4364h]
	cmp	esi,ebx
	jnz	402133h

l00402146:
	mov	eax,edi
	pop	edi
	pop	esi
	pop	ebx
	ret
0040214C                                     CC CC CC CC             ....

;; fn00402150: 00402150
;;   Called from:
;;     00402E9E (in fn00402E80)
;;     00403A9A (in fn00403950)
;;     00403AC8 (in fn00403950)
fn00402150 proc
	push	ebp
	mov	ebp,esp
	push	0FFh
	push	82B01Ah
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,34h
	mov	eax,[0A14188h]
	xor	eax,ebp
	mov	[ebp-14h],eax
	push	ebx
	push	esi
	push	edi
	push	eax
	lea	eax,[ebp-0Ch]
	mov	fs:[0000h],eax
	mov	[ebp-10h],esp
	mov	esi,[ebp+10h]
	mov	edi,[ebp+8h]
	lea	ecx,[ebp-30h]
	mov	[ebp-34h],esi
	mov	[ebp-38h],esi
	call	dword ptr [8A43B0h]
	mov	ebx,[ebp+0Ch]
	mov	dword ptr [ebp-4h],0h
	lea	ecx,[ecx+0h]

l004021A0:
	cmp	edi,ebx
	jz	4021F8h

l004021A4:
	mov	[ebp-3Ch],esi
	mov	[ebp-40h],esi
	test	esi,esi
	mov	byte ptr [ebp-4h],2h
	jz	4021BEh

l004021B2:
	lea	eax,[ebp-30h]
	push	eax
	mov	ecx,esi
	call	dword ptr [8A433Ch]

l004021BE:
	push	edi
	mov	ecx,esi
	mov	byte ptr [ebp-4h],1h
	call	dword ptr [8A4364h]
	add	esi,1Ch
	mov	[ebp-34h],esi
	add	edi,1Ch
	jmp	4021A0h
004021D6                   8B 75 C8 8B 7D CC 3B F7 74 0F       .u..}.;.t.
004021E0 8B CE FF 15 38 43 8A 00 83 C6 1C 3B F7 75 F1 6A ....8C.....;.u.j
004021F0 00 6A 00 E8 D4 2D 29 00                         .j...-).       

l004021F8:
	lea	ecx,[ebp-30h]
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	dword ptr [8A4338h]
	mov	eax,esi
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebx
	mov	ecx,[ebp-14h]
	xor	ecx,ebp
	call	694B8Eh
	mov	esp,ebp
	pop	ebp
	ret
00402226                   CC CC CC CC CC CC CC CC CC CC       ..........

;; fn00402230: 00402230
;;   Called from:
;;     00402DDF (in fn00402D20)
;;     00403529 (in fn00403420)
;;     00403723 (in fn00403570)
;;     00403797 (in fn00403570)
;;     0040383C (in fn00403570)
;;     00405413 (in fn00405370)
;;     0040CFA9 (in fn0040CBA0)
fn00402230 proc
	sub	esp,8h
	mov	eax,[esp+0Ch]
	mov	ecx,[esp+20h]
	push	esi
	mov	esi,[esp+20h]
	push	edi
	mov	edi,[esp+20h]
	mov	[esp+8h],eax
	mov	eax,[esp+18h]
	lea	ecx,[ecx+0h]

l00402250:
	cmp	eax,edi
	jz	402263h

l00402254:
	mov	dl,[eax]
	cmp	dl,[esi]
	jnz	40225Eh

l0040225A:
	mov	dl,[ecx]
	mov	[eax],dl

l0040225E:
	add	eax,1h
	jmp	402250h

l00402263:
	pop	edi
	pop	esi
	add	esp,8h
	ret
00402269                            CC CC CC CC CC CC CC          .......

;; fn00402270: 00402270
;;   Called from:
;;     004033D2 (in fn004033B0)
;;     00403F34 (in fn00403ED0)
fn00402270 proc
	push	ebp
	mov	ebp,esp
	push	0FFh
	push	82B051h
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,0Ch
	push	ebx
	push	esi
	push	edi
	mov	eax,[0A14188h]
	xor	eax,ebp
	push	eax
	lea	eax,[ebp-0Ch]
	mov	fs:[0000h],eax
	mov	[ebp-10h],esp
	mov	esi,[ebp+8h]
	mov	edi,[ebp+0Ch]
	xor	ebx,ebx
	mov	[ebp-14h],esi
	mov	[ebp-4h],ebx
	lea	esp,[esp+0h]

l004022B0:
	cmp	edi,ebx
	jbe	4022FEh

l004022B4:
	mov	[ebp+0Ch],esi
	mov	[ebp-18h],esi
	cmp	esi,ebx
	mov	byte ptr [ebp-4h],1h
	jz	4022CEh

l004022C2:
	mov	eax,[ebp+10h]
	push	eax
	mov	ecx,esi
	call	dword ptr [8A433Ch]

l004022CE:
	sub	edi,1h
	add	esi,1Ch
	mov	[ebp-4h],bl
	mov	[ebp+8h],esi
	jmp	4022B0h
004022DC                                     8B 75 EC 8B             .u..
004022E0 7D 08 3B F7 74 0F 8B CE FF 15 38 43 8A 00 83 C6 }.;.t.....8C....
004022F0 1C 3B F7 75 F1 33 DB 53 53 E8 CE 2C 29 00       .;.u.3.SS..,). 

l004022FE:
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret

;; fn00402310: 00402310
;;   Called from:
;;     00402414 (in fn004023A0)
fn00402310 proc
	push	0FFh
	push	82B078h
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
	mov	edi,ecx
	mov	dword ptr [esp+0Ch],0h
	mov	esi,[edi+4h]
	test	esi,esi
	mov	dword ptr [esp+18h],0h
	jz	402369h

l0040234C:
	mov	ecx,esi
	mov	dword ptr [edi+4h],0h
	call	401AE0h
	cmp	eax,1h
	jnz	402369h

l0040235F:
	mov	eax,[esi]
	mov	edx,[eax]
	push	1h
	mov	ecx,esi
	call	edx

l00402369:
	mov	ecx,[edi+8h]
	test	ecx,ecx
	mov	dword ptr [esp+18h],0FFFFFFFFh
	jz	402380h

l00402378:
	mov	eax,[ecx]
	mov	edx,[eax]
	push	1h
	call	edx

l00402380:
	cmp	byte ptr [esp+20h],0h
	jz	40238Ch

l00402387:
	call	407EC0h

l0040238C:
	mov	ecx,[esp+10h]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	add	esp,10h
	ret	4h

;; fn004023A0: 004023A0
;;   Called from:
;;     00404151 (in fn00403F70)
;;     0040488E (in fn004046D0)
fn004023A0 proc
	push	0FFh
	push	82B168h
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,0B4h
	mov	eax,[0A14188h]
	xor	eax,esp
	mov	[esp+0B0h],eax
	push	ebx
	push	ebp
	push	esi
	push	edi
	mov	eax,[0A14188h]
	xor	eax,esp
	push	eax
	lea	eax,[esp+0C8h]
	mov	fs:[0000h],eax
	xor	ebx,ebx
	mov	[esp+14h],ebx
	cmp	[0A53EF0h],bl
	mov	ebp,ecx
	jnz	40240Eh

l004023EB:
	lea	eax,[esp+18h]
	push	8A6A58h
	push	eax
	mov	[esp+20h],ebx
	mov	dword ptr [esp+24h],6h
	call	61FC50h
	add	esp,8h
	jmp	4028B7h

l0040240E:
	cmp	[ebp+8h],ebx
	jz	402419h

l00402413:
	push	ebx
	call	402310h

l00402419:
	push	14h
	call	694FD8h
	add	esp,4h
	mov	[esp+18h],eax
	cmp	eax,ebx
	mov	[esp+0D0h],ebx
	jz	40243Bh

l00402432:
	mov	ecx,eax
	call	409610h
	jmp	40243Dh

l0040243B:
	xor	eax,eax

l0040243D:
	lea	ecx,[esp+70h]
	mov	dword ptr [esp+0D0h],0FFFFFFFFh
	mov	[ebp+8h],eax
	xor	edi,edi
	call	dword ptr [8A43B0h]
	mov	eax,[ebp+0h]
	cmp	eax,ebx
	mov	dword ptr [esp+0D0h],1h
	jnz	4024A3h

l00402469:
	lea	ecx,[esp+20h]
	push	ebx
	push	ecx
	call	401C70h
	add	esp,8h
	push	eax
	lea	ecx,[esp+74h]
	mov	byte ptr [esp+0D4h],2h
	call	dword ptr [8A4358h]
	lea	ecx,[esp+20h]
	mov	edi,1h
	mov	byte ptr [esp+0D0h],1h
	call	dword ptr [8A4338h]
	jmp	4024AEh

l004024A3:
	push	eax
	lea	ecx,[esp+74h]
	call	dword ptr [8A4358h]

l004024AE:
	push	8A698Fh
	lea	ecx,[esp+24h]
	call	dword ptr [8A4334h]
	lea	edx,[esp+20h]
	push	edx
	mov	byte ptr [esp+0D4h],3h
	call	408FB0h
	add	esp,4h
	lea	ecx,[esp+20h]
	mov	esi,eax
	mov	byte ptr [esp+0D0h],1h
	call	dword ptr [8A4338h]
	cmp	[esp+84h],ebx
	jz	402783h

l004024F3:
	lea	eax,[esp+70h]
	push	eax
	lea	ecx,[esp+0ACh]
	call	dword ptr [8A433Ch]
	lea	ecx,[esp+70h]
	push	ecx
	lea	ecx,[esp+90h]
	mov	byte ptr [esp+0D4h],4h
	call	dword ptr [8A433Ch]
	lea	edx,[esp+58h]
	push	edx
	lea	ecx,[esp+90h]
	mov	byte ptr [esp+0D4h],5h
	call	dword ptr [8A43C0h]
	mov	ecx,[eax+4h]
	mov	eax,[eax+8h]
	cmp	byte ptr [eax-1h],2Fh
	mov	[esp+18h],ecx
	jz	40255Bh

l00402549:
	push	8A6A50h
	lea	ecx,[esp+90h]
	call	dword ptr [8A43BCh]

l0040255B:
	push	8A6A48h
	lea	ecx,[esp+90h]
	call	dword ptr [8A43B8h]
	push	8A6A44h
	lea	ecx,[esp+90h]
	call	dword ptr [8A43B8h]
	lea	edx,[esp+0A8h]
	push	edx
	lea	eax,[esp+40h]
	push	eax
	call	4017C0h
	or	dword ptr [esp+1Ch],1h
	push	8A6A44h
	push	eax
	mov	byte ptr [esp+0E0h],6h
	call	dword ptr [8A43B4h]
	add	esp,10h
	test	al,al
	jz	4025CDh

l004025B1:
	mov	edx,[esi]
	mov	edx,[edx+4h]
	push	0h
	lea	eax,[esp+0ACh]
	push	eax
	mov	ecx,esi
	call	edx
	cmp	eax,2h
	jnz	4025CDh

l004025C9:
	mov	bl,1h
	jmp	4025CFh

l004025CD:
	xor	bl,bl

l004025CF:
	test	byte ptr [esp+14h],1h
	mov	dword ptr [esp+0D0h],5h
	jz	4025F0h

l004025E1:
	and	dword ptr [esp+14h],0FEh
	lea	ecx,[esp+3Ch]
	call	dword ptr [8A4338h]

l004025F0:
	test	bl,bl
	jz	402655h

l004025F4:
	lea	ecx,[esp+0A8h]
	call	dword ptr [8A4354h]
	push	eax
	push	8A6A18h
	call	520C80h
	push	44h
	call	694FD8h
	add	esp,0Ch
	mov	[esp+18h],eax
	test	eax,eax
	mov	byte ptr [esp+0D0h],7h
	jz	402644h

l00402626:
	lea	ecx,[esp+0A8h]
	push	ecx
	mov	ecx,eax
	call	40D620h
	mov	byte ptr [esp+0D0h],5h
	push	0FFh
	jmp	40270Ch

l00402644:
	xor	eax,eax
	mov	byte ptr [esp+0D0h],5h
	push	0FFh
	jmp	40270Ch

l00402655:
	mov	edx,[esi]
	mov	edx,[edx+4h]
	push	0h
	lea	eax,[esp+90h]
	push	eax
	mov	ecx,esi
	call	edx
	cmp	eax,2h
	jnz	4026BAh

l0040266D:
	lea	ecx,[esp+8Ch]
	call	dword ptr [8A4354h]
	push	eax
	push	8A69ECh
	call	520C80h
	push	44h
	call	694FD8h
	add	esp,0Ch
	mov	[esp+18h],eax
	test	eax,eax
	mov	byte ptr [esp+0D0h],8h
	jz	402644h

l0040269F:
	lea	ecx,[esp+8Ch]
	push	ecx
	mov	ecx,eax
	call	40D620h
	mov	byte ptr [esp+0D0h],5h
	push	0FFh
	jmp	40270Ch

l004026BA:
	mov	edx,[esi]
	mov	edx,[edx+4h]
	push	0h
	lea	eax,[esp+74h]
	push	eax
	mov	ecx,esi
	call	edx
	cmp	eax,1h
	jnz	402715h

l004026CF:
	lea	eax,[esp+64h]
	push	eax
	lea	ecx,[esp+74h]
	call	dword ptr [8A43C0h]
	mov	ecx,[eax+4h]
	mov	eax,[eax+8h]
	cmp	byte ptr [eax-1h],2Fh
	mov	[esp+18h],ecx
	jz	4026FDh

l004026EE:
	push	8A6A50h
	lea	ecx,[esp+74h]
	call	dword ptr [8A43BCh]

l004026FD:
	lea	edx,[esp+70h]
	push	0FFh
	push	edx
	call	408FB0h
	add	esp,4h

l0040270C:
	mov	ecx,[ebp+8h]
	push	eax
	call	409F70h

l00402715:
	lea	eax,[esp+3Ch]
	push	edi
	push	eax
	call	401C70h
	add	esp,8h
	push	eax
	lea	ecx,[esp+74h]
	mov	byte ptr [esp+0D4h],9h
	call	dword ptr [8A4358h]
	lea	ecx,[esp+3Ch]
	add	edi,1h
	mov	byte ptr [esp+0D0h],5h
	call	dword ptr [8A4338h]
	lea	ecx,[esp+8Ch]
	mov	byte ptr [esp+0D0h],4h
	call	dword ptr [8A4338h]
	lea	ecx,[esp+0A8h]
	mov	byte ptr [esp+0D0h],1h
	call	dword ptr [8A4338h]
	cmp	dword ptr [esp+84h],0h
	jnz	4024F3h

l00402783:
	test	esi,esi
	jz	402791h

l00402787:
	mov	edx,[esi]
	mov	eax,[edx]
	push	1h
	mov	ecx,esi
	call	eax

l00402791:
	push	8A69DCh
	call	dword ptr [8A4688h]
	add	esp,4h
	test	eax,eax
	jz	4027AFh

l004027A3:
	push	eax
	call	dword ptr [8A468Ch]
	add	esp,4h
	jmp	4027B4h

l004027AF:
	mov	eax,19000h

l004027B4:
	push	eax
	call	407E40h
	mov	ecx,eax
	call	406E20h
	call	407E40h
	mov	ecx,eax
	call	407A90h
	push	54h
	call	694FD8h
	mov	esi,eax
	add	esp,4h
	mov	[esp+18h],esi
	test	esi,esi
	mov	byte ptr [esp+0D0h],0Ah
	jz	402819h

l004027E9:
	push	8A698Fh
	lea	ecx,[esp+24h]
	call	dword ptr [8A4334h]
	mov	ecx,[ebp+8h]
	or	dword ptr [esp+14h],2h
	push	ecx
	lea	edx,[esp+24h]
	push	edx
	mov	ecx,esi
	mov	byte ptr [esp+0D8h],0Bh
	call	408720h
	mov	esi,eax
	jmp	40281Bh

l00402819:
	xor	esi,esi

l0040281B:
	test	esi,esi
	mov	[esp+18h],esi
	jz	40282Ah

l00402823:
	mov	ecx,esi
	call	401AD0h

l0040282A:
	mov	edi,[ebp+4h]
	cmp	edi,esi
	mov	dword ptr [esp+0D0h],0Dh
	jz	402864h

l0040283C:
	test	esi,esi
	mov	[ebp+4h],esi
	jz	40284Ah

l00402843:
	mov	ecx,esi
	call	401AD0h

l0040284A:
	test	edi,edi
	jz	402864h

l0040284E:
	mov	ecx,edi
	call	401AE0h
	cmp	eax,1h
	jnz	402864h

l0040285A:
	mov	eax,[edi]
	mov	edx,[eax]
	push	1h
	mov	ecx,edi
	call	edx

l00402864:
	test	esi,esi
	mov	byte ptr [esp+0D0h],0Ch
	jz	402886h

l00402870:
	mov	ecx,esi
	call	401AE0h
	cmp	eax,1h
	jnz	402886h

l0040287C:
	mov	eax,[esi]
	mov	edx,[eax]
	push	1h
	mov	ecx,esi
	call	edx

l00402886:
	test	byte ptr [esp+14h],2h
	mov	dword ptr [esp+0D0h],1h
	jz	4028A2h

l00402898:
	lea	ecx,[esp+20h]
	call	dword ptr [8A4338h]

l004028A2:
	lea	ecx,[esp+70h]
	mov	dword ptr [esp+0D0h],0FFFFFFFFh
	call	dword ptr [8A4338h]

l004028B7:
	mov	ecx,[esp+0C8h]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebp
	pop	ebx
	mov	ecx,[esp+0B0h]
	xor	ecx,esp
	call	694B8Eh
	add	esp,0C0h
	ret
004028DF                                              CC                .

;; fn004028E0: 004028E0
;;   Called from:
;;     00402AD2 (in fn00402A20)
fn004028E0 proc
	push	ecx
	mov	eax,[ecx]
	mov	ecx,[eax+4h]
	test	ecx,ecx
	push	esi
	mov	esi,[esp+0Ch]
	mov	dword ptr [esp+4h],0h
	mov	[esi],ecx
	jz	4028FEh

l004028F9:
	call	401AD0h

l004028FE:
	mov	eax,esi
	pop	esi
	pop	ecx
	ret	4h
00402905                CC CC CC CC CC CC CC CC CC CC CC      ...........
00402910 6A FF 68 B1 B1 82 00 64 A1 00 00 00 00 50 83 EC j.h....d.....P..
00402920 1C 53 56 57 A1 88 41 A1 00 33 C4 50 8D 44 24 2C .SVW..A..3.P.D$,
00402930 64 A3 00 00 00 00 8B 7C 24 3C 8D 44 24 3C 57 50 d......|$<.D$<WP
00402940 E8 DB 43 00 00 83 C4 08 8B 74 24 3C 85 F6 C7 44 ..C......t$<...D
00402950 24 34 00 00 00 00 75 56 8B CF FF 15 54 43 8A 00 $4....uV....TC..
00402960 50 68 AC 6A 8A 00 E8 15 E3 11 00 8B 4C 24 44 83 Ph.j........L$D.
00402970 C4 08 85 C9 C7 44 24 34 FF FF FF FF 74 19 8B F1 .....D$4....t...
00402980 E8 5B F1 FF FF 83 F8 01 75 0D 85 F6 74 09 8B 16 .[......u...t...
00402990 50 8B 02 8B CE FF D0 32 C0 8B 4C 24 2C 64 89 0D P......2..L$,d..
004029A0 00 00 00 00 59 5F 5E 5B 83 C4 28 C2 04 00 8D 4C ....Y_^[..(....L
004029B0 24 10 FF 15 B0 43 8A 00 8B 16 50 8B 42 34 8B CE $....C....P.B4..
004029C0 C6 44 24 38 01 FF D0 8D 4C 24 10 8A D8 C6 44 24 .D$8....L$....D$
004029D0 34 00 FF 15 38 43 8A 00 8B 4C 24 3C 85 C9 C7 44 4...8C...L$<...D
004029E0 24 34 FF FF FF FF 74 19 8B F1 E8 F1 F0 FF FF 83 $4....t.........
004029F0 F8 01 75 0D 85 F6 74 09 8B 16 50 8B 02 8B CE FF ..u...t...P.....
00402A00 D0 8A C3 8B 4C 24 2C 64 89 0D 00 00 00 00 59 5F ....L$,d......Y_
00402A10 5E 5B 83 C4 28 C2 04 00 CC CC CC CC CC CC CC CC ^[..(...........

;; fn00402A20: 00402A20
;;   Called from:
;;     00402BA8 (in fn00402B60)
;;     0042B43D (in fn0042B310)
;;     007B2D43 (in fn007B2D10)
fn00402A20 proc
	push	0FFh
	push	82B1F9h
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,0Ch
	push	ebx
	push	esi
	push	edi
	mov	eax,[0A14188h]
	xor	eax,esp
	push	eax
	lea	eax,[esp+1Ch]
	mov	fs:[0000h],eax
	mov	esi,[esp+30h]
	lea	eax,[esp+10h]
	push	esi
	push	eax
	mov	dword ptr [esp+1Ch],0h
	call	406D20h
	add	esp,8h
	mov	ecx,[esp+10h]
	test	ecx,ecx
	mov	ebx,1h
	mov	[esp+24h],ebx
	jz	402AC6h

l00402A71:
	mov	edi,[esp+2Ch]
	mov	[edi],ecx
	call	401AD0h
	mov	ecx,[esp+10h]
	test	ecx,ecx
	mov	[esp+14h],ebx
	mov	byte ptr [esp+24h],0h
	jz	402B45h

l00402A91:
	mov	esi,ecx
	call	401AE0h
	cmp	eax,ebx
	jnz	402B45h

l00402AA0:
	test	esi,esi
	jz	402B45h

l00402AA8:
	mov	edx,[esi]
	mov	eax,[edx]
	push	ebx
	mov	ecx,esi
	call	eax
	mov	eax,edi
	mov	ecx,[esp+1Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebx
	add	esp,18h
	ret

l00402AC6:
	lea	ecx,[esp+18h]
	push	ecx
	call	4048C0h
	mov	ecx,eax
	call	4028E0h
	mov	edx,[esp+34h]
	mov	eax,[eax]
	mov	edi,[esp+2Ch]
	push	edx
	push	esi
	push	edi
	mov	ecx,eax
	mov	byte ptr [esp+30h],2h
	call	40E780h
	mov	ecx,[esp+18h]
	test	ecx,ecx
	mov	[esp+14h],ebx
	mov	[esp+24h],bl
	jz	402B18h

l00402B00:
	mov	esi,ecx
	call	401AE0h
	cmp	eax,ebx
	jnz	402B18h

l00402B0B:
	test	esi,esi
	jz	402B18h

l00402B0F:
	mov	eax,[esi]
	mov	edx,[eax]
	push	ebx
	mov	ecx,esi
	call	edx

l00402B18:
	mov	ecx,[esp+10h]
	test	ecx,ecx
	mov	dword ptr [esp+18h],0h
	mov	byte ptr [esp+24h],0h
	jz	402B45h

l00402B2D:
	mov	esi,ecx
	call	401AE0h
	cmp	eax,ebx
	jnz	402B45h

l00402B38:
	test	esi,esi
	jz	402B45h

l00402B3C:
	mov	eax,[esi]
	mov	edx,[eax]
	push	ebx
	mov	ecx,esi
	call	edx

l00402B45:
	mov	eax,edi
	mov	ecx,[esp+1Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebx
	add	esp,18h
	ret
00402B5A                               CC CC CC CC CC CC           ......

;; fn00402B60: 00402B60
;;   Called from:
;;     00404897 (in fn004046D0)
fn00402B60 proc
	push	0FFh
	push	82B255h
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,3Ch
	push	ebx
	push	esi
	mov	eax,[0A14188h]
	xor	eax,esp
	push	eax
	lea	eax,[esp+48h]
	mov	fs:[0000h],eax
	push	8A6AFCh
	lea	ecx,[esp+14h]
	call	dword ptr [8A4334h]
	push	0h
	lea	eax,[esp+14h]
	push	eax
	lea	ecx,[esp+14h]
	push	ecx
	mov	dword ptr [esp+5Ch],0h
	call	402A20h
	add	esp,0Ch
	mov	bl,2h
	lea	ecx,[esp+10h]
	mov	[esp+50h],bl
	call	dword ptr [8A4338h]
	mov	ecx,[esp+0Ch]
	test	ecx,ecx
	jz	402CE0h

l00402BCC:
	push	8A6AF4h
	lea	ecx,[esp+30h]
	call	dword ptr [8A4334h]
	mov	esi,[esp+0Ch]
	mov	byte ptr [esp+50h],3h
	call	61FC90h
	movzx	edx,ax
	push	edx
	lea	eax,[esp+30h]
	push	eax
	mov	ecx,esi
	call	40EF50h
	push	eax
	call	61FD40h
	add	esp,4h
	lea	ecx,[esp+2Ch]
	mov	[esp+50h],bl
	call	dword ptr [8A4338h]
	push	8A6AECh
	lea	ecx,[esp+30h]
	call	dword ptr [8A4334h]
	mov	esi,[esp+0Ch]
	mov	byte ptr [esp+50h],4h
	call	61FCA0h
	movzx	ecx,ax
	push	ecx
	lea	edx,[esp+30h]
	push	edx
	mov	ecx,esi
	call	40EF50h
	push	eax
	call	61FD60h
	add	esp,4h
	lea	ecx,[esp+2Ch]
	mov	[esp+50h],bl
	call	dword ptr [8A4338h]
	push	8A6AE4h
	lea	ecx,[esp+30h]
	call	dword ptr [8A4334h]
	mov	esi,[esp+0Ch]
	mov	byte ptr [esp+50h],5h
	call	61FCB0h
	movzx	eax,ax
	push	eax
	lea	ecx,[esp+30h]
	push	ecx
	mov	ecx,esi
	call	40EF50h
	push	eax
	call	61FD80h
	add	esp,4h
	lea	ecx,[esp+2Ch]
	mov	[esp+50h],bl
	call	dword ptr [8A4338h]
	push	8A6AD8h
	lea	ecx,[esp+30h]
	call	dword ptr [8A4334h]
	mov	esi,[esp+0Ch]
	mov	byte ptr [esp+50h],6h
	call	61FCC0h
	movzx	edx,ax
	push	edx
	lea	eax,[esp+30h]
	push	eax
	mov	ecx,esi
	call	40EF50h
	push	eax
	call	61FD90h
	add	esp,4h
	lea	ecx,[esp+2Ch]
	mov	[esp+50h],bl
	call	dword ptr [8A4338h]
	mov	ecx,[esp+0Ch]

l00402CE0:
	test	ecx,ecx
	mov	dword ptr [esp+50h],0FFFFFFFFh
	jz	402D05h

l00402CEC:
	mov	esi,ecx
	call	401AE0h
	cmp	eax,1h
	jnz	402D05h

l00402CF8:
	test	esi,esi
	jz	402D05h

l00402CFC:
	mov	edx,[esi]
	push	eax
	mov	eax,[edx]
	mov	ecx,esi
	call	eax

l00402D05:
	mov	ecx,[esp+48h]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	esi
	pop	ebx
	add	esp,48h
	ret
00402D17                      CC CC CC CC CC CC CC CC CC        .........

;; fn00402D20: 00402D20
;;   Called from:
;;     0040335C (in fn00403200)
;;     004050E6 (in fn00404FF0)
;;     0040519D (in fn00404FF0)
;;     004052D1 (in fn00404FF0)
fn00402D20 proc
	push	0FFh
	push	82B29Ch
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,58h
	mov	eax,[0A14188h]
	xor	eax,esp
	mov	[esp+54h],eax
	push	ebx
	push	esi
	push	edi
	mov	eax,[0A14188h]
	xor	eax,esp
	push	eax
	lea	eax,[esp+68h]
	mov	fs:[0000h],eax
	mov	esi,[esp+7Ch]
	mov	edi,[esp+78h]
	mov	ecx,esi
	mov	[esp+18h],edi
	mov	dword ptr [esp+14h],0h
	call	dword ptr [8A4354h]
	push	eax
	lea	ecx,[esp+30h]
	call	dword ptr [8A4334h]
	cmp	dword ptr [esi+14h],0h
	mov	ebx,1h
	mov	[esp+70h],ebx
	jnz	402D9Dh

l00402D87:
	lea	eax,[esp+2Ch]
	push	eax
	mov	ecx,edi
	call	dword ptr [8A433Ch]
	mov	[esp+14h],ebx
	jmp	402E50h

l00402D9D:
	lea	ecx,[esp+1Ch]
	push	ecx
	lea	ecx,[esp+30h]
	mov	byte ptr [esp+17h],2Fh
	mov	byte ptr [esp+16h],5Ch
	call	dword ptr [8A43D0h]
	lea	edx,[esp+24h]
	push	edx
	lea	ecx,[esp+30h]
	mov	esi,eax
	call	dword ptr [8A43CCh]
	lea	ecx,[esp+13h]
	push	ecx
	mov	ecx,[esi+4h]
	lea	edx,[esp+16h]
	push	edx
	mov	edx,[esi]
	push	ecx
	mov	ecx,[eax+4h]
	push	edx
	mov	edx,[eax]
	push	ecx
	push	edx
	call	402230h
	add	esp,18h
	lea	ecx,[esp+2Ch]
	call	dword ptr [8A435Ch]
	push	ecx
	mov	ecx,esp
	sub	eax,ebx
	mov	[ecx],eax
	lea	ecx,[esp+30h]
	mov	[esp+20h],esp
	call	dword ptr [8A43C8h]
	cmp	byte ptr [eax],2Fh
	jz	402E17h

l00402E0B:
	push	2Fh
	lea	ecx,[esp+30h]
	call	dword ptr [8A43C4h]

l00402E17:
	lea	ecx,[esp+2Ch]
	call	dword ptr [8A4354h]
	push	eax
	lea	ecx,[esp+4Ch]
	call	dword ptr [8A4334h]
	lea	eax,[esp+48h]
	push	eax
	mov	ecx,edi
	mov	byte ptr [esp+74h],2h
	call	dword ptr [8A433Ch]
	lea	ecx,[esp+48h]
	mov	[esp+14h],ebx
	mov	[esp+70h],bl
	call	dword ptr [8A4338h]

l00402E50:
	lea	ecx,[esp+2Ch]
	mov	byte ptr [esp+70h],0h
	call	dword ptr [8A4338h]
	mov	eax,edi
	mov	ecx,[esp+68h]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebx
	mov	ecx,[esp+54h]
	xor	ecx,esp
	call	694B8Eh
	add	esp,64h
	ret
00402E7F                                              CC                .

;; fn00402E80: 00402E80
;;   Called from:
;;     00403BA3 (in fn00403950)
;;     00403C37 (in fn00403950)
fn00402E80 proc
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
	call	402150h
	add	esp,1Ch
	ret	0Ch
00402EA9                            CC CC CC CC CC CC CC          .......
00402EB0 6A FF 68 2C B3 82 00 64 A1 00 00 00 00 50 83 EC j.h,...d.....P..
00402EC0 7C 53 55 56 57 A1 88 41 A1 00 33 C4 50 8D 84 24 |SUVW..A..3.P..$
00402ED0 90 00 00 00 64 A3 00 00 00 00 89 4C 24 1C 8B BC ....d......L$...
00402EE0 24 A8 00 00 00 33 DB 38 9C 24 A4 00 00 00 89 9C $....3.8.$......
00402EF0 24 98 00 00 00 0F 84 5A 02 00 00 3B FB 75 64 8B $......Z...;.ud.
00402F00 01 8B 94 24 A0 00 00 00 8B 48 04 53 52 8D 44 24 ...$.....H.SR.D$
00402F10 20 50 E8 69 B8 00 00 8B 00 3B C3 74 15 8B C8 89  P.i.....;.t....
00402F20 84 24 A8 00 00 00 E8 A5 EB FF FF 8B BC 24 A8 00 .$...........$..
00402F30 00 00 8B 4C 24 18 3B CB C6 84 24 98 00 00 00 00 ...L$.;...$.....
00402F40 74 19 8B F1 E8 97 EB FF FF 83 F8 01 75 0D 3B F3 t...........u.;.
00402F50 74 09 8B 16 50 8B 02 8B CE FF D0 3B FB 0F 84 F2 t...P......;....
00402F60 01 00 00 8D 4C 24 24 51 8B CF E8 C1 BD 00 00 8D ....L$$Q........
00402F70 54 24 2C 52 8B CF C6 84 24 9C 00 00 00 02 E8 5D T$,R....$......]
00402F80 BE 00 00 8D 44 24 2C 50 8D 4C 24 28 C6 84 24 9C ....D$,P.L$(..$.
00402F90 00 00 00 03 E8 27 AF 00 00 84 C0 0F 84 5A 01 00 .....'.......Z..
00402FA0 00 8B 3D 50 43 8A 00 8B 2D D4 43 8A 00 B3 04 90 ..=PC...-.C.....
00402FB0 8D 4C 24 18 51 8D 4C 24 28 E8 B2 B3 00 00 8B 30 .L$.Q.L$(......0
00402FC0 51 8B D4 89 64 24 24 52 8D 4C 24 2C 88 9C 24 A0 Q...d$$R.L$,..$.
00402FD0 00 00 00 E8 98 B3 00 00 8B 06 8B 50 2C 8D 4C 24 ...........P,.L$
00402FE0 78 51 8B CE C6 84 24 A0 00 00 00 05 FF D2 8B F0 xQ....$.........
00402FF0 8B 84 24 A4 00 00 00 68 50 6A 8A 00 50 8D 4C 24 ..$....hPj..P.L$
00403000 64 51 C6 84 24 A8 00 00 00 06 FF D5 56 50 8D 54 dQ..$.......VP.T
00403010 24 54 52 C6 84 24 B4 00 00 00 07 FF D7 83 C4 18 $TR..$..........
00403020 C6 84 24 9C 00 00 00 08 8B 4C 24 20 6A 01 50 C6 ..$......L$ j.P.
00403030 84 24 A4 00 00 00 0B E8 74 FE FF FF 8D 4C 24 3C .$......t....L$<
00403040 C6 84 24 98 00 00 00 0A FF 15 38 43 8A 00 8D 4C ..$.......8C...L
00403050 24 58 C6 84 24 98 00 00 00 09 FF 15 38 43 8A 00 $X..$.......8C..
00403060 8D 4C 24 74 88 9C 24 98 00 00 00 FF 15 38 43 8A .L$t..$......8C.
00403070 00 8B 4C 24 18 85 C9 C6 84 24 98 00 00 00 03 74 ..L$.....$.....t
00403080 1A 8B F1 E8 58 EA FF FF 83 F8 01 75 0E 85 F6 74 ....X......u...t
00403090 0A 8B 06 8B 10 6A 01 8B CE FF D2 6A 00 8D 44 24 .....j.....j..D$
004030A0 38 50 8D 4C 24 2C C7 44 24 20 00 00 00 00 E8 4D 8P.L$,.D$ .....M
004030B0 B4 00 00 8B 4C 24 34 85 C9 74 19 8B F1 E8 1E EA ....L$4..t......
004030C0 FF FF 83 F8 01 75 0D 85 F6 74 09 8B 16 50 8B 02 .....u...t...P..
004030D0 8B CE FF D0 8D 4C 24 2C 51 8D 4C 24 28 C7 44 24 .....L$,Q.L$(.D$
004030E0 38 00 00 00 00 E8 D6 AD 00 00 84 C0 0F 85 BE FE 8...............
004030F0 FF FF 8B BC 24 A8 00 00 00 33 DB 8B 4C 24 2C 3B ....$....3..L$,;
00403100 CB C6 84 24 98 00 00 00 02 74 19 8B F1 E8 CE E9 ...$.....t......
00403110 FF FF 83 F8 01 75 0D 3B F3 74 09 8B 16 50 8B 02 .....u.;.t...P..
00403120 8B CE FF D0 8B 4C 24 24 3B CB 89 5C 24 2C C6 84 .....L$$;..\$,..
00403130 24 98 00 00 00 00 74 19 8B F1 E8 A1 E9 FF FF 83 $.....t.........
00403140 F8 01 75 0D 3B F3 74 09 8B 16 50 8B 02 8B CE FF ..u.;.t...P.....
00403150 D0 89 5C 24 24 8B B4 24 A0 00 00 00 56 E8 DE 4C ..\$$..$....V..L
00403160 00 00 8B C8 E8 67 48 00 00 8D 4C 24 14 56 51 E8 .....gH...L$.VQ.
00403170 AC 3B 00 00 83 C4 08 8B 4C 24 14 3B CB C6 84 24 .;......L$.;...$
00403180 98 00 00 00 0C 74 0D 51 E8 73 3C 00 00 8B 4C 24 .....t.Q.s<...L$
00403190 18 83 C4 04 3B CB C6 84 24 98 00 00 00 00 74 19 ....;...$.....t.
004031A0 8B F1 E8 39 E9 FF FF 83 F8 01 75 0D 3B F3 74 09 ...9......u.;.t.
004031B0 8B 16 50 8B 02 8B CE FF D0 3B FB 89 5C 24 14 C7 ..P......;..\$..
004031C0 84 24 98 00 00 00 FF FF FF FF 74 15 8B CF E8 0D .$........t.....
004031D0 E9 FF FF 83 F8 01 75 09 8B 17 50 8B 02 8B CF FF ......u...P.....
004031E0 D0 8B 8C 24 90 00 00 00 64 89 0D 00 00 00 00 59 ...$....d......Y
004031F0 5F 5E 5D 5B 81 C4 88 00 00 00 C2 0C 00 CC CC CC _^][............

;; fn00403200: 00403200
;;   Called from:
;;     004034C0 (in fn00403420)
;;     0040516D (in fn00404FF0)
fn00403200 proc
	push	0FFh
	push	82B38Eh
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,64h
	mov	eax,[0A14188h]
	xor	eax,esp
	mov	[esp+60h],eax
	push	ebp
	push	esi
	push	edi
	mov	eax,[0A14188h]
	xor	eax,esp
	push	eax
	lea	eax,[esp+74h]
	mov	fs:[0000h],eax
	mov	ebp,[esp+84h]
	mov	esi,[esp+88h]
	lea	ecx,[esp+54h]
	mov	[esp+18h],ebp
	mov	dword ptr [esp+10h],0h
	call	dword ptr [8A43B0h]
	push	esi
	lea	ecx,[esp+3Ch]
	mov	dword ptr [esp+80h],1h
	call	dword ptr [8A433Ch]
	mov	ecx,esi
	mov	byte ptr [esp+7Ch],2h
	call	dword ptr [8A4344h]
	cmp	eax,1h
	jc	4032F7h

l0040327D:
	mov	ecx,esi
	call	dword ptr [8A4344h]
	push	ecx
	mov	ecx,esp
	sub	eax,1h
	mov	[ecx],eax
	mov	ecx,esi
	mov	[esp+18h],esp
	call	dword ptr [8A43DCh]
	cmp	byte ptr [eax],2Fh
	jz	4032F7h

l0040329E:
	mov	eax,[8A434Ch]
	mov	ecx,[eax]
	push	ecx
	push	8A695Ch
	mov	ecx,esi
	call	dword ptr [8A43D8h]
	mov	edi,eax
	test	edi,edi
	jl	4032F7h

l004032B9:
	mov	ecx,esi
	call	dword ptr [8A4344h]
	cmp	edi,eax
	jge	4032F7h

l004032C5:
	push	edi
	push	0h
	lea	edx,[esp+24h]
	push	edx
	mov	ecx,esi
	call	dword ptr [8A4340h]
	push	eax
	lea	ecx,[esp+3Ch]
	mov	byte ptr [esp+80h],3h
	call	dword ptr [8A4358h]
	lea	ecx,[esp+1Ch]
	mov	byte ptr [esp+7Ch],2h
	call	dword ptr [8A4338h]

l004032F7:
	mov	eax,[8A434Ch]
	mov	ecx,[eax]
	push	ecx
	push	8A698Ch
	lea	ecx,[esp+40h]
	call	dword ptr [8A4348h]
	mov	esi,eax
	test	esi,esi
	jl	403356h

l00403314:
	lea	ecx,[esp+38h]
	call	dword ptr [8A4344h]
	cmp	esi,eax
	jge	403356h

l00403322:
	push	esi
	push	0h
	lea	edx,[esp+24h]
	push	edx
	lea	ecx,[esp+44h]
	call	dword ptr [8A4340h]
	push	eax
	lea	ecx,[esp+58h]
	mov	byte ptr [esp+80h],4h
	call	dword ptr [8A4358h]
	lea	ecx,[esp+1Ch]
	mov	byte ptr [esp+7Ch],2h
	call	dword ptr [8A4338h]

l00403356:
	lea	eax,[esp+54h]
	push	eax
	push	ebp
	call	402D20h
	add	esp,8h
	lea	ecx,[esp+38h]
	mov	dword ptr [esp+10h],1h
	mov	byte ptr [esp+7Ch],1h
	call	dword ptr [8A4338h]
	lea	ecx,[esp+54h]
	mov	byte ptr [esp+7Ch],0h
	call	dword ptr [8A4338h]
	mov	eax,ebp
	mov	ecx,[esp+74h]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebp
	mov	ecx,[esp+60h]
	xor	ecx,esp
	call	694B8Eh
	add	esp,70h
	ret
004033AA                               CC CC CC CC CC CC           ......

;; fn004033B0: 004033B0
;;   Called from:
;;     00403AAD (in fn00403950)
;;     00403BD1 (in fn00403950)
fn004033B0 proc
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
	call	402270h
	add	esp,18h
	lea	ecx,[0000h+esi*8]
	sub	ecx,esi
	lea	eax,[edi+ecx*4]
	pop	edi
	pop	esi
	pop	ecx
	ret	0Ch
004033EC                                     CC CC CC CC             ....

;; fn004033F0: 004033F0
;;   Called from:
;;     00403B01 (in fn00403950)
;;     0040862D (in fn004085A0)
;;     004086D8 (in fn004085A0)
fn004033F0 proc
	push	esi
	mov	esi,[esp+8h]
	push	edi
	mov	edi,[esp+10h]
	cmp	esi,edi
	jz	40340Fh

l004033FE:
	mov	edi,edi

l00403400:
	mov	ecx,esi
	call	dword ptr [8A4338h]
	add	esi,1Ch
	cmp	esi,edi
	jnz	403400h

l0040340F:
	pop	edi
	pop	esi
	ret	8h
00403414             CC CC CC CC CC CC CC CC CC CC CC CC     ............

;; fn00403420: 00403420
;;   Called from:
;;     0040362F (in fn00403570)
;;     004042E7 (in fn00404190)
;;     0040460C (in fn00404190)
fn00403420 proc
	push	0FFh
	push	82B3FBh
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,15Ch
	mov	eax,[0A14188h]
	xor	eax,esp
	mov	[esp+158h],eax
	push	ebx
	push	esi
	push	edi
	mov	eax,[0A14188h]
	xor	eax,esp
	push	eax
	lea	eax,[esp+16Ch]
	mov	fs:[0000h],eax
	mov	esi,[esp+17Ch]
	xor	ebx,ebx
	push	8A6990h
	mov	ecx,esi
	mov	[esp+178h],ebx
	mov	[esp+1Ch],esi
	mov	[esp+18h],ebx
	call	dword ptr [8A4334h]
	push	104h
	lea	eax,[esp+68h]
	push	eax
	mov	edi,1h
	push	ebx
	mov	[esp+180h],ebx
	mov	[esp+20h],edi
	call	dword ptr [8A4104h]
	lea	ecx,[esp+64h]
	push	ecx
	lea	ecx,[esp+4Ch]
	call	dword ptr [8A4334h]
	lea	edx,[esp+48h]
	push	edx
	lea	eax,[esp+30h]
	push	eax
	mov	[esp+17Ch],edi
	call	403200h
	add	esp,8h
	push	eax
	mov	ecx,esi
	mov	byte ptr [esp+178h],2h
	call	dword ptr [8A4358h]
	lea	ecx,[esp+2Ch]
	mov	byte ptr [esp+174h],1h
	call	dword ptr [8A4338h]
	lea	ecx,[esp+1Ch]
	push	ecx
	mov	ecx,esi
	mov	byte ptr [esp+17h],2Fh
	mov	byte ptr [esp+16h],5Ch
	call	dword ptr [8A43D0h]
	lea	edx,[esp+24h]
	push	edx
	mov	ecx,esi
	mov	edi,eax
	call	dword ptr [8A43CCh]
	lea	ecx,[esp+13h]
	push	ecx
	mov	ecx,[edi+4h]
	lea	edx,[esp+16h]
	push	edx
	mov	edx,[edi]
	push	ecx
	mov	ecx,[eax+4h]
	push	edx
	mov	edx,[eax]
	push	ecx
	push	edx
	call	402230h
	add	esp,18h
	lea	ecx,[esp+48h]
	mov	[esp+174h],bl
	call	dword ptr [8A4338h]
	mov	eax,esi
	mov	ecx,[esp+16Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebx
	mov	ecx,[esp+158h]
	xor	ecx,esp
	call	694B8Eh
	add	esp,168h
	ret
0040356B                                  CC CC CC CC CC            .....

;; fn00403570: 00403570
;;   Called from:
;;     00404085 (in fn00403F70)
fn00403570 proc
	push	0FFh
	push	82B48Fh
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,164h
	mov	eax,[0A14188h]
	xor	eax,esp
	mov	[esp+160h],eax
	push	ebx
	push	esi
	push	edi
	mov	eax,[0A14188h]
	xor	eax,esp
	push	eax
	lea	eax,[esp+174h]
	mov	fs:[0000h],eax
	mov	esi,[esp+184h]
	mov	ecx,[esp+188h]
	mov	edi,[esp+18Ch]
	mov	dword ptr [esp+17Ch],0h
	mov	[esp+4Ch],esi
	mov	dword ptr [esp+1Ch],0h
	call	dword ptr [8A4354h]
	push	eax
	mov	ecx,esi
	call	dword ptr [8A4334h]
	mov	ebx,1h
	lea	ecx,[esp+50h]
	mov	dword ptr [esp+17Ch],0h
	mov	[esp+1Ch],ebx
	call	dword ptr [8A43B0h]
	push	8A698Fh
	push	edi
	mov	[esp+184h],ebx
	call	dword ptr [8A43E4h]
	add	esp,8h
	test	al,al
	jz	40362Ah

l0040361D:
	push	edi
	lea	ecx,[esp+54h]
	call	dword ptr [8A4358h]
	jmp	40365Bh

l0040362A:
	lea	eax,[esp+28h]
	push	eax
	call	403420h
	add	esp,4h
	push	eax
	lea	ecx,[esp+54h]
	mov	byte ptr [esp+180h],2h
	call	dword ptr [8A4358h]
	lea	ecx,[esp+28h]
	mov	[esp+17Ch],bl
	call	dword ptr [8A4338h]

l0040365B:
	mov	ecx,esi
	call	dword ptr [8A435Ch]
	cmp	eax,ebx
	jbe	403681h

l00403667:
	push	ecx
	mov	eax,esp
	mov	ecx,esi
	mov	[esp+18h],esp
	mov	[eax],ebx
	call	dword ptr [8A43C8h]
	cmp	byte ptr [eax],3Ah
	jz	4037FEh

l00403681:
	mov	ecx,esi
	call	dword ptr [8A435Ch]
	test	eax,eax
	jbe	403759h

l00403691:
	push	ecx
	mov	eax,esp
	mov	ecx,esi
	mov	[esp+18h],esp
	mov	dword ptr [eax],0h
	call	dword ptr [8A43C8h]
	cmp	byte ptr [eax],2Fh
	jz	403759h

l004036AF:
	push	esi
	lea	ecx,[esp+54h]
	push	ecx
	lea	edx,[esp+30h]
	push	edx
	call	dword ptr [8A4350h]
	add	esp,0Ch
	push	eax
	mov	ecx,esi
	mov	byte ptr [esp+180h],3h
	call	dword ptr [8A4358h]
	lea	ecx,[esp+28h]
	mov	[esp+17Ch],bl
	call	dword ptr [8A4338h]
	lea	eax,[esp+14h]
	push	eax
	mov	ecx,esi
	mov	byte ptr [esp+16h],5Ch
	mov	byte ptr [esp+17h],2Fh
	call	dword ptr [8A43D0h]
	lea	ecx,[esp+20h]
	push	ecx
	mov	ecx,esi
	mov	edi,eax
	call	dword ptr [8A43CCh]
	lea	edx,[esp+12h]
	push	edx
	mov	edx,[edi+4h]
	lea	ecx,[esp+17h]
	push	ecx
	mov	ecx,[edi]
	push	edx
	mov	edx,[eax+4h]
	mov	eax,[eax]
	push	ecx
	push	edx
	push	eax
	call	402230h
	add	esp,18h
	mov	ecx,esi
	call	dword ptr [8A4354h]
	push	eax
	lea	ecx,[esp+70h]
	push	ecx
	call	dword ptr [8A4838h]
	test	eax,eax
	jz	4037FEh

l00403747:
	lea	edx,[esp+6Ch]
	push	edx
	mov	ecx,esi
	call	dword ptr [8A43E0h]
	jmp	4037FEh

l00403759:
	lea	eax,[esp+20h]
	push	eax
	mov	ecx,esi
	mov	byte ptr [esp+17h],5Ch
	mov	byte ptr [esp+16h],2Fh
	call	dword ptr [8A43D0h]
	lea	ecx,[esp+44h]
	push	ecx
	mov	ecx,esi
	mov	edi,eax
	call	dword ptr [8A43CCh]
	lea	edx,[esp+13h]
	push	edx
	mov	edx,[edi+4h]
	lea	ecx,[esp+16h]
	push	ecx
	mov	ecx,[edi]
	push	edx
	mov	edx,[eax+4h]
	mov	eax,[eax]
	push	ecx
	push	edx
	push	eax
	call	402230h
	add	esp,18h
	lea	ecx,[esp+14h]
	push	ecx
	lea	edx,[esp+70h]
	push	edx
	push	104h
	mov	ecx,esi
	call	dword ptr [8A4354h]
	push	eax
	call	dword ptr [8A4100h]
	test	eax,eax
	jz	4037CEh

l004037C1:
	lea	eax,[esp+6Ch]
	push	eax
	mov	ecx,esi
	call	dword ptr [8A43E0h]

l004037CE:
	lea	ecx,[esp+28h]
	push	esi
	push	ecx
	call	4018E0h
	add	esp,8h
	push	eax
	mov	ecx,esi
	mov	byte ptr [esp+180h],4h
	call	dword ptr [8A4358h]
	lea	ecx,[esp+28h]
	mov	[esp+17Ch],bl
	call	dword ptr [8A4338h]

l004037FE:
	lea	edx,[esp+44h]
	push	edx
	mov	ecx,esi
	mov	byte ptr [esp+17h],2Fh
	mov	byte ptr [esp+16h],5Ch
	call	dword ptr [8A43D0h]
	mov	edi,eax
	lea	eax,[esp+20h]
	push	eax
	mov	ecx,esi
	call	dword ptr [8A43CCh]
	lea	ecx,[esp+13h]
	push	ecx
	mov	ecx,[edi+4h]
	lea	edx,[esp+16h]
	push	edx
	mov	edx,[edi]
	push	ecx
	mov	ecx,[eax+4h]
	push	edx
	mov	edx,[eax]
	push	ecx
	push	edx
	call	402230h
	add	esp,18h
	mov	ecx,esi
	call	dword ptr [8A435Ch]
	push	ecx
	mov	ecx,esp
	sub	eax,ebx
	mov	[ecx],eax
	mov	ecx,esi
	mov	[esp+18h],esp
	call	dword ptr [8A43C8h]
	cmp	byte ptr [eax],2Fh
	jnz	4038A0h

l00403864:
	mov	ecx,esi
	call	dword ptr [8A435Ch]
	sub	eax,ebx
	push	eax
	push	0h
	lea	eax,[esp+30h]
	push	eax
	mov	ecx,esi
	call	dword ptr [8A4340h]
	push	eax
	mov	ecx,esi
	mov	byte ptr [esp+180h],5h
	call	dword ptr [8A4358h]
	lea	ecx,[esp+28h]
	mov	[esp+17Ch],bl
	call	dword ptr [8A4338h]

l004038A0:
	lea	ecx,[esp+50h]
	mov	byte ptr [esp+17Ch],0h
	call	dword ptr [8A4338h]
	mov	eax,esi
	mov	ecx,[esp+174h]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebx
	mov	ecx,[esp+160h]
	xor	ecx,esp
	call	694B8Eh
	add	esp,170h
	ret
004038DB                                  CC CC CC CC CC            .....
004038E0 51 56 8B 74 24 0C 56 C7 44 24 08 00 00 00 00 E8 QV.t$.V.D$......
004038F0 2C FB FF FF 83 C4 04 8B C6 5E 59 C3 CC CC CC CC ,........^Y.....

;; fn00403900: 00403900
;;   Called from:
;;     004087E8 (in fn00408720)
;;     0040BD73 (in fn0040BD40)
;;     0040CB7B (in fn0040CAE0)
;;     0040CCCB (in fn0040CBA0)
;;     0040CD5F (in fn0040CBA0)
;;     0040CDE0 (in fn0040CBA0)
;;     0040CE6E (in fn0040CBA0)
;;     0040D22A (in fn0040CBA0)
;;     0040D2C6 (in fn0040CBA0)
;;     0040D33D (in fn0040CBA0)
;;     0040D3B4 (in fn0040CBA0)
;;     0040D42B (in fn0040CBA0)
;;     0040D4A2 (in fn0040CBA0)
;;     00659153 (in fn00659040)
fn00403900 proc
	push	ebx
	mov	ebx,ecx
	push	esi
	mov	esi,[ebx+4h]
	test	esi,esi
	jz	40392Fh

l0040390B:
	push	edi
	mov	edi,[ebx+8h]
	cmp	esi,edi
	jz	403922h

l00403913:
	mov	ecx,esi
	call	dword ptr [8A4338h]
	add	esi,1Ch
	cmp	esi,edi
	jnz	403913h

l00403922:
	mov	eax,[ebx+4h]
	push	eax
	call	694FC6h
	add	esp,4h
	pop	edi

l0040392F:
	pop	esi
	mov	dword ptr [ebx+4h],0h
	mov	dword ptr [ebx+8h],0h
	mov	dword ptr [ebx+0Ch],0h
	pop	ebx
	ret
00403947                      CC CC CC CC CC CC CC CC CC        .........

;; fn00403950: 00403950
;;   Called from:
;;     00403CEF (in fn00403CA0)
fn00403950 proc
	push	ebp
	mov	ebp,esp
	push	0FFh
	push	82B4C9h
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,38h
	mov	eax,[0A14188h]
	xor	eax,ebp
	mov	[ebp-14h],eax
	push	ebx
	push	esi
	push	edi
	push	eax
	lea	eax,[ebp-0Ch]
	mov	fs:[0000h],eax
	mov	[ebp-10h],esp
	mov	eax,[ebp+10h]
	mov	esi,ecx
	push	eax
	lea	ecx,[ebp-30h]
	mov	[ebp-44h],esi
	call	dword ptr [8A433Ch]
	mov	ebx,[esi+4h]
	xor	eax,eax
	cmp	ebx,eax
	mov	[ebp-4h],eax
	jz	4039B4h

l0040399C:
	mov	ecx,[esi+0Ch]
	sub	ecx,ebx
	mov	eax,92492493h
	imul	ecx
	add	edx,ecx
	sar	edx,4h
	mov	eax,edx
	shr	eax,1Fh
	add	eax,edx

l004039B4:
	mov	edi,[ebp+0Ch]
	test	edi,edi
	mov	[ebp-34h],eax
	jz	403C5Dh

l004039C2:
	test	ebx,ebx
	jnz	4039CAh

l004039C6:
	xor	eax,eax
	jmp	4039E2h

l004039CA:
	mov	ecx,[esi+8h]
	sub	ecx,ebx
	mov	eax,92492493h
	imul	ecx
	add	edx,ecx
	sar	edx,4h
	mov	eax,edx
	shr	eax,1Fh
	add	eax,edx

l004039E2:
	mov	ecx,9249249h
	sub	ecx,eax
	cmp	ecx,edi
	jnc	4039F2h

l004039ED:
	call	401A70h

l004039F2:
	test	ebx,ebx
	jnz	4039FAh

l004039F6:
	xor	eax,eax
	jmp	403A12h

l004039FA:
	mov	ecx,[esi+8h]
	sub	ecx,ebx
	mov	eax,92492493h
	imul	ecx
	add	edx,ecx
	sar	edx,4h
	mov	eax,edx
	shr	eax,1Fh
	add	eax,edx

l00403A12:
	mov	ecx,[ebp-34h]
	add	eax,edi
	cmp	ecx,eax
	jnc	403B60h

l00403A1F:
	mov	eax,ecx
	shr	eax,1h
	mov	edx,9249249h
	sub	edx,eax
	cmp	edx,ecx
	jnc	403A37h

l00403A2E:
	mov	dword ptr [ebp-34h],0h
	jmp	403A3Ch

l00403A37:
	add	ecx,eax
	mov	[ebp-34h],ecx

l00403A3C:
	test	ebx,ebx
	jnz	403A44h

l00403A40:
	xor	eax,eax
	jmp	403A5Ch

l00403A44:
	mov	ecx,[esi+8h]
	sub	ecx,ebx
	mov	eax,92492493h
	imul	ecx
	add	edx,ecx
	sar	edx,4h
	mov	eax,edx
	shr	eax,1Fh
	add	eax,edx

l00403A5C:
	add	eax,edi
	cmp	[ebp-34h],eax
	jnc	403A6Fh

l00403A63:
	mov	ecx,esi
	call	40D930h
	add	eax,edi
	mov	[ebp-34h],eax

l00403A6F:
	mov	eax,[ebp-34h]
	push	0h
	push	eax
	call	40DDE0h
	mov	ebx,[ebp+8h]
	mov	ecx,[esi+4h]
	mov	byte ptr [ebp-3Ch],0h
	mov	edx,[ebp-3Ch]
	push	edx
	mov	edx,[ebp-3Ch]
	push	edx
	push	esi
	push	eax
	push	ebx
	push	ecx
	mov	[ebp-40h],eax
	mov	[ebp-38h],eax
	mov	byte ptr [ebp-4h],1h
	call	402150h
	add	esp,20h
	lea	ecx,[ebp-30h]
	push	ecx
	push	edi
	push	eax
	mov	ecx,esi
	mov	[ebp-38h],eax
	call	4033B0h
	mov	ecx,[esi+8h]
	mov	byte ptr [ebp-3Ch],0h
	mov	edx,[ebp-3Ch]
	push	edx
	mov	edx,[ebp-3Ch]
	push	edx
	push	esi
	push	eax
	push	ecx
	push	ebx
	mov	[ebp-38h],eax
	call	402150h
	mov	ebx,[esi+4h]
	xor	eax,eax
	add	esp,18h
	cmp	ebx,eax
	mov	[ebp-4h],eax
	jz	403AF4h

l00403ADC:
	mov	ecx,[esi+8h]
	sub	ecx,ebx
	mov	eax,92492493h
	imul	ecx
	add	edx,ecx
	sar	edx,4h
	mov	eax,edx
	shr	eax,1Fh
	add	eax,edx

l00403AF4:
	add	edi,eax
	test	ebx,ebx
	jz	403B12h

l00403AFA:
	mov	eax,[esi+8h]
	push	eax
	push	ebx
	mov	ecx,esi
	call	4033F0h
	mov	eax,[esi+4h]
	push	eax
	call	694FC6h
	add	esp,4h

l00403B12:
	mov	eax,[ebp-34h]
	lea	ecx,[0000h+eax*8]
	sub	ecx,eax
	mov	eax,[ebp-40h]
	lea	edx,[eax+ecx*4]
	lea	ecx,[0000h+edi*8]
	sub	ecx,edi
	mov	[esi+0Ch],edx
	lea	edx,[eax+ecx*4]
	mov	[esi+8h],edx
	mov	[esi+4h],eax
	jmp	403C5Dh
00403B3E                                           8B 45               .E
00403B40 C8 8B 75 C0 8B 4D BC 50 56 E8 A2 F8 FF FF 56 E8 ..u..M.PV.....V.
00403B50 72 14 29 00 83 C4 04 6A 00 6A 00 E8 6C 14 29 00 r.)....j.j..l.).

l00403B60:
	mov	ecx,[esi+8h]
	mov	ebx,[ebp+8h]
	mov	edx,ecx
	sub	edx,ebx
	mov	[ebp-3Ch],edx
	mov	eax,92492493h
	imul	edx
	add	edx,[ebp-3Ch]
	mov	[ebp-40h],ecx
	sar	edx,4h
	mov	eax,edx
	shr	eax,1Fh
	add	eax,edx
	cmp	eax,edi
	lea	eax,[0000h+edi*8]
	jnc	403C25h

l00403B93:
	sub	eax,edi
	add	eax,eax
	add	eax,eax
	mov	[ebp-38h],eax
	add	eax,ebx
	push	eax
	push	ecx
	push	ebx
	mov	ecx,esi
	call	402E80h
	mov	ecx,[esi+8h]
	sub	ecx,ebx
	lea	edx,[ebp-30h]
	push	edx
	mov	eax,92492493h
	imul	ecx
	add	edx,ecx
	sar	edx,4h
	mov	eax,edx
	shr	eax,1Fh
	add	eax,edx
	sub	edi,eax
	mov	eax,[esi+8h]
	push	edi
	push	eax
	mov	ecx,esi
	mov	byte ptr [ebp-4h],3h
	call	4033B0h
	mov	eax,[ebp-38h]
	add	[esi+8h],eax
	mov	esi,[esi+8h]
	lea	ecx,[ebp-30h]
	push	ecx
	sub	esi,eax
	push	esi
	push	ebx
	mov	dword ptr [ebp-4h],0h
	call	401D40h
	add	esp,0Ch
	jmp	403C5Dh
00403BF8                         8B 4D 0C 8D 04 CD 00 00         .M......
00403C00 00 00 2B C1 8B 4D BC 8B 51 08 03 C0 03 C0 03 D0 ..+..M..Q.......
00403C10 52 8B 55 08 03 C2 50 E8 D4 F7 FF FF 6A 00 6A 00 R.U...P.....j.j.
00403C20 E8 A7 13 29 00                                  ...).          

l00403C25:
	sub	eax,edi
	add	eax,eax
	push	ecx
	add	eax,eax
	mov	edi,ecx
	push	ecx
	sub	edi,eax
	push	edi
	mov	ecx,esi
	mov	[ebp-38h],eax
	call	402E80h
	mov	[esi+8h],eax
	mov	eax,[ebp-40h]
	push	eax
	push	edi
	push	ebx
	call	402120h
	mov	edx,[ebp-38h]
	lea	ecx,[ebp-30h]
	push	ecx
	add	edx,ebx
	push	edx
	push	ebx
	call	401D40h
	add	esp,18h

l00403C5D:
	lea	ecx,[ebp-30h]
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	dword ptr [8A4338h]
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebx
	mov	ecx,[ebp-14h]
	xor	ecx,ebp
	call	694B8Eh
	mov	esp,ebp
	pop	ebp
	ret	0Ch
00403C8B                                  CC CC CC CC CC            .....
00403C90 E9 6B FC FF FF CC CC CC CC CC CC CC CC CC CC CC .k..............

;; fn00403CA0: 00403CA0
;;   Called from:
;;     00403F59 (in fn00403ED0)
fn00403CA0 proc
	push	ebx
	mov	ebx,[esp+0Ch]
	push	esi
	push	edi
	mov	edi,ecx
	mov	esi,[edi+4h]
	test	esi,esi
	jz	403CCAh

l00403CB0:
	mov	ecx,[edi+8h]
	sub	ecx,esi
	mov	eax,92492493h
	imul	ecx
	add	edx,ecx
	sar	edx,4h
	mov	eax,edx
	shr	eax,1Fh
	add	eax,edx
	jnz	403CCEh

l00403CCA:
	xor	esi,esi
	jmp	403CE5h

l00403CCE:
	mov	ecx,ebx
	sub	ecx,esi
	mov	eax,92492493h
	imul	ecx
	add	edx,ecx
	sar	edx,4h
	mov	esi,edx
	shr	esi,1Fh
	add	esi,edx

l00403CE5:
	mov	ecx,[esp+18h]
	push	ecx
	push	1h
	push	ebx
	mov	ecx,edi
	call	403950h
	mov	eax,[edi+4h]
	lea	edx,[0000h+esi*8]
	sub	edx,esi
	pop	edi
	lea	ecx,[eax+edx*4]
	mov	eax,[esp+0Ch]
	pop	esi
	mov	[eax],ecx
	pop	ebx
	ret	0Ch
00403D0F                                              CC                .

;; fn00403D10: 00403D10
;;   Called from:
;;     00403EA0 (in fn00403E60)
fn00403D10 proc
	push	0FFh
	push	82B51Bh
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,20h
	push	esi
	mov	eax,[0A14188h]
	xor	eax,esp
	push	eax
	lea	eax,[esp+28h]
	mov	fs:[0000h],eax
	mov	esi,ecx
	mov	[esp+8h],esi
	xor	eax,eax
	mov	[esi],eax
	mov	[esi+4h],eax
	mov	[esi+8h],eax
	mov	[esi+10h],eax
	mov	[esp+30h],eax
	mov	[esi+18h],eax
	mov	[esi+1Ch],eax
	mov	[esi+20h],eax
	lea	ecx,[esi+24h]
	mov	byte ptr [esp+30h],1h
	call	dword ptr [8A43B0h]
	push	8A698Fh
	lea	ecx,[esp+10h]
	mov	byte ptr [esp+34h],2h
	call	dword ptr [8A4334h]
	lea	eax,[esp+0Ch]
	push	eax
	mov	byte ptr [esp+34h],3h
	call	408FB0h
	add	esp,4h
	lea	ecx,[esp+0Ch]
	mov	[esi+0Ch],eax
	mov	byte ptr [esp+30h],2h
	call	dword ptr [8A4338h]
	mov	eax,esi
	mov	ecx,[esp+28h]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	esi
	add	esp,2Ch
	ret
00403DAD                                        CC CC CC              ...
00403DB0 6A FF 68 62 B5 82 00 64 A1 00 00 00 00 50 51 53 j.hb...d.....PQS
00403DC0 56 57 A1 88 41 A1 00 33 C4 50 8D 44 24 14 64 A3 VW..A..3.P.D$.d.
00403DD0 00 00 00 00 8B F1 89 74 24 10 6A 01 C7 44 24 20 .......t$.j..D$ 
00403DE0 02 00 00 00 E8 27 E5 FF FF 8B 4E 0C 33 DB 3B CB .....'....N.3.;.
00403DF0 74 08 8B 01 8B 10 6A 01 FF D2 8D 4E 24 C6 44 24 t.....j....N$.D$
00403E00 1C 01 FF 15 38 43 8A 00 8D 4E 14 88 5C 24 1C E8 ....8C...N..\$..
00403E10 EC FA FF FF 8B 7E 04 3B FB C7 44 24 1C FF FF FF .....~.;..D$....
00403E20 FF 74 1A 8B CF E8 B6 DC FF FF 83 F8 01 75 0E 3B .t...........u.;
00403E30 FB 74 0A 8B 07 8B 10 6A 01 8B CF FF D2 89 5E 04 .t.....j......^.
00403E40 8B 4C 24 14 64 89 0D 00 00 00 00 59 5F 5E 5B 83 .L$.d......Y_^[.
00403E50 C4 10 C3 CC CC CC CC CC CC CC CC CC CC CC CC CC ................

;; fn00403E60: 00403E60
;;   Called from:
;;     00404953 (in fn004048C0)
fn00403E60 proc
	push	0FFh
	push	82B58Bh
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
	push	40h
	call	694FD8h
	add	esp,4h
	mov	[esp+8h],eax
	test	eax,eax
	mov	dword ptr [esp+14h],0h
	jz	403EA7h

l00403E9E:
	mov	ecx,eax
	call	403D10h
	jmp	403EA9h

l00403EA7:
	xor	eax,eax

l00403EA9:
	mov	ecx,[esp+1Ch]
	mov	[esi],eax
	mov	[eax],ecx
	mov	eax,esi
	mov	ecx,[esp+0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	esi
	add	esp,10h
	ret	4h
00403EC6                   CC CC CC CC CC CC CC CC CC CC       ..........

;; fn00403ED0: 00403ED0
;;   Called from:
;;     004040F2 (in fn00403F70)
;;     0040D201 (in fn0040CBA0)
;;     00413C56 (in fn00413A20)
fn00403ED0 proc
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	edi,ecx
	mov	ebx,[edi+4h]
	test	ebx,ebx
	jnz	403EE1h

l00403EDD:
	xor	esi,esi
	jmp	403EF9h

l00403EE1:
	mov	ecx,[edi+8h]
	sub	ecx,ebx
	mov	eax,92492493h
	imul	ecx
	add	edx,ecx
	sar	edx,4h
	mov	esi,edx
	shr	esi,1Fh
	add	esi,edx

l00403EF9:
	test	ebx,ebx
	jz	403F49h

l00403EFD:
	mov	ecx,[edi+0Ch]
	sub	ecx,ebx
	mov	eax,92492493h
	imul	ecx
	add	edx,ecx
	sar	edx,4h
	mov	eax,edx
	shr	eax,1Fh
	add	eax,edx
	cmp	esi,eax
	jnc	403F49h

l00403F19:
	mov	ecx,[esp+14h]
	mov	edx,[esp+14h]
	mov	esi,[edi+8h]
	mov	byte ptr [esp+0Ch],0h
	mov	eax,[esp+0Ch]
	push	eax
	push	ecx
	push	edi
	push	edx
	push	1h
	push	esi
	call	402270h
	add	esp,18h
	add	esi,1Ch
	mov	[edi+8h],esi
	pop	edi
	pop	esi
	pop	ebx
	pop	ecx
	ret	4h

l00403F49:
	mov	ecx,[esp+14h]
	mov	eax,[edi+8h]
	push	ecx
	push	eax
	lea	edx,[esp+1Ch]
	push	edx
	mov	ecx,edi
	call	403CA0h
	pop	edi
	pop	esi
	pop	ebx
	pop	ecx
	ret	4h
00403F65                CC CC CC CC CC CC CC CC CC CC CC      ...........

;; fn00403F70: 00403F70
;;   Called from:
;;     0040425F (in fn00404190)
;;     004044FB (in fn00404190)
;;     00404794 (in fn004046D0)
fn00403F70 proc
	push	0FFh
	push	82B5CBh
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,68h
	mov	eax,[0A14188h]
	xor	eax,esp
	mov	[esp+64h],eax
	push	ebx
	push	ebp
	push	esi
	push	edi
	mov	eax,[0A14188h]
	xor	eax,esp
	push	eax
	lea	eax,[esp+7Ch]
	mov	fs:[0000h],eax
	mov	ecx,[esp+90h]
	mov	eax,[esp+8Ch]
	mov	edx,[esp+94h]
	mov	[esp+18h],ecx
	push	eax
	lea	ecx,[esp+60h]
	mov	[esp+18h],edx
	call	dword ptr [8A433Ch]
	xor	ebx,ebx
	push	8A6BE0h
	lea	ecx,[esp+60h]
	mov	[esp+88h],ebx
	call	dword ptr [8A4354h]
	push	eax
	call	dword ptr [8A46BCh]
	mov	esi,eax
	add	esp,8h
	cmp	esi,ebx
	jz	40413Eh

l00403FF6:
	mov	ebp,[8A4684h]
	lea	esp,[esp+0h]

l00404000:
	movsx	eax,byte ptr [esi]
	push	eax
	call	ebp
	add	esp,4h
	test	eax,eax
	jz	404021h

l0040400D:
	lea	ecx,[ecx+0h]

l00404010:
	movsx	ecx,byte ptr [esi+1h]
	add	esi,1h
	push	ecx
	call	ebp
	add	esp,4h
	test	eax,eax
	jnz	404010h

l00404021:
	mov	eax,esi
	lea	edx,[eax+1h]

l00404026:
	mov	cl,[eax]
	add	eax,1h
	cmp	cl,bl
	jnz	404026h

l0040402F:
	sub	eax,edx
	lea	edi,[eax+esi-1h]
	cmp	edi,esi
	jbe	404125h

l0040403D:
	lea	ecx,[ecx+0h]

l00404040:
	movsx	edx,byte ptr [edi]
	push	edx
	call	ebp
	add	esp,4h
	test	eax,eax
	jz	40405Bh

l0040404D:
	mov	[edi],bl
	sub	edi,1h
	cmp	edi,esi
	ja	404040h

l00404056:
	jmp	404125h

l0040405B:
	cmp	edi,esi
	jbe	404125h

l00404063:
	push	esi
	lea	ecx,[esp+28h]
	call	dword ptr [8A4334h]
	mov	eax,[esp+14h]
	push	eax
	lea	ecx,[esp+28h]
	push	ecx
	lea	edx,[esp+48h]
	push	edx
	mov	byte ptr [esp+90h],1h
	call	403570h
	add	esp,0Ch
	lea	ecx,[esp+24h]
	mov	byte ptr [esp+84h],3h
	call	dword ptr [8A4338h]
	call	4048C0h
	mov	eax,[eax]
	mov	ecx,[eax+0Ch]
	mov	edx,[ecx]
	mov	edx,[edx+4h]
	push	ebx
	lea	eax,[esp+44h]
	push	eax
	call	edx
	test	eax,eax
	jnz	4040E3h

l004040BA:
	lea	ecx,[esp+40h]
	mov	[esp+1Ch],ebx
	mov	dword ptr [esp+20h],6h
	call	dword ptr [8A4354h]
	push	eax
	lea	eax,[esp+20h]
	push	8A6B28h
	push	eax
	call	61FC50h
	add	esp,0Ch

l004040E3:
	call	4048C0h
	lea	ecx,[esp+40h]
	push	ecx
	mov	ecx,[eax]
	add	ecx,14h
	call	403ED0h
	mov	edx,[esp+18h]
	push	edx
	lea	ecx,[esp+44h]
	call	dword ptr [8A4354h]
	push	eax
	push	8A6B08h
	call	520C80h
	add	esp,0Ch
	lea	ecx,[esp+40h]
	mov	[esp+84h],bl
	call	dword ptr [8A4338h]

l00404125:
	push	8A6BE0h
	push	ebx
	call	dword ptr [8A46BCh]
	mov	esi,eax
	add	esp,8h
	cmp	esi,ebx
	jnz	404000h

l0040413E:
	call	4048C0h
	mov	eax,[eax]
	cmp	[eax+8h],ebx
	jz	404156h

l0040414A:
	call	4048C0h
	mov	ecx,[eax]
	call	4023A0h

l00404156:
	lea	ecx,[esp+5Ch]
	mov	dword ptr [esp+84h],0FFFFFFFFh
	call	dword ptr [8A4338h]
	mov	ecx,[esp+7Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebp
	pop	ebx
	mov	ecx,[esp+64h]
	xor	ecx,esp
	call	694B8Eh
	add	esp,74h
	ret
0040418A                               CC CC CC CC CC CC           ......

;; fn00404190: 00404190
;;   Called from:
;;     00404880 (in fn004046D0)
fn00404190 proc
	push	0FFh
	push	82B689h
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,0B4h
	mov	eax,[0A14188h]
	xor	eax,esp
	mov	[esp+0B0h],eax
	push	ebx
	push	ebp
	push	esi
	push	edi
	mov	eax,[0A14188h]
	xor	eax,esp
	push	eax
	lea	eax,[esp+0C8h]
	mov	fs:[0000h],eax
	mov	edi,ecx
	mov	[esp+30h],edi
	mov	eax,[edi+18h]
	xor	ebp,ebp
	cmp	eax,ebp
	mov	[esp+0D0h],ebp
	jz	4041FFh

l004041E1:
	mov	ecx,[edi+1Ch]
	sub	ecx,eax
	mov	eax,92492493h
	imul	ecx
	add	edx,ecx
	sar	edx,4h
	mov	eax,edx
	shr	eax,1Fh
	add	eax,edx
	jnz	40428Eh

l004041FF:
	push	8A6CB4h
	call	dword ptr [8A4688h]
	mov	esi,eax
	add	esp,4h
	cmp	esi,ebp
	jz	40428Eh

l00404213:
	push	8A6C68h
	call	520C80h
	add	esp,4h
	push	8A698Fh
	lea	ecx,[esp+74h]
	call	dword ptr [8A4334h]
	push	esi
	lea	ecx,[esp+90h]
	mov	byte ptr [esp+0D4h],1h
	call	dword ptr [8A4334h]
	lea	ecx,[esp+70h]
	push	ecx
	lea	edx,[esp+90h]
	push	8A6C44h
	push	edx
	mov	byte ptr [esp+0DCh],2h
	call	403F70h
	add	esp,0Ch
	lea	ecx,[esp+8Ch]
	mov	byte ptr [esp+0D0h],1h
	call	dword ptr [8A4338h]
	lea	ecx,[esp+70h]
	mov	byte ptr [esp+0D0h],0h
	call	dword ptr [8A4338h]

l0040428E:
	mov	eax,[edi+18h]
	cmp	eax,ebp
	jz	4042B3h

l00404295:
	mov	ecx,[edi+1Ch]
	sub	ecx,eax
	mov	eax,92492493h
	imul	ecx
	add	edx,ecx
	sar	edx,4h
	mov	eax,edx
	shr	eax,1Fh
	add	eax,edx
	jnz	404658h

l004042B3:
	lea	ecx,[esp+70h]
	call	dword ptr [8A43B0h]
	mov	byte ptr [esp+0D0h],3h

l004042C5:
	lea	ecx,[esp+0D8h]
	push	8A698Fh
	push	ecx
	call	dword ptr [8A43B4h]
	add	esp,8h
	test	al,al
	jz	404319h

l004042DF:
	lea	edx,[esp+0A8h]
	push	edx
	call	403420h
	add	esp,4h
	push	eax
	lea	ecx,[esp+74h]
	mov	byte ptr [esp+0D4h],4h
	call	dword ptr [8A4358h]
	lea	ecx,[esp+0A8h]
	mov	byte ptr [esp+0D0h],3h
	call	dword ptr [8A4338h]
	jmp	40432Bh

l00404319:
	lea	eax,[esp+0D8h]
	push	eax
	lea	ecx,[esp+74h]
	call	dword ptr [8A4358h]

l0040432B:
	push	8A698Fh
	lea	ecx,[esp+0DCh]
	call	dword ptr [8A43E0h]
	push	8A6C38h
	lea	ecx,[esp+74h]
	push	ecx
	lea	edx,[esp+94h]
	push	edx
	call	dword ptr [8A43D4h]
	add	esp,0Ch
	mov	ecx,[edi+0Ch]
	mov	eax,[ecx]
	mov	eax,[eax+4h]
	push	ebp
	lea	edx,[esp+90h]
	push	edx
	mov	byte ptr [esp+0D8h],5h
	call	eax
	test	eax,eax
	jz	4045EFh

l0040437B:
	lea	ecx,[esp+8Ch]
	call	dword ptr [8A4354h]
	push	eax
	push	8A6C28h
	call	520C80h
	mov	ecx,[edi+0Ch]
	mov	edx,[ecx]
	mov	edx,[edx+10h]
	add	esp,8h
	lea	eax,[esp+8Ch]
	push	eax
	lea	eax,[esp+18h]
	push	eax
	call	edx
	push	8A6C20h
	lea	ecx,[esp+58h]
	mov	byte ptr [esp+0D4h],6h
	call	dword ptr [8A4334h]
	push	ecx
	mov	ecx,[esp+18h]
	mov	eax,esp
	mov	[eax],ecx
	mov	eax,[esp+18h]
	cmp	eax,ebp
	mov	byte ptr [esp+0D4h],7h
	mov	[esp+38h],esp
	jz	4043E5h

l004043E1:
	add	dword ptr [eax+4h],1h

l004043E5:
	lea	edx,[esp+58h]
	push	edx
	lea	eax,[esp+24h]
	push	eax
	call	418D40h
	mov	ebx,[eax]
	add	esp,0Ch
	cmp	ebx,ebp
	mov	[esp+34h],ebx
	jz	404408h

l00404401:
	mov	ecx,ebx
	call	401AD0h

l00404408:
	mov	ecx,[esp+1Ch]
	cmp	ecx,ebp
	mov	byte ptr [esp+0D0h],8h
	jz	404431h

l00404418:
	mov	esi,ecx
	call	401AE0h
	cmp	eax,1h
	jnz	404431h

l00404424:
	cmp	esi,ebp
	jz	404431h

l00404428:
	mov	edx,[esi]
	push	eax
	mov	eax,[edx]
	mov	ecx,esi
	call	eax

l00404431:
	mov	[esp+1Ch],ebp
	lea	ecx,[esp+54h]
	mov	byte ptr [esp+0D0h],9h
	call	dword ptr [8A4338h]
	cmp	ebx,ebp
	jz	404597h

l0040444F:
	push	8A6C18h
	lea	ecx,[esp+0ACh]
	call	dword ptr [8A4334h]
	push	ebp
	lea	ecx,[esp+0ACh]
	push	ecx
	lea	edx,[esp+20h]
	push	edx
	mov	ecx,ebx
	mov	byte ptr [esp+0DCh],0Ah
	call	40E780h
	xor	eax,eax
	xor	ecx,ecx
	mov	[esp+24h],eax
	mov	[esp+28h],ecx
	mov	[esp+2Ch],ebp
	cmp	[esp+18h],ebp
	mov	byte ptr [esp+0D0h],0Ch
	jz	4044E1h

l0040449C:
	push	8A6C10h
	lea	ecx,[esp+3Ch]
	call	dword ptr [8A4334h]
	push	ebp
	lea	eax,[esp+24h]
	push	eax
	lea	ecx,[esp+40h]
	push	ecx
	mov	ecx,[esp+24h]
	mov	byte ptr [esp+0DCh],0Dh
	call	413A20h
	lea	ecx,[esp+38h]
	mov	byte ptr [esp+0D0h],0Ch
	call	dword ptr [8A4338h]
	mov	ecx,[esp+28h]
	mov	eax,[esp+24h]

l004044E1:
	cmp	eax,ecx
	mov	esi,eax
	jz	404512h

l004044E7:
	jmp	4044F0h
004044E9                            8D A4 24 00 00 00 00          ..$....

l004044F0:
	lea	edx,[esp+70h]
	push	edx
	push	8A6C00h
	push	esi
	call	403F70h
	mov	ecx,[esp+34h]
	add	esi,1Ch
	add	esp,0Ch
	cmp	esi,ecx
	jnz	4044F0h

l0040450E:
	mov	eax,[esp+24h]

l00404512:
	cmp	eax,ebp
	mov	byte ptr [esp+0D0h],0Bh
	jz	404546h

l0040451E:
	cmp	eax,ecx
	mov	edi,ecx
	mov	esi,eax
	jz	404539h

l00404526:
	mov	ecx,esi
	call	dword ptr [8A4338h]
	add	esi,1Ch
	cmp	esi,edi
	jnz	404526h

l00404535:
	mov	eax,[esp+24h]

l00404539:
	push	eax
	call	694FC6h
	mov	edi,[esp+34h]
	add	esp,4h

l00404546:
	mov	ecx,[esp+18h]
	cmp	ecx,ebp
	mov	[esp+24h],ebp
	mov	[esp+28h],ebp
	mov	[esp+2Ch],ebp
	mov	byte ptr [esp+0D0h],0Ah
	jz	40457Ch

l00404562:
	mov	esi,ecx
	call	401AE0h
	cmp	eax,1h
	jnz	40457Ch

l0040456E:
	cmp	esi,ebp
	jz	40457Ch

l00404572:
	mov	eax,[esi]
	mov	edx,[eax]
	push	1h
	mov	ecx,esi
	call	edx

l0040457C:
	lea	ecx,[esp+0A8h]
	mov	[esp+18h],ebp
	mov	byte ptr [esp+0D0h],9h
	call	dword ptr [8A4338h]
	jmp	4045A4h

l00404597:
	push	8A6BE4h
	call	520C80h
	add	esp,4h

l004045A4:
	cmp	ebx,ebp
	mov	byte ptr [esp+0D0h],6h
	jz	4045C6h

l004045B0:
	mov	ecx,ebx
	call	401AE0h
	cmp	eax,1h
	jnz	4045C6h

l004045BC:
	mov	eax,[ebx]
	mov	edx,[eax]
	push	1h
	mov	ecx,ebx
	call	edx

l004045C6:
	mov	eax,[esp+14h]
	cmp	eax,ebp
	mov	byte ptr [esp+0D0h],5h
	jz	4045EBh

l004045D6:
	add	dword ptr [eax+4h],0FFh
	mov	ecx,eax
	add	eax,4h
	cmp	[eax],ebp
	jnz	4045EBh

l004045E3:
	mov	eax,[ecx]
	mov	edx,[eax]
	push	1h
	call	edx

l004045EB:
	mov	[esp+14h],ebp

l004045EF:
	lea	ecx,[esp+8Ch]
	mov	byte ptr [esp+0D0h],3h
	call	dword ptr [8A4338h]
	lea	eax,[esp+0A8h]
	push	eax
	call	403420h
	push	eax
	lea	ecx,[esp+78h]
	push	ecx
	mov	byte ptr [esp+0DCh],0Eh
	call	dword ptr [8A43E8h]
	add	esp,0Ch
	lea	ecx,[esp+0A8h]
	mov	bl,al
	mov	byte ptr [esp+0D0h],3h
	call	dword ptr [8A4338h]
	test	bl,bl
	jnz	4042C5h

l00404647:
	lea	ecx,[esp+70h]
	mov	[esp+0D0h],bl
	call	dword ptr [8A4338h]

l00404658:
	mov	eax,[edi+18h]
	cmp	eax,ebp
	jnz	404663h

l0040465F:
	xor	eax,eax
	jmp	40467Bh

l00404663:
	mov	ecx,[edi+1Ch]
	sub	ecx,eax
	mov	eax,92492493h
	imul	ecx
	add	edx,ecx
	sar	edx,4h
	mov	eax,edx
	shr	eax,1Fh
	add	eax,edx

l0040467B:
	cmp	eax,ebp
	lea	ecx,[esp+0D8h]
	setnz	bl
	mov	dword ptr [esp+0D0h],0FFFFFFFFh
	call	dword ptr [8A4338h]
	mov	al,bl
	mov	ecx,[esp+0C8h]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebp
	pop	ebx
	mov	ecx,[esp+0B0h]
	xor	ecx,esp
	call	694B8Eh
	add	esp,0C0h
	ret	1Ch
004046C4             CC CC CC CC CC CC CC CC CC CC CC CC     ............

;; fn004046D0: 004046D0
;;   Called from:
;;     00401262 (in fn00401080)
;;     00404910 (in fn004048C0)
fn004046D0 proc
	push	0FFh
	push	82B6E4h
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,5Ch
	mov	eax,[0A14188h]
	xor	eax,esp
	mov	[esp+58h],eax
	push	ebx
	push	ebp
	push	esi
	push	edi
	mov	eax,[0A14188h]
	xor	eax,esp
	push	eax
	lea	eax,[esp+70h]
	mov	fs:[0000h],eax
	mov	eax,[esp+80h]
	mov	ebx,[esp+84h]
	add	eax,0FFh
	xor	ebp,ebp
	test	eax,eax
	mov	byte ptr [0A53EF0h],1h
	mov	[esp+14h],eax
	jle	40484Fh

l00404728:
	jmp	404730h
0040472A                               8D 9B 00 00 00 00           ......

l00404730:
	mov	eax,[ebx+ebp*4]
	mov	edi,8A6970h
	mov	esi,eax
	mov	ecx,6h
	xor	edx,edx

l00404741:
	rep cmpsb

l00404743:
	jz	404757h

l00404745:
	mov	esi,eax
	mov	edi,8A696Ch
	mov	ecx,3h
	xor	eax,eax

l00404753:
	rep cmpsb

l00404755:
	jnz	4047BDh

l00404757:
	push	8A698Fh
	lea	ecx,[esp+1Ch]
	call	dword ptr [8A4334h]
	mov	ecx,[ebx+ebp*4+4h]
	push	ecx
	lea	ecx,[esp+38h]
	mov	dword ptr [esp+7Ch],0h
	call	dword ptr [8A4334h]
	lea	edx,[esp+18h]
	push	edx
	lea	eax,[esp+38h]
	push	8A6CFCh
	push	eax
	mov	byte ptr [esp+84h],1h
	call	403F70h
	add	esp,0Ch
	lea	ecx,[esp+34h]
	mov	byte ptr [esp+78h],0h
	call	dword ptr [8A4338h]
	lea	ecx,[esp+18h]
	mov	dword ptr [esp+78h],0FFFFFFFFh
	call	dword ptr [8A4338h]

l004047BD:
	mov	eax,[ebx+ebp*4]
	mov	edi,8A6CF4h
	mov	esi,eax
	mov	ecx,5h
	xor	edx,edx

l004047CE:
	rep cmpsb

l004047D0:
	jz	4047E4h

l004047D2:
	mov	esi,eax
	mov	edi,8A6CECh
	mov	ecx,5h
	xor	eax,eax

l004047E0:
	rep cmpsb

l004047E2:
	jnz	404842h

l004047E4:
	mov	ecx,[ebx+ebp*4+4h]
	push	ecx
	push	8A6CC8h
	call	520C80h
	add	esp,8h
	push	8A6CC0h
	lea	ecx,[esp+54h]
	call	dword ptr [8A4334h]
	mov	edx,[ebx+ebp*4+4h]
	push	edx
	lea	ecx,[esp+54h]
	mov	dword ptr [esp+7Ch],2h
	call	dword ptr [8A43B8h]
	lea	ecx,[esp+50h]
	call	dword ptr [8A4354h]
	push	eax
	call	dword ptr [8A4668h]
	add	esp,4h
	lea	ecx,[esp+50h]
	mov	dword ptr [esp+78h],0FFFFFFFFh
	call	dword ptr [8A4338h]

l00404842:
	add	ebp,1h
	cmp	ebp,[esp+14h]
	jl	404730h

l0040484F:
	sub	esp,1Ch
	mov	ecx,esp
	mov	[esp+30h],esp
	push	8A698Fh
	call	dword ptr [8A4334h]
	mov	dword ptr [esp+94h],3h
	call	4048C0h
	mov	dword ptr [esp+94h],0FFFFFFFFh
	mov	ecx,[eax]
	call	404190h
	mov	bl,al
	call	4048C0h
	mov	ecx,[eax]
	call	4023A0h
	test	bl,bl
	jz	40489Ch

l00404897:
	call	402B60h

l0040489C:
	mov	al,bl
	mov	ecx,[esp+70h]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebp
	pop	ebx
	mov	ecx,[esp+58h]
	xor	ecx,esp
	call	694B8Eh
	add	esp,68h
	ret
004048BD                                        CC CC CC              ...

;; fn004048C0: 004048C0
;;   Called from:
;;     00401C7A (in fn00401C70)
;;     00401CAD (in fn00401C70)
;;     00401CDE (in fn00401C70)
;;     00402ACB (in fn00402A20)
;;     0040409F (in fn00403F70)
;;     004040E3 (in fn00403F70)
;;     0040413E (in fn00403F70)
;;     0040414A (in fn00403F70)
;;     0040486E (in fn004046D0)
;;     00404887 (in fn004046D0)
;;     004049D1 (in fn00404990)
;;     00404A61 (in fn00404A20)
;;     00404ADB (in fn00404AB0)
;;     00404B24 (in fn00404AB0)
;;     004050B6 (in fn00404FF0)
;;     004050C3 (in fn00404FF0)
;;     00405180 (in fn00404FF0)
;;     0042B42D (in fn0042B310)
;;     006572AF (in fn00657290)
;;     007B2D6A (in fn007B2D10)
fn004048C0 proc
	push	0FFh
	push	82B71Eh
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,8h
	push	esi
	mov	eax,[0A14188h]
	xor	eax,esp
	push	eax
	lea	eax,[esp+10h]
	mov	fs:[0000h],eax
	cmp	byte ptr [0A53EF0h],0h
	jnz	404918h

l004048ED:
	lea	eax,[esp+8h]
	push	8A6D10h
	push	eax
	mov	dword ptr [esp+10h],0h
	mov	dword ptr [esp+14h],6h
	call	61FC50h
	push	0h
	push	0h
	call	4046D0h
	add	esp,10h

l00404918:
	mov	ecx,[0A6B0F4h]
	mov	edx,fs:[002Ch]
	mov	esi,[edx+ecx*4]
	cmp	dword ptr [esi+8h],0h
	jnz	40496Fh

l00404931:
	mov	eax,1h
	test	[0A53F14h],al
	jnz	404965h

l0040493E:
	or	[0A53F14h],eax
	push	0h
	mov	ecx,0A53F10h
	mov	dword ptr [esp+1Ch],0h
	call	403E60h
	push	89CBC0h
	call	694C8Ch
	add	esp,4h

l00404965:
	mov	dword ptr [esi+8h],0A53F10h

l0040496F:
	mov	eax,[esi+8h]
	mov	ecx,[esp+10h]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	esi
	add	esp,14h
	ret
00404986                   CC CC CC CC CC CC CC CC CC CC       ..........

;; fn00404990: 00404990
;;   Called from:
;;     004051FD (in fn00404FF0)
fn00404990 proc
	push	0FFh
	push	82B749h
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,1Ch
	push	ebx
	mov	eax,[0A14188h]
	xor	eax,esp
	push	eax
	lea	eax,[esp+24h]
	mov	fs:[0000h],eax
	mov	ecx,[esp+34h]
	call	dword ptr [8A4354h]
	push	eax
	lea	ecx,[esp+0Ch]
	call	dword ptr [8A4334h]
	mov	dword ptr [esp+2Ch],0h
	call	4048C0h
	mov	eax,[eax]
	mov	ecx,[eax+8h]
	mov	edx,[ecx]
	mov	edx,[edx+4h]
	push	0h
	lea	eax,[esp+0Ch]
	push	eax
	call	edx
	test	eax,eax
	lea	ecx,[esp+8h]
	setnz	bl
	mov	dword ptr [esp+2Ch],0FFFFFFFFh
	call	dword ptr [8A4338h]
	mov	al,bl
	mov	ecx,[esp+24h]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	ebx
	add	esp,28h
	ret
00404A13          CC CC CC CC CC CC CC CC CC CC CC CC CC    .............

;; fn00404A20: 00404A20
;;   Called from:
;;     00405142 (in fn00404FF0)
fn00404A20 proc
	push	0FFh
	push	82B779h
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,1Ch
	push	ebx
	mov	eax,[0A14188h]
	xor	eax,esp
	push	eax
	lea	eax,[esp+24h]
	mov	fs:[0000h],eax
	mov	ecx,[esp+34h]
	call	dword ptr [8A4354h]
	push	eax
	lea	ecx,[esp+0Ch]
	call	dword ptr [8A4334h]
	mov	dword ptr [esp+2Ch],0h
	call	4048C0h
	mov	eax,[eax]
	mov	ecx,[eax+0Ch]
	mov	edx,[ecx]
	mov	edx,[edx+4h]
	push	0h
	lea	eax,[esp+0Ch]
	push	eax
	call	edx
	test	eax,eax
	lea	ecx,[esp+8h]
	setnz	bl
	mov	dword ptr [esp+2Ch],0FFFFFFFFh
	call	dword ptr [8A4338h]
	mov	al,bl
	mov	ecx,[esp+24h]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	ebx
	add	esp,28h
	ret
00404AA3          CC CC CC CC CC CC CC CC CC CC CC CC CC    .............

;; fn00404AB0: 00404AB0
;;   Called from:
;;     004052BB (in fn00404FF0)
fn00404AB0 proc
	push	0FFh
	push	82B7D4h
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,24h
	push	ebx
	push	esi
	mov	eax,[0A14188h]
	xor	eax,esp
	push	eax
	lea	eax,[esp+30h]
	mov	fs:[0000h],eax
	xor	ebx,ebx
	mov	[esp+0Ch],ebx
	call	4048C0h
	mov	eax,[eax]
	mov	edx,[eax+18h]
	add	eax,14h
	test	edx,edx
	jz	404B06h

l00404AEC:
	mov	ecx,[eax+8h]
	sub	ecx,edx
	mov	eax,92492493h
	imul	ecx
	add	edx,ecx
	sar	edx,4h
	mov	eax,edx
	shr	eax,1Fh
	add	eax,edx
	jnz	404B24h

l00404B06:
	push	8A698Fh
	lea	ecx,[esp+18h]
	call	dword ptr [8A4334h]
	mov	ebx,1h
	mov	[esp+38h],ebx
	mov	[esp+0Ch],ebx
	jmp	404B31h

l00404B24:
	call	4048C0h
	mov	eax,[eax]
	add	eax,14h
	mov	eax,[eax+4h]

l00404B31:
	mov	esi,[esp+40h]
	push	eax
	mov	ecx,esi
	call	dword ptr [8A433Ch]
	or	ebx,2h
	test	bl,1h
	mov	dword ptr [esp+38h],0h
	jz	404B5Fh

l00404B4E:
	and	ebx,0FEh
	lea	ecx,[esp+14h]
	mov	[esp+0Ch],ebx
	call	dword ptr [8A4338h]

l00404B5F:
	mov	eax,esi
	mov	ecx,[esp+30h]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	esi
	pop	ebx
	add	esp,30h
	ret
00404B73          CC CC CC CC CC CC CC CC CC CC CC CC CC    .............
00404B80 6A FF 68 14 B8 82 00 64 A1 00 00 00 00 50 83 EC j.h....d.....P..
00404B90 6C A1 88 41 A1 00 33 C4 89 44 24 68 53 56 A1 88 l..A..3..D$hSV..
00404BA0 41 A1 00 33 C4 50 8D 44 24 78 64 A3 00 00 00 00 A..3.P.D$xd.....
00404BB0 8B 84 24 88 00 00 00 50 8D 4C 24 40 FF 15 3C 43 ..$....P.L$@..<C
00404BC0 8A 00 8D 44 24 10 B3 2F 50 8D 4C 24 40 C7 84 24 ...D$../P.L$@..$
00404BD0 84 00 00 00 00 00 00 00 C6 44 24 13 5C 88 5C 24 .........D$.\.\$
00404BE0 12 FF 15 D0 43 8A 00 8D 4C 24 18 51 8D 4C 24 40 ....C...L$.Q.L$@
00404BF0 8B F0 FF 15 CC 43 8A 00 8D 54 24 0F 52 8B 56 04 .....C...T$.R.V.
00404C00 8D 4C 24 12 51 8B 0E 52 8B 50 04 8B 00 51 52 50 .L$.Q..R.P...QRP
00404C10 E8 1B D6 FF FF 83 C4 18 83 7C 24 50 00 8D 4C 24 .........|$P..L$
00404C20 3C 75 18 C7 84 24 80 00 00 00 FF FF FF FF FF 15 <u...$..........
00404C30 38 43 8A 00 32 C0 E9 A3 01 00 00 FF 15 5C 43 8A 8C..2........\C.
00404C40 00 51 8B CC 83 E8 01 89 01 8D 4C 24 40 89 64 24 .Q........L$@.d$
00404C50 14 FF 15 C8 43 8A 00 80 38 5C 74 37 8D 4C 24 3C ....C...8\t7.L$<
00404C60 51 8D 54 24 5C 52 E8 95 E5 FF FF 83 C4 08 50 8D Q.T$\R........P.
00404C70 4C 24 40 C6 84 24 84 00 00 00 01 FF 15 58 43 8A L$@..$.......XC.
00404C80 00 8D 4C 24 58 C6 84 24 80 00 00 00 00 FF 15 38 ..L$X..$.......8
00404C90 43 8A 00 8D 44 24 18 50 8D 4C 24 40 C6 44 24 12 C...D$.P.L$@.D$.
00404CA0 5C 88 5C 24 13 FF 15 D0 43 8A 00 8D 4C 24 10 51 \.\$....C...L$.Q
00404CB0 8D 4C 24 40 8B F0 FF 15 CC 43 8A 00 8D 54 24 0E .L$@.....C...T$.
00404CC0 52 8B 56 04 8D 4C 24 13 51 8B 0E 52 8B 50 04 8B R.V..L$.Q..R.P..
00404CD0 00 51 52 50 E8 57 D5 FF FF 83 C4 18 8D 4C 24 3C .QRP.W.......L$<
00404CE0 33 F6 FF 15 5C 43 8A 00 83 F8 01 BB 02 00 00 00 3...\C..........
00404CF0 76 1E 51 8B C4 8D 4C 24 40 89 64 24 14 C7 00 01 v.Q...L$@.d$....
00404D00 00 00 00 FF 15 C8 43 8A 00 80 38 3A 75 02 8B F3 ......C...8:u...
00404D10 83 C6 01 56 6A 5C 8D 4C 24 44 FF 15 04 44 8A 00 ...Vj\.L$D...D..
00404D20 8D 4C 24 3C 8B F0 FF 15 44 43 8A 00 3B F0 0F 87 .L$<....DC..;...
00404D30 93 00 00 00 56 6A 00 8D 4C 24 60 51 8D 4C 24 48 ....Vj..L$`Q.L$H
00404D40 FF 15 40 43 8A 00 8D 4C 24 58 88 9C 24 80 00 00 ..@C...L$X..$...
00404D50 00 FF 15 54 43 8A 00 50 8D 4C 24 24 FF 15 34 43 ...TC..P.L$$..4C
00404D60 8A 00 C6 84 24 80 00 00 00 03 E8 51 FB FF FF 8B ....$......Q....
00404D70 10 8B 4A 08 8B 01 8B 40 14 8D 54 24 20 52 FF D0 ..J....@..T$ R..
00404D80 8D 4C 24 20 88 9C 24 80 00 00 00 FF 15 38 43 8A .L$ ..$......8C.
00404D90 00 8D 4C 24 58 C6 84 24 80 00 00 00 00 FF 15 38 ..L$X..$.......8
00404DA0 43 8A 00 83 C6 01 56 6A 5C 8D 4C 24 44 FF 15 04 C.....Vj\.L$D...
00404DB0 44 8A 00 8D 4C 24 3C 8B F0 FF 15 44 43 8A 00 3B D...L$<....DC..;
00404DC0 F0 0F 86 6D FF FF FF 8D 4C 24 3C C7 84 24 80 00 ...m....L$<..$..
00404DD0 00 00 FF FF FF FF FF 15 38 43 8A 00 B0 01 8B 4C ........8C.....L
00404DE0 24 78 64 89 0D 00 00 00 00 59 5E 5B 8B 4C 24 68 $xd......Y^[.L$h
00404DF0 33 CC E8 97 FD 28 00 83 C4 78 C3 CC CC CC CC CC 3....(...x......
00404E00 6A FF 68 52 B8 82 00 64 A1 00 00 00 00 50 83 EC j.hR...d.....P..
00404E10 40 A1 88 41 A1 00 33 C4 89 44 24 3C 56 57 A1 88 @..A..3..D$<VW..
00404E20 41 A1 00 33 C4 50 8D 44 24 4C 64 A3 00 00 00 00 A..3.P.D$Ld.....
00404E30 8B 74 24 5C 68 8F 69 8A 00 8D 4C 24 14 FF 15 34 .t$\h.i...L$...4
00404E40 43 8A 00 8D 44 24 10 50 8D 4C 24 30 56 51 C7 44 C...D$.P.L$0VQ.D
00404E50 24 60 00 00 00 00 E8 15 E7 FF FF 83 C4 0C 8D 4C $`.............L
00404E60 24 10 C6 44 24 54 02 FF 15 38 43 8A 00 E8 4E FA $..D$T...8C...N.
00404E70 FF FF 8B 38 8B 47 18 85 C0 8D 4F 14 74 20 8B 71 ...8.G....O.t .q
00404E80 08 2B F0 B8 93 24 49 92 F7 EE 8B 44 24 60 03 D6 .+...$I....D$`..
00404E90 C1 FA 04 8B F2 C1 EE 1F 03 F2 3B C6 72 1F 8B 41 ..........;.r..A
00404EA0 04 85 C0 74 18 8B 71 08 2B F0 B8 93 24 49 92 F7 ...t..q.+...$I..
00404EB0 EE 03 D6 C1 FA 04 8B C2 C1 E8 1F 03 C2 8B 57 18 ..............W.
00404EC0 8D 34 C5 00 00 00 00 2B F0 8D 04 B2 8D 54 24 2C .4.....+.....T$,
00404ED0 52 50 8D 44 24 14 50 E8 C4 ED FF FF 8D 4C 24 2C RP.D$.P......L$,
00404EE0 FF 15 54 43 8A 00 50 68 60 6D 8A 00 E8 8F BD 11 ..TC..Ph`m......
00404EF0 00 83 C4 08 E8 C7 F9 FF FF 8B 08 83 79 08 00 74 ............y..t
00404F00 0C E8 BA F9 FF FF 8B 08 E8 93 D4 FF FF 8D 4C 24 ..............L$
00404F10 2C C7 44 24 54 FF FF FF FF FF 15 38 43 8A 00 8B ,.D$T......8C...
00404F20 4C 24 4C 64 89 0D 00 00 00 00 59 5F 5E 8B 4C 24 L$Ld......Y_^.L$
00404F30 3C 33 CC E8 56 FC 28 00 83 C4 4C C3 CC CC CC CC <3..V.(...L.....
00404F40 6A FF 68 89 B8 82 00 64 A1 00 00 00 00 50 83 EC j.h....d.....P..
00404F50 40 A1 88 41 A1 00 33 C4 89 44 24 3C 56 57 A1 88 @..A..3..D$<VW..
00404F60 41 A1 00 33 C4 50 8D 44 24 4C 64 A3 00 00 00 00 A..3.P.D$Ld.....
00404F70 8B 44 24 5C 50 8D 4C 24 30 FF 15 3C 43 8A 00 C7 .D$\P.L$0..<C...
00404F80 44 24 54 00 00 00 00 E8 34 F9 FF FF 8B 00 8B 48 D$T.....4......H
00404F90 08 8B 11 8B 52 04 8D 44 24 0C 50 8D 44 24 30 50 ....R..D$.P.D$0P
00404FA0 FF D2 83 F8 02 C7 44 24 54 FF FF FF FF 8D 4C 24 ......D$T.....L$
00404FB0 2C 75 14 8B 74 24 1C 8B 7C 24 20 FF 15 38 43 8A ,u..t$..|$ ..8C.
00404FC0 00 8B C6 8B D7 EB 0A FF 15 38 43 8A 00 33 C0 33 .........8C..3.3
00404FD0 D2 8B 4C 24 4C 64 89 0D 00 00 00 00 59 5F 5E 8B ..L$Ld......Y_^.
00404FE0 4C 24 3C 33 CC E8 A4 FB 28 00 83 C4 4C C3 CC CC L$<3....(...L...

;; fn00404FF0: 00404FF0
;;   Called from:
;;     00405436 (in fn00405370)
fn00404FF0 proc
	push	0FFh
	push	82B94Fh
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,0A0h
	mov	eax,[0A14188h]
	xor	eax,esp
	mov	[esp+9Ch],eax
	push	ebx
	push	ebp
	push	esi
	push	edi
	mov	eax,[0A14188h]
	xor	eax,esp
	push	eax
	lea	eax,[esp+0B4h]
	mov	fs:[0000h],eax
	mov	edi,[esp+0C4h]
	mov	esi,[esp+0C8h]
	xor	ebx,ebx
	mov	ecx,edi
	mov	[esp+0BCh],ebx
	mov	[esp+20h],edi
	mov	[esp+14h],esi
	mov	[esp+1Ch],ebx
	call	dword ptr [8A43B0h]
	mov	[esp+0BCh],ebx
	push	3Ah
	mov	ecx,esi
	mov	dword ptr [esp+20h],1h
	xor	bl,bl
	call	dword ptr [8A4354h]
	push	eax
	call	dword ptr [8A46B0h]
	add	esp,8h
	test	eax,eax
	jnz	40535Fh

l00405083:
	mov	ecx,esi
	call	dword ptr [8A4354h]
	cmp	byte ptr [eax],5Ch
	jz	40535Fh

l00405094:
	mov	ecx,esi
	call	dword ptr [8A4354h]
	cmp	byte ptr [eax],2Fh
	jz	40535Fh

l004050A5:
	push	esi
	call	401880h
	add	esp,4h
	test	al,al
	jz	40535Fh

l004050B6:
	call	4048C0h
	mov	eax,[eax]
	mov	esi,[eax+18h]
	add	eax,14h
	call	4048C0h
	mov	eax,[eax]
	mov	ebp,[8A4350h]
	add	eax,14h
	mov	eax,[eax+8h]
	mov	[esp+18h],eax

l004050DA:
	cmp	esi,[esp+18h]
	jz	405158h

l004050E0:
	lea	ecx,[esp+78h]
	push	esi
	push	ecx
	call	402D20h
	mov	edx,[esp+1Ch]
	push	edx
	push	eax
	lea	eax,[esp+0A4h]
	push	eax
	mov	dword ptr [esp+0D0h],1h
	call	ebp
	add	esp,14h
	push	eax
	mov	ecx,edi
	mov	byte ptr [esp+0C0h],2h
	call	dword ptr [8A4358h]
	lea	ecx,[esp+94h]
	mov	byte ptr [esp+0BCh],1h
	call	dword ptr [8A4338h]
	lea	ecx,[esp+78h]
	mov	byte ptr [esp+0BCh],0h
	call	dword ptr [8A4338h]
	push	edi
	call	404A20h
	mov	bl,al
	add	esp,4h
	add	esi,1Ch
	test	bl,bl
	jz	4050DAh

l00405153:
	jmp	405335h

l00405158:
	test	bl,bl
	jnz	405335h

l00405160:
	mov	ecx,[esp+14h]
	push	ecx
	lea	edx,[esp+98h]
	push	edx
	call	403200h
	add	esp,8h
	mov	dword ptr [esp+0BCh],3h
	call	4048C0h
	mov	eax,[eax]
	mov	esi,[eax+18h]
	add	eax,14h
	cmp	esi,[esp+18h]
	jz	405299h

l00405197:
	lea	eax,[esp+40h]
	push	esi
	push	eax
	call	402D20h
	add	esp,8h
	push	eax
	lea	ecx,[esp+7Ch]
	mov	byte ptr [esp+0C0h],4h
	call	dword ptr [8A433Ch]
	lea	ecx,[esp+40h]
	mov	byte ptr [esp+0BCh],6h
	call	dword ptr [8A4338h]
	lea	ecx,[esp+94h]
	push	ecx
	lea	edx,[esp+7Ch]
	push	edx
	lea	eax,[esp+2Ch]
	push	eax
	call	ebp
	push	2Eh
	push	eax
	lea	ecx,[esp+70h]
	push	ecx
	mov	byte ptr [esp+0D4h],7h
	call	dword ptr [8A4408h]
	push	eax
	mov	byte ptr [esp+0D8h],8h
	call	404990h
	add	esp,1Ch
	lea	ecx,[esp+5Ch]
	mov	bl,al
	mov	byte ptr [esp+0BCh],7h
	call	dword ptr [8A4338h]
	lea	ecx,[esp+24h]
	mov	byte ptr [esp+0BCh],6h
	call	dword ptr [8A4338h]
	test	bl,bl
	jnz	405250h

l0040522F:
	lea	ecx,[esp+78h]
	mov	byte ptr [esp+0BCh],3h
	call	dword ptr [8A4338h]
	add	esi,1Ch
	cmp	esi,[esp+18h]
	jnz	405197h

l0040524E:
	jmp	405299h

l00405250:
	mov	edx,[esp+14h]
	push	edx
	lea	eax,[esp+7Ch]
	push	eax
	lea	ecx,[esp+2Ch]
	push	ecx
	call	ebp
	add	esp,0Ch
	push	eax
	mov	ecx,edi
	mov	byte ptr [esp+0C0h],9h
	call	dword ptr [8A4358h]
	lea	ecx,[esp+24h]
	mov	byte ptr [esp+0BCh],6h
	call	dword ptr [8A4338h]
	lea	ecx,[esp+78h]
	mov	byte ptr [esp+0BCh],3h
	call	dword ptr [8A4338h]

l00405299:
	lea	ecx,[esp+94h]
	mov	byte ptr [esp+0BCh],0h
	call	dword ptr [8A4338h]
	test	bl,bl
	jnz	405335h

l004052B6:
	lea	edx,[esp+40h]
	push	edx
	call	404AB0h
	push	eax
	lea	eax,[esp+64h]
	push	eax
	mov	dword ptr [esp+0C8h],0Ah
	call	402D20h
	mov	ecx,[esp+20h]
	push	ecx
	push	eax
	lea	edx,[esp+38h]
	mov	bl,0Bh
	push	edx
	mov	[esp+0D4h],bl
	call	ebp
	add	esp,18h
	push	eax
	mov	ecx,edi
	mov	byte ptr [esp+0C0h],0Ch
	call	dword ptr [8A4358h]
	lea	ecx,[esp+24h]
	mov	[esp+0BCh],bl
	call	dword ptr [8A4338h]
	lea	ecx,[esp+5Ch]
	mov	byte ptr [esp+0BCh],0Ah
	call	dword ptr [8A4338h]
	lea	ecx,[esp+40h]
	mov	byte ptr [esp+0BCh],0h
	call	dword ptr [8A4338h]

l00405335:
	mov	eax,edi
	mov	ecx,[esp+0B4h]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebp
	pop	ebx
	mov	ecx,[esp+9Ch]
	xor	ecx,esp
	call	694B8Eh
	add	esp,0ACh
	ret

l0040535F:
	push	esi
	mov	ecx,edi
	call	dword ptr [8A4358h]
	jmp	405335h
0040536A                               CC CC CC CC CC CC           ......

;; fn00405370: 00405370
;;   Called from:
;;     006572F1 (in fn00657290)
fn00405370 proc
	push	0FFh
	push	82B9B5h
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,58h
	mov	eax,[0A14188h]
	xor	eax,esp
	mov	[esp+54h],eax
	push	ebx
	push	esi
	push	edi
	mov	eax,[0A14188h]
	xor	eax,esp
	push	eax
	lea	eax,[esp+68h]
	mov	fs:[0000h],eax
	mov	eax,[esp+7Ch]
	mov	esi,[esp+78h]
	push	eax
	lea	ecx,[esp+4Ch]
	mov	dword ptr [esp+74h],0h
	mov	[esp+24h],esi
	mov	dword ptr [esp+18h],0h
	call	dword ptr [8A433Ch]
	lea	eax,[esp+18h]
	mov	ebx,1h
	push	eax
	lea	ecx,[esp+4Ch]
	mov	[esp+74h],ebx
	mov	byte ptr [esp+17h],2Fh
	mov	byte ptr [esp+16h],5Ch
	call	dword ptr [8A43D0h]
	lea	ecx,[esp+40h]
	push	ecx
	lea	ecx,[esp+4Ch]
	mov	edi,eax
	call	dword ptr [8A43CCh]
	lea	edx,[esp+13h]
	push	edx
	mov	edx,[edi+4h]
	lea	ecx,[esp+16h]
	push	ecx
	mov	ecx,[edi]
	push	edx
	mov	edx,[eax+4h]
	mov	eax,[eax]
	push	ecx
	push	edx
	push	eax
	call	402230h
	add	esp,18h
	lea	ecx,[esp+48h]
	push	ecx
	mov	ecx,esi
	call	dword ptr [8A433Ch]
	lea	edx,[esp+48h]
	push	edx
	lea	eax,[esp+28h]
	push	eax
	mov	[esp+1Ch],ebx
	call	404FF0h
	add	esp,8h
	push	eax
	mov	ecx,esi
	mov	byte ptr [esp+74h],2h
	call	dword ptr [8A4358h]
	lea	ecx,[esp+24h]
	mov	[esp+70h],bl
	call	dword ptr [8A4338h]
	push	3Ah
	mov	ecx,esi
	call	dword ptr [8A4354h]
	push	eax
	call	dword ptr [8A46B0h]
	add	esp,8h
	test	eax,eax
	jnz	4054D6h

l00405472:
	push	ecx
	mov	eax,esp
	mov	ecx,esi
	mov	[esp+1Ch],esp
	mov	dword ptr [eax],0h
	call	dword ptr [8A43C8h]
	cmp	byte ptr [eax],2Fh
	jz	4054A6h

l0040548C:
	push	ecx
	mov	eax,esp
	mov	ecx,esi
	mov	[esp+1Ch],esp
	mov	dword ptr [eax],0h
	call	dword ptr [8A43C8h]
	cmp	byte ptr [eax],5Ch
	jnz	4054D6h

l004054A6:
	push	esi
	lea	ecx,[esp+28h]
	push	0A53EF4h
	push	ecx
	call	dword ptr [8A4350h]
	add	esp,0Ch
	push	eax
	mov	ecx,esi
	mov	byte ptr [esp+74h],3h
	call	dword ptr [8A4358h]
	lea	ecx,[esp+24h]
	mov	[esp+70h],bl
	call	dword ptr [8A4338h]

l004054D6:
	lea	ecx,[esp+48h]
	mov	byte ptr [esp+70h],0h
	call	dword ptr [8A4338h]
	mov	eax,esi
	mov	ecx,[esp+68h]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebx
	mov	ecx,[esp+54h]
	xor	ecx,esp
	call	694B8Eh
	add	esp,64h
	ret
00405505                CC CC CC CC CC CC CC CC CC CC CC      ...........
00405510 83 EC 08 8B 44 24 0C 53 55 56 57 50 32 DB E8 1D ....D$.SUVWP2...
00405520 FA FF FF 8B 4C 24 24 51 8B F0 8B FA E8 0F FA FF ....L$$Q........
00405530 FF 8B EA 8B D6 83 C4 08 0B D7 89 44 24 10 74 3B ...........D$.t;
00405540 0B C5 74 37 8B 44 24 24 6A 00 99 68 80 96 98 00 ..t7.D$$j..h....
00405550 52 50 E8 89 FA 28 00 03 C6 13 D7 3B D5 77 12 72 RP...(.....;.w.r
00405560 06 3B 44 24 10 73 0A 5F 5E 5D B0 01 5B 83 C4 08 .;D$.s._^]..[...
00405570 C3 5F 5E 5D 32 C0 5B 83 C4 08 C3 5F 5E 5D 8A C3 ._^]2.[...._^]..
00405580 5B 83 C4 08 C3 CC CC CC CC CC CC CC CC CC CC CC [...............
00405590 56 6A 00 6A 00 6A 00 8B F1 FF 15 FC 40 8A 00 89 Vj.j.j......@...
004055A0 06 C6 46 04 00 8B C6 5E C3 CC CC CC CC CC CC CC ..F....^........
004055B0 8B 01 50 FF 15 F8 40 8A 00 C3 CC CC CC CC CC CC ..P...@.........
004055C0 8B 01 C6 40 04 00 8B 00 50 FF 15 F0 40 8A 00 C3 ...@....P...@...

;; fn004055D0: 004055D0
;;   Called from:
;;     0040BAEA (in fn0040BA10)
;;     0040BB5C (in fn0040BA10)
;;     0040C8CA (in fn0040C7F0)
;;     0040C93C (in fn0040C7F0)
fn004055D0 proc
	mov	eax,[esp+8h]
	mov	ecx,[esp+4h]
	push	eax
	push	ecx
	call	dword ptr [8A440Ch]
	add	esp,8h
	ret	8h
004055E6                   CC CC CC CC CC CC CC CC CC CC       ..........
004055F0 56 8B F1 8D 4E 0C C7 06 24 00 99 00 FF 15 38 43 V...N...$.....8C
00405600 8A 00 8B CE 5E FF 25 A4 46 8A 00 CC CC CC CC CC ....^.%.F.......

;; fn00405610: 00405610
;;   Called from:
;;     00405D48 (in fn00405CE0)
fn00405610 proc
	push	ebp
	mov	ebp,esp
	push	ecx
	mov	[ebp-4h],ecx

l00405617:
	mov	eax,[ecx+4h]
	test	eax,eax
	jz	405628h

l0040561E:
	mov	edx,eax
	inc	edx
	lock
	cmpxchg	[ecx+4h],edx
	jnz	405617h

l00405628:
	mov	esp,ebp
	pop	ebp
	ret
0040562C                                     CC CC CC CC             ....
00405630 6A FF 68 02 BA 82 00 64 A1 00 00 00 00 50 83 EC j.h....d.....P..
00405640 08 56 A1 88 41 A1 00 33 C4 50 8D 44 24 10 64 A3 .V..A..3.P.D$.d.
00405650 00 00 00 00 8B 74 24 20 89 74 24 0C C7 44 24 08 .....t$ .t$..D$.
00405660 00 00 00 00 8D 44 24 24 50 8B CE C7 44 24 1C 01 .....D$$P...D$..
00405670 00 00 00 FF 15 3C 43 8A 00 8B 4C 24 40 89 4E 1C .....<C...L$@.N.
00405680 8D 4C 24 24 C7 44 24 08 01 00 00 00 C6 44 24 18 .L$$.D$......D$.
00405690 00 FF 15 38 43 8A 00 8B C6 8B 4C 24 10 64 89 0D ...8C.....L$.d..
004056A0 00 00 00 00 59 5E 83 C4 14 C3 CC CC CC CC CC CC ....Y^..........
004056B0 6A FF 68 42 BA 82 00 64 A1 00 00 00 00 50 83 EC j.hB...d.....P..
004056C0 08 56 A1 88 41 A1 00 33 C4 50 8D 44 24 10 64 A3 .V..A..3.P.D$.d.
004056D0 00 00 00 00 8B 74 24 20 89 74 24 0C C7 44 24 08 .....t$ .t$..D$.
004056E0 00 00 00 00 8B 44 24 24 8D 4C 24 28 51 8D 4E 04 .....D$$.L$(Q.N.
004056F0 C7 44 24 1C 01 00 00 00 89 06 FF 15 3C 43 8A 00 .D$.........<C..
00405700 8D 4C 24 28 C7 44 24 08 01 00 00 00 C6 44 24 18 .L$(.D$......D$.
00405710 00 FF 15 38 43 8A 00 8B C6 8B 4C 24 10 64 89 0D ...8C.....L$.d..
00405720 00 00 00 00 59 5E 83 C4 14 C3 CC CC CC CC CC CC ....Y^..........
00405730 55 8B EC 6A FF 68 71 BA 82 00 64 A1 00 00 00 00 U..j.hq...d.....
00405740 50 83 EC 0C 53 56 57 A1 88 41 A1 00 33 C5 50 8D P...SVW..A..3.P.
00405750 45 F4 64 A3 00 00 00 00 89 65 F0 6A 30 E8 76 F8 E.d......e.j0.v.
00405760 28 00 8B F0 83 C4 04 89 75 EC C7 45 FC 00 00 00 (.......u..E....
00405770 00 89 75 E8 85 F6 C6 45 FC 01 74 30 8B 4D 0C 8B ..u....E..t0.M..
00405780 45 08 8B 55 10 8B 5D 14 89 4E 04 8D 7E 0C 53 8B E..U..]..N..~.S.
00405790 CF 89 06 89 56 08 FF 15 3C 43 8A 00 8B 43 1C 8A ....V...<C...C..
004057A0 4D 18 89 47 1C 88 4E 2C C6 46 2D 00 8B C6 8B 4D M..G..N,.F-....M
004057B0 F4 64 89 0D 00 00 00 00 59 5F 5E 5B 8B E5 5D C2 .d......Y_^[..].
004057C0 14 00 8B 55 EC 52 E8 FB F7 28 00 83 C4 04 6A 00 ...U.R...(....j.
004057D0 6A 00 E8 F5 F7 28 00 CC CC CC CC CC CC CC CC CC j....(..........
004057E0 55 8B EC 6A FF 68 A1 BA 82 00 64 A1 00 00 00 00 U..j.h....d.....
004057F0 50 83 EC 0C 53 56 57 A1 88 41 A1 00 33 C5 50 8D P...SVW..A..3.P.
00405800 45 F4 64 A3 00 00 00 00 89 65 F0 6A 30 E8 C6 F7 E.d......e.j0...
00405810 28 00 8B F0 83 C4 04 89 75 EC C7 45 FC 00 00 00 (.......u..E....
00405820 00 89 75 E8 85 F6 C6 45 FC 01 74 30 8B 45 08 8B ..u....E..t0.E..
00405830 4D 0C 8B 55 10 89 06 8B 45 14 89 4E 04 89 56 08 M..U....E..N..V.
00405840 8B 08 83 C0 04 89 4E 0C 50 8D 4E 10 FF 15 3C 43 ......N.P.N...<C
00405850 8A 00 8A 55 18 88 56 2C C6 46 2D 00 8B C6 8B 4D ...U..V,.F-....M
00405860 F4 64 89 0D 00 00 00 00 59 5F 5E 5B 8B E5 5D C2 .d......Y_^[..].
00405870 14 00 8B 45 EC 50 E8 4B F7 28 00 83 C4 04 6A 00 ...E.P.K.(....j.
00405880 6A 00 E8 45 F7 28 00 CC CC CC CC CC CC CC CC CC j..E.(..........
00405890 51 8B 51 04 8B 42 04 80 78 2D 00 57 8B 7C 24 10 Q.Q..B..x-.W.|$.
004058A0 75 18 56 8B 37 39 70 0C 73 05 8B 40 08 EB 04 8B u.V.79p.s..@....
004058B0 D0 8B 00 80 78 2D 00 74 EC 5E 8B 41 04 3B D0 89 ....x-.t.^.A.;..
004058C0 54 24 10 74 18 8B 0F 3B 4A 0C 72 11 8D 44 24 10 T$.t...;J.r..D$.
004058D0 8B 10 8B 44 24 0C 89 10 5F 59 C2 08 00 89 44 24 ...D$..._Y....D$
004058E0 04 8D 44 24 04 8B 10 8B 44 24 0C 89 10 5F 59 C2 ..D$....D$..._Y.
004058F0 08 00 CC CC CC CC CC CC CC CC CC CC CC CC CC CC ................
00405900 6A FF 68 C9 BA 82 00 64 A1 00 00 00 00 50 83 EC j.h....d.....P..
00405910 44 53 55 56 57 A1 88 41 A1 00 33 C4 50 8D 44 24 DSUVW..A..3.P.D$
00405920 58 64 A3 00 00 00 00 8B F9 81 7F 08 FE FF FF 07 Xd..............
00405930 72 3C 68 80 6D 8A 00 8D 4C 24 18 FF 15 34 43 8A r<h.m...L$...4C.
00405940 00 8D 44 24 14 50 8D 4C 24 34 C7 44 24 64 00 00 ..D$.P.L$4.D$d..
00405950 00 00 E8 89 C0 FF FF 68 68 9C 99 00 8D 4C 24 34 .......hh....L$4
00405960 51 C7 44 24 38 30 00 99 00 E8 5E F6 28 00 8B 54 Q.D$80....^.(..T
00405970 24 74 8B 47 04 8B 74 24 70 6A 00 52 50 56 50 E8 $t.G..t$pj.RPVP.
00405980 AC FD FF FF 8B E8 8B 47 04 BB 01 00 00 00 01 5F .......G......._
00405990 08 3B F0 75 10 89 68 04 8B 47 04 89 28 8B 4F 04 .;.u..h..G..(.O.
004059A0 89 69 08 EB 22 80 7C 24 6C 00 74 0D 89 2E 8B 47 .i..".|$l.t....G
004059B0 04 3B 30 75 12 89 28 EB 0E 89 6E 08 8B 47 04 3B .;0u..(...n..G.;
004059C0 70 08 75 03 89 68 08 8B 55 04 80 7A 2C 00 8D 45 p.u..h..U..z,..E
004059D0 04 8B F5 0F 85 EC 00 00 00 8D A4 24 00 00 00 00 ...........$....
004059E0 8B 08 8B 51 04 3B 0A 75 51 8B 52 08 80 7A 2C 00 ...Q.;.uQ.R..z,.
004059F0 75 19 88 59 2C 88 5A 2C 8B 10 8B 4A 04 C6 41 2C u..Y,.Z,...J..A,
00405A00 00 8B 10 8B 72 04 E9 AA 00 00 00 3B 71 08 75 0A ....r......;q.u.
00405A10 8B F1 56 8B CF E8 36 C8 0D 00 8B 46 04 88 58 2C ..V...6....F..X,
00405A20 8B 4E 04 8B 51 04 C6 42 2C 00 8B 46 04 8B 48 04 .N..Q..B,..F..H.
00405A30 51 8B CF E8 08 AD 01 00 EB 7B 8B 12 80 7A 2C 00 Q........{...z,.
00405A40 75 16 88 59 2C 88 5A 2C 8B 10 8B 4A 04 C6 41 2C u..Y,.Z,...J..A,
00405A50 00 8B 10 8B 72 04 EB 5D 3B 31 75 0A 8B F1 56 8B ....r..];1u...V.
00405A60 CF E8 DA AC 01 00 8B 46 04 88 58 2C 8B 4E 04 8B .......F..X,.N..
00405A70 51 04 C6 42 2C 00 8B 46 04 8B 40 04 8B 48 08 8B Q..B,..F..@..H..
00405A80 11 89 50 08 8B 11 80 7A 2D 00 75 03 89 42 04 8B ..P....z-.u..B..
00405A90 50 04 89 51 04 8B 57 04 3B 42 04 75 05 89 4A 04 P..Q..W.;B.u..J.
00405AA0 EB 0E 8B 50 04 3B 02 75 04 89 0A EB 03 89 4A 08 ...P.;.u......J.
00405AB0 89 01 89 48 04 8B 4E 04 80 79 2C 00 8D 46 04 0F ...H..N..y,..F..
00405AC0 84 1B FF FF FF 8B 57 04 8B 42 04 88 58 2C 8B 44 ......W..B..X,.D
00405AD0 24 68 89 28 8B 4C 24 58 64 89 0D 00 00 00 00 59 $h.(.L$Xd......Y
00405AE0 5F 5E 5D 5B 83 C4 50 C2 10 00 CC CC CC CC CC CC _^][..P.........
00405AF0 6A FF 68 F9 BA 82 00 64 A1 00 00 00 00 50 83 EC j.h....d.....P..
00405B00 44 53 55 56 57 A1 88 41 A1 00 33 C4 50 8D 44 24 DSUVW..A..3.P.D$
00405B10 58 64 A3 00 00 00 00 8B F9 81 7F 08 FE FF FF 07 Xd..............
00405B20 72 3C 68 80 6D 8A 00 8D 4C 24 18 FF 15 34 43 8A r<h.m...L$...4C.
00405B30 00 8D 44 24 14 50 8D 4C 24 34 C7 44 24 64 00 00 ..D$.P.L$4.D$d..
00405B40 00 00 E8 99 BE FF FF 68 68 9C 99 00 8D 4C 24 34 .......hh....L$4
00405B50 51 C7 44 24 38 30 00 99 00 E8 6E F4 28 00 8B 54 Q.D$80....n.(..T
00405B60 24 74 8B 47 04 8B 74 24 70 6A 00 52 50 56 50 E8 $t.G..t$pj.RPVP.
00405B70 6C FC FF FF 8B E8 8B 47 04 BB 01 00 00 00 01 5F l......G......._
00405B80 08 3B F0 75 10 89 68 04 8B 47 04 89 28 8B 4F 04 .;.u..h..G..(.O.
00405B90 89 69 08 EB 22 80 7C 24 6C 00 74 0D 89 2E 8B 47 .i..".|$l.t....G
00405BA0 04 3B 30 75 12 89 28 EB 0E 89 6E 08 8B 47 04 3B .;0u..(...n..G.;
00405BB0 70 08 75 03 89 68 08 8B 55 04 80 7A 2C 00 8D 45 p.u..h..U..z,..E
00405BC0 04 8B F5 0F 85 EC 00 00 00 8D A4 24 00 00 00 00 ...........$....
00405BD0 8B 08 8B 51 04 3B 0A 75 51 8B 52 08 80 7A 2C 00 ...Q.;.uQ.R..z,.
00405BE0 75 19 88 59 2C 88 5A 2C 8B 10 8B 4A 04 C6 41 2C u..Y,.Z,...J..A,
00405BF0 00 8B 10 8B 72 04 E9 AA 00 00 00 3B 71 08 75 0A ....r......;q.u.
00405C00 8B F1 56 8B CF E8 46 C6 0D 00 8B 46 04 88 58 2C ..V...F....F..X,
00405C10 8B 4E 04 8B 51 04 C6 42 2C 00 8B 46 04 8B 48 04 .N..Q..B,..F..H.
00405C20 51 8B CF E8 18 AB 01 00 EB 7B 8B 12 80 7A 2C 00 Q........{...z,.
00405C30 75 16 88 59 2C 88 5A 2C 8B 10 8B 4A 04 C6 41 2C u..Y,.Z,...J..A,
00405C40 00 8B 10 8B 72 04 EB 5D 3B 31 75 0A 8B F1 56 8B ....r..];1u...V.
00405C50 CF E8 EA AA 01 00 8B 46 04 88 58 2C 8B 4E 04 8B .......F..X,.N..
00405C60 51 04 C6 42 2C 00 8B 46 04 8B 40 04 8B 48 08 8B Q..B,..F..@..H..
00405C70 11 89 50 08 8B 11 80 7A 2D 00 75 03 89 42 04 8B ..P....z-.u..B..
00405C80 50 04 89 51 04 8B 57 04 3B 42 04 75 05 89 4A 04 P..Q..W.;B.u..J.
00405C90 EB 0E 8B 50 04 3B 02 75 04 89 0A EB 03 89 4A 08 ...P.;.u......J.
00405CA0 89 01 89 48 04 8B 4E 04 80 79 2C 00 8D 46 04 0F ...H..N..y,..F..
00405CB0 84 1B FF FF FF 8B 57 04 8B 42 04 88 58 2C 8B 44 ......W..B..X,.D
00405CC0 24 68 89 28 8B 4C 24 58 64 89 0D 00 00 00 00 59 $h.(.L$Xd......Y
00405CD0 5F 5E 5D 5B 83 C4 50 C2 10 00 CC CC CC CC CC CC _^][..P.........

;; fn00405CE0: 00405CE0
;;   Called from:
;;     00406D3B (in fn00406D20)
fn00405CE0 proc
	push	0FFh
	push	82BB28h
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
	xor	ebx,ebx
	mov	[esp+14h],ebx
	mov	eax,[esi+20h]
	lea	edi,[esi+20h]
	push	0FFh
	push	eax
	mov	[esp+1Ch],edi
	call	dword ptr [8A40F4h]
	mov	byte ptr [edi+4h],1h
	mov	ecx,[esp+2Ch]
	push	ecx
	lea	edx,[esp+30h]
	push	edx
	lea	ecx,[esi+8h]
	mov	[esp+28h],ebx
	call	6129E0h
	mov	eax,[esp+2Ch]
	cmp	eax,[esi+0Ch]
	jz	405D8Bh

l00405D43:
	mov	ebp,[eax+28h]
	mov	ecx,ebp
	call	405610h
	mov	esi,eax
	neg	esi
	sbb	esi,esi
	and	esi,ebp
	mov	ebp,[esp+28h]
	mov	[ebp+0h],esi
	jz	405D7Bh

l00405D5E:
	mov	ecx,esi
	call	401AD0h
	mov	ecx,esi
	call	401AE0h
	cmp	eax,1h
	jnz	405D7Bh

l00405D71:
	mov	eax,[esi]
	mov	edx,[eax]
	push	1h
	mov	ecx,esi
	call	edx

l00405D7B:
	mov	eax,[edi]
	push	eax
	mov	[edi+4h],bl
	call	dword ptr [8A40F0h]
	mov	eax,ebp
	jmp	405D9Fh

l00405D8B:
	mov	ecx,[edi]
	mov	esi,[esp+28h]
	push	ecx
	mov	[esi],ebx
	mov	[edi+4h],bl
	call	dword ptr [8A40F0h]
	mov	eax,esi

l00405D9F:
	mov	ecx,[esp+18h]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebp
	pop	ebx
	add	esp,10h
	ret	8h
00405DB5                CC CC CC CC CC CC CC CC CC CC CC      ...........
00405DC0 51 53 55 8B 6C 24 14 56 8B D9 57 8B 7B 04 8B 77 QSU.l$.V..W.{..w
00405DD0 04 80 7E 2D 00 B0 01 88 44 24 10 75 28 8D 49 00 ..~-....D$.u(.I.
00405DE0 8D 46 0C 50 55 8B FE FF 15 0C 44 8A 00 83 C4 08 .F.PU.....D.....
00405DF0 84 C0 88 44 24 10 74 04 8B 36 EB 03 8B 76 08 80 ...D$.t..6...v..
00405E00 7E 2D 00 74 DB 84 C0 8B F7 89 74 24 1C 74 38 8B ~-.t......t$.t8.
00405E10 4B 04 3B 39 75 24 55 57 6A 01 8D 54 24 28 52 8B K.;9u$UWj..T$(R.
00405E20 CB E8 DA FA FF FF 8B 08 8B 44 24 18 5F 5E 5D 89 .........D$._^].
00405E30 08 C6 40 04 01 5B 59 C2 08 00 8D 4C 24 1C E8 7D ..@..[Y....L$..}
00405E40 FA 1E 00 8B 74 24 1C 8D 56 0C 55 52 FF 15 0C 44 ....t$..V.UR...D
00405E50 8A 00 83 C4 08 84 C0 74 27 8B 44 24 10 55 57 50 .......t'.D$.UWP
00405E60 8D 4C 24 28 51 8B CB E8 94 FA FF FF 8B 10 8B 44 .L$(Q..........D
00405E70 24 18 5F 5E 5D 89 10 C6 40 04 01 5B 59 C2 08 00 $._^]...@..[Y...
00405E80 8B 44 24 18 5F 89 30 5E 5D C6 40 04 00 5B 59 C2 .D$._.0^].@..[Y.
00405E90 08 00 CC CC CC CC CC CC CC CC CC CC CC CC CC CC ................
00405EA0 6A FF 68 59 BB 82 00 64 A1 00 00 00 00 50 83 EC j.hY...d.....P..
00405EB0 48 53 55 56 57 A1 88 41 A1 00 33 C4 50 8D 44 24 HSUVW..A..3.P.D$
00405EC0 5C 64 A3 00 00 00 00 8B E9 8B 44 24 70 80 78 2D \d........D$p.x-
00405ED0 00 74 3C 68 94 6D 8A 00 8D 4C 24 1C FF 15 34 43 .t<h.m...L$...4C
00405EE0 8A 00 8D 44 24 18 50 8D 4C 24 38 C7 44 24 68 00 ...D$.P.L$8.D$h.
00405EF0 00 00 00 E8 E8 BA FF FF 68 8C A8 99 00 8D 4C 24 ........h.....L$
00405F00 38 51 C7 44 24 3C 3C 00 99 00 E8 BD F0 28 00 8B 8Q.D$<<......(..
00405F10 D8 8D 4C 24 70 89 5C 24 14 E8 A2 AF 1A 00 8B 03 ..L$p.\$........
00405F20 80 78 2D 00 74 05 8B 7B 08 EB 18 8B 53 08 80 7A .x-.t..{....S..z
00405F30 2D 00 74 04 8B F8 EB 0B 8B 4C 24 70 3B CB 8B 79 -.t......L$p;..y
00405F40 08 75 6B 80 7F 2D 00 8B 73 04 75 03 89 77 04 8B .uk..-..s.u..w..
00405F50 45 04 39 58 04 75 05 89 78 04 EB 0B 39 1E 75 04 E.9X.u..x...9.u.
00405F60 89 3E EB 03 89 7E 08 8B 5D 04 8B 03 3B 44 24 14 .>...~..]...;D$.
00405F70 75 15 80 7F 2D 00 74 04 8B C6 EB 09 57 E8 4E 0F u...-.t.....W.N.
00405F80 00 00 83 C4 04 89 03 8B 5D 04 8B 4C 24 14 39 4B ........]..L$.9K
00405F90 08 75 72 80 7F 2D 00 74 07 8B C6 89 43 08 EB 65 .ur..-.t....C..e
00405FA0 57 E8 BA 09 0E 00 83 C4 04 89 43 08 EB 57 89 48 W.........C..W.H
00405FB0 04 8B 13 89 11 3B 4B 08 75 04 8B F1 EB 1A 80 7F .....;K.u.......
00405FC0 2D 00 8B 71 04 75 03 89 77 04 89 3E 8B 43 08 89 -..q.u..w..>.C..
00405FD0 41 08 8B 53 08 89 4A 04 8B 45 04 39 58 04 75 05 A..S..J..E.9X.u.
00405FE0 89 48 04 EB 0E 8B 43 04 39 18 75 04 89 08 EB 03 .H....C.9.u.....
00405FF0 89 48 08 8B 43 04 89 41 04 8A 53 2C 8A 41 2C 88 .H..C..A..S,.A,.
00406000 51 2C 88 43 2C 8B 44 24 14 B3 01 38 58 2C 0F 85 Q,.C,.D$...8X,..
00406010 F2 00 00 00 8B 4D 04 3B 79 04 0F 84 E3 00 00 00 .....M.;y.......
00406020 38 5F 2C 0F 85 DA 00 00 00 8B 06 3B F8 75 63 8B 8_,........;.uc.
00406030 46 08 80 78 2C 00 75 12 88 58 2C 56 8B CD C6 46 F..x,.u..X,V...F
00406040 2C 00 E8 09 C2 0D 00 8B 46 08 80 78 2D 00 75 72 ,.......F..x-.ur
00406050 8B 10 38 5A 2C 75 08 8B 48 08 38 59 2C 74 5F 8B ..8Z,u..H.8Y,t_.
00406060 48 08 38 59 2C 75 12 88 5A 2C 50 8B CD C6 40 2C H.8Y,u..Z,P...@,
00406070 00 E8 CA A6 01 00 8B 46 08 8A 4E 2C 88 48 2C 88 .......F..N,.H,.
00406080 5E 2C 8B 50 08 56 8B CD 88 5A 2C E8 C0 C1 0D 00 ^,.P.V...Z,.....
00406090 EB 71 80 78 2C 00 75 11 88 58 2C 56 8B CD C6 46 .q.x,.u..X,V...F
004060A0 2C 00 E8 99 A6 01 00 8B 06 80 78 2D 00 75 13 8B ,.........x-.u..
004060B0 50 08 38 5A 2C 75 1E 8B 08 38 59 2C 75 17 C6 40 P.8Z,u...8Y,u..@
004060C0 2C 00 8B 55 04 8B FE 3B 7A 04 8B 76 04 0F 85 4D ,..U...;z..v...M
004060D0 FF FF FF EB 2E 8B 08 38 59 2C 75 11 88 5A 2C 50 .......8Y,u..Z,P
004060E0 8B CD C6 40 2C 00 E8 65 C1 0D 00 8B 06 8A 4E 2C ...@,..e......N,
004060F0 88 48 2C 88 5E 2C 8B 10 56 8B CD 88 5A 2C E8 3D .H,.^,..V...Z,.=
00406100 A6 01 00 88 5F 2C 8B 4C 24 14 83 C1 0C FF 15 38 ...._,.L$......8
00406110 43 8A 00 8B 44 24 14 50 E8 A9 EE 28 00 8B 45 08 C...D$.P...(..E.
00406120 83 C4 04 85 C0 76 06 83 C0 FF 89 45 08 8B 44 24 .....v.....E..D$
00406130 6C 8B 4C 24 70 89 08 8B 4C 24 5C 64 89 0D 00 00 l.L$p...L$\d....
00406140 00 00 59 5F 5E 5D 5B 83 C4 54 C2 08 00 CC CC CC ..Y_^][..T......
00406150 8B 44 24 04 56 50 8B F1 E8 F3 B9 FF FF C7 06 3C .D$.VP.........<
00406160 00 99 00 8B C6 5E C2 04 00 CC CC CC CC CC CC CC .....^..........
00406170 51 55 8B 6C 24 10 56 57 8B F9 8B 77 04 8B 46 04 QU.l$.VW...w..F.
00406180 80 78 2D 00 B1 01 88 4C 24 0C 75 21 8B 55 00 90 .x-....L$.u!.U..
00406190 3B 50 0C 8B F0 0F 92 C1 84 C9 88 4C 24 0C 74 04 ;P.........L$.t.
004061A0 8B 00 EB 03 8B 40 08 80 78 2D 00 74 E3 84 C9 8B .....@..x-.t....
004061B0 D6 89 54 24 18 74 33 8B 47 04 3B 30 8D 4C 24 18 ..T$.t3.G.;0.L$.
004061C0 75 1F 55 56 6A 01 51 8B CF E8 22 F9 FF FF 8B 10 u.UVj.Q...".....
004061D0 8B 44 24 14 5F 5E C6 40 04 01 89 10 5D 59 C2 08 .D$._^.@....]Y..
004061E0 00 E8 DA F6 1E 00 8B 54 24 18 8B 42 0C 3B 45 00 .......T$..B.;E.
004061F0 73 26 8B 4C 24 0C 55 56 51 8D 54 24 24 52 8B CF s&.L$.UVQ.T$$R..
00406200 E8 EB F8 FF FF 8B 08 8B 44 24 14 5F 5E 89 08 C6 ........D$._^...
00406210 40 04 01 5D 59 C2 08 00 8B 44 24 14 5F 5E C6 40 @..]Y....D$._^.@
00406220 04 00 89 10 5D 59 C2 08 00 CC CC CC CC CC CC CC ....]Y..........
00406230 6A FF 68 89 BB 82 00 64 A1 00 00 00 00 50 83 EC j.h....d.....P..
00406240 48 53 55 56 57 A1 88 41 A1 00 33 C4 50 8D 44 24 HSUVW..A..3.P.D$
00406250 5C 64 A3 00 00 00 00 8B E9 8B 44 24 70 80 78 2D \d........D$p.x-
00406260 00 74 3C 68 94 6D 8A 00 8D 4C 24 1C FF 15 34 43 .t<h.m...L$...4C
00406270 8A 00 8D 44 24 18 50 8D 4C 24 38 C7 44 24 68 00 ...D$.P.L$8.D$h.
00406280 00 00 00 E8 58 B7 FF FF 68 8C A8 99 00 8D 4C 24 ....X...h.....L$
00406290 38 51 C7 44 24 3C 3C 00 99 00 E8 2D ED 28 00 8B 8Q.D$<<....-.(..
004062A0 D8 8D 4C 24 70 89 5C 24 14 E8 12 AC 1A 00 8B 03 ..L$p.\$........
004062B0 80 78 2D 00 74 05 8B 7B 08 EB 18 8B 53 08 80 7A .x-.t..{....S..z
004062C0 2D 00 74 04 8B F8 EB 0B 8B 4C 24 70 3B CB 8B 79 -.t......L$p;..y
004062D0 08 75 6B 80 7F 2D 00 8B 73 04 75 03 89 77 04 8B .uk..-..s.u..w..
004062E0 45 04 39 58 04 75 05 89 78 04 EB 0B 39 1E 75 04 E.9X.u..x...9.u.
004062F0 89 3E EB 03 89 7E 08 8B 5D 04 8B 03 3B 44 24 14 .>...~..]...;D$.
00406300 75 15 80 7F 2D 00 74 04 8B C6 EB 09 57 E8 BE 0B u...-.t.....W...
00406310 00 00 83 C4 04 89 03 8B 5D 04 8B 4C 24 14 39 4B ........]..L$.9K
00406320 08 75 72 80 7F 2D 00 74 07 8B C6 89 43 08 EB 65 .ur..-.t....C..e
00406330 57 E8 2A 06 0E 00 83 C4 04 89 43 08 EB 57 89 48 W.*.......C..W.H
00406340 04 8B 13 89 11 3B 4B 08 75 04 8B F1 EB 1A 80 7F .....;K.u.......
00406350 2D 00 8B 71 04 75 03 89 77 04 89 3E 8B 43 08 89 -..q.u..w..>.C..
00406360 41 08 8B 53 08 89 4A 04 8B 45 04 39 58 04 75 05 A..S..J..E.9X.u.
00406370 89 48 04 EB 0E 8B 43 04 39 18 75 04 89 08 EB 03 .H....C.9.u.....
00406380 89 48 08 8B 43 04 89 41 04 8A 53 2C 8A 41 2C 88 .H..C..A..S,.A,.
00406390 51 2C 88 43 2C 8B 44 24 14 B3 01 38 58 2C 0F 85 Q,.C,.D$...8X,..
004063A0 F2 00 00 00 8B 4D 04 3B 79 04 0F 84 E3 00 00 00 .....M.;y.......
004063B0 38 5F 2C 0F 85 DA 00 00 00 8B 06 3B F8 75 63 8B 8_,........;.uc.
004063C0 46 08 80 78 2C 00 75 12 88 58 2C 56 8B CD C6 46 F..x,.u..X,V...F
004063D0 2C 00 E8 79 BE 0D 00 8B 46 08 80 78 2D 00 75 72 ,..y....F..x-.ur
004063E0 8B 10 38 5A 2C 75 08 8B 48 08 38 59 2C 74 5F 8B ..8Z,u..H.8Y,t_.
004063F0 48 08 38 59 2C 75 12 88 5A 2C 50 8B CD C6 40 2C H.8Y,u..Z,P...@,
00406400 00 E8 3A A3 01 00 8B 46 08 8A 4E 2C 88 48 2C 88 ..:....F..N,.H,.
00406410 5E 2C 8B 50 08 56 8B CD 88 5A 2C E8 30 BE 0D 00 ^,.P.V...Z,.0...
00406420 EB 71 80 78 2C 00 75 11 88 58 2C 56 8B CD C6 46 .q.x,.u..X,V...F
00406430 2C 00 E8 09 A3 01 00 8B 06 80 78 2D 00 75 13 8B ,.........x-.u..
00406440 50 08 38 5A 2C 75 1E 8B 08 38 59 2C 75 17 C6 40 P.8Z,u...8Y,u..@
00406450 2C 00 8B 55 04 8B FE 3B 7A 04 8B 76 04 0F 85 4D ,..U...;z..v...M
00406460 FF FF FF EB 2E 8B 08 38 59 2C 75 11 88 5A 2C 50 .......8Y,u..Z,P
00406470 8B CD C6 40 2C 00 E8 D5 BD 0D 00 8B 06 8A 4E 2C ...@,.........N,
00406480 88 48 2C 88 5E 2C 8B 10 56 8B CD 88 5A 2C E8 AD .H,.^,..V...Z,..
00406490 A2 01 00 88 5F 2C 8B 4C 24 14 83 C1 10 FF 15 38 ...._,.L$......8
004064A0 43 8A 00 8B 44 24 14 50 E8 19 EB 28 00 8B 45 08 C...D$.P...(..E.
004064B0 83 C4 04 85 C0 76 06 83 C0 FF 89 45 08 8B 44 24 .....v.....E..D$
004064C0 6C 8B 4C 24 70 89 08 8B 4C 24 5C 64 89 0D 00 00 l.L$p...L$\d....
004064D0 00 00 59 5F 5E 5D 5B 83 C4 54 C2 08 00 CC CC CC ..Y_^][..T......

;; fn004064E0: 004064E0
;;   Called from:
;;     004064F7 (in fn004064E0)
;;     00428A4C (in fn00428A30)
fn004064E0 proc
	push	ebx
	push	esi
	push	edi
	mov	edi,[esp+10h]
	cmp	byte ptr [edi+2Dh],0h
	mov	ebx,ecx
	mov	esi,edi
	jnz	406518h

l004064F1:
	mov	eax,[esi+8h]
	push	eax
	mov	ecx,ebx
	call	4064E0h
	mov	esi,[esi]
	lea	ecx,[edi+10h]
	call	dword ptr [8A4338h]
	push	edi
	call	694FC6h
	add	esp,4h
	cmp	byte ptr [esi+2Dh],0h
	mov	edi,esi
	jz	4064F1h

l00406518:
	pop	edi
	pop	esi
	pop	ebx
	ret	4h
0040651E                                           CC CC               ..
00406520 6A FF 68 01 BC 82 00 64 A1 00 00 00 00 50 83 EC j.h....d.....P..
00406530 58 53 55 56 57 A1 88 41 A1 00 33 C4 50 8D 44 24 XSUVW..A..3.P.D$
00406540 6C 64 A3 00 00 00 00 8B F9 C7 44 24 18 00 00 00 ld........D$....
00406550 00 8B 47 20 8D 6F 20 6A FF 50 C7 44 24 7C 01 00 ..G .o j.P.D$|..
00406560 00 00 89 6C 24 28 FF 15 F4 40 8A 00 C6 45 04 01 ...l$(...@...E..
00406570 8B 8C 24 80 00 00 00 51 8D 54 24 18 8D 5F 08 52 ..$....Q.T$.._.R
00406580 8B CB C6 44 24 7C 02 E8 54 C4 20 00 8B 47 0C 8B ...D$|..T. ..G..
00406590 4C 24 14 3B C8 0F 84 C3 00 00 00 8B 49 28 89 4C L$.;........I(.L
004065A0 24 1C E8 69 F0 FF FF 8B F0 F7 DE 1B F6 23 74 24 $..i.........#t$
004065B0 1C 89 74 24 24 C6 44 24 74 03 74 68 8B 8C 24 80 ..t$$.D$t.th..$.
004065C0 00 00 00 FF 15 54 43 8A 00 50 68 B0 6D 8A 00 E8 .....TC..Ph.m...
004065D0 AC A6 11 00 8B BC 24 84 00 00 00 83 C4 08 8B CE ......$.........
004065E0 89 37 E8 E9 B4 FF FF 8B CE C7 44 24 18 01 00 00 .7........D$....
004065F0 00 C6 44 24 74 02 E8 E5 B4 FF FF 83 F8 01 75 0A ..D$t.........u.
00406600 8B 06 8B 10 6A 01 8B CE FF D2 8B 45 00 50 C6 45 ....j......E.P.E
00406610 04 00 FF 15 F0 40 8A 00 8B B4 24 84 00 00 00 E9 .....@....$.....
00406620 50 01 00 00 8B 6C 24 14 8D 4D 28 51 8D 54 24 20 P....l$..M(Q.T$ 
00406630 8D 77 14 52 8B CE E8 55 F2 FF FF 8B 44 24 1C 50 .w.R...U....D$.P
00406640 8D 4C 24 20 51 8B CE E8 E4 FB FF FF 55 8D 54 24 .L$ Q.......U.T$
00406650 20 52 8B CB E8 47 F8 FF FF C6 44 24 74 02 8B B4  R...G....D$t...
00406660 24 84 00 00 00 8B 84 24 80 00 00 00 56 83 EC 1C $......$....V...
00406670 8B CC 89 64 24 44 50 FF 15 3C 43 8A 00 8D 4C 24 ...d$DP..<C...L$
00406680 6C 51 E8 A9 EF FF FF 83 C4 24 8B E8 55 8D 4C 24 lQ.......$..U.L$
00406690 30 C6 44 24 78 04 FF 15 3C 43 8A 00 8B 55 1C 89 0.D$x...<C...U..
004066A0 54 24 48 8D 44 24 2C 50 8D 4C 24 28 51 8B CB C6 T$H.D$,P.L$(Q...
004066B0 44 24 7C 05 E8 07 F7 FF FF 8D 4C 24 2C C6 44 24 D$|.......L$,.D$
004066C0 74 04 FF 15 38 43 8A 00 8D 4C 24 4C C6 44 24 74 t...8C...L$L.D$t
004066D0 02 FF 15 38 43 8A 00 8B 94 24 80 00 00 00 83 EC ...8C....$......
004066E0 1C 8B CC 89 64 24 40 52 FF 15 3C 43 8A 00 8D 44 ....d$@R..<C...D
004066F0 24 68 56 50 E8 B7 EF FF FF 83 C4 24 8B 08 83 C0 $hVP.......$....
00406700 04 89 4C 24 2C B3 06 50 8D 4C 24 34 88 5C 24 78 ..L$,..P.L$4.\$x
00406710 FF 15 3C 43 8A 00 8D 54 24 2C 52 8D 44 24 28 50 ..<C...T$,R.D$(P
00406720 8D 4F 14 C6 44 24 7C 07 E8 43 FA FF FF 8D 4C 24 .O..D$|..C....L$
00406730 30 88 5C 24 74 FF 15 38 43 8A 00 8D 4C 24 50 C6 0.\$t..8C...L$P.
00406740 44 24 74 02 FF 15 38 43 8A 00 85 F6 8B 7C 24 7C D$t...8C.....|$|
00406750 89 37 74 07 8B CE E8 75 B3 FF FF 8B 44 24 20 8B .7t....u....D$ .
00406760 08 51 C7 44 24 1C 01 00 00 00 C6 40 04 00 FF 15 .Q.D$......@....
00406770 F0 40 8A 00 85 F6 C6 44 24 74 00 74 15 8B CE E8 .@.....D$t.t....
00406780 5C B3 FF FF 83 F8 01 75 09 8B 16 50 8B 02 8B CE \......u...P....
00406790 FF D0 8B C7 8B 4C 24 6C 64 89 0D 00 00 00 00 59 .....L$ld......Y
004067A0 5F 5E 5D 5B 83 C4 64 C2 0C 00 CC CC CC CC CC CC _^][..d.........
004067B0 6A FF 68 28 BC 82 00 64 A1 00 00 00 00 50 83 EC j.h(...d.....P..
004067C0 08 53 55 56 57 A1 88 41 A1 00 33 C4 50 8D 44 24 .SUVW..A..3.P.D$
004067D0 1C 64 A3 00 00 00 00 8B F1 8B 46 20 8D 7E 20 6A .d........F .~ j
004067E0 FF 50 89 7C 24 20 FF 15 F4 40 8A 00 C6 47 04 01 .P.|$ ...@...G..
004067F0 8D 4C 24 2C 51 8D 54 24 18 8D 6E 14 52 8B CD C7 .L$,Q.T$..n.R...
00406800 44 24 2C 00 00 00 00 E8 84 F0 FF FF 8B 5C 24 14 D$,..........\$.
00406810 3B 5E 18 74 31 8D 43 10 50 8D 4C 24 30 83 C6 08 ;^.t1.C.P.L$0...
00406820 51 8B CE E8 B8 C1 20 00 8B 54 24 2C 52 8D 44 24 Q..... ..T$,R.D$
00406830 30 50 8B CE E8 67 F6 FF FF 53 8D 4C 24 30 51 8B 0P...g...S.L$0Q.
00406840 CD E8 EA F9 FF FF 8B 17 52 C6 47 04 00 FF 15 F0 ........R.G.....
00406850 40 8A 00 8B 4C 24 1C 64 89 0D 00 00 00 00 59 5F @...L$.d......Y_
00406860 5E 5D 5B 83 C4 14 C2 04 00 CC CC CC CC CC CC CC ^][.............
00406870 53 8B 5C 24 10 56 8B 74 24 10 57 8B F9 8B 47 04 S.\$.V.t$.W...G.
00406880 3B 30 75 36 3B D8 75 32 8B 40 04 50 E8 6F 2D 22 ;0u6;.u2.@.P.o-"
00406890 00 8B 47 04 89 40 04 8B 47 04 C7 47 08 00 00 00 ..G..@..G..G....
004068A0 00 89 00 8B 47 04 89 40 08 8B 4F 04 8B 11 8B 44 ....G..@..O....D
004068B0 24 10 5F 5E 89 10 5B C2 0C 00 3B F3 74 5A 8B FF $._^..[...;.tZ..
004068C0 80 7E 2D 00 8B CE 75 3F 8B 46 08 80 78 2D 00 75 .~-...u?.F..x-.u
004068D0 1B 8B F0 8B 06 80 78 2D 00 75 2C EB 03 8D 49 00 ......x-.u,...I.
004068E0 8B F0 8B 06 80 78 2D 00 74 F6 EB 1B 8B 46 04 80 .....x-.t....F..
004068F0 78 2D 00 75 10 3B 70 08 75 0B 8B F0 8B 40 04 80 x-.u.;p.u....@..
00406900 78 2D 00 74 F0 8B F0 51 8D 44 24 18 50 8B CF E8 x-.t...Q.D$.P...
00406910 8C F5 FF FF 3B F3 75 A8 8B 44 24 10 5F 89 30 5E ....;.u..D$._.0^
00406920 5B C2 0C 00 CC CC CC CC CC CC CC CC CC CC CC CC [...............
00406930 53 8B 5C 24 10 56 8B 74 24 10 57 8B F9 8B 47 04 S.\$.V.t$.W...G.
00406940 3B 30 75 36 3B D8 75 32 8B 40 04 50 E8 8F FB FF ;0u6;.u2.@.P....
00406950 FF 8B 47 04 89 40 04 8B 47 04 C7 47 08 00 00 00 ..G..@..G..G....
00406960 00 89 00 8B 47 04 89 40 08 8B 4F 04 8B 11 8B 44 ....G..@..O....D
00406970 24 10 5F 5E 89 10 5B C2 0C 00 3B F3 74 5A 8B FF $._^..[...;.tZ..
00406980 80 7E 2D 00 8B CE 75 3F 8B 46 08 80 78 2D 00 75 .~-...u?.F..x-.u
00406990 1B 8B F0 8B 06 80 78 2D 00 75 2C EB 03 8D 49 00 ......x-.u,...I.
004069A0 8B F0 8B 06 80 78 2D 00 74 F6 EB 1B 8B 46 04 80 .....x-.t....F..
004069B0 78 2D 00 75 10 3B 70 08 75 0B 8B F0 8B 40 04 80 x-.u.;p.u....@..
004069C0 78 2D 00 74 F0 8B F0 51 8D 44 24 18 50 8B CF E8 x-.t...Q.D$.P...
004069D0 5C F8 FF FF 3B F3 75 A8 8B 44 24 10 5F 89 30 5E \...;.u..D$._.0^
004069E0 5B C2 0C 00 CC CC CC CC CC CC CC CC CC CC CC CC [...............
004069F0 6A FF 68 58 BC 82 00 64 A1 00 00 00 00 50 51 53 j.hX...d.....PQS
00406A00 55 56 57 A1 88 41 A1 00 33 C4 50 8D 44 24 18 64 UVW..A..3.P.D$.d
00406A10 A3 00 00 00 00 8B E9 8B 45 20 8D 7D 20 6A FF 50 ........E .} j.P
00406A20 89 7C 24 1C FF 15 F4 40 8A 00 C6 47 04 01 8B 4D .|$....@...G...M
00406A30 0C 8B 51 04 8D 75 08 33 DB 52 8B CE 89 5C 24 24 ..Q..u.3.R...\$$
00406A40 E8 BB 2B 22 00 8B 46 04 89 40 04 8B 46 04 89 5E ..+"..F..@..F..^
00406A50 08 89 00 8B 76 04 89 76 08 8B 45 18 8B 48 04 8D ....v..v..E..H..
00406A60 75 14 51 8B CE E8 76 FA FF FF 8B 46 04 89 40 04 u.Q...v....F..@.
00406A70 8B 46 04 89 5E 08 89 00 8B 76 04 89 76 08 8B 17 .F..^....v..v...
00406A80 52 88 5F 04 FF 15 F0 40 8A 00 8B 4C 24 18 64 89 R._....@...L$.d.
00406A90 0D 00 00 00 00 59 5F 5E 5D 5B 83 C4 10 C3 CC CC .....Y_^][......
00406AA0 A1 F4 B0 A6 00 64 8B 0D 2C 00 00 00 8B 14 81 8B .....d..,.......
00406AB0 82 0C 00 00 00 05 18 3F A5 00 8B 00 85 C0 74 07 .......?......t.
00406AC0 8B C8 E9 29 FF FF FF C3 CC CC CC CC CC CC CC CC ...)............
00406AD0 51 56 8B F1 8B 46 04 8B 08 50 51 8D 44 24 0C 50 QV...F...PQ.D$.P
00406AE0 8B CE E8 89 FD FF FF 8B 4E 04 51 E8 D6 E4 28 00 ........N.Q...(.
00406AF0 83 C4 04 33 C0 89 46 04 89 46 08 5E 59 C3 CC CC ...3..F..F.^Y...

;; fn00406B00: 00406B00
;;   Called from:
;;     00406CEE (in fn00406C90)
fn00406B00 proc
	push	0FFh
	push	82BC93h
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
	xor	ebx,ebx
	mov	[esi+4h],ebx
	lea	edi,[esi+8h]
	mov	ecx,edi
	mov	[esp+1Ch],ebx
	mov	dword ptr [esi],8A6DE4h
	call	811B80h
	mov	[edi+4h],eax
	mov	byte ptr [eax+2Dh],1h
	mov	eax,[edi+4h]
	mov	[eax+4h],eax
	mov	eax,[edi+4h]
	mov	[eax],eax
	mov	eax,[edi+4h]
	mov	[eax+8h],eax
	mov	[edi+8h],ebx
	lea	edi,[esi+14h]
	mov	ecx,edi
	mov	byte ptr [esp+1Ch],1h
	call	811B80h
	mov	[edi+4h],eax
	mov	byte ptr [eax+2Dh],1h
	mov	eax,[edi+4h]
	mov	[eax+4h],eax
	mov	eax,[edi+4h]
	mov	[eax],eax
	mov	eax,[edi+4h]
	push	ebx
	push	ebx
	mov	[eax+8h],eax
	push	ebx
	mov	[edi+8h],ebx
	call	dword ptr [8A40FCh]
	mov	ecx,esi
	mov	[esi+20h],eax
	mov	[esi+24h],bl
	call	401AD0h
	mov	eax,esi
	mov	ecx,[esp+14h]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebx
	add	esp,10h
	ret
00406BB3          CC CC CC CC CC CC CC CC CC CC CC CC CC    .............
00406BC0 6A FF 68 C3 BC 82 00 64 A1 00 00 00 00 50 83 EC j.h....d.....P..
00406BD0 08 53 56 57 A1 88 41 A1 00 33 C4 50 8D 44 24 18 .SVW..A..3.P.D$.
00406BE0 64 A3 00 00 00 00 8B F9 89 7C 24 10 8B 47 20 50 d........|$..G P
00406BF0 C7 44 24 24 01 00 00 00 FF 15 F8 40 8A 00 8B 47 .D$$.......@...G
00406C00 18 8B 08 8D 77 14 50 51 8D 4C 24 1C 51 8B CE E8 ....w.PQ.L$.Q...
00406C10 1C FD FF FF 8B 46 04 50 E8 A9 E3 28 00 33 DB 89 .....F.P...(.3..
00406C20 5E 04 89 5E 08 8B 47 0C 8B 08 83 C4 04 8D 77 08 ^..^..G.......w.
00406C30 50 51 8D 54 24 1C 52 8B CE 88 5C 24 2C E8 2E FC PQ.T$.R...\$,...
00406C40 FF FF 8B 46 04 50 E8 7B E3 28 00 89 5E 04 89 5E ...F.P.{.(..^..^
00406C50 08 83 C4 04 C7 07 78 6D 8A 00 8B 4C 24 18 64 89 ......xm...L$.d.
00406C60 0D 00 00 00 00 59 5F 5E 5B 83 C4 14 C3 CC CC CC .....Y_^[.......
00406C70 56 8B F1 E8 48 FF FF FF F6 44 24 08 01 74 09 56 V...H....D$..t.V
00406C80 E8 41 E3 28 00 83 C4 04 8B C6 5E C2 04 00 CC CC .A.(......^.....

;; fn00406C90: 00406C90
;;   Called from:
;;     00406D34 (in fn00406D20)
fn00406C90 proc
	push	0FFh
	push	82BCEBh
	mov	eax,fs:[0000h]
	push	eax
	push	ecx
	push	esi
	mov	eax,[0A14188h]
	xor	eax,esp
	push	eax
	lea	eax,[esp+0Ch]
	mov	fs:[0000h],eax
	mov	eax,[0A6B0F4h]
	mov	ecx,fs:[002Ch]
	mov	edx,[ecx+eax*4]
	mov	esi,[edx+0Ch]
	add	esi,0A53F18h
	cmp	dword ptr [esi],0h
	jnz	406D0Ah

l00406CD2:
	push	28h
	call	694FD8h
	add	esp,4h
	mov	[esp+8h],eax
	test	eax,eax
	mov	dword ptr [esp+14h],0h
	jz	406D06h

l00406CEC:
	mov	ecx,eax
	call	406B00h
	mov	[esi],eax
	mov	ecx,[esp+0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	esi
	add	esp,10h
	ret

l00406D06:
	xor	eax,eax
	mov	[esi],eax

l00406D0A:
	mov	eax,[esi]
	mov	ecx,[esp+0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	esi
	add	esp,10h
	ret
00406D1D                                        CC CC CC              ...

;; fn00406D20: 00406D20
;;   Called from:
;;     00402A58 (in fn00402A20)
fn00406D20 proc
	push	ecx
	mov	eax,[esp+0Ch]
	push	esi
	mov	esi,[esp+0Ch]
	push	eax
	push	esi
	mov	dword ptr [esp+0Ch],0h
	call	406C90h
	mov	ecx,eax
	call	405CE0h
	mov	eax,esi
	pop	esi
	pop	ecx
	ret
00406D45                CC CC CC CC CC CC CC CC CC CC CC      ...........
00406D50 6A FF 68 39 BD 82 00 64 A1 00 00 00 00 50 83 EC j.h9...d.....P..
00406D60 08 56 57 A1 88 41 A1 00 33 C4 50 8D 44 24 14 64 .VW..A..3.P.D$.d
00406D70 A3 00 00 00 00 C7 44 24 0C 00 00 00 00 8B 74 24 ......D$......t$
00406D80 2C 85 F6 51 8B C4 C7 44 24 20 01 00 00 00 89 64 ,..Q...D$ .....d
00406D90 24 14 89 30 74 07 8B CE E8 33 AD FF FF 8B 44 24 $..0t....3....D$
00406DA0 2C 8B 7C 24 28 50 57 C6 44 24 28 02 E8 DF FE FF ,.|$(PW.D$(.....
00406DB0 FF 8B C8 C6 44 24 28 01 E8 63 F7 FF FF 85 F6 C7 ....D$(..c......
00406DC0 44 24 0C 01 00 00 00 C6 44 24 1C 00 74 15 8B CE D$......D$..t...
00406DD0 E8 0B AD FF FF 83 F8 01 75 09 8B 16 50 8B 02 8B ........u...P...
00406DE0 CE FF D0 8B C7 8B 4C 24 14 64 89 0D 00 00 00 00 ......L$.d......
00406DF0 59 5F 5E 83 C4 14 C3 CC CC CC CC CC CC CC CC CC Y_^.............
00406E00 8B 44 24 04 50 E8 86 FE FF FF 8B C8 E8 9F F9 FF .D$.P...........
00406E10 FF C3 CC CC CC CC CC CC CC CC CC CC CC CC CC CC ................

;; fn00406E20: 00406E20
;;   Called from:
;;     004027BC (in fn004023A0)
fn00406E20 proc
	push	esi
	mov	esi,ecx
	mov	eax,[esi+14h]
	push	0FFh
	push	eax
	call	dword ptr [8A40F4h]
	mov	ecx,[esp+8h]
	mov	[0A53F1Ch],ecx
	mov	edx,[esi+14h]
	push	edx
	mov	byte ptr [esi+18h],0h
	call	dword ptr [8A40F0h]
	mov	eax,esi
	pop	esi
	ret	4h
00406E4D                                        CC CC CC              ...

;; fn00406E50: 00406E50
;;   Called from:
;;     00407AFA (in fn00407A90)
;;     00407C1B (in fn00407BC0)
fn00406E50 proc
	mov	edx,[ecx+0Ch]
	mov	eax,[esp+4h]
	cmp	eax,edx
	jnz	406E71h

l00406E5B:
	cmp	eax,[ecx+10h]
	jnz	406E71h

l00406E60:
	xor	edx,edx
	mov	[ecx+0Ch],edx
	mov	[ecx+10h],edx
	mov	[eax+20h],edx
	mov	[eax+24h],edx
	ret	4h

l00406E71:
	cmp	eax,edx
	push	esi
	jnz	406E8Bh

l00406E76:
	mov	esi,[edx+24h]
	mov	[ecx+0Ch],esi
	xor	edx,edx
	mov	[esi+20h],edx
	pop	esi
	mov	[eax+20h],edx
	mov	[eax+24h],edx
	ret	4h

l00406E8B:
	mov	edx,[ecx+10h]
	cmp	eax,edx
	jnz	406EA7h

l00406E92:
	mov	esi,[edx+20h]
	mov	[ecx+10h],esi
	xor	edx,edx
	mov	[esi+24h],edx
	pop	esi
	mov	[eax+20h],edx
	mov	[eax+24h],edx
	ret	4h

l00406EA7:
	mov	ecx,[eax+24h]
	mov	edx,[eax+20h]
	mov	[ecx+20h],edx
	mov	edx,[eax+24h]
	mov	ecx,[eax+20h]
	mov	[ecx+24h],edx
	xor	edx,edx
	pop	esi
	mov	[eax+20h],edx
	mov	[eax+24h],edx
	ret	4h
00406EC5                CC CC CC CC CC CC CC CC CC CC CC      ...........

;; fn00406ED0: 00406ED0
;;   Called from:
;;     004071CD (in fn004070F0)
;;     004261DD (in fn00426100)
fn00406ED0 proc
	mov	eax,[esp+4h]
	mov	ecx,[eax]
	cmp	byte ptr [ecx+2Dh],0h
	jnz	406EEAh

l00406EDC:
	lea	esp,[esp+0h]

l00406EE0:
	mov	eax,ecx
	mov	ecx,[eax]
	cmp	byte ptr [ecx+2Dh],0h
	jz	406EE0h

l00406EEA:
	ret
00406EEB                                  CC CC CC CC CC            .....
00406EF0 55 8B EC 6A FF 68 71 BD 82 00 64 A1 00 00 00 00 U..j.hq...d.....
00406F00 50 83 EC 0C 53 56 57 A1 88 41 A1 00 33 C5 50 8D P...SVW..A..3.P.
00406F10 45 F4 64 A3 00 00 00 00 89 65 F0 6A 30 E8 B6 E0 E.d......e.j0...
00406F20 28 00 8B F0 83 C4 04 89 75 EC C7 45 FC 00 00 00 (.......u..E....
00406F30 00 89 75 E8 85 F6 C6 45 FC 01 74 30 8B 4D 0C 8B ..u....E..t0.M..
00406F40 45 08 8B 55 10 8B 5D 14 89 4E 04 8D 7E 0C 53 8B E..U..]..N..~.S.
00406F50 CF 89 06 89 56 08 FF 15 3C 43 8A 00 8B 43 1C 8A ....V...<C...C..
00406F60 4D 18 89 47 1C 88 4E 2C C6 46 2D 00 8B C6 8B 4D M..G..N,.F-....M
00406F70 F4 64 89 0D 00 00 00 00 59 5F 5E 5B 8B E5 5D C2 .d......Y_^[..].
00406F80 14 00 8B 55 EC 52 E8 3B E0 28 00 83 C4 04 6A 00 ...U.R.;.(....j.
00406F90 6A 00 E8 35 E0 28 00 CC CC CC CC CC CC CC CC CC j..5.(..........
00406FA0 6A FF 68 98 BD 82 00 64 A1 00 00 00 00 50 51 53 j.h....d.....PQS
00406FB0 55 56 57 A1 88 41 A1 00 33 C4 50 8D 44 24 18 64 UVW..A..3.P.D$.d
00406FC0 A3 00 00 00 00 8B F1 33 DB 89 5C 24 14 8B 46 14 .......3..\$..F.
00406FD0 8D 7E 14 6A FF 50 89 7C 24 1C FF 15 F4 40 8A 00 .~.j.P.|$....@..
00406FE0 C6 47 04 01 8B 4C 24 2C 51 8D 54 24 30 52 8B CE .G...L$,Q.T$0R..
00406FF0 89 5C 24 28 E8 E7 B9 20 00 8B 00 3B 46 04 74 3D .\$(... ...;F.t=
00407000 8B 68 28 3B 6E 0C 74 17 55 8B CE E8 40 FE FF FF .h(;n.t.U...@...
00407010 8B 46 0C 89 45 24 8B 4E 0C 89 69 20 89 6E 0C 83 .F..E$.N..i .n..
00407020 05 24 3F A5 00 01 8B 4D 1C 3B CB 8B 74 24 28 89 .$?....M.;..t$(.
00407030 0E 74 05 E8 98 AA FF FF 8B 17 52 EB 10 83 05 28 .t........R....(
00407040 3F A5 00 01 8B 74 24 28 8B 07 89 1E 50 88 5F 04 ?....t$(....P._.
00407050 FF 15 F0 40 8A 00 8B C6 8B 4C 24 18 64 89 0D 00 ...@.....L$.d...
00407060 00 00 00 59 5F 5E 5D 5B 83 C4 10 C2 08 00 CC CC ...Y_^][........

;; fn00407070: 00407070
;;   Called from:
;;     00407B37 (in fn00407A90)
;;     00407C54 (in fn00407BC0)
fn00407070 proc
	push	0FFh
	push	82BDC9h
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
	mov	edi,ecx
	mov	[esp+0Ch],edi
	mov	esi,[edi+1Ch]
	test	esi,esi
	mov	dword ptr [esp+18h],0h
	jz	4070C2h

l004070A8:
	mov	ecx,esi
	call	401AE0h
	cmp	eax,1h
	jnz	4070C2h

l004070B4:
	test	esi,esi
	jz	4070C2h

l004070B8:
	mov	eax,[esi]
	mov	edx,[eax]
	push	1h
	mov	ecx,esi
	call	edx

l004070C2:
	mov	ecx,edi
	mov	dword ptr [edi+1Ch],0h
	mov	dword ptr [esp+18h],0FFFFFFFFh
	call	dword ptr [8A4338h]
	mov	ecx,[esp+10h]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	add	esp,10h
	ret
004070EB                                  CC CC CC CC CC            .....

;; fn004070F0: 004070F0
;;   Called from:
;;     0040770F (in fn00407670)
;;     00407B52 (in fn00407A90)
;;     00407C6F (in fn00407BC0)
fn004070F0 proc
	push	0FFh
	push	82BDF9h
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,48h
	push	ebx
	push	ebp
	push	esi
	push	edi
	mov	eax,[0A14188h]
	xor	eax,esp
	push	eax
	lea	eax,[esp+5Ch]
	mov	fs:[0000h],eax
	mov	ebp,ecx
	mov	eax,[esp+70h]
	cmp	byte ptr [eax+2Dh],0h
	jz	40715Fh

l00407123:
	push	8A6D94h
	lea	ecx,[esp+1Ch]
	call	dword ptr [8A4334h]
	lea	eax,[esp+18h]
	push	eax
	lea	ecx,[esp+38h]
	mov	dword ptr [esp+68h],0h
	call	4019E0h
	push	99A88Ch
	lea	ecx,[esp+38h]
	push	ecx
	mov	dword ptr [esp+3Ch],99003Ch
	call	694FCCh

l0040715F:
	mov	ebx,eax
	lea	ecx,[esp+70h]
	mov	[esp+14h],ebx
	call	5B0EC0h
	mov	eax,[ebx]
	cmp	byte ptr [eax+2Dh],0h
	jz	40717Bh

l00407176:
	mov	edi,[ebx+8h]
	jmp	407193h

l0040717B:
	mov	edx,[ebx+8h]
	cmp	byte ptr [edx+2Dh],0h
	jz	407188h

l00407184:
	mov	edi,eax
	jmp	407193h

l00407188:
	mov	ecx,[esp+70h]
	cmp	ecx,ebx
	mov	edi,[ecx+8h]
	jnz	4071FEh

l00407193:
	cmp	byte ptr [edi+2Dh],0h
	mov	esi,[ebx+4h]
	jnz	40719Fh

l0040719C:
	mov	[edi+4h],esi

l0040719F:
	mov	eax,[ebp+4h]
	cmp	[eax+4h],ebx
	jnz	4071ACh

l004071A7:
	mov	[eax+4h],edi
	jmp	4071B7h

l004071AC:
	cmp	[esi],ebx
	jnz	4071B4h

l004071B0:
	mov	[esi],edi
	jmp	4071B7h

l004071B4:
	mov	[esi+8h],edi

l004071B7:
	mov	ebx,[ebp+4h]
	mov	eax,[ebx]
	cmp	eax,[esp+14h]
	jnz	4071D7h

l004071C2:
	cmp	byte ptr [edi+2Dh],0h
	jz	4071CCh

l004071C8:
	mov	eax,esi
	jmp	4071D5h

l004071CC:
	push	edi
	call	406ED0h
	add	esp,4h

l004071D5:
	mov	[ebx],eax

l004071D7:
	mov	ebx,[ebp+4h]
	mov	ecx,[esp+14h]
	cmp	[ebx+8h],ecx
	jnz	407255h

l004071E3:
	cmp	byte ptr [edi+2Dh],0h
	jz	4071F0h

l004071E9:
	mov	eax,esi
	mov	[ebx+8h],eax
	jmp	407255h

l004071F0:
	push	edi
	call	4E6960h
	add	esp,4h
	mov	[ebx+8h],eax
	jmp	407255h

l004071FE:
	mov	[eax+4h],ecx
	mov	edx,[ebx]
	mov	[ecx],edx
	cmp	ecx,[ebx+8h]
	jnz	40720Eh

l0040720A:
	mov	esi,ecx
	jmp	407228h

l0040720E:
	cmp	byte ptr [edi+2Dh],0h
	mov	esi,[ecx+4h]
	jnz	40721Ah

l00407217:
	mov	[edi+4h],esi

l0040721A:
	mov	[esi],edi
	mov	eax,[ebx+8h]
	mov	[ecx+8h],eax
	mov	edx,[ebx+8h]
	mov	[edx+4h],ecx

l00407228:
	mov	eax,[ebp+4h]
	cmp	[eax+4h],ebx
	jnz	407235h

l00407230:
	mov	[eax+4h],ecx
	jmp	407243h

l00407235:
	mov	eax,[ebx+4h]
	cmp	[eax],ebx
	jnz	407240h

l0040723C:
	mov	[eax],ecx
	jmp	407243h

l00407240:
	mov	[eax+8h],ecx

l00407243:
	mov	eax,[ebx+4h]
	mov	[ecx+4h],eax
	mov	dl,[ebx+2Ch]
	mov	al,[ecx+2Ch]
	mov	[ecx+2Ch],dl
	mov	[ebx+2Ch],al

l00407255:
	mov	eax,[esp+14h]
	mov	bl,1h
	cmp	[eax+2Ch],bl
	jnz	407356h

l00407264:
	mov	ecx,[ebp+4h]
	cmp	edi,[ecx+4h]
	jz	407353h

l00407270:
	cmp	[edi+2Ch],bl
	jnz	407353h

l00407279:
	mov	eax,[esi]
	cmp	edi,eax
	jnz	4072E2h

l0040727F:
	mov	eax,[esi+8h]
	cmp	byte ptr [eax+2Ch],0h
	jnz	40729Ah

l00407288:
	mov	[eax+2Ch],bl
	push	esi
	mov	ecx,ebp
	mov	byte ptr [esi+2Ch],0h
	call	4E2250h
	mov	eax,[esi+8h]

l0040729A:
	cmp	byte ptr [eax+2Dh],0h
	jnz	407312h

l004072A0:
	mov	edx,[eax]
	cmp	[edx+2Ch],bl
	jnz	4072AFh

l004072A7:
	mov	ecx,[eax+8h]
	cmp	[ecx+2Ch],bl
	jz	40730Eh

l004072AF:
	mov	ecx,[eax+8h]
	cmp	[ecx+2Ch],bl
	jnz	4072C9h

l004072B7:
	mov	[edx+2Ch],bl
	push	eax
	mov	ecx,ebp
	mov	byte ptr [eax+2Ch],0h
	call	420740h
	mov	eax,[esi+8h]

l004072C9:
	mov	cl,[esi+2Ch]
	mov	[eax+2Ch],cl
	mov	[esi+2Ch],bl
	mov	edx,[eax+8h]
	push	esi
	mov	ecx,ebp
	mov	[edx+2Ch],bl
	call	4E2250h
	jmp	407353h

l004072E2:
	cmp	byte ptr [eax+2Ch],0h
	jnz	4072F9h

l004072E8:
	mov	[eax+2Ch],bl
	push	esi
	mov	ecx,ebp
	mov	byte ptr [esi+2Ch],0h
	call	420740h
	mov	eax,[esi]

l004072F9:
	cmp	byte ptr [eax+2Dh],0h
	jnz	407312h

l004072FF:
	mov	edx,[eax+8h]
	cmp	[edx+2Ch],bl
	jnz	407325h

l00407307:
	mov	ecx,[eax]
	cmp	[ecx+2Ch],bl
	jnz	407325h

l0040730E:
	mov	byte ptr [eax+2Ch],0h

l00407312:
	mov	edx,[ebp+4h]
	mov	edi,esi
	cmp	edi,[edx+4h]
	mov	esi,[esi+4h]
	jnz	407270h

l00407323:
	jmp	407353h

l00407325:
	mov	ecx,[eax]
	cmp	[ecx+2Ch],bl
	jnz	40733Dh

l0040732C:
	mov	[edx+2Ch],bl
	push	eax
	mov	ecx,ebp
	mov	byte ptr [eax+2Ch],0h
	call	4E2250h
	mov	eax,[esi]

l0040733D:
	mov	cl,[esi+2Ch]
	mov	[eax+2Ch],cl
	mov	[esi+2Ch],bl
	mov	edx,[eax]
	push	esi
	mov	ecx,ebp
	mov	[edx+2Ch],bl
	call	420740h

l00407353:
	mov	[edi+2Ch],bl

l00407356:
	mov	ecx,[esp+14h]
	add	ecx,0Ch
	call	dword ptr [8A4338h]
	mov	eax,[esp+14h]
	push	eax
	call	694FC6h
	mov	eax,[ebp+8h]
	add	esp,4h
	test	eax,eax
	jbe	40737Dh

l00407377:
	add	eax,0FFh
	mov	[ebp+8h],eax

l0040737D:
	mov	eax,[esp+6Ch]
	mov	ecx,[esp+70h]
	mov	[eax],ecx
	mov	ecx,[esp+5Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebp
	pop	ebx
	add	esp,54h
	ret	8h
0040739D                                        CC CC CC              ...
004073A0 6A FF 68 29 BE 82 00 64 A1 00 00 00 00 50 83 EC j.h)...d.....P..
004073B0 44 53 55 56 57 A1 88 41 A1 00 33 C4 50 8D 44 24 DSUVW..A..3.P.D$
004073C0 58 64 A3 00 00 00 00 8B F9 81 7F 08 FE FF FF 07 Xd..............
004073D0 72 3C 68 80 6D 8A 00 8D 4C 24 18 FF 15 34 43 8A r<h.m...L$...4C.
004073E0 00 8D 44 24 14 50 8D 4C 24 34 C7 44 24 64 00 00 ..D$.P.L$4.D$d..
004073F0 00 00 E8 E9 A5 FF FF 68 68 9C 99 00 8D 4C 24 34 .......hh....L$4
00407400 51 C7 44 24 38 30 00 99 00 E8 BE DB 28 00 8B 54 Q.D$80......(..T
00407410 24 74 8B 47 04 8B 74 24 70 6A 00 52 50 56 50 E8 $t.G..t$pj.RPVP.
00407420 CC FA FF FF 8B E8 8B 47 04 BB 01 00 00 00 01 5F .......G......._
00407430 08 3B F0 75 10 89 68 04 8B 47 04 89 28 8B 4F 04 .;.u..h..G..(.O.
00407440 89 69 08 EB 22 80 7C 24 6C 00 74 0D 89 2E 8B 47 .i..".|$l.t....G
00407450 04 3B 30 75 12 89 28 EB 0E 89 6E 08 8B 47 04 3B .;0u..(...n..G.;
00407460 70 08 75 03 89 68 08 8B 55 04 80 7A 2C 00 8D 45 p.u..h..U..z,..E
00407470 04 8B F5 0F 85 EC 00 00 00 8D A4 24 00 00 00 00 ...........$....
00407480 8B 08 8B 51 04 3B 0A 75 51 8B 52 08 80 7A 2C 00 ...Q.;.uQ.R..z,.
00407490 75 19 88 59 2C 88 5A 2C 8B 10 8B 4A 04 C6 41 2C u..Y,.Z,...J..A,
004074A0 00 8B 10 8B 72 04 E9 AA 00 00 00 3B 71 08 75 0A ....r......;q.u.
004074B0 8B F1 56 8B CF E8 96 AD 0D 00 8B 46 04 88 58 2C ..V........F..X,
004074C0 8B 4E 04 8B 51 04 C6 42 2C 00 8B 46 04 8B 48 04 .N..Q..B,..F..H.
004074D0 51 8B CF E8 68 92 01 00 EB 7B 8B 12 80 7A 2C 00 Q...h....{...z,.
004074E0 75 16 88 59 2C 88 5A 2C 8B 10 8B 4A 04 C6 41 2C u..Y,.Z,...J..A,
004074F0 00 8B 10 8B 72 04 EB 5D 3B 31 75 0A 8B F1 56 8B ....r..];1u...V.
00407500 CF E8 3A 92 01 00 8B 46 04 88 58 2C 8B 4E 04 8B ..:....F..X,.N..
00407510 51 04 C6 42 2C 00 8B 46 04 8B 40 04 8B 48 08 8B Q..B,..F..@..H..
00407520 11 89 50 08 8B 11 80 7A 2D 00 75 03 89 42 04 8B ..P....z-.u..B..
00407530 50 04 89 51 04 8B 57 04 3B 42 04 75 05 89 4A 04 P..Q..W.;B.u..J.
00407540 EB 0E 8B 50 04 3B 02 75 04 89 0A EB 03 89 4A 08 ...P.;.u......J.
00407550 89 01 89 48 04 8B 4E 04 80 79 2C 00 8D 46 04 0F ...H..N..y,..F..
00407560 84 1B FF FF FF 8B 57 04 8B 42 04 88 58 2C 8B 44 ......W..B..X,.D
00407570 24 68 89 28 8B 4C 24 58 64 89 0D 00 00 00 00 59 $h.(.L$Xd......Y
00407580 5F 5E 5D 5B 83 C4 50 C2 10 00 CC CC CC CC CC CC _^][..P.........
00407590 51 53 55 8B 6C 24 14 56 8B D9 57 8B 7B 04 8B 77 QSU.l$.V..W.{..w
004075A0 04 80 7E 2D 00 B0 01 88 44 24 10 75 28 8D 49 00 ..~-....D$.u(.I.
004075B0 8D 46 0C 50 55 8B FE FF 15 0C 44 8A 00 83 C4 08 .F.PU.....D.....
004075C0 84 C0 88 44 24 10 74 04 8B 36 EB 03 8B 76 08 80 ...D$.t..6...v..
004075D0 7E 2D 00 74 DB 84 C0 8B F7 89 74 24 1C 74 38 8B ~-.t......t$.t8.
004075E0 4B 04 3B 39 75 24 55 57 6A 01 8D 54 24 28 52 8B K.;9u$UWj..T$(R.
004075F0 CB E8 AA FD FF FF 8B 08 8B 44 24 18 5F 5E 5D 89 .........D$._^].
00407600 08 C6 40 04 01 5B 59 C2 08 00 8D 4C 24 1C E8 AD ..@..[Y....L$...
00407610 E2 1E 00 8B 74 24 1C 8D 56 0C 55 52 FF 15 0C 44 ....t$..V.UR...D
00407620 8A 00 83 C4 08 84 C0 74 27 8B 44 24 10 55 57 50 .......t'.D$.UWP
00407630 8D 4C 24 28 51 8B CB E8 64 FD FF FF 8B 10 8B 44 .L$(Q...d......D
00407640 24 18 5F 5E 5D 89 10 C6 40 04 01 5B 59 C2 08 00 $._^]...@..[Y...
00407650 8B 44 24 18 5F 89 30 5E 5D C6 40 04 00 5B 59 C2 .D$._.0^].@..[Y.
00407660 08 00 CC CC CC CC CC CC CC CC CC CC CC CC CC CC ................

;; fn00407670: 00407670
;;   Called from:
;;     00407C9A (in fn00407BC0)
fn00407670 proc
	push	ebx
	mov	ebx,[esp+10h]
	push	esi
	mov	esi,[esp+10h]
	push	edi
	mov	edi,ecx
	mov	eax,[edi+4h]
	cmp	esi,[eax]
	jnz	4076BAh

l00407684:
	cmp	ebx,eax
	jnz	4076BAh

l00407688:
	mov	eax,[eax+4h]
	push	eax
	call	629600h
	mov	eax,[edi+4h]
	mov	[eax+4h],eax
	mov	eax,[edi+4h]
	mov	dword ptr [edi+8h],0h
	mov	[eax],eax
	mov	eax,[edi+4h]
	mov	[eax+8h],eax
	mov	ecx,[edi+4h]
	mov	edx,[ecx]
	mov	eax,[esp+10h]
	pop	edi
	pop	esi
	mov	[eax],edx
	pop	ebx
	ret	0Ch

l004076BA:
	cmp	esi,ebx
	jz	407718h

l004076BE:
	mov	edi,edi

l004076C0:
	cmp	byte ptr [esi+2Dh],0h
	mov	ecx,esi
	jnz	407707h

l004076C8:
	mov	eax,[esi+8h]
	cmp	byte ptr [eax+2Dh],0h
	jnz	4076ECh

l004076D1:
	mov	esi,eax
	mov	eax,[esi]
	cmp	byte ptr [eax+2Dh],0h
	jnz	407707h

l004076DB:
	jmp	4076E0h
004076DD                                        8D 49 00              .I.

l004076E0:
	mov	esi,eax
	mov	eax,[esi]
	cmp	byte ptr [eax+2Dh],0h
	jz	4076E0h

l004076EA:
	jmp	407707h

l004076EC:
	mov	eax,[esi+4h]
	cmp	byte ptr [eax+2Dh],0h
	jnz	407705h

l004076F5:
	cmp	esi,[eax+8h]
	jnz	407705h

l004076FA:
	mov	esi,eax
	mov	eax,[eax+4h]
	cmp	byte ptr [eax+2Dh],0h
	jz	4076F5h

l00407705:
	mov	esi,eax

l00407707:
	push	ecx
	lea	eax,[esp+18h]
	push	eax
	mov	ecx,edi
	call	4070F0h
	cmp	esi,ebx
	jnz	4076C0h

l00407718:
	mov	eax,[esp+10h]
	pop	edi
	mov	[eax],esi
	pop	esi
	pop	ebx
	ret	0Ch
00407724             CC CC CC CC CC CC CC CC CC CC CC CC     ............
00407730 6A FF 68 73 BE 82 00 64 A1 00 00 00 00 50 83 EC j.hs...d.....P..
00407740 38 53 55 56 57 A1 88 41 A1 00 33 C4 50 8D 44 24 8SUVW..A..3.P.D$
00407750 4C 64 A3 00 00 00 00 8B F1 8B 5C 24 60 8B 03 8B Ld........\$`...
00407760 50 30 8B CB C7 44 24 54 00 00 00 00 FF D2 8B E8 P0...D$T........
00407770 3B 2D 1C 3F A5 00 89 6C 24 18 7E 27 8B CB C7 44 ;-.?...l$.~'...D
00407780 24 54 FF FF FF FF E8 55 A3 FF FF 83 F8 01 0F 85 $T.....U........
00407790 22 02 00 00 8B 03 8B 10 6A 01 8B CB FF D2 E9 13 ".......j.......
004077A0 02 00 00 8B 46 14 8D 7E 14 6A FF 50 89 7C 24 1C ....F..~.j.P.|$.
004077B0 FF 15 F4 40 8A 00 C6 47 04 01 83 7E 0C 00 C6 44 ...@...G...~...D
004077C0 24 54 01 0F 84 A4 00 00 00 EB 09 EB 03 8D 49 00 $T............I.
004077D0 8B 6C 24 18 8B 0D 20 3F A5 00 03 CD 3B 0D 1C 3F .l$... ?....;..?
004077E0 A5 00 0F 8E 85 00 00 00 8B 7E 10 85 FF 74 70 8B .........~...tp.
004077F0 4F 1C 8B 11 8B 42 30 FF D0 29 05 20 3F A5 00 57 O....B0..). ?..W
00407800 8B CE E8 49 F6 FF FF 57 8B CE E8 81 97 1A 00 3B ...I...W.......;
00407810 46 04 89 44 24 1C 74 18 83 C0 0C 50 57 FF 15 0C F..D$.t....PW...
00407820 44 8A 00 83 C4 08 84 C0 75 06 8D 44 24 1C EB 0B D.......u..D$...
00407830 8B 4E 04 89 4C 24 20 8D 44 24 20 8B 28 8B CF E8 .N..L$ .D$ .(...
00407840 2C F8 FF FF 57 E8 7C D7 28 00 83 C4 04 3B 6E 04 ,...W.|.(....;n.
00407850 74 0D 55 8D 54 24 28 52 8B CE E8 91 F8 FF FF 83 t.U.T$(R........
00407860 7E 0C 00 8B 7C 24 14 0F 85 63 FF FF FF 8B 6C 24 ~...|$...c....l$
00407870 5C 55 8D 44 24 28 50 8B CE E8 62 B1 20 00 8B 00 \U.D$(P...b. ...
00407880 3B 46 04 74 39 8B 40 28 8B 70 1C 3B F3 74 23 8B ;F.t9.@(.p.;.t#.
00407890 CB 89 58 1C E8 37 A2 FF FF 85 F6 74 15 8B CE E8 ..X..7.....t....
004078A0 3C A2 FF FF 83 F8 01 75 09 8B 16 50 8B 02 8B CE <......u...P....
004078B0 FF D0 8B 0F C6 47 04 00 51 E9 D5 00 00 00 6A 28 .....G..Q.....j(
004078C0 E8 13 D7 28 00 8B F8 83 C4 04 89 7C 24 24 85 FF ...(.......|$$..
004078D0 C6 44 24 54 02 74 11 8B CF FF 15 B0 43 8A 00 C7 .D$T.t......C...
004078E0 47 1C 00 00 00 00 EB 02 33 FF 55 8B CF C6 44 24 G.......3.U...D$
004078F0 58 01 FF 15 58 43 8A 00 8B 6F 1C 3B EB 74 24 8B X...XC...o.;.t$.
00407900 CB 89 5F 1C E8 C7 A1 FF FF 85 ED 74 16 8B CD E8 .._........t....
00407910 CC A1 FF FF 83 F8 01 75 0A 8B 55 00 50 8B 02 8B .......u..U.P...
00407920 CD FF D0 C7 47 20 00 00 00 00 8B 4E 0C 89 4F 24 ....G .....N..O$
00407930 8B 46 0C 85 C0 74 03 89 78 20 83 7E 10 00 89 7E .F...t..x .~...~
00407940 0C 75 03 89 7E 10 8B 54 24 5C 52 8D 4C 24 30 FF .u..~..T$\R.L$0.
00407950 15 3C 43 8A 00 89 7C 24 48 8D 44 24 2C 50 8D 4C .<C...|$H.D$,P.L
00407960 24 28 51 8B CE C6 44 24 5C 03 E8 21 FC FF FF 8D $(Q...D$\..!....
00407970 4C 24 2C C6 44 24 54 01 FF 15 38 43 8A 00 8B 54 L$,.D$T...8C...T
00407980 24 18 8B 44 24 14 01 15 20 3F A5 00 C6 40 04 00 $..D$... ?...@..
00407990 8B 00 50 FF 15 F0 40 8A 00 8B CB C7 44 24 54 FF ..P...@.....D$T.
004079A0 FF FF FF E8 38 A1 FF FF 83 F8 01 75 09 8B 13 50 ....8......u...P
004079B0 8B 02 8B CB FF D0 8B 4C 24 4C 64 89 0D 00 00 00 .......L$Ld.....
004079C0 00 59 5F 5E 5D 5B 83 C4 44 C2 08 00 CC CC CC CC .Y_^][..D.......
004079D0 6A FF 68 98 BE 82 00 64 A1 00 00 00 00 50 51 53 j.h....d.....PQS
004079E0 55 56 57 A1 88 41 A1 00 33 C4 50 8D 44 24 18 64 UVW..A..3.P.D$.d
004079F0 A3 00 00 00 00 8B F1 8B 46 14 8D 5E 14 6A FF 50 ........F..^.j.P
00407A00 89 5C 24 1C FF 15 F4 40 8A 00 C6 43 04 01 8B 4C .\$....@...C...L
00407A10 24 28 51 8D 54 24 2C 52 8B CE C7 44 24 28 00 00 $(Q.T$,R...D$(..
00407A20 00 00 E8 B9 AF 20 00 8B 28 3B 6E 04 74 38 8B 7D ..... ..(;n.t8.}
00407A30 28 8B 4F 1C 8B 01 8B 50 30 FF D2 29 05 20 3F A5 (.O....P0..). ?.
00407A40 00 57 8B CE E8 07 F4 FF FF 8B CF E8 20 F6 FF FF .W.......... ...
00407A50 57 E8 70 D5 28 00 83 C4 04 55 8D 44 24 2C 50 8B W.p.(....U.D$,P.
00407A60 CE E8 8A F6 FF FF 8B 0B 51 C6 43 04 00 FF 15 F0 ........Q.C.....
00407A70 40 8A 00 8B 4C 24 18 64 89 0D 00 00 00 00 59 5F @...L$.d......Y_
00407A80 5E 5D 5B 83 C4 10 C2 04 00 CC CC CC CC CC CC CC ^][.............

;; fn00407A90: 00407A90
;;   Called from:
;;     004027C8 (in fn004023A0)
fn00407A90 proc
	push	0FFh
	push	82BEC8h
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,10h
	push	ebx
	push	ebp
	push	esi
	push	edi
	mov	eax,[0A14188h]
	xor	eax,esp
	push	eax
	lea	eax,[esp+24h]
	mov	fs:[0000h],eax
	mov	edi,ecx
	mov	eax,[edi+14h]
	lea	ebx,[edi+14h]
	push	0FFh
	push	eax
	mov	[esp+24h],ebx
	call	dword ptr [8A40F4h]
	mov	byte ptr [ebx+4h],1h
	xor	eax,eax
	cmp	[edi+0Ch],eax
	mov	[esp+2Ch],eax
	jz	407B5Eh

l00407ADF:
	nop

l00407AE0:
	mov	esi,[edi+10h]
	cmp	esi,eax
	jz	407B57h

l00407AE7:
	mov	ecx,[esi+1Ch]
	mov	edx,[ecx]
	mov	eax,[edx+30h]
	call	eax
	sub	[0A53F20h],eax
	push	esi
	mov	ecx,edi
	call	406E50h
	push	esi
	mov	ecx,edi
	call	5B0F90h
	cmp	eax,[edi+4h]
	mov	[esp+14h],eax
	jz	407B28h

l00407B10:
	add	eax,0Ch
	push	eax
	push	esi
	call	dword ptr [8A440Ch]
	add	esp,8h
	test	al,al
	jnz	407B28h

l00407B22:
	lea	eax,[esp+14h]
	jmp	407B33h

l00407B28:
	mov	ecx,[edi+4h]
	mov	[esp+18h],ecx
	lea	eax,[esp+18h]

l00407B33:
	mov	ebp,[eax]
	mov	ecx,esi
	call	407070h
	push	esi
	call	694FC6h
	add	esp,4h
	cmp	ebp,[edi+4h]
	jz	407B57h

l00407B4A:
	push	ebp
	lea	edx,[esp+24h]
	push	edx
	mov	ecx,edi
	call	4070F0h

l00407B57:
	xor	eax,eax
	cmp	[edi+0Ch],eax
	jnz	407AE0h

l00407B5E:
	mov	[0A53F20h],eax
	mov	[0A53F24h],eax
	mov	[0A53F28h],eax
	mov	eax,[ebx]
	push	eax
	mov	byte ptr [ebx+4h],0h
	call	dword ptr [8A40F0h]
	mov	ecx,[esp+24h]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebp
	pop	ebx
	add	esp,1Ch
	ret
00407B8E                                           CC CC               ..
00407B90 51 56 8B F1 8B 46 04 8B 08 50 51 8D 44 24 0C 50 QV...F...PQ.D$.P
00407BA0 8B CE E8 C9 FA FF FF 8B 4E 04 51 E8 16 D4 28 00 ........N.Q...(.
00407BB0 83 C4 04 33 C0 89 46 04 89 46 08 5E 59 C3 CC CC ...3..F..F.^Y...

;; fn00407BC0: 00407BC0
;;   Called from:
;;     00407ECD (in fn00407EC0)
fn00407BC0 proc
	push	0FFh
	push	82BF03h
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,10h
	push	ebx
	push	ebp
	push	esi
	push	edi
	mov	eax,[0A14188h]
	xor	eax,esp
	push	eax
	lea	eax,[esp+24h]
	mov	fs:[0000h],eax
	mov	esi,ecx
	mov	[esp+1Ch],esi
	cmp	dword ptr [esi+0Ch],0h
	mov	dword ptr [esp+2Ch],1h
	jz	407C7Ah

l00407BFB:
	mov	ebp,[8A440Ch]

l00407C01:
	mov	edi,[esi+10h]
	test	edi,edi
	jz	407C74h

l00407C08:
	mov	ecx,[edi+1Ch]
	mov	eax,[ecx]
	mov	edx,[eax+30h]
	call	edx
	sub	[0A53F20h],eax
	push	edi
	mov	ecx,esi
	call	406E50h
	push	edi
	mov	ecx,esi
	call	5B0F90h
	cmp	eax,[esi+4h]
	mov	[esp+14h],eax
	jz	407C45h

l00407C31:
	add	eax,0Ch
	push	eax
	push	edi
	call	ebp
	add	esp,8h
	test	al,al
	jnz	407C45h

l00407C3F:
	lea	eax,[esp+14h]
	jmp	407C50h

l00407C45:
	mov	eax,[esi+4h]
	mov	[esp+18h],eax
	lea	eax,[esp+18h]

l00407C50:
	mov	ebx,[eax]
	mov	ecx,edi
	call	407070h
	push	edi
	call	694FC6h
	add	esp,4h
	cmp	ebx,[esi+4h]
	jz	407C74h

l00407C67:
	push	ebx
	lea	ecx,[esp+24h]
	push	ecx
	mov	ecx,esi
	call	4070F0h

l00407C74:
	cmp	dword ptr [esi+0Ch],0h
	jnz	407C01h

l00407C7A:
	mov	edx,[esi+14h]
	push	edx
	call	dword ptr [8A40F8h]
	mov	eax,[esi+4h]
	mov	ecx,[eax]
	push	eax
	push	ecx
	lea	eax,[esp+28h]
	push	eax
	mov	ecx,esi
	mov	dword ptr [esp+38h],0FFFFFFFFh
	call	407670h
	mov	ecx,[esi+4h]
	push	ecx
	call	694FC6h
	add	esp,4h
	mov	dword ptr [esi+4h],0h
	mov	dword ptr [esi+8h],0h
	mov	ecx,[esp+24h]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebp
	pop	ebx
	add	esp,1Ch
	ret
00407CCD                                        CC CC CC              ...

;; fn00407CD0: 00407CD0
;;   Called from:
;;     00407E86 (in fn00407E40)
fn00407CD0 proc
	push	0FFh
	push	82BF33h
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,8h
	push	ebx
	push	esi
	push	edi
	mov	eax,[0A14188h]
	xor	eax,esp
	push	eax
	lea	eax,[esp+18h]
	mov	fs:[0000h],eax
	mov	esi,ecx
	mov	[esp+14h],esi
	call	811B80h
	mov	[esi+4h],eax
	mov	byte ptr [eax+2Dh],1h
	mov	eax,[esi+4h]
	mov	[eax+4h],eax
	mov	eax,[esi+4h]
	mov	[eax],eax
	mov	eax,[esi+4h]
	xor	ebx,ebx
	mov	[eax+8h],eax
	mov	[esi+8h],ebx
	push	ebx
	push	ebx
	push	ebx
	mov	[esp+2Ch],ebx
	mov	[esi+0Ch],ebx
	mov	[esi+10h],ebx
	call	dword ptr [8A40FCh]
	mov	[esi+14h],eax
	mov	[esi+18h],bl
	cmp	[0A0D0C3h],bl
	mov	byte ptr [esp+20h],1h
	jz	407E1Dh

l00407D48:
	push	8A6E8Ch
	push	2h
	push	0A53F1Ch
	lea	eax,[esp+1Ch]
	push	8A6E78h
	push	eax
	call	422A90h
	mov	ecx,[esp+24h]
	add	esp,14h
	or	edi,0FFh
	cmp	ecx,ebx
	jz	407D7Eh

l00407D71:
	add	[ecx+4h],edi
	jnz	407D7Eh

l00407D76:
	mov	edx,[ecx]
	mov	eax,[edx]
	push	1h
	call	eax

l00407D7E:
	push	8A6E58h
	push	2h
	push	0A53F20h
	lea	ecx,[esp+1Ch]
	push	8A6E44h
	push	ecx
	call	422A90h
	mov	ecx,[esp+24h]
	add	esp,14h
	cmp	ecx,ebx
	jz	407DB1h

l00407DA4:
	add	[ecx+4h],edi
	jnz	407DB1h

l00407DA9:
	mov	edx,[ecx]
	mov	eax,[edx]
	push	1h
	call	eax

l00407DB1:
	push	8A6E28h
	push	2h
	push	0A53F24h
	lea	ecx,[esp+1Ch]
	push	8A6E1Ch
	push	ecx
	call	422A90h
	mov	ecx,[esp+24h]
	add	esp,14h
	cmp	ecx,ebx
	jz	407DE4h

l00407DD7:
	add	[ecx+4h],edi
	jnz	407DE4h

l00407DDC:
	mov	edx,[ecx]
	mov	eax,[edx]
	push	1h
	call	eax

l00407DE4:
	push	8A6DFCh
	push	2h
	push	0A53F28h
	lea	ecx,[esp+1Ch]
	push	8A6DECh
	push	ecx
	call	422A90h
	mov	ecx,[esp+24h]
	add	esp,14h
	cmp	ecx,ebx
	jz	407E17h

l00407E0A:
	add	[ecx+4h],edi
	jnz	407E17h

l00407E0F:
	mov	edx,[ecx]
	mov	eax,[edx]
	push	1h
	call	eax

l00407E17:
	mov	[0A0D0C3h],bl

l00407E1D:
	mov	eax,esi
	mov	ecx,[esp+18h]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebx
	add	esp,14h
	ret
00407E32       CC CC CC CC CC CC CC CC CC CC CC CC CC CC   ..............

;; fn00407E40: 00407E40
;;   Called from:
;;     004027B5 (in fn004023A0)
;;     004027C1 (in fn004023A0)
fn00407E40 proc
	push	0FFh
	push	82BF5Bh
	mov	eax,fs:[0000h]
	push	eax
	push	ecx
	mov	eax,[0A14188h]
	xor	eax,esp
	push	eax
	lea	eax,[esp+8h]
	mov	fs:[0000h],eax
	mov	eax,[0A53F2Ch]
	test	eax,eax
	jnz	407EA7h

l00407E6A:
	push	1Ch
	call	694FD8h
	add	esp,4h
	mov	[esp+4h],eax
	test	eax,eax
	mov	dword ptr [esp+10h],0h
	jz	407EA0h

l00407E84:
	mov	ecx,eax
	call	407CD0h
	mov	[0A53F2Ch],eax
	mov	ecx,[esp+8h]
	mov	fs:[0000h],ecx
	pop	ecx
	add	esp,10h
	ret

l00407EA0:
	xor	eax,eax
	mov	[0A53F2Ch],eax

l00407EA7:
	mov	ecx,[esp+8h]
	mov	fs:[0000h],ecx
	pop	ecx
	add	esp,10h
	ret
00407EB7                      CC CC CC CC CC CC CC CC CC        .........

;; fn00407EC0: 00407EC0
;;   Called from:
;;     00402387 (in fn00402310)
fn00407EC0 proc
	mov	ecx,[0A53F2Ch]
	test	ecx,ecx
	push	esi
	mov	esi,ecx
	jz	407EDBh

l00407ECD:
	call	407BC0h
	push	esi
	call	694FC6h
	add	esp,4h

l00407EDB:
	mov	dword ptr [0A53F2Ch],0h
	pop	esi
	ret
00407EE7                      CC CC CC CC CC CC CC CC CC        .........
00407EF0 51 56 8B 74 24 0C 83 C1 24 51 8B CE C7 44 24 08 QV.t$...$Q...D$.
00407F00 00 00 00 00 FF 15 3C 43 8A 00 8B C6 5E 59 C2 04 ......<C....^Y..
00407F10 00 CC CC CC CC CC CC CC CC CC CC CC CC CC CC CC ................
00407F20 B8 00 04 00 00 C3 CC CC CC CC CC CC CC CC CC CC ................
00407F30 8B 41 44 85 C0 75 01 C3 8B 49 48 2B C8 B8 93 24 .AD..u...IH+...$
00407F40 49 92 F7 E9 03 D1 C1 FA 04 8B C2 C1 E8 1F 03 C2 I...............
00407F50 C3 CC CC CC CC CC CC CC CC CC CC CC CC CC CC CC ................
00407F60 51 8B 44 24 0C 8D 14 C5 00 00 00 00 2B D0 8B 41 Q.D$........+..A
00407F70 44 56 8B 74 24 0C 8D 0C 90 51 8B CE C7 44 24 08 DV.t$....Q...D$.
00407F80 00 00 00 00 FF 15 3C 43 8A 00 8B C6 5E 59 C2 08 ......<C....^Y..
00407F90 00 CC CC CC CC CC CC CC CC CC CC CC CC CC CC CC ................
00407FA0 56 8B F1 E8 38 5F 00 00 F6 44 24 08 01 74 09 56 V...8_...D$..t.V
00407FB0 E8 11 D0 28 00 83 C4 04 8B C6 5E C2 04 00 CC CC ...(......^.....

;; fn00407FC0: 00407FC0
;;   Called from:
;;     004083EE (in fn004083D0)
fn00407FC0 proc
	push	ebp
	mov	ebp,esp
	push	0FFh
	push	82BF91h
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,0Ch
	push	ebx
	push	esi
	push	edi
	mov	eax,[0A14188h]
	xor	eax,ebp
	push	eax
	lea	eax,[ebp-0Ch]
	mov	fs:[0000h],eax
	mov	[ebp-10h],esp
	mov	esi,[ebp+10h]
	mov	edi,[ebp+8h]
	xor	ebx,ebx
	mov	[ebp-14h],esi
	mov	[ebp-4h],ebx
	lea	esp,[esp+0h]

l00408000:
	cmp	edi,[ebp+0Ch]
	jz	40804Ch

l00408005:
	mov	[ebp+8h],esi
	mov	[ebp-18h],esi
	cmp	esi,ebx
	mov	byte ptr [ebp-4h],1h
	jz	40801Ch

l00408013:
	push	edi
	mov	ecx,esi
	call	dword ptr [8A433Ch]

l0040801C:
	add	esi,1Ch
	mov	[ebp-4h],bl
	mov	[ebp+10h],esi
	add	edi,1Ch
	jmp	408000h
0040802A                               8B 75 EC 8B 7D 10           .u..}.
00408030 3B F7 74 0F 8B CE FF 15 38 43 8A 00 83 C6 1C 3B ;.t.....8C.....;
00408040 F7 75 F1 33 DB 53 53 E8 80 CF 28 00             .u.3.SS...(.   

l0040804C:
	mov	eax,esi
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret
00408060 51 8B 44 24 0C 8B 11 8B 52 1C 56 8D 34 C5 00 00 Q.D$....R.V.4...
00408070 00 00 2B F0 8B 41 44 8D 04 B0 8B 74 24 0C 50 56 ..+..AD....t$.PV
00408080 C7 44 24 0C 00 00 00 00 FF D2 8B C6 5E 59 C2 08 .D$.........^Y..
00408090 00 CC CC CC CC CC CC CC CC CC CC CC CC CC CC CC ................
004080A0 6A FF 68 C1 BF 82 00 64 A1 00 00 00 00 50 83 EC j.h....d.....P..
004080B0 1C 53 55 56 57 A1 88 41 A1 00 33 C4 50 8D 44 24 .SUVW..A..3.P.D$
004080C0 30 64 A3 00 00 00 00 8B F1 8B 44 24 40 68 8F 69 0d........D$@h.i
004080D0 8A 00 50 FF 15 E4 43 8A 00 83 C4 08 84 C0 0F 85 ..P...C.........
004080E0 D9 00 00 00 8B 16 8B 42 04 8B CE 33 ED FF D0 85 .......B...3....
004080F0 C0 0F 8E 91 00 00 00 8B 16 8B 52 0C 55 8D 44 24 ..........R.U.D$
00408100 44 50 8B CE FF D2 8B 7C 24 40 8D 4C 24 14 C7 44 DP.....|$@.L$..D
00408110 24 38 00 00 00 00 FF 15 B0 43 8A 00 8B 17 50 8B $8.......C....P.
00408120 42 34 8B CF C6 44 24 3C 01 FF D0 84 C0 8D 4C 24 B4...D$<......L$
00408130 14 0F 94 C3 C6 44 24 38 00 FF 15 38 43 8A 00 84 .....D$8...8C...
00408140 DB 8B 4C 24 40 C7 44 24 38 FF FF FF FF 75 51 85 ..L$@.D$8....uQ.
00408150 C9 74 19 8B F9 E8 86 99 FF FF 83 F8 01 75 0D 85 .t...........u..
00408160 FF 74 09 8B 17 50 8B 02 8B CF FF D0 8B 16 8B 42 .t...P.........B
00408170 04 8B CE C7 44 24 40 00 00 00 00 83 C5 01 FF D0 ....D$@.........
00408180 3B E8 0F 8C 6F FF FF FF B0 01 8B 4C 24 30 64 89 ;...o......L$0d.
00408190 0D 00 00 00 00 59 5F 5E 5D 5B 83 C4 28 C2 04 00 .....Y_^][..(...
004081A0 85 C9 74 19 8B F1 E8 35 99 FF FF 83 F8 01 75 0D ..t....5......u.
004081B0 85 F6 74 09 8B 16 50 8B 02 8B CE FF D0 32 C0 EB ..t...P......2..
004081C0 C9 CC CC CC CC CC CC CC CC CC CC CC CC CC CC CC ................
004081D0 6A FF 68 1E C0 82 00 64 A1 00 00 00 00 50 83 EC j.h....d.....P..
004081E0 78 A1 88 41 A1 00 33 C4 89 44 24 74 53 55 56 57 x..A..3..D$tSUVW
004081F0 A1 88 41 A1 00 33 C4 50 8D 84 24 8C 00 00 00 64 ..A..3.P..$....d
00408200 A3 00 00 00 00 8B E9 8D 4C 24 6C C7 84 24 94 00 ........L$l..$..
00408210 00 00 00 00 00 00 FF 15 B0 43 8A 00 83 7D 1C 00 .........C...}..
00408220 C6 84 24 94 00 00 00 01 74 24 8D 7D 08 8B CF FF ..$.....t$.}....
00408230 15 5C 43 8A 00 51 8B CC 83 E8 01 89 01 8B CF 89 .\C..Q..........
00408240 64 24 18 FF 15 C8 43 8A 00 80 38 2F 75 5E 8B B4 d$....C...8/u^..
00408250 24 9C 00 00 00 8B 06 8B 50 2C 8D 4C 24 34 51 8B $.......P,.L$4Q.
00408260 CE FF D2 50 8D 45 08 50 8D 4C 24 20 B3 02 51 88 ...P.E.P.L$ ..Q.
00408270 9C 24 A0 00 00 00 FF 15 50 43 8A 00 83 C4 0C 50 .$......PC.....P
00408280 8D 4C 24 70 C6 84 24 98 00 00 00 03 FF 15 58 43 .L$p..$.......XC
00408290 8A 00 8D 4C 24 18 88 9C 24 94 00 00 00 FF 15 38 ...L$...$......8
004082A0 43 8A 00 8D 4C 24 34 E9 83 00 00 00 8B B4 24 9C C...L$4.......$.
004082B0 00 00 00 8B 16 8B 52 2C 8D 44 24 50 50 8B CE FF ......R,.D$PP...
004082C0 D2 8B D8 68 50 6A 8A 00 8D 44 24 1C 57 50 C6 84 ...hPj...D$.WP..
004082D0 24 A0 00 00 00 04 FF 15 D4 43 8A 00 53 50 8D 4C $........C..SP.L
004082E0 24 48 51 C6 84 24 AC 00 00 00 05 FF 15 50 43 8A $HQ..$.......PC.
004082F0 00 83 C4 18 50 8D 4C 24 70 C6 84 24 98 00 00 00 ....P.L$p..$....
00408300 06 FF 15 58 43 8A 00 8D 4C 24 34 C6 84 24 94 00 ...XC...L$4..$..
00408310 00 00 05 FF 15 38 43 8A 00 8D 4C 24 18 C6 84 24 .....8C...L$...$
00408320 94 00 00 00 04 FF 15 38 43 8A 00 8D 4C 24 50 C6 .......8C...L$P.
00408330 84 24 94 00 00 00 01 FF 15 38 43 8A 00 8B 94 24 .$.......8C....$
00408340 A0 00 00 00 8B 06 52 8B 50 70 51 8B CC 89 64 24 ......R.PpQ...d$
00408350 1C 51 8B CE FF D2 8B 4D 50 8B 01 8B 40 18 8D 54 .Q.....MP...@..T
00408360 24 74 52 FF D0 8D 4C 24 6C 8A D8 C6 84 24 94 00 $tR...L$l....$..
00408370 00 00 00 FF 15 38 43 8A 00 8B CE C7 84 24 94 00 .....8C......$..
00408380 00 00 FF FF FF FF E8 55 97 FF FF 83 F8 01 75 09 .......U......u.
00408390 8B 16 50 8B 02 8B CE FF D0 8A C3 8B 8C 24 8C 00 ..P..........$..
004083A0 00 00 64 89 0D 00 00 00 00 59 5F 5E 5D 5B 8B 4C ..d......Y_^][.L
004083B0 24 74 33 CC E8 D5 C7 28 00 81 C4 84 00 00 00 C2 $t3....(........
004083C0 08 00 CC CC CC CC CC CC CC CC CC CC CC CC CC CC ................

;; fn004083D0: 004083D0
;;   Called from:
;;     004086BC (in fn004085A0)
;;     0040870A (in fn004085A0)
fn004083D0 proc
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
	call	407FC0h
	add	esp,1Ch
	ret	0Ch
004083F9                            CC CC CC CC CC CC CC          .......
00408400 51 8B 44 24 08 C7 04 24 00 00 00 00 C7 00 00 00 Q.D$...$........
00408410 00 00 59 C2 0C 00 CC CC CC CC CC CC CC CC CC CC ..Y.............
00408420 56 8B 74 24 08 85 F6 74 16 8B CE E8 B0 96 FF FF V.t$...t........
00408430 83 F8 01 75 0A 8B 06 8B 10 6A 01 8B CE FF D2 32 ...u.....j.....2
00408440 C0 5E C2 08 00 CC CC CC CC CC CC CC CC CC CC CC .^..............

;; fn00408450: 00408450
;;   Called from:
;;     004085E0 (in fn004085A0)
fn00408450 proc
	push	ebp
	push	edi
	mov	edi,[esp+14h]
	mov	ebp,ecx
	mov	ecx,[esp+10h]
	cmp	ecx,edi
	jz	4084A8h

l00408460:
	push	ebx
	mov	ebx,[ebp+8h]
	cmp	edi,ebx
	push	esi
	mov	esi,ecx
	jz	408487h

l0040846B:
	jmp	408470h
0040846D                                        8D 49 00              .I.

l00408470:
	push	edi
	mov	ecx,esi
	call	dword ptr [8A4358h]
	add	edi,1Ch
	add	esi,1Ch
	cmp	edi,ebx
	jnz	408470h

l00408483:
	mov	ecx,[esp+18h]

l00408487:
	mov	ebx,[ebp+8h]
	cmp	esi,ebx
	mov	edi,esi
	jz	4084A3h

l00408490:
	mov	ecx,edi
	call	dword ptr [8A4338h]
	add	edi,1Ch
	cmp	edi,ebx
	jnz	408490h

l0040849F:
	mov	ecx,[esp+18h]

l004084A3:
	mov	[ebp+8h],esi
	pop	esi
	pop	ebx

l004084A8:
	mov	eax,[esp+0Ch]
	pop	edi
	mov	[eax],ecx
	pop	ebp
	ret	0Ch
004084B3          CC CC CC CC CC CC CC CC CC CC CC CC CC    .............
004084C0 6A FF 68 70 C0 82 00 64 A1 00 00 00 00 50 51 53 j.hp...d.....PQS
004084D0 55 56 57 A1 88 41 A1 00 33 C4 50 8D 44 24 18 64 UVW..A..3.P.D$.d
004084E0 A3 00 00 00 00 8B F1 89 74 24 14 C7 06 60 6F 8A ........t$...`o.
004084F0 00 8B 6E 44 33 DB C7 44 24 20 02 00 00 00 33 FF ..nD3..D$ ....3.
00408500 3B EB 74 21 8B 4E 48 2B CD B8 93 24 49 92 F7 E9 ;.t!.NH+...$I...
00408510 03 D1 C1 FA 04 8B C2 C1 E8 1F 03 C2 3B F8 73 05 ............;.s.
00408520 83 C7 01 EB DB 8B FD 3B FB 74 22 8B 6E 48 3B FD .......;.t".nH;.
00408530 74 0F 8B CF FF 15 38 43 8A 00 83 C7 1C 3B FD 75 t.....8C.....;.u
00408540 F1 8B 46 44 50 E8 7C CA 28 00 83 C4 04 8D 4E 24 ..FDP.|.(.....N$
00408550 89 5E 44 89 5E 48 89 5E 4C C6 44 24 20 01 FF 15 .^D.^H.^L.D$ ...
00408560 38 43 8A 00 8D 4E 08 88 5C 24 20 FF 15 38 43 8A 8C...N..\$ ..8C.
00408570 00 8B CE C7 44 24 20 FF FF FF FF E8 60 59 00 00 ....D$ .....`Y..
00408580 8B 4C 24 18 64 89 0D 00 00 00 00 59 5F 5E 5D 5B .L$.d......Y_^][
00408590 83 C4 10 C3 CC CC CC CC CC CC CC CC CC CC CC CC ................

;; fn004085A0: 004085A0
;;   Called from:
;;     004087DA (in fn00408720)
;;     0040CC5B (in fn0040CBA0)
;;     0040D062 (in fn0040CBA0)
fn004085A0 proc
	push	ebp
	mov	ebp,[esp+8h]
	push	esi
	mov	esi,ecx
	cmp	esi,ebp
	jz	408714h

l004085B0:
	mov	eax,[ebp+4h]
	test	eax,eax
	jz	4085D1h

l004085B7:
	mov	ecx,[ebp+8h]
	sub	ecx,eax
	mov	eax,92492493h
	imul	ecx
	add	edx,ecx
	sar	edx,4h
	mov	ecx,edx
	shr	ecx,1Fh
	add	ecx,edx
	jnz	4085ECh

l004085D1:
	mov	eax,[esi+8h]
	mov	ecx,[esi+4h]
	push	eax
	push	ecx
	lea	eax,[esp+14h]
	push	eax
	mov	ecx,esi
	call	408450h
	mov	eax,esi
	pop	esi
	pop	ebp
	ret	4h

l004085EC:
	push	ebx
	push	edi
	mov	edi,[esi+4h]
	test	edi,edi
	jnz	4085F9h

l004085F5:
	xor	eax,eax
	jmp	408611h

l004085F9:
	mov	ebx,[esi+8h]
	sub	ebx,edi
	mov	eax,92492493h
	imul	ebx
	add	edx,ebx
	sar	edx,4h
	mov	eax,edx
	shr	eax,1Fh
	add	eax,edx

l00408611:
	cmp	ecx,eax
	ja	40866Ch

l00408615:
	mov	eax,[ebp+8h]
	push	edi
	push	eax
	mov	eax,[ebp+4h]
	push	eax
	call	409170h
	mov	ecx,[esi+8h]
	add	esp,0Ch
	push	ecx
	push	eax
	mov	ecx,esi
	call	4033F0h
	mov	eax,[ebp+4h]
	test	eax,eax
	jz	408651h

l00408639:
	mov	ecx,[ebp+8h]
	sub	ecx,eax
	mov	eax,92492493h
	imul	ecx
	add	edx,ecx
	sar	edx,4h
	mov	eax,edx
	shr	eax,1Fh
	add	eax,edx

l00408651:
	lea	edx,[0000h+eax*8]
	sub	edx,eax
	mov	eax,[esi+4h]
	pop	edi
	lea	ecx,[eax+edx*4]
	pop	ebx
	mov	[esi+8h],ecx
	mov	eax,esi
	pop	esi
	pop	ebp
	ret	4h

l0040866C:
	test	edi,edi
	jnz	408674h

l00408670:
	xor	eax,eax
	jmp	40868Ch

l00408674:
	mov	ebx,[esi+0Ch]
	sub	ebx,edi
	mov	eax,92492493h
	imul	ebx
	add	edx,ebx
	sar	edx,4h
	mov	eax,edx
	shr	eax,1Fh
	add	eax,edx

l0040868C:
	cmp	ecx,eax
	ja	4086CDh

l00408690:
	mov	ecx,esi
	call	40D930h
	lea	edx,[0000h+eax*8]
	sub	edx,eax
	mov	eax,[ebp+4h]
	lea	ebx,[eax+edx*4]
	push	edi
	push	ebx
	push	eax
	call	409170h
	mov	eax,[esi+8h]
	mov	ecx,[ebp+8h]
	add	esp,0Ch
	push	eax
	push	ecx
	push	ebx
	mov	ecx,esi
	call	4083D0h
	pop	edi
	mov	[esi+8h],eax
	pop	ebx
	mov	eax,esi
	pop	esi
	pop	ebp
	ret	4h

l004086CD:
	test	edi,edi
	jz	4086E9h

l004086D1:
	mov	edx,[esi+8h]
	push	edx
	push	edi
	mov	ecx,esi
	call	4033F0h
	mov	eax,[esi+4h]
	push	eax
	call	694FC6h
	add	esp,4h

l004086E9:
	mov	ecx,ebp
	call	40D930h
	push	eax
	mov	ecx,esi
	call	401EC0h
	test	al,al
	jz	408712h

l004086FC:
	mov	ecx,[esi+4h]
	mov	edx,[ebp+8h]
	mov	eax,[ebp+4h]
	push	ecx
	push	edx
	push	eax
	mov	ecx,esi
	call	4083D0h
	mov	[esi+8h],eax

l00408712:
	pop	edi
	pop	ebx

l00408714:
	mov	eax,esi
	pop	esi
	pop	ebp
	ret	4h
0040871B                                  CC CC CC CC CC            .....

;; fn00408720: 00408720
;;   Called from:
;;     00402810 (in fn004023A0)
fn00408720 proc
	push	0FFh
	push	82C0C3h
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,14h
	push	ebx
	push	ebp
	push	esi
	push	edi
	mov	eax,[0A14188h]
	xor	eax,esp
	push	eax
	lea	eax,[esp+28h]
	mov	fs:[0000h],eax
	mov	edi,ecx
	mov	[esp+14h],edi
	xor	ebx,ebx
	mov	[edi+4h],ebx
	mov	eax,[esp+38h]
	lea	ebp,[edi+8h]
	push	eax
	mov	ecx,ebp
	mov	[esp+34h],ebx
	mov	dword ptr [edi],8A6F60h
	call	dword ptr [8A433Ch]
	push	8A6C20h
	lea	ecx,[edi+24h]
	mov	byte ptr [esp+34h],1h
	call	dword ptr [8A4334h]
	lea	esi,[edi+40h]
	mov	[esi+4h],ebx
	mov	[esi+8h],ebx
	mov	[esi+0Ch],ebx
	mov	ecx,[esp+3Ch]
	mov	[edi+50h],ecx
	mov	eax,[0A53F30h]
	cmp	eax,ebx
	mov	byte ptr [esp+30h],3h
	jz	4087C2h

l004087A0:
	mov	edx,[0A6B0F4h]
	mov	ecx,fs:[002Ch]
	mov	edx,[ecx+edx*4]
	cmp	[edx+10h],bl
	jnz	4087C2h

l004087B8:
	mov	ecx,[esp+38h]
	push	ecx
	call	eax
	add	esp,4h

l004087C2:
	mov	ecx,[edi+50h]
	mov	edx,[ecx]
	mov	edx,[edx+0Ch]
	push	ebp
	lea	eax,[esp+1Ch]
	push	eax
	call	edx
	push	eax
	mov	ecx,esi
	mov	byte ptr [esp+34h],4h
	call	4085A0h
	lea	ecx,[esp+18h]
	mov	byte ptr [esp+30h],3h
	call	403900h
	mov	ebx,[esi+4h]
	xor	ebp,ebp

l004087F2:
	test	ebx,ebx
	jz	408817h

l004087F6:
	mov	ecx,[esi+8h]
	sub	ecx,ebx
	mov	eax,92492493h
	imul	ecx
	add	edx,ecx
	sar	edx,4h
	mov	eax,edx
	shr	eax,1Fh
	add	eax,edx
	cmp	ebp,eax
	jnc	408817h

l00408812:
	add	ebp,1h
	jmp	4087F2h

l00408817:
	mov	eax,edi
	mov	ecx,[esp+28h]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebp
	pop	ebx
	add	esp,20h
	ret	8h
0040882F                                              CC                .
00408830 56 8B F1 E8 88 FC FF FF F6 44 24 08 01 74 09 56 V........D$..t.V
00408840 E8 81 C7 28 00 83 C4 04 8B C6 5E C2 04 00 CC CC ...(......^.....
00408850 6A FF 68 4B C1 82 00 64 A1 00 00 00 00 50 83 EC j.hK...d.....P..
00408860 68 A1 88 41 A1 00 33 C4 89 44 24 64 53 55 56 57 h..A..3..D$dSUVW
00408870 A1 88 41 A1 00 33 C4 50 8D 44 24 7C 64 A3 00 00 ..A..3.P.D$|d...
00408880 00 00 8B BC 24 8C 00 00 00 8B 9C 24 90 00 00 00 ....$......$....
00408890 33 ED 89 6C 24 1C 8B F1 89 7C 24 18 89 6C 24 20 3..l$....|$..l$ 
004088A0 8D 4C 24 5C C7 84 24 84 00 00 00 01 00 00 00 FF .L$\..$.........
004088B0 15 B0 43 8A 00 39 6E 1C C6 84 24 84 00 00 00 02 ..C..9n...$.....
004088C0 74 74 8D 6E 08 8B CD FF 15 5C 43 8A 00 51 8B CC tt.n.....\C..Q..
004088D0 83 E8 01 89 01 8B CD 89 64 24 18 FF 15 C8 43 8A ........d$....C.
004088E0 00 80 38 2F 74 50 68 50 6A 8A 00 8D 44 24 28 55 ..8/tPhPj...D$(U
004088F0 50 FF 15 D4 43 8A 00 53 50 8D 4C 24 54 51 C6 84 P...C..SP.L$TQ..
00408900 24 9C 00 00 00 04 FF 15 50 43 8A 00 83 C4 18 50 $.......PC.....P
00408910 8D 4C 24 60 C6 84 24 88 00 00 00 05 FF 15 58 43 .L$`..$.......XC
00408920 8A 00 8D 4C 24 40 C6 84 24 84 00 00 00 04 FF 15 ...L$@..$.......
00408930 38 43 8A 00 EB 26 53 8D 56 08 52 8D 44 24 2C 50 8C...&S.V.R.D$,P
00408940 FF 15 50 43 8A 00 83 C4 0C 50 8D 4C 24 60 C6 84 ..PC.....P.L$`..
00408950 24 88 00 00 00 03 FF 15 58 43 8A 00 8D 4C 24 24 $.......XC...L$$
00408960 C6 84 24 84 00 00 00 02 FF 15 38 43 8A 00 6A 00 ..$.......8C..j.
00408970 6A 2E 8B CB FF 15 04 44 8A 00 8B E8 85 ED 0F 8C j......D........
00408980 90 00 00 00 8B CB FF 15 5C 43 8A 00 3B E8 0F 8D ........\C..;...
00408990 80 00 00 00 6A 60 E8 65 F5 00 00 83 C4 04 89 44 ....j`.e.......D
004089A0 24 14 85 C0 C6 84 24 84 00 00 00 06 74 0C 53 8B $.....$.....t.S.
004089B0 C8 E8 5A FA 00 00 8B F8 EB 02 33 FF 51 8B C4 8B ..Z.......3.Q...
004089C0 CE C6 84 24 88 00 00 00 02 89 64 24 18 89 30 E8 ...$......d$..0.
004089D0 FC 90 FF FF 8B 17 8B 42 3C 8B CF FF D0 51 8B C4 .......B<....Q..
004089E0 8B CF 89 64 24 18 89 38 E8 E3 90 FF FF 8D 4C 24 ...d$..8......L$
004089F0 60 51 C6 84 24 8C 00 00 00 07 E8 41 F4 FF FF 8B `Q..$......A....
00408A00 C8 C6 84 24 8C 00 00 00 02 E8 22 ED FF FF 8B 7C ...$......"....|
00408A10 24 18 EB 7F 8B 4E 50 8B 11 8B 52 14 8D 44 24 5C $....NP...R..D$\
00408A20 50 FF D2 84 C0 74 6C 6A 54 E8 AA C5 28 00 83 C4 P....tljT...(...
00408A30 04 89 44 24 14 85 C0 C6 84 24 84 00 00 00 08 74 ..D$.....$.....t
00408A40 12 8B 4E 50 51 8D 54 24 60 52 8B C8 E8 CF FC FF ..NPQ.T$`R......
00408A50 FF EB 02 33 C0 85 C0 51 8B CC 89 64 24 18 89 01 ...3...Q...d$...
00408A60 74 07 8B C8 E8 67 90 FF FF 8D 44 24 60 50 C6 84 t....g....D$`P..
00408A70 24 8C 00 00 00 09 E8 C5 F3 FF FF 8B C8 C6 84 24 $..............$
00408A80 8C 00 00 00 02 E8 A6 EC FF FF 53 8D 4E 40 E8 3D ..........S.N@.=
00408A90 B4 FF FF 8B 16 8B 42 1C 53 57 8B CE FF D0 8D 4C ......B.SW.....L
00408AA0 24 5C C7 44 24 1C 01 00 00 00 C6 84 24 84 00 00 $\.D$.......$...
00408AB0 00 01 FF 15 38 43 8A 00 8B C7 8B 4C 24 7C 64 89 ....8C.....L$|d.
00408AC0 0D 00 00 00 00 59 5F 5E 5D 5B 8B 4C 24 64 33 CC .....Y_^][.L$d3.
00408AD0 E8 B9 C0 28 00 83 C4 74 C2 08 00 CC CC CC CC CC ...(...t........
00408AE0 6A FF 68 10 C2 82 00 64 A1 00 00 00 00 50 83 EC j.h....d.....P..
00408AF0 74 A1 88 41 A1 00 33 C4 89 44 24 70 53 55 56 57 t..A..3..D$pSUVW
00408B00 A1 88 41 A1 00 33 C4 50 8D 84 24 88 00 00 00 64 ..A..3.P..$....d
00408B10 A3 00 00 00 00 8B 84 24 98 00 00 00 8B 9C 24 9C .......$......$.
00408B20 00 00 00 8B E9 33 F6 8D 4C 24 68 89 44 24 2C 89 .....3..L$h.D$,.
00408B30 5C 24 1C 89 74 24 28 FF 15 B0 43 8A 00 C7 84 24 \$..t$(...C....$
00408B40 90 00 00 00 01 00 00 00 89 74 24 14 39 75 1C C6 .........t$.9u..
00408B50 84 24 90 00 00 00 02 74 24 8D 7D 08 8B CF FF 15 .$.....t$.}.....
00408B60 5C 43 8A 00 51 8B CC 83 E8 01 89 01 8B CF 89 64 \C..Q..........d
00408B70 24 24 FF 15 DC 43 8A 00 80 38 2F 75 3A 53 8D 4D $$...C...8/u:S.M
00408B80 08 51 8D 54 24 38 52 FF 15 50 43 8A 00 83 C4 0C .Q.T$8R..PC.....
00408B90 50 8D 4C 24 6C C6 84 24 94 00 00 00 03 FF 15 58 P.L$l..$.......X
00408BA0 43 8A 00 8D 4C 24 30 C6 84 24 90 00 00 00 02 FF C...L$0..$......
00408BB0 15 38 43 8A 00 EB 68 68 50 6A 8A 00 8D 44 24 50 .8C...hhPj...D$P
00408BC0 57 50 FF 15 D4 43 8A 00 8B 4C 24 28 51 50 8D 54 WP...C...L$(QP.T
00408BD0 24 44 B3 04 52 88 9C 24 A8 00 00 00 FF 15 50 43 $D..R..$......PC
00408BE0 8A 00 83 C4 18 50 8D 4C 24 6C C6 84 24 94 00 00 .....P.L$l..$...
00408BF0 00 05 FF 15 58 43 8A 00 8D 4C 24 30 88 9C 24 90 ....XC...L$0..$.
00408C00 00 00 00 FF 15 38 43 8A 00 8D 4C 24 4C C6 84 24 .....8C...L$L..$
00408C10 90 00 00 00 02 FF 15 38 43 8A 00 8B 5C 24 1C 8D .......8C...\$..
00408C20 44 24 68 50 8D 4C 24 1C 51 E8 12 F2 FF FF 8B C8 D$hP.L$.Q.......
00408C30 E8 6B E3 FF FF 8B 00 85 C0 74 11 8B F0 85 F6 89 .k.......t......
00408C40 74 24 14 74 07 8B CE E8 84 8E FF FF 8B 4C 24 18 t$.t.........L$.
00408C50 85 C9 C6 84 24 90 00 00 00 02 74 19 8B F9 E8 7D ....$.....t....}
00408C60 8E FF FF 83 F8 01 75 0D 85 FF 74 09 8B 17 50 8B ......u...t...P.
00408C70 02 8B CF FF D0 85 F6 74 22 8B 7C 24 2C 8B CE 89 .......t".|$,...
00408C80 37 E8 4A 8E FF FF C7 44 24 28 01 00 00 00 C6 84 7.J....D$(......
00408C90 24 90 00 00 00 01 E9 C2 02 00 00 8D 4C 24 68 51 $...........L$hQ
00408CA0 8D 54 24 1C 52 E8 76 E0 FF FF 83 C4 08 8B 00 85 .T$.R.v.........
00408CB0 C0 74 11 8B F0 85 F6 89 74 24 14 74 07 8B CE E8 .t......t$.t....
00408CC0 0C 8E FF FF 8B 4C 24 18 85 C9 C6 84 24 90 00 00 .....L$.....$...
00408CD0 00 02 74 1A 8B F9 E8 05 8E FF FF 83 F8 01 75 0E ..t...........u.
00408CE0 85 FF 74 0A 8B 07 8B 10 6A 01 8B CF FF D2 85 F6 ..t.....j.......
00408CF0 74 53 51 8B C4 8B CE 89 64 24 24 89 30 E8 CE 8D tSQ.....d$$.0...
00408D00 FF FF 8D 44 24 6C 50 C6 84 24 98 00 00 00 08 E8 ...D$lP..$......
00408D10 2C F1 FF FF 8B C8 C6 84 24 98 00 00 00 02 E8 0D ,.......$.......
00408D20 EA FF FF 8B 7C 24 2C 8B CE 89 37 E8 A0 8D FF FF ....|$,...7.....
00408D30 C7 44 24 28 01 00 00 00 C6 84 24 90 00 00 00 01 .D$(......$.....
00408D40 E9 18 02 00 00 8B 4D 50 8B 11 8B 52 04 6A 00 8D ......MP...R.j..
00408D50 44 24 6C 50 FF D2 83 E8 01 0F 84 DB 00 00 00 83 D$lP............
00408D60 E8 01 0F 85 D0 01 00 00 8B 4D 50 8B 01 8B 40 10 .........MP...@.
00408D70 8D 54 24 68 52 8D 54 24 1C 52 FF D0 8D 4C 24 68 .T$hR.T$.R...L$h
00408D80 B3 0B 51 88 9C 24 94 00 00 00 E8 C1 0C 01 00 8B ..Q..$..........
00408D90 C8 E8 9A 0C 01 00 8B 44 24 18 85 C0 74 70 6A 01 .......D$...tpj.
00408DA0 51 8B CC 89 01 8B 44 24 20 85 C0 89 64 24 2C 74 Q.....D$ ...d$,t
00408DB0 04 83 40 04 01 8B 54 24 24 52 8D 44 24 2C 50 E8 ..@...T$$R.D$,P.
00408DC0 2C 73 00 00 83 C4 10 50 8D 4C 24 18 C6 84 24 94 ,s.....P.L$...$.
00408DD0 00 00 00 0C E8 E7 62 1C 00 8D 4C 24 20 88 9C 24 ......b...L$ ..$
00408DE0 90 00 00 00 E8 C7 32 01 00 8B 74 24 14 85 F6 74 ......2...t$...t
00408DF0 19 51 8B C4 8B CD 89 64 24 28 89 28 E8 CF 8C FF .Q.....d$(.(....
00408E00 FF 8B 16 8B 42 3C 8B CE FF D0 8B 44 24 18 85 C0 ....B<.....D$...
00408E10 C6 84 24 90 00 00 00 02 0F 84 98 00 00 00 83 40 ..$............@
00408E20 04 FF 8B C8 83 C0 04 83 38 00 0F 85 86 00 00 00 ........8.......
00408E30 8B 11 8B 02 6A 01 FF D0 EB 7C 6A 54 E8 97 C1 28 ....j....|jT...(
00408E40 00 83 C4 04 89 44 24 24 85 C0 C6 84 24 90 00 00 .....D$$....$...
00408E50 00 09 74 14 8B 4D 50 51 8D 54 24 6C 52 8B C8 E8 ..t..MPQ.T$lR...
00408E60 BC F8 FF FF 8B F0 EB 02 33 F6 53 8D 4E 24 C6 84 ........3.S.N$..
00408E70 24 94 00 00 00 02 FF 15 58 43 8A 00 85 F6 89 74 $.......XC.....t
00408E80 24 1C 74 07 8B CE E8 45 8C FF FF 8D 44 24 1C 50 $.t....E....D$.P
00408E90 8D 4C 24 18 C6 84 24 94 00 00 00 0A E8 1F 62 1C .L$...$.......b.
00408EA0 00 8D 4C 24 1C C6 84 24 90 00 00 00 02 E8 FE 31 ..L$...$.......1
00408EB0 01 00 8B 74 24 14 85 F6 74 7E 51 8B C4 8B CE 89 ...t$...t~Q.....
00408EC0 64 24 28 89 30 E8 06 8C FF FF 8D 4C 24 6C 51 8D d$(.0......L$lQ.
00408ED0 54 24 28 52 E8 77 DE FF FF 83 C4 0C 50 8D 4C 24 T$(R.w......P.L$
00408EE0 18 C6 84 24 94 00 00 00 0D E8 D2 61 1C 00 8D 4C ...$.......a...L
00408EF0 24 20 C6 84 24 90 00 00 00 02 E8 B1 31 01 00 8B $ ..$.......1...
00408F00 74 24 14 85 F6 51 8B C4 89 64 24 28 89 30 74 07 t$...Q...d$(.0t.
00408F10 8B CE E8 B9 8B FF FF 8D 44 24 6C 50 C6 84 24 98 ........D$lP..$.
00408F20 00 00 00 0E E8 17 EF FF FF 8B C8 C6 84 24 98 00 .............$..
00408F30 00 00 02 E8 F8 E7 FF FF 85 F6 8B 7C 24 2C 89 37 ...........|$,.7
00408F40 74 07 8B CE E8 87 8B FF FF 85 F6 C7 44 24 28 01 t...........D$(.
00408F50 00 00 00 C6 84 24 90 00 00 00 01 74 15 8B CE E8 .....$.....t....
00408F60 7C 8B FF FF 83 F8 01 75 09 8B 16 50 8B 02 8B CE |......u...P....
00408F70 FF D0 8D 4C 24 68 C6 84 24 90 00 00 00 00 FF 15 ...L$h..$.......
00408F80 38 43 8A 00 8B C7 8B 8C 24 88 00 00 00 64 89 0D 8C......$....d..
00408F90 00 00 00 00 59 5F 5E 5D 5B 8B 4C 24 70 33 CC E8 ....Y_^][.L$p3..
00408FA0 EA BB 28 00 81 C4 80 00 00 00 C2 08 00 CC CC CC ..(.............

;; fn00408FB0: 00408FB0
;;   Called from:
;;     004024CA (in fn004023A0)
;;     00402704 (in fn004023A0)
;;     00403D80 (in fn00403D10)
fn00408FB0 proc
	push	0FFh
	push	82C24Bh
	mov	eax,fs:[0000h]
	push	eax
	push	ecx
	mov	eax,[0A14188h]
	xor	eax,esp
	push	eax
	lea	eax,[esp+8h]
	mov	fs:[0000h],eax
	push	20h
	call	694FD8h
	add	esp,4h
	mov	[esp+4h],eax
	test	eax,eax
	mov	dword ptr [esp+10h],0h
	jz	409007h

l00408FEB:
	mov	ecx,[esp+18h]
	push	ecx
	mov	ecx,eax
	call	419D30h
	mov	ecx,[esp+8h]
	mov	fs:[0000h],ecx
	pop	ecx
	add	esp,10h
	ret

l00409007:
	xor	eax,eax
	mov	ecx,[esp+8h]
	mov	fs:[0000h],ecx
	pop	ecx
	add	esp,10h
	ret
00409019                            CC CC CC CC CC CC CC          .......
00409020 C7 01 5C 70 8A 00 C3 CC CC CC CC CC CC CC CC CC ..\p............
00409030 33 C0 C2 08 00 CC CC CC CC CC CC CC CC CC CC CC 3...............
00409040 F6 44 24 04 01 56 8B F1 C7 06 5C 70 8A 00 74 09 .D$..V....\p..t.
00409050 56 E8 70 BF 28 00 83 C4 04 8B C6 5E C2 04 00 CC V.p.(......^....
00409060 51 8B 41 08 85 C0 56 C7 44 24 04 00 00 00 00 74 Q.A...V.D$.....t
00409070 29 8B 51 0C 2B D0 C1 FA 02 74 1F 8B 08 8B 44 24 ).Q.+....t....D$
00409080 14 8B 11 8B 74 24 0C 8B 52 08 50 8B 44 24 14 50 ....t$..R.P.D$.P
00409090 56 FF D2 8B C6 5E 59 C2 0C 00 8B 74 24 0C 8B CE V....^Y....t$...
004090A0 FF 15 B0 43 8A 00 8B C6 5E 59 C2 0C 00 CC CC CC ...C....^Y......

;; fn004090B0: 004090B0
;;   Called from:
;;     00409B09 (in fn00409AC0)
fn004090B0 proc
	push	0FFh
	push	82C279h
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
	push	82C2A9h
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

;; fn00409170: 00409170
;;   Called from:
;;     0040861E (in fn004085A0)
;;     004086A9 (in fn004085A0)
;;     0040916F (in fn004090B0)
fn00409170 proc
	push	ebx
	mov	ebx,[esp+0Ch]
	push	esi
	mov	esi,[esp+0Ch]
	cmp	esi,ebx
	push	edi
	mov	edi,[esp+18h]
	jz	409196h

l00409183:
	push	esi
	mov	ecx,edi
	call	dword ptr [8A4358h]
	add	esi,1Ch
	add	edi,1Ch
	cmp	esi,ebx
	jnz	409183h

l00409196:
	mov	eax,edi
	pop	edi
	pop	esi
	pop	ebx
	ret
0040919C                                     CC CC CC CC             ....

;; fn004091A0: 004091A0
;;   Called from:
;;     00409D5E (in fn00409CE0)
fn004091A0 proc
	push	ebp
	mov	ebp,esp
	push	0FFh
	push	82C2E1h
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,0Ch
	push	ebx
	push	esi
	push	edi
	mov	eax,[0A14188h]
	xor	eax,ebp
	push	eax
	lea	eax,[ebp-0Ch]
	mov	fs:[0000h],eax
	mov	[ebp-10h],esp
	mov	esi,[ebp+10h]
	mov	edi,[ebp+8h]
	xor	ebx,ebx
	mov	[ebp-14h],esi
	mov	[ebp-4h],ebx
	lea	esp,[esp+0h]

l004091E0:
	cmp	edi,[ebp+0Ch]
	jz	40922Ch

l004091E5:
	mov	[ebp+8h],esi
	mov	[ebp-18h],esi
	cmp	esi,ebx
	mov	byte ptr [ebp-4h],1h
	jz	4091FCh

l004091F3:
	push	edi
	mov	ecx,esi
	call	dword ptr [8A433Ch]

l004091FC:
	add	esi,1Ch
	mov	[ebp-4h],bl
	mov	[ebp+10h],esi
	add	edi,1Ch
	jmp	4091E0h
0040920A                               8B 75 EC 8B 7D 10           .u..}.
00409210 3B F7 74 0F 8B CE FF 15 38 43 8A 00 83 C6 1C 3B ;.t.....8C.....;
00409220 F7 75 F1 33 DB 53 53 E8 A0 BD 28 00             .u.3.SS...(.   

l0040922C:
	mov	eax,esi
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret
00409240 55 8B EC 6A FF 68 11 C3 82 00 64 A1 00 00 00 00 U..j.h....d.....
00409250 50 83 EC 0C 53 56 57 A1 88 41 A1 00 33 C5 50 8D P...SVW..A..3.P.
00409260 45 F4 64 A3 00 00 00 00 89 65 F0 8B 75 10 8B 7D E.d......e..u..}
00409270 08 33 DB 89 75 EC 89 5D FC 8D A4 24 00 00 00 00 .3..u..]...$....
00409280 3B 7D 0C 74 47 89 75 08 89 75 E8 3B F3 C6 45 FC ;}.tG.u..u.;..E.
00409290 01 74 09 57 8B CE FF 15 3C 43 8A 00 83 C6 1C 88 .t.W....<C......
004092A0 5D FC 89 75 10 83 C7 1C EB D6 8B 75 EC 8B 7D 10 ]..u.......u..}.
004092B0 3B F7 74 0F 8B CE FF 15 38 43 8A 00 83 C6 1C 3B ;.t.....8C.....;
004092C0 F7 75 F1 33 DB 53 53 E8 00 BD 28 00 8B C6 8B 4D .u.3.SS...(....M
004092D0 F4 64 89 0D 00 00 00 00 59 5F 5E 5B 8B E5 5D C3 .d......Y_^[..].
004092E0 53 55 8B E9 56 8B 75 08 3B 75 0C 57 74 1F 8B 7C SU..V.u.;u.Wt..|
004092F0 24 18 8B 5C 24 14 8B 0E 8B 01 8B 50 04 57 53 FF $..\$......P.WS.
00409300 D2 85 C0 75 0A 83 C6 04 3B 75 0C 75 E9 33 C0 5F ...u....;u.u.3._
00409310 5E 5D 5B C2 08 00 CC CC CC CC CC CC CC CC CC CC ^][.............
00409320 6A FF 68 38 C3 82 00 64 A1 00 00 00 00 50 51 55 j.h8...d.....PQU
00409330 56 57 A1 88 41 A1 00 33 C4 50 8D 44 24 14 64 A3 VW..A..3.P.D$.d.
00409340 00 00 00 00 8B F9 8B 77 08 3B 77 0C C7 44 24 10 .......w.;w..D$.
00409350 00 00 00 00 74 35 8B 6C 24 28 8D 9B 00 00 00 00 ....t5.l$(......
00409360 8B 0E 8B 01 8B 40 10 55 8D 54 24 2C 52 FF D0 8B .....@.U.T$,R...
00409370 44 24 28 85 C0 C7 44 24 1C FF FF FF FF 75 2B 83 D$(...D$.....u+.
00409380 C6 04 3B 77 0C 89 44 24 28 75 D5 8B 44 24 24 C7 ..;w..D$(u..D$$.
00409390 00 00 00 00 00 8B 4C 24 14 64 89 0D 00 00 00 00 ......L$.d......
004093A0 59 5F 5E 5D 83 C4 10 C2 08 00 83 40 04 01 8B 74 Y_^].......@...t
004093B0 24 24 89 06 8B 44 24 28 83 40 04 FF 8B C8 83 C0 $$...D$(.@......
004093C0 04 83 38 00 75 08 8B 11 8B 02 6A 01 FF D0 8B C6 ..8.u.....j.....
004093D0 8B 4C 24 14 64 89 0D 00 00 00 00 59 5F 5E 5D 83 .L$.d......Y_^].
004093E0 C4 10 C2 08 00 CC CC CC CC CC CC CC CC CC CC CC ................
004093F0 53 56 57 8B F9 8B 77 08 3B 77 0C 74 1A 8B 5C 24 SVW...w.;w.t..\$
00409400 10 8B 0E 8B 01 8B 50 14 53 FF D2 84 C0 75 10 83 ......P.S....u..
00409410 C6 04 3B 77 0C 75 EA 5F 5E 32 C0 5B C2 04 00 5F ..;w.u._^2.[..._
00409420 5E B0 01 5B C2 04 00 CC CC CC CC CC CC CC CC CC ^..[............
00409430 6A FF 68 68 C3 82 00 64 A1 00 00 00 00 50 53 55 j.hh...d.....PSU
00409440 56 57 A1 88 41 A1 00 33 C4 50 8D 44 24 14 64 A3 VW..A..3.P.D$.d.
00409450 00 00 00 00 8B E9 8B 7D 08 8B 45 0C 3B F8 8B 74 .......}..E.;..t
00409460 24 28 C7 44 24 1C 00 00 00 00 74 30 8B 5C 24 2C $(.D$.....t0.\$,
00409470 85 F6 8B 0F 53 51 8B C4 89 64 24 34 89 30 74 04 ....SQ...d$4.0t.
00409480 83 46 04 01 8B 01 8B 54 24 2C 8B 40 18 52 FF D0 .F.....T$,.@.R..
00409490 84 C0 75 3A 83 C7 04 3B 7D 0C 75 D4 83 C8 FF 85 ..u:...;}.u.....
004094A0 F6 89 44 24 1C 74 0F 01 46 04 75 0A 8B 16 8B 02 ..D$.t..F.u.....
004094B0 6A 01 8B CE FF D0 32 C0 8B 4C 24 14 64 89 0D 00 j.....2..L$.d...
004094C0 00 00 00 59 5F 5E 5D 5B 83 C4 0C C2 0C 00 83 C8 ...Y_^][........
004094D0 FF 85 F6 89 44 24 1C 74 0F 01 46 04 75 0A 8B 16 ....D$.t..F.u...
004094E0 8B 02 6A 01 8B CE FF D0 B0 01 EB CC CC CC CC CC ..j.............
004094F0 53 55 56 57 8B F9 8B 77 08 3B 77 0C 74 1F 8B 5C SUVW...w.;w.t..\
00409500 24 18 8B 6C 24 14 8B 0E 8B 01 8B 50 1C 53 55 FF $..l$......P.SU.
00409510 D2 84 C0 75 11 83 C6 04 3B 77 0C 75 E9 5F 5E 5D ...u....;w.u._^]
00409520 32 C0 5B C2 08 00 5F 5E 5D B0 01 5B C2 08 00 CC 2.[..._^]..[....
00409530 53 56 57 8B F9 8B 77 08 3B 77 0C 74 1A 8B 5C 24 SVW...w.;w.t..\$
00409540 10 8B 0E 8B 01 8B 50 20 53 FF D2 84 C0 75 10 83 ......P S....u..
00409550 C6 04 3B 77 0C 75 EA 5F 5E 32 C0 5B C2 04 00 5F ..;w.u._^2.[..._
00409560 5E B0 01 5B C2 04 00 CC CC CC CC CC CC CC CC CC ^..[............
00409570 56 57 8B F9 8B 77 08 33 C0 3B 77 0C 74 23 53 8B VW...w.3.;w.t#S.
00409580 5C 24 14 55 8B 6C 24 14 8B 0E 8B 01 8B 50 24 53 \$.U.l$......P$S
00409590 55 FF D2 85 C0 75 08 83 C6 04 3B 77 0C 75 E9 5D U....u....;w.u.]
004095A0 5B 5F 5E C2 08 00 CC CC CC CC CC CC CC CC CC CC [_^.............
004095B0 51 8B 54 24 10 C6 04 24 00 8B 04 24 50 8B 44 24 Q.T$...$...$P.D$
004095C0 14 52 8B 54 24 10 51 8B 4C 24 18 50 51 52 E8 CD .R.T$.Q.L$.PQR..
004095D0 FB FF FF 83 C4 1C C2 0C 00 CC CC CC CC CC CC CC ................
004095E0 51 8B 54 24 10 C6 04 24 00 8B 04 24 50 8B 44 24 Q.T$...$...$P.D$
004095F0 14 52 8B 54 24 10 51 8B 4C 24 18 50 51 52 E8 3D .R.T$.Q.L$.PQR.=
00409600 FC FF FF 83 C4 1C C2 0C 00 CC CC CC CC CC CC CC ................

;; fn00409610: 00409610
;;   Called from:
;;     00402434 (in fn004023A0)
fn00409610 proc
	push	0FFh
	push	82C398h
	mov	eax,fs:[0000h]
	push	eax
	push	ecx
	mov	eax,[0A14188h]
	xor	eax,esp
	push	eax
	lea	eax,[esp+8h]
	mov	fs:[0000h],eax
	mov	eax,ecx
	xor	ecx,ecx
	mov	dword ptr [eax],8A7088h
	mov	[eax+8h],ecx
	mov	[eax+0Ch],ecx
	mov	[eax+10h],ecx
	mov	ecx,[esp+8h]
	mov	fs:[0000h],ecx
	pop	ecx
	add	esp,10h
	ret
00409654             CC CC CC CC CC CC CC CC CC CC CC CC     ............
00409660 56 57 8B F9 8B 77 08 3B 77 0C 74 1A 8D 64 24 00 VW...w.;w.t..d$.
00409670 8B 0E 85 C9 74 08 8B 01 8B 10 6A 01 FF D2 83 C6 ....t.....j.....
00409680 04 3B 77 0C 75 EA 8B 4F 0C 8B 77 08 3B F1 74 27 .;w.u..O..w.;.t'
00409690 8B C1 2B C1 C1 F8 02 85 C0 8D 14 85 00 00 00 00 ..+.............
004096A0 53 8D 1C 32 7E 0D 52 51 52 56 FF 15 5C 46 8A 00 S..2~.RQRV..\F..
004096B0 83 C4 10 89 5F 0C 5B 5F 5E C3 CC CC CC CC CC CC ...._.[_^.......
004096C0 55 8B EC 6A FF 68 C0 C3 82 00 64 A1 00 00 00 00 U..j.h....d.....
004096D0 50 83 EC 18 53 56 57 A1 88 41 A1 00 33 C5 50 8D P...SVW..A..3.P.
004096E0 45 F4 64 A3 00 00 00 00 89 65 F0 8B F1 89 75 E0 E.d......e....u.
004096F0 8B 4D 10 2B 4D 0C B8 93 24 49 92 F7 E9 03 D1 8B .M.+M...$I......
00409700 4E 04 C1 FA 04 8B FA C1 EF 1F 03 FA 85 C9 89 7D N..............}
00409710 E4 75 05 89 4D EC EB 1B 8B 5E 0C 2B D9 B8 93 24 .u..M....^.+...$
00409720 49 92 F7 EB 03 D3 C1 FA 04 8B C2 C1 E8 1F 03 C2 I...............
00409730 89 45 EC 85 FF 0F 84 E7 02 00 00 85 C9 75 04 33 .E...........u.3
00409740 C0 EB 18 8B 5E 08 2B D9 B8 93 24 49 92 F7 EB 03 ....^.+...$I....
00409750 D3 C1 FA 04 8B C2 C1 E8 1F 03 C2 BA 49 92 24 09 ............I.$.
00409760 2B D0 3B D7 73 05 E8 05 83 FF FF 85 C9 75 04 33 +.;.s........u.3
00409770 C0 EB 18 8B 5E 08 2B D9 B8 93 24 49 92 F7 EB 03 ....^.+...$I....
00409780 D3 C1 FA 04 8B C2 C1 E8 1F 03 C2 8B 55 EC 03 C7 ............U...
00409790 3B D0 0F 83 6A 01 00 00 8B C2 D1 E8 BB 49 92 24 ;...j........I.$
004097A0 09 2B D8 3B DA 73 09 C7 45 EC 00 00 00 00 EB 05 .+.;.s..E.......
004097B0 03 D0 89 55 EC 85 C9 75 04 33 C0 EB 18 8B 5E 08 ...U...u.3....^.
004097C0 2B D9 B8 93 24 49 92 F7 EB 03 D3 C1 FA 04 8B C2 +...$I..........
004097D0 C1 E8 1F 03 C2 03 C7 39 45 EC 73 0C 8B CE E8 4D .......9E.s....M
004097E0 41 00 00 03 C7 89 45 EC 8B 45 EC 6A 00 50 E8 ED A.....E..E.j.P..
004097F0 45 00 00 8B 5D 08 8B 4E 04 C6 45 DC 00 8B 55 DC E...]..N..E...U.
00409800 52 8B 55 08 52 56 50 53 51 89 45 E4 89 45 E8 C7 R.U.RVPSQ.E..E..
00409810 45 FC 00 00 00 00 E8 35 89 FF FF 83 C4 20 C6 45 E......5..... .E
00409820 08 00 8B 4D 08 8B 55 08 51 8B 4D 0C 52 56 50 89 ...M..U.Q.M.RVP.
00409830 45 E8 8B 45 10 50 51 E8 04 FA FF FF 8B 4E 08 83 E..E.PQ......N..
00409840 C4 18 C6 45 08 00 8B 55 08 52 8B 55 08 52 56 50 ...E...U.R.U.RVP
00409850 51 53 89 45 E8 E8 F6 88 FF FF 8B 5E 04 83 C4 18 QS.E.......^....
00409860 85 DB C7 45 FC FF FF FF FF 75 04 33 C0 EB 18 8B ...E.....u.3....
00409870 4E 08 2B CB B8 93 24 49 92 F7 E9 03 D1 C1 FA 04 N.+...$I........
00409880 8B C2 C1 E8 1F 03 C2 03 F8 85 DB 74 18 8B 46 08 ...........t..F.
00409890 50 53 8B CE E8 57 9B FF FF 8B 4E 04 51 E8 24 B7 PS...W....N.Q.$.
004098A0 28 00 83 C4 04 8B 45 EC 8D 14 C5 00 00 00 00 2B (.....E........+
004098B0 D0 8B 45 E4 8D 0C 90 8D 14 FD 00 00 00 00 2B D7 ..E...........+.
004098C0 89 4E 0C 8D 0C 90 89 4E 08 89 46 04 8B 4D F4 64 .N.....N..F..M.d
004098D0 89 0D 00 00 00 00 59 5F 5E 5B 8B E5 5D C2 10 00 ......Y_^[..]...
004098E0 8B 55 E8 8B 75 E4 8B 4D E0 52 56 E8 00 9B FF FF .U..u..M.RV.....
004098F0 56 E8 D0 B6 28 00 83 C4 04 6A 00 6A 00 E8 CA B6 V...(....j.j....
00409900 28 00 8B 4E 08 8B D9 2B 5D 08 B8 93 24 49 92 F7 (..N...+]...$I..
00409910 EB 03 D3 C1 FA 04 8B C2 C1 E8 1F 03 C2 3B C7 89 .............;..
00409920 4D DC 0F 83 BD 00 00 00 8B 45 08 8D 1C FD 00 00 M........E......
00409930 00 00 2B DF 03 DB 03 DB 8D 14 03 52 51 50 8B CE ..+........RQP..
00409940 E8 3B 95 FF FF 8B 7E 08 8B CF 2B 4D 08 B8 93 24 .;....~...+M...$
00409950 49 92 F7 E9 03 D1 C1 FA 04 8B C2 C1 E8 1F 03 C2 I...............
00409960 8B 55 0C 8D 0C C5 00 00 00 00 2B C8 8D 04 8A 8B .U........+.....
00409970 4D 10 57 51 50 8B CE 89 45 DC C7 45 FC 02 00 00 M.WQP...E..E....
00409980 00 E8 5A FC FF FF 8B 55 08 8B 45 DC 8B 4D 0C 01 ..Z....U..E..M..
00409990 5E 08 52 50 51 C7 45 FC FF FF FF FF E8 CF F7 FF ^.RPQ.E.........
004099A0 FF 83 C4 0C 8B 4D F4 64 89 0D 00 00 00 00 59 5F .....M.d......Y_
004099B0 5E 5B 8B E5 5D C2 10 00 8B 4D E4 8D 04 CD 00 00 ^[..]....M......
004099C0 00 00 2B C1 8B 4D E0 8B 51 08 03 C0 03 C0 03 D0 ..+..M..Q.......
004099D0 52 8B 55 08 03 C2 50 E8 14 9A FF FF 6A 00 6A 00 R.U...P.....j.j.
004099E0 E8 E7 B5 28 00 8D 04 FD 00 00 00 00 2B C7 03 C0 ...(........+...
004099F0 51 8B F9 03 C0 51 2B F8 57 8B CE E8 80 94 FF FF Q....Q+.W.......
00409A00 8B 4D DC 51 89 46 08 8B 75 08 57 56 E8 0F 87 FF .M.Q.F..u.WV....
00409A10 FF 8B 55 10 8B 45 0C 56 52 50 E8 51 F7 FF FF 83 ..U..E.VRP.Q....
00409A20 C4 18 8B 4D F4 64 89 0D 00 00 00 00 59 5F 5E 5B ...M.d......Y_^[
00409A30 8B E5 5D C2 10 00 CC CC CC CC CC CC CC CC CC CC ..].............
00409A40 6A FF 68 F3 C3 82 00 64 A1 00 00 00 00 50 51 56 j.h....d.....PQV
00409A50 A1 88 41 A1 00 33 C4 50 8D 44 24 0C 64 A3 00 00 ..A..3.P.D$.d...
00409A60 00 00 8B F1 89 74 24 08 C7 06 88 70 8A 00 C7 44 .....t$....p...D
00409A70 24 14 01 00 00 00 E8 E5 FB FF FF 8B 46 08 85 C0 $...........F...
00409A80 74 09 50 E8 3E B5 28 00 83 C4 04 C7 46 08 00 00 t.P.>.(.....F...
00409A90 00 00 C7 46 0C 00 00 00 00 C7 46 10 00 00 00 00 ...F......F.....
00409AA0 C7 06 5C 70 8A 00 8B 4C 24 0C 64 89 0D 00 00 00 ..\p...L$.d.....
00409AB0 00 59 5E 83 C4 10 C3 CC CC CC CC CC CC CC CC CC .Y^.............

;; fn00409AC0: 00409AC0
;;   Called from:
;;     00409EE4 (in fn00409EA0)
;;     00409FA9 (in fn00409F70)
fn00409AC0 proc
	mov	eax,[esp+0Ch]
	push	ebx
	push	esi
	mov	esi,ecx
	mov	ecx,[eax]
	mov	[esp+14h],ecx
	mov	ecx,[esi+4h]
	test	ecx,ecx
	push	edi
	jnz	409ADAh

l00409AD6:
	xor	edi,edi
	jmp	409AE2h

l00409ADA:
	mov	edi,[esi+0Ch]
	sub	edi,ecx
	sar	edi,2h

l00409AE2:
	mov	ebx,[esp+14h]
	test	ebx,ebx
	jz	409C6Fh

l00409AEE:
	test	ecx,ecx
	jnz	409AF6h

l00409AF2:
	xor	eax,eax
	jmp	409AFEh

l00409AF6:
	mov	eax,[esi+8h]
	sub	eax,ecx
	sar	eax,2h

l00409AFE:
	mov	edx,3FFFFFFFh
	sub	edx,eax
	cmp	edx,ebx
	jnc	409B0Eh

l00409B09:
	call	4090B0h

l00409B0E:
	test	ecx,ecx
	jnz	409B16h

l00409B12:
	xor	eax,eax
	jmp	409B1Eh

l00409B16:
	mov	eax,[esi+8h]
	sub	eax,ecx
	sar	eax,2h

l00409B1E:
	add	eax,ebx
	cmp	edi,eax
	push	ebp
	jnc	409BDDh

l00409B29:
	mov	eax,edi
	shr	eax,1h
	mov	edx,3FFFFFFFh
	sub	edx,eax
	cmp	edx,edi
	jnc	409B3Ch

l00409B38:
	xor	edi,edi
	jmp	409B3Eh

l00409B3C:
	add	edi,eax

l00409B3E:
	test	ecx,ecx
	jnz	409B46h

l00409B42:
	xor	eax,eax
	jmp	409B4Eh

l00409B46:
	mov	eax,[esi+8h]
	sub	eax,ecx
	sar	eax,2h

l00409B4E:
	add	eax,ebx
	cmp	edi,eax
	jnc	409B66h

l00409B54:
	test	ecx,ecx
	jnz	409B5Ch

l00409B58:
	xor	edi,edi
	jmp	409B64h

l00409B5C:
	mov	edi,[esi+8h]
	sub	edi,ecx
	sar	edi,2h

l00409B64:
	add	edi,ebx

l00409B66:
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
	jnz	409BAEh

l00409BAA:
	xor	ecx,ecx
	jmp	409BB6h

l00409BAE:
	mov	ecx,[esi+8h]
	sub	ecx,eax
	sar	ecx,2h

l00409BB6:
	add	ebx,ecx
	test	eax,eax
	jz	409BC5h

l00409BBC:
	push	eax
	call	694FC6h
	add	esp,4h

l00409BC5:
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

l00409BDD:
	mov	ebp,[esi+8h]
	mov	edi,[esp+14h]
	mov	ecx,ebp
	sub	ecx,edi
	sar	ecx,2h
	lea	eax,[0000h+ebx*4]
	cmp	ecx,ebx
	mov	[esp+14h],eax
	mov	ecx,esi
	jnc	409C42h

l00409BFC:
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

l00409C42:
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

l00409C6F:
	pop	edi
	pop	esi
	pop	ebx
	ret	0Ch
00409C75                CC CC CC CC CC CC CC CC CC CC CC      ...........

;; fn00409C80: 00409C80
;;   Called from:
;;     007B2EA8 (in fn007B2D10)
fn00409C80 proc
	push	esi
	mov	esi,[esp+8h]
	push	edi
	mov	edi,[esp+10h]
	cmp	esi,edi
	jz	409CB1h

l00409C8E:
	mov	edi,edi

l00409C90:
	mov	ecx,[esi]
	test	ecx,ecx
	jz	409CA4h

l00409C96:
	add	dword ptr [ecx+4h],0FFh
	jnz	409CA4h

l00409C9C:
	mov	eax,[ecx]
	mov	edx,[eax]
	push	1h
	call	edx

l00409CA4:
	mov	dword ptr [esi],0h
	add	esi,4h
	cmp	esi,edi
	jnz	409C90h

l00409CB1:
	pop	edi
	pop	esi
	ret
00409CB4             CC CC CC CC CC CC CC CC CC CC CC CC     ............
00409CC0 56 8B F1 E8 78 FD FF FF F6 44 24 08 01 74 09 56 V...x....D$..t.V
00409CD0 E8 F1 B2 28 00 83 C4 04 8B C6 5E C2 04 00 CC CC ...(......^.....

;; fn00409CE0: 00409CE0
;;   Called from:
;;     0040BDE3 (in fn0040BDA0)
;;     0040BE43 (in fn0040BE00)
fn00409CE0 proc
	push	ebp
	mov	ebp,esp
	push	0FFh
	push	82C410h
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
	mov	edi,ecx
	mov	[ebp-14h],edi
	mov	esi,[ebp+8h]
	mov	eax,[esi+4h]
	test	eax,eax
	jz	409D32h

l00409D1A:
	mov	ecx,[esi+8h]
	sub	ecx,eax
	mov	eax,92492493h
	imul	ecx
	add	edx,ecx
	sar	edx,4h
	mov	eax,edx
	shr	eax,1Fh
	add	eax,edx

l00409D32:
	push	eax
	mov	ecx,edi
	call	401EC0h
	test	al,al
	jz	409D69h

l00409D3E:
	mov	ecx,[edi+4h]
	mov	eax,[esi+8h]
	mov	esi,[esi+4h]
	mov	byte ptr [ebp+8h],0h
	mov	edx,[ebp+8h]
	push	edx
	mov	edx,[ebp+8h]
	push	edx
	push	edi
	push	ecx
	push	eax
	push	esi
	mov	dword ptr [ebp-4h],0h
	call	4091A0h
	add	esp,18h
	mov	[edi+8h],eax

l00409D69:
	mov	eax,edi
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret	4h
00409D7F                                              8B                .
00409D80 4D EC E8 79 9B FF FF 6A 00 6A 00 E8 3C B2 28 00 M..y...j.j..<.(.
00409D90 CC CC CC CC CC CC CC CC CC CC CC CC CC CC CC CC ................
00409DA0 6A FF 68 51 C4 82 00 64 A1 00 00 00 00 50 83 EC j.hQ...d.....P..
00409DB0 1C 53 55 56 57 A1 88 41 A1 00 33 C4 50 8D 44 24 .SUVW..A..3.P.D$
00409DC0 30 64 A3 00 00 00 00 89 4C 24 1C 33 DB 89 5C 24 0d......L$.3..\$
00409DD0 14 8B 7C 24 40 89 5F 04 89 5F 08 89 5F 0C 8B 69 ..|$@._.._.._..i
00409DE0 08 3B 69 0C 89 5C 24 38 C7 44 24 14 01 00 00 00 .;i..\$8.D$.....
00409DF0 0F 84 88 00 00 00 8B 54 24 44 8B 4D 00 8B 01 8B .......T$D.M....
00409E00 40 0C 52 8D 54 24 24 52 FF D0 8B 4C 24 40 8B 54 @.R.T$$R...L$@.T
00409E10 24 28 8B 47 08 51 8B 4C 24 28 52 51 50 8B CF C7 $(.G.Q.L$(RQP...
00409E20 44 24 48 01 00 00 00 E8 94 F8 FF FF 8B 74 24 24 D$H..........t$$
00409E30 3B F3 88 5C 24 38 74 2A 8B 44 24 28 3B F0 89 44 ;..\$8t*.D$(;..D
00409E40 24 18 74 15 8B CE FF 15 38 43 8A 00 83 C6 1C 3B $.t.....8C.....;
00409E50 74 24 18 75 EF 8B 74 24 24 56 E8 67 B1 28 00 83 t$.u..t$$V.g.(..
00409E60 C4 04 8B 54 24 1C 83 C5 04 3B 6A 0C 89 5C 24 24 ...T$....;j..\$$
00409E70 89 5C 24 28 89 5C 24 2C 0F 85 78 FF FF FF 8B C7 .\$(.\$,..x.....
00409E80 8B 4C 24 30 64 89 0D 00 00 00 00 59 5F 5E 5D 5B .L$0d......Y_^][
00409E90 83 C4 28 C2 08 00 CC CC CC CC CC CC CC CC CC CC ..(.............

;; fn00409EA0: 00409EA0
;;   Called from:
;;     00409F92 (in fn00409F70)
fn00409EA0 proc
	push	esi
	mov	esi,[ecx+4h]
	test	esi,esi
	jnz	409EACh

l00409EA8:
	xor	edx,edx
	jmp	409EB4h

l00409EAC:
	mov	edx,[ecx+8h]
	sub	edx,esi
	sar	edx,2h

l00409EB4:
	test	esi,esi
	jz	409ED9h

l00409EB8:
	mov	eax,[ecx+0Ch]
	sub	eax,esi
	sar	eax,2h
	cmp	edx,eax
	jnc	409ED9h

l00409EC4:
	mov	eax,[ecx+8h]
	mov	edx,[esp+8h]
	mov	edx,[edx]
	mov	[eax],edx
	add	eax,4h
	mov	[ecx+8h],eax
	pop	esi
	ret	4h

l00409ED9:
	mov	edx,[esp+8h]
	mov	eax,[ecx+8h]
	push	edx
	push	1h
	push	eax
	call	409AC0h
	pop	esi
	ret	4h
00409EED                                        CC CC CC              ...
00409EF0 53 55 8B 6C 24 0C 8B 5D 08 3B 5D 0C 74 5E 56 57 SU.l$..].;].t^VW
00409F00 8D 71 04 8B 0B 8B 01 8B 50 28 FF D2 8B 56 04 85 .q......P(...V..
00409F10 D2 89 44 24 14 75 04 33 FF EB 08 8B 7E 08 2B FA ..D$.u.3....~.+.
00409F20 C1 FF 02 85 D2 74 19 8B 4E 0C 2B CA C1 F9 02 3B .....t..N.+....;
00409F30 F9 73 0D 8B 4E 08 89 01 83 C1 04 89 4E 08 EB 12 .s..N.......N...
00409F40 8B 46 08 8D 4C 24 14 51 6A 01 50 8B CE E8 6E FB .F..L$.Qj.P...n.
00409F50 FF FF 83 C3 04 3B 5D 0C 75 A9 5F 5E 5D 5B C2 04 .....;].u._^][..
00409F60 00 CC CC CC CC CC CC CC CC CC CC CC CC CC CC CC ................

;; fn00409F70: 00409F70
;;   Called from:
;;     00402710 (in fn004023A0)
fn00409F70 proc
	push	esi
	mov	esi,ecx
	mov	edx,[esi+8h]
	test	edx,edx
	lea	ecx,[esi+4h]
	jz	409F8Dh

l00409F7D:
	mov	eax,[ecx+8h]
	sub	eax,edx
	mov	edx,[esp+0Ch]
	sar	eax,2h
	cmp	edx,eax
	jc	409F9Bh

l00409F8D:
	lea	eax,[esp+8h]
	push	eax
	call	409EA0h
	pop	esi
	ret	8h

l00409F9B:
	mov	eax,[esi+8h]
	lea	eax,[eax+edx*4]
	lea	edx,[esp+8h]
	push	edx
	push	1h
	push	eax
	call	409AC0h
	pop	esi
	ret	8h
00409FB2       CC CC CC CC CC CC CC CC CC CC CC CC CC CC   ..............
00409FC0 6A FF 68 83 C4 82 00 64 A1 00 00 00 00 50 51 56 j.h....d.....PQV
00409FD0 A1 88 41 A1 00 33 C4 50 8D 44 24 0C 64 A3 00 00 ..A..3.P.D$.d...
00409FE0 00 00 8B F1 89 74 24 08 33 C0 C7 06 88 70 8A 00 .....t$.3....p..
00409FF0 89 44 24 14 89 46 08 89 46 0C 89 46 10 8B 44 24 .D$..F..F..F..D$
0040A000 1C 50 C6 44 24 18 01 E8 E4 FE FF FF 8B C6 8B 4C .P.D$..........L
0040A010 24 0C 64 89 0D 00 00 00 00 59 5E 83 C4 10 C2 04 $.d......Y^.....
0040A020 00 CC CC CC CC CC CC CC CC CC CC CC CC CC CC CC ................
0040A030 6A FF 68 AB C4 82 00 64 A1 00 00 00 00 50 51 56 j.h....d.....PQV
0040A040 A1 88 41 A1 00 33 C4 50 8D 44 24 0C 64 A3 00 00 ..A..3.P.D$.d...
0040A050 00 00 8B F1 6A 14 E8 7D AF 28 00 83 C4 04 89 44 ....j..}.(.....D
0040A060 24 08 85 C0 C7 44 24 14 00 00 00 00 74 19 56 8B $....D$.....t.V.
0040A070 C8 E8 4A FF FF FF 8B 4C 24 0C 64 89 0D 00 00 00 ..J....L$.d.....
0040A080 00 59 5E 83 C4 10 C3 33 C0 8B 4C 24 0C 64 89 0D .Y^....3..L$.d..
0040A090 00 00 00 00 59 5E 83 C4 10 C3 CC CC CC CC CC CC ....Y^..........
0040A0A0 55 8B EC 6A FF 68 D8 C4 82 00 64 A1 00 00 00 00 U..j.h....d.....
0040A0B0 50 83 EC 18 53 56 57 A1 88 41 A1 00 33 C5 50 8D P...SVW..A..3.P.
0040A0C0 45 F4 64 A3 00 00 00 00 89 65 F0 8B F1 89 75 E4 E.d......e....u.
0040A0D0 8B 45 10 8B 00 85 C0 89 45 EC 74 04 83 40 04 01 .E......E.t..@..
0040A0E0 8B 4E 04 85 C9 C7 45 FC 00 00 00 00 75 04 33 FF .N....E.....u.3.
0040A0F0 EB 08 8B 7E 0C 2B F9 C1 FF 02 8B 55 0C 85 D2 89 ...~.+.....U....
0040A100 7D 10 0F 84 2B 02 00 00 85 C9 75 04 33 C0 EB 08 }...+.....u.3...
0040A110 8B 46 08 2B C1 C1 F8 02 BB FF FF FF 3F 2B D8 3B .F.+........?+.;
0040A120 DA 73 05 E8 E8 EF FF FF 85 C9 75 04 33 C0 EB 08 .s........u.3...
0040A130 8B 46 08 2B C1 C1 F8 02 03 C2 3B F8 0F 83 25 01 .F.+......;...%.
0040A140 00 00 8B C7 D1 E8 BF FF FF FF 3F 2B F8 3B 7D 10 ..........?+.;}.
0040A150 73 09 C7 45 10 00 00 00 00 EB 03 01 45 10 85 C9 s..E........E...
0040A160 75 04 33 C0 EB 08 8B 46 08 2B C1 C1 F8 02 03 C2 u.3....F.+......
0040A170 39 45 10 73 15 85 C9 75 04 33 C0 EB 08 8B 46 08 9E.s...u.3....F.
0040A180 2B C1 C1 F8 02 03 C2 89 45 10 8B 4D 10 6A 00 51 +.......E..M.j.Q
0040A190 E8 EB 82 3A 00 8B 4D 0C 8B 5D 08 C6 45 E0 00 8B ...:..M..]..E...
0040A1A0 55 E0 52 51 8B F8 8B 46 04 56 57 53 50 89 7D DC U.RQ...F.VWSP.}.
0040A1B0 89 7D E8 C6 45 FC 01 E8 34 1D 15 00 8B 4D 0C 83 .}..E...4....M..
0040A1C0 C4 20 8D 55 EC 52 51 50 8B CE 89 45 E8 E8 CE 9E . .U.RQP...E....
0040A1D0 1B 00 8B 4E 08 C6 45 08 00 8B 55 08 52 8B 55 0C ...N..E...U.R.U.
0040A1E0 52 56 50 51 53 89 45 E8 E8 03 1D 15 00 8B 4E 04 RVPQS.E.......N.
0040A1F0 83 C4 18 85 C9 C7 45 FC 00 00 00 00 75 04 33 C0 ......E.....u.3.
0040A200 EB 08 8B 46 08 2B C1 C1 F8 02 8B 5D 0C 03 D8 85 ...F.+.....]....
0040A210 C9 74 1B 8B 55 0C 8B 46 08 52 56 50 51 E8 5E FA .t..U..F.RVPQ.^.
0040A220 FF FF 8B 46 04 50 E8 9B AD 28 00 83 C4 14 8B 45 ...F.P...(.....E
0040A230 10 8D 0C 87 8D 14 9F 89 4E 0C 89 56 08 89 7E 04 ........N..V..~.
0040A240 E9 EB 00 00 00 8B 45 E8 8B 75 DC 8B 4D E4 50 56 ......E..u..M.PV
0040A250 E8 AB A6 18 00 56 E8 6B AD 28 00 83 C4 04 6A 00 .....V.k.(....j.
0040A260 6A 00 E8 65 AD 28 00 8B 5E 08 8B 7D 08 8B CB 2B j..e.(..^..}...+
0040A270 CF C1 F9 02 3B CA 73 7C 8D 04 95 00 00 00 00 89 ....;.s|........
0040A280 45 10 03 C7 50 53 57 8B CE E8 12 82 0E 00 8B 46 E...PSW........F
0040A290 08 8B 4D 0C 8D 55 EC 52 8B D0 2B D7 C1 FA 02 2B ..M..U.R..+....+
0040A2A0 CA 51 50 8B CE C6 45 FC 03 E8 F2 9D 1B 00 8B 45 .QP...E........E
0040A2B0 10 01 46 08 8B 76 08 2B F0 8D 45 EC 50 56 57 C7 ..F..v.+..E.PVW.
0040A2C0 45 FC 00 00 00 00 E8 75 FA 16 00 83 C4 0C EB 60 E......u.......`
0040A2D0 8B 45 0C 8B 4D E4 8B 51 08 03 C0 03 C0 03 D0 52 .E..M..Q.......R
0040A2E0 8B 55 08 03 C2 50 E8 15 A6 18 00 6A 00 6A 00 E8 .U...P.....j.j..
0040A2F0 D8 AC 28 00 8D 0C 95 00 00 00 00 53 8B C3 2B C1 ..(........S..+.
0040A300 53 89 4D 10 50 8B CE 89 45 0C E8 91 81 0E 00 89 S.M.P...E.......
0040A310 46 08 8B 45 0C 53 50 57 E8 73 8F 1B 00 8B 55 10 F..E.SPW.s....U.
0040A320 8D 4D EC 51 03 D7 52 57 E8 13 FA 16 00 83 C4 18 .M.Q..RW........
0040A330 8B 45 EC 83 C9 FF 85 C0 89 4D FC 74 0F 01 48 04 .E.......M.t..H.
0040A340 75 0A 8B 10 8B C8 8B 02 6A 01 FF D0 8B 4D F4 64 u.......j....M.d
0040A350 89 0D 00 00 00 00 59 5F 5E 5B 8B E5 5D C2 0C 00 ......Y_^[..]...
0040A360 51 56 8B F1 8B 56 04 85 D2 75 04 33 C9 EB 08 8B QV...V...u.3....
0040A370 4E 08 2B CA C1 F9 02 85 D2 74 3C 8B 46 0C 2B C2 N.+......t<.F.+.
0040A380 C1 F8 02 3B C8 73 30 8B 4C 24 0C 8B 54 24 0C 57 ...;.s0.L$..T$.W
0040A390 8B 7E 08 C6 44 24 08 00 8B 44 24 08 50 51 56 52 .~..D$...D$.PQVR
0040A3A0 6A 01 57 E8 F8 B8 0B 00 83 C4 18 83 C7 04 89 7E j.W............~
0040A3B0 08 5F 5E 59 C2 04 00 8B 4C 24 0C 8B 46 08 51 6A ._^Y....L$..F.Qj
0040A3C0 01 50 8B CE E8 D7 FC FF FF 5E 59 C2 04 00 CC CC .P.......^Y.....
0040A3D0 6A FF 68 08 C5 82 00 64 A1 00 00 00 00 50 53 55 j.h....d.....PSU
0040A3E0 56 57 A1 88 41 A1 00 33 C4 50 8D 44 24 14 64 A3 VW..A..3.P.D$.d.
0040A3F0 00 00 00 00 8B D9 8B 73 08 3B 73 0C 74 60 8B 6C .......s.;s.t`.l
0040A400 24 24 33 FF 8B 0E 8B 01 8B 40 10 55 8D 54 24 28 $$3......@.U.T$(
0040A410 52 FF D0 8B 44 24 24 3B C7 89 7C 24 1C 74 12 8D R...D$$;..|$.t..
0040A420 4C 24 24 51 8B 4C 24 2C E8 33 FF FF FF 8B 44 24 L$$Q.L$,.3....D$
0040A430 24 3B C7 C7 44 24 1C FF FF FF FF 74 15 83 40 04 $;..D$.....t..@.
0040A440 FF 8B C8 83 C0 04 39 38 75 08 8B 11 8B 02 6A 01 ......98u.....j.
0040A450 FF D0 83 C6 04 3B 73 0C 89 7C 24 24 75 A6 8B 4C .....;s..|$$u..L
0040A460 24 14 64 89 0D 00 00 00 00 59 5F 5E 5D 5B 83 C4 $.d......Y_^][..
0040A470 0C C2 08 00 CC CC CC CC CC CC CC CC CC CC CC CC ................

;; fn0040A480: 0040A480
;;   Called from:
;;     0040D042 (in fn0040CBA0)
;;     0040D086 (in fn0040CBA0)
;;     0040D195 (in fn0040CBA0)
fn0040A480 proc
	push	ecx
	push	ebx
	mov	ebx,[esp+0Ch]
	push	esi
	mov	esi,[esp+14h]
	push	edi
	mov	ecx,esi
	mov	dword ptr [esp+0Ch],0h
	call	dword ptr [8A4344h]
	add	eax,1h
	push	eax
	call	694B89h
	add	esp,4h
	mov	ecx,esi
	mov	edi,eax
	call	dword ptr [8A4354h]
	mov	edx,edi

l0040A4B4:
	mov	cl,[eax]
	mov	[edx],cl
	add	eax,1h
	add	edx,1h
	test	cl,cl
	jnz	40A4B4h

l0040A4C2:
	push	edi
	call	dword ptr [8A4654h]
	add	esp,4h
	push	edi
	mov	ecx,ebx
	call	dword ptr [8A4334h]
	push	edi
	call	69501Ah
	add	esp,4h
	pop	edi
	pop	esi
	mov	eax,ebx
	pop	ebx
	pop	ecx
	ret
0040A4E5                CC CC CC CC CC CC CC CC CC CC CC      ...........
0040A4F0 83 EC 28 A1 88 41 A1 00 33 C4 89 44 24 24 8B 4C ..(..A..3..D$$.L
0040A500 24 30 8B 54 24 34 8B C1 0F AC D0 10 0F B7 C0 C1 $0.T$4..........
0040A510 EA 10 0F B7 C0 56 8B D0 C1 EA 09 81 C2 BC 07 00 .....V..........
0040A520 00 52 0F B7 C9 8B D1 83 E2 1F 8B 74 24 34 03 D2 .R.........t$4..
0040A530 52 8B D1 C1 EA 05 83 E2 0F 52 C1 E9 0B 51 8B C8 R........R...Q..
0040A540 C1 E8 05 83 E0 0F 8B 14 85 E0 D0 A0 00 83 E1 1F ................
0040A550 51 52 68 D8 70 8A 00 8D 44 24 24 68 B8 70 8A 00 QRh.p...D$$h.p..
0040A560 50 C7 44 24 28 00 00 00 00 FF 15 50 46 8A 00 83 P.D$(......PF...
0040A570 C4 24 8D 4C 24 08 51 8B CE FF 15 34 43 8A 00 8B .$.L$.Q....4C...
0040A580 4C 24 28 8B C6 5E 33 CC E8 01 A6 28 00 83 C4 28 L$(..^3....(...(
0040A590 C2 0C 00 CC CC CC CC CC CC CC CC CC CC CC CC CC ................
0040A5A0 32 C0 C2 08 00 CC CC CC CC CC CC CC CC CC CC CC 2...............
0040A5B0 8B 44 24 04 8B 48 08 80 79 39 00 75 0E 8D 49 00 .D$..H..y9.u..I.
0040A5C0 8B C1 8B 48 08 80 79 39 00 74 F5 C3 CC CC CC CC ...H..y9.t......
0040A5D0 8B 44 24 04 8B 08 80 79 39 00 75 0E 8D 64 24 00 .D$....y9.u..d$.
0040A5E0 8B C1 8B 08 80 79 39 00 74 F6 C3 CC CC CC CC CC .....y9.t.......

;; fn0040A5F0: 0040A5F0
;;   Called from:
;;     0040C78E (in fn0040C710)
;;     0040C8BA (in fn0040C7F0)
fn0040A5F0 proc
	mov	eax,[ecx]
	cmp	byte ptr [eax+39h],0h
	jz	40A5FEh

l0040A5F8:
	mov	eax,[eax+8h]
	mov	[ecx],eax
	ret

l0040A5FE:
	mov	edx,[eax]
	cmp	byte ptr [edx+39h],0h
	jnz	40A61Eh

l0040A606:
	mov	eax,[edx+8h]
	cmp	byte ptr [eax+39h],0h
	jnz	40A61Bh

l0040A60F:
	nop

l0040A610:
	mov	edx,eax
	mov	eax,[edx+8h]
	cmp	byte ptr [eax+39h],0h
	jz	40A610h

l0040A61B:
	mov	[ecx],edx
	ret

l0040A61E:
	mov	eax,[eax+4h]
	cmp	byte ptr [eax+39h],0h
	jnz	40A638h

l0040A627:
	mov	edx,[ecx]
	cmp	edx,[eax]
	jnz	40A638h

l0040A62D:
	mov	[ecx],eax
	mov	eax,[eax+4h]
	cmp	byte ptr [eax+39h],0h
	jz	40A627h

l0040A638:
	mov	edx,[ecx]
	cmp	byte ptr [edx+39h],0h
	jnz	40A642h

l0040A640:
	mov	[ecx],eax

l0040A642:
	ret
0040A643          CC CC CC CC CC CC CC CC CC CC CC CC CC    .............

;; fn0040A650: 0040A650
;;   Called from:
;;     0040C927 (in fn0040C7F0)
fn0040A650 proc
	mov	eax,[ecx]
	cmp	byte ptr [eax+39h],0h
	jnz	40A69Ah

l0040A658:
	mov	edx,[eax+8h]
	cmp	byte ptr [edx+39h],0h
	jnz	40A67Dh

l0040A661:
	mov	eax,[edx]
	cmp	byte ptr [eax+39h],0h
	jnz	40A67Ah

l0040A669:
	lea	esp,[esp+0h]

l0040A670:
	mov	edx,eax
	mov	eax,[edx]
	cmp	byte ptr [eax+39h],0h
	jz	40A670h

l0040A67A:
	mov	[ecx],edx
	ret

l0040A67D:
	mov	eax,[eax+4h]
	cmp	byte ptr [eax+39h],0h
	jnz	40A698h

l0040A686:
	mov	edx,[ecx]
	cmp	edx,[eax+8h]
	jnz	40A698h

l0040A68D:
	mov	[ecx],eax
	mov	eax,[eax+4h]
	cmp	byte ptr [eax+39h],0h
	jz	40A686h

l0040A698:
	mov	[ecx],eax

l0040A69A:
	ret
0040A69B                                  CC CC CC CC CC            .....

;; fn0040A6A0: 0040A6A0
;;   Called from:
;;     0040AB3A (in fn0040AB30)
;;     0040CB0E (in fn0040CAE0)
fn0040A6A0 proc
	mov	eax,[ecx+4h]
	push	esi
	mov	esi,[eax+4h]
	cmp	byte ptr [esi+39h],0h
	push	edi
	mov	edi,eax
	jnz	40A6E1h

l0040A6B0:
	push	ebx
	mov	ebx,[esp+10h]
	push	ebp
	mov	ebp,[8A440Ch]
	lea	esp,[esp+0h]

l0040A6C0:
	lea	eax,[esi+0Ch]
	push	ebx
	push	eax
	call	ebp
	add	esp,8h
	test	al,al
	jz	40A6D3h

l0040A6CE:
	mov	esi,[esi+8h]
	jmp	40A6D7h

l0040A6D3:
	mov	edi,esi
	mov	esi,[esi]

l0040A6D7:
	cmp	byte ptr [esi+39h],0h
	jz	40A6C0h

l0040A6DD:
	pop	ebp
	mov	eax,edi
	pop	ebx

l0040A6E1:
	pop	edi
	pop	esi
	ret	4h
0040A6E6                   CC CC CC CC CC CC CC CC CC CC       ..........

;; fn0040A6F0: 0040A6F0
;;   Called from:
;;     0040C245 (in fn0040C130)
fn0040A6F0 proc
	mov	edx,[esp+4h]
	mov	eax,[edx+8h]
	push	esi
	mov	esi,[eax]
	mov	[edx+8h],esi
	mov	esi,[eax]
	cmp	byte ptr [esi+39h],0h
	jnz	40A708h

l0040A705:
	mov	[esi+4h],edx

l0040A708:
	mov	esi,[edx+4h]
	mov	[eax+4h],esi
	mov	ecx,[ecx+4h]
	cmp	edx,[ecx+4h]
	pop	esi
	jnz	40A722h

l0040A717:
	mov	[ecx+4h],eax
	mov	[eax],edx
	mov	[edx+4h],eax
	ret	4h

l0040A722:
	mov	ecx,[edx+4h]
	cmp	edx,[ecx]
	jnz	40A733h

l0040A729:
	mov	[ecx],eax
	mov	[eax],edx
	mov	[edx+4h],eax
	ret	4h

l0040A733:
	mov	[ecx+8h],eax
	mov	[eax],edx
	mov	[edx+4h],eax
	ret	4h
0040A73E                                           CC CC               ..

;; fn0040A740: 0040A740
;;   Called from:
;;     0040C263 (in fn0040C130)
;;     0040C291 (in fn0040C130)
fn0040A740 proc
	mov	edx,[esp+4h]
	mov	eax,[edx]
	push	esi
	mov	esi,[eax+8h]
	mov	[edx],esi
	mov	esi,[eax+8h]
	cmp	byte ptr [esi+39h],0h
	jnz	40A758h

l0040A755:
	mov	[esi+4h],edx

l0040A758:
	mov	esi,[edx+4h]
	mov	[eax+4h],esi
	mov	ecx,[ecx+4h]
	cmp	edx,[ecx+4h]
	pop	esi
	jnz	40A773h

l0040A767:
	mov	[ecx+4h],eax
	mov	[eax+8h],edx
	mov	[edx+4h],eax
	ret	4h

l0040A773:
	mov	ecx,[edx+4h]
	cmp	edx,[ecx+8h]
	jnz	40A787h

l0040A77B:
	mov	[ecx+8h],eax
	mov	[eax+8h],edx
	mov	[edx+4h],eax
	ret	4h

l0040A787:
	mov	[ecx],eax
	mov	[eax+8h],edx
	mov	[edx+4h],eax
	ret	4h
0040A792       CC CC CC CC CC CC CC CC CC CC CC CC CC CC   ..............

;; fn0040A7A0: 0040A7A0
;;   Called from:
;;     0040AC0F (in fn0040AB90)
fn0040A7A0 proc
	push	ebp
	mov	ebp,esp
	push	0FFh
	push	82C541h
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,0Ch
	push	ebx
	push	esi
	push	edi
	mov	eax,[0A14188h]
	xor	eax,ebp
	push	eax
	lea	eax,[ebp-0Ch]
	mov	fs:[0000h],eax
	mov	[ebp-10h],esp
	push	30h
	call	694FD8h
	mov	esi,eax
	add	esp,4h
	mov	[ebp-14h],esi
	mov	dword ptr [ebp-4h],0h
	mov	[ebp-18h],esi
	test	esi,esi
	mov	byte ptr [ebp-4h],1h
	jz	40A81Ch

l0040A7EC:
	mov	ecx,[ebp+0Ch]
	mov	eax,[ebp+8h]
	mov	edx,[ebp+10h]
	mov	ebx,[ebp+14h]
	mov	[esi+4h],ecx
	lea	edi,[esi+0Ch]
	push	ebx
	mov	ecx,edi
	mov	[esi],eax
	mov	[esi+8h],edx
	call	dword ptr [8A433Ch]
	mov	eax,[ebx+1Ch]
	mov	cl,[ebp+18h]
	mov	[edi+1Ch],eax
	mov	[esi+2Ch],cl
	mov	byte ptr [esi+2Dh],0h

l0040A81C:
	mov	eax,esi
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret	14h
0040A832       8B 55 EC 52 E8 8B A7 28 00 83 C4 04 6A 00   .U.R...(....j.
0040A840 6A 00 E8 85 A7 28 00 CC CC CC CC CC CC CC CC CC j....(..........

;; fn0040A850: 0040A850
;;   Called from:
;;     0040D6B2 (in fn0040D620)
fn0040A850 proc
	push	3Ch
	call	694FD8h
	add	esp,4h
	test	eax,eax
	jz	40A864h

l0040A85E:
	mov	dword ptr [eax],0h

l0040A864:
	lea	ecx,[eax+4h]
	test	ecx,ecx
	jz	40A871h

l0040A86B:
	mov	dword ptr [ecx],0h

l0040A871:
	lea	ecx,[eax+8h]
	test	ecx,ecx
	jz	40A87Eh

l0040A878:
	mov	dword ptr [ecx],0h

l0040A87E:
	mov	byte ptr [eax+38h],1h
	mov	byte ptr [eax+39h],0h
	ret
0040A887                      CC CC CC CC CC CC CC CC CC        .........
0040A890 6A FF 68 71 C5 82 00 64 A1 00 00 00 00 50 83 EC j.hq...d.....P..
0040A8A0 20 55 56 57 A1 88 41 A1 00 33 C4 50 8D 44 24 30  UVW..A..3.P.D$0
0040A8B0 64 A3 00 00 00 00 8B F9 68 DC 70 8A 00 8D 4C 24 d.......h.p...L$
0040A8C0 18 C7 44 24 14 00 00 00 00 FF 15 34 43 8A 00 8B ..D$.......4C...
0040A8D0 6C 24 44 8D 44 24 14 50 55 C7 44 24 40 00 00 00 l$D.D$.PU.D$@...
0040A8E0 00 E8 4A 73 FF FF 83 C4 08 8D 4C 24 14 C7 44 24 ..Js......L$..D$
0040A8F0 38 FF FF FF FF FF 15 38 43 8A 00 8B 4F 04 8D 77 8......8C...O..w
0040A900 04 6A FF 51 89 74 24 4C FF 15 F4 40 8A 00 B8 01 .j.Q.t$L...@....
0040A910 00 00 00 88 46 04 8B 17 55 8B 6C 24 44 89 44 24 ....F...U.l$D.D$
0040A920 3C 8B 42 2C 55 8B CF FF D0 8B 0E 51 C6 46 04 00 <.B,U......Q.F..
0040A930 FF 15 F0 40 8A 00 8B C5 8B 4C 24 30 64 89 0D 00 ...@.....L$0d...
0040A940 00 00 00 59 5F 5E 5D 83 C4 2C C2 08 00 CC CC CC ...Y_^]..,......
0040A950 8B 4C 24 08 85 C9 74 0E 83 41 04 FF 75 08 8B 01 .L$...t..A..u...
0040A960 8B 10 6A 01 FF D2 32 C0 C2 0C 00 CC CC CC CC CC ..j...2.........
0040A970 6A FF 68 A6 C5 82 00 64 A1 00 00 00 00 50 81 EC j.h....d.....P..
0040A980 1C 02 00 00 A1 88 41 A1 00 33 C4 89 84 24 18 02 ......A..3...$..
0040A990 00 00 53 55 56 57 A1 88 41 A1 00 33 C4 50 8D 84 ..SUVW..A..3.P..
0040A9A0 24 30 02 00 00 64 A3 00 00 00 00 8B 9C 24 40 02 $0...d.......$@.
0040A9B0 00 00 8B F9 8B 47 04 8D 6F 04 6A FF 50 89 6C 24 .....G..o.j.P.l$
0040A9C0 20 FF 15 F4 40 8A 00 C6 45 04 01 8D 4C 24 1C 51  ...@...E...L$.Q
0040A9D0 68 04 01 00 00 C7 84 24 40 02 00 00 00 00 00 00 h......$@.......
0040A9E0 FF 15 E8 40 8A 00 8D 94 24 24 01 00 00 52 6A 00 ...@....$$...Rj.
0040A9F0 68 48 71 8A 00 8D 44 24 28 50 FF 15 EC 40 8A 00 hHq...D$(P...@..
0040AA00 8D 8C 24 24 01 00 00 68 40 71 8A 00 51 FF 15 40 ..$$...h@q..Q..@
0040AA10 46 8A 00 8B F0 83 C4 08 85 F6 75 35 8D 4F 0C FF F.........u5.O..
0040AA20 15 54 43 8A 00 50 8B CB FF 15 54 43 8A 00 50 68 .TC..P....TC..Ph
0040AA30 F8 70 8A 00 E8 47 62 11 00 8B 55 00 83 C4 0C 52 .p...Gb...U....R
0040AA40 C6 45 04 00 FF 15 F0 40 8A 00 33 C0 E9 B3 00 00 .E.....@..3.....
0040AA50 00 8B 07 8B 50 2C 53 8D 4C 24 18 51 8B CF FF D2 ....P,S.L$.Q....
0040AA60 8B 44 24 14 33 FF 3B C7 56 75 44 FF 15 44 46 8A .D$.3.;.VuD..DF.
0040AA70 00 8B 44 24 18 83 C4 04 3B C7 C6 84 24 38 02 00 ..D$....;...$8..
0040AA80 00 00 74 15 83 40 04 FF 8B C8 83 C0 04 39 38 75 ..t..@.......98u
0040AA90 08 8B 01 8B 10 6A 01 FF D2 89 7C 24 14 8B 45 00 .....j....|$..E.
0040AAA0 50 C6 45 04 00 FF 15 F0 40 8A 00 33 C0 EB 55 8B P.E.....@..3..U.
0040AAB0 48 0C 8B 40 08 51 6A 01 50 FF 15 48 46 8A 00 57 H..@.Qj.P..HF..W
0040AAC0 57 56 FF 15 4C 46 8A 00 8B 44 24 30 83 C4 1C 3B WV..LF...D$0...;
0040AAD0 C7 C6 84 24 38 02 00 00 00 74 15 83 40 04 FF 8B ...$8....t..@...
0040AAE0 C8 83 C0 04 39 38 75 08 8B 11 8B 02 6A 01 FF D0 ....98u.....j...
0040AAF0 89 7C 24 14 8B 4D 00 51 C6 45 04 00 FF 15 F0 40 .|$..M.Q.E.....@
0040AB00 8A 00 8B C6 8B 8C 24 30 02 00 00 64 89 0D 00 00 ......$0...d....
0040AB10 00 00 59 5F 5E 5D 5B 8B 8C 24 18 02 00 00 33 CC ..Y_^][..$....3.
0040AB20 E8 69 A0 28 00 81 C4 28 02 00 00 C2 08 00 CC CC .i.(...(........

;; fn0040AB30: 0040AB30
;;   Called from:
;;     0040D1AE (in fn0040CBA0)
fn0040AB30 proc
	push	ecx
	push	esi
	push	edi
	mov	edi,[esp+14h]
	push	edi
	mov	esi,ecx
	call	40A6A0h
	cmp	eax,[esi+4h]
	mov	[esp+14h],eax
	jz	40AB6Ch

l0040AB48:
	add	eax,0Ch
	push	eax
	push	edi
	call	dword ptr [8A440Ch]
	add	esp,8h
	test	al,al
	jnz	40AB6Ch

l0040AB5A:
	lea	eax,[esp+14h]
	mov	ecx,[eax]
	mov	eax,[esp+10h]
	pop	edi
	mov	[eax],ecx
	pop	esi
	pop	ecx
	ret	8h

l0040AB6C:
	mov	eax,[esi+4h]
	mov	[esp+8h],eax
	lea	eax,[esp+8h]
	mov	ecx,[eax]
	mov	eax,[esp+10h]
	pop	edi
	mov	[eax],ecx
	pop	esi
	pop	ecx
	ret	8h
0040AB85                CC CC CC CC CC CC CC CC CC CC CC      ...........

;; fn0040AB90: 0040AB90
;;   Called from:
;;     0040B991 (in fn0040B930)
;;     0040B9D7 (in fn0040B930)
;;     0040BA2F (in fn0040BA10)
;;     0040BA70 (in fn0040BA10)
;;     0040BAAF (in fn0040BA10)
;;     0040BB07 (in fn0040BA10)
;;     0040BB1C (in fn0040BA10)
;;     0040BB79 (in fn0040BA10)
;;     0040BB8E (in fn0040BA10)
fn0040AB90 proc
	push	0FFh
	push	82C5E9h
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,44h
	push	ebx
	push	ebp
	push	esi
	push	edi
	mov	eax,[0A14188h]
	xor	eax,esp
	push	eax
	lea	eax,[esp+58h]
	mov	fs:[0000h],eax
	mov	edi,ecx
	cmp	dword ptr [edi+8h],7FFFFFEh
	jc	40ABFEh

l0040ABC2:
	push	8A6D80h
	lea	ecx,[esp+18h]
	call	dword ptr [8A4334h]
	lea	eax,[esp+14h]
	push	eax
	lea	ecx,[esp+34h]
	mov	dword ptr [esp+64h],0h
	call	4019E0h
	push	999C68h
	lea	ecx,[esp+34h]
	push	ecx
	mov	dword ptr [esp+38h],990030h
	call	694FCCh

l0040ABFE:
	mov	edx,[esp+74h]
	mov	eax,[edi+4h]
	mov	esi,[esp+70h]
	push	0h
	push	edx
	push	eax
	push	esi
	push	eax
	call	40A7A0h
	mov	ebp,eax
	mov	eax,[edi+4h]
	mov	ebx,1h
	add	[edi+8h],ebx
	cmp	esi,eax
	jnz	40AC35h

l0040AC25:
	mov	[eax+4h],ebp
	mov	eax,[edi+4h]
	mov	[eax],ebp
	mov	ecx,[edi+4h]
	mov	[ecx+8h],ebp
	jmp	40AC57h

l0040AC35:
	cmp	byte ptr [esp+6Ch],0h
	jz	40AC49h

l0040AC3C:
	mov	[esi],ebp
	mov	eax,[edi+4h]
	cmp	esi,[eax]
	jnz	40AC57h

l0040AC45:
	mov	[eax],ebp
	jmp	40AC57h

l0040AC49:
	mov	[esi+8h],ebp
	mov	eax,[edi+4h]
	cmp	esi,[eax+8h]
	jnz	40AC57h

l0040AC54:
	mov	[eax+8h],ebp

l0040AC57:
	mov	edx,[ebp+4h]
	cmp	byte ptr [edx+2Ch],0h
	lea	eax,[ebp+4h]
	mov	esi,ebp
	jnz	40AD55h

l0040AC69:
	lea	esp,[esp+0h]

l0040AC70:
	mov	ecx,[eax]
	mov	edx,[ecx+4h]
	cmp	ecx,[edx]
	jnz	40ACCAh

l0040AC79:
	mov	edx,[edx+8h]
	cmp	byte ptr [edx+2Ch],0h
	jnz	40AC9Bh

l0040AC82:
	mov	[ecx+2Ch],bl
	mov	[edx+2Ch],bl
	mov	edx,[eax]
	mov	ecx,[edx+4h]
	mov	byte ptr [ecx+2Ch],0h
	mov	edx,[eax]
	mov	esi,[edx+4h]
	jmp	40AD45h

l0040AC9B:
	cmp	esi,[ecx+8h]
	jnz	40ACAAh

l0040ACA0:
	mov	esi,ecx
	push	esi
	mov	ecx,edi
	call	4E2250h

l0040ACAA:
	mov	eax,[esi+4h]
	mov	[eax+2Ch],bl
	mov	ecx,[esi+4h]
	mov	edx,[ecx+4h]
	mov	byte ptr [edx+2Ch],0h
	mov	eax,[esi+4h]
	mov	ecx,[eax+4h]
	push	ecx
	mov	ecx,edi
	call	420740h
	jmp	40AD45h

l0040ACCA:
	mov	edx,[edx]
	cmp	byte ptr [edx+2Ch],0h
	jnz	40ACE8h

l0040ACD2:
	mov	[ecx+2Ch],bl
	mov	[edx+2Ch],bl
	mov	edx,[eax]
	mov	ecx,[edx+4h]
	mov	byte ptr [ecx+2Ch],0h
	mov	edx,[eax]
	mov	esi,[edx+4h]
	jmp	40AD45h

l0040ACE8:
	cmp	esi,[ecx]
	jnz	40ACF6h

l0040ACEC:
	mov	esi,ecx
	push	esi
	mov	ecx,edi
	call	420740h

l0040ACF6:
	mov	eax,[esi+4h]
	mov	[eax+2Ch],bl
	mov	ecx,[esi+4h]
	mov	edx,[ecx+4h]
	mov	byte ptr [edx+2Ch],0h
	mov	eax,[esi+4h]
	mov	eax,[eax+4h]
	mov	ecx,[eax+8h]
	mov	edx,[ecx]
	mov	[eax+8h],edx
	mov	edx,[ecx]
	cmp	byte ptr [edx+2Dh],0h
	jnz	40AD1Fh

l0040AD1C:
	mov	[edx+4h],eax

l0040AD1F:
	mov	edx,[eax+4h]
	mov	[ecx+4h],edx
	mov	edx,[edi+4h]
	cmp	eax,[edx+4h]
	jnz	40AD32h

l0040AD2D:
	mov	[edx+4h],ecx
	jmp	40AD40h

l0040AD32:
	mov	edx,[eax+4h]
	cmp	eax,[edx]
	jnz	40AD3Dh

l0040AD39:
	mov	[edx],ecx
	jmp	40AD40h

l0040AD3D:
	mov	[edx+8h],ecx

l0040AD40:
	mov	[ecx],eax
	mov	[eax+4h],ecx

l0040AD45:
	mov	ecx,[esi+4h]
	cmp	byte ptr [ecx+2Ch],0h
	lea	eax,[esi+4h]
	jz	40AC70h

l0040AD55:
	mov	edx,[edi+4h]
	mov	eax,[edx+4h]
	mov	[eax+2Ch],bl
	mov	eax,[esp+68h]
	mov	[eax],ebp
	mov	ecx,[esp+58h]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebp
	pop	ebx
	add	esp,50h
	ret	10h
0040AD7A                               CC CC CC CC CC CC           ......
0040AD80 6A FF 68 19 C6 82 00 64 A1 00 00 00 00 50 83 EC j.h....d.....P..
0040AD90 48 53 55 56 57 A1 88 41 A1 00 33 C4 50 8D 44 24 HSUVW..A..3.P.D$
0040ADA0 5C 64 A3 00 00 00 00 8B E9 8B 44 24 70 80 78 2D \d........D$p.x-
0040ADB0 00 74 3C 68 94 6D 8A 00 8D 4C 24 1C FF 15 34 43 .t<h.m...L$...4C
0040ADC0 8A 00 8D 44 24 18 50 8D 4C 24 38 C7 44 24 68 00 ...D$.P.L$8.D$h.
0040ADD0 00 00 00 E8 08 6C FF FF 68 8C A8 99 00 8D 4C 24 .....l..h.....L$
0040ADE0 38 51 C7 44 24 3C 3C 00 99 00 E8 DD A1 28 00 8B 8Q.D$<<......(..
0040ADF0 D8 8D 4C 24 70 89 5C 24 14 E8 C2 60 1A 00 8B 03 ..L$p.\$...`....
0040AE00 80 78 2D 00 74 05 8B 7B 08 EB 18 8B 53 08 80 7A .x-.t..{....S..z
0040AE10 2D 00 74 04 8B F8 EB 0B 8B 4C 24 70 3B CB 8B 79 -.t......L$p;..y
0040AE20 08 75 6B 80 7F 2D 00 8B 73 04 75 03 89 77 04 8B .uk..-..s.u..w..
0040AE30 45 04 39 58 04 75 05 89 78 04 EB 0B 39 1E 75 04 E.9X.u..x...9.u.
0040AE40 89 3E EB 03 89 7E 08 8B 5D 04 8B 03 3B 44 24 14 .>...~..]...;D$.
0040AE50 75 15 80 7F 2D 00 74 04 8B C6 EB 09 57 E8 6E C0 u...-.t.....W.n.
0040AE60 FF FF 83 C4 04 89 03 8B 5D 04 8B 4C 24 14 39 4B ........]..L$.9K
0040AE70 08 75 72 80 7F 2D 00 74 07 8B C6 89 43 08 EB 65 .ur..-.t....C..e
0040AE80 57 E8 DA BA 0D 00 83 C4 04 89 43 08 EB 57 89 48 W.........C..W.H
0040AE90 04 8B 13 89 11 3B 4B 08 75 04 8B F1 EB 1A 80 7F .....;K.u.......
0040AEA0 2D 00 8B 71 04 75 03 89 77 04 89 3E 8B 43 08 89 -..q.u..w..>.C..
0040AEB0 41 08 8B 53 08 89 4A 04 8B 45 04 39 58 04 75 05 A..S..J..E.9X.u.
0040AEC0 89 48 04 EB 0E 8B 43 04 39 18 75 04 89 08 EB 03 .H....C.9.u.....
0040AED0 89 48 08 8B 43 04 89 41 04 8A 53 2C 8A 41 2C 88 .H..C..A..S,.A,.
0040AEE0 51 2C 88 43 2C 8B 44 24 14 B3 01 38 58 2C 0F 85 Q,.C,.D$...8X,..
0040AEF0 F2 00 00 00 8B 4D 04 3B 79 04 0F 84 E3 00 00 00 .....M.;y.......
0040AF00 38 5F 2C 0F 85 DA 00 00 00 8B 06 3B F8 75 63 8B 8_,........;.uc.
0040AF10 46 08 80 78 2C 00 75 12 88 58 2C 56 8B CD C6 46 F..x,.u..X,V...F
0040AF20 2C 00 E8 29 73 0D 00 8B 46 08 80 78 2D 00 75 72 ,..)s...F..x-.ur
0040AF30 8B 10 38 5A 2C 75 08 8B 48 08 38 59 2C 74 5F 8B ..8Z,u..H.8Y,t_.
0040AF40 48 08 38 59 2C 75 12 88 5A 2C 50 8B CD C6 40 2C H.8Y,u..Z,P...@,
0040AF50 00 E8 EA 57 01 00 8B 46 08 8A 4E 2C 88 48 2C 88 ...W...F..N,.H,.
0040AF60 5E 2C 8B 50 08 56 8B CD 88 5A 2C E8 E0 72 0D 00 ^,.P.V...Z,..r..
0040AF70 EB 71 80 78 2C 00 75 11 88 58 2C 56 8B CD C6 46 .q.x,.u..X,V...F
0040AF80 2C 00 E8 B9 57 01 00 8B 06 80 78 2D 00 75 13 8B ,...W.....x-.u..
0040AF90 50 08 38 5A 2C 75 1E 8B 08 38 59 2C 75 17 C6 40 P.8Z,u...8Y,u..@
0040AFA0 2C 00 8B 55 04 8B FE 3B 7A 04 8B 76 04 0F 85 4D ,..U...;z..v...M
0040AFB0 FF FF FF EB 2E 8B 08 38 59 2C 75 11 88 5A 2C 50 .......8Y,u..Z,P
0040AFC0 8B CD C6 40 2C 00 E8 85 72 0D 00 8B 06 8A 4E 2C ...@,...r.....N,
0040AFD0 88 48 2C 88 5E 2C 8B 10 56 8B CD 88 5A 2C E8 5D .H,.^,..V...Z,.]
0040AFE0 57 01 00 88 5F 2C 8B 4C 24 14 83 C1 0C FF 15 38 W..._,.L$......8
0040AFF0 43 8A 00 8B 44 24 14 50 E8 C9 9F 28 00 8B 45 08 C...D$.P...(..E.
0040B000 83 C4 04 85 C0 76 06 83 C0 FF 89 45 08 8B 44 24 .....v.....E..D$
0040B010 6C 8B 4C 24 70 89 08 8B 4C 24 5C 64 89 0D 00 00 l.L$p...L$\d....
0040B020 00 00 59 5F 5E 5D 5B 83 C4 54 C2 08 00 CC CC CC ..Y_^][..T......
0040B030 6A FF 68 AB C6 82 00 64 A1 00 00 00 00 50 81 EC j.h....d.....P..
0040B040 A0 00 00 00 A1 88 41 A1 00 33 C4 89 84 24 9C 00 ......A..3...$..
0040B050 00 00 53 55 56 57 A1 88 41 A1 00 33 C4 50 8D 84 ..SUVW..A..3.P..
0040B060 24 B4 00 00 00 64 A3 00 00 00 00 8B AC 24 C8 00 $....d.......$..
0040B070 00 00 8B B4 24 C4 00 00 00 8B F9 55 8D 8C 24 98 ....$......U..$.
0040B080 00 00 00 89 74 24 5C C7 44 24 1C 00 00 00 00 FF ....t$\.D$......
0040B090 15 3C 43 8A 00 8D 44 24 50 BB 01 00 00 00 50 8D .<C...D$P.....P.
0040B0A0 8C 24 98 00 00 00 89 9C 24 C0 00 00 00 C6 44 24 .$......$.....D$
0040B0B0 2B 2F C6 44 24 2A 5C FF 15 D0 43 8A 00 8D 4C 24 +/.D$*\...C...L$
0040B0C0 28 51 8D 8C 24 98 00 00 00 89 44 24 18 FF 15 CC (Q..$.....D$....
0040B0D0 43 8A 00 8D 54 24 27 52 8D 4C 24 2A 51 8B 4C 24 C...T$'R.L$*Q.L$
0040B0E0 1C 8B 51 04 8B 09 52 8B 50 04 8B 00 51 52 50 E8 ..Q...R.P...QRP.
0040B0F0 3C 71 FF FF 83 C4 14 8B C4 8D 8C 24 98 00 00 00 <q.........$....
0040B100 89 64 24 18 C7 00 00 00 00 00 FF 15 C8 43 8A 00 .d$..........C..
0040B110 80 38 2F 75 10 53 6A 00 8D 8C 24 9C 00 00 00 FF .8/u.Sj...$.....
0040B120 15 10 44 8A 00 8D 8C 24 94 00 00 00 51 8D 54 24 ..D....$....Q.T$
0040B130 60 52 C7 44 24 30 00 00 00 00 E8 41 F3 FF FF 83 `R.D$0.....A....
0040B140 C4 08 50 8D 44 24 18 50 8D 4F 28 C6 84 24 C4 00 ..P.D$.P.O(..$..
0040B150 00 00 02 E8 88 78 20 00 8D 4C 24 5C 88 9C 24 BC .....x ..L$\..$.
0040B160 00 00 00 FF 15 38 43 8A 00 C7 44 24 1C 00 00 00 .....8C...D$....
0040B170 00 8B 47 2C 8B 4C 24 14 3B C8 C6 84 24 BC 00 00 ..G,.L$.;...$...
0040B180 00 03 75 0F C7 06 00 00 00 00 89 5C 24 18 E9 20 ..u........\$.. 
0040B190 04 00 00 8B 49 28 8B 57 40 6A 00 51 52 FF 15 4C ....I(.W@j.QR..L
0040B1A0 46 8A 00 83 C4 0C 85 C0 74 2F 8D 4F 0C FF 15 54 F.......t/.O...T
0040B1B0 43 8A 00 50 8B CD FF 15 54 43 8A 00 50 68 50 73 C..P....TC..PhPs
0040B1C0 8A 00 E8 B9 5A 11 00 83 C4 0C C7 06 00 00 00 00 ....Z...........
0040B1D0 89 5C 24 18 E9 DA 03 00 00 8B 47 40 50 53 8D 4C .\$.......G@PS.L
0040B1E0 24 38 6A 1E 51 FF 15 3C 46 8A 00 83 C4 10 3B C3 $8j.Q..<F.....;.
0040B1F0 74 1A 8D 4F 0C FF 15 54 43 8A 00 50 8B CD FF 15 t..O...TC..P....
0040B200 54 43 8A 00 50 68 10 73 8A 00 EB B6 81 7C 24 30 TC..Ph.s.....|$0
0040B210 50 4B 03 04 74 2B 8D 4F 0C FF 15 54 43 8A 00 50 PK..t+.O...TC..P
0040B220 8B CD FF 15 54 43 8A 00 50 68 C8 72 8A 00 E8 4D ....TC..Ph.r...M
0040B230 5A 11 00 83 C4 0C C7 06 00 00 00 00 E9 5E 03 00 Z............^..
0040B240 00 0F B7 54 24 4C 0F B7 44 24 4A 8B 4F 40 53 03 ...T$L..D$J.O@S.
0040B250 D0 52 51 FF 15 4C 46 8A 00 83 C4 0C 85 C0 74 2B .RQ..LF.......t+
0040B260 8D 4F 0C FF 15 54 43 8A 00 50 8B CD FF 15 54 43 .O...TC..P....TC
0040B270 8A 00 50 68 8C 72 8A 00 E8 03 5A 11 00 83 C4 0C ..Ph.r....Z.....
0040B280 C7 06 00 00 00 00 E9 14 03 00 00 66 8B 44 24 38 ...........f.D$8
0040B290 66 85 C0 74 37 66 3D 08 00 74 31 8D 4F 0C FF 15 f..t7f=..t1.O...
0040B2A0 54 43 8A 00 50 8B CD FF 15 54 43 8A 00 0F B7 54 TC..P....TC....T
0040B2B0 24 3C 50 52 68 40 72 8A 00 E8 C2 59 11 00 83 C4 $<PRh@r....Y....
0040B2C0 10 C7 06 00 00 00 00 E9 D3 02 00 00 8B 44 24 42 .............D$B
0040B2D0 50 E8 B3 98 28 00 83 C4 04 85 C0 89 44 24 20 75 P...(.......D$ u
0040B2E0 2B 8D 4F 0C FF 15 54 43 8A 00 50 8B CD FF 15 54 +.O...TC..P....T
0040B2F0 43 8A 00 50 68 00 72 8A 00 E8 82 59 11 00 83 C4 C..Ph.r....Y....
0040B300 0C C7 06 00 00 00 00 E9 93 02 00 00 8B 4F 40 8B .............O@.
0040B310 54 24 42 51 52 53 50 FF 15 3C 46 8A 00 83 C4 10 T$BQRSP..<F.....
0040B320 3B 44 24 42 74 35 8D 4F 0C FF 15 54 43 8A 00 50 ;D$Bt5.O...TC..P
0040B330 8B CD FF 15 54 43 8A 00 50 68 C8 71 8A 00 E8 3D ....TC..Ph.q...=
0040B340 59 11 00 8B 44 24 2C 50 E8 CD 9C 28 00 83 C4 10 Y...D$,P...(....
0040B350 C7 06 00 00 00 00 E9 44 02 00 00 66 83 7C 24 38 .......D...f.|$8
0040B360 08 0F 85 A6 01 00 00 8B 4C 24 46 6A 38 8D 54 24 ........L$Fj8.T$
0040B370 60 6A 00 52 89 4C 24 20 E8 A3 9C 28 00 8B 44 24 `j.R.L$ ...(..D$
0040B380 52 50 E8 02 98 28 00 83 C4 10 85 C0 89 44 24 28 RP...(.......D$(
0040B390 75 35 8D 4F 0C FF 15 54 43 8A 00 50 8B CD FF 15 u5.O...TC..P....
0040B3A0 54 43 8A 00 50 68 00 72 8A 00 E8 D1 58 11 00 8B TC..Ph.r....X...
0040B3B0 4C 24 2C 51 E8 61 9C 28 00 83 C4 10 C7 06 00 00 L$,Q.a.(........
0040B3C0 00 00 E9 D8 01 00 00 6A 38 68 C0 71 8A 00 8D 54 .......j8h.q...T
0040B3D0 24 64 6A F1 52 E8 A6 5D 19 00 83 C4 10 85 C0 74 $dj.R..].......t
0040B3E0 3F 8D 4F 0C FF 15 54 43 8A 00 50 8B CD FF 15 54 ?.O...TC..P....T
0040B3F0 43 8A 00 50 68 88 71 8A 00 E8 82 58 11 00 8B 44 C..Ph.q....X...D
0040B400 24 2C 50 E8 12 9C 28 00 8B 4C 24 38 51 E8 08 9C $,P...(..L$8Q...
0040B410 28 00 83 C4 14 C7 06 00 00 00 00 E9 7F 01 00 00 (...............
0040B420 8B 44 24 42 8B 54 24 20 8B 4C 24 28 89 44 24 60 .D$B.T$ .L$(.D$`
0040B430 33 C0 89 44 24 7C 89 84 24 80 00 00 00 89 54 24 3..D$|..$.....T$
0040B440 5C 8B 54 24 14 8D 44 24 5C 6A 04 50 89 4C 24 70 \.T$..D$\j.P.L$p
0040B450 89 54 24 74 E8 07 5F 19 00 83 C4 08 3B C3 89 44 .T$t.._.....;..D
0040B460 24 14 74 4E 8D 4F 0C FF 15 54 43 8A 00 50 8B CD $.tN.O...TC..P..
0040B470 FF 15 54 43 8A 00 8B 4C 24 18 50 51 68 4C 71 8A ..TC...L$.PQhLq.
0040B480 00 E8 FA 57 11 00 8B 54 24 30 52 E8 8A 9B 28 00 ...W...T$0R...(.
0040B490 8B 44 24 3C 50 E8 80 9B 28 00 8D 4C 24 74 51 E8 .D$<P...(..L$tQ.
0040B4A0 2C 73 19 00 83 C4 1C C7 06 00 00 00 00 E9 ED 00 ,s..............
0040B4B0 00 00 8D 54 24 5C 52 E8 14 73 19 00 6A 14 E8 15 ...T$\R..s..j...
0040B4C0 9B 28 00 83 C4 08 89 44 24 14 85 C0 C6 84 24 BC .(.....D$.....$.
0040B4D0 00 00 00 04 74 20 8B 54 24 28 51 8B CC C7 01 00 ....t .T$(Q.....
0040B4E0 00 00 00 8B 4C 24 4A 89 64 24 54 51 52 8B C8 E8 ....L$J.d$TQR...
0040B4F0 3C F3 00 00 EB 02 33 C0 85 C0 89 44 24 14 74 03 <.....3....D$.t.
0040B500 01 58 04 C6 84 24 BC 00 00 00 05 EB 4F 6A 14 E8 .X...$......Oj..
0040B510 C4 9A 28 00 83 C4 04 89 44 24 50 85 C0 C6 84 24 ..(.....D$P....$
0040B520 BC 00 00 00 06 74 20 51 8B D4 C7 02 00 00 00 00 .....t Q........
0040B530 8B 4C 24 46 8B 54 24 24 89 64 24 18 51 52 8B C8 .L$F.T$$.d$.QR..
0040B540 E8 EB F2 00 00 EB 02 33 C0 85 C0 89 44 24 14 74 .......3....D$.t
0040B550 03 01 58 04 C6 84 24 BC 00 00 00 07 8D 44 24 14 ..X...$......D$.
0040B560 50 8D 4C 24 20 E8 06 E6 11 00 8D 4C 24 14 C6 84 P.L$ ......L$...
0040B570 24 BC 00 00 00 03 E8 55 98 22 00 8B 4C 24 20 51 $......U."..L$ Q
0040B580 E8 95 9A 28 00 8B 54 24 2C 52 E8 8B 9A 28 00 8B ...(..T$,R...(..
0040B590 44 24 24 83 C4 08 85 C0 89 06 74 03 01 58 04 8D D$$.......t..X..
0040B5A0 4C 24 1C 89 5C 24 18 88 9C 24 BC 00 00 00 E8 1D L$..\$...$......
0040B5B0 98 22 00 8D 8C 24 94 00 00 00 C6 84 24 BC 00 00 ."...$......$...
0040B5C0 00 00 FF 15 38 43 8A 00 8B C6 8B 8C 24 B4 00 00 ....8C......$...
0040B5D0 00 64 89 0D 00 00 00 00 59 5F 5E 5D 5B 8B 8C 24 .d......Y_^][..$
0040B5E0 9C 00 00 00 33 CC E8 A3 95 28 00 81 C4 AC 00 00 ....3....(......
0040B5F0 00 C2 08 00 CC CC CC CC CC CC CC CC CC CC CC CC ................
0040B600 6A FF 68 0C C7 82 00 64 A1 00 00 00 00 50 83 EC j.h....d.....P..
0040B610 78 A1 88 41 A1 00 33 C4 89 44 24 74 53 55 56 57 x..A..3..D$tSUVW
0040B620 A1 88 41 A1 00 33 C4 50 8D 84 24 8C 00 00 00 64 ..A..3.P..$....d
0040B630 A3 00 00 00 00 8B 9C 24 9C 00 00 00 8B AC 24 A0 .......$......$.
0040B640 00 00 00 8B F9 68 70 74 8A 00 8D 4C 24 34 FF 15 .....hpt...L$4..
0040B650 34 43 8A 00 8D 44 24 30 50 53 C7 84 24 9C 00 00 4C...D$0PS..$...
0040B660 00 00 00 00 00 E8 C6 65 FF FF 83 C4 08 8D 4C 24 .......e......L$
0040B670 30 C7 84 24 94 00 00 00 FF FF FF FF FF 15 38 43 0..$..........8C
0040B680 8A 00 8B 4F 04 8D 77 04 6A FF 51 89 74 24 2C FF ...O..w.j.Q.t$,.
0040B690 15 F4 40 8A 00 C6 46 04 01 53 8D 4C 24 70 C7 84 ..@...F..S.L$p..
0040B6A0 24 98 00 00 00 01 00 00 00 FF 15 3C 43 8A 00 8D $..........<C...
0040B6B0 54 24 28 52 8D 4C 24 70 C6 84 24 98 00 00 00 02 T$(R.L$p..$.....
0040B6C0 C6 44 24 1B 2F C6 44 24 1A 5C FF 15 D0 43 8A 00 .D$./.D$.\...C..
0040B6D0 89 44 24 18 8D 44 24 1C 50 8D 4C 24 70 FF 15 CC .D$..D$.P.L$p...
0040B6E0 43 8A 00 8D 4C 24 17 51 8B 4C 24 1C 8D 54 24 1A C...L$.Q.L$..T$.
0040B6F0 52 8B 51 04 8B 09 52 8B 50 04 8B 00 51 52 50 E8 R.Q...R.P...QRP.
0040B700 2C 6B FF FF 83 C4 14 8B C4 8D 4C 24 70 89 64 24 ,k........L$p.d$
0040B710 20 C7 00 00 00 00 00 FF 15 C8 43 8A 00 80 38 2F  .........C...8/
0040B720 75 0E 6A 01 6A 00 8D 4C 24 74 FF 15 10 44 8A 00 u.j.j..L$t...D..
0040B730 8D 4C 24 6C 51 8D 54 24 34 52 E8 41 ED FF FF 83 .L$lQ.T$4R.A....
0040B740 C4 08 50 8D 44 24 1C 50 8D 4F 28 C6 84 24 9C 00 ..P.D$.P.O(..$..
0040B750 00 00 03 E8 88 72 20 00 8D 4C 24 30 C6 84 24 94 .....r ..L$0..$.
0040B760 00 00 00 02 FF 15 38 43 8A 00 8B 47 2C 39 44 24 ......8C...G,9D$
0040B770 18 0F 84 1B 01 00 00 8D 54 24 6C 52 8D 44 24 34 ........T$lR.D$4
0040B780 50 E8 FA EC FF FF 83 C4 08 8B 4F 38 50 8D 54 24 P.........O8P.T$
0040B790 2C 89 4C 24 20 52 8D 4F 34 C6 84 24 9C 00 00 00 ,.L$ R.O4..$....
0040B7A0 04 E8 8A F3 FF FF 8B 54 24 1C 33 C9 39 10 C6 84 .......T$.3.9...
0040B7B0 24 94 00 00 00 02 0F 94 C1 83 C1 01 89 4C 24 1C $............L$.
0040B7C0 8D 4C 24 30 FF 15 38 43 8A 00 85 ED 0F 84 10 01 .L$0..8C........
0040B7D0 00 00 8B 44 24 18 8B 48 28 8B 57 40 6A 00 51 52 ...D$..H(.W@j.QR
0040B7E0 FF 15 4C 46 8A 00 83 C4 0C 85 C0 74 46 8D 4F 0C ..LF.......tF.O.
0040B7F0 FF 15 54 43 8A 00 50 8B CB FF 15 54 43 8A 00 50 ..TC..P....TC..P
0040B800 68 28 74 8A 00 E8 76 54 11 00 83 C4 0C 8D 4C 24 h(t...vT......L$
0040B810 6C C6 84 24 94 00 00 00 01 FF 15 38 43 8A 00 C6 l..$.......8C...
0040B820 46 04 00 8B 06 50 FF 15 F0 40 8A 00 33 C0 E9 D2 F....P...@..3...
0040B830 00 00 00 8B 4F 40 51 6A 01 8D 54 24 54 6A 1E 52 ....O@Qj..T$Tj.R
0040B840 FF 15 3C 46 8A 00 83 C4 10 83 F8 01 74 1A 8D 4F ..<F........t..O
0040B850 0C FF 15 54 43 8A 00 50 8B CB FF 15 54 43 8A 00 ...TC..P....TC..
0040B860 50 68 E0 73 8A 00 EB 9D 81 7C 24 4C 50 4B 03 04 Ph.s.....|$LPK..
0040B870 74 43 8D 4F 0C FF 15 54 43 8A 00 50 8B CB FF 15 tC.O...TC..P....
0040B880 54 43 8A 00 50 68 98 73 8A 00 E8 F1 53 11 00 83 TC..Ph.s....S...
0040B890 C4 0C 8D 4C 24 6C C6 84 24 94 00 00 00 01 FF 15 ...L$l..$.......
0040B8A0 38 43 8A 00 C6 46 04 00 8B 0E 51 FF 15 F0 40 8A 8C...F....Q...@.
0040B8B0 00 33 C0 EB 50 8B 54 24 62 0F B7 44 24 58 89 55 .3..P.T$b..D$X.U
0040B8C0 00 0F B7 54 24 56 33 C9 C1 E0 10 0B C2 89 4D 04 ...T$V3.......M.
0040B8D0 89 45 08 89 4D 0C 89 45 10 89 4D 14 89 45 18 89 .E..M..E..M..E..
0040B8E0 4D 1C 8D 4C 24 6C C6 84 24 94 00 00 00 01 FF 15 M..L$l..$.......
0040B8F0 38 43 8A 00 8B 06 50 C6 46 04 00 FF 15 F0 40 8A 8C....P.F.....@.
0040B900 00 8B 44 24 1C 8B 8C 24 8C 00 00 00 64 89 0D 00 ..D$...$....d...
0040B910 00 00 00 59 5F 5E 5D 5B 8B 4C 24 74 33 CC E8 6B ...Y_^][.L$t3..k
0040B920 92 28 00 81 C4 84 00 00 00 C2 08 00 CC CC CC CC .(..............

;; fn0040B930: 0040B930
;;   Called from:
;;     0040BBA7 (in fn0040BA10)
fn0040B930 proc
	push	ecx
	push	ebx
	push	ebp
	mov	ebp,[esp+14h]
	push	esi
	mov	ebx,ecx
	push	edi
	mov	edi,[ebx+4h]
	mov	esi,[edi+4h]
	cmp	byte ptr [esi+2Dh],0h
	mov	al,1h
	mov	[esp+10h],al
	jnz	40B975h

l0040B94D:
	lea	ecx,[ecx+0h]

l0040B950:
	lea	eax,[esi+0Ch]
	push	eax
	push	ebp
	mov	edi,esi
	call	dword ptr [8A440Ch]
	add	esp,8h
	test	al,al
	mov	[esp+10h],al
	jz	40B96Ch

l0040B968:
	mov	esi,[esi]
	jmp	40B96Fh

l0040B96C:
	mov	esi,[esi+8h]

l0040B96F:
	cmp	byte ptr [esi+2Dh],0h
	jz	40B950h

l0040B975:
	test	al,al
	mov	esi,edi
	mov	[esp+1Ch],esi
	jz	40B9B7h

l0040B97F:
	mov	ecx,[ebx+4h]
	cmp	edi,[ecx]
	jnz	40B9AAh

l0040B986:
	push	ebp
	push	edi
	push	1h
	lea	edx,[esp+28h]
	push	edx
	mov	ecx,ebx
	call	40AB90h
	mov	ecx,[eax]
	mov	eax,[esp+18h]
	pop	edi
	pop	esi
	pop	ebp
	mov	[eax],ecx
	mov	byte ptr [eax+4h],1h
	pop	ebx
	pop	ecx
	ret	8h

l0040B9AA:
	lea	ecx,[esp+1Ch]
	call	5F58C0h
	mov	esi,[esp+1Ch]

l0040B9B7:
	lea	edx,[esi+0Ch]
	push	ebp
	push	edx
	call	dword ptr [8A440Ch]
	add	esp,8h
	test	al,al
	jz	40B9F0h

l0040B9C9:
	mov	eax,[esp+10h]
	push	ebp
	push	edi
	push	eax
	lea	ecx,[esp+28h]
	push	ecx
	mov	ecx,ebx
	call	40AB90h
	mov	edx,[eax]
	mov	eax,[esp+18h]
	pop	edi
	pop	esi
	pop	ebp
	mov	[eax],edx
	mov	byte ptr [eax+4h],1h
	pop	ebx
	pop	ecx
	ret	8h

l0040B9F0:
	mov	eax,[esp+18h]
	pop	edi
	mov	[eax],esi
	pop	esi
	pop	ebp
	mov	byte ptr [eax+4h],0h
	pop	ebx
	pop	ecx
	ret	8h
0040BA02       CC CC CC CC CC CC CC CC CC CC CC CC CC CC   ..............

;; fn0040BA10: 0040BA10
;;   Called from:
;;     0040BCED (in fn0040BC80)
fn0040BA10 proc
	sub	esp,8h
	push	esi
	mov	esi,ecx
	cmp	dword ptr [esi+8h],0h
	push	edi
	jnz	40BA3Eh

l0040BA1D:
	mov	eax,[esp+1Ch]
	mov	ecx,[esi+4h]
	mov	edi,[esp+14h]
	push	eax
	push	ecx
	push	1h
	push	edi
	mov	ecx,esi
	call	40AB90h
	mov	eax,edi
	pop	edi
	pop	esi
	add	esp,8h
	ret	0Ch

l0040BA3E:
	mov	eax,[esi+4h]
	mov	edi,[esp+1Ch]
	push	ebx
	mov	ebx,[esp+1Ch]
	cmp	ebx,[eax]
	push	ebp
	jnz	40BA81h

l0040BA4F:
	lea	edx,[ebx+0Ch]
	push	edx
	push	edi
	call	dword ptr [8A440Ch]
	add	esp,8h
	test	al,al
	jz	40BB9Fh

l0040BA65:
	push	edi
	mov	edi,[esp+20h]
	push	ebx
	push	1h
	push	edi
	mov	ecx,esi
	call	40AB90h
	pop	ebp
	pop	ebx
	mov	eax,edi
	pop	edi
	pop	esi
	add	esp,8h
	ret	0Ch

l0040BA81:
	cmp	ebx,eax
	jnz	40BAC0h

l0040BA85:
	mov	eax,[eax+8h]
	add	eax,0Ch
	push	edi
	push	eax
	call	dword ptr [8A440Ch]
	add	esp,8h
	test	al,al
	jz	40BB9Fh

l0040BA9E:
	mov	eax,[esi+4h]
	mov	ecx,[eax+8h]
	push	edi
	mov	edi,[esp+20h]
	push	ecx
	push	0h
	push	edi
	mov	ecx,esi
	call	40AB90h
	pop	ebp
	pop	ebx
	mov	eax,edi
	pop	edi
	pop	esi
	add	esp,8h
	ret	0Ch

l0040BAC0:
	lea	eax,[ebx+0Ch]
	push	eax
	push	edi
	call	dword ptr [8A440Ch]
	add	esp,8h
	test	al,al
	jz	40BB2Dh

l0040BAD2:
	lea	ecx,[esp+24h]
	mov	[esp+24h],ebx
	call	5F58C0h
	mov	ebp,[esp+24h]
	push	edi
	lea	edx,[ebp+0Ch]
	push	edx
	mov	ecx,esi
	call	4055D0h
	test	al,al
	jz	40BB2Dh

l0040BAF3:
	mov	eax,[ebp+8h]
	cmp	byte ptr [eax+2Dh],0h
	push	edi
	mov	edi,[esp+20h]
	mov	ecx,esi
	jz	40BB18h

l0040BB03:
	push	ebp
	push	0h
	push	edi
	call	40AB90h
	pop	ebp
	pop	ebx
	mov	eax,edi
	pop	edi
	pop	esi
	add	esp,8h
	ret	0Ch

l0040BB18:
	push	ebx
	push	1h
	push	edi
	call	40AB90h
	pop	ebp
	pop	ebx
	mov	eax,edi
	pop	edi
	pop	esi
	add	esp,8h
	ret	0Ch

l0040BB2D:
	lea	eax,[ebx+0Ch]
	push	edi
	push	eax
	call	dword ptr [8A440Ch]
	add	esp,8h
	test	al,al
	jz	40BB9Fh

l0040BB3F:
	lea	ecx,[esp+24h]
	mov	[esp+24h],ebx
	call	5B0EC0h
	mov	ebp,[esp+24h]
	cmp	ebp,[esi+4h]
	jz	40BB65h

l0040BB55:
	lea	ecx,[ebp+0Ch]
	push	ecx
	push	edi
	mov	ecx,esi
	call	4055D0h
	test	al,al
	jz	40BB9Fh

l0040BB65:
	mov	edx,[ebx+8h]
	cmp	byte ptr [edx+2Dh],0h
	push	edi
	mov	edi,[esp+20h]
	mov	ecx,esi
	jz	40BB8Ah

l0040BB75:
	push	ebx
	push	0h
	push	edi
	call	40AB90h
	pop	ebp
	pop	ebx
	mov	eax,edi
	pop	edi
	pop	esi
	add	esp,8h
	ret	0Ch

l0040BB8A:
	push	ebp
	push	1h
	push	edi
	call	40AB90h
	pop	ebp
	pop	ebx
	mov	eax,edi
	pop	edi
	pop	esi
	add	esp,8h
	ret	0Ch

l0040BB9F:
	push	edi
	lea	eax,[esp+14h]
	push	eax
	mov	ecx,esi
	call	40B930h
	mov	ecx,[eax]
	mov	eax,[esp+1Ch]
	pop	ebp
	pop	ebx
	pop	edi
	mov	[eax],ecx
	pop	esi
	add	esp,8h
	ret	0Ch
0040BBBE                                           CC CC               ..
0040BBC0 53 8B 5C 24 10 56 8B 74 24 10 57 8B F9 8B 47 04 S.\$.V.t$.W...G.
0040BBD0 3B 30 75 36 3B D8 75 32 8B 40 04 50 E8 1F DA 21 ;0u6;.u2.@.P...!
0040BBE0 00 8B 47 04 89 40 04 8B 47 04 C7 47 08 00 00 00 ..G..@..G..G....
0040BBF0 00 89 00 8B 47 04 89 40 08 8B 4F 04 8B 11 8B 44 ....G..@..O....D
0040BC00 24 10 5F 5E 89 10 5B C2 0C 00 3B F3 74 5A 8B FF $._^..[...;.tZ..
0040BC10 80 7E 2D 00 8B CE 75 3F 8B 46 08 80 78 2D 00 75 .~-...u?.F..x-.u
0040BC20 1B 8B F0 8B 06 80 78 2D 00 75 2C EB 03 8D 49 00 ......x-.u,...I.
0040BC30 8B F0 8B 06 80 78 2D 00 74 F6 EB 1B 8B 46 04 80 .....x-.t....F..
0040BC40 78 2D 00 75 10 3B 70 08 75 0B 8B F0 8B 40 04 80 x-.u.;p.u....@..
0040BC50 78 2D 00 74 F0 8B F0 51 8D 44 24 18 50 8B CF E8 x-.t...Q.D$.P...
0040BC60 1C F1 FF FF 3B F3 75 A8 8B 44 24 10 5F 89 30 5E ....;.u..D$._.0^
0040BC70 5B C2 0C 00 CC CC CC CC CC CC CC CC CC CC CC CC [...............

;; fn0040BC80: 0040BC80
;;   Called from:
;;     0040D09A (in fn0040CBA0)
fn0040BC80 proc
	push	0FFh
	push	82C748h
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,20h
	push	ebx
	push	esi
	push	edi
	mov	eax,[0A14188h]
	xor	eax,esp
	push	eax
	lea	eax,[esp+30h]
	mov	fs:[0000h],eax
	mov	esi,ecx
	mov	ebx,[esp+40h]
	push	ebx
	call	5B0F90h
	mov	edi,eax
	cmp	edi,[esi+4h]
	jz	40BCCBh

l0040BCB9:
	lea	eax,[edi+0Ch]
	push	eax
	push	ebx
	call	dword ptr [8A440Ch]
	add	esp,8h
	test	al,al
	jz	40BD1Eh

l0040BCCB:
	push	ebx
	lea	ecx,[esp+14h]
	call	dword ptr [8A433Ch]
	xor	eax,eax
	mov	[esp+2Ch],eax
	lea	ecx,[esp+10h]
	push	ecx
	push	edi
	lea	edx,[esp+48h]
	push	edx
	mov	ecx,esi
	mov	[esp+44h],eax
	call	40BA10h
	mov	esi,[eax]
	lea	ecx,[esp+10h]
	mov	dword ptr [esp+38h],0FFFFFFFFh
	call	dword ptr [8A4338h]
	lea	eax,[esi+28h]
	mov	ecx,[esp+30h]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebx
	add	esp,2Ch
	ret	4h

l0040BD1E:
	lea	eax,[edi+28h]
	mov	ecx,[esp+30h]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebx
	add	esp,2Ch
	ret	4h
0040BD36                   CC CC CC CC CC CC CC CC CC CC       ..........

;; fn0040BD40: 0040BD40
;;   Called from:
;;     0040CB6A (in fn0040CAE0)
fn0040BD40 proc
	push	0FFh
	push	82C779h
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
	lea	ecx,[esi+1Ch]
	mov	dword ptr [esp+14h],0h
	call	403900h
	mov	ecx,esi
	mov	dword ptr [esp+14h],0FFFFFFFFh
	call	dword ptr [8A4338h]
	mov	ecx,[esp+0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	esi
	add	esp,10h
	ret
0040BD99                            CC CC CC CC CC CC CC          .......

;; fn0040BDA0: 0040BDA0
;;   Called from:
;;     0040CB48 (in fn0040CAE0)
fn0040BDA0 proc
	push	0FFh
	push	82C7A9h
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
	call	dword ptr [8A433Ch]
	mov	ecx,[esp+20h]
	push	ecx
	lea	ecx,[esi+1Ch]
	mov	dword ptr [esp+18h],0h
	call	409CE0h
	mov	eax,esi
	mov	ecx,[esp+0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	esi
	add	esp,10h
	ret	8h
0040BDFD                                        CC CC CC              ...

;; fn0040BE00: 0040BE00
;;   Called from:
;;     0040C0F4 (in fn0040C090)
fn0040BE00 proc
	push	0FFh
	push	82C7D9h
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
	mov	edi,[esp+20h]
	push	edi
	call	dword ptr [8A433Ch]
	add	edi,1Ch
	push	edi
	lea	ecx,[esi+1Ch]
	mov	dword ptr [esp+1Ch],0h
	call	409CE0h
	mov	eax,esi
	mov	ecx,[esp+10h]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	add	esp,10h
	ret	4h
0040BE5E                                           CC CC               ..
0040BE60 6A FF 68 44 C8 82 00 64 A1 00 00 00 00 50 83 EC j.hD...d.....P..
0040BE70 54 A1 88 41 A1 00 33 C4 89 44 24 50 53 55 56 57 T..A..3..D$PSUVW
0040BE80 A1 88 41 A1 00 33 C4 50 8D 44 24 68 64 A3 00 00 ..A..3.P.D$hd...
0040BE90 00 00 8B 5C 24 78 8B 7C 24 7C 8B E9 68 8C 74 8A ...\$x.|$|..h.t.
0040BEA0 00 8D 4C 24 28 89 5C 24 48 C7 44 24 1C 00 00 00 ..L$(.\$H.D$....
0040BEB0 00 FF 15 34 43 8A 00 8D 44 24 24 50 57 C7 44 24 ...4C...D$$PW.D$
0040BEC0 78 01 00 00 00 E8 66 5D FF FF 83 C4 08 8D 4C 24 x.....f]......L$
0040BED0 24 C6 44 24 70 00 FF 15 38 43 8A 00 8B 4D 04 8D $.D$p...8C...M..
0040BEE0 75 04 6A FF 51 89 74 24 48 FF 15 F4 40 8A 00 C6 u.j.Q.t$H...@...
0040BEF0 46 04 01 57 8D 4C 24 4C C7 44 24 74 02 00 00 00 F..W.L$L.D$t....
0040BF00 FF 15 3C 43 8A 00 8D 54 24 1C 52 8D 4C 24 4C C6 ..<C...T$.R.L$L.
0040BF10 44 24 74 03 C6 44 24 1B 2F C6 44 24 1A 5C FF 15 D$t..D$./.D$.\..
0040BF20 D0 43 8A 00 8B F8 8D 44 24 24 50 8D 4C 24 4C FF .C.....D$$P.L$L.
0040BF30 15 CC 43 8A 00 8D 4C 24 17 51 8B 4F 04 8D 54 24 ..C...L$.Q.O..T$
0040BF40 1A 52 8B 17 51 8B 48 04 52 8B 10 51 52 E8 DE 62 .R..Q.H.R..QR..b
0040BF50 FF FF 83 C4 14 8B C4 33 FF 8D 4C 24 4C 89 64 24 .......3..L$L.d$
0040BF60 20 89 38 FF 15 C8 43 8A 00 80 38 2F 75 0D 6A 01  .8...C...8/u.j.
0040BF70 57 8D 4C 24 50 FF 15 10 44 8A 00 8D 44 24 48 50 W.L$P...D...D$HP
0040BF80 8D 4C 24 28 51 E8 F6 E4 FF FF 83 C4 08 50 8D 54 .L$(Q........P.T
0040BF90 24 20 52 8D 4D 34 C6 44 24 78 04 E8 90 EB FF FF $ R.M4.D$x......
0040BFA0 8D 4C 24 24 C6 44 24 70 03 FF 15 38 43 8A 00 8B .L$$.D$p...8C...
0040BFB0 6D 38 8B 44 24 1C 3B C5 75 47 89 7C 24 28 89 7C m8.D$.;.uG.|$(.|
0040BFC0 24 2C 89 7C 24 30 8D 44 24 24 50 8B CB C6 44 24 $,.|$0.D$$P...D$
0040BFD0 74 05 E8 09 DD FF FF 8D 4C 24 24 C7 44 24 18 01 t.......L$$.D$..
0040BFE0 00 00 00 C6 44 24 70 03 E8 13 79 FF FF 8D 4C 24 ....D$p...y...L$
0040BFF0 48 C6 44 24 70 02 FF 15 38 43 8A 00 8B 0E 51 EB H.D$p...8C....Q.
0040C000 25 83 C0 28 50 8B CB E8 D4 DC FF FF 8D 4C 24 48 %..(P........L$H
0040C010 C7 44 24 18 01 00 00 00 C6 44 24 70 02 FF 15 38 .D$......D$p...8
0040C020 43 8A 00 8B 16 52 C6 46 04 00 FF 15 F0 40 8A 00 C....R.F.....@..
0040C030 8B C3 8B 4C 24 68 64 89 0D 00 00 00 00 59 5F 5E ...L$hd......Y_^
0040C040 5D 5B 8B 4C 24 50 33 CC E8 41 8B 28 00 83 C4 60 ][.L$P3..A.(...`
0040C050 C2 08 00 CC CC CC CC CC CC CC CC CC CC CC CC CC ................
0040C060 51 56 8B F1 8B 46 04 8B 08 50 51 8D 44 24 0C 50 QV...F...PQ.D$.P
0040C070 8B CE E8 49 FB FF FF 8B 4E 04 51 E8 46 8F 28 00 ...I....N.Q.F.(.
0040C080 83 C4 04 33 C0 89 46 04 89 46 08 5E 59 C3 CC CC ...3..F..F.^Y...

;; fn0040C090: 0040C090
;;   Called from:
;;     0040C1AF (in fn0040C130)
fn0040C090 proc
	push	ebp
	mov	ebp,esp
	push	0FFh
	push	82C881h
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,0Ch
	push	ebx
	push	esi
	push	edi
	mov	eax,[0A14188h]
	xor	eax,ebp
	push	eax
	lea	eax,[ebp-0Ch]
	mov	fs:[0000h],eax
	mov	[ebp-10h],esp
	push	3Ch
	call	694FD8h
	mov	esi,eax
	add	esp,4h
	mov	[ebp-14h],esi
	mov	dword ptr [ebp-4h],0h
	mov	[ebp-18h],esi
	test	esi,esi
	mov	byte ptr [ebp-4h],1h
	jz	40C103h

l0040C0DC:
	mov	eax,[ebp+8h]
	mov	ecx,[ebp+0Ch]
	mov	edx,[ebp+10h]
	mov	[esi],eax
	mov	eax,[ebp+14h]
	mov	[esi+4h],ecx
	push	eax
	lea	ecx,[esi+0Ch]
	mov	[esi+8h],edx
	call	40BE00h
	mov	cl,[ebp+18h]
	mov	[esi+38h],cl
	mov	byte ptr [esi+39h],0h

l0040C103:
	mov	eax,esi
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret	14h
0040C119                            8B 55 EC 52 E8 A4 8E          .U.R...
0040C120 28 00 83 C4 04 6A 00 6A 00 E8 9E 8E 28 00 CC CC (....j.j....(...

;; fn0040C130: 0040C130
;;   Called from:
;;     0040C771 (in fn0040C710)
;;     0040C7B7 (in fn0040C710)
;;     0040C80F (in fn0040C7F0)
;;     0040C850 (in fn0040C7F0)
;;     0040C88F (in fn0040C7F0)
;;     0040C8E7 (in fn0040C7F0)
;;     0040C8FC (in fn0040C7F0)
;;     0040C959 (in fn0040C7F0)
;;     0040C96E (in fn0040C7F0)
fn0040C130 proc
	push	0FFh
	push	82C8A9h
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,44h
	push	ebx
	push	ebp
	push	esi
	push	edi
	mov	eax,[0A14188h]
	xor	eax,esp
	push	eax
	lea	eax,[esp+58h]
	mov	fs:[0000h],eax
	mov	edi,ecx
	cmp	dword ptr [edi+8h],5D1745Ch
	jc	40C19Eh

l0040C162:
	push	8A6D80h
	lea	ecx,[esp+18h]
	call	dword ptr [8A4334h]
	lea	eax,[esp+14h]
	push	eax
	lea	ecx,[esp+34h]
	mov	dword ptr [esp+64h],0h
	call	4019E0h
	push	999C68h
	lea	ecx,[esp+34h]
	push	ecx
	mov	dword ptr [esp+38h],990030h
	call	694FCCh

l0040C19E:
	mov	edx,[esp+74h]
	mov	eax,[edi+4h]
	mov	esi,[esp+70h]
	push	0h
	push	edx
	push	eax
	push	esi
	push	eax
	call	40C090h
	mov	ebp,eax
	mov	eax,[edi+4h]
	mov	ebx,1h
	add	[edi+8h],ebx
	cmp	esi,eax
	jnz	40C1D5h

l0040C1C5:
	mov	[eax+4h],ebp
	mov	eax,[edi+4h]
	mov	[eax],ebp
	mov	ecx,[edi+4h]
	mov	[ecx+8h],ebp
	jmp	40C1F7h

l0040C1D5:
	cmp	byte ptr [esp+6Ch],0h
	jz	40C1E9h

l0040C1DC:
	mov	[esi],ebp
	mov	eax,[edi+4h]
	cmp	esi,[eax]
	jnz	40C1F7h

l0040C1E5:
	mov	[eax],ebp
	jmp	40C1F7h

l0040C1E9:
	mov	[esi+8h],ebp
	mov	eax,[edi+4h]
	cmp	esi,[eax+8h]
	jnz	40C1F7h

l0040C1F4:
	mov	[eax+8h],ebp

l0040C1F7:
	mov	edx,[ebp+4h]
	cmp	byte ptr [edx+38h],0h
	lea	eax,[ebp+4h]
	mov	esi,ebp
	jnz	40C2F5h

l0040C209:
	lea	esp,[esp+0h]

l0040C210:
	mov	ecx,[eax]
	mov	edx,[ecx+4h]
	cmp	ecx,[edx]
	jnz	40C26Ah

l0040C219:
	mov	edx,[edx+8h]
	cmp	byte ptr [edx+38h],0h
	jnz	40C23Bh

l0040C222:
	mov	[ecx+38h],bl
	mov	[edx+38h],bl
	mov	edx,[eax]
	mov	ecx,[edx+4h]
	mov	byte ptr [ecx+38h],0h
	mov	edx,[eax]
	mov	esi,[edx+4h]
	jmp	40C2E5h

l0040C23B:
	cmp	esi,[ecx+8h]
	jnz	40C24Ah

l0040C240:
	mov	esi,ecx
	push	esi
	mov	ecx,edi
	call	40A6F0h

l0040C24A:
	mov	eax,[esi+4h]
	mov	[eax+38h],bl
	mov	ecx,[esi+4h]
	mov	edx,[ecx+4h]
	mov	byte ptr [edx+38h],0h
	mov	eax,[esi+4h]
	mov	ecx,[eax+4h]
	push	ecx
	mov	ecx,edi
	call	40A740h
	jmp	40C2E5h

l0040C26A:
	mov	edx,[edx]
	cmp	byte ptr [edx+38h],0h
	jnz	40C288h

l0040C272:
	mov	[ecx+38h],bl
	mov	[edx+38h],bl
	mov	edx,[eax]
	mov	ecx,[edx+4h]
	mov	byte ptr [ecx+38h],0h
	mov	edx,[eax]
	mov	esi,[edx+4h]
	jmp	40C2E5h

l0040C288:
	cmp	esi,[ecx]
	jnz	40C296h

l0040C28C:
	mov	esi,ecx
	push	esi
	mov	ecx,edi
	call	40A740h

l0040C296:
	mov	eax,[esi+4h]
	mov	[eax+38h],bl
	mov	ecx,[esi+4h]
	mov	edx,[ecx+4h]
	mov	byte ptr [edx+38h],0h
	mov	eax,[esi+4h]
	mov	eax,[eax+4h]
	mov	ecx,[eax+8h]
	mov	edx,[ecx]
	mov	[eax+8h],edx
	mov	edx,[ecx]
	cmp	byte ptr [edx+39h],0h
	jnz	40C2BFh

l0040C2BC:
	mov	[edx+4h],eax

l0040C2BF:
	mov	edx,[eax+4h]
	mov	[ecx+4h],edx
	mov	edx,[edi+4h]
	cmp	eax,[edx+4h]
	jnz	40C2D2h

l0040C2CD:
	mov	[edx+4h],ecx
	jmp	40C2E0h

l0040C2D2:
	mov	edx,[eax+4h]
	cmp	eax,[edx]
	jnz	40C2DDh

l0040C2D9:
	mov	[edx],ecx
	jmp	40C2E0h

l0040C2DD:
	mov	[edx+8h],ecx

l0040C2E0:
	mov	[ecx],eax
	mov	[eax+4h],ecx

l0040C2E5:
	mov	ecx,[esi+4h]
	cmp	byte ptr [ecx+38h],0h
	lea	eax,[esi+4h]
	jz	40C210h

l0040C2F5:
	mov	edx,[edi+4h]
	mov	eax,[edx+4h]
	mov	[eax+38h],bl
	mov	eax,[esp+68h]
	mov	[eax],ebp
	mov	ecx,[esp+58h]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebp
	pop	ebx
	add	esp,50h
	ret	10h
0040C31A                               CC CC CC CC CC CC           ......
0040C320 6A FF 68 E2 C8 82 00 64 A1 00 00 00 00 50 83 EC j.h....d.....P..
0040C330 50 53 55 56 57 A1 88 41 A1 00 33 C4 50 8D 44 24 PSUVW..A..3.P.D$
0040C340 64 64 A3 00 00 00 00 8B D9 89 5C 24 14 8B 44 24 dd........\$..D$
0040C350 78 80 78 39 00 74 3C 68 94 6D 8A 00 8D 4C 24 24 x.x9.t<h.m...L$$
0040C360 FF 15 34 43 8A 00 8D 44 24 20 50 8D 4C 24 40 C7 ..4C...D$ P.L$@.
0040C370 44 24 70 00 00 00 00 E8 64 56 FF FF 68 8C A8 99 D$p.....dV..h...
0040C380 00 8D 4C 24 40 51 C7 44 24 44 3C 00 99 00 E8 39 ..L$@Q.D$D<....9
0040C390 8C 28 00 8B E8 8D 4C 24 78 89 6C 24 18 E8 AE E2 .(....L$x.l$....
0040C3A0 FF FF 8B 45 00 80 78 39 00 74 05 8B 7D 08 EB 18 ...E..x9.t..}...
0040C3B0 8B 55 08 80 7A 39 00 74 04 8B F8 EB 0B 8B 4C 24 .U..z9.t......L$
0040C3C0 78 3B CD 8B 79 08 75 67 80 7F 39 00 8B 75 04 75 x;..y.ug..9..u.u
0040C3D0 03 89 77 04 8B 43 04 39 68 04 75 05 89 78 04 EB ..w..C.9h.u..x..
0040C3E0 0B 39 2E 75 04 89 3E EB 03 89 7E 08 8B 5B 04 39 .9.u..>...~..[.9
0040C3F0 2B 75 15 80 7F 39 00 74 04 8B C6 EB 09 57 E8 CD +u...9.t.....W..
0040C400 E1 FF FF 83 C4 04 89 03 8B 44 24 14 8B 58 04 39 .........D$..X.9
0040C410 6B 08 75 73 80 7F 39 00 74 07 8B C6 89 43 08 EB k.us..9.t....C..
0040C420 66 57 E8 89 E1 FF FF 83 C4 04 89 43 08 EB 58 89 fW.........C..X.
0040C430 48 04 8B 55 00 89 11 3B 4D 08 75 04 8B F1 EB 1A H..U...;M.u.....
0040C440 80 7F 39 00 8B 71 04 75 03 89 77 04 89 3E 8B 45 ..9..q.u..w..>.E
0040C450 08 89 41 08 8B 55 08 89 4A 04 8B 43 04 39 68 04 ..A..U..J..C.9h.
0040C460 75 05 89 48 04 EB 0E 8B 45 04 39 28 75 04 89 08 u..H....E.9(u...
0040C470 EB 03 89 48 08 8B 45 04 89 41 04 8A 55 38 8A 41 ...H..E..A..U8.A
0040C480 38 88 51 38 88 45 38 BB 01 00 00 00 38 5D 38 0F 8.Q8.E8.....8]8.
0040C490 85 FF 00 00 00 8B 4C 24 14 8B 41 04 3B 78 04 0F ......L$..A.;x..
0040C4A0 84 EC 00 00 00 38 5F 38 0F 85 E3 00 00 00 8B 06 .....8_8........
0040C4B0 3B F8 75 67 8B 46 08 80 78 38 00 75 14 88 58 38 ;.ug.F..x8.u..X8
0040C4C0 56 C6 46 38 00 E8 26 E2 FF FF 8B 46 08 8B 4C 24 V.F8..&....F..L$
0040C4D0 14 80 78 39 00 75 76 8B 10 38 5A 38 75 08 8B 50 ..x9.uv..8Z8u..P
0040C4E0 08 38 5A 38 74 63 8B 50 08 38 5A 38 75 16 8B 10 .8Z8tc.P.8Z8u...
0040C4F0 88 5A 38 50 C6 40 38 00 E8 43 E2 FF FF 8B 46 08 .Z8P.@8..C....F.
0040C500 8B 4C 24 14 8A 56 38 88 50 38 88 5E 38 8B 40 08 .L$..V8.P8.^8.@.
0040C510 56 88 58 38 E8 D7 E1 FF FF EB 76 80 78 38 00 75 V.X8......v.x8.u
0040C520 13 88 58 38 56 C6 46 38 00 E8 12 E2 FF FF 8B 06 ..X8V.F8........
0040C530 8B 4C 24 14 80 78 39 00 75 13 8B 50 08 38 5A 38 .L$..x9.u..P.8Z8
0040C540 75 1E 8B 10 38 5A 38 75 17 C6 40 38 00 8B 41 04 u...8Z8u..@8..A.
0040C550 8B FE 3B 78 04 8B 76 04 0F 85 47 FF FF FF EB 31 ..;x..v...G....1
0040C560 8B 10 38 5A 38 75 16 8B 50 08 88 5A 38 50 C6 40 ..8Z8u..P..Z8P.@
0040C570 38 00 E8 79 E1 FF FF 8B 06 8B 4C 24 14 8A 56 38 8..y......L$..V8
0040C580 88 50 38 88 5E 38 8B 00 56 88 58 38 E8 AF E1 FF .P8.^8..V.X8....
0040C590 FF 88 5F 38 8D 75 0C 89 74 24 1C 8B 7E 20 89 5C .._8.u..t$..~ .\
0040C5A0 24 6C 33 DB 3B FB 74 27 8B 6E 24 3B FD 74 10 90 $l3.;.t'.n$;.t..
0040C5B0 8B CF FF 15 38 43 8A 00 83 C7 1C 3B FD 75 F1 8B ....8C.....;.u..
0040C5C0 46 20 50 E8 FE 89 28 00 8B 6C 24 1C 83 C4 04 8B F P...(..l$.....
0040C5D0 CE 89 5E 20 89 5E 24 89 5E 28 C7 44 24 6C FF FF ..^ .^$.^(.D$l..
0040C5E0 FF FF FF 15 38 43 8A 00 55 E8 D8 89 28 00 8B 4C ....8C..U...(..L
0040C5F0 24 18 8B 41 08 83 C4 04 3B C3 76 06 83 C0 FF 89 $..A....;.v.....
0040C600 41 08 8B 44 24 74 8B 4C 24 78 89 08 8B 4C 24 64 A..D$t.L$x...L$d
0040C610 64 89 0D 00 00 00 00 59 5F 5E 5D 5B 83 C4 5C C2 d......Y_^][..\.
0040C620 08 00 CC CC CC CC CC CC CC CC CC CC CC CC CC CC ................

;; fn0040C630: 0040C630
;;   Called from:
;;     0040C67C (in fn0040C630)
;;     0040CAB1 (in fn0040CA60)
fn0040C630 proc
	push	0FFh
	push	82C909h
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,8h
	push	ebx
	push	ebp
	push	esi
	push	edi
	mov	eax,[0A14188h]
	xor	eax,esp
	push	eax
	lea	eax,[esp+1Ch]
	mov	fs:[0000h],eax
	mov	[esp+14h],ecx
	mov	ebx,[esp+2Ch]
	cmp	byte ptr [ebx+39h],0h
	mov	ebp,ebx
	jnz	40C6EDh

l0040C66B:
	jmp	40C674h
0040C66D                                        8D 49 00              .I.

l0040C670:
	mov	ebx,[esp+2Ch]

l0040C674:
	mov	eax,[ebp+8h]
	mov	ecx,[esp+14h]
	push	eax
	call	40C630h
	mov	ebp,[ebp+0h]
	lea	esi,[ebx+0Ch]
	mov	[esp+18h],esi
	mov	edi,[esi+20h]
	xor	eax,eax
	cmp	edi,eax
	mov	[esp+24h],eax
	jz	40C6C1h

l0040C698:
	mov	ebx,[esi+24h]
	cmp	edi,ebx
	jz	40C6AFh

l0040C69F:
	nop

l0040C6A0:
	mov	ecx,edi
	call	dword ptr [8A4338h]
	add	edi,1Ch
	cmp	edi,ebx
	jnz	40C6A0h

l0040C6AF:
	mov	eax,[esi+20h]
	push	eax
	call	694FC6h
	mov	ebx,[esp+30h]
	add	esp,4h
	xor	eax,eax

l0040C6C1:
	mov	ecx,esi
	mov	[esi+20h],eax
	mov	[esi+24h],eax
	mov	[esi+28h],eax
	mov	dword ptr [esp+24h],0FFFFFFFFh
	call	dword ptr [8A4338h]
	push	ebx
	call	694FC6h
	add	esp,4h
	cmp	byte ptr [ebp+39h],0h
	mov	[esp+2Ch],ebp
	jz	40C670h

l0040C6ED:
	mov	ecx,[esp+1Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebp
	pop	ebx
	add	esp,14h
	ret	4h
0040C703          CC CC CC CC CC CC CC CC CC CC CC CC CC    .............

;; fn0040C710: 0040C710
;;   Called from:
;;     0040C987 (in fn0040C7F0)
fn0040C710 proc
	push	ecx
	push	ebx
	push	ebp
	mov	ebp,[esp+14h]
	push	esi
	mov	ebx,ecx
	push	edi
	mov	edi,[ebx+4h]
	mov	esi,[edi+4h]
	cmp	byte ptr [esi+39h],0h
	mov	al,1h
	mov	[esp+10h],al
	jnz	40C755h

l0040C72D:
	lea	ecx,[ecx+0h]

l0040C730:
	lea	eax,[esi+0Ch]
	push	eax
	push	ebp
	mov	edi,esi
	call	dword ptr [8A440Ch]
	add	esp,8h
	test	al,al
	mov	[esp+10h],al
	jz	40C74Ch

l0040C748:
	mov	esi,[esi]
	jmp	40C74Fh

l0040C74C:
	mov	esi,[esi+8h]

l0040C74F:
	cmp	byte ptr [esi+39h],0h
	jz	40C730h

l0040C755:
	test	al,al
	mov	esi,edi
	mov	[esp+1Ch],esi
	jz	40C797h

l0040C75F:
	mov	ecx,[ebx+4h]
	cmp	edi,[ecx]
	jnz	40C78Ah

l0040C766:
	push	ebp
	push	edi
	push	1h
	lea	edx,[esp+28h]
	push	edx
	mov	ecx,ebx
	call	40C130h
	mov	ecx,[eax]
	mov	eax,[esp+18h]
	pop	edi
	pop	esi
	pop	ebp
	mov	[eax],ecx
	mov	byte ptr [eax+4h],1h
	pop	ebx
	pop	ecx
	ret	8h

l0040C78A:
	lea	ecx,[esp+1Ch]
	call	40A5F0h
	mov	esi,[esp+1Ch]

l0040C797:
	lea	edx,[esi+0Ch]
	push	ebp
	push	edx
	call	dword ptr [8A440Ch]
	add	esp,8h
	test	al,al
	jz	40C7D0h

l0040C7A9:
	mov	eax,[esp+10h]
	push	ebp
	push	edi
	push	eax
	lea	ecx,[esp+28h]
	push	ecx
	mov	ecx,ebx
	call	40C130h
	mov	edx,[eax]
	mov	eax,[esp+18h]
	pop	edi
	pop	esi
	pop	ebp
	mov	[eax],edx
	mov	byte ptr [eax+4h],1h
	pop	ebx
	pop	ecx
	ret	8h

l0040C7D0:
	mov	eax,[esp+18h]
	pop	edi
	mov	[eax],esi
	pop	esi
	pop	ebp
	mov	byte ptr [eax+4h],0h
	pop	ebx
	pop	ecx
	ret	8h
0040C7E2       CC CC CC CC CC CC CC CC CC CC CC CC CC CC   ..............

;; fn0040C7F0: 0040C7F0
;;   Called from:
;;     0040CB5B (in fn0040CAE0)
fn0040C7F0 proc
	sub	esp,8h
	push	esi
	mov	esi,ecx
	cmp	dword ptr [esi+8h],0h
	push	edi
	jnz	40C81Eh

l0040C7FD:
	mov	eax,[esp+1Ch]
	mov	ecx,[esi+4h]
	mov	edi,[esp+14h]
	push	eax
	push	ecx
	push	1h
	push	edi
	mov	ecx,esi
	call	40C130h
	mov	eax,edi
	pop	edi
	pop	esi
	add	esp,8h
	ret	0Ch

l0040C81E:
	mov	eax,[esi+4h]
	mov	edi,[esp+1Ch]
	push	ebx
	mov	ebx,[esp+1Ch]
	cmp	ebx,[eax]
	push	ebp
	jnz	40C861h

l0040C82F:
	lea	edx,[ebx+0Ch]
	push	edx
	push	edi
	call	dword ptr [8A440Ch]
	add	esp,8h
	test	al,al
	jz	40C97Fh

l0040C845:
	push	edi
	mov	edi,[esp+20h]
	push	ebx
	push	1h
	push	edi
	mov	ecx,esi
	call	40C130h
	pop	ebp
	pop	ebx
	mov	eax,edi
	pop	edi
	pop	esi
	add	esp,8h
	ret	0Ch

l0040C861:
	cmp	ebx,eax
	jnz	40C8A0h

l0040C865:
	mov	eax,[eax+8h]
	add	eax,0Ch
	push	edi
	push	eax
	call	dword ptr [8A440Ch]
	add	esp,8h
	test	al,al
	jz	40C97Fh

l0040C87E:
	mov	eax,[esi+4h]
	mov	ecx,[eax+8h]
	push	edi
	mov	edi,[esp+20h]
	push	ecx
	push	0h
	push	edi
	mov	ecx,esi
	call	40C130h
	pop	ebp
	pop	ebx
	mov	eax,edi
	pop	edi
	pop	esi
	add	esp,8h
	ret	0Ch

l0040C8A0:
	lea	eax,[ebx+0Ch]
	push	eax
	push	edi
	call	dword ptr [8A440Ch]
	add	esp,8h
	test	al,al
	jz	40C90Dh

l0040C8B2:
	lea	ecx,[esp+24h]
	mov	[esp+24h],ebx
	call	40A5F0h
	mov	ebp,[esp+24h]
	push	edi
	lea	edx,[ebp+0Ch]
	push	edx
	mov	ecx,esi
	call	4055D0h
	test	al,al
	jz	40C90Dh

l0040C8D3:
	mov	eax,[ebp+8h]
	cmp	byte ptr [eax+39h],0h
	push	edi
	mov	edi,[esp+20h]
	mov	ecx,esi
	jz	40C8F8h

l0040C8E3:
	push	ebp
	push	0h
	push	edi
	call	40C130h
	pop	ebp
	pop	ebx
	mov	eax,edi
	pop	edi
	pop	esi
	add	esp,8h
	ret	0Ch

l0040C8F8:
	push	ebx
	push	1h
	push	edi
	call	40C130h
	pop	ebp
	pop	ebx
	mov	eax,edi
	pop	edi
	pop	esi
	add	esp,8h
	ret	0Ch

l0040C90D:
	lea	eax,[ebx+0Ch]
	push	edi
	push	eax
	call	dword ptr [8A440Ch]
	add	esp,8h
	test	al,al
	jz	40C97Fh

l0040C91F:
	lea	ecx,[esp+24h]
	mov	[esp+24h],ebx
	call	40A650h
	mov	ebp,[esp+24h]
	cmp	ebp,[esi+4h]
	jz	40C945h

l0040C935:
	lea	ecx,[ebp+0Ch]
	push	ecx
	push	edi
	mov	ecx,esi
	call	4055D0h
	test	al,al
	jz	40C97Fh

l0040C945:
	mov	edx,[ebx+8h]
	cmp	byte ptr [edx+39h],0h
	push	edi
	mov	edi,[esp+20h]
	mov	ecx,esi
	jz	40C96Ah

l0040C955:
	push	ebx
	push	0h
	push	edi
	call	40C130h
	pop	ebp
	pop	ebx
	mov	eax,edi
	pop	edi
	pop	esi
	add	esp,8h
	ret	0Ch

l0040C96A:
	push	ebp
	push	1h
	push	edi
	call	40C130h
	pop	ebp
	pop	ebx
	mov	eax,edi
	pop	edi
	pop	esi
	add	esp,8h
	ret	0Ch

l0040C97F:
	push	edi
	lea	eax,[esp+14h]
	push	eax
	mov	ecx,esi
	call	40C710h
	mov	ecx,[eax]
	mov	eax,[esp+1Ch]
	pop	ebp
	pop	ebx
	pop	edi
	mov	[eax],ecx
	pop	esi
	add	esp,8h
	ret	0Ch
0040C99E                                           CC CC               ..
0040C9A0 53 8B 5C 24 10 56 8B 74 24 10 57 8B F9 8B 47 04 S.\$.V.t$.W...G.
0040C9B0 3B 30 75 36 3B D8 75 32 8B 40 04 50 E8 6F FC FF ;0u6;.u2.@.P.o..
0040C9C0 FF 8B 47 04 89 40 04 8B 47 04 C7 47 08 00 00 00 ..G..@..G..G....
0040C9D0 00 89 00 8B 47 04 89 40 08 8B 4F 04 8B 11 8B 44 ....G..@..O....D
0040C9E0 24 10 5F 5E 89 10 5B C2 0C 00 3B F3 74 5A 8B FF $._^..[...;.tZ..
0040C9F0 80 7E 39 00 8B CE 75 3F 8B 46 08 80 78 39 00 75 .~9...u?.F..x9.u
0040CA00 1B 8B F0 8B 06 80 78 39 00 75 2C EB 03 8D 49 00 ......x9.u,...I.
0040CA10 8B F0 8B 06 80 78 39 00 74 F6 EB 1B 8B 46 04 80 .....x9.t....F..
0040CA20 78 39 00 75 10 3B 70 08 75 0B 8B F0 8B 40 04 80 x9.u.;p.u....@..
0040CA30 78 39 00 74 F0 8B F0 51 8D 44 24 18 50 8B CF E8 x9.t...Q.D$.P...
0040CA40 DC F8 FF FF 3B F3 75 A8 8B 44 24 10 5F 89 30 5E ....;.u..D$._.0^
0040CA50 5B C2 0C 00 CC CC CC CC CC CC CC CC CC CC CC CC [...............

;; fn0040CA60: 0040CA60
;;   Called from:
;;     0040CCBA (in fn0040CBA0)
;;     0040CD4E (in fn0040CBA0)
;;     0040CDCF (in fn0040CBA0)
;;     0040CE5D (in fn0040CBA0)
;;     0040D2B5 (in fn0040CBA0)
;;     0040D32C (in fn0040CBA0)
;;     0040D3A3 (in fn0040CBA0)
;;     0040D41A (in fn0040CBA0)
;;     0040D491 (in fn0040CBA0)
fn0040CA60 proc
	push	esi
	push	edi
	mov	edi,ecx
	mov	eax,[edi+40h]
	test	eax,eax
	jz	40CA7Ch

l0040CA6B:
	push	eax
	call	dword ptr [8A4644h]
	add	esp,4h
	mov	dword ptr [edi+40h],0h

l0040CA7C:
	mov	eax,[edi+2Ch]
	mov	ecx,[eax+4h]
	lea	esi,[edi+28h]
	push	ecx
	mov	ecx,esi
	call	629600h
	mov	eax,[esi+4h]
	mov	[eax+4h],eax
	mov	eax,[esi+4h]
	mov	dword ptr [esi+8h],0h
	mov	[eax],eax
	mov	esi,[esi+4h]
	mov	[esi+8h],esi
	mov	edx,[edi+38h]
	mov	eax,[edx+4h]
	lea	esi,[edi+34h]
	push	eax
	mov	ecx,esi
	call	40C630h
	mov	eax,[esi+4h]
	mov	[eax+4h],eax
	mov	eax,[esi+4h]
	mov	dword ptr [esi+8h],0h
	mov	[eax],eax
	mov	esi,[esi+4h]
	pop	edi
	mov	[esi+8h],esi
	pop	esi
	ret
0040CAD1    CC CC CC CC CC CC CC CC CC CC CC CC CC CC CC  ...............

;; fn0040CAE0: 0040CAE0
;;   Called from:
;;     0040CC54 (in fn0040CBA0)
;;     0040D05B (in fn0040CBA0)
fn0040CAE0 proc
	push	0FFh
	push	82C940h
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,3Ch
	push	ebx
	push	ebp
	push	esi
	push	edi
	mov	eax,[0A14188h]
	xor	eax,esp
	push	eax
	lea	eax,[esp+50h]
	mov	fs:[0000h],eax
	mov	esi,ecx
	mov	ebp,[esp+60h]
	push	ebp
	call	40A6A0h
	mov	edi,eax
	cmp	edi,[esi+4h]
	jz	40CB2Ch

l0040CB1A:
	lea	eax,[edi+0Ch]
	push	eax
	push	ebp
	call	dword ptr [8A440Ch]
	add	esp,8h
	test	al,al
	jz	40CB85h

l0040CB2C:
	xor	ebx,ebx
	mov	[esp+18h],ebx
	mov	[esp+1Ch],ebx
	mov	[esp+20h],ebx
	lea	ecx,[esp+14h]
	push	ecx
	push	ebp
	lea	ecx,[esp+2Ch]
	mov	[esp+60h],ebx
	call	40BDA0h
	push	eax
	push	edi
	lea	edx,[esp+68h]
	push	edx
	mov	ecx,esi
	mov	byte ptr [esp+64h],1h
	call	40C7F0h
	mov	esi,[eax]
	lea	ecx,[esp+24h]
	mov	[esp+58h],bl
	call	40BD40h
	lea	ecx,[esp+14h]
	mov	dword ptr [esp+58h],0FFFFFFFFh
	call	403900h
	lea	eax,[esi+28h]
	jmp	40CB88h

l0040CB85:
	lea	eax,[edi+28h]

l0040CB88:
	mov	ecx,[esp+50h]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebp
	pop	ebx
	add	esp,48h
	ret	4h
0040CB9E                                           CC CC               ..

;; fn0040CBA0: 0040CBA0
;;   Called from:
;;     0040D6F6 (in fn0040D620)
fn0040CBA0 proc
	push	0FFh
	push	82C9D7h
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,4ECh
	mov	eax,[0A14188h]
	xor	eax,esp
	mov	[esp+4E8h],eax
	push	ebx
	push	ebp
	push	esi
	push	edi
	mov	eax,[0A14188h]
	xor	eax,esp
	push	eax
	lea	eax,[esp+500h]
	mov	fs:[0000h],eax
	mov	ebx,[esp+510h]
	mov	esi,ecx
	lea	ecx,[esp+0A8h]
	call	dword ptr [8A43B0h]
	xor	edi,edi
	lea	ecx,[esp+0C4h]
	mov	[esp+508h],edi
	call	dword ptr [8A43B0h]
	lea	ecx,[esp+0E0h]
	mov	byte ptr [esp+508h],1h
	call	dword ptr [8A43B0h]
	mov	[esp+1Ch],edi
	mov	[esp+20h],edi
	mov	[esp+24h],edi
	push	8A698Fh
	lea	ecx,[esp+34h]
	mov	byte ptr [esp+50Ch],3h
	call	dword ptr [8A4334h]
	lea	eax,[esp+18h]
	push	eax
	lea	edx,[esp+34h]
	lea	ecx,[esi+34h]
	push	edx
	mov	byte ptr [esp+510h],4h
	call	40CAE0h
	mov	ecx,eax
	call	4085A0h
	lea	ecx,[esp+30h]
	mov	byte ptr [esp+508h],3h
	call	dword ptr [8A4338h]
	push	8A7744h
	mov	ecx,ebx
	call	dword ptr [8A4354h]
	push	eax
	call	dword ptr [8A4640h]
	add	esp,8h
	cmp	eax,edi
	mov	[esi+40h],eax
	jz	40CCBFh

l0040CC90:
	push	2h
	push	0EAh
	push	eax
	call	dword ptr [8A464Ch]
	add	esp,0Ch
	test	eax,eax
	jz	40CD19h

l0040CCA2:
	mov	ecx,ebx
	call	dword ptr [8A4354h]
	push	eax
	push	8A7704h
	call	520C80h
	add	esp,8h
	mov	ecx,esi
	call	40CA60h

l0040CCBF:
	lea	ecx,[esp+18h]
	mov	byte ptr [esp+508h],2h
	call	403900h
	lea	ecx,[esp+0E0h]
	mov	byte ptr [esp+508h],1h
	call	dword ptr [8A4338h]
	lea	ecx,[esp+0C4h]
	mov	byte ptr [esp+508h],0h
	call	dword ptr [8A4338h]
	lea	ecx,[esp+0A8h]
	mov	dword ptr [esp+508h],0FFFFFFFFh
	call	dword ptr [8A4338h]
	xor	al,al
	jmp	40D273h

l0040CD19:
	mov	eax,[esi+40h]
	mov	ebp,[8A463Ch]
	push	eax
	push	1h
	lea	ecx,[esp+58h]
	push	16h
	push	ecx
	call	ebp
	add	esp,10h
	cmp	eax,1h
	jz	40CDADh

l0040CD36:
	mov	ecx,ebx
	call	dword ptr [8A4354h]
	push	eax
	push	8A76C8h
	call	520C80h
	add	esp,8h
	mov	ecx,esi
	call	40CA60h
	lea	ecx,[esp+18h]
	mov	byte ptr [esp+508h],2h
	call	403900h
	lea	ecx,[esp+0E0h]
	mov	byte ptr [esp+508h],1h
	call	dword ptr [8A4338h]
	lea	ecx,[esp+0C4h]
	mov	byte ptr [esp+508h],0h
	call	dword ptr [8A4338h]
	lea	ecx,[esp+0A8h]
	mov	dword ptr [esp+508h],0FFFFFFFFh
	call	dword ptr [8A4338h]
	xor	al,al
	jmp	40D273h

l0040CDAD:
	cmp	dword ptr [esp+50h],6054B50h
	jz	40CE2Eh

l0040CDB7:
	mov	ecx,ebx
	call	dword ptr [8A4354h]
	push	eax
	push	8A7688h
	call	520C80h
	add	esp,8h
	mov	ecx,esi
	call	40CA60h
	lea	ecx,[esp+18h]
	mov	byte ptr [esp+508h],2h
	call	403900h
	lea	ecx,[esp+0E0h]
	mov	byte ptr [esp+508h],1h
	call	dword ptr [8A4338h]
	lea	ecx,[esp+0C4h]
	mov	byte ptr [esp+508h],0h
	call	dword ptr [8A4338h]
	lea	ecx,[esp+0A8h]
	mov	dword ptr [esp+508h],0FFFFFFFFh
	call	dword ptr [8A4338h]
	xor	al,al
	jmp	40D273h

l0040CE2E:
	mov	edx,[esp+60h]
	mov	eax,[esi+40h]
	push	edi
	push	edx
	push	eax
	call	dword ptr [8A464Ch]
	add	esp,0Ch
	test	eax,eax
	jz	40CEBCh

l0040CE45:
	mov	ecx,ebx
	call	dword ptr [8A4354h]
	push	eax
	push	8A7640h
	call	520C80h
	add	esp,8h
	mov	ecx,esi
	call	40CA60h
	lea	ecx,[esp+18h]
	mov	byte ptr [esp+508h],2h
	call	403900h
	lea	ecx,[esp+0E0h]
	mov	byte ptr [esp+508h],1h
	call	dword ptr [8A4338h]
	lea	ecx,[esp+0C4h]
	mov	byte ptr [esp+508h],0h
	call	dword ptr [8A4338h]
	lea	ecx,[esp+0A8h]
	mov	dword ptr [esp+508h],0FFFFFFFFh
	call	dword ptr [8A4338h]
	xor	al,al
	jmp	40D273h

l0040CEBC:
	cmp	[esp+5Ah],di
	mov	[esp+28h],edi
	jbe	40D21Eh

l0040CECB:
	mov	ecx,[esi+40h]
	push	ecx
	push	1h
	lea	edx,[esp+70h]
	push	2Eh
	push	edx
	call	ebp
	add	esp,10h
	cmp	eax,1h
	jnz	40D29Dh

l0040CEE6:
	cmp	dword ptr [esp+68h],2014B50h
	jnz	40D314h

l0040CEF4:
	mov	ax,[esp+84h]
	mov	ecx,400h
	cmp	ax,cx
	ja	40D38Bh

l0040CF0A:
	cmp	[esp+86h],cx
	ja	40D402h

l0040CF18:
	cmp	[esp+88h],cx
	ja	40D479h

l0040CF26:
	mov	ecx,[esi+40h]
	push	ecx
	movzx	edx,ax
	push	1h
	push	edx
	lea	eax,[esp+108h]
	push	eax
	call	ebp
	movzx	ecx,word ptr [esp+94h]
	add	esp,10h
	push	ecx
	lea	edx,[esp+100h]
	push	edx
	lea	ecx,[esp+0B0h]
	call	dword ptr [8A4418h]
	lea	eax,[esp+98h]
	push	eax
	lea	ecx,[esp+0ACh]
	mov	byte ptr [esp+1Ah],2Fh
	mov	byte ptr [esp+1Bh],5Ch
	call	dword ptr [8A43D0h]
	lea	ecx,[esp+0A0h]
	push	ecx
	lea	ecx,[esp+0ACh]
	mov	edi,eax
	call	dword ptr [8A43CCh]
	lea	edx,[esp+16h]
	push	edx
	mov	edx,[edi+4h]
	lea	ecx,[esp+1Bh]
	push	ecx
	mov	ecx,[edi]
	push	edx
	mov	edx,[eax+4h]
	mov	eax,[eax]
	push	ecx
	push	edx
	push	eax
	call	402230h
	mov	ecx,[esi+40h]
	movzx	edx,word ptr [esp+9Eh]
	push	ecx
	push	1h
	push	edx
	lea	eax,[esp+120h]
	push	eax
	call	ebp
	mov	ecx,[esi+40h]
	movzx	edx,word ptr [esp+0B0h]
	push	ecx
	push	1h
	push	edx
	lea	eax,[esp+130h]
	push	eax
	call	ebp
	add	esp,38h
	lea	ecx,[esp+0A8h]
	call	dword ptr [8A4344h]
	push	ecx
	mov	ecx,esp
	sub	eax,1h
	mov	[ecx],eax
	lea	ecx,[esp+0ACh]
	mov	[esp+50h],esp
	call	dword ptr [8A43C8h]
	cmp	byte ptr [eax],2Fh
	jnz	40D079h

l0040D00E:
	mov	ecx,[8A434Ch]
	mov	edx,[ecx]
	push	edx
	lea	ecx,[esp+0ACh]
	call	dword ptr [8A4344h]
	sub	eax,1h
	push	eax
	lea	ecx,[esp+0B0h]
	call	dword ptr [8A4410h]
	lea	eax,[esp+0A8h]
	push	eax
	lea	ecx,[esp+34h]
	push	ecx
	call	40A480h
	add	esp,8h
	lea	edx,[esp+18h]
	push	edx
	push	eax
	lea	ecx,[esi+34h]
	mov	byte ptr [esp+510h],5h
	call	40CAE0h
	mov	ecx,eax
	call	4085A0h
	lea	ecx,[esp+30h]
	mov	byte ptr [esp+508h],3h
	call	dword ptr [8A4338h]

l0040D079:
	lea	eax,[esp+0A8h]
	push	eax
	lea	ecx,[esp+34h]
	push	ecx
	call	40A480h
	add	esp,8h
	push	eax
	lea	ecx,[esi+28h]
	mov	byte ptr [esp+50Ch],6h
	call	40BC80h
	mov	edx,[esp+92h]
	lea	ecx,[esp+30h]
	mov	[eax],edx
	mov	byte ptr [esp+508h],3h
	call	dword ptr [8A4338h]
	mov	eax,[8A434Ch]
	mov	ecx,[eax]
	push	ecx
	push	2Fh
	lea	ecx,[esp+0B0h]
	call	dword ptr [8A4414h]
	mov	edi,eax
	cmp	edi,0FFh
	jnz	40D104h

l0040D0D8:
	push	8A698Fh
	lea	ecx,[esp+0C8h]
	call	dword ptr [8A43E0h]
	lea	edx,[esp+0A8h]
	push	edx
	lea	ecx,[esp+0E4h]
	call	dword ptr [8A4358h]
	jmp	40D188h

l0040D104:
	push	edi
	push	0h
	lea	eax,[esp+38h]
	push	eax
	lea	ecx,[esp+0B4h]
	call	dword ptr [8A4340h]
	push	eax
	lea	ecx,[esp+0C8h]
	mov	byte ptr [esp+50Ch],7h
	call	dword ptr [8A4358h]
	lea	ecx,[esp+30h]
	mov	byte ptr [esp+508h],3h
	call	dword ptr [8A4338h]
	mov	ecx,[8A434Ch]
	mov	edx,[ecx]
	push	edx
	add	edi,1h
	push	edi
	lea	eax,[esp+38h]
	push	eax
	lea	ecx,[esp+0B4h]
	call	dword ptr [8A4340h]
	push	eax
	lea	ecx,[esp+0E4h]
	mov	byte ptr [esp+50Ch],8h
	call	dword ptr [8A4358h]
	lea	ecx,[esp+30h]
	mov	byte ptr [esp+508h],3h
	call	dword ptr [8A4338h]

l0040D188:
	lea	ecx,[esp+0C4h]
	push	ecx
	lea	edx,[esp+34h]
	push	edx
	call	40A480h
	add	esp,8h
	push	eax
	lea	eax,[esp+30h]
	push	eax
	lea	ecx,[esi+34h]
	mov	byte ptr [esp+510h],9h
	call	40AB30h
	lea	ecx,[esp+30h]
	mov	byte ptr [esp+508h],3h
	call	dword ptr [8A4338h]
	mov	eax,[esi+38h]
	mov	ecx,[esp+2Ch]
	cmp	ecx,eax
	jnz	40D1F6h

l0040D1D0:
	mov	ecx,ebx
	call	dword ptr [8A4354h]
	push	eax
	lea	ecx,[esp+0C8h]
	call	dword ptr [8A4354h]
	push	eax
	push	8A75F8h
	call	520C80h
	add	esp,0Ch
	jmp	40D206h

l0040D1F6:
	lea	edx,[esp+0E0h]
	push	edx
	add	ecx,28h
	call	403ED0h

l0040D206:
	mov	eax,[esp+28h]
	movzx	ecx,word ptr [esp+5Ah]
	add	eax,1h
	cmp	eax,ecx
	mov	[esp+28h],eax
	jc	40CECBh

l0040D21E:
	lea	ecx,[esp+18h]
	mov	byte ptr [esp+508h],2h
	call	403900h
	lea	ecx,[esp+0E0h]
	mov	byte ptr [esp+508h],1h
	call	dword ptr [8A4338h]
	lea	ecx,[esp+0C4h]
	mov	byte ptr [esp+508h],0h
	call	dword ptr [8A4338h]
	lea	ecx,[esp+0A8h]
	mov	dword ptr [esp+508h],0FFFFFFFFh
	call	dword ptr [8A4338h]
	mov	al,1h

l0040D273:
	mov	ecx,[esp+500h]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebp
	pop	ebx
	mov	ecx,[esp+4E8h]
	xor	ecx,esp
	call	694B8Eh
	add	esp,4F8h
	ret	4h

l0040D29D:
	mov	ecx,ebx
	call	dword ptr [8A4354h]
	push	eax
	push	8A75B0h
	call	520C80h
	add	esp,8h
	mov	ecx,esi
	call	40CA60h
	lea	ecx,[esp+18h]
	mov	byte ptr [esp+508h],2h
	call	403900h
	lea	ecx,[esp+0E0h]
	mov	byte ptr [esp+508h],1h
	call	dword ptr [8A4338h]
	lea	ecx,[esp+0C4h]
	mov	byte ptr [esp+508h],0h
	call	dword ptr [8A4338h]
	lea	ecx,[esp+0A8h]
	mov	dword ptr [esp+508h],0FFFFFFFFh
	call	dword ptr [8A4338h]
	xor	al,al
	jmp	40D273h

l0040D314:
	mov	ecx,ebx
	call	dword ptr [8A4354h]
	push	eax
	push	8A7568h
	call	520C80h
	add	esp,8h
	mov	ecx,esi
	call	40CA60h
	lea	ecx,[esp+18h]
	mov	byte ptr [esp+508h],2h
	call	403900h
	lea	ecx,[esp+0E0h]
	mov	byte ptr [esp+508h],1h
	call	dword ptr [8A4338h]
	lea	ecx,[esp+0C4h]
	mov	byte ptr [esp+508h],0h
	call	dword ptr [8A4338h]
	lea	ecx,[esp+0A8h]
	mov	dword ptr [esp+508h],0FFFFFFFFh
	call	dword ptr [8A4338h]
	xor	al,al
	jmp	40D273h

l0040D38B:
	mov	ecx,ebx
	call	dword ptr [8A4354h]
	push	eax
	push	8A752Ch
	call	520C80h
	add	esp,8h
	mov	ecx,esi
	call	40CA60h
	lea	ecx,[esp+18h]
	mov	byte ptr [esp+508h],2h
	call	403900h
	lea	ecx,[esp+0E0h]
	mov	byte ptr [esp+508h],1h
	call	dword ptr [8A4338h]
	lea	ecx,[esp+0C4h]
	mov	byte ptr [esp+508h],0h
	call	dword ptr [8A4338h]
	lea	ecx,[esp+0A8h]
	mov	dword ptr [esp+508h],0FFFFFFFFh
	call	dword ptr [8A4338h]
	xor	al,al
	jmp	40D273h

l0040D402:
	mov	ecx,ebx
	call	dword ptr [8A4354h]
	push	eax
	push	8A74ECh
	call	520C80h
	add	esp,8h
	mov	ecx,esi
	call	40CA60h
	lea	ecx,[esp+18h]
	mov	byte ptr [esp+508h],2h
	call	403900h
	lea	ecx,[esp+0E0h]
	mov	byte ptr [esp+508h],1h
	call	dword ptr [8A4338h]
	lea	ecx,[esp+0C4h]
	mov	byte ptr [esp+508h],0h
	call	dword ptr [8A4338h]
	lea	ecx,[esp+0A8h]
	mov	dword ptr [esp+508h],0FFFFFFFFh
	call	dword ptr [8A4338h]
	xor	al,al
	jmp	40D273h

l0040D479:
	mov	ecx,ebx
	call	dword ptr [8A4354h]
	push	eax
	push	8A74ACh
	call	520C80h
	add	esp,8h
	mov	ecx,esi
	call	40CA60h
	lea	ecx,[esp+18h]
	mov	byte ptr [esp+508h],2h
	call	403900h
	lea	ecx,[esp+0E0h]
	mov	byte ptr [esp+508h],1h
	call	dword ptr [8A4338h]
	lea	ecx,[esp+0C4h]
	mov	byte ptr [esp+508h],0h
	call	dword ptr [8A4338h]
	lea	ecx,[esp+0A8h]
	mov	dword ptr [esp+508h],0FFFFFFFFh
	call	dword ptr [8A4338h]
	xor	al,al
	jmp	40D273h
0040D4F0 51 56 8B F1 8B 46 04 8B 08 50 51 8D 44 24 0C 50 QV...F...PQ.D$.P
0040D500 8B CE E8 99 F4 FF FF 8B 4E 04 51 E8 B6 7A 28 00 ........N.Q..z(.
0040D510 83 C4 04 33 C0 89 46 04 89 46 08 5E 59 C3 CC CC ...3..F..F.^Y...
0040D520 6A FF 68 4D CA 82 00 64 A1 00 00 00 00 50 83 EC j.hM...d.....P..
0040D530 08 53 55 56 57 A1 88 41 A1 00 33 C4 50 8D 44 24 .SUVW..A..3.P.D$
0040D540 1C 64 A3 00 00 00 00 8B F1 89 74 24 14 C7 06 48 .d........t$...H
0040D550 77 8A 00 33 DB 89 5C 24 24 8D 6E 04 8B FD 8B 07 w..3..\$$.n.....
0040D560 6A FF 50 89 7C 24 20 FF 15 F4 40 8A 00 C6 47 04 j.P.|$ ...@...G.
0040D570 01 8B CE C6 44 24 24 05 E8 E3 F4 FF FF 8B 0F 51 ....D$$........Q
0040D580 88 5F 04 FF 15 F0 40 8A 00 8B 46 38 8B 08 8D 7E ._....@...F8...~
0040D590 34 50 51 8D 54 24 20 52 8B CF C6 44 24 30 03 E8 4PQ.T$ R...D$0..
0040D5A0 FC F3 FF FF 8B 47 04 50 E8 19 7A 28 00 89 5F 04 .....G.P..z(.._.
0040D5B0 89 5F 08 8B 46 2C 8B 08 83 C4 04 8D 7E 28 50 51 ._..F,......~(PQ
0040D5C0 8D 44 24 20 50 8B CF C6 44 24 30 02 E8 EF E5 FF .D$ P...D$0.....
0040D5D0 FF 8B 47 04 50 E8 EC 79 28 00 83 C4 04 8D 4E 0C ..G.P..y(.....N.
0040D5E0 89 5F 04 89 5F 08 C6 44 24 24 01 FF 15 38 43 8A ._.._..D$$...8C.
0040D5F0 00 8B 4D 00 51 FF 15 F8 40 8A 00 C7 06 5C 70 8A ..M.Q...@....\p.
0040D600 00 8B 4C 24 1C 64 89 0D 00 00 00 00 59 5F 5E 5D ..L$.d......Y_^]
0040D610 5B 83 C4 14 C3 CC CC CC CC CC CC CC CC CC CC CC [...............

;; fn0040D620: 0040D620
;;   Called from:
;;     00402630 (in fn004023A0)
;;     004026A9 (in fn004023A0)
fn0040D620 proc
	push	0FFh
	push	82CAADh
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,8h
	push	ebx
	push	ebp
	push	esi
	push	edi
	mov	eax,[0A14188h]
	xor	eax,esp
	push	eax
	lea	eax,[esp+1Ch]
	mov	fs:[0000h],eax
	mov	esi,ecx
	mov	[esp+14h],esi
	xor	ebx,ebx
	push	ebx
	push	ebx
	push	ebx
	mov	[esp+30h],ebx
	mov	dword ptr [esi],8A7748h
	lea	ebp,[esi+4h]
	call	dword ptr [8A40FCh]
	mov	[ebp+0h],eax
	mov	[ebp+4h],bl
	mov	eax,[esp+2Ch]
	push	eax
	lea	ecx,[esi+0Ch]
	mov	byte ptr [esp+28h],1h
	call	dword ptr [8A433Ch]
	lea	edi,[esi+28h]
	mov	ecx,edi
	mov	byte ptr [esp+24h],2h
	call	811B80h
	mov	[edi+4h],eax
	mov	byte ptr [eax+2Dh],1h
	mov	eax,[edi+4h]
	mov	[eax+4h],eax
	mov	eax,[edi+4h]
	mov	[eax],eax
	mov	eax,[edi+4h]
	mov	[eax+8h],eax
	mov	[edi+8h],ebx
	lea	edi,[esi+34h]
	mov	ecx,edi
	mov	byte ptr [esp+24h],3h
	call	40A850h
	mov	[edi+4h],eax
	mov	byte ptr [eax+39h],1h
	mov	eax,[edi+4h]
	mov	[eax+4h],eax
	mov	eax,[edi+4h]
	mov	[eax],eax
	mov	eax,[edi+4h]
	mov	[eax+8h],eax
	mov	[edi+8h],ebx
	mov	edi,ebp
	mov	[esi+40h],ebx
	mov	ecx,[edi]
	push	0FFh
	push	ecx
	mov	[esp+20h],edi
	call	dword ptr [8A40F4h]
	mov	byte ptr [edi+4h],1h
	mov	edx,[esp+2Ch]
	push	edx
	mov	ecx,esi
	mov	byte ptr [esp+28h],5h
	call	40CBA0h
	mov	eax,[edi]
	push	eax
	mov	[edi+4h],bl
	call	dword ptr [8A40F0h]
	mov	eax,esi
	mov	ecx,[esp+1Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebp
	pop	ebx
	add	esp,14h
	ret	4h
0040D71F                                              CC                .
0040D720 56 8B F1 E8 F8 FD FF FF F6 44 24 08 01 74 09 56 V........D$..t.V
0040D730 E8 91 78 28 00 83 C4 04 8B C6 5E C2 04 00 CC CC ..x(......^.....
0040D740 6A FF 68 DB CA 82 00 64 A1 00 00 00 00 50 51 56 j.h....d.....PQV
0040D750 A1 88 41 A1 00 33 C4 50 8D 44 24 0C 64 A3 00 00 ..A..3.P.D$.d...
0040D760 00 00 8B F1 6A 44 E8 6D 78 28 00 83 C4 04 89 44 ....jD.mx(.....D
0040D770 24 08 85 C0 C7 44 24 14 00 00 00 00 74 1C 83 C6 $....D$.....t...
0040D780 0C 56 8B C8 E8 97 FE FF FF 8B 4C 24 0C 64 89 0D .V........L$.d..
0040D790 00 00 00 00 59 5E 83 C4 10 C3 33 C0 8B 4C 24 0C ....Y^....3..L$.
0040D7A0 64 89 0D 00 00 00 00 59 5E 83 C4 10 C3 CC CC CC d......Y^.......
0040D7B0 8A 44 24 04 C2 04 00 CC CC CC CC CC CC CC CC CC .D$.............
0040D7C0 8B 44 24 04 C2 04 00 CC CC CC CC CC CC CC CC CC .D$.............
0040D7D0 D9 44 24 04 C2 04 00 CC CC CC CC CC CC CC CC CC .D$.............
0040D7E0 DD 44 24 04 C2 08 00 CC CC CC CC CC CC CC CC CC .D$.............
0040D7F0 51 8B 44 24 0C 56 8B 74 24 0C 50 8B CE C7 44 24 Q.D$.V.t$.P...D$
0040D800 08 00 00 00 00 FF 15 3C 43 8A 00 8B C6 5E 59 C2 .......<C....^Y.
0040D810 0C 00 CC CC CC CC CC CC CC CC CC CC CC CC CC CC ................
0040D820 51 8B 44 24 0C 56 8B 74 24 0C 50 8B CE C7 44 24 Q.D$.V.t$.P...D$
0040D830 08 00 00 00 00 FF 15 1C 44 8A 00 8B C6 5E 59 C2 ........D....^Y.
0040D840 0C 00 CC CC CC CC CC CC CC CC CC CC CC CC CC CC ................
0040D850 8B 4C 24 08 8B 11 8B 44 24 04 8B 49 04 89 10 89 .L$....D$..I....
0040D860 48 04 C2 08 00 CC CC CC CC CC CC CC CC CC CC CC H...............
0040D870 8B 4C 24 08 8B 11 8B 44 24 04 89 10 8B 51 04 8B .L$....D$....Q..
0040D880 49 08 89 50 04 89 48 08 C2 08 00 CC CC CC CC CC I..P..H.........
0040D890 8B 4C 24 08 8B 44 24 04 8B 11 89 10 8B 51 04 89 .L$..D$......Q..
0040D8A0 50 04 8B 51 08 8B 49 0C 89 50 08 89 48 0C C2 08 P..Q..I..P..H...
0040D8B0 00 CC CC CC CC CC CC CC CC CC CC CC CC CC CC CC ................
0040D8C0 51 8B 44 24 0C 56 8B 74 24 0C 50 8B CE C7 44 24 Q.D$.V.t$.P...D$
0040D8D0 08 00 00 00 00 FF 15 3C 43 8A 00 8B C6 5E 59 C2 .......<C....^Y.
0040D8E0 08 00 CC CC CC CC CC CC CC CC CC CC CC CC CC CC ................
0040D8F0 32 C0 C2 0C 00 CC CC CC CC CC CC CC CC CC CC CC 2...............
0040D900 8D 4C 24 04 FF 15 38 43 8A 00 C2 1C 00 CC CC CC .L$...8C........

;; fn0040D910: 0040D910
;;   Called from:
;;     007B252B (in fn007B24F7)
;;     007B253F (in fn007B24F7)
;;     007B2566 (in fn007B24F7)
fn0040D910 proc
	mov	edx,[ecx+4h]
	test	edx,edx
	jnz	40D91Ah

l0040D917:
	xor	eax,eax
	ret

l0040D91A:
	mov	eax,[ecx+8h]
	sub	eax,edx
	sar	eax,2h
	ret
0040D923          CC CC CC CC CC CC CC CC CC CC CC CC CC    .............

;; fn0040D930: 0040D930
;;   Called from:
;;     00403A65 (in fn00403950)
;;     00408692 (in fn004085A0)
;;     004086EB (in fn004085A0)
fn0040D930 proc
	mov	eax,[ecx+4h]
	test	eax,eax
	jnz	40D938h

l0040D937:
	ret

l0040D938:
	mov	ecx,[ecx+8h]
	sub	ecx,eax
	mov	eax,92492493h
	imul	ecx
	add	edx,ecx
	sar	edx,4h
	mov	eax,edx
	shr	eax,1Fh
	add	eax,edx
	ret
0040D951    CC CC CC CC CC CC CC CC CC CC CC CC CC CC CC  ...............
0040D960 8B C1 8B 4C 24 04 85 C9 74 46 56 7D 2C 8B 50 04 ...L$...tFV},.P.
0040D970 8B F1 F7 DE 3B D6 73 21 03 CA 83 CA FF 2B D1 C1 ....;.s!.....+..
0040D980 EA 05 03 D2 03 D2 BE FC FF FF FF 2B F2 01 30 83 ...........+..0.
0040D990 E1 1F 89 48 04 5E C2 04 00 8B 50 04 03 CA 8B D1 ...H.^....P.....
0040D9A0 C1 EA 05 03 D2 03 D2 01 10 83 E1 1F 89 48 04 5E .............H.^
0040D9B0 C2 04 00 CC CC CC CC CC CC CC CC CC CC CC CC CC ................

;; fn0040D9C0: 0040D9C0
;;   Called from:
;;     00414C00 (in fn00414B80)
fn0040D9C0 proc
	push	0FFh
	push	82CB09h
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

;; fn0040DA20: 0040DA20
;;   Called from:
;;     00411A09 (in fn004119C0)
fn0040DA20 proc
	push	0FFh
	push	82CB39h
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
	push	82CB69h
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

;; fn0040DAE0: 0040DAE0
;;   Called from:
;;     00411D8D (in fn00411D40)
fn0040DAE0 proc
	push	0FFh
	push	82CB99h
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
	push	82CBC9h
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
	push	82CBF9h
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
	push	82CC29h
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
	push	82CC59h
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

;; fn0040DCC0: 0040DCC0
;;   Called from:
;;     0040DCBF (in fn0040DA20)
;;     0040DCBF (in fn0040DAE0)
;;     00411F8C (in fn00411F00)
fn0040DCC0 proc
	push	0FFh
	push	82CC89h
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,44h
	mov	eax,[0A14188h]
	xor	eax,esp
	push	eax
	lea	eax,[esp+48h]
	mov	fs:[0000h],eax
	push	8A7778h
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
	push	82CCB9h
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,44h
	mov	eax,[0A14188h]
	xor	eax,esp
	push	eax
	lea	eax,[esp+48h]
	mov	fs:[0000h],eax
	push	8A778Ch
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
	push	82CCE9h
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

;; fn0040DDE0: 0040DDE0
;;   Called from:
;;     00401EED (in fn00401EC0)
;;     00403A75 (in fn00403950)
;;     0040DDDF (in fn0040D9C0)
;;     0040DDDF (in fn0040DCC0)
;;     006216AD (in fn00621680)
fn0040DDE0 proc
	mov	ecx,[esp+4h]
	sub	esp,0Ch
	test	ecx,ecx
	ja	40DE07h

l0040DDEB:
	xor	ecx,ecx

l0040DDED:
	lea	edx,[0000h+ecx*8]
	sub	edx,ecx
	add	edx,edx
	add	edx,edx
	push	edx
	call	694FD8h
	add	esp,4h
	add	esp,0Ch
	ret

l0040DE07:
	or	eax,0FFh
	xor	edx,edx
	div	ecx
	cmp	eax,1Ch
	jnc	40DDEDh

l0040DE13:
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
	int	3h
	int	3h
	mov	eax,[esp+4h]
	mov	ecx,[0A53FCCh]
	mov	edx,[0A53FD0h]
	mov	[eax],ecx
	mov	ecx,[0A53FD4h]
	mov	[eax+4h],edx
	mov	[eax+8h],ecx
	ret
0040DE6F                                              CC                .
0040DE70 8B 44 24 04 8B 0D D8 3F A5 00 8B 15 DC 3F A5 00 .D$....?.....?..
0040DE80 89 08 8B 0D E0 3F A5 00 89 50 04 8B 15 E4 3F A5 .....?...P....?.
0040DE90 00 89 48 08 89 50 0C C3 CC CC CC CC CC CC CC CC ..H..P..........
0040DEA0 51 56 8B 74 24 0C 8B CE C7 44 24 04 00 00 00 00 QV.t$....D$.....
0040DEB0 FF 15 B0 43 8A 00 8B C6 5E 59 C3 CC CC CC CC CC ...C....^Y......
0040DEC0 8B 51 04 8B 44 24 04 3B 50 04 75 0B 8B 09 3B 08 .Q..D$.;P.u...;.
0040DED0 75 05 33 C0 C2 04 00 B8 01 00 00 00 C2 04 00 CC u.3.............
0040DEE0 6A FF 68 18 CD 82 00 64 A1 00 00 00 00 50 51 56 j.h....d.....PQV
0040DEF0 A1 88 41 A1 00 33 C4 50 8D 44 24 0C 64 A3 00 00 ..A..3.P.D$.d...
0040DF00 00 00 8B F1 89 74 24 08 C7 06 B0 6E 8A 00 56 C7 .....t$....n..V.
0040DF10 44 24 18 00 00 00 00 E8 E4 8E FF FF 83 C4 04 C7 D$..............
0040DF20 06 78 6D 8A 00 8B 4C 24 0C 64 89 0D 00 00 00 00 .xm...L$.d......
0040DF30 59 5E 83 C4 10 C3 CC CC CC CC CC CC CC CC CC CC Y^..............
0040DF40 8B 44 24 04 56 8B 74 24 0C 57 B9 10 00 00 00 8B .D$.V.t$.W......
0040DF50 F8 F3 A5 5F 5E C2 08 00 CC CC CC CC CC CC CC CC ..._^...........

;; fn0040DF60: 0040DF60
;;   Called from:
;;     00411EB7 (in fn00411D40)
;;     00411EEA (in fn00411D40)
fn0040DF60 proc
	mov	eax,[esp+4h]
	mov	ecx,[esp+8h]
	cmp	eax,ecx
	jz	40DF7Ch

l0040DF6C:
	mov	edx,[esp+0Ch]

l0040DF70:
	fld	dword ptr [edx]
	add	eax,4h
	cmp	eax,ecx
	fstp	dword ptr [eax-4h]
	jnz	40DF70h

l0040DF7C:
	ret
0040DF7D                                        CC CC CC              ...
0040DF80 56 8B 74 24 08 57 8B 7C 24 10 3B F7 74 16 53 8B V.t$.W.|$.;.t.S.
0040DF90 5C 24 18 53 8B CE FF 15 20 44 8A 00 83 C6 1C 3B \$.S.... D.....;
0040DFA0 F7 75 F0 5B 5F 5E C3 CC CC CC CC CC CC CC CC CC .u.[_^..........

;; fn0040DFB0: 0040DFB0
;;   Called from:
;;     0040E08A (in fn0040E060)
fn0040DFB0 proc
	mov	eax,[esp+0Ch]
	push	ebx
	mov	ebx,[esp+0Ch]
	cmp	ebx,eax
	jz	40DFE2h

l0040DFBD:
	mov	edx,[esp+14h]
	push	esi
	push	edi

l0040DFC3:
	sub	eax,40h
	sub	edx,40h
	cmp	eax,ebx
	mov	ecx,10h
	mov	esi,eax
	mov	edi,edx

l0040DFD4:
	rep movsd

l0040DFD6:
	jnz	40DFC3h

l0040DFD8:
	mov	eax,[esp+10h]
	pop	edi
	pop	esi
	mov	[eax],edx
	pop	ebx
	ret

l0040DFE2:
	mov	eax,[esp+8h]
	mov	ecx,[esp+14h]
	mov	[eax],ecx
	pop	ebx
	ret
0040DFEE                                           CC CC               ..
0040DFF0 83 EC 08 8B 01 8B 49 04 8B 54 24 10 89 4C 24 04 ......I..T$..L$.
0040E000 52 8D 4C 24 04 89 44 24 04 E8 52 F9 FF FF 8B 44 R.L$..D$..R....D
0040E010 24 0C 8B 0C 24 8B 54 24 04 89 08 89 50 04 83 C4 $...$.T$....P...
0040E020 08 C2 08 00 CC CC CC CC CC CC CC CC CC CC CC CC ................
0040E030 53 8B 5C 24 08 56 8B 74 24 10 3B DE 57 8B 7C 24 S.\$.V.t$.;.W.|$
0040E040 18 74 13 83 EE 1C 83 EF 1C 56 8B CF FF 15 24 44 .t.......V....$D
0040E050 8A 00 3B F3 75 ED 8B C7 5F 5E 5B C3 CC CC CC CC ..;.u..._^[.....

;; fn0040E060: 0040E060
;;   Called from:
;;     00412141 (in fn00411F00)
fn0040E060 proc
	push	ecx
	mov	ecx,[esp+8h]
	mov	edx,[esp+8h]
	push	esi
	mov	esi,[esp+0Ch]
	mov	byte ptr [esp+4h],0h
	mov	eax,[esp+4h]
	push	eax
	mov	eax,[esp+1Ch]
	push	ecx
	mov	ecx,[esp+1Ch]
	push	edx
	mov	edx,[esp+1Ch]
	push	eax
	push	ecx
	push	edx
	push	esi
	call	40DFB0h
	add	esp,1Ch
	mov	eax,esi
	pop	esi
	pop	ecx
	ret
0040E097                      CC CC CC CC CC CC CC CC CC        .........
0040E0A0 8B 54 24 14 8B 4C 24 08 8B 44 24 04 53 56 8B 74 .T$..L$..D$.SV.t
0040E0B0 24 18 57 8B 7C 24 18 3B C7 75 04 3B CE 74 25 BB $.W.|$.;.u.;.t%.
0040E0C0 01 00 00 00 D3 E3 80 3A 00 74 04 09 18 EB 04 F7 .......:.t......
0040E0D0 D3 21 18 83 F9 1F 73 05 83 C1 01 EB DA 33 C9 83 .!....s......3..
0040E0E0 C0 04 EB D3 5F 5E 5B C3 CC CC CC CC CC CC CC CC ...._^[.........
0040E0F0 55 8B EC 6A FF 68 5A CD 82 00 64 A1 00 00 00 00 U..j.hZ...d.....
0040E100 50 83 EC 34 A1 88 41 A1 00 33 C5 89 45 EC 53 56 P..4..A..3..E.SV
0040E110 57 50 8D 45 F4 64 A3 00 00 00 00 89 65 F0 8B 75 WP.E.d......e..u
0040E120 10 8B 7D 08 8D 4D D0 89 75 CC 89 75 C8 FF 15 2C ..}..M..u..u...,
0040E130 44 8A 00 8B 5D 0C C7 45 FC 00 00 00 00 8D 49 00 D...]..E......I.
0040E140 3B FB 74 54 89 75 C4 89 75 C0 85 F6 C6 45 FC 02 ;.tT.u..u....E..
0040E150 74 0C 8D 45 D0 50 8B CE FF 15 1C 44 8A 00 57 8B t..E.P.....D..W.
0040E160 CE C6 45 FC 01 FF 15 24 44 8A 00 83 C6 1C 89 75 ..E....$D......u
0040E170 CC 83 C7 1C EB CA 8B 75 C8 8B 7D CC 3B F7 74 0F .......u..}.;.t.
0040E180 8B CE FF 15 28 44 8A 00 83 C6 1C 3B F7 75 F1 6A ....(D.....;.u.j
0040E190 00 6A 00 E8 34 6E 28 00 8D 4D D0 C7 45 FC FF FF .j..4n(..M..E...
0040E1A0 FF FF FF 15 28 44 8A 00 8B C6 8B 4D F4 64 89 0D ....(D.....M.d..
0040E1B0 00 00 00 00 59 5F 5E 5B 8B 4D EC 33 CD E8 CC 69 ....Y_^[.M.3...i
0040E1C0 28 00 8B E5 5D C3 CC CC CC CC CC CC CC CC CC CC (...]...........
0040E1D0 8B 4C 24 04 85 C9 74 0E 83 41 04 FF 75 08 8B 01 .L$...t..A..u...
0040E1E0 8B 10 6A 01 FF D2 32 C0 C2 04 00 CC CC CC CC CC ..j...2.........
0040E1F0 8B 54 24 0C 56 8B 74 24 0C 3B F2 57 8B F9 74 28 .T$.V.t$.;.W..t(
0040E200 8B 47 08 2B C2 C1 F8 02 85 C0 8D 0C 85 00 00 00 .G.+............
0040E210 00 53 8D 1C 31 7E 0D 51 52 51 56 FF 15 5C 46 8A .S..1~.QRQV..\F.
0040E220 00 83 C4 10 89 5F 08 5B 8B 44 24 0C 5F 89 30 5E ....._.[.D$._.0^
0040E230 C2 0C 00 CC CC CC CC CC CC CC CC CC CC CC CC CC ................
0040E240 55 8B EC 6A FF 68 91 CD 82 00 64 A1 00 00 00 00 U..j.h....d.....
0040E250 50 83 EC 0C 53 56 57 A1 88 41 A1 00 33 C5 50 8D P...SVW..A..3.P.
0040E260 45 F4 64 A3 00 00 00 00 89 65 F0 8B 75 08 8B 7D E.d......e..u..}
0040E270 0C 33 DB 89 75 EC 89 5D FC 8D A4 24 00 00 00 00 .3..u..]...$....
0040E280 3B FB 76 4A 89 75 0C 89 75 E8 3B F3 C6 45 FC 01 ;.vJ.u..u.;..E..
0040E290 74 0C 8B 45 10 50 8B CE FF 15 1C 44 8A 00 83 EF t..E.P.....D....
0040E2A0 01 83 C6 1C 88 5D FC 89 75 08 EB D4 8B 75 EC 8B .....]..u....u..
0040E2B0 7D 08 3B F7 74 0F 8B CE FF 15 28 44 8A 00 83 C6 }.;.t.....(D....
0040E2C0 1C 3B F7 75 F1 33 DB 53 53 E8 FE 6C 28 00 8B 4D .;.u.3.SS..l(..M
0040E2D0 F4 64 89 0D 00 00 00 00 59 5F 5E 5B 8B E5 5D C3 .d......Y_^[..].
0040E2E0 8B 54 24 18 8B 44 24 14 53 8B 5C 24 10 55 56 8B .T$..D$.S.\$.UV.
0040E2F0 74 24 28 57 8B 7C 24 20 39 7C 24 18 75 04 3B D8 t$(W.|$ 9|$.u.;.
0040E300 74 44 85 C0 74 05 83 E8 01 EB 08 83 EF 04 B8 1F tD..t...........
0040E310 00 00 00 85 F6 74 05 83 EE 01 EB 08 83 EA 04 BE .....t..........
0040E320 1F 00 00 00 8B C8 BD 01 00 00 00 D3 E5 8B CE 85 ................
0040E330 2F BD 01 00 00 00 74 06 D3 E5 09 2A EB BA D3 E5 /.....t....*....
0040E340 F7 D5 21 2A EB B2 8B 44 24 14 5F 89 70 04 5E 5D ..!*...D$._.p.^]
0040E350 89 10 5B C3 CC CC CC CC CC CC CC CC CC CC CC CC ..[.............
0040E360 8B C1 C7 00 00 00 00 00 C7 40 04 00 00 00 00 C3 .........@......

;; fn0040E370: 0040E370
;;   Called from:
;;     00413BCA (in fn00413A20)
fn0040E370 proc
	push	0FFh
	push	82CE09h
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,2Ch
	push	ebx
	push	ebp
	push	esi
	push	edi
	mov	eax,[0A14188h]
	xor	eax,esp
	push	eax
	lea	eax,[esp+40h]
	mov	fs:[0000h],eax
	mov	esi,ecx
	xor	ebp,ebp
	mov	[esp+14h],ebp
	mov	ecx,[esi]
	mov	edx,[esi+4h]
	mov	eax,[ecx]
	mov	edi,[esp+50h]
	mov	eax,[eax+0Ch]
	push	edx
	push	edi
	mov	[esp+50h],ebp
	call	eax
	cmp	[edi],ebp
	mov	ebx,1h
	mov	[esp+48h],ebp
	mov	[esp+14h],ebx
	jnz	40E4E1h

l0040E3CA:
	push	40h
	call	694FD8h
	mov	edi,eax
	add	esp,4h
	mov	[esp+18h],edi
	cmp	edi,ebp
	mov	[esp+48h],ebx
	jz	40E458h

l0040E3E2:
	push	14h
	call	694FD8h
	add	esp,4h
	mov	[esp+1Ch],eax
	cmp	eax,ebp
	mov	byte ptr [esp+48h],2h
	jz	40E40Dh

l0040E3F9:
	push	ecx
	mov	ecx,esp
	mov	[esp+24h],esp
	push	ebp
	mov	[ecx],ebp
	push	ebp
	mov	ecx,eax
	call	41A830h
	jmp	40E40Fh

l0040E40D:
	xor	eax,eax

l0040E40F:
	cmp	eax,ebp
	mov	ecx,[esi]
	push	ecx
	mov	edx,esp
	mov	[esp+24h],esp
	mov	[edx],eax
	jz	40E422h

l0040E41E:
	add	dword ptr [eax+4h],1h

l0040E422:
	mov	eax,[esi+4h]
	mov	edx,[ecx]
	mov	edx,[edx+10h]
	push	eax
	lea	eax,[esp+2Ch]
	mov	ebx,3h
	push	eax
	mov	[esp+54h],bl
	call	edx
	mov	byte ptr [esp+4Ch],4h
	mov	[esp+18h],ebx
	push	eax
	mov	ecx,edi
	mov	dword ptr [esp+50h],5h
	call	41AC20h
	mov	esi,eax
	jmp	40E45Ah

l0040E458:
	xor	esi,esi

l0040E45A:
	cmp	esi,ebp
	mov	[esp+20h],esi
	jz	40E469h

l0040E462:
	mov	ecx,esi
	call	401AD0h

l0040E469:
	mov	eax,[esp+50h]
	mov	edi,[eax]
	cmp	edi,esi
	mov	dword ptr [esp+48h],7h
	jz	40E4A2h

l0040E47B:
	cmp	esi,ebp
	mov	[eax],esi
	jz	40E488h

l0040E481:
	mov	ecx,esi
	call	401AD0h

l0040E488:
	cmp	edi,ebp
	jz	40E4A2h

l0040E48C:
	mov	ecx,edi
	call	401AE0h
	cmp	eax,1h
	jnz	40E4A2h

l0040E498:
	mov	eax,[edi]
	mov	edx,[eax]
	push	1h
	mov	ecx,edi
	call	edx

l0040E4A2:
	cmp	esi,ebp
	mov	byte ptr [esp+48h],6h
	jz	40E4C1h

l0040E4AB:
	mov	ecx,esi
	call	401AE0h
	cmp	eax,1h
	jnz	40E4C1h

l0040E4B7:
	mov	eax,[esi]
	mov	edx,[eax]
	push	1h
	mov	ecx,esi
	call	edx

l0040E4C1:
	test	bl,2h
	mov	[esp+48h],ebp
	jz	40E4DBh

l0040E4CA:
	and	ebx,0FDh
	lea	ecx,[esp+24h]
	mov	[esp+14h],ebx
	call	dword ptr [8A4338h]

l0040E4DB:
	mov	eax,[esp+50h]
	jmp	40E4E3h

l0040E4E1:
	mov	eax,edi

l0040E4E3:
	mov	ecx,[esp+40h]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebp
	pop	ebx
	add	esp,38h
	ret	4h
0040E4F9                            CC CC CC CC CC CC CC          .......

;; fn0040E500: 0040E500
;;   Called from:
;;     00413CBC (in fn00413A20)
fn0040E500 proc
	push	0FFh
	push	82CE49h
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
	mov	edi,ecx
	mov	dword ptr [esp+10h],0h
	mov	esi,[edi]
	add	dword ptr [edi+4h],1h
	test	esi,esi
	jz	40E53Fh

l0040E538:
	mov	ecx,esi
	call	401AD0h

l0040E53F:
	mov	edi,[edi+4h]
	sub	edi,1h
	test	esi,esi
	jz	40E566h

l0040E549:
	mov	ecx,esi
	call	401AD0h
	mov	ecx,esi
	call	401AE0h
	cmp	eax,1h
	jnz	40E566h

l0040E55C:
	mov	eax,[esi]
	mov	edx,[eax]
	push	1h
	mov	ecx,esi
	call	edx

l0040E566:
	test	esi,esi
	mov	ebx,[esp+24h]
	mov	[ebx],esi
	jz	40E577h

l0040E570:
	mov	ecx,esi
	call	401AD0h

l0040E577:
	mov	[ebx+4h],edi
	test	esi,esi
	mov	dword ptr [esp+1Ch],0h
	mov	dword ptr [esp+10h],1h
	jz	40E5A4h

l0040E58E:
	mov	ecx,esi
	call	401AE0h
	cmp	eax,1h
	jnz	40E5A4h

l0040E59A:
	mov	eax,[esi]
	mov	edx,[eax]
	push	1h
	mov	ecx,esi
	call	edx

l0040E5A4:
	mov	eax,ebx
	mov	ecx,[esp+14h]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebx
	add	esp,10h
	ret	8h
0040E5BB                                  CC CC CC CC CC            .....
0040E5C0 6A FF 68 80 CE 82 00 64 A1 00 00 00 00 50 51 53 j.h....d.....PQS
0040E5D0 55 56 57 A1 88 41 A1 00 33 C4 50 8D 44 24 18 64 UVW..A..3.P.D$.d
0040E5E0 A3 00 00 00 00 8B F1 8B 06 8B 50 04 33 FF 89 7C ..........P.3..|
0040E5F0 24 20 33 ED FF D2 85 C0 8B 5C 24 28 7E 52 8B FF $ 3......\$(~R..
0040E600 8B 06 8B 50 0C 55 8D 4C 24 18 51 8B CE FF D2 8B ...P.U.L$.Q.....
0040E610 4C 24 14 3B D9 C6 44 24 20 00 74 6F 3B CF 74 1A L$.;..D$ .to;.t.
0040E620 8B F9 E8 B9 34 FF FF 83 F8 01 75 0E 85 FF 74 0A ....4.....u...t.
0040E630 8B 07 8B 10 6A 01 8B CF FF D2 8B 06 8B 50 04 33 ....j........P.3
0040E640 FF 8B CE 89 7C 24 14 83 C5 01 FF D2 3B E8 7C B0 ....|$......;.|.
0040E650 3B DF C7 44 24 20 FF FF FF FF 74 16 8B CB E8 7D ;..D$ ....t....}
0040E660 34 FF FF 83 F8 01 75 0A 8B 03 8B 10 6A 01 8B CB 4.....u.....j...
0040E670 FF D2 83 C8 FF 8B 4C 24 18 64 89 0D 00 00 00 00 ......L$.d......
0040E680 59 5F 5E 5D 5B 83 C4 10 C2 04 00 3B CF 74 1A 8B Y_^][......;.t..
0040E690 F1 E8 4A 34 FF FF 83 F8 01 75 0E 3B F7 74 0A 8B ..J4.....u.;.t..
0040E6A0 06 8B 10 6A 01 8B CE FF D2 3B DF 89 7C 24 14 C7 ...j.....;..|$..
0040E6B0 44 24 20 FF FF FF FF 74 16 8B CB E8 20 34 FF FF D$ ....t.... 4..
0040E6C0 83 F8 01 75 0A 8B 03 8B 10 6A 01 8B CB FF D2 8B ...u.....j......
0040E6D0 C5 EB A2 CC CC CC CC CC CC CC CC CC CC CC CC CC ................
0040E6E0 6A FF 68 C2 CE 82 00 64 A1 00 00 00 00 50 51 56 j.h....d.....PQV
0040E6F0 57 A1 88 41 A1 00 33 C4 50 8D 44 24 10 64 A3 00 W..A..3.P.D$.d..
0040E700 00 00 00 C7 44 24 0C 00 00 00 00 8B 54 24 24 8B ....D$......T$$.
0040E710 01 8B 40 0C 52 8D 54 24 28 52 FF D0 8B 08 8B 11 ..@.R.T$(R......
0040E720 8B 7C 24 20 8B 42 2C 57 C7 44 24 1C 01 00 00 00 .|$ .B,W.D$.....
0040E730 FF D0 8B 4C 24 24 85 C9 C7 44 24 0C 01 00 00 00 ...L$$...D$.....
0040E740 C6 44 24 18 00 74 19 8B F1 E8 92 33 FF FF 83 F8 .D$..t.....3....
0040E750 01 75 0D 85 F6 74 09 8B 16 50 8B 02 8B CE FF D0 .u...t...P......
0040E760 8B C7 8B 4C 24 10 64 89 0D 00 00 00 00 59 5F 5E ...L$.d......Y_^
0040E770 83 C4 10 C2 08 00 CC CC CC CC CC CC CC CC CC CC ................

;; fn0040E780: 0040E780
;;   Called from:
;;     00402AEB (in fn00402A20)
;;     00404479 (in fn00404190)
;;     0040E90B (in fn0040E780)
;;     0040EECE (in fn0040EEA0)
;;     0040EF7E (in fn0040EF50)
;;     0040FFCF (in fn0040FF40)
fn0040E780 proc
	push	0FFh
	push	82CF3Ch
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,24h
	push	ebx
	push	ebp
	push	esi
	push	edi
	mov	eax,[0A14188h]
	xor	eax,esp
	push	eax
	lea	eax,[esp+38h]
	mov	fs:[0000h],eax
	mov	esi,ecx
	xor	ebx,ebx
	mov	[esp+14h],ebx
	mov	ebp,[esp+4Ch]
	cmp	[ebp+14h],ebx
	jnz	40E7CEh

l0040E7B8:
	cmp	esi,ebx
	mov	edi,[esp+48h]
	mov	[edi],esi
	jz	40E7C7h

l0040E7C2:
	call	401AD0h

l0040E7C7:
	mov	eax,edi
	jmp	40E9FBh

l0040E7CE:
	mov	[esp+4Ch],ebx
	push	ebx
	push	8A6A50h
	mov	ecx,ebp
	mov	dword ptr [esp+48h],1h
	call	dword ptr [8A4360h]
	mov	edi,eax
	test	edi,edi
	jl	40E93Ah

l0040E7F2:
	mov	ecx,ebp
	call	dword ptr [8A435Ch]
	cmp	edi,eax
	jge	40E93Ah

l0040E802:
	push	edi
	push	0h
	lea	eax,[esp+24h]
	push	eax
	mov	ecx,ebp
	call	dword ptr [8A4340h]
	mov	edx,[esi]
	mov	edx,[edx+1Ch]
	push	eax
	lea	eax,[esp+1Ch]
	mov	bl,2h
	push	eax
	mov	ecx,esi
	mov	[esp+48h],bl
	call	edx
	push	eax
	lea	ecx,[esp+50h]
	mov	byte ptr [esp+44h],3h
	call	5CF0C0h
	lea	ecx,[esp+18h]
	mov	[esp+40h],bl
	call	41C0B0h
	lea	ecx,[esp+1Ch]
	mov	byte ptr [esp+40h],1h
	call	dword ptr [8A4338h]
	mov	ebx,[esp+4Ch]
	test	ebx,ebx
	jnz	40E8E0h

l0040E85E:
	cmp	[esp+50h],bl
	jz	40E8BBh

l0040E864:
	push	edi
	push	ebx
	lea	eax,[esp+24h]
	push	eax
	mov	ecx,ebp
	call	dword ptr [8A4340h]
	mov	edx,[esi]
	mov	edx,[edx+14h]
	push	eax
	lea	eax,[esp+1Ch]
	mov	bl,4h
	push	eax
	mov	ecx,esi
	mov	[esp+48h],bl
	call	edx
	push	eax
	lea	ecx,[esp+50h]
	mov	byte ptr [esp+44h],5h
	call	5CF0C0h
	lea	ecx,[esp+18h]
	mov	[esp+40h],bl
	call	41C0B0h
	lea	ecx,[esp+1Ch]
	mov	byte ptr [esp+40h],1h
	call	dword ptr [8A4338h]
	mov	ebx,[esp+4Ch]
	test	ebx,ebx
	jnz	40E8E0h

l0040E8BB:
	mov	esi,[esp+48h]
	lea	ecx,[esp+4Ch]
	mov	dword ptr [esi],0h
	mov	dword ptr [esp+14h],1h
	mov	byte ptr [esp+40h],0h
	call	41C0B0h
	jmp	40E9F9h

l0040E8E0:
	mov	eax,[8A434Ch]
	mov	ecx,[eax]
	push	ecx
	add	edi,1h
	push	edi
	lea	edx,[esp+24h]
	push	edx
	mov	ecx,ebp
	call	dword ptr [8A4340h]
	mov	ecx,[esp+50h]
	mov	esi,[esp+48h]
	push	ecx
	push	eax
	push	esi
	mov	ecx,ebx
	mov	byte ptr [esp+4Ch],6h
	call	40E780h
	lea	ecx,[esp+1Ch]
	mov	dword ptr [esp+14h],1h
	mov	byte ptr [esp+40h],1h
	call	dword ptr [8A4338h]
	lea	ecx,[esp+4Ch]
	mov	byte ptr [esp+40h],0h
	call	41C0B0h
	jmp	40E9F9h

l0040E93A:
	mov	edx,[esi]
	mov	edx,[edx+1Ch]
	push	ebp
	lea	eax,[esp+1Ch]
	push	eax
	mov	ecx,esi
	call	edx
	mov	eax,[eax]
	test	eax,eax
	jz	40E960h

l0040E94F:
	mov	ebx,eax
	test	ebx,ebx
	mov	[esp+4Ch],ebx
	jz	40E960h

l0040E959:
	mov	ecx,ebx
	call	401AD0h

l0040E960:
	mov	ecx,[esp+18h]
	test	ecx,ecx
	mov	byte ptr [esp+40h],1h
	jz	40E987h

l0040E96D:
	mov	edi,ecx
	call	401AE0h
	cmp	eax,1h
	jnz	40E987h

l0040E979:
	test	edi,edi
	jz	40E987h

l0040E97D:
	mov	eax,[edi]
	mov	edx,[eax]
	push	1h
	mov	ecx,edi
	call	edx

l0040E987:
	test	ebx,ebx
	jnz	40E9C1h

l0040E98B:
	cmp	[esp+50h],bl
	jz	40E9C1h

l0040E991:
	mov	eax,[esi]
	mov	edx,[eax+14h]
	push	ebp
	lea	ecx,[esp+54h]
	push	ecx
	mov	ecx,esi
	call	edx
	push	eax
	lea	ecx,[esp+50h]
	mov	byte ptr [esp+44h],8h
	call	5CF0C0h
	lea	ecx,[esp+50h]
	mov	byte ptr [esp+40h],1h
	call	41C0B0h
	mov	ebx,[esp+4Ch]

l0040E9C1:
	test	ebx,ebx
	mov	esi,[esp+48h]
	mov	[esi],ebx
	jz	40E9D2h

l0040E9CB:
	mov	ecx,ebx
	call	401AD0h

l0040E9D2:
	test	ebx,ebx
	mov	dword ptr [esp+14h],1h
	mov	byte ptr [esp+40h],0h
	jz	40E9F9h

l0040E9E3:
	mov	ecx,ebx
	call	401AE0h
	cmp	eax,1h
	jnz	40E9F9h

l0040E9EF:
	mov	eax,[ebx]
	mov	edx,[eax]
	push	1h
	mov	ecx,ebx
	call	edx

l0040E9F9:
	mov	eax,esi

l0040E9FB:
	mov	ecx,[esp+38h]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebp
	pop	ebx
	add	esp,30h
	ret	0Ch
0040EA11    CC CC CC CC CC CC CC CC CC CC CC CC CC CC CC  ...............
0040EA20 53 8B 5C 24 08 56 57 8B F9 8B 0B 8B 37 3B F1 74 S.\$.VW.....7;.t
0040EA30 25 85 C9 89 0F 74 05 E8 94 30 FF FF 85 F6 74 16 %....t...0....t.
0040EA40 8B CE E8 99 30 FF FF 83 F8 01 75 0A 8B 06 8B 10 ....0.....u.....
0040EA50 6A 01 8B CE FF D2 8B 43 04 89 47 04 8B C7 5F 5E j......C..G..._^
0040EA60 5B C2 04 00 CC CC CC CC CC CC CC CC CC CC CC CC [...............
0040EA70 51 56 8B F1 8B 06 8B 50 04 C7 44 24 04 00 00 00 QV.....P..D$....
0040EA80 00 FF D2 85 C0 75 0F 8B 44 24 0C C7 00 00 00 00 .....u..D$......
0040EA90 00 5E 59 C2 04 00 8B 06 8B 50 0C 57 8B 7C 24 10 .^Y......P.W.|$.
0040EAA0 6A 00 57 8B CE FF D2 8B C7 5F 5E 59 C2 04 00 CC j.W......_^Y....
0040EAB0 6A FF 68 9C CF 82 00 64 A1 00 00 00 00 50 83 EC j.h....d.....P..
0040EAC0 48 A1 88 41 A1 00 33 C4 89 44 24 44 53 55 56 57 H..A..3..D$DSUVW
0040EAD0 A1 88 41 A1 00 33 C4 50 8D 44 24 5C 64 A3 00 00 ..A..3.P.D$\d...
0040EAE0 00 00 8B 5C 24 6C 33 FF 83 CD FF 3B CF 8B F1 89 ...\$l3....;....
0040EAF0 74 24 1C 74 05 E8 D6 2F FF FF 89 7C 24 64 89 7C t$.t.../...|$d.|
0040EB00 24 14 C6 44 24 64 01 8D 7D 01 57 68 50 6A 8A 00 $..D$d..}.WhPj..
0040EB10 8B CB FF 15 60 43 8A 00 8D 4C 24 3C 8B E8 FF 15 ....`C...L$<....
0040EB20 B0 43 8A 00 85 ED C6 44 24 64 02 7C 26 8B CB FF .C.....D$d.|&...
0040EB30 15 5C 43 8A 00 3B E8 7D 1A 8B C5 2B C7 50 57 8D .\C..;.}...+.PW.
0040EB40 4C 24 28 51 8B CB FF 15 40 43 8A 00 C6 44 24 64 L$(Q....@C...D$d
0040EB50 03 EB 1C 8B 15 4C 43 8A 00 8B 02 50 57 8D 4C 24 .....LC....PW.L$
0040EB60 28 51 8B CB FF 15 40 43 8A 00 C6 44 24 64 04 50 (Q....@C...D$d.P
0040EB70 8D 4C 24 40 FF 15 58 43 8A 00 8D 4C 24 20 C6 44 .L$@..XC...L$ .D
0040EB80 24 64 02 FF 15 38 43 8A 00 8B 7C 24 14 3B FE 74 $d...8C...|$.;.t
0040EB90 28 85 F6 89 74 24 14 74 07 8B CE E8 30 2F FF FF (...t$.t....0/..
0040EBA0 85 FF 74 15 8B CF E8 35 2F FF FF 83 F8 01 75 09 ..t....5/.....u.
0040EBB0 8B 17 50 8B 02 8B CF FF D0 8B 16 8B 52 1C 8D 44 ..P.........R..D
0040EBC0 24 3C 50 8D 4C 24 1C 51 8B CE FF D2 8B 00 3B F0 $<P.L$.Q......;.
0040EBD0 C6 44 24 64 05 74 2D 8B FE 8B F0 85 F6 89 74 24 .D$d.t-.......t$
0040EBE0 1C 74 07 8B CE E8 E6 2E FF FF 85 FF 74 16 8B CF .t..........t...
0040EBF0 E8 EB 2E FF FF 83 F8 01 75 0A 8B 07 8B 10 6A 01 ........u.....j.
0040EC00 8B CF FF D2 8B 4C 24 18 85 C9 C6 44 24 64 02 74 .....L$....D$d.t
0040EC10 1A 8B F9 E8 C8 2E FF FF 83 F8 01 75 0E 85 FF 74 ...........u...t
0040EC20 0A 8B 07 8B 10 6A 01 8B CF FF D2 8D 4C 24 3C C7 .....j......L$<.
0040EC30 44 24 18 00 00 00 00 C6 44 24 64 01 FF 15 38 43 D$......D$d...8C
0040EC40 8A 00 85 ED 7C 08 85 F6 0F 85 B9 FE FF FF 8B 7C ....|..........|
0040EC50 24 14 85 FF 74 6B 85 F6 74 67 8B 06 8B 50 2C 8D $...tk..tg...P,.
0040EC60 4C 24 20 51 8B CE FF D2 8B 17 50 8B 42 24 8B CF L$ Q......P.B$..
0040EC70 C6 44 24 68 06 FF D0 8D 4C 24 20 C6 44 24 64 01 .D$h....L$ .D$d.
0040EC80 FF 15 38 43 8A 00 8B CF C6 44 24 64 00 E8 4E 2E ..8C.....D$d..N.
0040EC90 FF FF 83 F8 01 75 09 8B 17 50 8B 02 8B CF FF D0 .....u...P......
0040ECA0 8B CE C7 44 24 64 FF FF FF FF E8 31 2E FF FF 83 ...D$d.....1....
0040ECB0 F8 01 75 09 8B 16 50 8B 02 8B CE FF D0 B0 01 EB ..u...P.........
0040ECC0 41 85 FF C6 44 24 64 00 74 15 8B CF E8 0F 2E FF A...D$d.t.......
0040ECD0 FF 83 F8 01 75 09 8B 17 50 8B 02 8B CF FF D0 85 ....u...P.......
0040ECE0 F6 C7 44 24 64 FF FF FF FF 74 15 8B CE E8 EE 2D ..D$d....t.....-
0040ECF0 FF FF 83 F8 01 75 09 8B 16 50 8B 02 8B CE FF D0 .....u...P......
0040ED00 32 C0 8B 4C 24 5C 64 89 0D 00 00 00 00 59 5F 5E 2..L$\d......Y_^
0040ED10 5D 5B 8B 4C 24 44 33 CC E8 71 5E 28 00 83 C4 54 ][.L$D3..q^(...T
0040ED20 C2 04 00 CC CC CC CC CC CC CC CC CC CC CC CC CC ................

;; fn0040ED30: 0040ED30
;;   Called from:
;;     00413B20 (in fn00413A20)
fn0040ED30 proc
	push	0FFh
	push	82CFE9h
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
	test	esi,esi
	mov	dword ptr [esp+0Ch],0h
	jz	40ED83h

l0040ED61:
	call	401AD0h
	mov	ecx,esi
	call	401AD0h
	mov	ecx,esi
	call	401AE0h
	cmp	eax,1h
	jnz	40ED83h

l0040ED79:
	mov	eax,[esi]
	mov	edx,[eax]
	push	1h
	mov	ecx,esi
	call	edx

l0040ED83:
	test	esi,esi
	mov	edi,[esp+20h]
	mov	[edi],esi
	jz	40ED94h

l0040ED8D:
	mov	ecx,esi
	call	401AD0h

l0040ED94:
	mov	dword ptr [edi+4h],0h
	test	esi,esi
	mov	dword ptr [esp+18h],0h
	mov	dword ptr [esp+0Ch],1h
	jz	40EDC5h

l0040EDAF:
	mov	ecx,esi
	call	401AE0h
	cmp	eax,1h
	jnz	40EDC5h

l0040EDBB:
	mov	eax,[esi]
	mov	edx,[eax]
	push	1h
	mov	ecx,esi
	call	edx

l0040EDC5:
	mov	eax,edi
	mov	ecx,[esp+10h]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	add	esp,10h
	ret	4h
0040EDDB                                  CC CC CC CC CC            .....

;; fn0040EDE0: 0040EDE0
;;   Called from:
;;     00413B77 (in fn00413A20)
fn0040EDE0 proc
	push	0FFh
	push	82D031h
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
	test	esi,esi
	mov	dword ptr [esp+10h],0h
	mov	[esp+14h],esi
	jz	40EE1Dh

l0040EE18:
	call	401AD0h

l0040EE1D:
	mov	eax,[esi]
	mov	edx,[eax+4h]
	mov	ecx,esi
	mov	dword ptr [esp+20h],1h
	call	edx
	mov	ecx,esi
	mov	ebp,eax
	mov	byte ptr [esp+20h],0h
	call	401AD0h
	mov	ecx,esi
	call	401AE0h
	cmp	eax,1h
	jnz	40EE52h

l0040EE48:
	mov	eax,[esi]
	mov	edx,[eax]
	push	1h
	mov	ecx,esi
	call	edx

l0040EE52:
	mov	edi,[esp+28h]
	mov	ecx,esi
	mov	[edi],esi
	call	401AD0h
	mov	[edi+4h],ebp
	mov	ecx,esi
	mov	dword ptr [esp+20h],0h
	mov	dword ptr [esp+10h],1h
	call	401AE0h
	cmp	eax,1h
	jnz	40EE88h

l0040EE7E:
	mov	eax,[esi]
	mov	edx,[eax]
	push	1h
	mov	ecx,esi
	call	edx

l0040EE88:
	mov	eax,edi
	mov	ecx,[esp+18h]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebp
	add	esp,14h
	ret	4h
0040EE9F                                              CC                .

;; fn0040EEA0: 0040EEA0
;;   Called from:
;;     0042B62B (in fn0042B310)
fn0040EEA0 proc
	push	0FFh
	push	82D058h
	mov	eax,fs:[0000h]
	push	eax
	push	ebx
	push	esi
	mov	eax,[0A14188h]
	xor	eax,esp
	push	eax
	lea	eax,[esp+0Ch]
	mov	fs:[0000h],eax
	mov	eax,[esp+1Ch]
	push	0h
	push	eax
	lea	edx,[esp+24h]
	push	edx
	call	40E780h
	mov	ecx,[esp+1Ch]
	test	ecx,ecx
	mov	dword ptr [esp+14h],0h
	jz	40EF30h

l0040EEE3:
	mov	eax,[ecx]
	mov	edx,[esp+20h]
	mov	eax,[eax+44h]
	push	edx
	call	eax
	mov	ecx,[esp+1Ch]
	test	ecx,ecx
	mov	bl,al
	mov	dword ptr [esp+14h],0FFFFFFFFh
	jz	40EF1Ah

l0040EF01:
	mov	esi,ecx
	call	401AE0h
	cmp	eax,1h
	jnz	40EF1Ah

l0040EF0D:
	test	esi,esi
	jz	40EF1Ah

l0040EF11:
	mov	edx,[esi]
	push	eax
	mov	eax,[edx]
	mov	ecx,esi
	call	eax

l0040EF1A:
	mov	al,bl
	mov	ecx,[esp+0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	esi
	pop	ebx
	add	esp,0Ch
	ret	8h

l0040EF30:
	mov	al,[esp+20h]
	mov	ecx,[esp+0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	esi
	pop	ebx
	add	esp,0Ch
	ret	8h
0040EF48                         CC CC CC CC CC CC CC CC         ........

;; fn0040EF50: 0040EF50
;;   Called from:
;;     00402BF4 (in fn00402B60)
;;     00402C38 (in fn00402B60)
;;     00402C7C (in fn00402B60)
;;     00402CC0 (in fn00402B60)
;;     0042B591 (in fn0042B310)
;;     0042B5F6 (in fn0042B310)
fn0040EF50 proc
	push	0FFh
	push	82D088h
	mov	eax,fs:[0000h]
	push	eax
	push	esi
	push	edi
	mov	eax,[0A14188h]
	xor	eax,esp
	push	eax
	lea	eax,[esp+0Ch]
	mov	fs:[0000h],eax
	mov	eax,[esp+1Ch]
	push	0h
	push	eax
	lea	edx,[esp+24h]
	push	edx
	call	40E780h
	mov	ecx,[esp+1Ch]
	test	ecx,ecx
	mov	dword ptr [esp+14h],0h
	jz	40EFE0h

l0040EF93:
	mov	eax,[ecx]
	mov	edx,[esp+20h]
	mov	eax,[eax+48h]
	push	edx
	call	eax
	mov	ecx,[esp+1Ch]
	test	ecx,ecx
	mov	edi,eax
	mov	dword ptr [esp+14h],0FFFFFFFFh
	jz	40EFCAh

l0040EFB1:
	mov	esi,ecx
	call	401AE0h
	cmp	eax,1h
	jnz	40EFCAh

l0040EFBD:
	test	esi,esi
	jz	40EFCAh

l0040EFC1:
	mov	edx,[esi]
	push	eax
	mov	eax,[edx]
	mov	ecx,esi
	call	eax

l0040EFCA:
	mov	eax,edi
	mov	ecx,[esp+0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	add	esp,0Ch
	ret	8h

l0040EFE0:
	mov	eax,[esp+20h]
	mov	ecx,[esp+0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	add	esp,0Ch
	ret	8h
0040EFF8                         CC CC CC CC CC CC CC CC         ........
0040F000 6A FF 68 B8 D0 82 00 64 A1 00 00 00 00 50 56 A1 j.h....d.....PV.
0040F010 88 41 A1 00 33 C4 50 8D 44 24 08 64 A3 00 00 00 .A..3.P.D$.d....
0040F020 00 8B 44 24 18 6A 00 50 8D 54 24 20 52 E8 4E F7 ..D$.j.P.T$ R.N.
0040F030 FF FF D9 44 24 1C 8B 4C 24 18 85 C9 C7 44 24 10 ...D$..L$....D$.
0040F040 00 00 00 00 74 3D 8B 01 8B 50 50 51 D9 1C 24 FF ....t=...PPQ..$.
0040F050 D2 8B 4C 24 18 D9 5C 24 1C 85 C9 C7 44 24 10 FF ..L$..\$....D$..
0040F060 FF FF FF 74 1A 8B F1 E8 74 2A FF FF 83 F8 01 75 ...t....t*.....u
0040F070 0E 85 F6 74 0A 8B 06 8B 10 6A 01 8B CE FF D2 D9 ...t.....j......
0040F080 44 24 1C 8B 4C 24 08 64 89 0D 00 00 00 00 59 5E D$..L$.d......Y^
0040F090 83 C4 0C C2 08 00 CC CC CC CC CC CC CC CC CC CC ................
0040F0A0 6A FF 68 E8 D0 82 00 64 A1 00 00 00 00 50 56 A1 j.h....d.....PV.
0040F0B0 88 41 A1 00 33 C4 50 8D 44 24 08 64 A3 00 00 00 .A..3.P.D$.d....
0040F0C0 00 8B 44 24 18 6A 00 50 8D 54 24 20 52 E8 AE F6 ..D$.j.P.T$ R...
0040F0D0 FF FF DD 44 24 1C 8B 4C 24 18 85 C9 C7 44 24 10 ...D$..L$....D$.
0040F0E0 00 00 00 00 74 3F 8B 01 8B 50 54 83 EC 08 DD 1C ....t?...PT.....
0040F0F0 24 FF D2 8B 4C 24 18 DD 5C 24 1C 85 C9 C7 44 24 $...L$..\$....D$
0040F100 10 FF FF FF FF 74 1A 8B F1 E8 D2 29 FF FF 83 F8 .....t.....)....
0040F110 01 75 0E 85 F6 74 0A 8B 06 8B 10 6A 01 8B CE FF .u...t.....j....
0040F120 D2 DD 44 24 1C 8B 4C 24 08 64 89 0D 00 00 00 00 ..D$..L$.d......
0040F130 59 5E 83 C4 0C C2 0C 00 CC CC CC CC CC CC CC CC Y^..............
0040F140 6A FF 68 32 D1 82 00 64 A1 00 00 00 00 50 51 55 j.h2...d.....PQU
0040F150 56 A1 88 41 A1 00 33 C4 50 8D 44 24 10 64 A3 00 V..A..3.P.D$.d..
0040F160 00 00 00 C7 44 24 0C 00 00 00 00 8B 44 24 24 6A ....D$......D$$j
0040F170 00 50 8D 54 24 2C 52 E8 04 F6 FF FF 8B 4C 24 24 .P.T$,R......L$$
0040F180 85 C9 8B 6C 24 20 C7 44 24 18 01 00 00 00 74 11 ...l$ .D$.....t.
0040F190 8B 54 24 28 8B 01 8B 40 58 6A 00 52 55 FF D0 EB .T$(...@Xj.RU...
0040F1A0 0D 8B 4C 24 28 51 8B CD FF 15 3C 43 8A 00 8B 4C ..L$(Q....<C...L
0040F1B0 24 24 85 C9 C6 44 24 18 00 C7 44 24 0C 01 00 00 $$...D$...D$....
0040F1C0 00 74 19 8B F1 E8 16 29 FF FF 83 F8 01 75 0D 85 .t.....).....u..
0040F1D0 F6 74 09 8B 16 50 8B 02 8B CE FF D0 8B C5 8B 4C .t...P.........L
0040F1E0 24 10 64 89 0D 00 00 00 00 59 5E 5D 83 C4 10 C2 $.d......Y^]....
0040F1F0 10 00 CC CC CC CC CC CC CC CC CC CC CC CC CC CC ................
0040F200 6A FF 68 72 D1 82 00 64 A1 00 00 00 00 50 51 55 j.hr...d.....PQU
0040F210 56 A1 88 41 A1 00 33 C4 50 8D 44 24 10 64 A3 00 V..A..3.P.D$.d..
0040F220 00 00 00 C7 44 24 0C 00 00 00 00 8B 44 24 24 6A ....D$......D$$j
0040F230 00 50 8D 54 24 2C 52 E8 44 F5 FF FF 8B 4C 24 24 .P.T$,R.D....L$$
0040F240 85 C9 8B 6C 24 20 C7 44 24 18 01 00 00 00 74 11 ...l$ .D$.....t.
0040F250 8B 54 24 28 8B 01 8B 40 5C 6A 00 52 55 FF D0 EB .T$(...@\j.RU...
0040F260 0D 8B 4C 24 28 51 8B CD FF 15 1C 44 8A 00 8B 4C ..L$(Q.....D...L
0040F270 24 24 85 C9 C6 44 24 18 00 C7 44 24 0C 01 00 00 $$...D$...D$....
0040F280 00 74 19 8B F1 E8 56 28 FF FF 83 F8 01 75 0D 85 .t....V(.....u..
0040F290 F6 74 09 8B 16 50 8B 02 8B CE FF D0 8B C5 8B 4C .t...P.........L
0040F2A0 24 10 64 89 0D 00 00 00 00 59 5E 5D 83 C4 10 C2 $.d......Y^]....
0040F2B0 10 00 CC CC CC CC CC CC CC CC CC CC CC CC CC CC ................
0040F2C0 6A FF 68 98 D1 82 00 64 A1 00 00 00 00 50 56 57 j.h....d.....PVW
0040F2D0 A1 88 41 A1 00 33 C4 50 8D 44 24 0C 64 A3 00 00 ..A..3.P.D$.d...
0040F2E0 00 00 8B 44 24 20 6A 00 50 8D 54 24 28 52 E8 8D ...D$ j.P.T$(R..
0040F2F0 F4 FF FF 8B 4C 24 20 85 C9 C7 44 24 14 00 00 00 ....L$ ...D$....
0040F300 00 74 50 8B 54 24 24 8B 01 8B 7C 24 1C 8B 40 60 .tP.T$$...|$..@`
0040F310 52 57 FF D0 8B 4C 24 20 85 C9 C7 44 24 14 FF FF RW...L$ ...D$...
0040F320 FF FF 74 19 8B F1 E8 B5 27 FF FF 83 F8 01 75 0D ..t.....'.....u.
0040F330 85 F6 74 09 8B 16 50 8B 02 8B CE FF D0 8B C7 8B ..t...P.........
0040F340 4C 24 0C 64 89 0D 00 00 00 00 59 5F 5E 83 C4 0C L$.d......Y_^...
0040F350 C2 0C 00 8B 4C 24 24 8B 11 8B 44 24 1C 89 10 8B ....L$$...D$....
0040F360 49 04 89 48 04 8B 4C 24 0C 64 89 0D 00 00 00 00 I..H..L$.d......
0040F370 59 5F 5E 83 C4 0C C2 0C 00 CC CC CC CC CC CC CC Y_^.............
0040F380 6A FF 68 C8 D1 82 00 64 A1 00 00 00 00 50 56 57 j.h....d.....PVW
0040F390 A1 88 41 A1 00 33 C4 50 8D 44 24 0C 64 A3 00 00 ..A..3.P.D$.d...
0040F3A0 00 00 8B 44 24 20 6A 00 50 8D 54 24 28 52 E8 CD ...D$ j.P.T$(R..
0040F3B0 F3 FF FF 8B 4C 24 20 85 C9 C7 44 24 14 00 00 00 ....L$ ...D$....
0040F3C0 00 74 50 8B 54 24 24 8B 01 8B 7C 24 1C 8B 40 64 .tP.T$$...|$..@d
0040F3D0 52 57 FF D0 8B 4C 24 20 85 C9 C7 44 24 14 FF FF RW...L$ ...D$...
0040F3E0 FF FF 74 19 8B F1 E8 F5 26 FF FF 83 F8 01 75 0D ..t.....&.....u.
0040F3F0 85 F6 74 09 8B 16 50 8B 02 8B CE FF D0 8B C7 8B ..t...P.........
0040F400 4C 24 0C 64 89 0D 00 00 00 00 59 5F 5E 83 C4 0C L$.d......Y_^...
0040F410 C2 0C 00 8B 4C 24 24 8B 11 8B 44 24 1C 89 10 8B ....L$$...D$....
0040F420 51 04 89 50 04 8B 49 08 89 48 08 8B 4C 24 0C 64 Q..P..I..H..L$.d
0040F430 89 0D 00 00 00 00 59 5F 5E 83 C4 0C C2 0C 00 CC ......Y_^.......
0040F440 6A FF 68 F8 D1 82 00 64 A1 00 00 00 00 50 56 57 j.h....d.....PVW
0040F450 A1 88 41 A1 00 33 C4 50 8D 44 24 0C 64 A3 00 00 ..A..3.P.D$.d...
0040F460 00 00 8B 44 24 20 6A 00 50 8D 54 24 28 52 E8 0D ...D$ j.P.T$(R..
0040F470 F3 FF FF 8B 4C 24 20 85 C9 C7 44 24 14 00 00 00 ....L$ ...D$....
0040F480 00 74 50 8B 54 24 24 8B 01 8B 7C 24 1C 8B 40 68 .tP.T$$...|$..@h
0040F490 52 57 FF D0 8B 4C 24 20 85 C9 C7 44 24 14 FF FF RW...L$ ...D$...
0040F4A0 FF FF 74 19 8B F1 E8 35 26 FF FF 83 F8 01 75 0D ..t....5&.....u.
0040F4B0 85 F6 74 09 8B 16 50 8B 02 8B CE FF D0 8B C7 8B ..t...P.........
0040F4C0 4C 24 0C 64 89 0D 00 00 00 00 59 5F 5E 83 C4 0C L$.d......Y_^...
0040F4D0 C2 0C 00 8B 4C 24 24 8B 11 8B 44 24 1C 89 10 8B ....L$$...D$....
0040F4E0 51 04 89 50 04 8B 51 08 89 50 08 8B 49 0C 89 48 Q..P..Q..P..I..H
0040F4F0 0C 8B 4C 24 0C 64 89 0D 00 00 00 00 59 5F 5E 83 ..L$.d......Y_^.
0040F500 C4 0C C2 0C 00 CC CC CC CC CC CC CC CC CC CC CC ................
0040F510 6A FF 68 28 D2 82 00 64 A1 00 00 00 00 50 56 57 j.h(...d.....PVW
0040F520 A1 88 41 A1 00 33 C4 50 8D 44 24 0C 64 A3 00 00 ..A..3.P.D$.d...
0040F530 00 00 8B 44 24 20 6A 00 50 8D 54 24 28 52 E8 3D ...D$ j.P.T$(R.=
0040F540 F2 FF FF 8B 4C 24 20 85 C9 C7 44 24 14 00 00 00 ....L$ ...D$....
0040F550 00 74 50 8B 54 24 24 8B 01 8B 7C 24 1C 8B 40 6C .tP.T$$...|$..@l
0040F560 52 57 FF D0 8B 4C 24 20 85 C9 C7 44 24 14 FF FF RW...L$ ...D$...
0040F570 FF FF 74 19 8B F1 E8 65 25 FF FF 83 F8 01 75 0D ..t....e%.....u.
0040F580 85 F6 74 09 8B 16 50 8B 02 8B CE FF D0 8B C7 8B ..t...P.........
0040F590 4C 24 0C 64 89 0D 00 00 00 00 59 5F 5E 83 C4 0C L$.d......Y_^...
0040F5A0 C2 0C 00 8B 44 24 1C 8B 74 24 24 B9 10 00 00 00 ....D$..t$$.....
0040F5B0 8B F8 F3 A5 8B 4C 24 0C 64 89 0D 00 00 00 00 59 .....L$.d......Y
0040F5C0 5F 5E 83 C4 0C C2 0C 00 CC CC CC CC CC CC CC CC _^..............
0040F5D0 6A FF 68 71 D2 82 00 64 A1 00 00 00 00 50 51 55 j.hq...d.....PQU
0040F5E0 56 A1 88 41 A1 00 33 C4 50 8D 44 24 10 64 A3 00 V..A..3.P.D$.d..
0040F5F0 00 00 00 C7 44 24 0C 00 00 00 00 8B 44 24 24 6A ....D$......D$$j
0040F600 00 50 8D 54 24 2C 52 E8 74 F1 FF FF 8B 4C 24 24 .P.T$,R.t....L$$
0040F610 85 C9 C7 44 24 18 01 00 00 00 74 51 8B 01 8B 6C ...D$.....tQ...l
0040F620 24 20 8B 50 70 55 FF D2 8B 4C 24 24 85 C9 C7 44 $ .PpU...L$$...D
0040F630 24 0C 01 00 00 00 C6 44 24 18 00 74 1A 8B F1 E8 $......D$..t....
0040F640 9C 24 FF FF 83 F8 01 75 0E 85 F6 74 0A 8B 06 8B .$.....u...t....
0040F650 10 6A 01 8B CE FF D2 8B C5 8B 4C 24 10 64 89 0D .j........L$.d..
0040F660 00 00 00 00 59 5E 5D 83 C4 10 C2 08 00 8B 44 24 ....Y^].......D$
0040F670 20 C7 00 00 00 00 00 8B 4C 24 10 64 89 0D 00 00  .......L$.d....
0040F680 00 00 59 5E 5D 83 C4 10 C2 08 00 CC CC CC CC CC ..Y^]...........
0040F690 6A FF 68 B2 D2 82 00 64 A1 00 00 00 00 50 51 55 j.h....d.....PQU
0040F6A0 56 A1 88 41 A1 00 33 C4 50 8D 44 24 10 64 A3 00 V..A..3.P.D$.d..
0040F6B0 00 00 00 C7 44 24 0C 00 00 00 00 8B 44 24 24 6A ....D$......D$$j
0040F6C0 00 50 8D 54 24 2C 52 E8 B4 F0 FF FF 8B 4C 24 24 .P.T$,R......L$$
0040F6D0 85 C9 8B 6C 24 20 C7 44 24 18 01 00 00 00 74 0F ...l$ .D$.....t.
0040F6E0 8B 54 24 28 8B 01 8B 40 74 52 55 FF D0 EB 0D 8B .T$(...@tRU.....
0040F6F0 4C 24 28 51 8B CD FF 15 3C 43 8A 00 8B 4C 24 24 L$(Q....<C...L$$
0040F700 85 C9 C6 44 24 18 00 C7 44 24 0C 01 00 00 00 74 ...D$...D$.....t
0040F710 19 8B F1 E8 C8 23 FF FF 83 F8 01 75 0D 85 F6 74 .....#.....u...t
0040F720 09 8B 16 50 8B 02 8B CE FF D0 8B C5 8B 4C 24 10 ...P.........L$.
0040F730 64 89 0D 00 00 00 00 59 5E 5D 83 C4 10 C2 0C 00 d......Y^]......
0040F740 6A FF 68 D8 D2 82 00 64 A1 00 00 00 00 50 53 56 j.h....d.....PSV
0040F750 A1 88 41 A1 00 33 C4 50 8D 44 24 0C 64 A3 00 00 ..A..3.P.D$.d...
0040F760 00 00 8B 44 24 1C 6A 01 50 8D 54 24 24 52 E8 0D ...D$.j.P.T$$R..
0040F770 F0 FF FF 8B 4C 24 1C 85 C9 C7 44 24 14 00 00 00 ....L$....D$....
0040F780 00 74 52 8B 54 24 24 8B 01 8B 40 78 52 8B 54 24 .tR.T$$...@xR.T$
0040F790 24 52 FF D0 8B 4C 24 1C 85 C9 8A D8 C7 44 24 14 $R...L$......D$.
0040F7A0 FF FF FF FF 74 19 8B F1 E8 33 23 FF FF 83 F8 01 ....t....3#.....
0040F7B0 75 0D 85 F6 74 09 8B 16 50 8B 02 8B CE FF D0 8A u...t...P.......
0040F7C0 C3 8B 4C 24 0C 64 89 0D 00 00 00 00 59 5E 5B 83 ..L$.d......Y^[.
0040F7D0 C4 0C C2 0C 00 32 C0 8B 4C 24 0C 64 89 0D 00 00 .....2..L$.d....
0040F7E0 00 00 59 5E 5B 83 C4 0C C2 0C 00 CC CC CC CC CC ..Y^[...........
0040F7F0 6A FF 68 08 D3 82 00 64 A1 00 00 00 00 50 53 56 j.h....d.....PSV
0040F800 A1 88 41 A1 00 33 C4 50 8D 44 24 0C 64 A3 00 00 ..A..3.P.D$.d...
0040F810 00 00 8B 44 24 1C 6A 01 50 8D 54 24 24 52 E8 5D ...D$.j.P.T$$R.]
0040F820 EF FF FF 8B 4C 24 1C 85 C9 C7 44 24 14 00 00 00 ....L$....D$....
0040F830 00 74 52 8B 54 24 24 8B 01 8B 40 7C 52 8B 54 24 .tR.T$$...@|R.T$
0040F840 24 52 FF D0 8B 4C 24 1C 85 C9 8A D8 C7 44 24 14 $R...L$......D$.
0040F850 FF FF FF FF 74 19 8B F1 E8 83 22 FF FF 83 F8 01 ....t.....".....
0040F860 75 0D 85 F6 74 09 8B 16 50 8B 02 8B CE FF D0 8A u...t...P.......
0040F870 C3 8B 4C 24 0C 64 89 0D 00 00 00 00 59 5E 5B 83 ..L$.d......Y^[.
0040F880 C4 0C C2 0C 00 32 C0 8B 4C 24 0C 64 89 0D 00 00 .....2..L$.d....
0040F890 00 00 59 5E 5B 83 C4 0C C2 0C 00 CC CC CC CC CC ..Y^[...........
0040F8A0 6A FF 68 38 D3 82 00 64 A1 00 00 00 00 50 53 56 j.h8...d.....PSV
0040F8B0 A1 88 41 A1 00 33 C4 50 8D 44 24 0C 64 A3 00 00 ..A..3.P.D$.d...
0040F8C0 00 00 8B 44 24 1C 6A 01 50 8D 54 24 24 52 E8 AD ...D$.j.P.T$$R..
0040F8D0 EE FF FF 8B 4C 24 1C 85 C9 C7 44 24 14 00 00 00 ....L$....D$....
0040F8E0 00 74 58 8B 54 24 24 D9 44 24 20 8B 01 8B 80 84 .tX.T$$.D$ .....
0040F8F0 00 00 00 52 51 D9 1C 24 FF D0 8B 4C 24 1C 85 C9 ...RQ..$...L$...
0040F900 8A D8 C7 44 24 14 FF FF FF FF 74 19 8B F1 E8 CD ...D$.....t.....
0040F910 21 FF FF 83 F8 01 75 0D 85 F6 74 09 8B 16 50 8B !.....u...t...P.
0040F920 02 8B CE FF D0 8A C3 8B 4C 24 0C 64 89 0D 00 00 ........L$.d....
0040F930 00 00 59 5E 5B 83 C4 0C C2 0C 00 32 C0 8B 4C 24 ..Y^[......2..L$
0040F940 0C 64 89 0D 00 00 00 00 59 5E 5B 83 C4 0C C2 0C .d......Y^[.....
0040F950 00 CC CC CC CC CC CC CC CC CC CC CC CC CC CC CC ................
0040F960 6A FF 68 68 D3 82 00 64 A1 00 00 00 00 50 53 56 j.hh...d.....PSV
0040F970 A1 88 41 A1 00 33 C4 50 8D 44 24 0C 64 A3 00 00 ..A..3.P.D$.d...
0040F980 00 00 8B 44 24 1C 6A 01 50 8D 54 24 24 52 E8 ED ...D$.j.P.T$$R..
0040F990 ED FF FF 8B 4C 24 1C 85 C9 C7 44 24 14 00 00 00 ....L$....D$....
0040F9A0 00 74 50 8B 01 8B 54 24 20 8B 80 8C 00 00 00 52 .tP...T$ ......R
0040F9B0 FF D0 8B 4C 24 1C 85 C9 8A D8 C7 44 24 14 FF FF ...L$......D$...
0040F9C0 FF FF 74 19 8B F1 E8 15 21 FF FF 83 F8 01 75 0D ..t.....!.....u.
0040F9D0 85 F6 74 09 8B 16 50 8B 02 8B CE FF D0 8A C3 8B ..t...P.........
0040F9E0 4C 24 0C 64 89 0D 00 00 00 00 59 5E 5B 83 C4 0C L$.d......Y^[...
0040F9F0 C2 08 00 32 C0 8B 4C 24 0C 64 89 0D 00 00 00 00 ...2..L$.d......
0040FA00 59 5E 5B 83 C4 0C C2 08 00 CC CC CC CC CC CC CC Y^[.............
0040FA10 6A FF 68 98 D3 82 00 64 A1 00 00 00 00 50 53 56 j.h....d.....PSV
0040FA20 A1 88 41 A1 00 33 C4 50 8D 44 24 0C 64 A3 00 00 ..A..3.P.D$.d...
0040FA30 00 00 8B 44 24 1C 6A 01 50 8D 54 24 24 52 E8 3D ...D$.j.P.T$$R.=
0040FA40 ED FF FF 8B 4C 24 1C 85 C9 C7 44 24 14 00 00 00 ....L$....D$....
0040FA50 00 74 50 8B 01 8B 54 24 20 8B 80 90 00 00 00 52 .tP...T$ ......R
0040FA60 FF D0 8B 4C 24 1C 85 C9 8A D8 C7 44 24 14 FF FF ...L$......D$...
0040FA70 FF FF 74 19 8B F1 E8 65 20 FF FF 83 F8 01 75 0D ..t....e .....u.
0040FA80 85 F6 74 09 8B 16 50 8B 02 8B CE FF D0 8A C3 8B ..t...P.........
0040FA90 4C 24 0C 64 89 0D 00 00 00 00 59 5E 5B 83 C4 0C L$.d......Y^[...
0040FAA0 C2 08 00 32 C0 8B 4C 24 0C 64 89 0D 00 00 00 00 ...2..L$.d......
0040FAB0 59 5E 5B 83 C4 0C C2 08 00 CC CC CC CC CC CC CC Y^[.............
0040FAC0 6A FF 68 C8 D3 82 00 64 A1 00 00 00 00 50 53 56 j.h....d.....PSV
0040FAD0 A1 88 41 A1 00 33 C4 50 8D 44 24 0C 64 A3 00 00 ..A..3.P.D$.d...
0040FAE0 00 00 8B 44 24 1C 6A 01 50 8D 54 24 24 52 E8 8D ...D$.j.P.T$$R..
0040FAF0 EC FF FF 8B 4C 24 1C 85 C9 C7 44 24 14 00 00 00 ....L$....D$....
0040FB00 00 74 55 8B 54 24 24 8B 01 8B 80 94 00 00 00 52 .tU.T$$........R
0040FB10 8B 54 24 24 52 FF D0 8B 4C 24 1C 85 C9 8A D8 C7 .T$$R...L$......
0040FB20 44 24 14 FF FF FF FF 74 19 8B F1 E8 B0 1F FF FF D$.....t........
0040FB30 83 F8 01 75 0D 85 F6 74 09 8B 16 50 8B 02 8B CE ...u...t...P....
0040FB40 FF D0 8A C3 8B 4C 24 0C 64 89 0D 00 00 00 00 59 .....L$.d......Y
0040FB50 5E 5B 83 C4 0C C2 0C 00 32 C0 8B 4C 24 0C 64 89 ^[......2..L$.d.
0040FB60 0D 00 00 00 00 59 5E 5B 83 C4 0C C2 0C 00 CC CC .....Y^[........
0040FB70 6A FF 68 F8 D3 82 00 64 A1 00 00 00 00 50 53 56 j.h....d.....PSV
0040FB80 A1 88 41 A1 00 33 C4 50 8D 44 24 0C 64 A3 00 00 ..A..3.P.D$.d...
0040FB90 00 00 8B 44 24 1C 6A 01 50 8D 54 24 24 52 E8 DD ...D$.j.P.T$$R..
0040FBA0 EB FF FF 8B 4C 24 1C 85 C9 C7 44 24 14 00 00 00 ....L$....D$....
0040FBB0 00 74 55 8B 54 24 24 8B 01 8B 80 98 00 00 00 52 .tU.T$$........R
0040FBC0 8B 54 24 24 52 FF D0 8B 4C 24 1C 85 C9 8A D8 C7 .T$$R...L$......
0040FBD0 44 24 14 FF FF FF FF 74 19 8B F1 E8 00 1F FF FF D$.....t........
0040FBE0 83 F8 01 75 0D 85 F6 74 09 8B 16 50 8B 02 8B CE ...u...t...P....
0040FBF0 FF D0 8A C3 8B 4C 24 0C 64 89 0D 00 00 00 00 59 .....L$.d......Y
0040FC00 5E 5B 83 C4 0C C2 0C 00 32 C0 8B 4C 24 0C 64 89 ^[......2..L$.d.
0040FC10 0D 00 00 00 00 59 5E 5B 83 C4 0C C2 0C 00 CC CC .....Y^[........
0040FC20 6A FF 68 28 D4 82 00 64 A1 00 00 00 00 50 53 56 j.h(...d.....PSV
0040FC30 A1 88 41 A1 00 33 C4 50 8D 44 24 0C 64 A3 00 00 ..A..3.P.D$.d...
0040FC40 00 00 8B 44 24 1C 6A 01 50 8D 54 24 24 52 E8 2D ...D$.j.P.T$$R.-
0040FC50 EB FF FF 8B 4C 24 1C 85 C9 C7 44 24 14 00 00 00 ....L$....D$....
0040FC60 00 74 55 8B 54 24 24 8B 01 8B 80 9C 00 00 00 52 .tU.T$$........R
0040FC70 8B 54 24 24 52 FF D0 8B 4C 24 1C 85 C9 8A D8 C7 .T$$R...L$......
0040FC80 44 24 14 FF FF FF FF 74 19 8B F1 E8 50 1E FF FF D$.....t....P...
0040FC90 83 F8 01 75 0D 85 F6 74 09 8B 16 50 8B 02 8B CE ...u...t...P....
0040FCA0 FF D0 8A C3 8B 4C 24 0C 64 89 0D 00 00 00 00 59 .....L$.d......Y
0040FCB0 5E 5B 83 C4 0C C2 0C 00 32 C0 8B 4C 24 0C 64 89 ^[......2..L$.d.
0040FCC0 0D 00 00 00 00 59 5E 5B 83 C4 0C C2 0C 00 CC CC .....Y^[........
0040FCD0 6A FF 68 58 D4 82 00 64 A1 00 00 00 00 50 53 56 j.hX...d.....PSV
0040FCE0 A1 88 41 A1 00 33 C4 50 8D 44 24 0C 64 A3 00 00 ..A..3.P.D$.d...
0040FCF0 00 00 8B 44 24 1C 6A 01 50 8D 54 24 24 52 E8 7D ...D$.j.P.T$$R.}
0040FD00 EA FF FF 8B 4C 24 1C 85 C9 C7 44 24 14 00 00 00 ....L$....D$....
0040FD10 00 74 55 8B 54 24 24 8B 01 8B 80 A0 00 00 00 52 .tU.T$$........R
0040FD20 8B 54 24 24 52 FF D0 8B 4C 24 1C 85 C9 8A D8 C7 .T$$R...L$......
0040FD30 44 24 14 FF FF FF FF 74 19 8B F1 E8 A0 1D FF FF D$.....t........
0040FD40 83 F8 01 75 0D 85 F6 74 09 8B 16 50 8B 02 8B CE ...u...t...P....
0040FD50 FF D0 8A C3 8B 4C 24 0C 64 89 0D 00 00 00 00 59 .....L$.d......Y
0040FD60 5E 5B 83 C4 0C C2 0C 00 32 C0 8B 4C 24 0C 64 89 ^[......2..L$.d.
0040FD70 0D 00 00 00 00 59 5E 5B 83 C4 0C C2 0C 00 CC CC .....Y^[........
0040FD80 6A FF 68 90 D4 82 00 64 A1 00 00 00 00 50 51 53 j.h....d.....PQS
0040FD90 56 57 A1 88 41 A1 00 33 C4 50 8D 44 24 14 64 A3 VW..A..3.P.D$.d.
0040FDA0 00 00 00 00 8B 44 24 24 6A 01 50 8D 54 24 18 33 .....D$$j.P.T$.3
0040FDB0 DB 52 89 5C 24 28 E8 C5 E9 FF FF 8B 4C 24 10 3B .R.\$(......L$.;
0040FDC0 CB C6 44 24 1C 01 0F 84 80 00 00 00 8B 74 24 28 ..D$.........t$(
0040FDD0 3B F3 51 8B C4 89 64 24 28 89 30 74 04 83 46 04 ;.Q...d$(.0t..F.
0040FDE0 01 8B 01 8B 90 A4 00 00 00 FF D2 8B 4C 24 10 3B ............L$.;
0040FDF0 CB 88 44 24 24 88 5C 24 1C 74 1A 8B F9 E8 DE 1C ..D$$.\$.t......
0040FE00 FF FF 83 F8 01 75 0E 3B FB 74 0A 8B 07 8B 10 6A .....u.;.t.....j
0040FE10 01 8B CF FF D2 83 C8 FF 3B F3 89 5C 24 10 89 44 ........;..\$..D
0040FE20 24 1C 74 0F 01 46 04 75 0A 8B 06 8B 10 6A 01 8B $.t..F.u.....j..
0040FE30 CE FF D2 8A 44 24 24 8B 4C 24 14 64 89 0D 00 00 ....D$$.L$.d....
0040FE40 00 00 59 5F 5E 5B 83 C4 10 C2 08 00 8B 4C 24 28 ..Y_^[.......L$(
0040FE50 83 C8 FF 3B CB 89 5C 24 10 89 44 24 1C 74 0D 01 ...;..\$..D$.t..
0040FE60 41 04 75 08 8B 01 8B 10 6A 01 FF D2 32 C0 8B 4C A.u.....j...2..L
0040FE70 24 14 64 89 0D 00 00 00 00 59 5F 5E 5B 83 C4 10 $.d......Y_^[...
0040FE80 C2 08 00 CC CC CC CC CC CC CC CC CC CC CC CC CC ................
0040FE90 6A FF 68 B8 D4 82 00 64 A1 00 00 00 00 50 53 56 j.h....d.....PSV
0040FEA0 A1 88 41 A1 00 33 C4 50 8D 44 24 0C 64 A3 00 00 ..A..3.P.D$.d...
0040FEB0 00 00 8B 44 24 1C 6A 01 50 8D 54 24 24 52 E8 BD ...D$.j.P.T$$R..
0040FEC0 E8 FF FF 8B 4C 24 1C 85 C9 C7 44 24 14 00 00 00 ....L$....D$....
0040FED0 00 74 50 8B 01 8B 54 24 20 8B 80 A8 00 00 00 52 .tP...T$ ......R
0040FEE0 FF D0 8B 4C 24 1C 85 C9 8A D8 C7 44 24 14 FF FF ...L$......D$...
0040FEF0 FF FF 74 19 8B F1 E8 E5 1B FF FF 83 F8 01 75 0D ..t...........u.
0040FF00 85 F6 74 09 8B 16 50 8B 02 8B CE FF D0 8A C3 8B ..t...P.........
0040FF10 4C 24 0C 64 89 0D 00 00 00 00 59 5E 5B 83 C4 0C L$.d......Y^[...
0040FF20 C2 08 00 32 C0 8B 4C 24 0C 64 89 0D 00 00 00 00 ...2..L$.d......
0040FF30 59 5E 5B 83 C4 0C C2 08 00 CC CC CC CC CC CC CC Y^[.............

;; fn0040FF40: 0040FF40
;;   Called from:
;;     00413AAF (in fn00413A20)
fn0040FF40 proc
	push	0FFh
	push	82D51Bh
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,24h
	push	ebx
	push	ebp
	push	esi
	push	edi
	mov	eax,[0A14188h]
	xor	eax,esp
	push	eax
	lea	eax,[esp+38h]
	mov	fs:[0000h],eax
	mov	esi,ecx
	xor	ebp,ebp
	mov	[esp+18h],ebp
	mov	[esp+14h],ebp
	mov	eax,[8A434Ch]
	mov	ecx,[eax]
	mov	ebx,[esp+4Ch]
	push	ecx
	push	8A6A50h
	mov	ecx,ebx
	mov	dword ptr [esp+48h],1h
	call	dword ptr [8A4348h]
	mov	edi,eax
	test	edi,edi
	jl	4100B0h

l0040FF9E:
	mov	ecx,ebx
	call	dword ptr [8A435Ch]
	cmp	edi,eax
	jg	4100B0h

l0040FFAE:
	push	edi
	push	ebp
	lea	edx,[esp+24h]
	push	edx
	mov	ecx,ebx
	call	dword ptr [8A4340h]
	mov	ecx,[esp+54h]
	push	ecx
	push	eax
	lea	edx,[esp+54h]
	push	edx
	mov	ecx,esi
	mov	byte ptr [esp+4Ch],2h
	call	40E780h
	mov	eax,[eax]
	test	eax,eax
	jz	40FFEBh

l0040FFDA:
	mov	ebp,eax
	test	ebp,ebp
	mov	[esp+14h],ebp
	jz	40FFEBh

l0040FFE4:
	mov	ecx,ebp
	call	401AD0h

l0040FFEB:
	mov	ecx,[esp+4Ch]
	test	ecx,ecx
	mov	byte ptr [esp+40h],2h
	jz	410012h

l0040FFF8:
	mov	esi,ecx
	call	401AE0h
	cmp	eax,1h
	jnz	410012h

l00410004:
	test	esi,esi
	jz	410012h

l00410008:
	mov	eax,[esi]
	mov	edx,[eax]
	push	1h
	mov	ecx,esi
	call	edx

l00410012:
	lea	ecx,[esp+1Ch]
	mov	dword ptr [esp+4Ch],0h
	mov	byte ptr [esp+40h],1h
	call	dword ptr [8A4338h]
	test	ebp,ebp
	jz	41008Ch

l0041002D:
	mov	eax,[8A434Ch]
	mov	ecx,[eax]
	push	ecx
	add	edi,1h
	push	edi
	lea	edx,[esp+24h]
	push	edx
	mov	ecx,ebx
	call	dword ptr [8A4340h]
	mov	ecx,[esp+50h]
	push	eax
	mov	byte ptr [esp+44h],4h
	call	dword ptr [8A4358h]
	lea	ecx,[esp+1Ch]
	mov	byte ptr [esp+40h],1h
	call	dword ptr [8A4338h]
	mov	esi,[esp+48h]
	mov	ecx,ebp
	mov	[esi],ebp
	call	401AD0h
	lea	ecx,[esp+14h]
	mov	dword ptr [esp+18h],1h
	mov	byte ptr [esp+40h],0h
	call	41C0B0h
	mov	eax,esi
	jmp	4100CEh

l0041008C:
	mov	esi,[esp+48h]
	lea	ecx,[esp+14h]
	mov	dword ptr [esi],0h
	mov	dword ptr [esp+18h],1h
	mov	byte ptr [esp+40h],0h
	call	41C0B0h
	mov	eax,esi
	jmp	4100CEh

l004100B0:
	mov	ecx,[esp+50h]
	push	ebx
	call	dword ptr [8A4358h]
	test	esi,esi
	mov	edi,[esp+48h]
	mov	[edi],esi
	jz	4100CCh

l004100C5:
	mov	ecx,esi
	call	401AD0h

l004100CC:
	mov	eax,edi

l004100CE:
	mov	ecx,[esp+38h]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebp
	pop	ebx
	add	esp,30h
	ret	10h
004100E4             CC CC CC CC CC CC CC CC CC CC CC CC     ............

;; fn004100F0: 004100F0
;;   Called from:
;;     007B2DF3 (in fn007B2D10)
fn004100F0 proc
	push	0FFh
	push	82D587h
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,14h
	push	ebx
	push	ebp
	push	esi
	push	edi
	mov	eax,[0A14188h]
	xor	eax,esp
	push	eax
	lea	eax,[esp+28h]
	mov	fs:[0000h],eax
	mov	dword ptr [esp+18h],0h
	mov	esi,[esp+40h]
	cmp	dword ptr [esi+0Ch],0h
	mov	ebx,1h
	mov	[esp+30h],ebx
	jle	410159h

l00410132:
	mov	ecx,[esi+8h]
	mov	al,[ecx]
	test	al,al
	jz	410159h

l0041013B:
	jmp	410140h
0041013D                                        8D 49 00              .I.

l00410140:
	cmp	al,20h
	jz	410150h

l00410144:
	cmp	al,9h
	jz	410150h

l00410148:
	cmp	al,0Dh
	jz	410150h

l0041014C:
	cmp	al,0Ah
	jnz	410194h

l00410150:
	mov	al,[ecx+ebx]
	add	ecx,ebx
	test	al,al
	jnz	410140h

l00410159:
	mov	edi,[esp+3Ch]
	push	ecx
	mov	eax,esp
	mov	[eax],esi
	add	[esi+4h],ebx
	mov	[esp+28h],esp
	lea	eax,[esp+18h]
	push	edi
	push	eax
	call	41EA60h
	add	esp,0Ch
	mov	ecx,[esp+14h]
	test	ecx,ecx
	mov	byte ptr [esp+30h],4h
	jz	41027Ch

l00410188:
	mov	ebp,[esp+38h]
	mov	[ebp+0h],ecx
	jmp	4102B8h

l00410194:
	mov	cl,[ecx]
	test	cl,cl
	jz	410159h

l0041019A:
	cmp	cl,3Ch
	jnz	410159h

l0041019F:
	cmp	byte ptr [esp+44h],0h
	jnz	41020Ch

l004101A6:
	push	14h
	call	694FD8h
	add	esp,4h
	mov	[esp+1Ch],eax
	test	eax,eax
	mov	byte ptr [esp+30h],2h
	jz	4101DBh

l004101BD:
	push	ecx
	mov	edx,esp
	mov	dword ptr [edx],0h
	mov	edx,[esi+0Ch]
	mov	esi,[esi+8h]
	mov	[esp+28h],esp
	push	edx
	push	esi
	mov	ecx,eax
	call	41A830h
	jmp	4101DDh

l004101DB:
	xor	eax,eax

l004101DD:
	test	eax,eax
	mov	[esp+1Ch],eax
	jz	4101E8h

l004101E5:
	add	[eax+4h],ebx

l004101E8:
	lea	eax,[esp+1Ch]
	push	eax
	lea	ecx,[esp+44h]
	mov	byte ptr [esp+34h],3h
	call	529B70h
	lea	ecx,[esp+1Ch]
	mov	[esp+30h],bl
	call	634DD0h
	mov	esi,[esp+40h]

l0041020C:
	test	esi,esi
	push	ecx
	mov	eax,esp
	mov	[esp+28h],esp
	mov	[eax],esi
	jz	41021Ch

l00410219:
	add	[esi+4h],ebx

l0041021C:
	mov	ecx,[esp+40h]
	push	ecx
	lea	edx,[esp+28h]
	push	edx
	call	418D40h
	mov	ecx,[esp+2Ch]
	mov	edi,[esp+44h]
	add	esp,0Ch
	test	ecx,ecx
	mov	[edi],ecx
	jz	410241h

l0041023C:
	call	401AD0h

l00410241:
	lea	ecx,[esp+20h]
	mov	[esp+18h],ebx
	call	41C0B0h
	test	esi,esi
	mov	byte ptr [esp+30h],0h
	jz	410266h

l00410257:
	add	dword ptr [esi+4h],0FFh
	jnz	410266h

l0041025D:
	mov	eax,[esi]
	mov	edx,[eax]
	push	ebx
	mov	ecx,esi
	call	edx

l00410266:
	mov	eax,edi
	mov	ecx,[esp+28h]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebp
	pop	ebx
	add	esp,20h
	ret

l0041027C:
	push	40h
	call	694FD8h
	add	esp,4h
	mov	[esp+24h],eax
	test	eax,eax
	mov	byte ptr [esp+30h],5h
	jz	4102A9h

l00410293:
	push	ecx
	mov	edx,esp
	mov	[esp+24h],esp
	mov	[edx],esi
	add	[esi+4h],ebx
	push	edi
	mov	ecx,eax
	call	41AC20h
	jmp	4102ABh

l004102A9:
	xor	eax,eax

l004102AB:
	test	eax,eax
	mov	ebp,[esp+38h]
	mov	[ebp+0h],eax
	jz	4102BDh

l004102B6:
	mov	ecx,eax

l004102B8:
	call	401AD0h

l004102BD:
	mov	ecx,[esp+14h]
	test	ecx,ecx
	mov	[esp+30h],bl
	mov	[esp+18h],ebx
	jz	4102E5h

l004102CD:
	mov	edi,ecx
	call	401AE0h
	cmp	eax,ebx
	jnz	4102E5h

l004102D8:
	test	edi,edi
	jz	4102E5h

l004102DC:
	mov	edx,[edi]
	mov	eax,[edx]
	push	ebx
	mov	ecx,edi
	call	eax

l004102E5:
	mov	dword ptr [esp+14h],0h
	add	dword ptr [esi+4h],0FFh
	mov	byte ptr [esp+30h],0h
	jnz	410301h

l004102F8:
	mov	edx,[esi]
	mov	eax,[edx]
	push	ebx
	mov	ecx,esi
	call	eax

l00410301:
	mov	eax,ebp
	mov	ecx,[esp+28h]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebp
	pop	ebx
	add	esp,20h
	ret
00410317                      CC CC CC CC CC CC CC CC CC        .........
00410320 6A FF 68 E3 D5 82 00 64 A1 00 00 00 00 50 83 EC j.h....d.....P..
00410330 68 A1 88 41 A1 00 33 C4 89 44 24 64 53 55 56 57 h..A..3..D$dSUVW
00410340 A1 88 41 A1 00 33 C4 50 8D 44 24 7C 64 A3 00 00 ..A..3.P.D$|d...
00410350 00 00 8B 0D 4C 43 8A 00 8B 11 8B BC 24 8C 00 00 ....LC......$...
00410360 00 8B 84 24 94 00 00 00 8B 9C 24 90 00 00 00 52 ...$......$....R
00410370 6A 2F 8B CF 89 5C 24 28 89 44 24 24 FF 15 30 44 j/...\$(.D$$..0D
00410380 8A 00 33 F6 8B E8 89 74 24 18 8D 4C 24 40 89 B4 ..3....t$..L$@..
00410390 24 84 00 00 00 FF 15 B0 43 8A 00 8B CF C6 84 24 $.......C......$
004103A0 84 00 00 00 01 FF 15 44 43 8A 00 3B E8 0F 83 C1 .......DC..;....
004103B0 00 00 00 55 56 8D 44 24 64 50 8B CF FF 15 40 43 ...UV.D$dP....@C
004103C0 8A 00 56 8D 4C 24 60 51 8D 54 24 1C 52 C6 84 24 ..V.L$`Q.T$.R..$
004103D0 90 00 00 00 02 E8 46 26 FF FF 83 C4 0C 8B 00 85 ......F&........
004103E0 C0 74 11 8B F0 85 F6 89 74 24 18 74 07 8B CE E8 .t......t$.t....
004103F0 DC 16 FF FF 8B 4C 24 14 85 C9 C6 84 24 84 00 00 .....L$.....$...
00410400 00 02 74 1A 8B D9 E8 D5 16 FF FF 83 F8 01 75 0E ..t...........u.
00410410 85 DB 74 0A 8B 03 8B 10 6A 01 8B CB FF D2 A1 4C ..t.....j......L
00410420 43 8A 00 8B 08 51 83 C5 01 55 8D 54 24 2C 52 8B C....Q...U.T$,R.
00410430 CF FF 15 40 43 8A 00 50 8D 4C 24 44 C6 84 24 88 ...@C..P.L$D..$.
00410440 00 00 00 04 FF 15 58 43 8A 00 8D 4C 24 24 C6 84 ......XC...L$$..
00410450 24 84 00 00 00 02 FF 15 38 43 8A 00 8D 4C 24 5C $.......8C...L$\
00410460 C6 84 24 84 00 00 00 01 FF 15 38 43 8A 00 8B 5C ..$.......8C...\
00410470 24 20 EB 65 8D 44 24 14 50 E8 42 44 FF FF 8B C8 $ .e.D$.P.BD....
00410480 E8 5B 24 FF FF 8B 00 85 C0 74 11 8B F0 85 F6 89 .[$......t......
00410490 74 24 18 74 07 8B CE E8 34 16 FF FF 8B 4C 24 14 t$.t....4....L$.
004104A0 85 C9 C6 84 24 84 00 00 00 01 74 1A 8B E9 E8 2D ....$.....t....-
004104B0 16 FF FF 83 F8 01 75 0E 85 ED 74 0A 8B 55 00 50 ......u...t..U.P
004104C0 8B 02 8B CD FF D0 57 8D 4C 24 44 C7 44 24 18 00 ......W.L$D.D$..
004104D0 00 00 00 FF 15 58 43 8A 00 85 F6 75 2C 8B CF FF .....XC....u,...
004104E0 15 54 43 8A 00 50 68 A8 77 8A 00 E8 90 07 11 00 .TC..Ph.w.......
004104F0 83 C4 08 8D 4C 24 40 C6 84 24 84 00 00 00 00 FF ....L$@..$......
00410500 15 38 43 8A 00 32 C0 EB 6B 8D 4C 24 40 51 8B 4C .8C..2..k.L$@Q.L
00410510 24 20 FF 15 58 43 8A 00 8B 3B 3B FE 74 22 8B CE $ ..XC...;;.t"..
00410520 89 33 E8 A9 15 FF FF 85 FF 74 15 8B CF E8 AE 15 .3.......t......
00410530 FF FF 83 F8 01 75 09 8B 17 50 8B 02 8B CF FF D0 .....u...P......
00410540 8D 4C 24 40 C6 84 24 84 00 00 00 00 FF 15 38 43 .L$@..$.......8C
00410550 8A 00 8B CE C7 84 24 84 00 00 00 FF FF FF FF E8 ......$.........
00410560 7C 15 FF FF 83 F8 01 75 09 8B 16 50 8B 02 8B CE |......u...P....
00410570 FF D0 B0 01 8B 4C 24 7C 64 89 0D 00 00 00 00 59 .....L$|d......Y
00410580 5F 5E 5D 5B 8B 4C 24 64 33 CC E8 FF 45 28 00 83 _^][.L$d3...E(..
00410590 C4 74 C3 CC CC CC CC CC CC CC CC CC CC CC CC CC .t..............
004105A0 6A FF 68 4B D6 82 00 64 A1 00 00 00 00 50 83 EC j.hK...d.....P..
004105B0 58 53 55 56 57 A1 88 41 A1 00 33 C4 50 8D 44 24 XSUVW..A..3.P.D$
004105C0 6C 64 A3 00 00 00 00 8B F9 33 ED 80 BC 24 80 00 ld.......3...$..
004105D0 00 00 00 89 6C 24 74 74 5E 8B 07 8B 50 28 FF D2 ....l$tt^...P(..
004105E0 8D 44 24 50 50 E8 B6 D8 FF FF 83 C4 04 8B 4C 24 .D$PP.........L$
004105F0 7C 8B 11 8B 52 58 55 50 8D 44 24 3C 50 C6 84 24 |...RXUP.D$<P..$
00410600 80 00 00 00 01 FF D2 8B 17 50 8B 82 8C 00 00 00 .........P......
00410610 8B CF C6 44 24 78 02 FF D0 8D 4C 24 34 C6 44 24 ...D$x....L$4.D$
00410620 74 01 FF 15 38 43 8A 00 8D 4C 24 50 C6 44 24 74 t...8C...L$P.D$t
00410630 00 FF 15 38 43 8A 00 8D 4C 24 1C 51 8B 8C 24 80 ...8C...L$.Q..$.
00410640 00 00 00 E8 E8 E6 FF FF C6 44 24 74 03 8D 49 00 .........D$t..I.
00410650 8B 4C 24 7C 8D 54 24 24 52 E8 82 E7 FF FF 8B 4C .L$|.T$$R......L
00410660 24 20 3B 48 04 75 0C 8B 54 24 1C 3B 10 75 04 32 $ ;H.u..T$.;.u.2
00410670 DB EB 02 B3 01 8B 4C 24 24 3B CD 74 1A 8B F1 E8 ......L$$;.t....
00410680 5C 14 FF FF 83 F8 01 75 0E 3B F5 74 0A 8B 06 8B \......u.;.t....
00410690 10 6A 01 8B CE FF D2 84 DB 89 6C 24 24 0F 84 FA .j........l$$...
004106A0 00 00 00 8D 44 24 14 50 8D 4C 24 20 E8 BF DC FF ....D$.P.L$ ....
004106B0 FF 8B 08 8B 11 8B 52 2C 8D 44 24 50 50 C6 44 24 ......R,.D$PP.D$
004106C0 78 04 FF D2 8B 17 8B 52 14 50 8D 84 24 84 00 00 x......R.P..$...
004106D0 00 50 8B CF C6 44 24 7C 05 FF D2 8D 4C 24 50 C6 .P...D$|....L$P.
004106E0 44 24 74 07 FF 15 38 43 8A 00 8B 4C 24 14 3B CD D$t...8C...L$.;.
004106F0 C6 44 24 74 08 74 1A 8B F1 E8 E2 13 FF FF 83 F8 .D$t.t..........
00410700 01 75 0E 3B F5 74 0A 8B 06 8B 10 6A 01 8B CE FF .u.;.t.....j....
00410710 D2 6A 01 51 8B C4 89 64 24 20 50 8D 4C 24 28 89 .j.Q...d$ P.L$(.
00410720 6C 24 20 E8 48 DC FF FF 8B 8C 24 88 00 00 00 E8 l$ .H.....$.....
00410730 6C FE FF FF 55 8D 4C 24 30 51 8D 4C 24 24 E8 BD l...U.L$0Q.L$$..
00410740 DD FF FF 8B 4C 24 2C 3B CD 74 19 8B F1 E8 8E 13 ....L$,;.t......
00410750 FF FF 83 F8 01 75 0D 3B F5 74 09 8B 16 50 8B 02 .....u.;.t...P..
00410760 8B CE FF D0 8B 8C 24 80 00 00 00 3B CD 89 6C 24 ......$....;..l$
00410770 2C C6 44 24 74 03 74 19 8B F1 E8 61 13 FF FF 83 ,.D$t.t....a....
00410780 F8 01 75 0D 3B F5 74 09 8B 16 50 8B 02 8B CE FF ..u.;.t...P.....
00410790 D0 89 AC 24 80 00 00 00 E9 B3 FE FF FF 8B 4C 24 ...$..........L$
004107A0 1C 3B CD C6 44 24 74 00 74 19 8B F1 E8 2F 13 FF .;..D$t.t..../..
004107B0 FF 83 F8 01 75 0D 3B F5 74 09 8B 16 50 8B 02 8B ....u.;.t...P...
004107C0 CE FF D0 8B 74 24 7C 3B F5 89 6C 24 1C C7 44 24 ....t$|;..l$..D$
004107D0 74 FF FF FF FF 74 15 8B CE E8 02 13 FF FF 83 F8 t....t..........
004107E0 01 75 09 8B 16 50 8B 02 8B CE FF D0 8B 4C 24 6C .u...P.......L$l
004107F0 64 89 0D 00 00 00 00 59 5F 5E 5D 5B 83 C4 64 C2 d......Y_^][..d.
00410800 08 00 CC CC CC CC CC CC CC CC CC CC CC CC CC CC ................
00410810 6A FF 68 C1 D6 82 00 64 A1 00 00 00 00 50 83 EC j.h....d.....P..
00410820 7C 53 55 56 57 A1 88 41 A1 00 33 C4 50 8D 84 24 |SUVW..A..3.P..$
00410830 90 00 00 00 64 A3 00 00 00 00 8B F9 8B B4 24 A0 ....d.........$.
00410840 00 00 00 85 F6 C7 84 24 98 00 00 00 00 00 00 00 .......$........
00410850 75 0A B8 01 00 00 00 E9 56 02 00 00 8B 06 8B 50 u.......V......P
00410860 2C 8D 4C 24 3C 51 8B CE FF D2 8B D8 8B 07 8B 50 ,.L$<Q.........P
00410870 2C 8D 4C 24 20 51 8B CF C6 84 24 9C 00 00 00 01 ,.L$ Q....$.....
00410880 FF D2 53 8B C8 C6 84 24 9C 00 00 00 02 FF 15 38 ..S....$.......8
00410890 44 8A 00 8D 4C 24 20 8B D8 C6 84 24 98 00 00 00 D...L$ ....$....
004108A0 01 FF 15 38 43 8A 00 8D 4C 24 3C C6 84 24 98 00 ...8C...L$<..$..
004108B0 00 00 00 FF 15 38 43 8A 00 85 DB 74 28 8B CE C7 .....8C....t(...
004108C0 84 24 98 00 00 00 FF FF FF FF E8 11 12 FF FF 83 .$..............
004108D0 F8 01 75 0A 8B 06 8B 10 6A 01 8B CE FF D2 8B C3 ..u.....j.......
004108E0 E9 CD 01 00 00 8D 44 24 74 50 E8 B1 D5 FF FF 83 ......D$tP......
004108F0 C4 04 8B 16 8B 52 58 6A 00 50 8D 44 24 60 50 8B .....RXj.P.D$`P.
00410900 CE C6 84 24 A4 00 00 00 03 FF D2 8B E8 8D 44 24 ...$..........D$
00410910 20 50 C6 84 24 9C 00 00 00 04 E8 81 D5 FF FF 83  P..$...........
00410920 C4 04 8B 17 8B 52 58 6A 00 50 8D 44 24 44 B3 05 .....RXj.P.D$D..
00410930 50 8B CF 88 9C 24 A4 00 00 00 FF D2 55 8B C8 C6 P....$......U...
00410940 84 24 9C 00 00 00 06 FF 15 38 44 8A 00 8D 4C 24 .$.......8D...L$
00410950 3C 8B E8 88 9C 24 98 00 00 00 FF 15 38 43 8A 00 <....$......8C..
00410960 8D 4C 24 20 C6 84 24 98 00 00 00 04 FF 15 38 43 .L$ ..$.......8C
00410970 8A 00 8D 4C 24 58 C6 84 24 98 00 00 00 03 FF 15 ...L$X..$.......
00410980 38 43 8A 00 8D 4C 24 74 C6 84 24 98 00 00 00 00 8C...L$t..$.....
00410990 FF 15 38 43 8A 00 85 ED 74 1E 8D 8C 24 A0 00 00 ..8C....t...$...
004109A0 00 C7 84 24 98 00 00 00 FF FF FF FF E8 FF B6 00 ...$............
004109B0 00 8B C5 E9 FA 00 00 00 8B 07 8B 50 04 8B CF FF ...........P....
004109C0 D2 8B D8 8B 06 8B 50 04 8B CE 89 5C 24 18 FF D2 ......P....\$...
004109D0 2B D8 74 1E 8D 8C 24 A0 00 00 00 C7 84 24 98 00 +.t...$......$..
004109E0 00 00 FF FF FF FF E8 C5 B6 00 00 8B C3 E9 C0 00 ................
004109F0 00 00 33 ED 39 6C 24 18 0F 8E 91 00 00 00 8B 06 ..3.9l$.........
00410A00 8B 50 0C 51 8B CC 89 64 24 20 55 51 8B CE FF D2 .P.Q...d$ UQ....
00410A10 8B 07 8B 50 0C 55 8D 4C 24 1C 51 8B CF C6 84 24 ...P.U.L$.Q....$
00410A20 A4 00 00 00 07 FF D2 8B 00 C6 84 24 9C 00 00 00 ...........$....
00410A30 08 8B C8 C6 84 24 9C 00 00 00 09 E8 D0 FD FF FF .....$..........
00410A40 8B 4C 24 14 85 C9 89 44 24 1C C6 84 24 98 00 00 .L$....D$...$...
00410A50 00 00 74 1A 8B D9 E8 85 10 FF FF 83 F8 01 75 0E ..t...........u.
00410A60 85 DB 74 0A 8B 03 8B 10 6A 01 8B CB FF D2 8B 5C ..t.....j......\
00410A70 24 1C 85 DB C7 44 24 14 00 00 00 00 0F 85 3B FE $....D$.......;.
00410A80 FF FF 83 C5 01 3B 6C 24 18 0F 8C 6F FF FF FF 8B .....;l$...o....
00410A90 CE C7 84 24 98 00 00 00 FF FF FF FF E8 3F 10 FF ...$.........?..
00410AA0 FF 83 F8 01 75 0A 8B 06 8B 10 6A 01 8B CE FF D2 ....u.....j.....
00410AB0 33 C0 8B 8C 24 90 00 00 00 64 89 0D 00 00 00 00 3...$....d......
00410AC0 59 5F 5E 5D 5B 81 C4 88 00 00 00 C2 04 00 CC CC Y_^][...........
00410AD0 51 8B 54 24 10 C6 04 24 00 8B 04 24 50 8B 44 24 Q.T$...$...$P.D$
00410AE0 14 52 8B 54 24 10 51 8B 4C 24 18 50 51 52 E8 FD .R.T$.Q.L$.PQR..
00410AF0 D5 FF FF 83 C4 1C C2 0C 00 CC CC CC CC CC CC CC ................
00410B00 51 8B 4C 24 08 8B 54 24 08 56 8B 74 24 0C C6 44 Q.L$..T$.V.t$..D
00410B10 24 04 00 8B 44 24 04 50 51 8B 4C 24 28 52 8B 54 $...D$.PQ.L$(R.T
00410B20 24 30 83 EC 08 8B C4 89 08 8B 4C 24 2C 89 50 04 $0........L$,.P.
00410B30 8B 54 24 30 83 EC 08 8B C4 89 08 8B 4C 24 2C 89 .T$0........L$,.
00410B40 50 04 8B 54 24 30 83 EC 08 8B C4 56 89 08 89 50 P..T$0.....V...P
00410B50 04 E8 8A D7 FF FF 83 C4 28 8B C6 5E 59 C3 CC CC ........(..^Y...
00410B60 51 56 8B F1 8B 0E 83 46 04 01 85 C9 57 8B 7C 24 QV.....F....W.|$
00410B70 10 C7 44 24 08 00 00 00 00 89 0F 74 05 E8 4E 0F ..D$.......t..N.
00410B80 FF FF 8B 46 04 89 47 04 8B C7 5F 5E 59 C2 04 00 ...F..G..._^Y...
00410B90 6A FF 68 19 D7 82 00 64 A1 00 00 00 00 50 83 EC j.h....d.....P..
00410BA0 34 A1 88 41 A1 00 33 C4 89 44 24 30 53 55 56 57 4..A..3..D$0SUVW
00410BB0 A1 88 41 A1 00 33 C4 50 8D 44 24 48 64 A3 00 00 ..A..3.P.D$Hd...
00410BC0 00 00 8B 44 24 5C 8B 6C 24 58 8B F9 8B 4C 24 64 ...D$\.l$X...L$d
00410BD0 33 DB 89 44 24 18 89 4C 24 20 33 F6 89 5C 24 1C 3..D$..L$ 3..\$.
00410BE0 89 74 24 50 89 74 24 24 8D 4C 24 28 C6 44 24 50 .t$P.t$$.L$(.D$P
00410BF0 01 FF 15 B0 43 8A 00 6A 01 8D 54 24 2C 52 55 8D ....C..j..T$,RU.
00410C00 44 24 20 50 8B CF C6 44 24 60 02 E8 30 F3 FF FF D$ P...D$`..0...
00410C10 8B 00 85 C0 74 11 8B D8 85 DB 89 5C 24 1C 74 07 ....t......\$.t.
00410C20 8B CB E8 A9 0E FF FF 8B 4C 24 14 85 C9 C6 44 24 ........L$....D$
00410C30 50 02 74 19 8B F9 E8 A5 0E FF FF 83 F8 01 75 0D P.t...........u.
00410C40 85 FF 74 09 8B 17 50 8B 02 8B CF FF D0 85 DB 75 ..t...P........u
00410C50 14 8D 4C 24 28 C6 44 24 50 01 FF 15 38 43 8A 00 ..L$(.D$P...8C..
00410C60 E9 F6 00 00 00 8B 44 24 18 8B 68 04 3B 68 08 0F ......D$..h.;h..
00410C70 84 9C 00 00 00 8B 13 8B 52 14 8D 44 24 28 50 8D ........R..D$(P.
00410C80 4C 24 18 51 8B CB FF D2 8B 00 3B F0 C6 44 24 50 L$.Q......;..D$P
00410C90 04 74 2D 8B FE 8B F0 85 F6 89 74 24 24 74 07 8B .t-.......t$$t..
00410CA0 CE E8 2A 0E FF FF 85 FF 74 16 8B CF E8 2F 0E FF ..*.....t..../..
00410CB0 FF 83 F8 01 75 0A 8B 07 8B 10 6A 01 8B CF FF D2 ....u.....j.....
00410CC0 8B 4C 24 14 85 C9 C6 44 24 50 02 74 1A 8B F9 E8 .L$....D$P.t....
00410CD0 0C 0E FF FF 83 F8 01 75 0E 85 FF 74 0A 8B 07 8B .......u...t....
00410CE0 10 6A 01 8B CF FF D2 8B 4C 24 20 8B 06 8B 55 00 .j......L$ ...U.
00410CF0 8B 40 7C 51 52 8B CE C7 44 24 1C 00 00 00 00 FF .@|QR...D$......
00410D00 D0 8B 4C 24 18 83 C5 04 3B 69 08 0F 85 64 FF FF ..L$....;i...d..
00410D10 FF 8D 4C 24 28 C6 44 24 50 01 FF 15 38 43 8A 00 ..L$(.D$P...8C..
00410D20 85 F6 C6 44 24 50 00 74 15 8B CE E8 B0 0D FF FF ...D$P.t........
00410D30 83 F8 01 75 09 8B 16 50 8B 02 8B CE FF D0 8B CB ...u...P........
00410D40 C7 44 24 50 FF FF FF FF E8 93 0D FF FF 83 F8 01 .D$P............
00410D50 75 09 8B 13 50 8B 02 8B CB FF D0 8B 4C 24 48 64 u...P.......L$Hd
00410D60 89 0D 00 00 00 00 59 5F 5E 5D 5B 8B 4C 24 30 33 ......Y_^][.L$03
00410D70 CC E8 18 3E 28 00 83 C4 40 C2 10 00 CC CC CC CC ...>(...@.......
00410D80 6A FF 68 79 D7 82 00 64 A1 00 00 00 00 50 83 EC j.hy...d.....P..
00410D90 34 A1 88 41 A1 00 33 C4 89 44 24 30 53 55 56 57 4..A..3..D$0SUVW
00410DA0 A1 88 41 A1 00 33 C4 50 8D 44 24 48 64 A3 00 00 ..A..3.P.D$Hd...
00410DB0 00 00 8B 44 24 5C 8B 6C 24 58 8B F9 8B 4C 24 64 ...D$\.l$X...L$d
00410DC0 33 DB 89 44 24 18 89 4C 24 20 33 F6 89 5C 24 1C 3..D$..L$ 3..\$.
00410DD0 89 74 24 50 89 74 24 24 8D 4C 24 28 C6 44 24 50 .t$P.t$$.L$(.D$P
00410DE0 01 FF 15 B0 43 8A 00 6A 01 8D 54 24 2C 52 55 8D ....C..j..T$,RU.
00410DF0 44 24 20 50 8B CF C6 44 24 60 02 E8 40 F1 FF FF D$ P...D$`..@...
00410E00 8B 00 85 C0 74 11 8B D8 85 DB 89 5C 24 1C 74 07 ....t......\$.t.
00410E10 8B CB E8 B9 0C FF FF 8B 4C 24 14 85 C9 C6 44 24 ........L$....D$
00410E20 50 02 74 19 8B F9 E8 B5 0C FF FF 83 F8 01 75 0D P.t...........u.
00410E30 85 FF 74 09 8B 17 50 8B 02 8B CF FF D0 85 DB 75 ..t...P........u
00410E40 14 8D 4C 24 28 C6 44 24 50 01 FF 15 38 43 8A 00 ..L$(.D$P...8C..
00410E50 E9 FC 00 00 00 8B 44 24 18 8B 68 04 3B 68 08 0F ......D$..h.;h..
00410E60 84 A2 00 00 00 8B 13 8B 52 14 8D 44 24 28 50 8D ........R..D$(P.
00410E70 4C 24 18 51 8B CB FF D2 8B 00 3B F0 C6 44 24 50 L$.Q......;..D$P
00410E80 04 74 2D 8B FE 8B F0 85 F6 89 74 24 24 74 07 8B .t-.......t$$t..
00410E90 CE E8 3A 0C FF FF 85 FF 74 16 8B CF E8 3F 0C FF ..:.....t....?..
00410EA0 FF 83 F8 01 75 0A 8B 07 8B 10 6A 01 8B CF FF D2 ....u.....j.....
00410EB0 8B 4C 24 14 85 C9 C6 44 24 50 02 74 1A 8B F9 E8 .L$....D$P.t....
00410EC0 1C 0C FF FF 83 F8 01 75 0E 85 FF 74 0A 8B 07 8B .......u...t....
00410ED0 10 6A 01 8B CF FF D2 8B 4C 24 20 D9 45 00 8B 06 .j......L$ .E...
00410EE0 8B 90 84 00 00 00 51 51 8B CE D9 1C 24 C7 44 24 ......QQ....$.D$
00410EF0 1C 00 00 00 00 FF D2 8B 44 24 18 83 C5 04 3B 68 ........D$....;h
00410F00 08 0F 85 5E FF FF FF 8D 4C 24 28 C6 44 24 50 01 ...^....L$(.D$P.
00410F10 FF 15 38 43 8A 00 85 F6 C6 44 24 50 00 74 15 8B ..8C.....D$P.t..
00410F20 CE E8 BA 0B FF FF 83 F8 01 75 09 8B 16 50 8B 02 .........u...P..
00410F30 8B CE FF D0 8B CB C7 44 24 50 FF FF FF FF E8 9D .......D$P......
00410F40 0B FF FF 83 F8 01 75 09 8B 13 50 8B 02 8B CB FF ......u...P.....
00410F50 D0 8B 4C 24 48 64 89 0D 00 00 00 00 59 5F 5E 5D ..L$Hd......Y_^]
00410F60 5B 8B 4C 24 30 33 CC E8 22 3C 28 00 83 C4 40 C2 [.L$03.."<(...@.
00410F70 10 00 CC CC CC CC CC CC CC CC CC CC CC CC CC CC ................
00410F80 6A FF 68 D9 D7 82 00 64 A1 00 00 00 00 50 83 EC j.h....d.....P..
00410F90 30 A1 88 41 A1 00 33 C4 89 44 24 2C 53 55 56 57 0..A..3..D$,SUVW
00410FA0 A1 88 41 A1 00 33 C4 50 8D 44 24 44 64 A3 00 00 ..A..3.P.D$Dd...
00410FB0 00 00 8B 44 24 58 8B 6C 24 54 33 DB 8B F9 89 44 ...D$X.l$T3....D
00410FC0 24 18 33 F6 89 5C 24 1C 89 74 24 4C 89 74 24 20 $.3..\$..t$L.t$ 
00410FD0 8D 4C 24 24 C6 44 24 4C 01 FF 15 B0 43 8A 00 6A .L$$.D$L....C..j
00410FE0 01 8D 4C 24 28 51 55 8D 54 24 20 52 8B CF C6 44 ..L$(QU.T$ R...D
00410FF0 24 5C 02 E8 48 EF FF FF 8B 00 85 C0 74 11 8B D8 $\..H.......t...
00411000 85 DB 89 5C 24 1C 74 07 8B CB E8 C1 0A FF FF 8B ...\$.t.........
00411010 4C 24 14 85 C9 C6 44 24 4C 02 74 1A 8B F9 E8 BD L$....D$L.t.....
00411020 0A FF FF 83 F8 01 75 0E 85 FF 74 0A 8B 07 8B 10 ......u...t.....
00411030 6A 01 8B CF FF D2 85 DB 75 14 8D 4C 24 24 C6 44 j.......u..L$$.D
00411040 24 4C 01 FF 15 38 43 8A 00 E9 F1 00 00 00 8B 44 $L...8C........D
00411050 24 18 8B 68 04 3B 68 08 0F 84 97 00 00 00 8B FF $..h.;h.........
00411060 8B 03 8B 40 14 8D 4C 24 24 51 8D 54 24 18 52 8B ...@..L$$Q.T$.R.
00411070 CB FF D0 8B 00 3B F0 C6 44 24 4C 04 74 2C 8B FE .....;..D$L.t,..
00411080 8B F0 85 F6 89 74 24 20 74 07 8B CE E8 3F 0A FF .....t$ t....?..
00411090 FF 85 FF 74 15 8B CF E8 44 0A FF FF 83 F8 01 75 ...t....D......u
004110A0 09 8B 17 50 8B 02 8B CF FF D0 8B 4C 24 14 85 C9 ...P.......L$...
004110B0 C6 44 24 4C 02 74 19 8B F9 E8 22 0A FF FF 83 F8 .D$L.t....".....
004110C0 01 75 0D 85 FF 74 09 8B 17 50 8B 02 8B CF FF D0 .u...t...P......
004110D0 8B 16 8B 82 8C 00 00 00 55 8B CE C7 44 24 18 00 ........U...D$..
004110E0 00 00 00 FF D0 8B 4C 24 18 83 C5 1C 3B 69 08 0F ......L$....;i..
004110F0 85 6B FF FF FF 8D 4C 24 24 C6 44 24 4C 01 FF 15 .k....L$$.D$L...
00411100 38 43 8A 00 85 F6 C6 44 24 4C 00 74 15 8B CE E8 8C.....D$L.t....
00411110 CC 09 FF FF 83 F8 01 75 09 8B 16 50 8B 02 8B CE .......u...P....
00411120 FF D0 8B CB C7 44 24 4C FF FF FF FF E8 AF 09 FF .....D$L........
00411130 FF 83 F8 01 75 09 8B 13 50 8B 02 8B CB FF D0 8B ....u...P.......
00411140 4C 24 44 64 89 0D 00 00 00 00 59 5F 5E 5D 5B 8B L$Dd......Y_^][.
00411150 4C 24 2C 33 CC E8 34 3A 28 00 83 C4 3C C2 0C 00 L$,3..4:(...<...
00411160 6A FF 68 39 D8 82 00 64 A1 00 00 00 00 50 83 EC j.h9...d.....P..
00411170 30 A1 88 41 A1 00 33 C4 89 44 24 2C 53 55 56 57 0..A..3..D$,SUVW
00411180 A1 88 41 A1 00 33 C4 50 8D 44 24 44 64 A3 00 00 ..A..3.P.D$Dd...
00411190 00 00 8B 44 24 58 8B 6C 24 54 33 DB 8B F9 89 44 ...D$X.l$T3....D
004111A0 24 18 33 F6 89 5C 24 1C 89 74 24 4C 89 74 24 20 $.3..\$..t$L.t$ 
004111B0 8D 4C 24 24 C6 44 24 4C 01 FF 15 B0 43 8A 00 6A .L$$.D$L....C..j
004111C0 01 8D 4C 24 28 51 55 8D 54 24 20 52 8B CF C6 44 ..L$(QU.T$ R...D
004111D0 24 5C 02 E8 68 ED FF FF 8B 00 85 C0 74 11 8B D8 $\..h.......t...
004111E0 85 DB 89 5C 24 1C 74 07 8B CB E8 E1 08 FF FF 8B ...\$.t.........
004111F0 4C 24 14 85 C9 C6 44 24 4C 02 74 1A 8B F9 E8 DD L$....D$L.t.....
00411200 08 FF FF 83 F8 01 75 0E 85 FF 74 0A 8B 07 8B 10 ......u...t.....
00411210 6A 01 8B CF FF D2 85 DB 75 14 8D 4C 24 24 C6 44 j.......u..L$$.D
00411220 24 4C 01 FF 15 38 43 8A 00 E9 F1 00 00 00 8B 44 $L...8C........D
00411230 24 18 8B 68 04 3B 68 08 0F 84 97 00 00 00 8B FF $..h.;h.........
00411240 8B 03 8B 40 14 8D 4C 24 24 51 8D 54 24 18 52 8B ...@..L$$Q.T$.R.
00411250 CB FF D0 8B 00 3B F0 C6 44 24 4C 04 74 2C 8B FE .....;..D$L.t,..
00411260 8B F0 85 F6 89 74 24 20 74 07 8B CE E8 5F 08 FF .....t$ t...._..
00411270 FF 85 FF 74 15 8B CF E8 64 08 FF FF 83 F8 01 75 ...t....d......u
00411280 09 8B 17 50 8B 02 8B CF FF D0 8B 4C 24 14 85 C9 ...P.......L$...
00411290 C6 44 24 4C 02 74 19 8B F9 E8 42 08 FF FF 83 F8 .D$L.t....B.....
004112A0 01 75 0D 85 FF 74 09 8B 17 50 8B 02 8B CF FF D0 .u...t...P......
004112B0 8B 16 8B 82 90 00 00 00 55 8B CE C7 44 24 18 00 ........U...D$..
004112C0 00 00 00 FF D0 8B 4C 24 18 83 C5 1C 3B 69 08 0F ......L$....;i..
004112D0 85 6B FF FF FF 8D 4C 24 24 C6 44 24 4C 01 FF 15 .k....L$$.D$L...
004112E0 38 43 8A 00 85 F6 C6 44 24 4C 00 74 15 8B CE E8 8C.....D$L.t....
004112F0 EC 07 FF FF 83 F8 01 75 09 8B 16 50 8B 02 8B CE .......u...P....
00411300 FF D0 8B CB C7 44 24 4C FF FF FF FF E8 CF 07 FF .....D$L........
00411310 FF 83 F8 01 75 09 8B 13 50 8B 02 8B CB FF D0 8B ....u...P.......
00411320 4C 24 44 64 89 0D 00 00 00 00 59 5F 5E 5D 5B 8B L$Dd......Y_^][.
00411330 4C 24 2C 33 CC E8 54 38 28 00 83 C4 3C C2 0C 00 L$,3..T8(...<...
00411340 6A FF 68 99 D8 82 00 64 A1 00 00 00 00 50 83 EC j.h....d.....P..
00411350 34 A1 88 41 A1 00 33 C4 89 44 24 30 53 55 56 57 4..A..3..D$0SUVW
00411360 A1 88 41 A1 00 33 C4 50 8D 44 24 48 64 A3 00 00 ..A..3.P.D$Hd...
00411370 00 00 8B 44 24 5C 8B 6C 24 58 8B F9 8B 4C 24 64 ...D$\.l$X...L$d
00411380 33 DB 89 44 24 18 89 4C 24 20 33 F6 89 5C 24 1C 3..D$..L$ 3..\$.
00411390 89 74 24 50 89 74 24 24 8D 4C 24 28 C6 44 24 50 .t$P.t$$.L$(.D$P
004113A0 01 FF 15 B0 43 8A 00 6A 01 8D 54 24 2C 52 55 8D ....C..j..T$,RU.
004113B0 44 24 20 50 8B CF C6 44 24 60 02 E8 80 EB FF FF D$ P...D$`......
004113C0 8B 00 85 C0 74 11 8B D8 85 DB 89 5C 24 1C 74 07 ....t......\$.t.
004113D0 8B CB E8 F9 06 FF FF 8B 4C 24 14 85 C9 C6 44 24 ........L$....D$
004113E0 50 02 74 19 8B F9 E8 F5 06 FF FF 83 F8 01 75 0D P.t...........u.
004113F0 85 FF 74 09 8B 17 50 8B 02 8B CF FF D0 85 DB 75 ..t...P........u
00411400 14 8D 4C 24 28 C6 44 24 50 01 FF 15 38 43 8A 00 ..L$(.D$P...8C..
00411410 E9 F6 00 00 00 8B 44 24 18 8B 68 04 3B 68 08 0F ......D$..h.;h..
00411420 84 9C 00 00 00 8B 13 8B 52 14 8D 44 24 28 50 8D ........R..D$(P.
00411430 4C 24 18 51 8B CB FF D2 8B 00 3B F0 C6 44 24 50 L$.Q......;..D$P
00411440 04 74 2D 8B FE 8B F0 85 F6 89 74 24 24 74 07 8B .t-.......t$$t..
00411450 CE E8 7A 06 FF FF 85 FF 74 16 8B CF E8 7F 06 FF ..z.....t.......
00411460 FF 83 F8 01 75 0A 8B 07 8B 10 6A 01 8B CF FF D2 ....u.....j.....
00411470 8B 4C 24 14 85 C9 C6 44 24 50 02 74 1A 8B F9 E8 .L$....D$P.t....
00411480 5C 06 FF FF 83 F8 01 75 0E 85 FF 74 0A 8B 07 8B \......u...t....
00411490 10 6A 01 8B CF FF D2 8B 4C 24 20 8B 06 8B 90 94 .j......L$ .....
004114A0 00 00 00 51 55 8B CE C7 44 24 1C 00 00 00 00 FF ...QU...D$......
004114B0 D2 8B 44 24 18 83 C5 08 3B 68 08 0F 85 64 FF FF ..D$....;h...d..
004114C0 FF 8D 4C 24 28 C6 44 24 50 01 FF 15 38 43 8A 00 ..L$(.D$P...8C..
004114D0 85 F6 C6 44 24 50 00 74 15 8B CE E8 00 06 FF FF ...D$P.t........
004114E0 83 F8 01 75 09 8B 16 50 8B 02 8B CE FF D0 8B CB ...u...P........
004114F0 C7 44 24 50 FF FF FF FF E8 E3 05 FF FF 83 F8 01 .D$P............
00411500 75 09 8B 13 50 8B 02 8B CB FF D0 8B 4C 24 48 64 u...P.......L$Hd
00411510 89 0D 00 00 00 00 59 5F 5E 5D 5B 8B 4C 24 30 33 ......Y_^][.L$03
00411520 CC E8 68 36 28 00 83 C4 40 C2 10 00 CC CC CC CC ..h6(...@.......
00411530 6A FF 68 F9 D8 82 00 64 A1 00 00 00 00 50 83 EC j.h....d.....P..
00411540 34 A1 88 41 A1 00 33 C4 89 44 24 30 53 55 56 57 4..A..3..D$0SUVW
00411550 A1 88 41 A1 00 33 C4 50 8D 44 24 48 64 A3 00 00 ..A..3.P.D$Hd...
00411560 00 00 8B 44 24 5C 8B 6C 24 58 8B F9 8B 4C 24 64 ...D$\.l$X...L$d
00411570 33 DB 89 44 24 18 89 4C 24 20 33 F6 89 5C 24 1C 3..D$..L$ 3..\$.
00411580 89 74 24 50 89 74 24 24 8D 4C 24 28 C6 44 24 50 .t$P.t$$.L$(.D$P
00411590 01 FF 15 B0 43 8A 00 6A 01 8D 54 24 2C 52 55 8D ....C..j..T$,RU.
004115A0 44 24 20 50 8B CF C6 44 24 60 02 E8 90 E9 FF FF D$ P...D$`......
004115B0 8B 00 85 C0 74 11 8B D8 85 DB 89 5C 24 1C 74 07 ....t......\$.t.
004115C0 8B CB E8 09 05 FF FF 8B 4C 24 14 85 C9 C6 44 24 ........L$....D$
004115D0 50 02 74 19 8B F9 E8 05 05 FF FF 83 F8 01 75 0D P.t...........u.
004115E0 85 FF 74 09 8B 17 50 8B 02 8B CF FF D0 85 DB 75 ..t...P........u
004115F0 14 8D 4C 24 28 C6 44 24 50 01 FF 15 38 43 8A 00 ..L$(.D$P...8C..
00411600 E9 F6 00 00 00 8B 44 24 18 8B 68 04 3B 68 08 0F ......D$..h.;h..
00411610 84 9C 00 00 00 8B 13 8B 52 14 8D 44 24 28 50 8D ........R..D$(P.
00411620 4C 24 18 51 8B CB FF D2 8B 00 3B F0 C6 44 24 50 L$.Q......;..D$P
00411630 04 74 2D 8B FE 8B F0 85 F6 89 74 24 24 74 07 8B .t-.......t$$t..
00411640 CE E8 8A 04 FF FF 85 FF 74 16 8B CF E8 8F 04 FF ........t.......
00411650 FF 83 F8 01 75 0A 8B 07 8B 10 6A 01 8B CF FF D2 ....u.....j.....
00411660 8B 4C 24 14 85 C9 C6 44 24 50 02 74 1A 8B F9 E8 .L$....D$P.t....
00411670 6C 04 FF FF 83 F8 01 75 0E 85 FF 74 0A 8B 07 8B l......u...t....
00411680 10 6A 01 8B CF FF D2 8B 4C 24 20 8B 06 8B 90 98 .j......L$ .....
00411690 00 00 00 51 55 8B CE C7 44 24 1C 00 00 00 00 FF ...QU...D$......
004116A0 D2 8B 44 24 18 83 C5 0C 3B 68 08 0F 85 64 FF FF ..D$....;h...d..
004116B0 FF 8D 4C 24 28 C6 44 24 50 01 FF 15 38 43 8A 00 ..L$(.D$P...8C..
004116C0 85 F6 C6 44 24 50 00 74 15 8B CE E8 10 04 FF FF ...D$P.t........
004116D0 83 F8 01 75 09 8B 16 50 8B 02 8B CE FF D0 8B CB ...u...P........
004116E0 C7 44 24 50 FF FF FF FF E8 F3 03 FF FF 83 F8 01 .D$P............
004116F0 75 09 8B 13 50 8B 02 8B CB FF D0 8B 4C 24 48 64 u...P.......L$Hd
00411700 89 0D 00 00 00 00 59 5F 5E 5D 5B 8B 4C 24 30 33 ......Y_^][.L$03
00411710 CC E8 78 34 28 00 83 C4 40 C2 10 00 CC CC CC CC ..x4(...@.......
00411720 6A FF 68 59 D9 82 00 64 A1 00 00 00 00 50 83 EC j.hY...d.....P..
00411730 34 A1 88 41 A1 00 33 C4 89 44 24 30 53 55 56 57 4..A..3..D$0SUVW
00411740 A1 88 41 A1 00 33 C4 50 8D 44 24 48 64 A3 00 00 ..A..3.P.D$Hd...
00411750 00 00 8B 44 24 5C 8B 6C 24 58 8B F9 8B 4C 24 64 ...D$\.l$X...L$d
00411760 33 DB 89 44 24 18 89 4C 24 20 33 F6 89 5C 24 1C 3..D$..L$ 3..\$.
00411770 89 74 24 50 89 74 24 24 8D 4C 24 28 C6 44 24 50 .t$P.t$$.L$(.D$P
00411780 01 FF 15 B0 43 8A 00 6A 01 8D 54 24 2C 52 55 8D ....C..j..T$,RU.
00411790 44 24 20 50 8B CF C6 44 24 60 02 E8 A0 E7 FF FF D$ P...D$`......
004117A0 8B 00 85 C0 74 11 8B D8 85 DB 89 5C 24 1C 74 07 ....t......\$.t.
004117B0 8B CB E8 19 03 FF FF 8B 4C 24 14 85 C9 C6 44 24 ........L$....D$
004117C0 50 02 74 19 8B F9 E8 15 03 FF FF 83 F8 01 75 0D P.t...........u.
004117D0 85 FF 74 09 8B 17 50 8B 02 8B CF FF D0 85 DB 75 ..t...P........u
004117E0 14 8D 4C 24 28 C6 44 24 50 01 FF 15 38 43 8A 00 ..L$(.D$P...8C..
004117F0 E9 F6 00 00 00 8B 44 24 18 8B 68 04 3B 68 08 0F ......D$..h.;h..
00411800 84 9C 00 00 00 8B 13 8B 52 14 8D 44 24 28 50 8D ........R..D$(P.
00411810 4C 24 18 51 8B CB FF D2 8B 00 3B F0 C6 44 24 50 L$.Q......;..D$P
00411820 04 74 2D 8B FE 8B F0 85 F6 89 74 24 24 74 07 8B .t-.......t$$t..
00411830 CE E8 9A 02 FF FF 85 FF 74 16 8B CF E8 9F 02 FF ........t.......
00411840 FF 83 F8 01 75 0A 8B 07 8B 10 6A 01 8B CF FF D2 ....u.....j.....
00411850 8B 4C 24 14 85 C9 C6 44 24 50 02 74 1A 8B F9 E8 .L$....D$P.t....
00411860 7C 02 FF FF 83 F8 01 75 0E 85 FF 74 0A 8B 07 8B |......u...t....
00411870 10 6A 01 8B CF FF D2 8B 4C 24 20 8B 06 8B 90 9C .j......L$ .....
00411880 00 00 00 51 55 8B CE C7 44 24 1C 00 00 00 00 FF ...QU...D$......
00411890 D2 8B 44 24 18 83 C5 10 3B 68 08 0F 85 64 FF FF ..D$....;h...d..
004118A0 FF 8D 4C 24 28 C6 44 24 50 01 FF 15 38 43 8A 00 ..L$(.D$P...8C..
004118B0 85 F6 C6 44 24 50 00 74 15 8B CE E8 20 02 FF FF ...D$P.t.... ...
004118C0 83 F8 01 75 09 8B 16 50 8B 02 8B CE FF D0 8B CB ...u...P........
004118D0 C7 44 24 50 FF FF FF FF E8 03 02 FF FF 83 F8 01 .D$P............
004118E0 75 09 8B 13 50 8B 02 8B CB FF D0 8B 4C 24 48 64 u...P.......L$Hd
004118F0 89 0D 00 00 00 00 59 5F 5E 5D 5B 8B 4C 24 30 33 ......Y_^][.L$03
00411900 CC E8 88 32 28 00 83 C4 40 C2 10 00 CC CC CC CC ...2(...@.......
