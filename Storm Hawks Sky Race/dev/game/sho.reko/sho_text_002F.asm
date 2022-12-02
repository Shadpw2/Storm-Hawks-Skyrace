;;; Segment .text (00401000)

;; fn006F1A70: 006F1A70
;;   Called from:
;;     006D9ED9 (in fn006D9ED0)
;;     006DF782 (in fn006DF760)
;;     006DF827 (in fn006DF800)
;;     006F6E0E (in fn006F6D50)
;;     006F6EE4 (in fn006F6EA0)
;;     006F6F07 (in fn006F6EA0)
;;     006F9133 (in fn006F9120)
;;     006F914E (in fn006F9120)
;;     006FE427 (in fn006FE400)
;;     007250C7 (in fn00725010)
;;     00729D49 (in fn00729D20)
;;     0072A5EF (in fn0072A5D0)
;;     0072C5DC (in fn0072C510)
;;     0072C619 (in fn0072C510)
;;     0072DD78 (in fn0072DD60)
;;     0072DD9D (in fn0072DD60)
;;     0072E7A3 (in fn0072E790)
;;     0073B812 (in fn0073B810)
;;     0073C1A4 (in fn0073C100)
;;     0073C2A2 (in fn0073C280)
;;     0073C308 (in fn0073C280)
;;     0073C600 (in fn0073C520)
;;     0073C931 (in fn0073C870)
;;     0073C95C (in fn0073C870)
;;     0073C9A7 (in fn0073C870)
;;     0073C9D9 (in fn0073C870)
;;     0073CD9C (in fn0073CAE0)
;;     0073CE53 (in fn0073CE00)
;;     0073E086 (in fn0073E050)
;;     0073E3FB (in fn0073E390)
;;     0073FB7B (in fn0073FAF0)
;;     0073FE30 (in fn0073FC30)
;;     0073FE94 (in fn0073FC30)
;;     0073FEC9 (in fn0073FC30)
;;     007400BB (in fn00740060)
;;     007480FB (in fn00748090)
;;     0074834C (in fn00748310)
;;     007488B4 (in fn00748810)
;;     0074891E (in fn00748810)
;;     00748D60 (in fn00748D30)
;;     00749849 (in fn00749820)
;;     00752CBC (in fn00752CA0)
fn006F1A70 proc
	push	ecx
	mov	eax,[esp+8h]
	push	eax
	call	6ECAC0h
	add	esp,4h
	test	eax,eax
	mov	[esp],eax
	jnz	6F1A87h

l006F1A85:
	pop	ecx
	ret

l006F1A87:
	lea	ecx,[esp]
	push	ecx
	call	6EC890h
	mov	eax,[esp+4h]
	add	esp,4h
	pop	ecx
	ret
006F1A99                            CC CC CC CC CC CC CC          .......

;; fn006F1AA0: 006F1AA0
;;   Called from:
;;     006E15DB (in fn006E15D0)
;;     006F207A (in fn006F2070)
fn006F1AA0 proc
	sub	esp,10h
	push	ebx
	push	ebp
	push	esi
	mov	esi,[esp+20h]
	push	edi
	xor	edi,edi
	cmp	byte ptr [esi],0h
	jz	6F1B65h

l006F1AB6:
	mov	ebp,[esp+28h]
	add	ebp,0FCh
	lea	ecx,[ecx+0h]

l006F1AC0:
	cmp	byte ptr [esi],25h
	jnz	6F1B1Ah

l006F1AC5:
	mov	ebx,esi

l006F1AC7:
	mov	al,[esi+1h]
	add	esi,1h
	test	al,al
	jz	6F1AE6h

l006F1AD1:
	cmp	al,25h
	jz	6F1AE6h

l006F1AD5:
	movzx	eax,al
	push	eax
	call	dword ptr [8A46C8h]
	add	esp,4h
	test	eax,eax
	jz	6F1AC7h

l006F1AE6:
	mov	al,[esi]
	cmp	al,6Ch
	jz	6F1AF0h

l006F1AEC:
	cmp	al,7Ah
	jnz	6F1AFEh

l006F1AF0:
	mov	al,[esi+1h]
	cmp	al,64h
	jz	6F1AFBh

l006F1AF7:
	cmp	al,75h
	jnz	6F1AFEh

l006F1AFB:
	add	esi,1h

l006F1AFE:
	movsx	eax,byte ptr [esi]
	add	eax,0DBh
	cmp	eax,53h
	ja	6F1B4Fh

l006F1B09:
	movzx	ecx,byte ptr [eax+6F1F9Ch]
	jmp	dword ptr [6F1F84h+ecx*4]

l006F1B17:
	add	ebp,4h

l006F1B1A:
	add	edi,1h

l006F1B1D:
	add	esi,1h
	cmp	byte ptr [esi],0h
	jnz	6F1AC0h

l006F1B25:
	jmp	6F1B61h

l006F1B27:
	add	ebp,4h
	add	edi,14h
	jmp	6F1B1Dh

l006F1B2F:
	mov	eax,[ebp+4h]
	add	ebp,4h
	lea	edx,[eax+1h]

l006F1B38:
	mov	cl,[eax]
	add	eax,1h
	test	cl,cl
	jnz	6F1B38h

l006F1B41:
	sub	eax,edx
	add	edi,eax
	jmp	6F1B1Dh

l006F1B47:
	add	ebp,4h
	add	edi,13h
	jmp	6F1B1Dh

l006F1B4F:
	mov	eax,ebx
	lea	edx,[eax+1h]

l006F1B54:
	mov	cl,[eax]
	add	eax,1h
	test	cl,cl
	jnz	6F1B54h

l006F1B5D:
	sub	eax,edx
	add	edi,eax

l006F1B61:
	test	edi,edi
	jnz	6F1B79h

l006F1B65:
	mov	eax,[0A6C63Ch]
	test	eax,eax
	jz	6F1B79h

l006F1B6E:
	add	dword ptr [eax],1h
	mov	edi,eax
	mov	[esp+10h],edi
	jmp	6F1BE0h

l006F1B79:
	lea	edx,[edi+18h]
	push	edx
	call	723860h
	add	esp,4h
	test	eax,eax
	jnz	6F1B96h

l006F1B89:
	call	6E1210h
	mov	edi,eax
	mov	[esp+10h],edi
	jmp	6F1BE0h

l006F1B96:
	test	edi,edi
	mov	[eax+8h],edi
	mov	dword ptr [eax+4h],0A1B450h
	mov	dword ptr [eax],1h
	mov	dword ptr [eax+0Ch],0FFFFFFFFh
	mov	dword ptr [eax+10h],0h
	mov	byte ptr [eax+edi+14h],0h
	jnz	6F1BDAh

l006F1BBD:
	mov	[esp+10h],eax
	lea	eax,[esp+10h]
	push	eax
	call	6EC890h
	mov	eax,[esp+14h]
	add	esp,4h
	add	dword ptr [eax],1h
	mov	[0A6C63Ch],eax

l006F1BDA:
	mov	edi,eax
	mov	[esp+10h],eax

l006F1BE0:
	test	edi,edi
	mov	[esp+14h],edi
	jnz	6F1BF2h

l006F1BE8:
	pop	edi
	pop	esi
	pop	ebp
	xor	eax,eax
	pop	ebx
	add	esp,10h
	ret

l006F1BF2:
	mov	eax,[edi+4h]
	cmp	eax,0A1B450h
	jz	6F1C2Fh

l006F1BFC:
	push	0A1B450h
	push	eax
	call	6D5670h
	add	esp,8h
	test	eax,eax
	jnz	6F1C2Fh

l006F1C0E:
	lea	ecx,[esp+1Ch]
	push	ecx
	lea	edx,[esp+1Ch]
	push	edx
	push	edi
	call	6EA420h
	add	esp,0Ch
	mov	esi,eax
	neg	esi
	sbb	esi,esi
	not	esi
	and	esi,[esp+18h]
	jmp	6F1C32h

l006F1C2F:
	lea	esi,[edi+14h]

l006F1C32:
	mov	ebp,[esp+24h]
	cmp	byte ptr [ebp+0h],0h
	jz	6F1F62h

l006F1C40:
	mov	ebx,[esp+28h]
	add	ebx,0FCh
	jmp	6F1C50h
006F1C49                            8D A4 24 00 00 00 00          ..$....

l006F1C50:
	mov	al,[ebp+0h]
	cmp	al,25h
	jnz	6F1F24h

l006F1C5B:
	movzx	eax,byte ptr [ebp+1h]
	mov	[esp+18h],ebp
	add	ebp,1h
	xor	edi,edi
	push	eax
	mov	[esp+28h],edi
	mov	[esp+2Ch],edi
	call	dword ptr [8A4700h]
	add	esp,4h
	test	eax,eax
	jz	6F1CA0h

l006F1C7E:
	mov	edi,edi

l006F1C80:
	movsx	edx,byte ptr [ebp+0h]
	movzx	eax,byte ptr [ebp+1h]
	add	ebp,1h
	lea	ecx,[edi+edi*4]
	push	eax
	lea	edi,[edx+ecx*2-30h]
	call	dword ptr [8A4700h]
	add	esp,4h
	test	eax,eax
	jnz	6F1C80h

l006F1CA0:
	cmp	byte ptr [ebp+0h],2Eh
	jnz	6F1CE0h

l006F1CA6:
	movzx	ecx,byte ptr [ebp+1h]
	add	ebp,1h
	push	ecx
	xor	edi,edi
	call	dword ptr [8A4700h]
	add	esp,4h
	test	eax,eax
	jz	6F1CE0h

l006F1CBD:
	lea	ecx,[ecx+0h]

l006F1CC0:
	movsx	eax,byte ptr [ebp+0h]
	movzx	ecx,byte ptr [ebp+1h]
	add	ebp,1h
	lea	edx,[edi+edi*4]
	push	ecx
	lea	edi,[eax+edx*2-30h]
	call	dword ptr [8A4700h]
	add	esp,4h
	test	eax,eax
	jnz	6F1CC0h

l006F1CE0:
	mov	al,[ebp+0h]
	test	al,al
	jz	6F1D06h

l006F1CE7:
	cmp	al,25h
	jz	6F1D06h

l006F1CEB:
	movzx	edx,al
	push	edx
	call	dword ptr [8A46C8h]
	add	esp,4h
	test	eax,eax
	jnz	6F1D06h

l006F1CFC:
	mov	al,[ebp+1h]
	add	ebp,1h
	test	al,al
	jnz	6F1CE7h

l006F1D06:
	cmp	byte ptr [ebp+0h],6Ch
	jnz	6F1D21h

l006F1D0C:
	mov	al,[ebp+1h]
	cmp	al,64h
	jz	6F1D17h

l006F1D13:
	cmp	al,75h
	jnz	6F1D21h

l006F1D17:
	mov	edx,1h
	add	ebp,1h
	jmp	6F1D25h

l006F1D21:
	mov	edx,[esp+24h]

l006F1D25:
	cmp	byte ptr [ebp+0h],7Ah
	jnz	6F1D40h

l006F1D2B:
	mov	al,[ebp+1h]
	cmp	al,64h
	jz	6F1D36h

l006F1D32:
	cmp	al,75h
	jnz	6F1D40h

l006F1D36:
	mov	ecx,1h
	add	ebp,1h
	jmp	6F1D44h

l006F1D40:
	mov	ecx,[esp+28h]

l006F1D44:
	movsx	eax,byte ptr [ebp+0h]
	add	eax,0DBh
	cmp	eax,53h
	ja	6F1F38h

l006F1D54:
	movzx	eax,byte ptr [eax+6F2014h]
	jmp	dword ptr [6F1FF0h+eax*4]

l006F1D62:
	mov	cl,[ebx+4h]
	add	ebx,4h
	mov	[esi],cl
	jmp	6F1F26h

l006F1D6F:
	add	ebx,4h
	test	edx,edx
	jz	6F1D80h

l006F1D76:
	mov	edx,[ebx]
	push	edx
	push	8D4FB4h
	jmp	6F1D91h

l006F1D80:
	test	ecx,ecx
	jz	6F1D89h

l006F1D84:
	mov	eax,[ebx]
	push	eax
	jmp	6F1D8Ch

l006F1D89:
	mov	ecx,[ebx]
	push	ecx

l006F1D8C:
	push	8A8F48h

l006F1D91:
	push	esi
	call	dword ptr [8A4650h]
	mov	eax,esi
	add	esp,0Ch
	lea	edx,[eax+1h]

l006F1DA0:
	mov	cl,[eax]
	add	eax,1h
	test	cl,cl
	jnz	6F1DA0h

l006F1DA9:
	sub	eax,edx
	add	esi,eax
	jmp	6F1F29h

l006F1DB2:
	add	ebx,4h
	test	edx,edx
	jz	6F1DC3h

l006F1DB9:
	mov	edx,[ebx]
	push	edx
	push	8D4FB0h
	jmp	6F1DD4h

l006F1DC3:
	test	ecx,ecx
	jz	6F1DCCh

l006F1DC7:
	mov	eax,[ebx]
	push	eax
	jmp	6F1DCFh

l006F1DCC:
	mov	ecx,[ebx]
	push	ecx

l006F1DCF:
	push	8D4FACh

l006F1DD4:
	push	esi
	call	dword ptr [8A4650h]
	mov	eax,esi
	add	esp,0Ch
	lea	edx,[eax+1h]

l006F1DE3:
	mov	cl,[eax]
	add	eax,1h
	test	cl,cl
	jnz	6F1DE3h

l006F1DEC:
	sub	eax,edx
	add	esi,eax
	jmp	6F1F29h

l006F1DF5:
	mov	edx,[ebx+4h]
	add	ebx,4h
	push	edx
	push	8D4FA8h
	push	esi
	call	dword ptr [8A4650h]
	mov	eax,esi
	add	esp,0Ch
	lea	edx,[eax+1h]

l006F1E10:
	mov	cl,[eax]
	add	eax,1h
	test	cl,cl
	jnz	6F1E10h

l006F1E19:
	sub	eax,edx
	add	esi,eax
	jmp	6F1F29h

l006F1E22:
	mov	eax,[ebx+4h]
	add	ebx,4h
	push	eax
	push	8A8538h
	push	esi
	call	dword ptr [8A4650h]
	mov	eax,esi
	add	esp,0Ch
	lea	edx,[eax+1h]
	lea	ecx,[ecx+0h]

l006F1E40:
	mov	cl,[eax]
	add	eax,1h
	test	cl,cl
	jnz	6F1E40h

l006F1E49:
	sub	eax,edx
	add	esi,eax
	jmp	6F1F29h

l006F1E52:
	mov	ecx,[ebx+4h]
	add	ebx,4h
	mov	eax,ecx
	mov	[esp+24h],ebx
	lea	ebx,[eax+1h]

l006F1E61:
	mov	dl,[eax]
	add	eax,1h
	test	dl,dl
	jnz	6F1E61h

l006F1E6A:
	sub	eax,ebx
	test	edi,edi
	mov	ebx,eax
	jle	6F1E78h

l006F1E72:
	cmp	ebx,edi
	jle	6F1E78h

l006F1E76:
	mov	ebx,edi

l006F1E78:
	cmp	ebx,10h
	jc	6F1E93h

l006F1E7D:
	push	ebx
	push	ecx
	push	esi
	call	695030h
	add	esp,0Ch
	add	esi,ebx
	mov	ebx,[esp+24h]
	jmp	6F1F29h

l006F1E93:
	test	ebx,ebx
	jbe	6F1EADh

l006F1E97:
	mov	eax,esi
	sub	ecx,esi
	mov	edi,ebx
	lea	ecx,[ecx+0h]

l006F1EA0:
	mov	dl,[ecx+eax]
	mov	[eax],dl
	add	eax,1h
	sub	edi,1h
	jnz	6F1EA0h

l006F1EAD:
	add	esi,ebx
	mov	ebx,[esp+24h]
	jmp	6F1F29h

l006F1EB8:
	mov	eax,[ebx+4h]
	add	ebx,4h
	push	eax
	push	8D4FA4h
	push	esi
	call	dword ptr [8A4650h]
	mov	al,[esi+1h]
	add	esp,0Ch
	cmp	al,58h
	jz	6F1F00h

l006F1ED5:
	cmp	al,78h
	jz	6F1F04h

l006F1ED9:
	mov	eax,esi
	lea	edx,[eax+1h]
	mov	edi,edi

l006F1EE0:
	mov	cl,[eax]
	add	eax,1h
	test	cl,cl
	jnz	6F1EE0h

l006F1EE9:
	sub	eax,edx
	add	eax,1h
	push	eax
	lea	ecx,[esi+2h]
	push	esi
	push	ecx
	call	dword ptr [8A4590h]
	add	esp,0Ch
	mov	byte ptr [esi],30h

l006F1F00:
	mov	byte ptr [esi+1h],78h

l006F1F04:
	mov	eax,esi
	lea	edx,[eax+1h]
	lea	esp,[esp+0h]

l006F1F10:
	mov	cl,[eax]
	add	eax,1h
	test	cl,cl
	jnz	6F1F10h

l006F1F19:
	sub	eax,edx
	add	esi,eax
	jmp	6F1F29h

l006F1F1F:
	mov	byte ptr [esi],25h
	jmp	6F1F26h

l006F1F24:
	mov	[esi],al

l006F1F26:
	add	esi,1h

l006F1F29:
	add	ebp,1h
	cmp	byte ptr [ebp+0h],0h
	jnz	6F1C50h

l006F1F36:
	jmp	6F1F5Eh

l006F1F38:
	mov	eax,[esp+18h]
	mov	edx,esi
	sub	edx,eax

l006F1F40:
	mov	cl,[eax]
	mov	[edx+eax],cl
	add	eax,1h
	test	cl,cl
	jnz	6F1F40h

l006F1F4C:
	mov	eax,esi
	lea	edx,[eax+1h]

l006F1F51:
	mov	cl,[eax]
	add	eax,1h
	test	cl,cl
	jnz	6F1F51h

l006F1F5A:
	sub	eax,edx
	add	esi,eax

l006F1F5E:
	mov	edi,[esp+10h]

l006F1F62:
	sub	esi,edi
	sub	esi,14h
	lea	edx,[esp+14h]
	push	esi
	push	edx
	call	6EC4F0h
	mov	eax,[esp+1Ch]
	add	esp,8h
	pop	edi
	pop	esi
	pop	ebp
	pop	ebx
	add	esp,10h
	ret
006F1F81    8D 49 00                                      .I.           
l006F1F84	dd	0x006F1B1A
l006F1F88	dd	0x006F1B17
l006F1F8C	dd	0x006F1B27
l006F1F90	dd	0x006F1B47
l006F1F94	dd	0x006F1B2F
l006F1F98	dd	0x006F1B4F
l006F1F9C	db	0x00
l006F1F9D	db	0x05
l006F1F9E	db	0x05
l006F1F9F	db	0x05
l006F1FA0	db	0x05
l006F1FA1	db	0x05
l006F1FA2	db	0x05
l006F1FA3	db	0x05
l006F1FA4	db	0x05
l006F1FA5	db	0x05
l006F1FA6	db	0x05
l006F1FA7	db	0x05
l006F1FA8	db	0x05
l006F1FA9	db	0x05
l006F1FAA	db	0x05
l006F1FAB	db	0x05
l006F1FAC	db	0x05
l006F1FAD	db	0x05
l006F1FAE	db	0x05
l006F1FAF	db	0x05
l006F1FB0	db	0x05
l006F1FB1	db	0x05
l006F1FB2	db	0x05
l006F1FB3	db	0x05
l006F1FB4	db	0x05
l006F1FB5	db	0x05
l006F1FB6	db	0x05
l006F1FB7	db	0x05
l006F1FB8	db	0x05
l006F1FB9	db	0x05
l006F1FBA	db	0x05
l006F1FBB	db	0x05
l006F1FBC	db	0x05
l006F1FBD	db	0x05
l006F1FBE	db	0x05
l006F1FBF	db	0x05
l006F1FC0	db	0x05
l006F1FC1	db	0x05
l006F1FC2	db	0x05
l006F1FC3	db	0x05
l006F1FC4	db	0x05
l006F1FC5	db	0x05
l006F1FC6	db	0x05
l006F1FC7	db	0x05
l006F1FC8	db	0x05
l006F1FC9	db	0x05
l006F1FCA	db	0x05
l006F1FCB	db	0x05
l006F1FCC	db	0x05
l006F1FCD	db	0x05
l006F1FCE	db	0x05
l006F1FCF	db	0x05
l006F1FD0	db	0x05
l006F1FD1	db	0x05
l006F1FD2	db	0x05
l006F1FD3	db	0x05
l006F1FD4	db	0x05
l006F1FD5	db	0x05
l006F1FD6	db	0x05
l006F1FD7	db	0x05
l006F1FD8	db	0x05
l006F1FD9	db	0x05
l006F1FDA	db	0x01
l006F1FDB	db	0x02
l006F1FDC	db	0x05
l006F1FDD	db	0x05
l006F1FDE	db	0x05
l006F1FDF	db	0x05
l006F1FE0	db	0x02
l006F1FE1	db	0x05
l006F1FE2	db	0x05
l006F1FE3	db	0x05
l006F1FE4	db	0x05
l006F1FE5	db	0x05
l006F1FE6	db	0x05
l006F1FE7	db	0x03
l006F1FE8	db	0x05
l006F1FE9	db	0x05
l006F1FEA	db	0x04
l006F1FEB	db	0x05
l006F1FEC	db	0x02
l006F1FED	db	0x05
l006F1FEE	db	0x05
l006F1FEF	db	0x02
l006F1FF0	dd	0x006F1F1F
l006F1FF4	dd	0x006F1D62
l006F1FF8	dd	0x006F1D6F
l006F1FFC	dd	0x006F1DF5
l006F2000	dd	0x006F1EB8
l006F2004	dd	0x006F1E52
l006F2008	dd	0x006F1DB2
l006F200C	dd	0x006F1E22
l006F2010	dd	0x006F1F38
l006F2014	db	0x00
l006F2015	db	0x08
l006F2016	db	0x08
l006F2017	db	0x08
l006F2018	db	0x08
l006F2019	db	0x08
l006F201A	db	0x08
l006F201B	db	0x08
l006F201C	db	0x08
l006F201D	db	0x08
l006F201E	db	0x08
l006F201F	db	0x08
l006F2020	db	0x08
l006F2021	db	0x08
l006F2022	db	0x08
l006F2023	db	0x08
l006F2024	db	0x08
l006F2025	db	0x08
l006F2026	db	0x08
l006F2027	db	0x08
l006F2028	db	0x08
l006F2029	db	0x08
l006F202A	db	0x08
l006F202B	db	0x08
l006F202C	db	0x08
l006F202D	db	0x08
l006F202E	db	0x08
l006F202F	db	0x08
l006F2030	db	0x08
l006F2031	db	0x08
l006F2032	db	0x08
l006F2033	db	0x08
l006F2034	db	0x08
l006F2035	db	0x08
l006F2036	db	0x08
l006F2037	db	0x08
l006F2038	db	0x08
l006F2039	db	0x08
l006F203A	db	0x08
l006F203B	db	0x08
l006F203C	db	0x08
l006F203D	db	0x08
l006F203E	db	0x08
l006F203F	db	0x08
l006F2040	db	0x08
l006F2041	db	0x08
l006F2042	db	0x08
l006F2043	db	0x08
l006F2044	db	0x08
l006F2045	db	0x08
l006F2046	db	0x08
l006F2047	db	0x08
l006F2048	db	0x08
l006F2049	db	0x08
l006F204A	db	0x08
l006F204B	db	0x08
l006F204C	db	0x08
l006F204D	db	0x08
l006F204E	db	0x08
l006F204F	db	0x08
l006F2050	db	0x08
l006F2051	db	0x08
l006F2052	db	0x01
l006F2053	db	0x02
l006F2054	db	0x08
l006F2055	db	0x08
l006F2056	db	0x08
l006F2057	db	0x08
l006F2058	db	0x03
l006F2059	db	0x08
l006F205A	db	0x08
l006F205B	db	0x08
l006F205C	db	0x08
l006F205D	db	0x08
l006F205E	db	0x08
l006F205F	db	0x04
l006F2060	db	0x08
l006F2061	db	0x08
l006F2062	db	0x05
l006F2063	db	0x08
l006F2064	db	0x06
l006F2065	db	0x08
l006F2066	db	0x08
l006F2067	db	0x07
006F2068                         CC CC CC CC CC CC CC CC         ........

;; fn006F2070: 006F2070
;;   Called from:
;;     006DDE01 (in fn006DDDB0)
;;     00708D6C (in fn00708C10)
;;     0072A55B (in fn0072A520)
;;     007483C7 (in fn007483C0)
fn006F2070 proc
	mov	ecx,[esp+4h]
	lea	eax,[esp+8h]
	push	eax
	push	ecx
	call	6F1AA0h
	add	esp,8h
	ret
006F2083          CC CC CC CC CC CC CC CC CC CC CC CC CC    .............

;; fn006F2090: 006F2090
;;   Called from:
;;     0073D5DD (in fn0073D450)
fn006F2090 proc
	sub	esp,18h
	cmp	dword ptr [esp+2Ch],0h
	push	esi
	mov	esi,[esp+24h]
	push	edi
	jz	6F20ADh

l006F20A0:
	lea	eax,[0000h+esi*4]
	mov	[esp+14h],eax
	jmp	6F20B1h

l006F20AD:
	mov	[esp+14h],esi

l006F20B1:
	mov	edi,[esp+14h]
	test	edi,edi
	jnz	6F20C2h

l006F20B9:
	mov	eax,[0A6C63Ch]
	test	eax,eax
	jnz	6F211Ah

l006F20C2:
	lea	ecx,[edi+18h]
	push	ecx
	call	723860h
	add	esp,4h
	test	eax,eax
	jnz	6F20D9h

l006F20D2:
	call	6E1210h
	jmp	6F211Dh

l006F20D9:
	test	edi,edi
	mov	[eax+8h],edi
	mov	dword ptr [eax+4h],0A1B450h
	mov	dword ptr [eax],1h
	mov	dword ptr [eax+0Ch],0FFFFFFFFh
	mov	dword ptr [eax+10h],0h
	mov	byte ptr [eax+edi+14h],0h
	jnz	6F211Dh

l006F2100:
	lea	edx,[esp+10h]
	push	edx
	mov	[esp+14h],eax
	call	6EC890h
	mov	eax,[esp+14h]
	add	esp,4h
	mov	[0A6C63Ch],eax

l006F211A:
	add	dword ptr [eax],1h

l006F211D:
	test	eax,eax
	mov	[esp+0Ch],eax
	mov	[esp+18h],eax
	jnz	6F212Fh

l006F2129:
	pop	edi
	pop	esi
	add	esp,18h
	ret

l006F212F:
	push	ebx
	push	ebp
	push	eax
	call	6ECC50h
	mov	ebp,[esp+30h]
	add	esi,ebp
	add	esp,4h
	cmp	ebp,esi
	mov	[esp+24h],eax
	mov	ebx,eax
	mov	[esp+10h],esi
	jnc	6F2448h

l006F2152:
	cmp	byte ptr [ebp+0h],5Ch
	jnz	6F236Ch

l006F215C:
	add	ebp,1h
	cmp	ebp,esi
	jz	6F2468h

l006F2167:
	movsx	eax,byte ptr [ebp+0h]
	sub	eax,0Ah
	add	ebp,1h
	cmp	eax,6Eh
	ja	6F235Dh

l006F217A:
	movzx	eax,byte ptr [eax+6F24E0h]
	jmp	dword ptr [6F24A8h+eax*4]

l006F2188:
	mov	byte ptr [ebx],5Ch
	add	ebx,1h
	jmp	6F2438h

l006F2193:
	mov	byte ptr [ebx],27h
	add	ebx,1h
	jmp	6F2438h

l006F219E:
	mov	byte ptr [ebx],22h
	add	ebx,1h
	jmp	6F2438h

l006F21A9:
	mov	byte ptr [ebx],8h
	add	ebx,1h
	jmp	6F2438h

l006F21B4:
	mov	byte ptr [ebx],0Ch
	add	ebx,1h
	jmp	6F2438h

l006F21BF:
	mov	byte ptr [ebx],9h
	add	ebx,1h
	jmp	6F2438h

l006F21CA:
	mov	byte ptr [ebx],0Ah
	add	ebx,1h
	jmp	6F2438h

l006F21D5:
	mov	byte ptr [ebx],0Dh
	add	ebx,1h
	jmp	6F2438h

l006F21E0:
	mov	byte ptr [ebx],0Bh
	add	ebx,1h
	jmp	6F2438h

l006F21EB:
	mov	byte ptr [ebx],7h
	add	ebx,1h
	jmp	6F2438h

l006F21F6:
	movsx	eax,byte ptr [ebp-1h]
	sub	eax,30h
	cmp	ebp,esi
	jnc	6F2233h

l006F2201:
	mov	cl,[ebp+0h]
	cmp	cl,30h
	jl	6F2233h

l006F2209:
	cmp	cl,37h
	jg	6F2233h

l006F220E:
	movsx	ecx,cl
	add	ebp,1h
	cmp	ebp,esi
	lea	eax,[ecx+eax*8-30h]
	jnc	6F2233h

l006F221C:
	mov	cl,[ebp+0h]
	cmp	cl,30h
	jl	6F2233h

l006F2224:
	cmp	cl,37h
	jg	6F2233h

l006F2229:
	movsx	edx,cl
	lea	eax,[edx+eax*8-30h]
	add	ebp,1h

l006F2233:
	mov	[ebx],al
	add	ebx,1h
	jmp	6F2438h

l006F223D:
	lea	edi,[ebp+1h]
	cmp	edi,esi
	jnc	6F22E8h

l006F2248:
	movzx	eax,byte ptr [ebp+0h]
	mov	esi,[8A4710h]
	push	eax
	call	esi
	add	esp,4h
	test	eax,eax
	jz	6F22E8h

l006F2260:
	movzx	ecx,byte ptr [edi]
	push	ecx
	call	esi
	add	esp,4h
	test	eax,eax
	jz	6F22E8h

l006F226D:
	movzx	esi,byte ptr [ebp+0h]
	push	esi
	mov	ebp,edi
	call	dword ptr [8A4700h]
	add	esp,4h
	test	eax,eax
	jz	6F2286h

l006F2281:
	lea	edi,[esi-30h]
	jmp	6F229Ah

l006F2286:
	push	esi
	call	dword ptr [8A4708h]
	add	esp,4h
	test	eax,eax
	lea	edi,[esi-57h]
	jnz	6F229Ah

l006F2297:
	lea	edi,[esi-37h]

l006F229A:
	movzx	esi,byte ptr [ebp+0h]
	push	esi
	shl	edi,4h
	add	ebp,1h
	call	dword ptr [8A4700h]
	add	esp,4h
	test	eax,eax
	jz	6F22C4h

l006F22B2:
	lea	eax,[edi+esi-30h]
	mov	esi,[esp+10h]
	mov	[ebx],al
	add	ebx,1h
	jmp	6F2438h

l006F22C4:
	push	esi
	call	dword ptr [8A4708h]
	add	esp,4h
	test	eax,eax
	lea	eax,[edi+esi-57h]
	jnz	6F22DAh

l006F22D6:
	lea	eax,[edi+esi-37h]

l006F22DA:
	mov	esi,[esp+10h]
	mov	[ebx],al
	add	ebx,1h
	jmp	6F2438h

l006F22E8:
	mov	edx,[esp+34h]
	test	edx,edx
	jz	6F2475h

l006F22F4:
	mov	edi,8D1DC8h
	mov	esi,edx
	mov	ecx,7h
	xor	eax,eax

l006F2302:
	rep cmpsb

l006F2304:
	jz	6F2475h

l006F230A:
	mov	edi,8D46D8h
	mov	esi,edx
	mov	ecx,8h
	xor	eax,eax

l006F2318:
	rep cmpsb

l006F231A:
	jnz	6F2331h

l006F231C:
	mov	byte ptr [ebx],3Fh
	add	ebx,1h

l006F2322:
	mov	esi,[esp+10h]
	mov	byte ptr [ebx],5Ch
	add	ebx,1h
	sub	ebp,1h
	jmp	6F2370h

l006F2331:
	mov	edi,8B056Ch
	mov	esi,edx
	mov	ecx,7h
	xor	eax,eax

l006F233F:
	rep cmpsb

l006F2341:
	jz	6F2322h

l006F2343:
	mov	ecx,[0A17E2Ch]
	push	edx
	push	8D4FE4h
	push	ecx
	call	6E15D0h
	add	esp,0Ch
	jmp	6F2489h

l006F235D:
	mov	edx,[esp+34h]
	mov	byte ptr [ebx],5Ch
	add	ebx,1h
	sub	ebp,1h
	jmp	6F2370h

l006F236C:
	mov	edx,[esp+34h]

l006F2370:
	mov	edi,[esp+3Ch]
	test	edi,edi
	jz	6F242Dh

l006F237C:
	test	byte ptr [ebp+0h],80h
	jz	6F242Dh

l006F2386:
	cmp	ebp,esi
	mov	eax,ebp
	mov	[esp+18h],eax
	jnc	6F23A0h

l006F2390:
	test	byte ptr [eax],80h
	jz	6F239Ch

l006F2395:
	add	eax,1h
	cmp	eax,esi
	jc	6F2390h

l006F239C:
	mov	[esp+18h],eax

l006F23A0:
	push	edx
	sub	eax,ebp
	push	eax
	push	ebp
	call	71FC80h
	mov	esi,eax
	add	esp,0Ch
	test	esi,esi
	jz	6F2489h

l006F23B7:
	mov	ecx,[esp+34h]
	push	ecx
	push	edi
	push	esi
	call	71FB20h
	add	esp,0Ch
	add	dword ptr [esi],0FFh
	mov	edi,eax
	jnz	6F23D9h

l006F23CD:
	mov	edx,[esi+4h]
	mov	eax,[edx+18h]
	push	esi
	call	eax
	add	esp,4h

l006F23D9:
	test	edi,edi
	jz	6F2489h

l006F23E1:
	mov	ebp,[edi+8h]
	cmp	ebp,10h
	lea	esi,[edi+14h]
	jc	6F23F9h

l006F23EC:
	push	ebp
	push	esi
	push	ebx
	call	695030h
	add	esp,0Ch
	jmp	6F2410h

l006F23F9:
	test	ebp,ebp
	jbe	6F2410h

l006F23FD:
	mov	eax,ebx
	sub	esi,ebx
	mov	ecx,ebp

l006F2403:
	mov	dl,[esi+eax]
	mov	[eax],dl
	add	eax,1h
	sub	ecx,1h
	jnz	6F2403h

l006F2410:
	add	ebx,ebp
	add	dword ptr [edi],0FFh
	jnz	6F2423h

l006F2417:
	mov	eax,[edi+4h]
	mov	ecx,[eax+18h]
	push	edi
	call	ecx
	add	esp,4h

l006F2423:
	mov	ebp,[esp+18h]
	mov	esi,[esp+10h]
	jmp	6F2438h

l006F242D:
	mov	dl,[ebp+0h]
	mov	[ebx],dl
	add	ebx,1h
	add	ebp,1h

l006F2438:
	cmp	ebp,esi
	jc	6F2152h

l006F2440:
	mov	edi,[esp+1Ch]
	mov	eax,[esp+24h]

l006F2448:
	sub	ebx,eax
	cmp	ebx,edi
	jge	6F245Ch

l006F244E:
	lea	eax,[esp+20h]
	push	ebx
	push	eax
	call	6EC4F0h
	add	esp,8h

l006F245C:
	mov	eax,[esp+20h]
	pop	ebp
	pop	ebx
	pop	edi
	pop	esi
	add	esp,18h
	ret

l006F2468:
	mov	eax,[0A17E2Ch]
	push	8D4FCCh
	push	eax
	jmp	6F2481h

l006F2475:
	mov	edx,[0A17E2Ch]
	push	8D4FB8h
	push	edx

l006F2481:
	call	6E0F80h
	add	esp,8h

l006F2489:
	mov	eax,[esp+14h]
	add	dword ptr [eax],0FFh
	jnz	6F249Eh

l006F2492:
	mov	ecx,[eax+4h]
	mov	edx,[ecx+18h]
	push	eax
	call	edx
	add	esp,4h

l006F249E:
	pop	ebp
	pop	ebx
	pop	edi
	xor	eax,eax
	pop	esi
	add	esp,18h
	ret
l006F24A8	dd	0x006F2438
l006F24AC	dd	0x006F219E
l006F24B0	dd	0x006F2193
l006F24B4	dd	0x006F21F6
l006F24B8	dd	0x006F2188
l006F24BC	dd	0x006F21EB
l006F24C0	dd	0x006F21A9
l006F24C4	dd	0x006F21B4
l006F24C8	dd	0x006F21CA
l006F24CC	dd	0x006F21D5
l006F24D0	dd	0x006F21BF
l006F24D4	dd	0x006F21E0
l006F24D8	dd	0x006F223D
l006F24DC	dd	0x006F235D
l006F24E0	db	0x00
l006F24E1	db	0x0D
l006F24E2	db	0x0D
l006F24E3	db	0x0D
l006F24E4	db	0x0D
l006F24E5	db	0x0D
l006F24E6	db	0x0D
l006F24E7	db	0x0D
l006F24E8	db	0x0D
l006F24E9	db	0x0D
l006F24EA	db	0x0D
l006F24EB	db	0x0D
l006F24EC	db	0x0D
l006F24ED	db	0x0D
l006F24EE	db	0x0D
l006F24EF	db	0x0D
l006F24F0	db	0x0D
l006F24F1	db	0x0D
l006F24F2	db	0x0D
l006F24F3	db	0x0D
l006F24F4	db	0x0D
l006F24F5	db	0x0D
l006F24F6	db	0x0D
l006F24F7	db	0x0D
l006F24F8	db	0x01
l006F24F9	db	0x0D
l006F24FA	db	0x0D
l006F24FB	db	0x0D
l006F24FC	db	0x0D
l006F24FD	db	0x02
l006F24FE	db	0x0D
l006F24FF	db	0x0D
l006F2500	db	0x0D
l006F2501	db	0x0D
l006F2502	db	0x0D
l006F2503	db	0x0D
l006F2504	db	0x0D
l006F2505	db	0x0D
l006F2506	db	0x03
l006F2507	db	0x03
l006F2508	db	0x03
l006F2509	db	0x03
l006F250A	db	0x03
l006F250B	db	0x03
l006F250C	db	0x03
l006F250D	db	0x03
l006F250E	db	0x0D
l006F250F	db	0x0D
l006F2510	db	0x0D
l006F2511	db	0x0D
l006F2512	db	0x0D
l006F2513	db	0x0D
l006F2514	db	0x0D
l006F2515	db	0x0D
l006F2516	db	0x0D
l006F2517	db	0x0D
l006F2518	db	0x0D
l006F2519	db	0x0D
l006F251A	db	0x0D
l006F251B	db	0x0D
l006F251C	db	0x0D
l006F251D	db	0x0D
l006F251E	db	0x0D
l006F251F	db	0x0D
l006F2520	db	0x0D
l006F2521	db	0x0D
l006F2522	db	0x0D
l006F2523	db	0x0D
l006F2524	db	0x0D
l006F2525	db	0x0D
l006F2526	db	0x0D
l006F2527	db	0x0D
l006F2528	db	0x0D
l006F2529	db	0x0D
l006F252A	db	0x0D
l006F252B	db	0x0D
l006F252C	db	0x0D
l006F252D	db	0x0D
l006F252E	db	0x0D
l006F252F	db	0x0D
l006F2530	db	0x0D
l006F2531	db	0x0D
l006F2532	db	0x04
l006F2533	db	0x0D
l006F2534	db	0x0D
l006F2535	db	0x0D
l006F2536	db	0x0D
l006F2537	db	0x05
l006F2538	db	0x06
l006F2539	db	0x0D
l006F253A	db	0x0D
l006F253B	db	0x0D
l006F253C	db	0x07
l006F253D	db	0x0D
l006F253E	db	0x0D
l006F253F	db	0x0D
l006F2540	db	0x0D
l006F2541	db	0x0D
l006F2542	db	0x0D
l006F2543	db	0x0D
l006F2544	db	0x08
l006F2545	db	0x0D
l006F2546	db	0x0D
l006F2547	db	0x0D
l006F2548	db	0x09
l006F2549	db	0x0D
l006F254A	db	0x0A
l006F254B	db	0x0D
l006F254C	db	0x0B
l006F254D	db	0x0D
l006F254E	db	0x0C
006F254F                                              CC                .
006F2550 56 8B 74 24 08 8B 46 04 3D 50 B4 A1 00 74 20 68 V.t$..F.=P...t h
006F2560 50 B4 A1 00 50 E8 06 31 FE FF 83 C4 08 85 C0 75 P...P..1.......u
006F2570 0E 83 05 80 64 A1 00 01 B8 80 64 A1 00 5E C3 8B ....d.....d..^..
006F2580 44 24 0C 50 56 E8 E6 E5 FF FF 83 C4 08 5E C3 CC D$.PV........^..

;; fn006F2590: 006F2590
;;   Called from:
;;     006F29F2 (in fn006F29C0)
;;     006F33E2 (in fn006F31C0)
;;     006F33F8 (in fn006F31C0)
;;     006F3785 (in fn006F3930)
;;     006F3815 (in fn006F3930)
;;     006F38A3 (in fn006F3930)
fn006F2590 proc
	mov	eax,[ebx+10h]
	cmp	eax,esi
	jl	6F25A3h

l006F2597:
	sar	eax,1h
	cmp	esi,eax
	jl	6F25A3h

l006F259D:
	mov	[ebx+8h],esi
	xor	eax,eax
	ret

l006F25A3:
	xor	eax,eax
	cmp	esi,9h
	setge	al
	mov	ecx,esi
	sar	ecx,3h
	or	edx,0FFh
	push	edi
	sub	edx,esi
	sub	eax,1h
	and	eax,0FDh
	add	eax,6h
	add	eax,ecx
	mov	edi,eax
	cmp	edi,edx
	ja	6F25F9h

l006F25C7:
	add	edi,esi
	test	esi,esi
	jnz	6F25CFh

l006F25CD:
	xor	edi,edi

l006F25CF:
	cmp	edi,3FFFFFFFh
	mov	ecx,[ebx+0Ch]
	ja	6F25F9h

l006F25DA:
	lea	eax,[0000h+edi*4]
	test	eax,eax
	jnz	6F25EAh

l006F25E5:
	mov	eax,1h

l006F25EA:
	push	eax
	push	ecx
	call	dword ptr [8A4594h]
	add	esp,8h
	test	eax,eax
	jnz	6F2603h

l006F25F9:
	call	6E1210h
	or	eax,0FFh
	pop	edi
	ret

l006F2603:
	mov	[ebx+0Ch],eax
	mov	[ebx+10h],edi
	mov	[ebx+8h],esi
	xor	eax,eax
	pop	edi
	ret

;; fn006F2610: 006F2610
;;   Called from:
;;     006E899E (in fn006E8910)
fn006F2610 proc
	mov	eax,[0A6CB80h]
	test	eax,eax
	jz	6F2641h

l006F2619:
	lea	esp,[esp+0h]

l006F2620:
	sub	eax,1h
	mov	[0A6CB80h],eax
	mov	eax,[0A6CA40h+eax*4]
	push	eax
	call	6FEFD0h
	mov	eax,[0A6CB80h]
	add	esp,4h
	test	eax,eax
	jnz	6F2620h

l006F2641:
	ret
006F2642       CC CC CC CC CC CC CC CC CC CC CC CC CC CC   ..............

;; fn006F2650: 006F2650
;;   Called from:
;;     006E54A7 (in fn006E54A0)
;;     006E9B0D (in fn006E9B00)
;;     006F2ED6 (in fn006F2EA0)
;;     006FE2B4 (in fn006FE2A0)
;;     007035EC (in fn007035C0)
;;     0070A772 (in fn00708DC0)
;;     0072E7E6 (in fn0072E790)
;;     00736E00 (in fn007367D0)
;;     007373AE (in fn007373A0)
;;     00737430 (in fn00737410)
;;     00740D2A (in fn00740CC0)
;;     00747380 (in fn00747330)
;;     00747390 (in fn00747330)
;;     0074868A (in fn00748670)
;;     0074E995 (in fn0074E980)
fn006F2650 proc
	push	edi
	mov	edi,[esp+8h]
	test	edi,edi
	jge	6F266Ch

l006F2659:
	push	64h
	push	8D5078h
	call	6E1DC0h
	add	esp,8h
	xor	eax,eax
	pop	edi
	ret

l006F266C:
	cmp	edi,3FFFFFFFh
	push	ebx
	lea	ebx,[0000h+edi*4]
	jbe	6F2683h

l006F267C:
	pop	ebx
	pop	edi
	jmp	6E1210h

l006F2683:
	mov	eax,[0A6CB80h]
	test	eax,eax
	push	esi
	jz	6F26AFh

l006F268D:
	mov	esi,[0A6CA3Ch+eax*4]
	sub	eax,1h
	mov	[0A6CB80h],eax
	mov	dword ptr [esi],1h

l006F26A2:
	test	edi,edi
	jg	6F26C6h

l006F26A6:
	mov	dword ptr [esi+0Ch],0h
	jmp	6F2707h

l006F26AF:
	push	0A1BAF0h
	call	6FEF30h
	mov	esi,eax
	add	esp,4h
	test	esi,esi
	jnz	6F26A2h

l006F26C2:
	pop	esi
	pop	ebx
	pop	edi
	ret

l006F26C6:
	test	ebx,ebx
	mov	eax,ebx
	jnz	6F26D1h

l006F26CC:
	mov	eax,1h

l006F26D1:
	push	eax
	call	dword ptr [8A45BCh]
	add	esp,4h
	test	eax,eax
	mov	[esi+0Ch],eax
	jnz	6F26FBh

l006F26E2:
	add	dword ptr [esi],0FFh
	jnz	6F26F3h

l006F26E7:
	mov	eax,[esi+4h]
	mov	ecx,[eax+18h]
	push	esi
	call	ecx
	add	esp,4h

l006F26F3:
	pop	esi
	pop	ebx
	pop	edi
	jmp	6E1210h

l006F26FB:
	push	ebx
	push	0h
	push	eax
	call	695020h
	add	esp,0Ch

l006F2707:
	mov	[esi+8h],edi
	mov	[esi+10h],edi
	cmp	dword ptr [esi-8h],0FEh
	lea	edi,[esi-10h]
	jz	6F2723h

l006F2716:
	push	8D0E04h
	call	6E86F0h
	add	esp,4h

l006F2723:
	mov	dword ptr [edi+8h],0FFFFFFFDh
	mov	edx,[0A1D558h]
	mov	[edi],edx
	mov	eax,[0A1D558h]
	mov	eax,[eax+4h]
	mov	[edi+4h],eax
	mov	[eax],edi
	mov	ecx,[0A1D558h]
	mov	eax,esi
	pop	esi
	pop	ebx
	mov	[ecx+4h],edi
	pop	edi
	ret
006F274E                                           CC CC               ..

;; fn006F2750: 006F2750
;;   Called from:
;;     006F6AF6 (in fn006F6AF0)
;;     006F7967 (in fn006F7890)
;;     006F7C66 (in fn006F7890)
;;     00726278 (in fn00726260)
;;     0072F8E5 (in fn0072F830)
;;     0074EBCD (in fn0074EB10)
fn006F2750 proc
	push	esi
	mov	esi,[esp+8h]
	mov	eax,[esi+4h]
	cmp	eax,0A1BAF0h
	jz	6F2788h

l006F275F:
	push	0A1BAF0h
	push	eax
	call	6D5670h
	add	esp,8h
	test	eax,eax
	jnz	6F2788h

l006F2771:
	push	89h
	push	8D5078h
	call	6E1DC0h
	add	esp,8h
	or	eax,0FFh
	pop	esi
	ret

l006F2788:
	mov	eax,[esi+8h]
	pop	esi
	ret
006F278D                                        CC CC CC              ...

;; fn006F2790: 006F2790
;;   Called from:
;;     006F6B46 (in fn006F6AF0)
;;     006F7979 (in fn006F7890)
;;     006F7CAC (in fn006F7890)
;;     0072F919 (in fn0072F830)
;;     0074EC09 (in fn0074EB10)
fn006F2790 proc
	push	esi
	mov	esi,[esp+8h]
	mov	eax,[esi+4h]
	cmp	eax,0A1BAF0h
	jz	6F27C7h

l006F279F:
	push	0A1BAF0h
	push	eax
	call	6D5670h
	add	esp,8h
	test	eax,eax
	jnz	6F27C7h

l006F27B1:
	push	96h
	push	8D5078h
	call	6E1DC0h
	add	esp,8h
	xor	eax,eax
	pop	esi
	ret

l006F27C7:
	mov	eax,[esp+0Ch]
	test	eax,eax
	jl	6F27DCh

l006F27CF:
	cmp	eax,[esi+8h]
	jge	6F27DCh

l006F27D4:
	mov	ecx,[esi+0Ch]
	mov	eax,[ecx+eax*4]
	pop	esi
	ret

l006F27DC:
	mov	eax,[0A6CB84h]
	test	eax,eax
	jnz	6F27F7h

l006F27E5:
	push	8D5090h
	call	6ECAC0h
	add	esp,4h
	mov	[0A6CB84h],eax

l006F27F7:
	mov	edx,[0A17CA4h]
	push	eax
	push	edx
	call	6E0E90h
	add	esp,8h
	xor	eax,eax
	pop	esi
	ret
006F280B                                  CC CC CC CC CC            .....
006F2810 56 8B 74 24 08 8B 46 04 3D F0 BA A1 00 74 42 68 V.t$..F.=....tBh
006F2820 F0 BA A1 00 50 E8 46 2E FE FF 83 C4 08 85 C0 75 ....P.F........u
006F2830 30 8B 44 24 10 85 C0 74 11 83 00 FF 75 0C 8B 48 0.D$...t....u..H
006F2840 04 8B 51 18 50 FF D2 83 C4 04 68 AB 00 00 00 68 ..Q.P.....h....h
006F2850 78 50 8D 00 E8 67 F5 FE FF 83 C4 08 83 C8 FF 5E xP...g.........^
006F2860 C3 8B 44 24 0C 85 C0 7C 2C 3B 46 08 7D 27 8B 4E ..D$...|,;F.}'.N
006F2870 0C 8B 54 24 10 8D 04 81 8B 08 85 C9 89 10 74 11 ..T$..........t.
006F2880 83 01 FF 75 0C 8B 41 04 51 8B 48 18 FF D1 83 C4 ...u..A.Q.H.....
006F2890 04 33 C0 5E C3 8B 44 24 10 85 C0 74 11 83 00 FF .3.^..D$...t....
006F28A0 75 0C 8B 50 04 50 8B 42 18 FF D0 83 C4 04 8B 0D u..P.P.B........
006F28B0 A4 7C A1 00 68 A8 50 8D 00 51 E8 C1 E6 FE FF 83 .|..h.P..Q......
006F28C0 C4 08 83 C8 FF 5E C3 CC CC CC CC CC CC CC CC CC .....^..........
006F28D0 83 7C 24 04 00 53 55 8B D9 8B 6B 08 57 8B F8 75 .|$..SU...k.W..u
006F28E0 19 68 C1 00 00 00 68 78 50 8D 00 E8 D0 F4 FE FF .h....hxP.......
006F28F0 83 C4 08 5F 5D 83 C8 FF 5B C3 81 FD FF FF FF 7F ..._]...[.......
006F2900 75 1A A1 98 85 A1 00 68 CC 50 8D 00 50 E8 6E E6 u......h.P..P.n.
006F2910 FE FF 83 C4 08 5F 5D 83 C8 FF 5B C3 56 8D 75 01 ....._]...[.V.u.
006F2920 E8 6B FC FF FF 83 F8 FF 5E 74 C8 85 FF 7D 06 03 .k......^t...}..
006F2930 FD 79 02 33 FF 8B 4B 0C 3B FD 8D 45 FF 0F 4F FD .y.3..K.;..E..O.
006F2940 3B C7 7C 0E 8B 14 81 89 54 81 04 83 E8 01 3B C7 ;.|.....T.....;.
006F2950 7D F2 8B 44 24 10 83 00 01 89 04 B9 5F 5D 33 C0 }..D$......._]3.
006F2960 5B C3 CC CC CC CC CC CC CC CC CC CC CC CC CC CC [...............
006F2970 56 8B 74 24 08 8B 46 04 3D F0 BA A1 00 74 29 68 V.t$..F.=....t)h
006F2980 F0 BA A1 00 50 E8 E6 2C FE FF 83 C4 08 85 C0 75 ....P..,.......u
006F2990 17 68 E0 00 00 00 68 78 50 8D 00 E8 20 F4 FE FF .h....hxP... ...
006F29A0 83 C4 08 83 C8 FF 5E C3 8B 44 24 10 50 8B 44 24 ......^..D$.P.D$
006F29B0 10 8B CE E8 18 FF FF FF 83 C4 04 5E C3 CC CC CC ...........^....

;; fn006F29C0: 006F29C0
;;   Called from:
;;     006F2A3C (in fn006F2A10)
;;     006F37B7 (in fn006F3930)
fn006F29C0 proc
	push	ebx
	push	ebp
	mov	ebp,[esp+0Ch]
	mov	ebx,eax
	push	edi
	mov	edi,[ebx+8h]
	cmp	edi,7FFFFFFFh
	jnz	6F29EEh

l006F29D4:
	mov	eax,[0A18598h]
	push	8D50CCh
	push	eax
	call	6E0F80h
	add	esp,8h

l006F29E7:
	pop	edi
	pop	ebp
	or	eax,0FFh
	pop	ebx
	ret

l006F29EE:
	push	esi
	lea	esi,[edi+1h]
	call	6F2590h
	cmp	eax,0FFh
	pop	esi
	jz	6F29E7h

l006F29FD:
	add	dword ptr [ebp+0h],1h
	mov	ecx,[ebx+0Ch]
	mov	[ecx+edi*4],ebp
	pop	edi
	pop	ebp
	xor	eax,eax
	pop	ebx
	ret
006F2A0D                                        CC CC CC              ...

;; fn006F2A10: 006F2A10
;;   Called from:
;;     006E54E8 (in fn006E54A0)
;;     006FE341 (in fn006FE2A0)
;;     006FE3A3 (in fn006FE380)
;;     007098AB (in fn00708DC0)
;;     007264FE (in fn007264A0)
;;     0072665E (in fn00726570)
;;     007267E4 (in fn00726760)
;;     00726B64 (in fn00726930)
;;     00728F4E (in fn00728E40)
;;     00736C76 (in fn007367D0)
;;     00740DFF (in fn00740DF0)
;;     007480A4 (in fn00748090)
;;     00748121 (in fn00748090)
;;     00748262 (in fn00748190)
fn006F2A10 proc
	push	esi
	mov	esi,[esp+8h]
	mov	eax,[esi+4h]
	cmp	eax,0A1BAF0h
	jz	6F2A31h

l006F2A1F:
	push	0A1BAF0h
	push	eax
	call	6D5670h
	add	esp,8h
	test	eax,eax
	jz	6F2A46h

l006F2A31:
	mov	eax,[esp+0Ch]
	test	eax,eax
	jz	6F2A46h

l006F2A39:
	push	eax
	mov	eax,esi
	call	6F29C0h
	add	esp,4h
	pop	esi
	ret

l006F2A46:
	push	0FFh
	push	8D5078h
	call	6E1DC0h
	add	esp,8h
	or	eax,0FFh
	pop	esi
	ret
006F2A5D                                        CC CC CC              ...
006F2A60 56 8B 74 24 08 56 E8 15 C4 00 00 83 C4 04 83 3D V.t$.V.........=
006F2A70 C4 C4 A6 00 32 0F 8D A8 00 00 00 83 05 C4 C4 A6 ....2...........
006F2A80 00 01 83 7E 0C 00 74 49 57 8B 7E 08 83 EF 01 78 ...~..tIW.~....x
006F2A90 32 8B 46 0C 83 3C B8 00 74 24 8B C8 8B 04 B9 83 2.F..<..t$......
006F2AA0 00 FF 8B 56 0C 8B 04 BA 83 38 00 75 11 8B CA 8B ...V.....8.u....
006F2AB0 04 B9 8B 50 04 50 8B 42 18 FF D0 83 C4 04 83 EF ...P.P.B........
006F2AC0 01 79 CE 8B 4E 0C 51 FF 15 D4 45 8A 00 83 C4 04 .y..N.Q...E.....
006F2AD0 5F A1 80 CB A6 00 83 F8 50 7D 1A 81 7E 04 F0 BA _.......P}..~...
006F2AE0 A1 00 75 11 89 34 85 40 CA A6 00 83 C0 01 A3 80 ..u..4.@........
006F2AF0 CB A6 00 EB 0F 8B 56 04 8B 82 A0 00 00 00 56 FF ......V.......V.
006F2B00 D0 83 C4 04 83 2D C4 C4 A6 00 01 83 3D C8 C4 A6 .....-......=...
006F2B10 00 00 74 18 83 3D C4 C4 A6 00 00 7F 0F 5E E9 3D ..t..=.......^.=
006F2B20 C3 FE FF 56 E8 17 C3 FE FF 83 C4 04 5E C3 CC CC ...V........^...
006F2B30 57 8B 7C 24 08 57 E8 E5 C1 FE FF 83 C4 04 85 C0 W.|$.W..........
006F2B40 74 19 7C 7F 8B 44 24 0C 68 30 CD 8C 00 50 FF 15 t.|..D$.h0...P..
006F2B50 E0 45 8A 00 83 C4 08 33 C0 5F C3 53 8B 5C 24 10 .E.....3._.S.\$.
006F2B60 55 8B 2D E0 45 8A 00 56 68 C0 7F 8C 00 53 FF D5 U.-.E..Vh....S..
006F2B70 33 F6 83 C4 08 39 77 08 7E 33 8D 9B 00 00 00 00 3....9w.~3......
006F2B80 85 F6 7E 0B 68 D0 A2 8A 00 53 FF D5 83 C4 08 8B ..~.h....S......
006F2B90 4F 0C 8B 14 B1 6A 00 53 52 E8 22 C4 FE FF 83 C4 O....j.SR.".....
006F2BA0 0C 85 C0 75 20 83 C6 01 3B 77 08 7C D3 68 C8 A2 ...u ...;w.|.h..
006F2BB0 8A 00 53 FF D5 57 E8 05 C2 FE FF 83 C4 0C 5E 5D ..S..W........^]
006F2BC0 33 C0 5B 5F C3 57 E8 F5 C1 FE FF 83 C4 04 5E 5D 3.[_.W........^]
006F2BD0 5B 83 C8 FF 5F C3 CC CC CC CC CC CC CC CC CC CC [..._...........
006F2BE0 83 EC 0C 53 55 8B 6C 24 18 33 DB 55 89 5C 24 14 ...SU.l$.3.U.\$.
006F2BF0 E8 2B C1 FE FF 83 C4 04 3B C3 74 1D 7E 13 68 30 .+......;.t.~.h0
006F2C00 CD 8C 00 E8 B8 9E FF FF 83 C4 04 5D 5B 83 C4 0C ...........][...
006F2C10 C3 5D 33 C0 5B 83 C4 0C C3 39 5D 08 75 24 68 C4 .]3.[....9].u$h.
006F2C20 7F 8C 00 E8 98 9E FF FF 83 C4 04 55 89 44 24 14 ...........U.D$.
006F2C30 E8 8B C1 FE FF 8B 44 24 14 83 C4 04 5D 5B 83 C4 ......D$....][..
006F2C40 0C C3 A1 80 CB A6 00 3B C3 56 74 17 8B 34 85 3C .......;.Vt..4.<
006F2C50 CA A6 00 83 E8 01 A3 80 CB A6 00 C7 06 01 00 00 ................
006F2C60 00 EB 17 68 F0 BA A1 00 E8 C3 C2 00 00 8B F0 83 ...h............
006F2C70 C4 04 3B F3 0F 84 78 01 00 00 57 8D 7E F0 89 5E ..;...x...W.~..^
006F2C80 0C 89 5E 08 89 5E 10 83 7F 08 FE 74 0D 68 04 0E ..^..^.....t.h..
006F2C90 8D 00 E8 59 5A FF FF 83 C4 04 C7 47 08 FD FF FF ...YZ......G....
006F2CA0 FF A1 58 D5 A1 00 89 07 8B 0D 58 D5 A1 00 8B 41 ..X.......X....A
006F2CB0 04 89 47 04 89 38 8B 15 58 D5 A1 00 89 7A 04 39 ..G..8..X....z.9
006F2CC0 5D 08 7E 53 8B 45 0C 8B 0C 98 51 E8 E0 B0 FE FF ].~S.E....Q.....
006F2CD0 83 C4 04 85 C0 89 44 24 10 0F 84 01 01 00 00 50 ......D$.......P
006F2CE0 56 E8 2A FD FF FF 8B F8 8B 44 24 18 83 00 FF 8B V.*......D$.....
006F2CF0 44 24 18 83 C4 08 83 38 00 75 0C 8B 50 04 50 8B D$.....8.u..P.P.
006F2D00 42 18 FF D0 83 C4 04 85 FF 0F 8C D1 00 00 00 83 B...............
006F2D10 C3 01 3B 5D 08 7C AD 68 C0 7F 8C 00 E8 9F 9D FF ..;].|.h........
006F2D20 FF 83 C4 04 85 C0 89 44 24 10 0F 84 B0 00 00 00 .......D$.......
006F2D30 8B 4E 0C 8B 01 50 8D 54 24 14 52 89 44 24 1C E8 .N...P.T$.R.D$..
006F2D40 7C 97 FF FF 8B 46 0C 8B 4C 24 18 83 C4 08 89 08 |....F..L$......
006F2D50 83 7C 24 10 00 0F 84 85 00 00 00 68 C8 A2 8A 00 .|$........h....
006F2D60 E8 5B 9D FF FF 83 C4 04 85 C0 89 44 24 10 74 70 .[.........D$.tp
006F2D70 8B 56 08 8B 4E 0C 8B 54 91 FC 50 8D 44 24 18 50 .V..N..T..P.D$.P
006F2D80 89 54 24 1C E8 37 97 FF FF 8B 4E 08 8B 56 0C 8B .T$..7....N..V..
006F2D90 44 24 1C 83 C4 08 89 44 8A FC 83 7C 24 14 00 74 D$.....D...|$..t
006F2DA0 3F 68 D0 A2 8A 00 E8 15 9D FF FF 83 C4 04 85 C0 ?h..............
006F2DB0 89 44 24 10 74 2A 56 50 E8 93 B8 FF FF 89 44 24 .D$.t*VP......D$
006F2DC0 20 8B 44 24 18 83 00 FF 8B 44 24 18 83 C4 08 83  .D$.....D$.....
006F2DD0 38 00 75 0C 8B 48 04 8B 51 18 50 FF D2 83 C4 04 8.u..H..Q.P.....
006F2DE0 83 06 FF 5F 75 0C 8B 46 04 8B 48 18 56 FF D1 83 ..._u..F..H.V...
006F2DF0 C4 04 5E 55 E8 C7 BF FE FF 8B 44 24 14 83 C4 04 ..^U......D$....
006F2E00 5D 5B 83 C4 0C C3 CC CC CC CC CC CC CC CC CC CC ][..............
006F2E10 53 8B 5C 24 0C 56 57 8B 7C 24 10 33 F6 33 C0 90 S.\$.VW.|$.3.3..
006F2E20 3B 77 08 7D 19 8B 47 0C 8B 0C B0 6A 02 51 53 E8 ;w.}..G....j.QS.
006F2E30 6C C7 FE FF 83 C4 0C 83 C6 01 85 C0 74 E2 5F 5E l...........t._^
006F2E40 5B C3 CC CC CC CC CC CC CC CC CC CC CC CC CC CC [...............
006F2E50 8B 44 24 08 85 C0 7C 19 8B 54 24 04 3B 42 08 7D .D$...|..T$.;B.}
006F2E60 10 8B 4A 0C 8B 0C 81 83 01 01 8B 52 0C 8B 04 82 ..J........R....
006F2E70 C3 A1 84 CB A6 00 85 C0 75 12 68 90 50 8D 00 E8 ........u.h.P...
006F2E80 3C 9C FF FF 83 C4 04 A3 84 CB A6 00 50 A1 A4 7C <...........P..|
006F2E90 A1 00 50 E8 F8 DF FE FF 83 C4 08 33 C0 C3 CC CC ..P........3....

;; fn006F2EA0: 006F2EA0
;;   Called from:
;;     006F3202 (in fn006F31C0)
fn006F2EA0 proc
	push	ebx
	mov	ebx,[esp+8h]
	push	esi
	mov	esi,[esp+10h]
	test	esi,esi
	push	edi
	jge	6F2EB3h

l006F2EAF:
	xor	esi,esi
	jmp	6F2EBCh

l006F2EB3:
	mov	eax,[ebx+8h]
	cmp	esi,eax
	jle	6F2EBCh

l006F2EBA:
	mov	esi,eax

l006F2EBC:
	mov	eax,[esp+18h]
	cmp	eax,esi
	jge	6F2EC8h

l006F2EC4:
	mov	eax,esi
	jmp	6F2ED1h

l006F2EC8:
	mov	ecx,[ebx+8h]
	cmp	eax,ecx
	jle	6F2ED1h

l006F2ECF:
	mov	eax,ecx

l006F2ED1:
	sub	eax,esi
	mov	edi,eax
	push	edi
	call	6F2650h
	add	esp,4h
	test	eax,eax
	jnz	6F2EE6h

l006F2EE2:
	pop	edi
	pop	esi
	pop	ebx
	ret

l006F2EE6:
	test	edi,edi
	mov	ecx,[ebx+0Ch]
	mov	edx,[eax+0Ch]
	lea	esi,[ecx+esi*4]
	jle	6F2F05h

l006F2EF3:
	sub	esi,edx

l006F2EF5:
	mov	ecx,[esi+edx]
	add	dword ptr [ecx],1h
	mov	[edx],ecx
	add	edx,4h
	sub	edi,1h
	jnz	6F2EF5h

l006F2F05:
	pop	edi
	pop	esi
	pop	ebx
	ret
006F2F09                            CC CC CC CC CC CC CC          .......
006F2F10 56 8B 74 24 08 8B 46 04 3D F0 BA A1 00 74 28 68 V.t$..F.=....t(h
006F2F20 F0 BA A1 00 50 E8 46 27 FE FF 83 C4 08 85 C0 75 ....P.F'.......u
006F2F30 16 68 BC 01 00 00 68 78 50 8D 00 E8 80 EE FE FF .h....hxP.......
006F2F40 83 C4 08 33 C0 5E C3 8B 44 24 10 8B 4C 24 0C 50 ...3.^..D$..L$.P
006F2F50 51 56 E8 49 FF FF FF 83 C4 0C 5E C3 CC CC CC CC QV.I......^.....
006F2F60 55 8B 6C 24 0C 8B 45 04 3D F0 BA A1 00 74 31 68 U.l$..E.=....t1h
006F2F70 F0 BA A1 00 50 E8 F6 26 FE FF 83 C4 08 85 C0 75 ....P..&.......u
006F2F80 1F 8B 45 04 8B 48 0C 8B 15 7C 6B A1 00 51 68 EC ..E..H...|k..Qh.
006F2F90 50 8D 00 52 E8 37 E6 FE FF 83 C4 0C 33 C0 5D C3 P..R.7......3.].
006F2FA0 8B 45 08 56 8B 74 24 0C 03 46 08 79 07 5E 5D E9 .E.V.t$..F.y.^].
006F2FB0 5C E2 FE FF 50 E8 96 F6 FF FF 83 C4 04 85 C0 75 \...P..........u
006F2FC0 03 5E 5D C3 8B 50 0C 53 8B 5E 0C 57 33 FF 39 7E .^]..P.S.^.W3.9~
006F2FD0 08 7E 15 2B DA 8B 0C 13 83 01 01 89 0A 83 C7 01 .~.+............
006F2FE0 83 C2 04 3B 7E 08 7C ED 8B 4E 08 8B 50 0C 8B 7D ...;~.|..N..P..}
006F2FF0 0C 33 F6 39 75 08 8D 14 8A 7E 18 2B FA 8D 49 00 .3.9u....~.+..I.
006F3000 8B 0C 3A 83 01 01 89 0A 83 C6 01 83 C2 04 3B 75 ..:...........;u
006F3010 08 7C ED 5F 5B 5E 5D C3 CC CC CC CC CC CC CC CC .|._[^].........
006F3020 53 8B 5C 24 0C 55 56 57 8B 7C 24 14 8B 77 08 33 S.\$.UVW.|$..w.3
006F3030 ED 3B DD 0F 4C DD 8B CE 0F AF CB 3B DD 74 12 8B .;..L......;.t..
006F3040 C1 99 F7 FB 3B C6 74 09 5F 5E 5D 5B E9 BF E1 FE ....;.t._^][....
006F3050 FF 3B CD 75 7E A1 80 CB A6 00 3B C5 74 17 8B 3C .;.u~.....;.t..<
006F3060 85 3C CA A6 00 83 E8 01 A3 80 CB A6 00 C7 07 01 .<..............
006F3070 00 00 00 EB 13 68 F0 BA A1 00 E8 B1 BE 00 00 8B .....h..........
006F3080 F8 83 C4 04 3B FD 74 5A 8D 77 F0 89 6F 0C 89 6F ....;.tZ.w..o..o
006F3090 08 89 6F 10 83 7E 08 FE 74 0D 68 04 0E 8D 00 E8 ..o..~..t.h.....
006F30A0 4C 56 FF FF 83 C4 04 C7 46 08 FD FF FF FF A1 58 LV......F......X
006F30B0 D5 A1 00 89 06 8B 0D 58 D5 A1 00 8B 41 04 89 46 .......X....A..F
006F30C0 04 89 30 8B 15 58 D5 A1 00 8B C7 5F 89 72 04 5E ..0..X....._.r.^
006F30D0 5D 5B C3 51 E8 77 F5 FF FF 8B E8 83 C4 04 85 ED ][.Q.w..........
006F30E0 75 07 5F 5E 5D 33 C0 5B C3 8B 4F 08 83 F9 01 8B u._^]3.[..O.....
006F30F0 75 0C 8B 47 0C 75 1D 8B 10 33 C9 85 DB 7E 3B 90 u..G.u...3...~;.
006F3100 89 14 8E 83 02 01 83 C1 01 3B CB 7C F3 5F 5E 8B .........;.|._^.
006F3110 C5 5D 5B C3 85 DB 7E 22 33 D2 85 C9 7E 17 8B FF .][...~"3...~...
006F3120 8B 0C 90 89 0E 83 01 01 8B 4F 08 83 C2 01 83 C6 .........O......
006F3130 04 3B D1 7C EB 83 EB 01 75 DE 5F 5E 8B C5 5D 5B .;.|....u._^..][
006F3140 C3 CC CC CC CC CC CC CC CC CC CC CC CC CC CC CC ................

;; fn006F3150: 006F3150
;;   Called from:
;;     006F3323 (in fn006F31C0)
fn006F3150 proc
	mov	eax,[esp+4h]
	push	edi
	mov	edi,[eax+0Ch]
	test	edi,edi
	jz	6F31B0h

l006F315C:
	push	esi
	mov	esi,[eax+8h]
	sub	esi,1h
	mov	dword ptr [eax+8h],0h
	mov	dword ptr [eax+0Ch],0h
	mov	dword ptr [eax+10h],0h
	js	6F31A5h

l006F317A:
	lea	ebx,[ebx+0h]

l006F3180:
	cmp	dword ptr [edi+esi*4],0h
	jz	6F31A0h

l006F3186:
	mov	eax,[edi+esi*4]
	add	dword ptr [eax],0FFh
	mov	eax,[edi+esi*4]
	cmp	dword ptr [eax],0h
	jnz	6F31A0h

l006F3194:
	mov	ecx,[eax+4h]
	mov	edx,[ecx+18h]
	push	eax
	call	edx
	add	esp,4h

l006F31A0:
	sub	esi,1h
	jns	6F3180h

l006F31A5:
	push	edi
	call	dword ptr [8A45D4h]
	add	esp,4h
	pop	esi

l006F31B0:
	xor	eax,eax
	pop	edi
	ret
006F31B4             CC CC CC CC CC CC CC CC CC CC CC CC     ............

;; fn006F31C0: 006F31C0
;;   Called from:
;;     006F3227 (in fn006F31C0)
;;     006F34F8 (in fn006F34B0)
fn006F31C0 proc
	sub	esp,38h
	push	ebx
	mov	ebx,[esp+40h]
	push	ebp
	lea	eax,[esp+20h]
	push	esi
	mov	[esp+0Ch],eax
	mov	eax,[esp+54h]
	xor	esi,esi
	xor	edx,edx
	cmp	eax,esi
	push	edi
	mov	[esp+18h],esi
	mov	[esp+14h],edx
	mov	dword ptr [esp+20h],0FFFFFFFFh
	jnz	6F31F8h

l006F31EF:
	mov	[esp+58h],esi
	jmp	6F32C6h

l006F31F8:
	cmp	ebx,eax
	jnz	6F324Ch

l006F31FC:
	mov	ecx,[eax+8h]
	push	ecx
	push	esi
	push	eax
	call	6F2EA0h
	mov	edi,eax
	add	esp,0Ch
	cmp	edi,esi
	jnz	6F321Bh

l006F3210:
	pop	edi
	pop	esi
	pop	ebp
	or	eax,0FFh
	pop	ebx
	add	esp,38h
	ret

l006F321B:
	mov	edx,[esp+54h]
	mov	eax,[esp+50h]
	push	edi
	push	edx
	push	eax
	push	ebx
	call	6F31C0h
	add	esp,10h
	add	dword ptr [edi],0FFh
	mov	esi,eax
	jnz	6F3242h

l006F3236:
	mov	ecx,[edi+4h]
	mov	edx,[ecx+18h]
	push	edi
	call	edx
	add	esp,4h

l006F3242:
	pop	edi
	mov	eax,esi
	pop	esi
	pop	ebp
	pop	ebx
	add	esp,38h
	ret

l006F324C:
	push	8D5120h
	push	eax
	call	704DA0h
	mov	edi,eax
	add	esp,8h
	cmp	edi,esi
	mov	[esp+14h],edi
	jz	6F3391h

l006F3268:
	mov	eax,[edi+4h]
	cmp	eax,0A1BAF0h
	jz	6F328Dh

l006F3272:
	push	0A1BAF0h
	push	eax
	call	6D5670h
	add	esp,8h
	test	eax,eax
	jnz	6F328Dh

l006F3284:
	mov	eax,[edi+8h]
	mov	[esp+58h],eax
	jmp	6F3294h

l006F328D:
	mov	ecx,[edi+8h]
	mov	[esp+58h],ecx

l006F3294:
	mov	eax,[edi+4h]
	cmp	eax,0A1BAF0h
	jz	6F32BDh

l006F329E:
	push	0A1BAF0h
	push	eax
	call	6D5670h
	add	esp,8h
	test	eax,eax
	jnz	6F32BDh

l006F32B0:
	mov	edx,[esp+14h]
	add	edi,0Ch
	mov	[esp+18h],edi
	jmp	6F32C6h

l006F32BD:
	mov	edx,[edi+0Ch]
	mov	[esp+18h],edx
	mov	edx,edi

l006F32C6:
	mov	ecx,[esp+50h]
	cmp	ecx,esi
	jge	6F32D6h

l006F32CE:
	mov	[esp+50h],esi
	mov	ecx,esi
	jmp	6F32E3h

l006F32D6:
	mov	eax,[ebx+8h]
	cmp	ecx,eax
	jle	6F32E3h

l006F32DD:
	mov	[esp+50h],eax
	mov	ecx,eax

l006F32E3:
	mov	ebp,[esp+54h]
	cmp	ebp,ecx
	jge	6F32EFh

l006F32EB:
	mov	ebp,ecx
	jmp	6F32F8h

l006F32EF:
	mov	eax,[ebx+8h]
	cmp	ebp,eax
	jle	6F32F8h

l006F32F6:
	mov	ebp,eax

l006F32F8:
	mov	edi,[esp+58h]
	mov	esi,[ebx+8h]
	mov	eax,ebp
	sub	eax,ecx
	sub	edi,eax
	add	esi,edi
	mov	[esp+1Ch],eax
	jnz	6F3333h

l006F330D:
	test	edx,edx
	jz	6F3322h

l006F3311:
	add	dword ptr [edx],0FFh
	jnz	6F3322h

l006F3316:
	mov	eax,[edx+4h]
	mov	ecx,[eax+18h]
	push	edx
	call	ecx
	add	esp,4h

l006F3322:
	push	ebx
	call	6F3150h
	add	esp,4h
	pop	edi
	pop	esi
	pop	ebp
	pop	ebx
	add	esp,38h
	ret

l006F3333:
	mov	esi,[ebx+0Ch]
	lea	edx,[0000h+eax*4]
	cmp	edx,20h
	jbe	6F33A5h

l006F3342:
	test	edx,edx
	jnz	6F334Bh

l006F3346:
	mov	edx,1h

l006F334B:
	push	edx
	call	dword ptr [8A45BCh]
	add	esp,4h
	test	eax,eax
	mov	[esp+10h],eax
	jnz	6F339Dh

l006F335D:
	call	6E1210h

l006F3362:
	mov	edi,[esp+10h]

l006F3366:
	lea	eax,[esp+28h]
	cmp	edi,eax
	jz	6F3378h

l006F336E:
	push	edi
	call	dword ptr [8A45D4h]
	add	esp,4h

l006F3378:
	mov	eax,[esp+14h]
	test	eax,eax
	jz	6F3391h

l006F3380:
	add	dword ptr [eax],0FFh
	jnz	6F3391h

l006F3385:
	mov	ecx,[eax+4h]
	mov	edx,[ecx+18h]
	push	eax
	call	edx
	add	esp,4h

l006F3391:
	mov	eax,[esp+20h]
	pop	edi
	pop	esi
	pop	ebp
	pop	ebx
	add	esp,38h
	ret

l006F339D:
	mov	ecx,[esp+50h]
	mov	eax,[esp+1Ch]

l006F33A5:
	add	eax,eax
	add	eax,eax
	push	eax
	mov	eax,[esp+14h]
	lea	edx,[esi+ecx*4]
	push	edx
	push	eax
	call	695030h
	add	esp,0Ch
	test	edi,edi
	jge	6F33ECh

l006F33BF:
	mov	ecx,[ebx+8h]
	sub	ecx,ebp
	add	ecx,ecx
	add	ecx,ecx
	push	ecx
	lea	edx,[esi+ebp*4]
	lea	eax,[edi+ebp]
	push	edx
	lea	ecx,[esi+eax*4]
	push	ecx
	call	dword ptr [8A4590h]
	mov	esi,[ebx+8h]
	add	esp,0Ch
	add	esi,edi
	call	6F2590h
	mov	esi,[ebx+0Ch]
	jmp	6F3426h

l006F33EC:
	jle	6F3426h

l006F33EE:
	mov	eax,[ebx+8h]
	lea	esi,[eax+edi]
	mov	[esp+24h],eax
	call	6F2590h
	test	eax,eax
	jl	6F3362h

l006F3405:
	mov	eax,[esp+24h]
	mov	esi,[ebx+0Ch]
	sub	eax,ebp
	add	eax,eax
	add	eax,eax
	push	eax
	lea	edx,[esi+ebp*4]
	add	edi,ebp
	push	edx
	lea	eax,[esi+edi*4]
	push	eax
	call	dword ptr [8A4590h]
	add	esp,0Ch

l006F3426:
	mov	edx,[esp+58h]
	xor	ecx,ecx
	test	edx,edx
	jle	6F3451h

l006F3430:
	mov	eax,[esp+50h]
	lea	esi,[esi+eax*4]

l006F3437:
	mov	eax,[esp+18h]
	mov	eax,[eax+ecx*4]
	test	eax,eax
	jz	6F3445h

l006F3442:
	add	dword ptr [eax],1h

l006F3445:
	mov	[esi],eax
	add	ecx,1h
	add	esi,4h
	cmp	ecx,edx
	jl	6F3437h

l006F3451:
	mov	esi,[esp+1Ch]
	add	esi,0FFh
	js	6F3494h

l006F345A:
	lea	ebx,[ebx+0h]

l006F3460:
	mov	edi,[esp+10h]
	mov	eax,[edi+esi*4]
	test	eax,eax
	jz	6F3482h

l006F346B:
	add	dword ptr [eax],0FFh
	mov	eax,[edi+esi*4]
	cmp	dword ptr [eax],0h
	jnz	6F3482h

l006F3476:
	mov	ecx,[eax+4h]
	mov	edx,[ecx+18h]
	push	eax
	call	edx
	add	esp,4h

l006F3482:
	sub	esi,1h
	jns	6F3460h

l006F3487:
	mov	dword ptr [esp+20h],0h
	jmp	6F3366h

l006F3494:
	mov	edi,[esp+10h]
	mov	dword ptr [esp+20h],0h
	jmp	6F3366h
006F34A5                CC CC CC CC CC CC CC CC CC CC CC      ...........

;; fn006F34B0: 006F34B0
;;   Called from:
;;     00740D8F (in fn00740D60)
fn006F34B0 proc
	push	esi
	mov	esi,[esp+8h]
	mov	eax,[esi+4h]
	cmp	eax,0A1BAF0h
	jz	6F34E8h

l006F34BF:
	push	0A1BAF0h
	push	eax
	call	6D5670h
	add	esp,8h
	test	eax,eax
	jnz	6F34E8h

l006F34D1:
	push	294h
	push	8D5078h
	call	6E1DC0h
	add	esp,8h
	or	eax,0FFh
	pop	esi
	ret

l006F34E8:
	mov	eax,[esp+14h]
	mov	ecx,[esp+10h]
	mov	edx,[esp+0Ch]
	push	eax
	push	ecx
	push	edx
	push	esi
	call	6F31C0h
	add	esp,10h
	pop	esi
	ret
006F3502       CC CC CC CC CC CC CC CC CC CC CC CC CC CC   ..............
006F3510 53 8B 5C 24 08 55 57 8B 7B 08 85 FF 74 14 8B 6C S.\$.UW.{...t..l
006F3520 24 14 83 FD 01 74 0B 7D 12 53 E8 21 FC FF FF 83 $....t.}.S.!....
006F3530 C4 04 83 03 01 5F 5D 8B C3 5B C3 B8 FF FF FF 7F ....._]..[......
006F3540 99 F7 FD 3B F8 7E 08 5F 5D 5B E9 C1 DC FE FF 56 ...;.~._][.....V
006F3550 8B F7 0F AF F5 E8 36 F0 FF FF 83 F8 FF 75 07 5E ......6......u.^
006F3560 5F 5D 33 C0 5B C3 83 FD 01 8B 73 0C 8B D7 7E 28 _]3.[.....s...~(
006F3570 83 C5 FF 33 C9 85 FF 7E 1A 8D A4 24 00 00 00 00 ...3...~...$....
006F3580 8B 04 8E 83 00 01 89 04 96 83 C1 01 83 C2 01 3B ...............;
006F3590 CF 7C ED 83 ED 01 75 DB 83 03 01 5E 5F 5D 8B C3 .|....u....^_]..
006F35A0 5B C3 CC CC CC CC CC CC CC CC CC CC CC CC CC CC [...............
006F35B0 8B 44 24 08 85 C0 7C 42 8B 54 24 04 3B 42 08 7D .D$...|B.T$.;B.}
006F35C0 39 8B 4C 24 0C 85 C9 75 10 51 8D 48 01 51 50 52 9.L$...u.Q.H.QPR
006F35D0 E8 EB FB FF FF 83 C4 10 C3 83 01 01 8B 52 0C 8D .............R..
006F35E0 14 82 8B 02 89 0A 83 00 FF 75 0C 8B 48 04 8B 51 .........u..H..Q
006F35F0 18 50 FF D2 83 C4 04 33 C0 C3 A1 A4 7C A1 00 68 .P.....3....|..h
006F3600 A8 50 8D 00 50 E8 76 D9 FE FF 83 C4 08 83 C8 FF .P..P.v.........
006F3610 C3 CC CC CC CC CC CC CC CC CC CC CC CC CC CC CC ................
006F3620 8B 54 24 08 83 EC 08 8D 04 24 50 8D 4C 24 08 51 .T$......$P.L$.Q
006F3630 68 3C 51 8D 00 52 E8 45 46 FF FF 83 C4 10 85 C0 h<Q..R.EF.......
006F3640 74 28 8B 04 24 8B 4C 24 0C 50 8B 44 24 08 E8 7D t(..$.L$.P.D$..}
006F3650 F2 FF FF 83 C4 04 85 C0 75 10 83 05 B8 63 A1 00 ........u....c..
006F3660 01 B8 B8 63 A1 00 83 C4 08 C3 33 C0 83 C4 08 C3 ...c......3.....
006F3670 53 8B 5C 24 08 57 8B 7B 08 81 FF FF FF FF 7F 75 S.\$.W.{.......u
006F3680 18 A1 98 85 A1 00 68 CC 50 8D 00 50 E8 EF D8 FE ......h.P..P....
006F3690 FF 83 C4 08 5F 33 C0 5B C3 56 8D 77 01 E8 EE EE ...._3.[.V.w....
006F36A0 FF FF 83 F8 FF 5E 74 EC 8B 44 24 10 83 00 01 8B .....^t..D$.....
006F36B0 4B 0C 89 04 B9 83 05 B8 63 A1 00 01 5F B8 B8 63 K.......c..._..c
006F36C0 A1 00 5B C3 CC CC CC CC CC CC CC CC CC CC CC CC ..[.............

l006F36D0:
	push	ebx
	mov	ebx,[esp+8h]
	push	ebp
	push	esi
	mov	esi,[esp+14h]
	mov	eax,[esi+4h]
	cmp	eax,0A1BAF0h
	push	edi
	jz	6F3840h

l006F36EA:
	cmp	eax,0A16588h
	jz	6F3840h

l006F36F5:
	cmp	ebx,esi
	jz	6F3840h

l006F36FD:
	push	esi
	call	704B00h
	mov	edi,eax
	add	esp,4h
	test	edi,edi
	jz	6F38BDh

l006F3710:
	mov	eax,[edi+4h]
	mov	ecx,[eax+70h]
	push	esi
	mov	[esp+1Ch],ecx
	call	7040D0h
	add	esp,4h
	test	eax,eax
	jge	6F377Bh

l006F3727:
	call	6E0FC0h
	test	eax,eax
	jz	6F3771h

l006F3730:
	mov	edx,[0A16B7Ch]
	push	edx
	call	6E1110h
	add	esp,4h
	test	eax,eax
	jnz	6F3771h

l006F3743:
	mov	eax,[0A178F0h]
	push	eax
	call	6E1110h
	add	esp,4h
	test	eax,eax
	jnz	6F3771h

l006F3755:
	add	dword ptr [edi],0FFh
	jnz	6F38BDh

l006F375E:
	mov	ecx,[edi+4h]
	mov	edx,[ecx+18h]
	push	edi
	call	edx
	add	esp,4h
	pop	edi
	pop	esi
	pop	ebp
	xor	eax,eax
	pop	ebx
	ret

l006F3771:
	call	6E1160h
	mov	eax,8h

l006F377B:
	mov	ebp,[ebx+8h]
	lea	esi,[eax+ebp]
	cmp	esi,ebp
	jl	6F3792h

l006F3785:
	call	6F2590h
	cmp	eax,0FFh
	jz	6F3755h

l006F378F:
	mov	[ebx+8h],ebp

l006F3792:
	push	edi
	call	dword ptr [esp+1Ch]
	mov	esi,eax
	add	esp,4h
	test	esi,esi
	jz	6F37E8h

l006F37A0:
	mov	eax,[ebx+8h]
	cmp	eax,[ebx+10h]
	jge	6F37B4h

l006F37A8:
	mov	ecx,[ebx+0Ch]
	mov	[ecx+eax*4],esi
	add	dword ptr [ebx+8h],1h
	jmp	6F37DAh

l006F37B4:
	push	esi
	mov	eax,ebx
	call	6F29C0h
	add	esp,4h
	add	dword ptr [esi],0FFh
	mov	ebp,eax
	jnz	6F37D2h

l006F37C6:
	mov	edx,[esi+4h]
	mov	eax,[edx+18h]
	push	esi
	call	eax
	add	esp,4h

l006F37D2:
	test	ebp,ebp
	jl	6F3755h

l006F37DA:
	push	edi
	call	dword ptr [esp+1Ch]
	mov	esi,eax
	add	esp,4h
	test	esi,esi
	jnz	6F37A0h

l006F37E8:
	call	6E0FC0h
	test	eax,eax
	jz	6F380Dh

l006F37F1:
	mov	ecx,[0A16D00h]
	push	ecx
	call	6E1110h
	add	esp,4h
	test	eax,eax
	jz	6F3755h

l006F3808:
	call	6E1160h

l006F380D:
	mov	esi,[ebx+8h]
	cmp	esi,[ebx+10h]
	jge	6F381Ah

l006F3815:
	call	6F2590h

l006F381A:
	add	dword ptr [edi],0FFh
	jnz	6F3919h

l006F3823:
	mov	edx,[edi+4h]
	mov	eax,[edx+18h]
	push	edi
	call	eax
	add	esp,4h
	add	dword ptr [0A163B8h],1h
	pop	edi
	pop	esi
	pop	ebp
	mov	eax,0A163B8h
	pop	ebx
	ret

l006F3840:
	push	8D5148h
	push	esi
	call	704DA0h
	mov	edi,eax
	add	esp,8h
	test	edi,edi
	jz	6F38BDh

l006F3854:
	mov	eax,[edi+4h]
	cmp	eax,0A1BAF0h
	jz	6F386Ch

l006F385E:
	push	0A1BAF0h
	push	eax
	call	6D5670h
	add	esp,8h

l006F386C:
	mov	ebp,[edi+8h]
	test	ebp,ebp
	jnz	6F3899h

l006F3873:
	add	dword ptr [edi],0FFh
	jnz	6F3919h

l006F387C:
	mov	eax,[edi+4h]
	mov	ecx,[eax+18h]
	push	edi
	call	ecx
	add	esp,4h
	add	dword ptr [0A163B8h],1h
	pop	edi
	pop	esi
	pop	ebp
	mov	eax,0A163B8h
	pop	ebx
	ret

l006F3899:
	mov	eax,[ebx+8h]
	lea	esi,[eax+ebp]
	mov	[esp+18h],eax
	call	6F2590h
	cmp	eax,0FFh
	jnz	6F38C4h

l006F38AD:
	add	[edi],eax
	jnz	6F38BDh

l006F38B1:
	mov	edx,[edi+4h]
	mov	eax,[edx+18h]
	push	edi
	call	eax
	add	esp,4h

l006F38BD:
	pop	edi
	pop	esi
	pop	ebp
	xor	eax,eax
	pop	ebx
	ret

l006F38C4:
	mov	eax,[edi+4h]
	cmp	eax,0A1BAF0h
	jz	6F38E3h

l006F38CE:
	push	0A1BAF0h
	push	eax
	call	6D5670h
	add	esp,8h
	test	eax,eax
	lea	edx,[edi+0Ch]
	jz	6F38E6h

l006F38E3:
	mov	edx,[edi+0Ch]

l006F38E6:
	test	ebp,ebp
	mov	ecx,[ebx+0Ch]
	mov	eax,[esp+18h]
	lea	ecx,[ecx+eax*4]
	jle	6F3908h

l006F38F4:
	sub	edx,ecx
	mov	esi,ebp

l006F38F8:
	mov	eax,[edx+ecx]
	add	dword ptr [eax],1h
	mov	[ecx],eax
	add	ecx,4h
	sub	esi,1h
	jnz	6F38F8h

l006F3908:
	add	dword ptr [edi],0FFh
	jnz	6F3919h

l006F390D:
	mov	ecx,[edi+4h]
	mov	edx,[ecx+18h]
	push	edi
	call	edx
	add	esp,4h

l006F3919:
	add	dword ptr [0A163B8h],1h
	pop	edi
	pop	esi
	pop	ebp
	mov	eax,0A163B8h
	pop	ebx
	ret
006F392A                               CC CC CC CC CC CC           ......

;; fn006F3930: 006F3930
;;   Called from:
;;     007035FC (in fn007035C0)
fn006F3930 proc
	jmp	6F36D0h
006F3935                CC CC CC CC CC CC CC CC CC CC CC      ...........
006F3940 8B 44 24 08 56 8B 74 24 08 50 56 E8 80 FD FF FF .D$.V.t$.PV.....
006F3950 83 C4 08 85 C0 75 02 5E C3 83 00 FF 75 0C 8B 48 .....u.^....u..H
006F3960 04 8B 51 18 50 FF D2 83 C4 04 83 06 01 8B C6 5E ..Q.P..........^
006F3970 C3 CC CC CC CC CC CC CC CC CC CC CC CC CC CC CC ................
006F3980 51 8B 4C 24 0C 8D 04 24 50 68 90 51 8D 00 51 C7 Q.L$...$Ph.Q..Q.
006F3990 44 24 0C FF FF FF FF E8 E4 42 FF FF 83 C4 0C 85 D$.......B......
006F39A0 C0 75 02 59 C3 53 8B 5C 24 0C 8B 4B 08 85 C9 75 .u.Y.S.\$..K...u
006F39B0 07 68 7C 51 8D 00 EB 52 8B 44 24 04 85 C0 7D 08 .h|Q...R.D$...}.
006F39C0 03 C1 89 44 24 04 78 3D 3B C1 7D 39 8B 53 0C 56 ...D$.x=;.}9.S.V
006F39D0 8D 71 FF 3B C6 57 8B 3C 82 75 0C E8 B0 EB FF FF .q.;.W.<.u......
006F39E0 8B C7 5F 5E 5B 59 C3 83 07 01 8B 44 24 0C 6A 00 .._^[Y.....D$.j.
006F39F0 8D 48 01 51 50 53 E8 C5 F7 FF FF 83 C4 10 8B C7 .H.QPS..........
006F3A00 5F 5E 5B 59 C3 68 64 51 8D 00 8B 15 A4 7C A1 00 _^[Y.hdQ.....|..
006F3A10 52 E8 6A D5 FE FF 83 C4 08 33 C0 5B 59 C3 CC CC R.j......3.[Y...
006F3A20 56 57 6A 02 8B F8 E8 F5 C2 FE FF 8B F0 83 C4 04 VWj.............
006F3A30 85 F6 74 74 83 03 01 8B 44 24 0C 83 07 01 6A 00 ..tt....D$....j.
006F3A40 56 50 89 5E 0C 89 7E 10 E8 C3 FC 00 00 83 C4 0C VP.^..~.........
006F3A50 83 06 FF 8B F8 75 0C 8B 4E 04 8B 51 18 56 FF D2 .....u..N..Q.V..
006F3A60 83 C4 04 85 FF 74 41 8B 47 04 3D E8 E7 A1 00 74 .....tA.G.=....t
006F3A70 3D 68 E8 E7 A1 00 50 E8 F4 1B FE FF 83 C4 08 85 =h....P.........
006F3A80 C0 75 2B 83 07 FF 75 0C 8B 47 04 8B 48 18 57 FF .u+...u..G..H.W.
006F3A90 D1 83 C4 04 8B 15 7C 6B A1 00 68 98 51 8D 00 52 ......|k..h.Q..R
006F3AA0 E8 DB D4 FE FF 83 C4 08 5F 83 C8 FF 5E C3 57 E8 ........_...^.W.
006F3AB0 EC 16 01 00 83 C4 04 83 07 FF 8B F0 75 0C 8B 47 ............u..G
006F3AC0 04 8B 48 18 57 FF D1 83 C4 04 33 C0 85 F6 5F 0F ..H.W.....3..._.
006F3AD0 9C C0 5E C3 CC CC CC CC CC CC CC CC CC CC CC CC ..^.............
006F3AE0 51 53 8B 5C 24 14 39 5C 24 0C 55 56 57 75 07 83 QS.\$.9\$.UVWu..
006F3AF0 C3 04 89 5C 24 20 3B 5C 24 1C 0F 83 7F 00 00 00 ...\$ ;\$.......
006F3B00 8B 0B 8B 74 24 18 8B EB 89 4C 24 10 EB 06 8B FF ...t$....L$.....
006F3B10 8B 4C 24 10 8B C5 2B C6 C1 F8 03 8D 3C 86 8B 44 .L$...+.....<..D
006F3B20 24 24 85 C0 75 0F 8B 17 50 52 51 E8 70 BA FE FF $$..u...PRQ.p...
006F3B30 83 C4 0C EB 11 50 8B 07 8B D9 E8 E1 FE FF FF 8B .....P..........
006F3B40 5C 24 24 83 C4 04 85 C0 7C 3D 74 04 8B EF EB 03 \$$.....|=t.....
006F3B50 8D 77 04 3B F5 72 B9 3B DE 8B C3 76 0F 8D 49 00 .w.;.r.;...v..I.
006F3B60 8B 48 FC 89 08 83 C0 FC 3B C6 77 F4 8B 54 24 10 .H......;.w..T$.
006F3B70 83 C3 04 3B 5C 24 1C 89 16 89 5C 24 20 72 81 5F ...;\$....\$ r._
006F3B80 5E 5D 33 C0 5B 59 C3 5F 5E 5D 83 C8 FF 5B 59 C3 ^]3.[Y._^]...[Y.
006F3B90 55 8B 6C 24 08 56 8B F0 83 C6 04 3B F5 C7 07 00 U.l$.V.....;....
006F3BA0 00 00 00 75 08 5E B8 01 00 00 00 5D C3 8B 46 FC ...u.^.....]..F.
006F3BB0 53 8B 5C 24 14 85 DB C7 44 24 10 02 00 00 00 75 S.\$....D$.....u
006F3BC0 0F 8B 0E 53 50 51 E8 D5 B9 FE FF 83 C4 0C EB 0F ...SPQ..........
006F3BD0 53 8B 1E E8 48 FE FF FF 8B 5C 24 18 83 C4 04 85 S...H....\$.....
006F3BE0 C0 0F 8C 9B 00 00 00 74 4F 83 C6 04 3B F5 C7 07 .......tO...;...
006F3BF0 01 00 00 00 73 3A 85 DB 75 12 8B 56 FC 8B 06 53 ....s:..u..V...S
006F3C00 52 50 E8 99 B9 FE FF 83 C4 0C EB 12 8B 46 FC 53 RP...........F.S
006F3C10 8B 1E E8 09 FE FF FF 8B 5C 24 18 83 C4 04 85 C0 ........\$......
006F3C20 7C 60 74 0C 83 44 24 10 01 83 C6 04 3B F5 72 C6 |`t..D$.....;.r.
006F3C30 8B 44 24 10 5B 5E 5D C3 83 C6 04 3B F5 73 F1 90 .D$.[^]....;.s..
006F3C40 85 DB 75 12 8B 4E FC 8B 16 53 51 52 E8 4F B9 FE ..u..N...SQR.O..
006F3C50 FF 83 C4 0C EB 12 8B 46 FC 53 8B 1E E8 BF FD FF .......F.S......
006F3C60 FF 8B 5C 24 18 83 C4 04 85 C0 7C 16 75 C2 83 44 ..\$......|.u..D
006F3C70 24 10 01 83 C6 04 3B F5 72 C6 8B 44 24 10 5B 5E $.....;.r..D$.[^
006F3C80 5D C3 5B 5E 83 C8 FF 5D C3 CC CC CC CC CC CC CC ].[^...]........
006F3C90 83 EC 08 8B 44 24 18 53 8B 5C 24 20 55 8B 6C 24 ....D$.S.\$ U.l$
006F3CA0 18 03 C0 03 C0 56 03 E8 85 DB 57 89 44 24 14 C7 .....V....W.D$..
006F3CB0 44 24 20 00 00 00 00 BE 01 00 00 00 75 14 8B 7C D$ .........u..|
006F3CC0 24 1C 8B 45 00 53 57 50 E8 D3 B8 FE FF 83 C4 0C $..E.SWP........
006F3CD0 EB 18 8B 44 24 1C 53 8B 5D 00 E8 41 FD FF FF 8B ...D$.S.]..A....
006F3CE0 7C 24 20 8B 5C 24 30 83 C4 04 85 C0 0F 8C 76 01 |$ .\$0.......v.
006F3CF0 00 00 74 7E 8B 44 24 24 2B 44 24 28 83 F8 01 89 ..t~.D$$+D$(....
006F3D00 44 24 10 7E 48 85 DB 75 11 8B 4C B5 00 53 57 51 D$.~H..u..L..SWQ
006F3D10 E8 8B B8 FE FF 83 C4 0C EB 13 53 8B 5C B5 00 8B ..........S.\...
006F3D20 C7 E8 FA FC FF FF 8B 5C 24 30 83 C4 04 85 C0 0F .......\$0......
006F3D30 8C 33 01 00 00 74 12 89 74 24 20 8D 74 36 01 85 .3...t..t$ .t6..
006F3D40 F6 7E 1F 3B 74 24 10 7C BC 8B 44 24 10 3B F0 7E .~.;t$.|..D$.;.~
006F3D50 02 8B F0 8B 44 24 28 01 44 24 20 03 F0 E9 8F 00 ....D$(.D$ .....
006F3D60 00 00 8B 44 24 28 8B 74 24 10 01 44 24 20 03 F0 ...D$(.t$..D$ ..
006F3D70 EB 7F 8B 44 24 28 8D 48 01 83 F9 01 7E 5A 8B FF ...D$(.H....~Z..
006F3D80 85 DB 8D 14 B5 00 00 00 00 75 13 8B C5 53 2B C2 .........u...S+.
006F3D90 8B 08 57 51 E8 07 B8 FE FF 83 C4 0C EB 15 8B CD ..WQ............
006F3DA0 2B CA 53 8B 19 8B C7 E8 74 FC FF FF 8B 5C 24 30 +.S.....t....\$0
006F3DB0 83 C4 04 85 C0 0F 8C AD 00 00 00 8B 44 24 28 75 ............D$(u
006F3DC0 17 89 74 24 20 8D 74 36 01 85 F6 7E 60 83 C0 01 ..t$ .t6...~`...
006F3DD0 3B F0 7C AC 8B 44 24 28 8D 48 01 3B F1 7E 02 8B ;.|..D$(.H.;.~..
006F3DE0 F1 8B 4C 24 20 8B D0 2B D6 2B C1 89 54 24 20 8B ..L$ ..+.+..T$ .
006F3DF0 F0 8B 44 24 20 2B 6C 24 14 83 C0 01 3B C6 89 44 ..D$ +l$....;..D
006F3E00 24 20 7D 5A 8B 44 24 20 8B FE 2B F8 D1 FF 03 F8 $ }Z.D$ ..+.....
006F3E10 8B 44 24 2C 85 C0 75 1E 8B 4C BD 00 50 8B 44 24 .D$,..u..L..P.D$
006F3E20 20 50 51 E8 78 B7 FE FF 83 C4 0C EB 1A 8B 74 24  PQ.x.........t$
006F3E30 28 83 C6 01 EB AB 8B 5C BD 00 50 8B 44 24 20 E8 (......\..P.D$ .
006F3E40 DC FB FF FF 83 C4 04 85 C0 7C 1D 74 09 83 C7 01 .........|.t....
006F3E50 89 7C 24 20 EB 02 8B F7 39 74 24 20 7C A6 5F 8B .|$ ....9t$ |._.
006F3E60 C6 5E 5D 5B 83 C4 08 C3 5F 5E 5D 83 C8 FF 5B 83 .^][...._^]...[.
006F3E70 C4 08 C3 CC CC CC CC CC CC CC CC CC CC CC CC CC ................
006F3E80 83 EC 08 53 8B D8 8B 44 24 18 55 8B 6C 24 14 03 ...S...D$.U.l$..
006F3E90 C0 56 03 C0 57 8B 7C 24 28 03 E8 85 FF 89 44 24 .V..W.|$(.....D$
006F3EA0 14 8B 45 00 C7 44 24 1C 00 00 00 00 BE 01 00 00 ..E..D$.........
006F3EB0 00 75 0D 57 50 53 E8 E5 B6 FE FF 83 C4 0C EB 09 .u.WPS..........
006F3EC0 57 E8 5A FB FF FF 83 C4 04 85 C0 0F 8C 68 01 00 W.Z..........h..
006F3ED0 00 0F 84 90 00 00 00 8B 4C 24 24 8D 41 01 83 F8 ........L$$.A...
006F3EE0 01 7E 4C 8D 0C B5 00 00 00 00 8B D5 2B D1 85 FF .~L.........+...
006F3EF0 8B 02 75 0D 57 50 53 E8 A4 B6 FE FF 83 C4 0C EB ..u.WPS.........
006F3F00 09 57 E8 19 FB FF FF 83 C4 04 85 C0 0F 8C 27 01 .W............'.
006F3F10 00 00 74 17 89 74 24 1C 8D 74 36 01 85 F6 7E 2A ..t..t$..t6...~*
006F3F20 8B 44 24 24 83 C0 01 3B F0 7C B8 8B 4C 24 24 8D .D$$...;.|..L$$.
006F3F30 41 01 3B F0 7E 02 8B F0 8B 44 24 1C 8B D1 2B D6 A.;.~....D$...+.
006F3F40 2B C8 89 54 24 1C 8B F1 EB 7C 8B 4C 24 24 8B 74 +..T$....|.L$$.t
006F3F50 24 24 8B 44 24 1C 83 C6 01 8B D1 2B D6 2B C8 89 $$.D$......+.+..
006F3F60 54 24 1C 8B F1 EB 5F 8B 44 24 20 2B 44 24 24 83 T$...._.D$ +D$$.
006F3F70 F8 01 89 44 24 10 7E 3E 85 FF 8B 44 B5 00 75 0D ...D$.~>...D..u.
006F3F80 57 50 53 E8 18 B6 FE FF 83 C4 0C EB 09 57 E8 8D WPS..........W..
006F3F90 FA FF FF 83 C4 04 85 C0 0F 8C 9B 00 00 00 75 12 ..............u.
006F3FA0 89 74 24 1C 8D 74 36 01 85 F6 7E 59 3B 74 24 10 .t$..t6...~Y;t$.
006F3FB0 7C C6 8B 44 24 10 3B F0 7E 02 8B F0 8B 44 24 24 |..D$.;.~....D$$
006F3FC0 01 44 24 1C 03 F0 8B 44 24 1C 2B 6C 24 14 83 C0 .D$....D$.+l$...
006F3FD0 01 3B C6 89 44 24 1C 7D 56 8D A4 24 00 00 00 00 .;..D$.}V..$....
006F3FE0 8B 44 24 1C 8B FE 2B F8 D1 FF 03 F8 8B 44 24 28 .D$...+......D$(
006F3FF0 85 C0 75 17 8B 4C BD 00 50 51 53 E8 A0 B5 FE FF ..u..L..PQS.....
006F4000 83 C4 0C EB 13 8B 74 24 10 EB B1 50 8B 44 BD 00 ......t$...P.D..
006F4010 E8 0B FA FF FF 83 C4 04 85 C0 7C 1D 74 04 8B F7 ..........|.t...
006F4020 EB 07 83 C7 01 89 7C 24 1C 39 74 24 1C 7C B1 5F ......|$.9t$.|._
006F4030 8B C6 5E 5D 5B 83 C4 08 C3 5F 5E 5D 83 C8 FF 5B ..^][...._^]...[
006F4040 83 C4 08 C3 CC CC CC CC CC CC CC CC CC CC CC CC ................
006F4050 3B 5E 0C 7F 03 33 C0 C3 8B 46 08 57 8D BE BC 02 ;^...3...F.W....
006F4060 00 00 3B C7 74 09 50 E8 A4 AC FE FF 83 C4 04 81 ..;.t.P.........
006F4070 FB FF FF FF 1F 89 7E 08 C7 46 0C 00 01 00 00 76 ......~..F.....v
006F4080 0A E8 8A D1 FE FF 83 C8 FF 5F C3 8D 04 9D 00 00 ........._......
006F4090 00 00 50 E8 38 AC FE FF 83 C4 04 85 C0 89 46 08 ..P.8.........F.
006F40A0 74 07 89 5E 0C 33 C0 5F C3 E8 62 D1 FE FF 8B 46 t..^.3._..b....F
006F40B0 08 3B C7 74 09 50 E8 55 AC FE FF 83 C4 04 89 7E .;.t.P.U.......~
006F40C0 08 C7 46 0C 00 01 00 00 83 C8 FF 5F C3 CC CC CC ..F........_....
006F40D0 83 EC 14 53 8B 5C 24 20 55 8B 6C 24 28 56 8B 74 ...S.\$ U.l$(V.t
006F40E0 24 24 3B 5E 0C 57 8B F8 8B 46 04 C7 44 24 20 FF $$;^.W...F..D$ .
006F40F0 FF FF FF 89 44 24 10 7E 14 E8 52 FF FF FF 85 C0 ....D$.~..R.....
006F4100 7D 0B 5F 5E 5D 83 C8 FF 5B 83 C4 14 C3 8B 56 08 }._^]...[.....V.
006F4110 8D 0C 9D 00 00 00 00 51 57 52 E8 11 0F FA FF 8B .......QWR......
006F4120 4D 00 8B C6 8B 70 08 89 0F B9 01 00 00 00 83 C4 M....p..........
006F4130 0C 83 C7 04 83 C5 04 29 4C 24 34 0F 84 DE 01 00 .......)L$4.....
006F4140 00 3B D9 0F 84 FF 01 00 00 8B 18 89 5C 24 1C 90 .;..........\$..
006F4150 33 C0 89 44 24 14 89 44 24 18 8D 9B 00 00 00 00 3..D$..D$.......
006F4160 85 DB 75 12 8B 16 8B 45 00 53 52 50 E8 2F B4 FE ..u....E.SRP./..
006F4170 FF 83 C4 0C EB 12 8B 06 53 8B 5D 00 E8 9F F8 FF ........S.].....
006F4180 FF 8B 5C 24 20 83 C4 04 33 C9 3B C1 74 37 0F 8C ..\$ ...3.;.t7..
006F4190 8F 01 00 00 8B 55 00 B8 01 00 00 00 01 44 24 18 .....U.......D$.
006F41A0 89 17 83 C7 04 83 C5 04 29 44 24 34 89 4C 24 14 ........)D$4.L$.
006F41B0 0F 84 69 01 00 00 8B 44 24 10 39 44 24 18 7C A0 ..i....D$.9D$.|.
006F41C0 83 C0 01 EB 46 8B 06 83 44 24 14 01 89 07 8B 44 ....F...D$.....D
006F41D0 24 2C 83 E8 01 83 C7 04 83 C6 04 83 F8 01 89 4C $,.............L
006F41E0 24 18 89 44 24 2C 0F 84 5C 01 00 00 8B 4C 24 14 $..D$,..\....L$.
006F41F0 3B 4C 24 10 0F 8C 66 FF FF FF 8B 44 24 10 83 C0 ;L$...f....D$...
006F4200 01 EB 08 8B 5C 24 1C 8B 44 24 10 8B 4C 24 28 33 ....\$..D$..L$(3
006F4210 D2 83 F8 01 0F 9F C2 53 6A 00 2B C2 8B 54 24 34 .......Sj.+..T$4
006F4220 52 89 44 24 1C 89 41 04 8B 45 00 56 E8 4F FC FF R.D$..A..E.V.O..
006F4230 FF 8B D8 83 C4 10 85 DB 89 5C 24 14 74 3E 0F 8C .........\$.t>..
006F4240 DF 00 00 00 8D 04 9D 00 00 00 00 50 56 57 E8 DD ...........PVW..
006F4250 0D FA FF 8D 04 9D 00 00 00 00 03 F8 03 F0 8B 44 ...............D
006F4260 24 38 2B C3 83 C4 0C 83 F8 01 89 44 24 2C 0F 84 $8+........D$,..
006F4270 D4 00 00 00 85 C0 0F 84 A3 00 00 00 8B 45 00 89 .............E..
006F4280 07 83 C7 04 83 C5 04 83 6C 24 34 01 0F 84 8D 00 ........l$4.....
006F4290 00 00 8B 4C 24 1C 8B 54 24 34 8B 06 51 6A 00 52 ...L$..T$4..Qj.R
006F42A0 55 50 E8 E9 F9 FF FF 8B D8 83 C4 14 85 DB 74 26 UP............t&
006F42B0 7C 71 8D 04 9D 00 00 00 00 50 55 57 FF 15 90 45 |q.......PUW...E
006F42C0 8A 00 8D 04 9D 00 00 00 00 83 C4 0C 03 F8 03 E8 ................
006F42D0 29 5C 24 34 74 49 8B 0E 8B 44 24 2C 83 E8 01 89 )\$4tI...D$,....
006F42E0 0F 83 C7 04 83 C6 04 83 F8 01 89 44 24 2C 74 58 ...........D$,tX
006F42F0 83 7C 24 14 07 0F 8D 08 FF FF FF 83 FB 07 0F 8D .|$.............
006F4300 FF FE FF FF 8B 44 24 10 8B 54 24 28 8B 5C 24 1C .....D$..T$(.\$.
006F4310 83 C0 01 89 44 24 10 89 42 04 E9 31 FE FF FF 33 ....D$..B..1...3
006F4320 DB EB 04 8B 5C 24 20 8B 44 24 2C 85 C0 74 0F 03 ....\$ .D$,..t..
006F4330 C0 03 C0 50 56 57 E8 F5 0C FA FF 83 C4 0C 5F 5E ...PVW........_^
006F4340 5D 8B C3 5B 83 C4 14 C3 8B 5C 24 34 03 DB 03 DB ]..[.....\$4....
006F4350 53 55 57 FF 15 90 45 8A 00 8B 0E 83 C4 0C 89 0C SUW...E.........
006F4360 3B 5F 5E 5D 33 C0 5B 83 C4 14 C3 CC CC CC CC CC ;_^]3.[.........
006F4370 83 EC 18 53 55 8B 6C 24 34 56 8B 74 24 28 3B 6E ...SU.l$4V.t$(;n
006F4380 0C 8B 46 04 C7 44 24 20 FF FF FF FF 89 44 24 38 ..F..D$ .....D$8
006F4390 7E 15 8B DD E8 B7 FC FF FF 85 C0 7D 0A 5E 5D 83 ~..........}.^].
006F43A0 C8 FF 5B 83 C4 18 C3 8B 44 24 34 8B 4E 08 57 8D ..[.....D$4.N.W.
006F43B0 1C AD 00 00 00 00 53 50 51 8D 7C 03 FC E8 6E 0C ......SPQ.|...n.
006F43C0 FA FF 8B 76 08 8B 4C 24 40 8B 44 24 3C 8B 54 88 ...v..L$@.D$<.T.
006F43D0 FC 8D 5C 1E FC 89 74 24 28 8D 74 88 FC 89 17 83 ..\...t$(.t.....
006F43E0 C4 0C 83 EF 04 83 EE 04 83 E9 01 89 44 24 20 89 ............D$ .
006F43F0 5C 24 38 89 4C 24 34 0F 84 1B 02 00 00 83 FD 01 \$8.L$4.........
006F4400 0F 84 E6 01 00 00 8B 44 24 2C 8B 08 89 4C 24 18 .......D$,...L$.
006F4410 33 C0 89 44 24 10 89 44 24 14 8D 9B 00 00 00 00 3..D$..D$.......
006F4420 8B 44 24 18 85 C0 75 11 8B 16 50 8B 03 52 50 E8 .D$...u...P..RP.
006F4430 6C B1 FE FF 83 C4 0C EB 11 8B 1B 50 8B 06 E8 DD l..........P....
006F4440 F5 FF FF 8B 5C 24 3C 83 C4 04 33 C9 3B C1 74 36 ....\$<...3.;.t6
006F4450 0F 8C C6 01 00 00 8B 16 B8 01 00 00 00 01 44 24 ..............D$
006F4460 10 89 17 83 EF 04 83 EE 04 29 44 24 34 89 4C 24 .........)D$4.L$
006F4470 14 0F 84 A1 01 00 00 8B 44 24 3C 39 44 24 10 7C ........D$<9D$.|
006F4480 9F 83 C0 01 EB 3E 8B 03 83 44 24 14 01 89 07 83 .....>...D$.....
006F4490 EB 04 83 ED 01 83 EF 04 83 FD 01 89 5C 24 38 89 ............\$8.
006F44A0 4C 24 10 0F 84 43 01 00 00 8B 4C 24 14 3B 4C 24 L$...C....L$.;L$
006F44B0 3C 0F 8C 69 FF FF FF 8B 44 24 3C 83 C0 01 EB 04 <..i....D$<.....
006F44C0 8B 44 24 3C 8B 4C 24 2C 33 D2 83 F8 01 0F 9F C2 .D$<.L$,3.......
006F44D0 2B C2 8B 54 24 18 89 41 04 89 44 24 3C 8B 44 24 +..T$..A..D$<.D$
006F44E0 34 52 8B 54 24 24 8D 48 FF 51 50 8B 03 52 E8 8D 4R.T$$.H.QP..R..
006F44F0 F9 FF FF 83 C4 10 85 C0 0F 8C 1E 01 00 00 8B 4C ...............L
006F4500 24 34 2B C8 89 4C 24 14 89 4C 24 10 74 2B 8D 04 $4+..L$..L$.t+..
006F4510 8D 00 00 00 00 50 2B F8 2B F0 8D 46 04 50 8D 4F .....P+.+..F.P.O
006F4520 04 51 FF 15 90 45 8A 00 8B 54 24 20 83 C4 0C 29 .Q...E...T$ ...)
006F4530 54 24 34 0F 84 DF 00 00 00 8B 03 89 07 83 EB 04 T$4.............
006F4540 83 ED 01 83 EF 04 83 FD 01 89 5C 24 38 0F 84 99 ..........\$8...
006F4550 00 00 00 8B 4C 24 18 8B 44 24 1C 51 8B 0E 8D 55 ....L$..D$.Q...U
006F4560 FF 52 55 50 51 E8 26 F7 FF FF 83 C4 14 85 C0 0F .RUPQ.&.........
006F4570 8C A7 00 00 00 8B CD 2B C8 89 4C 24 14 74 31 8D .......+..L$.t1.
006F4580 04 8D 00 00 00 00 2B D8 50 2B F8 8D 53 04 52 8D ......+.P+..S.R.
006F4590 47 04 50 89 5C 24 44 E8 94 0A FA FF 2B 6C 24 20 G.P.\$D.....+l$ 
006F45A0 83 C4 0C 83 FD 01 74 44 85 ED 74 6C 8B 4C 24 14 ......tD..tl.L$.
006F45B0 8B 16 89 17 83 EF 04 83 EE 04 83 6C 24 34 01 74 ...........l$4.t
006F45C0 57 83 7C 24 10 07 0F 8D F4 FE FF FF 83 F9 07 0F W.|$............
006F45D0 8D EB FE FF FF 8B 44 24 3C 8B 4C 24 2C 83 C0 01 ......D$<.L$,...
006F45E0 89 44 24 3C 89 41 04 E9 24 FE FF FF 8B 44 24 34 .D$<.A..$....D$4
006F45F0 03 C0 03 C0 2B F0 50 2B F8 83 C6 04 8D 57 04 56 ....+.P+.....W.V
006F4600 52 FF 15 90 45 8A 00 8B 03 83 C4 0C 89 07 5F 5E R...E........._^
006F4610 5D 33 C0 5B 83 C4 18 C3 33 F6 EB 04 8B 74 24 24 ]3.[....3....t$$
006F4620 85 ED 74 18 8B 4C 24 1C 03 ED 03 ED 55 2B FD 51 ..t..L$.....U+.Q
006F4630 83 C7 04 57 E8 F7 09 FA FF 83 C4 0C 5F 8B C6 5E ...W........_..^
006F4640 5D 5B 83 C4 18 C3 CC CC CC CC CC CC CC CC CC CC ][..............
006F4650 83 EC 08 8B 54 C6 14 53 8B 5C C6 1C 55 8B 6C C6 ....T..S.\..U.l.
006F4660 20 57 8B 7C C6 18 89 6C 24 10 03 EF 89 6C C6 18  W.|...l$....l..
006F4670 8B 6E 10 83 ED 03 3B C5 8D 4C C6 1C 89 54 24 0C .n....;..L...T$.
006F4680 75 0D 8B 6C C6 24 8B 44 C6 28 89 29 89 41 04 8B u..l.$.D.(.).A..
006F4690 2E 83 46 10 FF 8B 03 55 6A 00 57 52 E8 DF F7 FF ..F....Uj.WR....
006F46A0 FF 83 C4 10 85 C0 7D 0A 5F 5D 83 C8 FF 5B 83 C4 ......}._]...[..
006F46B0 08 C3 2B F8 8B 4C 24 0C 8D 0C 81 89 4C 24 0C 75 ..+..L$.....L$.u
006F46C0 09 5F 5D 33 C0 5B 83 C4 08 C3 8B 44 24 10 55 8D ._]3.[.....D$.U.
006F46D0 50 FF 52 50 8B 44 B9 FC 53 50 E8 B1 F5 FF FF 83 P.RP.D..SP......
006F46E0 C4 14 85 C0 7E 29 3B F8 50 53 57 7F 14 8B 44 24 ....~);.PSW...D$
006F46F0 18 56 E8 D9 F9 FF FF 83 C4 10 5F 5D 5B 83 C4 08 .V........_][...
006F4700 C3 8B 4C 24 18 51 56 E8 64 FC FF FF 83 C4 14 5F ..L$.QV.d......_
006F4710 5D 5B 83 C4 08 C3 CC CC CC CC CC CC CC CC CC CC ][..............
006F4720 56 8B F0 8B 46 10 83 F8 01 57 7E 41 8D 64 24 00 V...F....W~A.d$.
006F4730 83 C0 FE 85 C0 7E 1B 8B 4C C6 20 8B 7C C6 18 8B .....~..L. .|...
006F4740 54 C6 10 03 F9 3B D7 7F 09 3B D1 7D 0F 83 E8 01 T....;...;.}....
006F4750 EB 0A 8B 4C C6 18 3B 4C C6 20 7F 11 E8 EF FE FF ...L..;L. ......
006F4760 FF 85 C0 7C 0D 8B 46 10 83 F8 01 7F C3 5F 33 C0 ...|..F......_3.
006F4770 5E C3 5F 83 C8 FF 5E C3 CC CC CC CC CC CC CC CC ^._...^.........
006F4780 56 8B F0 8B 46 10 83 F8 01 7E 2A EB 03 8D 49 00 V...F....~*...I.
006F4790 83 C0 FE 85 C0 7E 0D 8B 4C C6 10 3B 4C C6 20 7D .....~..L..;L. }
006F47A0 03 83 E8 01 E8 A7 FE FF FF 85 C0 7C 0C 8B 46 10 ...........|..F.
006F47B0 83 F8 01 7F DB 33 C0 5E C3 83 C8 FF 5E C3 CC CC .....3.^....^...
006F47C0 56 8B 74 24 0C 8B 46 04 3D 38 B5 A1 00 74 29 68 V.t$..F.=8...t)h
006F47D0 38 B5 A1 00 50 E8 96 0E FE FF 83 C4 08 85 C0 75 8...P..........u
006F47E0 17 A1 7C 6B A1 00 68 BC 51 8D 00 50 E8 8F C7 FE ..|k..h.Q..P....
006F47F0 FF 83 C4 08 33 C0 5E C3 8B 4C 24 10 8B 56 08 8B ....3.^..L$..V..
006F4800 44 24 08 51 8B 48 08 52 51 E8 B2 AC FE FF 83 C4 D$.Q.H.RQ.......
006F4810 0C 5E C3 CC CC CC CC CC CC CC CC CC CC CC CC CC .^..............
006F4820 56 8B 74 24 08 83 7E 08 00 74 1A 8B 46 08 83 00 V.t$..~..t..F...
006F4830 FF 8B 46 08 83 38 00 75 0C 8B 48 04 8B 51 18 50 ..F..8.u..H..Q.P
006F4840 FF D2 83 C4 04 83 7E 0C 00 74 1A 8B 46 0C 83 00 ......~..t..F...
006F4850 FF 8B 46 0C 83 38 00 75 0C 8B 48 04 8B 51 18 50 ..F..8.u..H..Q.P
006F4860 FF D2 83 C4 04 56 E8 55 F1 02 00 83 C4 04 5E C3 .....V.U......^.
006F4870 56 8B 74 24 08 83 7E 08 00 74 1A 8B 46 08 83 00 V.t$..~..t..F...
006F4880 FF 8B 46 08 83 38 00 75 0C 8B 48 04 8B 51 18 50 ..F..8.u..H..Q.P
006F4890 FF D2 83 C4 04 56 E8 25 F1 02 00 83 C4 04 5E C3 .....V.%......^.
006F48A0 8B 54 24 08 83 EC 08 8D 04 24 50 8D 4C 24 08 51 .T$......$P.L$.Q
006F48B0 6A 02 6A 02 68 8F 69 8A 00 52 E8 11 12 FF FF 83 j.j.h.i..R......
006F48C0 C4 18 85 C0 74 57 8B 44 24 04 81 78 04 38 B5 A1 ....tW.D$..x.8..
006F48D0 00 74 15 8B 40 04 68 38 B5 A1 00 50 E8 8F 0D FE .t..@.h8...P....
006F48E0 FF 83 C4 08 85 C0 74 21 8B 0C 24 81 79 04 38 B5 ......t!..$.y.8.
006F48F0 A1 00 74 32 8B 49 04 68 38 B5 A1 00 51 E8 6E 0D ..t2.I.h8...Q.n.
006F4900 FE FF 83 C4 08 85 C0 75 1A 8B 15 7C 6B A1 00 68 .......u...|k..h
006F4910 BC 51 8D 00 52 E8 66 C6 FE FF 83 C4 08 33 C0 83 .Q..R.f......3..
006F4920 C4 08 C3 8B 0C 24 8B 49 08 8B 44 24 04 8B 40 08 .....$.I..D$..@.
006F4930 6A 00 51 8B 4C 24 14 8B 51 08 50 52 E8 AF F1 00 j.Q.L$..Q.PR....
006F4940 00 83 C4 10 83 C4 08 C3 CC CC CC CC CC CC CC CC ................
006F4950 81 EC E0 06 00 00 8B 84 24 E8 06 00 00 57 33 FF ........$....W3.
006F4960 3B C7 89 7C 24 08 89 7C 24 10 89 7C 24 18 89 7C ;..|$..|$..|$..|
006F4970 24 0C 74 36 8D 4C 24 18 51 8D 54 24 10 52 8B 94 $.t6.L$.Q.T$.R..
006F4980 24 F8 06 00 00 8D 4C 24 10 51 68 E8 B6 A1 00 68 $.....L$.Qh....h
006F4990 F8 51 8D 00 52 50 E8 65 31 FF FF 83 C4 1C 85 C0 .Q..RP.e1.......
006F49A0 75 08 5F 81 C4 E0 06 00 00 C3 56 8B 74 24 0C 81 u._.......V.t$..
006F49B0 FE B8 63 A1 00 75 06 33 F6 89 74 24 0C 8B 44 24 ..c..u.3..t$..D$
006F49C0 10 3D B8 63 A1 00 75 06 33 C0 89 44 24 10 3B F7 .=.c..u.3..D$.;.
006F49D0 74 35 3B C7 74 2E 68 28 B6 A1 00 E8 A0 93 FE FF t5;.t.h(........
006F49E0 83 C4 04 3B C7 75 04 33 C0 EB 06 83 06 01 89 70 ...;.u.3.......p
006F49F0 08 3B C7 89 44 24 0C 75 0E 5E 33 C0 5F 81 C4 E0 .;..D$.u.^3._...
006F4A00 06 00 00 C3 83 06 01 39 7C 24 10 8B 84 24 EC 06 .......9|$...$..
006F4A10 00 00 8B 48 08 8B 50 10 53 55 8B 68 0C 89 4C 24 ...H..P.SU.h..L$
006F4A20 10 89 54 24 2C 89 78 08 89 78 0C C7 40 10 FF FF ..T$,.x..x..@...
006F4A30 FF FF 74 52 33 F6 85 C9 7E 4C 8D 9B 00 00 00 00 ..tR3...~L......
006F4A40 8B 7C B5 00 8B 44 24 18 6A 00 57 50 E8 9F F0 00 .|...D$.j.WP....
006F4A50 00 8B D8 83 C4 0C 85 DB 0F 84 D2 01 00 00 68 38 ..............h8
006F4A60 B5 A1 00 E8 18 93 FE FF 83 C4 04 85 C0 0F 84 DA ................
006F4A70 02 00 00 89 58 08 89 78 0C 89 44 B5 00 83 C6 01 ....X..x..D.....
006F4A80 3B 74 24 10 7C BA 83 7C 24 24 00 74 27 83 7C 24 ;t$.|..|$$.t'.|$
006F4A90 10 01 7E 20 8B 54 24 10 8D 44 95 FC 3B E8 8B CD ..~ .T$..D..;...
006F4AA0 73 12 8B 30 8B 11 89 31 89 10 83 C1 04 83 E8 04 s..0...1........
006F4AB0 3B C8 72 EE 8B 44 24 14 89 44 24 34 8B 44 24 10 ;.r..D$..D$4.D$.
006F4AC0 83 F8 02 8D 8C 24 F0 02 00 00 89 4C 24 3C C7 44 .....$.....L$<.D
006F4AD0 24 40 00 01 00 00 C7 44 24 44 00 00 00 00 C7 44 $@.....D$D.....D
006F4AE0 24 38 07 00 00 00 89 44 24 20 0F 8C DE 00 00 00 $8.....D$ ......
006F4AF0 33 C9 83 F8 40 8B F5 7C 15 8D A4 24 00 00 00 00 3...@..|...$....
006F4B00 8B D0 83 E2 01 D1 F8 0B CA 83 F8 40 7D F2 03 C8 ...........@}...
006F4B10 89 4C 24 28 8B 44 24 14 8B 4C 24 10 50 8D 44 8D .L$(.D$..L$.P.D.
006F4B20 00 50 8D 7C 24 38 8B C6 E8 63 F0 FF FF 8B F8 83 .P.|$8...c......
006F4B30 C4 08 85 FF 0F 8C 9C 00 00 00 83 7C 24 30 00 74 ...........|$0.t
006F4B40 21 8D 44 BE FC 3B F0 8B CE 73 17 EB 03 8D 49 00 !.D..;...s....I.
006F4B50 8B 18 8B 11 89 19 89 10 83 C1 04 83 E8 04 3B C8 ..............;.
006F4B60 72 EE 8B 44 24 28 3B F8 7D 28 39 44 24 20 8B 5C r..D$(;.}(9D$ .\
006F4B70 24 20 7E 02 8B D8 8B 54 24 14 52 8D 04 BE 50 8D $ ~....T$.R...P.
006F4B80 0C 9E 51 56 E8 57 EF FF FF 83 C4 10 85 C0 7C 46 ..QV.W........|F
006F4B90 8B FB 8B 54 24 44 89 74 D4 48 8B 44 24 44 89 7C ...T$D.t.H.D$D.|
006F4BA0 C4 4C 83 44 24 44 01 8D 44 24 34 E8 70 FB FF FF .L.D$D..D$4.p...
006F4BB0 85 C0 7C 22 29 7C 24 20 8D 34 BE 0F 85 53 FF FF ..|")|$ .4...S..
006F4BC0 FF 8D 44 24 34 E8 B6 FB FF FF 85 C0 7C 08 C7 44 ..D$4.......|..D
006F4BD0 24 1C B8 63 A1 00 83 7C 24 18 00 8B 5C 24 10 0F $..c...|$...\$..
006F4BE0 84 DE 00 00 00 33 FF 85 DB 0F 8E D4 00 00 00 90 .....3..........
006F4BF0 8B 74 BD 00 8B 46 04 3D 38 B5 A1 00 0F 84 9B 00 .t...F.=8.......
006F4C00 00 00 68 38 B5 A1 00 50 E8 63 0A FE FF 83 C4 08 ..h8...P.c......
006F4C10 85 C0 0F 85 85 00 00 00 8B 0D 7C 6B A1 00 68 BC ..........|k..h.
006F4C20 51 8D 00 51 E8 57 C3 FE FF 83 C4 08 33 C0 EB 73 Q..Q.W......3..s
006F4C30 83 EE 01 0F 88 14 01 00 00 8D A4 24 00 00 00 00 ...........$....
006F4C40 8B 7C B5 00 8B 47 04 3D 38 B5 A1 00 74 2A 68 38 .|...G.=8...t*h8
006F4C50 B5 A1 00 50 E8 17 0A FE FF 83 C4 08 85 C0 75 18 ...P..........u.
006F4C60 8B 0D 7C 6B A1 00 68 BC 51 8D 00 51 E8 0F C3 FE ..|k..h.Q..Q....
006F4C70 FF 83 C4 08 33 C0 EB 06 8B 47 0C 83 00 01 89 44 ....3....G.....D
006F4C80 B5 00 83 07 FF 75 0C 8B 57 04 8B 42 18 57 FF D0 .....u..W..B.W..
006F4C90 83 C4 04 83 EE 01 79 A8 E9 B0 00 00 00 8B 46 0C ......y.......F.
006F4CA0 83 00 01 89 44 BD 00 83 06 FF 75 0C 8B 56 04 8B ....D.....u..V..
006F4CB0 42 18 56 FF D0 83 C4 04 83 C7 01 3B FB 0F 8C 2D B.V........;...-
006F4CC0 FF FF FF 8B 8C 24 F4 06 00 00 83 79 10 FF 74 23 .....$.....y..t#
006F4CD0 83 7C 24 1C 00 74 1C 8B 15 2C 7E A1 00 68 DC 51 .|$..t...,~..h.Q
006F4CE0 8D 00 52 E8 98 C2 FE FF 83 C4 08 C7 44 24 1C 00 ..R.........D$..
006F4CF0 00 00 00 83 7C 24 24 00 74 28 83 FB 01 7E 23 8D ....|$$.t(...~#.
006F4D00 44 9D FC 3B E8 8B CD 73 19 8D A4 24 00 00 00 00 D..;...s...$....
006F4D10 8B 30 8B 11 89 31 89 10 83 C1 04 83 E8 04 3B C8 .0...1........;.
006F4D20 72 EE 8B 44 24 3C 8D 8C 24 F0 02 00 00 3B C1 74 r..D$<..$....;.t
006F4D30 09 50 E8 D9 9F FE FF 83 C4 04 8D 94 24 F0 02 00 .P..........$...
006F4D40 00 89 54 24 3C C7 44 24 40 00 01 00 00 8B 84 24 ..T$<.D$@......$
006F4D50 F4 06 00 00 8B 78 0C 85 FF 8B 4C 24 10 8B 54 24 .....x....L$..T$
006F4D60 2C 8B 70 08 89 68 0C 5D 89 48 08 89 50 10 5B 74 ,.p..h.].H..P.[t
006F4D70 34 83 EE 01 78 25 83 3C B7 00 74 1A 8B 04 B7 83 4...x%.<..t.....
006F4D80 00 FF 8B 04 B7 83 38 00 75 0C 8B 48 04 8B 51 18 ......8.u..H..Q.
006F4D90 50 FF D2 83 C4 04 83 EE 01 79 DB 57 FF 15 D4 45 P........y.W...E
006F4DA0 8A 00 83 C4 04 8B 44 24 0C 85 C0 74 18 83 00 FF ......D$...t....
006F4DB0 8B 44 24 0C 83 38 00 75 0C 8B 48 04 8B 51 18 50 .D$..8.u..H..Q.P
006F4DC0 FF D2 83 C4 04 8B 44 24 14 85 C0 74 03 83 00 01 ......D$...t....
006F4DD0 5E 5F 81 C4 E0 06 00 00 C3 CC CC CC CC CC CC CC ^_..............
006F4DE0 56 8B 74 24 08 85 F6 74 42 8B 46 04 3D F0 BA A1 V.t$...tB.F.=...
006F4DF0 00 74 12 68 F0 BA A1 00 50 E8 72 08 FE FF 83 C4 .t.h....P.r.....
006F4E00 08 85 C0 74 26 6A 00 6A 00 56 E8 41 FB FF FF 83 ...t&j.j.V.A....
006F4E10 C4 0C 85 C0 74 27 83 00 FF 75 0C 8B 48 04 8B 51 ....t'...u..H..Q
006F4E20 18 50 FF D2 83 C4 04 33 C0 5E C3 68 75 08 00 00 .P.....3.^.hu...
006F4E30 68 78 50 8D 00 E8 86 CF FE FF 83 C4 08 83 C8 FF hxP.............
006F4E40 5E C3 CC CC CC CC CC CC CC CC CC CC CC CC CC CC ^...............
006F4E50 8B 44 24 04 8B 48 08 83 F9 01 7E 1F 8B 40 0C 8D .D$..H....~..@..
006F4E60 4C 88 FC 3B C1 73 14 57 8B 39 8B 10 89 38 89 11 L..;.s.W.9...8..
006F4E70 83 C0 04 83 E9 04 3B C1 72 EE 5F 83 05 B8 63 A1 ......;.r._...c.
006F4E80 00 01 B8 B8 63 A1 00 C3 CC CC CC CC CC CC CC CC ....c...........
006F4E90 56 8B 74 24 08 85 F6 74 45 8B 46 04 3D F0 BA A1 V.t$...tE.F.=...
006F4EA0 00 74 12 68 F0 BA A1 00 50 E8 C2 07 FE FF 83 C4 .t.h....P.......
006F4EB0 08 85 C0 74 29 8B 4E 08 83 F9 01 7E 1D 8B 46 0C ...t).N....~..F.
006F4EC0 8D 4C 88 FC 3B C1 73 12 8B 31 8B 10 89 30 89 11 .L..;.s..1...0..
006F4ED0 83 C0 04 83 E9 04 3B C1 72 EE 33 C0 5E C3 68 8D ......;.r.3.^.h.
006F4EE0 08 00 00 68 78 50 8D 00 E8 D3 CE FE FF 83 C4 08 ...hxP..........
006F4EF0 83 C8 FF 5E C3 CC CC CC CC CC CC CC CC CC CC CC ...^............

;; fn006F4F00: 006F4F00
;;   Called from:
;;     00704D8B (in fn00704BA0)
;;     00728D00 (in fn00728BE0)
fn006F4F00 proc
	push	ebx
	mov	ebx,[esp+8h]
	test	ebx,ebx
	jz	6F4F74h

l006F4F09:
	mov	eax,[ebx+4h]
	cmp	eax,0A1BAF0h
	jz	6F4F25h

l006F4F13:
	push	0A1BAF0h
	push	eax
	call	6D5670h
	add	esp,8h
	test	eax,eax
	jz	6F4F74h

l006F4F25:
	push	ebp
	push	edi
	mov	edi,[ebx+8h]
	push	edi
	call	6DFD20h
	mov	ebp,eax
	add	esp,4h
	test	ebp,ebp
	jnz	6F4F3Dh

l006F4F39:
	pop	edi
	pop	ebp
	pop	ebx
	ret

l006F4F3D:
	mov	ecx,[ebx+0Ch]
	push	esi
	lea	eax,[0000h+edi*4]
	push	eax
	push	ecx
	lea	esi,[ebp+0Ch]
	push	esi
	call	695030h
	add	esp,0Ch
	sub	edi,1h
	js	6F4F6Dh

l006F4F5B:
	jmp	6F4F60h
006F4F5D                                        8D 49 00              .I.

l006F4F60:
	mov	eax,[esi]
	add	dword ptr [eax],1h
	add	esi,4h
	sub	edi,1h
	jns	6F4F60h

l006F4F6D:
	pop	esi
	pop	edi
	mov	eax,ebp
	pop	ebp
	pop	ebx
	ret

l006F4F74:
	push	89Ch
	push	8D5078h
	call	6E1DC0h
	add	esp,8h
	xor	eax,eax
	pop	ebx
	ret
006F4F8A                               CC CC CC CC CC CC           ......
006F4F90 83 EC 08 57 8B 7C 24 10 8B 47 08 8D 4C 24 10 51 ...W.|$..G..L$.Q
006F4FA0 8B 4C 24 18 68 70 7D 70 00 8D 54 24 0C 52 89 44 .L$.hp}p..T$.R.D
006F4FB0 24 1C 68 70 7D 70 00 8D 44 24 18 50 68 24 52 8D $.hp}p..D$.Ph$R.
006F4FC0 00 51 C7 44 24 20 00 00 00 00 E8 B1 2C FF FF 83 .Q.D$ ......,...
006F4FD0 C4 1C 85 C0 75 05 5F 83 C4 08 C3 56 8B 74 24 08 ....u._....V.t$.
006F4FE0 85 F6 7D 0F 03 77 08 89 74 24 08 79 06 33 F6 89 ..}..w..t$.y.3..
006F4FF0 74 24 08 8B 44 24 14 85 C0 7D 0F 03 47 08 89 44 t$..D$...}..G..D
006F5000 24 14 79 06 33 C0 89 44 24 14 3B F0 7D 2C 8B FF $.y.3..D$.;.},..
006F5010 3B 77 08 7D 25 8B 54 24 0C 8B 47 0C 8B 0C B0 6A ;w.}%.T$..G....j
006F5020 02 52 51 E8 78 A5 FE FF 83 C4 0C 85 C0 7F 27 7C .RQ.x.........'|
006F5030 1D 83 C6 01 3B 74 24 14 7C D6 8B 15 2C 7E A1 00 ....;t$.|...,~..
006F5040 68 04 52 8D 00 52 E8 35 BF FE FF 83 C4 08 5E 33 h.R..R.5......^3
006F5050 C0 5F 83 C4 08 C3 56 E8 C4 00 01 00 83 C4 04 5E ._....V........^
006F5060 5F 83 C4 08 C3 CC CC CC CC CC CC CC CC CC CC CC _...............
006F5070 53 55 56 57 8B 7C 24 14 33 F6 33 ED 39 77 08 7E SUVW.|$.3.3.9w.~
006F5080 29 8B 5C 24 18 8B 47 0C 8B 0C B0 6A 02 53 51 E8 ).\$..G....j.SQ.
006F5090 0C A5 FE FF 83 C4 0C 85 C0 7E 05 83 C5 01 EB 02 .........~......
006F50A0 7C 16 83 C6 01 3B 77 08 7C DB 55 E8 70 00 01 00 |....;w.|.U.p...
006F50B0 83 C4 04 5F 5E 5D 5B C3 5F 5E 5D 33 C0 5B C3 CC ..._^][._^]3.[..
006F50C0 53 56 57 8B 7C 24 10 33 F6 39 77 08 7E 24 8B 5C SVW.|$.3.9w.~$.\
006F50D0 24 14 8B 47 0C 8B 0C B0 6A 02 53 51 E8 BF A4 FE $..G....j.SQ....
006F50E0 FF 83 C4 0C 85 C0 7F 23 7C 1B 83 C6 01 3B 77 08 .......#|....;w.
006F50F0 7C E0 A1 2C 7E A1 00 68 34 52 8D 00 50 E8 7E BE |..,~..h4R..P.~.
006F5100 FE FF 83 C4 08 5F 5E 33 C0 5B C3 6A 00 8D 56 01 ....._^3.[.j..V.
006F5110 52 56 57 E8 A8 E0 FF FF 83 C4 10 85 C0 75 E6 83 RVW..........u..
006F5120 05 B8 63 A1 00 01 5F 5E B8 B8 63 A1 00 5B C3 CC ..c..._^..c..[..
006F5130 53 55 8B 6C 24 0C 56 8B 75 08 83 EE 01 57 78 2E SU.l$.V.u....Wx.
006F5140 8B 7C 24 1C 8B 5C 24 18 EB 06 8D 9B 00 00 00 00 .|$..\$.........
006F5150 8B 45 0C 83 3C B0 00 8D 04 B0 74 0D 8B 08 57 51 .E..<.....t...WQ
006F5160 FF D3 83 C4 08 85 C0 75 07 83 EE 01 79 E2 33 C0 .......u....y.3.
006F5170 5F 5E 5D 5B C3 CC CC CC CC CC CC CC CC CC CC CC _^][............
006F5180 53 8B 5C 24 08 8B 43 04 3D F0 BA A1 00 57 74 12 S.\$..C.=....Wt.
006F5190 68 F0 BA A1 00 50 E8 D5 04 FE FF 83 C4 08 85 C0 h....P..........
006F51A0 74 20 8B 7C 24 10 8B 47 04 3D F0 BA A1 00 74 21 t .|$..G.=....t!
006F51B0 68 F0 BA A1 00 50 E8 B5 04 FE FF 83 C4 08 85 C0 h....P..........
006F51C0 75 0F 83 05 80 64 A1 00 01 5F B8 80 64 A1 00 5B u....d..._..d..[
006F51D0 C3 8B 43 08 3B 47 08 55 8B 6C 24 18 74 22 83 FD ..C.;G.U.l$.t"..
006F51E0 02 74 11 83 FD 03 75 18 5D B8 E4 91 A1 00 83 00 .t....u.].......
006F51F0 01 5F 5B C3 5D B8 D8 91 A1 00 83 00 01 5F 5B C3 ._[.]........_[.
006F5200 56 33 F6 85 C0 7E 2F 3B 77 08 7D 2A 8B 47 0C 8B V3...~/;w.}*.G..
006F5210 0C B0 8B 53 0C 8B 04 B2 6A 02 51 50 E8 7F A3 FE ...S....j.QP....
006F5220 FF 83 C4 0C 85 C0 0F 8C B9 00 00 00 74 08 83 C6 ............t...
006F5230 01 3B 73 08 7C D1 8B 43 08 3B F0 7D 4D 3B 77 08 .;s.|..C.;.}M;w.
006F5240 7D 48 83 FD 02 75 11 83 05 D8 91 A1 00 01 5E 5D }H...u........^]
006F5250 5F B8 D8 91 A1 00 5B C3 83 FD 03 75 11 83 05 E4 _.....[....u....
006F5260 91 A1 00 01 5E 5D 5F B8 E4 91 A1 00 5B C3 8B 4F ....^]_.....[..O
006F5270 0C 8B 14 B1 8B 43 0C 8B 0C B0 55 52 51 E8 3E A2 .....C....URQ.>.
006F5280 FE FF 83 C4 0C 5E 5D 5F 5B C3 83 FD 05 8B 4F 08 .....^]_[.....O.
006F5290 77 53 FF 24 AD EC 52 6F 00 33 D2 3B C1 0F 9C C2 wS.$..Ro.3.;....
006F52A0 EB 2B 33 D2 3B C1 0F 9E C2 EB 22 33 D2 3B C1 0F .+3.;....."3.;..
006F52B0 94 C2 EB 19 33 D2 3B C1 0F 95 C2 EB 10 33 D2 3B ....3.;......3.;
006F52C0 C1 0F 9F C2 EB 07 33 D2 3B C1 0F 9D C2 8B C2 85 ......3.;.......
006F52D0 C0 B8 E4 91 A1 00 75 05 B8 D8 91 A1 00 83 00 01 ......u.........
006F52E0 5E 5D 5F 5B C3 5E 5D 5F 33 C0 5B C3 99 52 6F 00 ^]_[.^]_3.[..Ro.
006F52F0 A2 52 6F 00 AB 52 6F 00 B4 52 6F 00 BD 52 6F 00 .Ro..Ro..Ro..Ro.
006F5300 C6 52 6F 00 CC CC CC CC CC CC CC CC CC CC CC CC .Ro.............
006F5310 51 8B 4C 24 10 8B 54 24 0C 8D 04 24 50 68 F8 B6 Q.L$..T$...$Ph..
006F5320 A1 00 68 54 52 8D 00 51 52 C7 44 24 14 00 00 00 ..hTR..QR.D$....
006F5330 00 E8 CA 27 FF FF 83 C4 14 85 C0 75 05 83 C8 FF ...'.......u....
006F5340 59 C3 56 8B 74 24 0C 83 7E 0C 00 74 09 56 E8 FD Y.V.t$..~..t.V..
006F5350 DD FF FF 83 C4 04 8B 44 24 04 85 C0 74 25 50 56 .......D$...t%PV
006F5360 E8 6B E3 FF FF 83 C4 08 85 C0 75 06 83 C8 FF 5E .k........u....^
006F5370 59 C3 83 00 FF 75 0C 8B 48 04 8B 51 18 50 FF D2 Y....u..H..Q.P..
006F5380 83 C4 04 33 C0 5E 59 C3 CC CC CC CC CC CC CC CC ...3.^Y.........
006F5390 A1 7C 6B A1 00 68 5C 52 8D 00 50 E8 E0 BB FE FF .|k..h\R..P.....
006F53A0 83 C4 08 83 C8 FF C3 CC CC CC CC CC CC CC CC CC ................
006F53B0 8B 54 24 08 8B 4A 04 8B 41 30 83 EC 0C 53 56 33 .T$..J..A0...SV3
006F53C0 F6 3B C6 57 74 55 F7 41 54 00 00 02 00 74 4C 39 .;.WtU.AT....tL9
006F53D0 B0 98 00 00 00 74 44 A1 A4 7C A1 00 50 52 E8 4D .....tD..|..PR.M
006F53E0 D8 00 00 8B 5C 24 24 8B F8 83 C4 08 83 FF FF 75 ....\$$........u
006F53F0 12 E8 CA BB FE FF 85 C0 74 0D 5F 5E 33 C0 5B 83 ........t._^3.[.
006F5400 C4 0C C3 3B FE 7D 03 03 7B 08 57 53 E8 3F DA FF ...;.}..{.WS.?..
006F5410 FF 83 C4 08 5F 5E 5B 83 C4 0C C3 81 F9 30 5D A2 ...._^[......0].
006F5420 00 0F 85 F7 00 00 00 8B 7C 24 1C 8D 4C 24 20 51 ........|$..L$ Q
006F5430 8D 44 24 14 50 8D 4C 24 1C 51 8B 4F 08 8D 44 24 .D$.P.L$.Q.O..D$
006F5440 18 50 51 52 E8 87 9E 03 00 83 C4 18 85 C0 0F 8C .PQR............
006F5450 DE 00 00 00 8B 44 24 20 3B C6 0F 8F 84 00 00 00 .....D$ ;.......
006F5460 A1 80 CB A6 00 3B C6 74 17 8B 3C 85 3C CA A6 00 .....;.t..<.<...
006F5470 83 E8 01 A3 80 CB A6 00 C7 07 01 00 00 00 EB 17 ................
006F5480 68 F0 BA A1 00 E8 A6 9A 00 00 8B F8 83 C4 04 3B h..............;
006F5490 FE 0F 84 9B 00 00 00 89 77 0C 89 77 08 89 77 10 ........w..w..w.
006F54A0 83 7F F8 FE 8D 77 F0 74 0D 68 04 0E 8D 00 E8 3D .....w.t.h.....=
006F54B0 32 FF FF 83 C4 04 C7 46 08 FD FF FF FF 8B 15 58 2......F.......X
006F54C0 D5 A1 00 89 16 A1 58 D5 A1 00 8B 40 04 89 46 04 ......X....@..F.
006F54D0 89 30 8B 0D 58 D5 A1 00 8B C7 5F 89 71 04 5E 5B .0..X....._.q.^[
006F54E0 83 C4 0C C3 50 E8 66 D1 FF FF 83 C4 04 3B C6 74 ....P.f......;.t
006F54F0 41 39 74 24 20 8B 7F 0C 8B 58 0C 8B 54 24 0C 7E A9t$ ....X..T$.~
006F5500 33 8B 0C 97 83 01 01 89 0C B3 03 54 24 10 83 C6 3..........T$...
006F5510 01 3B 74 24 20 7C EA 5F 5E 5B 83 C4 0C C3 8B 15 .;t$ |._^[......
006F5520 7C 6B A1 00 68 78 52 8D 00 52 E8 51 BA FE FF 83 |k..hxR..R.Q....
006F5530 C4 08 33 C0 5F 5E 5B 83 C4 0C C3 CC CC CC CC CC ..3._^[.........
006F5540 83 EC 10 56 8B 74 24 1C 8B 4E 04 8B 41 30 85 C0 ...V.t$..N..A0..
006F5550 57 74 5A F7 41 54 00 00 02 00 74 51 83 B8 98 00 WtZ.AT....tQ....
006F5560 00 00 00 74 48 A1 A4 7C A1 00 50 56 E8 BF D6 00 ...tH..|..PV....
006F5570 00 8B 7C 24 24 8B F0 83 C4 08 83 FE FF 75 12 E8 ..|$$........u..
006F5580 3C BA FE FF 85 C0 74 0D 5F 83 C8 FF 5E 83 C4 10 <.....t._...^...
006F5590 C3 85 F6 7D 03 03 77 08 8B 4C 24 24 51 56 57 E8 ...}..w..L$$QVW.
006F55A0 0C E0 FF FF 83 C4 0C 5F 5E 83 C4 10 C3 81 F9 30 ......._^......0
006F55B0 5D A2 00 0F 85 2E 03 00 00 53 8B 5C 24 20 8D 54 ]........S.\$ .T
006F55C0 24 24 52 8D 44 24 14 50 8B 43 08 8D 4C 24 1C 51 $$R.D$.P.C..L$.Q
006F55D0 8D 54 24 18 52 50 56 E8 F4 9C 03 00 83 C4 18 85 .T$.RPV.........
006F55E0 C0 7D 0A 5B 5F 83 C8 FF 5E 83 C4 10 C3 8B 44 24 .}.[_...^.....D$
006F55F0 10 83 F8 01 75 28 81 7E 10 B8 63 A1 00 75 1F 8B ....u(.~..c..u..
006F5600 4C 24 28 8B 54 24 14 8B 44 24 0C 51 52 50 53 E8 L$(.T$..D$.QRPS.
006F5610 AC DB FF FF 83 C4 10 5B 5F 5E 83 C4 10 C3 8B 4C .......[_^.....L
006F5620 24 28 85 C9 55 0F 85 27 01 00 00 8B 54 24 28 85 $(..U..'....T$(.
006F5630 D2 0F 8E 11 01 00 00 85 C0 7D 1F 8B 4C 24 10 8D .........}..L$..
006F5640 72 FF 0F AF F0 83 C1 01 89 4C 24 18 8D 4C 0E FF r........L$..L..
006F5650 F7 D8 89 4C 24 10 89 44 24 14 8D 04 95 00 00 00 ...L$..D$.......
006F5660 00 85 C0 75 05 B8 01 00 00 00 50 FF 15 BC 45 8A ...u......P...E.
006F5670 00 8B E8 83 C4 04 85 ED 0F 84 B2 01 00 00 8B 74 ...............t
006F5680 24 10 8B 4C 24 14 33 FF 3B 74 24 18 7D 52 8B FF $..L$.3.;t$.}R..
006F5690 8B 53 0C 8B 04 B2 89 4C 24 1C 89 44 BD 00 8B 43 .S.....L$..D...C
006F56A0 08 03 CE 3B C8 7C 07 2B C6 83 E8 01 EB 04 8B 44 ...;.|.+.......D
006F56B0 24 1C 03 C0 03 C0 50 8D 4C B2 04 8B C6 51 2B C7 $.....P.L....Q+.
006F56C0 8D 0C 82 51 FF 15 90 45 8A 00 8B 4C 24 20 03 F1 ...Q...E...L$ ..
006F56D0 83 C4 0C 83 C7 01 3B 74 24 18 7C B4 8B 74 24 10 ......;t$.|..t$.
006F56E0 0F AF 4C 24 28 8D 44 31 01 3B 43 08 7D 19 8B FF ..L$(.D1.;C.}...
006F56F0 8B 4B 0C 8B 34 81 8B D0 2B 54 24 28 83 C0 01 89 .K..4...+T$(....
006F5700 34 91 3B 43 08 7C E9 8B 44 24 28 29 43 08 8B 73 4.;C.|..D$()C..s
006F5710 08 E8 7A CE FF FF 33 F6 39 74 24 28 7E 20 8B FF ..z...3.9t$(~ ..
006F5720 8B 44 B5 00 83 00 FF 75 0C 8B 48 04 8B 51 18 50 .D.....u..H..Q.P
006F5730 FF D2 83 C4 04 83 C6 01 3B 74 24 28 7C E2 55 FF ........;t$(|.U.
006F5740 15 D4 45 8A 00 83 C4 04 5D 5B 5F 33 C0 5E 83 C4 ..E.....][_3.^..
006F5750 10 C3 3B D9 75 11 8B 41 08 50 6A 00 51 E8 3E D7 ..;.u..A.Pj.Q.>.
006F5760 FF FF 83 C4 0C EB 0E 68 E0 52 8D 00 51 E8 2E F6 .......h.R..Q...
006F5770 00 00 83 C4 08 8B F8 85 FF 0F 84 B6 00 00 00 8B ................
006F5780 47 04 3D F0 BA A1 00 74 0E 68 F0 BA A1 00 50 E8 G.=....t.h....P.
006F5790 DC FE FD FF 83 C4 08 8B 47 08 8B 4C 24 28 3B C1 ........G..L$(;.
006F57A0 74 51 8B 47 04 3D F0 BA A1 00 74 12 68 F0 BA A1 tQ.G.=....t.h...
006F57B0 00 50 E8 B9 FE FD FF 8B 4C 24 30 83 C4 08 8B 47 .P......L$0....G
006F57C0 08 51 8B 0D 2C 7E A1 00 50 68 98 52 8D 00 51 E8 .Q..,~..Ph.R..Q.
006F57D0 FC BD FE FF 83 C4 10 83 07 FF 75 0C 8B 57 04 8B ..........u..W..
006F57E0 42 18 57 FF D0 83 C4 04 5D 5B 5F 83 C8 FF 5E 83 B.W.....][_...^.
006F57F0 C4 10 C3 85 C9 0F 84 CD 00 00 00 8D 04 8D 00 00 ................
006F5800 00 00 85 C0 75 05 B8 01 00 00 00 50 FF 15 BC 45 ....u......P...E
006F5810 8A 00 8B E8 83 C4 04 85 ED 89 6C 24 1C 75 21 83 ..........l$.u!.
006F5820 07 FF 75 0C 8B 47 04 8B 48 18 57 FF D1 83 C4 04 ..u..G..H.W.....
006F5830 E8 DB B9 FE FF 5D 5B 5F 83 C8 FF 5E 83 C4 10 C3 .....][_...^....
006F5840 8B 47 04 3D F0 BA A1 00 8B 5B 0C 74 15 68 F0 BA .G.=.....[.t.h..
006F5850 A1 00 50 E8 18 FE FD FF 83 C4 08 85 C0 8D 57 0C ..P...........W.
006F5860 74 03 8B 57 0C 8B 4C 24 28 8B 44 24 10 33 F6 85 t..W..L$(.D$.3..
006F5870 C9 7E 26 2B EA 8B 0C 83 89 0C 2A 8B 0A 83 01 01 .~&+......*.....
006F5880 89 0C 83 8B 4C 24 28 03 44 24 14 83 C6 01 83 C2 ....L$(.D$......
006F5890 04 3B F1 7C E0 8B 6C 24 1C 33 F6 85 C9 7E 1F 90 .;.|..l$.3...~..
006F58A0 8B 44 B5 00 83 00 FF 75 0C 8B 50 04 50 8B 42 18 .D.....u..P.P.B.
006F58B0 FF D0 83 C4 04 83 C6 01 3B 74 24 28 7C E2 55 FF ........;t$(|.U.
006F58C0 15 D4 45 8A 00 83 C4 04 83 07 FF 0F 85 77 FE FF ..E..........w..
006F58D0 FF 8B 4F 04 8B 51 18 57 FF D2 83 C4 04 5D 5B 5F ..O..Q.W.....][_
006F58E0 33 C0 5E 83 C4 10 C3 A1 7C 6B A1 00 68 78 52 8D 3.^.....|k..hxR.
006F58F0 00 50 E8 89 B6 FE FF 83 C4 08 5F 83 C8 FF 5E 83 .P........_...^.
006F5900 C4 10 C3 CC CC CC CC CC CC CC CC CC CC CC CC CC ................
006F5910 56 8B 74 24 08 8B 46 04 3D F0 BA A1 00 74 28 68 V.t$..F.=....t(h
006F5920 F0 BA A1 00 50 E8 46 FD FD FF 83 C4 08 85 C0 75 ....P.F........u
006F5930 16 68 D8 0A 00 00 68 78 50 8D 00 E8 80 C4 FE FF .h....hxP.......
006F5940 83 C4 08 33 C0 5E C3 57 68 08 BC A1 00 E8 DE 95 ...3.^.Wh.......
006F5950 00 00 8B F8 83 C4 04 85 FF 75 03 5F 5E C3 C7 47 .........u._^..G
006F5960 08 00 00 00 00 83 06 01 89 77 0C 83 7F F8 FE 8D .........w......
006F5970 77 F0 74 0D 68 04 0E 8D 00 E8 72 2D FF FF 83 C4 w.t.h.....r-....
006F5980 04 C7 46 08 FD FF FF FF A1 58 D5 A1 00 89 06 8B ..F......X......
006F5990 0D 58 D5 A1 00 8B 41 04 89 46 04 89 30 8B 15 58 .X....A..F..0..X
006F59A0 D5 A1 00 8B C7 5F 89 72 04 5E C3 CC CC CC CC CC ....._.r.^......
006F59B0 56 8B 74 24 08 8B 46 0C 85 C0 74 31 8B 4E 08 3B V.t$..F...t1.N.;
006F59C0 48 08 7D 11 8B 40 0C 8B 04 88 83 C1 01 89 4E 08 H.}..@........N.
006F59D0 83 00 01 5E C3 83 00 FF 75 0C 8B 48 04 8B 51 18 ...^....u..H..Q.
006F59E0 50 FF D2 83 C4 04 C7 46 0C 00 00 00 00 33 C0 5E P......F.....3.^
006F59F0 C3 CC CC CC CC CC CC CC CC CC CC CC CC CC CC CC ................
006F5A00 8B 4C 24 04 8B 41 0C 85 C0 74 11 8B 40 08 2B 41 .L$..A...t..@.+A
006F5A10 08 78 09 89 44 24 04 E9 04 F7 00 00 C7 44 24 04 .x..D$.......D$.
006F5A20 00 00 00 00 E9 77 F6 00 00 CC CC CC CC CC CC CC .....w..........
006F5A30 56 68 F0 BC A1 00 E8 F5 94 00 00 8B F0 83 C4 04 Vh..............
006F5A40 85 F6 75 02 5E C3 8B 44 24 08 8B 48 08 83 E9 01 ..u.^..D$..H....
006F5A50 89 4E 08 83 00 01 56 89 46 0C E8 D1 93 00 00 83 .N....V.F.......
006F5A60 C4 04 8B C6 5E C3 CC CC CC CC CC CC CC CC CC CC ....^...........
006F5A70 56 8B 74 24 08 56 E8 05 94 00 00 83 C4 04 83 7E V.t$.V.........~
006F5A80 0C 00 74 1A 8B 46 0C 83 00 FF 8B 46 0C 83 38 00 ..t..F.....F..8.
006F5A90 75 0C 8B 48 04 8B 51 18 50 FF D2 83 C4 04 56 E8 u..H..Q.P.....V.
006F5AA0 2C 95 00 00 83 C4 04 5E C3 CC CC CC CC CC CC CC ,......^........
006F5AB0 8B 4C 24 04 8B 51 08 85 D2 8B 41 0C 7C 15 3B 50 .L$..Q....A.|.;P
006F5AC0 08 7D 10 8B 40 0C 8B 04 90 83 C2 FF 89 51 08 83 .}..@........Q..
006F5AD0 00 01 C3 85 C0 C7 41 08 FF FF FF FF 74 18 C7 41 ......A.....t..A
006F5AE0 0C 00 00 00 00 83 00 FF 75 0C 8B 48 04 8B 51 18 ........u..H..Q.
006F5AF0 50 FF D2 83 C4 04 33 C0 C3 CC CC CC CC CC CC CC P.....3.........
006F5B00 8B 4C 24 04 8B 41 08 8B 49 0C 83 C0 01 85 C9 74 .L$..A..I......t
006F5B10 05 39 41 08 7D 02 33 C0 C3 CC CC CC CC CC CC CC .9A.}.3.........
006F5B20 53 55 56 57 33 F6 33 FF 39 35 24 9B 8D 00 B8 24 SUVW3.3.95$....$
006F5B30 9B 8D 00 74 0A 83 C0 0C 83 C6 01 39 38 75 F6 39 ...t.......98u.9
006F5B40 3D C8 54 8D 00 B8 C8 54 8D 00 74 0F 8D 64 24 00 =.T....T..t..d$.
006F5B50 83 C0 0C 83 C7 01 83 38 00 75 F5 8D 2C 37 8D 6C .......8.u..,7.l
006F5B60 6D 00 03 ED 03 ED 8D 45 0C 85 C0 75 05 B8 01 00 m......E...u....
006F5B70 00 00 50 FF 15 BC 45 8A 00 8B D8 83 C4 04 85 DB ..P...E.........
006F5B80 75 0D 68 F8 54 8D 00 E8 64 2B FF FF 83 C4 04 8D u.h.T...d+......
006F5B90 34 76 03 F6 03 F6 56 68 24 9B 8D 00 53 E8 8E F4 4v....Vh$...S...
006F5BA0 F9 FF 8D 04 7F 03 C0 03 C0 50 68 C8 54 8D 00 03 .........Ph.T...
006F5BB0 F3 56 E8 79 F4 F9 FF C7 04 2B 00 00 00 00 83 C4 .V.y.....+......
006F5BC0 18 83 3D F4 DB A6 00 00 89 1D 8C CB A6 00 74 30 ..=...........t0
006F5BD0 83 3B 00 74 2B EB 09 8D A4 24 00 00 00 00 8B FF .;.t+....$......
006F5BE0 8B 33 BF A0 66 8C 00 B9 05 00 00 00 33 D2 F3 A6 .3..f.......3...
006F5BF0 75 06 C7 03 98 66 8C 00 83 C3 0C 83 3B 00 75 E0 u....f......;.u.
006F5C00 83 3D 18 C6 A6 00 00 5F 5E 5D 5B 74 0A C7 05 B0 .=....._^][t....
006F5C10 BD A1 00 B4 F2 0D 0A C3 CC CC CC CC CC CC CC CC ................

;; fn006F5C20: 006F5C20
;;   Called from:
;;     006E8968 (in fn006E8910)
fn006F5C20 proc
	mov	eax,[0A6CB88h]
	test	eax,eax
	jz	6F5C3Ah

l006F5C29:
	add	dword ptr [eax],0FFh
	jnz	6F5C3Ah

l006F5C2E:
	mov	ecx,[eax+4h]
	mov	edx,[ecx+18h]
	push	eax
	call	edx
	add	esp,4h

l006F5C3A:
	mov	eax,[0A6CB8Ch]
	push	eax
	mov	dword ptr [0A6CB88h],0h
	call	dword ptr [8A45D4h]
	add	esp,4h
	mov	dword ptr [0A6CB8Ch],0h
	ret
006F5C5E                                           CC CC               ..

;; fn006F5C60: 006F5C60
;;   Called from:
;;     006F9091 (in fn006F9090)
fn006F5C60 proc
	push	edi
	call	74F680h
	mov	edi,eax
	cmp	edi,0FFh
	jz	6F5CDAh

l006F5C6D:
	mov	eax,[0A6CB90h]
	test	eax,eax
	jnz	6F5C84h

l006F5C76:
	call	74F6A0h
	test	eax,eax
	mov	[0A6CB90h],eax
	jz	6F5CDAh

l006F5C84:
	mov	ecx,[0A1BDB8h]
	cmp	ecx,edi
	jnz	6F5C97h

l006F5C8E:
	add	dword ptr [0A6CB94h],1h
	pop	edi
	ret

l006F5C97:
	cmp	ecx,0FFh
	jnz	6F5CABh

l006F5C9C:
	push	0h
	push	eax
	call	74F540h
	add	esp,8h
	test	eax,eax
	jnz	6F5CCAh

l006F5CAB:
	push	esi
	call	706BE0h
	mov	esi,eax
	mov	eax,[0A6CB90h]
	push	1h
	push	eax
	call	74F540h
	push	esi
	call	706C20h
	add	esp,0Ch
	pop	esi

l006F5CCA:
	mov	[0A1BDB8h],edi
	mov	dword ptr [0A6CB94h],1h

l006F5CDA:
	pop	edi
	ret
006F5CDC                                     CC CC CC CC             ....
006F5CE0 33 C0 83 3D B8 BD A1 00 FF 0F 95 C0 50 E8 6E F6 3..=........P.n.
006F5CF0 FE FF 83 C4 04 C3 CC CC CC CC CC CC CC CC CC CC ................
006F5D00 E8 5B FF FF FF 83 05 B8 63 A1 00 01 B8 B8 63 A1 .[......c.....c.
006F5D10 00 C3 CC CC CC CC CC CC CC CC CC CC CC CC CC CC ................
006F5D20 E8 5B 99 05 00 83 F8 FF 74 2E 8B 0D 90 CB A6 00 .[......t.......
006F5D30 85 C9 74 24 39 05 B8 BD A1 00 75 29 83 2D 94 CB ..t$9.....u).-..
006F5D40 A6 00 01 75 13 51 C7 05 B8 BD A1 00 FF FF FF FF ...u.Q..........
006F5D50 E8 1B 98 05 00 83 C4 04 83 05 B8 63 A1 00 01 B8 ...........c....
006F5D60 B8 63 A1 00 C3 A1 E0 75 A1 00 68 1C 55 8D 00 50 .c.....u..h.U..P
006F5D70 E8 0B B2 FE FF 83 C4 08 33 C0 C3 CC CC CC CC CC ........3.......
006F5D80 E8 0B FB 01 00 8B 40 04 8B 40 14 85 C0 74 07 50 ......@..@...t.P
006F5D90 E8 9B 61 00 00 59 C3 CC CC CC CC CC CC CC CC CC ..a..Y..........

;; fn006F5DA0: 006F5DA0
;;   Called from:
;;     006F7061 (in fn006F6EA0)
;;     006F8387 (in fn006F82C0)
;;     0074FA74 (in fn0074F9E0)
fn006F5DA0 proc
	mov	eax,[0A6D67Ch]
	push	esi
	mov	esi,[eax+4h]
	cmp	dword ptr [esi+8h],0h
	jnz	6F5DBCh

l006F5DAF:
	push	8D5538h
	call	6E86F0h
	add	esp,4h

l006F5DBC:
	mov	eax,[esi+8h]
	pop	esi
	ret
006F5DC1    CC CC CC CC CC CC CC CC CC CC CC CC CC CC CC  ...............

;; fn006F5DD0: 006F5DD0
;;   Called from:
;;     006E8963 (in fn006E8910)
fn006F5DD0 proc
	sub	esp,10h
	mov	eax,[0A6D67Ch]
	mov	eax,[eax+4h]
	push	ebp
	mov	ebp,[eax+8h]
	test	ebp,ebp
	mov	[esp+10h],eax
	jz	6F62ACh

l006F5DEB:
	push	ebx
	push	esi
	push	edi
	push	8D144Ch
	push	ebp
	call	6FD8B0h
	add	esp,8h
	test	eax,eax
	mov	[esp+10h],eax
	mov	ebx,0A215C0h
	jz	6F5E57h

l006F5E09:
	cmp	[eax+4h],ebx
	jz	6F5E23h

l006F5E0E:
	mov	ecx,[eax+4h]
	push	ebx
	push	ecx
	call	6D5670h
	add	esp,8h
	test	eax,eax
	jz	6F5E57h

l006F5E1F:
	mov	eax,[esp+10h]

l006F5E23:
	push	eax
	call	717230h
	add	esp,4h
	cmp	dword ptr [0A74AF0h],0h
	mov	esi,eax
	jz	6F5E44h

l006F5E37:
	push	8D55F0h
	call	716B20h
	add	esp,4h

l006F5E44:
	push	0A163B8h
	push	8B460Ch
	push	esi
	call	6FD8F0h
	add	esp,0Ch

l006F5E57:
	push	8AC594h
	push	ebp
	call	6FD8B0h
	add	esp,8h
	test	eax,eax
	mov	[esp+10h],eax
	jz	6F5F34h

l006F5E71:
	cmp	[eax+4h],ebx
	jz	6F5E8Fh

l006F5E76:
	mov	edx,[eax+4h]
	push	ebx
	push	edx
	call	6D5670h
	add	esp,8h
	test	eax,eax
	jz	6F5F34h

l006F5E8B:
	mov	eax,[esp+10h]

l006F5E8F:
	push	eax
	call	717230h
	add	esp,4h
	cmp	dword ptr [0A1BDBCh],0h
	mov	edi,eax
	mov	esi,0A1BDBCh
	jz	6F5EE2h

l006F5EA8:
	jmp	6F5EB0h
006F5EAA                               8D 9B 00 00 00 00           ......

l006F5EB0:
	cmp	dword ptr [0A74AF0h],0h
	jz	6F5EC9h

l006F5EB9:
	mov	eax,[esi]
	push	eax
	push	8D55E0h
	call	716B20h
	add	esp,8h

l006F5EC9:
	mov	ecx,[esi]
	push	0A163B8h
	push	ecx
	push	edi
	call	6FD8F0h
	add	esi,4h
	add	esp,0Ch
	cmp	dword ptr [esi],0h
	jnz	6F5EB0h

l006F5EE2:
	cmp	dword ptr [0A1BDF8h],0h
	mov	esi,0A1BDF8h
	jz	6F5F34h

l006F5EF0:
	cmp	dword ptr [0A74AF0h],0h
	jz	6F5F09h

l006F5EF9:
	mov	edx,[esi]
	push	edx
	push	8D55CCh
	call	716B20h
	add	esp,8h

l006F5F09:
	mov	eax,[esi+4h]
	push	eax
	push	edi
	call	6FD8B0h
	add	esp,8h
	test	eax,eax
	jnz	6F5F1Fh

l006F5F1A:
	mov	eax,0A163B8h

l006F5F1F:
	mov	ecx,[esi]
	push	eax
	push	ecx
	push	edi
	call	6FD8F0h
	add	esi,8h
	add	esp,0Ch
	cmp	dword ptr [esi],0h
	jnz	6F5EF0h

l006F5F34:
	push	8CA56Ch
	push	ebp
	call	6FD8B0h
	add	esp,8h
	test	eax,eax
	mov	[esp+10h],eax
	jz	6F5F97h

l006F5F4A:
	cmp	[eax+4h],ebx
	jz	6F5F64h

l006F5F4F:
	mov	edx,[eax+4h]
	push	ebx
	push	edx
	call	6D5670h
	add	esp,8h
	test	eax,eax
	jz	6F5F97h

l006F5F60:
	mov	eax,[esp+10h]

l006F5F64:
	cmp	dword ptr [0A74AF0h],0h
	jz	6F5F7Eh

l006F5F6D:
	push	8D55B8h
	call	716B20h
	mov	eax,[esp+14h]
	add	esp,4h

l006F5F7E:
	push	eax
	call	7173A0h
	push	0A163B8h
	push	8CA56Ch
	push	ebp
	call	6FD8F0h
	add	esp,10h

l006F5F97:
	lea	eax,[esp+10h]
	push	eax
	lea	ecx,[esp+18h]
	push	ecx
	lea	edx,[esp+20h]
	push	edx
	xor	ebx,ebx
	push	ebp
	mov	[esp+28h],ebx
	call	6FC050h
	add	esp,10h
	test	eax,eax
	jz	6F609Eh

l006F5FBD:
	lea	ecx,[ecx+0h]

l006F5FC0:
	mov	eax,[esp+10h]
	cmp	dword ptr [eax],1h
	jnz	6F6076h

l006F5FCD:
	mov	ecx,[esp+14h]
	cmp	dword ptr [ecx+4h],0A1B450h
	jz	6F5FF7h

l006F5FDA:
	mov	eax,[ecx+4h]
	push	0A1B450h
	push	eax
	call	6D5670h
	add	esp,8h
	test	eax,eax
	jz	6F6076h

l006F5FF3:
	mov	eax,[esp+10h]

l006F5FF7:
	cmp	dword ptr [eax+4h],0A215C0h
	jz	6F6015h

l006F6000:
	mov	ecx,[eax+4h]
	push	0A215C0h
	push	ecx
	call	6D5670h
	add	esp,8h
	test	eax,eax
	jz	6F6076h

l006F6015:
	mov	eax,[esp+14h]
	add	eax,14h
	mov	edi,8D144Ch
	mov	esi,eax
	mov	ecx,0Ch
	xor	edx,edx

l006F602A:
	rep cmpsb

l006F602C:
	jz	6F6076h

l006F602E:
	mov	edi,8AC594h
	mov	esi,eax
	mov	ecx,4h
	xor	edx,edx

l006F603C:
	rep cmpsb

l006F603E:
	jz	6F6076h

l006F6040:
	cmp	[0A74AF0h],edx
	jz	6F6056h

l006F6048:
	push	eax
	push	8D55A4h
	call	716B20h
	add	esp,8h

l006F6056:
	mov	eax,[esp+10h]
	push	eax
	call	7173A0h
	mov	ecx,[esp+18h]
	push	0A163B8h
	push	ecx
	push	ebp
	call	6FBD90h
	add	esp,10h
	add	ebx,1h

l006F6076:
	lea	edx,[esp+10h]
	push	edx
	lea	eax,[esp+18h]
	push	eax
	lea	ecx,[esp+20h]
	push	ecx
	push	ebp
	call	6FC050h
	add	esp,10h
	test	eax,eax
	jnz	6F5FC0h

l006F6096:
	test	ebx,ebx
	jg	6F5F97h

l006F609E:
	lea	edx,[esp+10h]
	push	edx
	lea	eax,[esp+18h]
	push	eax
	lea	ecx,[esp+20h]
	push	ecx
	xor	edi,edi
	push	ebp
	mov	[esp+28h],edi
	call	6FC050h
	add	esp,10h
	test	eax,eax
	jz	6F6198h

l006F60C4:
	jmp	6F60D0h
006F60C6                   8D A4 24 00 00 00 00 8D 49 00       ..$.....I.

l006F60D0:
	mov	eax,[esp+14h]
	cmp	dword ptr [eax+4h],0A1B450h
	jz	6F60F6h

l006F60DD:
	mov	edx,[eax+4h]
	push	0A1B450h
	push	edx
	call	6D5670h
	add	esp,8h
	test	eax,eax
	jz	6F6176h

l006F60F6:
	mov	eax,[esp+10h]
	cmp	dword ptr [eax+4h],0A215C0h
	jz	6F6118h

l006F6103:
	mov	eax,[eax+4h]
	push	0A215C0h
	push	eax
	call	6D5670h
	add	esp,8h
	test	eax,eax
	jz	6F6176h

l006F6118:
	mov	eax,[esp+14h]
	add	eax,14h
	mov	edi,8D144Ch
	mov	esi,eax
	mov	ecx,0Ch
	xor	edx,edx

l006F612D:
	rep cmpsb

l006F612F:
	jz	6F6176h

l006F6131:
	mov	edi,8AC594h
	mov	esi,eax
	mov	ecx,4h
	xor	edx,edx

l006F613F:
	rep cmpsb

l006F6141:
	jz	6F6176h

l006F6143:
	cmp	[0A74AF0h],edx
	jz	6F6159h

l006F614B:
	push	eax
	push	8D5590h
	call	716B20h
	add	esp,8h

l006F6159:
	mov	eax,[esp+10h]
	push	eax
	call	7173A0h
	mov	ecx,[esp+18h]
	push	0A163B8h
	push	ecx
	push	ebp
	call	6FBD90h
	add	esp,10h

l006F6176:
	lea	edx,[esp+10h]
	push	edx
	lea	eax,[esp+18h]
	push	eax
	lea	ecx,[esp+20h]
	push	ecx
	push	ebp
	call	6FC050h
	add	esp,10h
	test	eax,eax
	jnz	6F60D0h

l006F6196:
	xor	edi,edi

l006F6198:
	push	8AC594h
	push	ebp
	call	6FD8B0h
	add	esp,8h
	cmp	eax,edi
	mov	[esp+10h],eax
	jz	6F6202h

l006F61AE:
	cmp	dword ptr [eax+4h],0A215C0h
	jz	6F61D0h

l006F61B7:
	mov	edx,[eax+4h]
	push	0A215C0h
	push	edx
	call	6D5670h
	add	esp,8h
	test	eax,eax
	jz	6F6202h

l006F61CC:
	mov	eax,[esp+10h]

l006F61D0:
	cmp	[0A74AF0h],edi
	jz	6F61E9h

l006F61D8:
	push	8D5580h
	call	716B20h
	mov	eax,[esp+14h]
	add	esp,4h

l006F61E9:
	push	eax
	call	7173A0h
	push	0A163B8h
	push	8AC594h
	push	ebp
	call	6FD8F0h
	add	esp,10h

l006F6202:
	push	8D144Ch
	push	ebp
	call	6FD8B0h
	add	esp,8h
	cmp	eax,edi
	mov	[esp+10h],eax
	jz	6F626Ch

l006F6218:
	cmp	dword ptr [eax+4h],0A215C0h
	jz	6F623Ah

l006F6221:
	mov	eax,[eax+4h]
	push	0A215C0h
	push	eax
	call	6D5670h
	add	esp,8h
	test	eax,eax
	jz	6F626Ch

l006F6236:
	mov	eax,[esp+10h]

l006F623A:
	cmp	[0A74AF0h],edi
	jz	6F6253h

l006F6242:
	push	8D5568h
	call	716B20h
	mov	eax,[esp+14h]
	add	esp,4h

l006F6253:
	push	eax
	call	7173A0h
	push	0A163B8h
	push	8D144Ch
	push	ebp
	call	6FD8F0h
	add	esp,10h

l006F626C:
	push	ebp
	call	6FBF30h
	mov	esi,[esp+20h]
	add	esp,4h
	mov	[esi+8h],edi
	add	dword ptr [ebp+0h],0FFh
	jnz	6F628Eh

l006F6282:
	mov	ecx,[ebp+4h]
	mov	edx,[ecx+18h]
	push	ebp
	call	edx
	add	esp,4h

l006F628E:
	mov	eax,[esi+14h]
	cmp	eax,edi
	jz	6F62A9h

l006F6295:
	mov	[esi+14h],edi
	add	dword ptr [eax],0FFh
	jnz	6F62A9h

l006F629D:
	mov	ecx,[eax+4h]
	mov	edx,[ecx+18h]
	push	eax
	call	edx
	add	esp,4h

l006F62A9:
	pop	edi
	pop	esi
	pop	ebx

l006F62AC:
	pop	ebp
	add	esp,10h
	ret
006F62B1    CC CC CC CC CC CC CC CC CC CC CC CC CC CC CC  ...............
006F62C0 A1 B0 BD A1 00 C3 CC CC CC CC CC CC CC CC CC CC ................

;; fn006F62D0: 006F62D0
;;   Called from:
;;     006F80F0 (in fn006F8050)
;;     0074FAC1 (in fn0074F9E0)
fn006F62D0 proc
	cmp	dword ptr [0A6CB88h],0h
	jnz	6F62E8h

l006F62D9:
	call	6FDCC0h
	test	eax,eax
	mov	[0A6CB88h],eax
	jnz	6F62E8h

l006F62E7:
	ret

l006F62E8:
	mov	eax,[0A6D67Ch]
	push	esi
	mov	esi,[eax+4h]
	cmp	dword ptr [esi+8h],0h
	jnz	6F6304h

l006F62F7:
	push	8D5538h
	call	6E86F0h
	add	esp,4h

l006F6304:
	mov	eax,[esi+8h]
	push	edi
	mov	edi,[esp+0Ch]
	push	edi
	push	eax
	call	6FD8B0h
	mov	esi,eax
	add	esp,8h
	test	esi,esi
	jz	6F637Fh

l006F631C:
	mov	eax,[esi+4h]
	cmp	eax,0A215C0h
	jz	6F6338h

l006F6326:
	push	0A215C0h
	push	eax
	call	6D5670h
	add	esp,8h
	test	eax,eax
	jz	6F637Fh

l006F6338:
	push	esi
	call	717230h
	add	esp,4h
	test	eax,eax
	jz	6F6394h

l006F6345:
	push	eax
	call	6FDE60h
	mov	esi,eax
	add	esp,4h
	test	esi,esi
	jz	6F6394h

l006F6354:
	mov	ecx,[esp+10h]
	mov	edx,[0A6CB88h]
	push	esi
	push	ecx
	push	edx
	call	6FD8F0h
	add	esp,0Ch
	add	dword ptr [esi],0FFh
	jnz	6F637Ah

l006F636E:
	mov	eax,[esi+4h]
	mov	ecx,[eax+18h]
	push	esi
	call	ecx
	add	esp,4h

l006F637A:
	pop	edi
	mov	eax,esi
	pop	esi
	ret

l006F637F:
	mov	edx,[0A18720h]
	push	edi
	push	8D5608h
	push	edx
	call	6E15D0h
	add	esp,0Ch

l006F6394:
	pop	edi
	xor	eax,eax
	pop	esi
	ret
006F6399                            CC CC CC CC CC CC CC          .......

;; fn006F63A0: 006F63A0
;;   Called from:
;;     006F64BA (in fn006F6490)
;;     006F6DF9 (in fn006F6D50)
;;     006F783A (in fn006F7810)
;;     006F898D (in fn006F8960)
fn006F63A0 proc
	mov	eax,[0A6D67Ch]
	push	ebx
	push	esi
	mov	esi,[eax+4h]
	cmp	dword ptr [esi+8h],0h
	push	edi
	jnz	6F63BEh

l006F63B1:
	push	8D5538h
	call	6E86F0h
	add	esp,4h

l006F63BE:
	mov	ebx,[esp+10h]
	mov	edi,[esi+8h]
	push	ebx
	push	edi
	call	6FD8B0h
	mov	esi,eax
	add	esp,8h
	test	esi,esi
	jz	6F63F1h

l006F63D5:
	mov	eax,[esi+4h]
	cmp	eax,0A215C0h
	jz	6F6437h

l006F63DF:
	push	0A215C0h
	push	eax
	call	6D5670h
	add	esp,8h
	test	eax,eax
	jnz	6F6437h

l006F63F1:
	push	ebx
	call	717180h
	mov	esi,eax
	add	esp,4h
	test	esi,esi
	jz	6F6420h

l006F6400:
	push	esi
	push	ebx
	push	edi
	call	6FD8F0h
	add	esp,0Ch
	test	eax,eax
	jz	6F6426h

l006F640F:
	add	dword ptr [esi],0FFh
	jnz	6F6420h

l006F6414:
	mov	ecx,[esi+4h]
	mov	edx,[ecx+18h]
	push	esi
	call	edx
	add	esp,4h

l006F6420:
	pop	edi
	pop	esi
	xor	eax,eax
	pop	ebx
	ret

l006F6426:
	add	dword ptr [esi],0FFh
	jnz	6F6437h

l006F642B:
	mov	eax,[esi+4h]
	mov	ecx,[eax+18h]
	push	esi
	call	ecx
	add	esp,4h

l006F6437:
	pop	edi
	mov	eax,esi
	pop	esi
	pop	ebx
	ret
006F643D                                        CC CC CC              ...

;; fn006F6440: 006F6440
;;   Called from:
;;     006F655D (in fn006F6490)
fn006F6440 proc
	mov	eax,[0A6D67Ch]
	push	esi
	mov	esi,[eax+4h]
	cmp	dword ptr [esi+8h],0h
	jnz	6F645Ch

l006F644F:
	push	8D5538h
	call	6E86F0h
	add	esp,4h

l006F645C:
	mov	esi,[esi+8h]
	push	edi
	push	esi
	call	6FD8B0h
	add	esp,8h
	test	eax,eax
	jz	6F6488h

l006F646D:
	push	edi
	push	esi
	call	6FD950h
	add	esp,8h
	test	eax,eax
	jge	6F6488h

l006F647B:
	push	8D563Ch
	call	6E86F0h
	add	esp,4h

l006F6488:
	pop	esi
	ret
006F648A                               CC CC CC CC CC CC           ......

;; fn006F6490: 006F6490
;;   Called from:
;;     006F6792 (in fn006F6730)
;;     006F6A57 (in fn006F68F0)
;;     006F6E49 (in fn006F6D50)
fn006F6490 proc
	push	ecx
	mov	eax,[0A6D67Ch]
	push	esi
	mov	esi,[eax+4h]
	cmp	dword ptr [esi+8h],0h
	push	edi
	jnz	6F64AEh

l006F64A1:
	push	8D5538h
	call	6E86F0h
	add	esp,4h

l006F64AE:
	mov	ecx,[esi+8h]
	mov	edi,[esp+10h]
	push	edi
	mov	[esp+0Ch],ecx
	call	6F63A0h
	add	esp,4h
	test	eax,eax
	jnz	6F64CAh

l006F64C6:
	pop	edi
	pop	esi
	pop	ecx
	ret

l006F64CA:
	push	ebx
	push	eax
	call	717230h
	mov	ebx,eax
	push	8D41A4h
	push	ebx
	call	6FD8B0h
	add	esp,0Ch
	test	eax,eax
	jnz	6F64FDh

l006F64E5:
	call	708800h
	push	eax
	push	8D41A4h
	push	ebx
	call	6FD8F0h
	add	esp,0Ch
	test	eax,eax
	jnz	6F655Dh

l006F64FD:
	mov	eax,[esp+1Ch]
	test	eax,eax
	push	ebp
	mov	ebp,[esp+1Ch]
	jz	6F651Eh

l006F650A:
	push	eax
	call	6ECAC0h
	mov	esi,eax
	add	esp,4h
	test	esi,esi
	jnz	6F6524h

l006F6519:
	call	6E1160h

l006F651E:
	mov	esi,[ebp+30h]
	add	dword ptr [esi],1h

l006F6524:
	push	esi
	push	8D42BCh
	push	ebx
	call	6FD8F0h
	add	esp,0Ch
	test	eax,eax
	jz	6F653Ch

l006F6537:
	call	6E1160h

l006F653C:
	add	dword ptr [esi],0FFh
	jnz	6F654Dh

l006F6541:
	mov	edx,[esi+4h]
	mov	eax,[edx+18h]
	push	esi
	call	eax
	add	esp,4h

l006F654D:
	push	ebx
	push	ebx
	push	ebp
	call	70BC90h
	add	esp,0Ch
	test	eax,eax
	pop	ebp
	jnz	6F6569h

l006F655D:
	call	6F6440h
	pop	ebx
	pop	edi
	xor	eax,eax
	pop	esi
	pop	ecx
	ret

l006F6569:
	add	dword ptr [eax],0FFh
	jnz	6F657Ah

l006F656E:
	mov	ecx,[eax+4h]
	mov	edx,[ecx+18h]
	push	eax
	call	edx
	add	esp,4h

l006F657A:
	mov	eax,[esp+0Ch]
	push	edi
	push	eax
	call	6FD8B0h
	add	esp,8h
	test	eax,eax
	jnz	6F65A8h

l006F658C:
	mov	ecx,[0A16F8Ch]
	push	edi
	push	8D5670h
	push	ecx
	call	6E15D0h
	add	esp,0Ch
	pop	ebx
	pop	edi
	xor	eax,eax
	pop	esi
	pop	ecx
	ret

l006F65A8:
	add	dword ptr [eax],1h
	pop	ebx
	pop	edi
	pop	esi
	pop	ecx
	ret

;; fn006F65B0: 006F65B0
;;   Called from:
;;     006F69A9 (in fn006F68F0)
fn006F65B0 proc
	push	ebx
	push	ebp
	mov	ebp,[esp+0Ch]
	mov	eax,edx
	push	esi
	lea	esi,[eax+1h]
	lea	esp,[esp+0h]

l006F65C0:
	mov	cl,[eax]
	add	eax,1h
	test	cl,cl
	jnz	6F65C0h

l006F65C9:
	sub	eax,esi
	mov	ebx,eax
	lea	eax,[ebx+2h]
	cmp	eax,[esp+14h]
	jbe	6F65DCh

l006F65D6:
	pop	esi
	pop	ebp
	xor	eax,eax
	pop	ebx
	ret

l006F65DC:
	cmp	ebx,4h
	jc	6F65FAh

l006F65E1:
	push	edi
	mov	edi,8D54C0h
	lea	esi,[ebx+edx-4h]
	mov	ecx,5h
	xor	eax,eax

l006F65F2:
	rep cmpsb

l006F65F4:
	pop	edi
	jnz	6F65FAh

l006F65F7:
	sub	ebx,1h

l006F65FA:
	push	ebx
	push	edx
	push	ebp
	call	695030h
	mov	ecx,[0A6DBF4h]
	add	esp,0Ch
	neg	ecx
	sbb	cl,cl
	and	cl,0Ch
	add	cl,63h
	pop	esi
	mov	[ebx+ebp],cl
	mov	byte ptr [ebx+ebp+1h],0h
	mov	eax,ebp
	pop	ebp
	pop	ebx
	ret
006F6623          CC CC CC CC CC CC CC CC CC CC CC CC CC    .............

;; fn006F6630: 006F6630
;;   Called from:
;;     006F69BC (in fn006F68F0)
fn006F6630 proc
	push	esi
	push	8A7744h
	push	edi
	call	659040h
	mov	esi,eax
	add	esp,8h
	test	esi,esi
	jz	6F6677h

l006F6645:
	push	esi
	call	737370h
	add	esp,4h
	cmp	eax,[0A1BDB0h]
	jz	6F667Bh

l006F6656:
	cmp	dword ptr [0A74AF0h],0h
	jz	6F666Dh

l006F665F:
	push	edi
	push	8D56C8h
	call	716B20h
	add	esp,8h

l006F666D:
	push	esi
	call	dword ptr [8A4644h]
	add	esp,4h

l006F6677:
	xor	eax,eax
	pop	esi
	ret

l006F667B:
	push	esi
	call	737370h
	cdq
	add	esp,4h
	cmp	eax,[esp+0Ch]
	jnz	6F6691h

l006F668B:
	cmp	edx,[esp+10h]
	jz	6F66B6h

l006F6691:
	cmp	dword ptr [0A74AF0h],0h
	jz	6F66A8h

l006F669A:
	push	edi
	push	8D56B4h
	call	716B20h
	add	esp,8h

l006F66A8:
	push	esi
	call	dword ptr [8A4644h]
	add	esp,4h
	xor	eax,eax
	pop	esi
	ret

l006F66B6:
	cmp	dword ptr [0A74AF0h],0h
	jz	6F66D2h

l006F66BF:
	mov	eax,[esp+8h]
	push	eax
	push	edi
	push	8D56A0h
	call	716B20h
	add	esp,0Ch

l006F66D2:
	mov	eax,esi
	pop	esi
	ret
006F66D6                   CC CC CC CC CC CC CC CC CC CC       ..........

;; fn006F66E0: 006F66E0
;;   Called from:
;;     006F6769 (in fn006F6730)
;;     006F69CD (in fn006F68F0)
fn006F66E0 proc
	push	esi
	push	eax
	call	737880h
	mov	esi,eax
	add	esp,4h
	test	esi,esi
	jz	6F6723h

l006F66F0:
	cmp	dword ptr [esi+4h],0A27458h
	jz	6F6725h

l006F66F9:
	mov	ecx,[esp+8h]
	mov	edx,[0A16F8Ch]
	push	ecx
	push	8D56DCh
	push	edx
	call	6E15D0h
	add	esp,0Ch
	add	dword ptr [esi],0FFh
	jnz	6F6723h

l006F6717:
	mov	eax,[esi+4h]
	mov	ecx,[eax+18h]
	push	esi
	call	ecx
	add	esp,4h

l006F6723:
	xor	eax,eax

l006F6725:
	pop	esi
	ret
006F6727                      CC CC CC CC CC CC CC CC CC        .........

;; fn006F6730: 006F6730
;;   Called from:
;;     006F8310 (in fn006F82C0)
fn006F6730 proc
	push	esi
	push	edi
	mov	esi,eax
	push	esi
	mov	edi,ecx
	call	737370h
	add	esp,4h
	cmp	eax,[0A1BDB0h]
	jz	6F6760h

l006F6747:
	mov	eax,[0A16F8Ch]
	push	edi
	push	8D571Ch
	push	eax
	call	6E15D0h
	add	esp,0Ch

l006F675B:
	pop	edi
	xor	eax,eax
	pop	esi
	ret

l006F6760:
	push	esi
	call	737370h
	push	edi
	mov	eax,esi
	call	6F66E0h
	mov	esi,eax
	add	esp,8h
	test	esi,esi
	jz	6F675Bh

l006F6777:
	cmp	dword ptr [0A74AF0h],0h
	jz	6F678Fh

l006F6780:
	push	edi
	push	ebx
	push	8D56F8h
	call	716B20h
	add	esp,0Ch

l006F678F:
	push	edi
	push	esi
	push	ebx
	call	6F6490h
	add	esp,0Ch
	add	dword ptr [esi],0FFh
	mov	edi,eax
	jnz	6F67ADh

l006F67A1:
	mov	ecx,[esi+4h]
	mov	edx,[ecx+18h]
	push	esi
	call	edx
	add	esp,4h

l006F67AD:
	mov	eax,edi
	pop	edi
	pop	esi
	ret
006F67B2       CC CC CC CC CC CC CC CC CC CC CC CC CC CC   ..............

;; fn006F67C0: 006F67C0
;;   Called from:
;;     006F6A0D (in fn006F68F0)
fn006F67C0 proc
	push	ebx
	push	esi
	xor	ebx,ebx
	call	740CC0h
	mov	esi,eax
	test	esi,esi
	jnz	6F67D2h

l006F67CF:
	pop	esi
	pop	ebx
	ret

l006F67D2:
	mov	eax,[esp+0Ch]
	push	esi
	push	0h
	push	0h
	push	0h
	push	0h
	push	101h
	push	edi
	push	eax
	call	6E8B50h
	add	esp,20h
	test	eax,eax
	jz	6F6801h

l006F67F2:
	push	esi
	push	0h
	push	edi
	push	eax
	call	72E790h
	add	esp,10h
	mov	ebx,eax

l006F6801:
	push	esi
	call	740D60h
	add	esp,4h
	pop	esi
	mov	eax,ebx
	pop	ebx
	ret
006F680F                                              CC                .

;; fn006F6810: 006F6810
;;   Called from:
;;     006F6A48 (in fn006F68F0)
fn006F6810 proc
	push	esi
	push	8A7F88h
	push	ebx
	call	659040h
	mov	esi,eax
	add	esp,8h
	test	esi,esi
	jnz	6F6841h

l006F6825:
	cmp	[0A74AF0h],eax
	jz	6F68ECh

l006F6831:
	push	ebx
	push	8D5758h
	call	716B20h
	add	esp,8h
	pop	esi
	ret

l006F6841:
	mov	eax,[0A1BDB0h]
	push	edi
	push	2h
	push	esi
	push	eax
	call	736560h
	push	2h
	push	esi
	push	0h
	call	736560h
	mov	ecx,[esp+24h]
	push	2h
	push	esi
	push	ecx
	call	736590h
	mov	edi,[8A4580h]
	push	esi
	call	edi
	add	esp,28h
	test	eax,eax
	jnz	6F68C3h

l006F6877:
	push	esi
	call	dword ptr [8A458Ch]
	add	esp,4h
	test	eax,eax
	jnz	6F68C3h

l006F6885:
	push	eax
	push	4h
	push	esi
	call	dword ptr [8A464Ch]
	mov	edx,[esp+1Ch]
	push	2h
	push	esi
	push	edx
	call	736560h
	push	esi
	call	edi
	push	esi
	call	dword ptr [8A4644h]
	add	esp,20h
	cmp	dword ptr [0A74AF0h],0h
	jz	6F68EBh

l006F68B2:
	push	ebx
	push	8D574Ch
	call	716B20h
	add	esp,8h
	pop	edi
	pop	esi
	ret

l006F68C3:
	cmp	dword ptr [0A74AF0h],0h
	jz	6F68DAh

l006F68CC:
	push	ebx
	push	8D5738h
	call	716B20h
	add	esp,8h

l006F68DA:
	push	esi
	call	dword ptr [8A4644h]
	push	ebx
	call	dword ptr [8A455Ch]
	add	esp,8h

l006F68EB:
	pop	edi

l006F68EC:
	pop	esi
	ret
006F68EE                                           CC CC               ..

;; fn006F68F0: 006F68F0
;;   Called from:
;;     006F8303 (in fn006F82C0)
fn006F68F0 proc
	sub	esp,11Ch
	mov	eax,[0A14188h]
	xor	eax,esp
	mov	[esp+118h],eax
	mov	eax,[esp+120h]
	push	ebx
	push	esi
	mov	[esp+8h],eax
	mov	eax,[esp+12Ch]
	push	edi
	mov	esi,ecx
	push	eax
	push	esi
	mov	[esp+18h],eax
	call	74F9A0h
	mov	edi,eax
	mov	ebx,edx
	mov	ecx,edi
	and	ecx,ebx
	add	esp,8h
	cmp	ecx,0FFh
	mov	[esp+18h],edi
	jnz	6F6969h

l006F693A:
	mov	edx,[0A175E0h]
	push	esi
	push	8D57B0h
	push	edx
	call	6E15D0h
	add	esp,0Ch
	pop	edi
	pop	esi
	xor	eax,eax
	pop	ebx
	mov	ecx,[esp+118h]
	xor	ecx,esp
	call	694B8Eh
	add	esp,11Ch
	ret

l006F6969:
	xor	eax,eax
	or	eax,ebx
	jz	6F699Ch

l006F696F:
	mov	eax,[0A18598h]
	push	8D5784h
	push	eax
	call	6E0F80h
	add	esp,8h
	pop	edi
	pop	esi
	xor	eax,eax
	pop	ebx
	mov	ecx,[esp+118h]
	xor	ecx,esp
	call	694B8Eh
	add	esp,11Ch
	ret

l006F699C:
	push	ebp
	lea	ecx,[esp+24h]
	push	101h
	push	ecx
	mov	edx,esi
	call	6F65B0h
	mov	ebp,eax
	add	esp,8h
	test	ebp,ebp
	jz	6F6A06h

l006F69B7:
	push	ebx
	push	edi
	push	esi
	mov	edi,ebp
	call	6F6630h
	add	esp,0Ch
	test	eax,eax
	mov	[esp+18h],eax
	jz	6F6A06h

l006F69CC:
	push	ebp
	call	6F66E0h
	mov	edx,[esp+1Ch]
	push	edx
	mov	edi,eax
	call	dword ptr [8A4644h]
	add	esp,8h
	test	edi,edi
	jz	6F6A1Bh

l006F69E6:
	cmp	dword ptr [0A74AF0h],0h
	jz	6F6A02h

l006F69EF:
	mov	eax,[esp+10h]
	push	ebp
	push	eax
	push	8D56F8h
	call	716B20h
	add	esp,0Ch

l006F6A02:
	mov	esi,ebp
	jmp	6F6A50h

l006F6A06:
	mov	ecx,[esp+14h]
	push	ecx
	mov	edi,esi
	call	6F67C0h
	mov	edi,eax
	add	esp,4h
	test	edi,edi
	jnz	6F6A1Fh

l006F6A1B:
	xor	eax,eax
	jmp	6F6A74h

l006F6A1F:
	cmp	dword ptr [0A74AF0h],0h
	jz	6F6A3Bh

l006F6A28:
	mov	edx,[esp+10h]
	push	esi
	push	edx
	push	8D576Ch
	call	716B20h
	add	esp,0Ch

l006F6A3B:
	test	ebp,ebp
	jz	6F6A50h

l006F6A3F:
	mov	eax,[esp+1Ch]
	push	ebx
	push	eax
	push	edi
	mov	ebx,ebp
	call	6F6810h
	add	esp,0Ch

l006F6A50:
	mov	ecx,[esp+10h]
	push	esi
	push	edi
	push	ecx
	call	6F6490h
	add	esp,0Ch
	add	dword ptr [edi],0FFh
	mov	esi,eax
	jnz	6F6A72h

l006F6A66:
	mov	edx,[edi+4h]
	mov	eax,[edx+18h]
	push	edi
	call	eax
	add	esp,4h

l006F6A72:
	mov	eax,esi

l006F6A74:
	mov	ecx,[esp+128h]
	pop	ebp
	pop	edi
	pop	esi
	pop	ebx
	xor	ecx,esp
	call	694B8Eh
	add	esp,11Ch
	ret
006F6A8D                                        CC CC CC              ...

;; fn006F6A90: 006F6A90
;;   Called from:
;;     006F7B5A (in fn006F7890)
fn006F6A90 proc
	push	esi
	push	edi
	mov	edi,[0A1BDB4h]
	xor	esi,esi
	cmp	[edi],esi
	jz	6F6AD6h

l006F6A9E:
	mov	ecx,[edi]

l006F6AA0:
	mov	eax,ebx

l006F6AA2:
	mov	dl,[eax]
	cmp	dl,[ecx]
	jnz	6F6AC2h

l006F6AA8:
	test	dl,dl
	jz	6F6ABEh

l006F6AAC:
	mov	dl,[eax+1h]
	cmp	dl,[ecx+1h]
	jnz	6F6AC2h

l006F6AB4:
	add	eax,2h
	add	ecx,2h
	test	dl,dl
	jnz	6F6AA2h

l006F6ABE:
	xor	eax,eax
	jmp	6F6AC7h

l006F6AC2:
	sbb	eax,eax
	sbb	eax,0FFh

l006F6AC7:
	test	eax,eax
	jz	6F6ADBh

l006F6ACB:
	mov	ecx,[edi+esi*8+8h]
	add	esi,1h
	test	ecx,ecx
	jnz	6F6AA0h

l006F6AD6:
	pop	edi
	xor	eax,eax
	pop	esi
	ret

l006F6ADB:
	xor	eax,eax
	cmp	[edi+esi*8+4h],eax
	pop	edi
	setnz	al
	pop	esi
	lea	eax,[eax+eax-1h]
	ret
006F6AEB                                  CC CC CC CC CC            .....

;; fn006F6AF0: 006F6AF0
;;   Called from:
;;     006F7DB3 (in fn006F7890)
fn006F6AF0 proc
	mov	eax,[esp+8h]
	push	ebp
	push	eax
	call	6F2750h
	mov	ebp,eax
	add	esp,4h
	test	ebp,ebp
	jge	6F6B08h

l006F6B04:
	xor	eax,eax
	pop	ebp
	ret

l006F6B08:
	push	esi
	mov	esi,[esp+0Ch]
	push	ebx
	push	esi
	call	6FBCC0h
	add	esp,8h
	test	eax,eax
	jnz	6F6BECh

l006F6B1F:
	push	0A163B8h
	push	ebx
	push	esi
	call	6FBD90h
	add	esp,0Ch
	test	eax,eax
	jz	6F6B37h

l006F6B32:
	pop	esi
	xor	eax,eax
	pop	ebp
	ret

l006F6B37:
	push	edi
	xor	edi,edi
	test	ebp,ebp
	jle	6F6B87h

l006F6B3E:
	mov	edi,edi

l006F6B40:
	mov	ecx,[esp+14h]
	push	edi
	push	ecx
	call	6F2790h
	add	esp,8h
	test	eax,eax
	jz	6F6BE3h

l006F6B56:
	push	0h
	push	ebx
	push	eax
	call	703AF0h
	mov	esi,eax
	add	esp,0Ch
	test	esi,esi
	jnz	6F6BBDh

l006F6B68:
	mov	edx,[0A16F8Ch]
	push	edx
	call	6E1110h
	add	esp,4h
	test	eax,eax
	jz	6F6BE3h

l006F6B7B:
	call	6E1160h
	add	edi,1h
	cmp	edi,ebp
	jl	6F6B40h

l006F6B87:
	push	0h
	push	ebx
	push	0A1C560h
	call	703AF0h
	mov	esi,eax
	add	esp,0Ch
	test	esi,esi
	jnz	6F6BBDh

l006F6B9D:
	mov	eax,[0A16F8Ch]
	push	eax
	call	6E1110h
	add	esp,4h
	test	eax,eax
	jz	6F6BE9h

l006F6BAF:
	call	6E1160h
	pop	edi
	pop	esi
	mov	eax,0A163B8h
	pop	ebp
	ret

l006F6BBD:
	mov	ecx,[esp+10h]
	push	esi
	push	ebx
	push	ecx
	call	6FBD90h
	add	esp,0Ch
	add	dword ptr [esi],0FFh
	mov	edi,eax
	jnz	6F6BDFh

l006F6BD3:
	mov	edx,[esi+4h]
	mov	eax,[edx+18h]
	push	esi
	call	eax
	add	esp,4h

l006F6BDF:
	test	edi,edi
	jz	6F6BE9h

l006F6BE3:
	pop	edi
	pop	esi
	xor	eax,eax
	pop	ebp
	ret

l006F6BE9:
	mov	eax,esi
	pop	edi

l006F6BEC:
	pop	esi
	pop	ebp
	ret
006F6BEF                                              CC                .

;; fn006F6BF0: 006F6BF0
;;   Called from:
;;     006F7E70 (in fn006F7890)
fn006F6BF0 proc
	mov	eax,ebx
	lea	edx,[eax+1h]

l006F6BF5:
	mov	cl,[eax]
	add	eax,1h
	test	cl,cl
	jnz	6F6BF5h

l006F6BFE:
	sub	eax,edx
	push	ebp
	mov	ebp,eax
	lea	eax,[ebp+0Dh]
	cmp	eax,100h
	jc	6F6C11h

l006F6C0D:
	xor	eax,eax
	pop	ebp
	ret

l006F6C11:
	push	esi
	mov	byte ptr [ebx+ebp],5Ch
	mov	ecx,[8D57E0h]
	push	edi
	lea	edi,[ebp+1h]
	lea	esi,[edi+ebx]
	mov	[esi],ecx
	mov	edx,[8D57E4h]
	mov	[esi+4h],edx
	mov	eax,[8D57E8h]
	push	ebx
	mov	[esi+8h],eax
	call	656460h
	add	esp,4h
	test	eax,eax
	jl	6F6C50h

l006F6C43:
	pop	edi
	pop	esi
	mov	byte ptr [ebx+ebp],0h
	mov	eax,1h
	pop	ebp
	ret

l006F6C50:
	mov	eax,esi
	lea	edx,[eax+1h]

l006F6C55:
	mov	cl,[eax]
	add	eax,1h
	test	cl,cl
	jnz	6F6C55h

l006F6C5E:
	sub	eax,edx
	add	edi,eax
	cmp	dword ptr [0A6DBF4h],0h
	mov	edx,8D57DCh
	jnz	6F6C75h

l006F6C70:
	mov	edx,8C4880h

l006F6C75:
	lea	ecx,[edi+ebx]

l006F6C78:
	mov	al,[edx]
	mov	[ecx],al
	add	edx,1h
	add	ecx,1h
	test	al,al
	jnz	6F6C78h

l006F6C86:
	push	ebx
	call	656460h
	add	esp,4h
	test	eax,eax
	jge	6F6C43h

l006F6C93:
	pop	edi
	xor	eax,eax
	pop	esi
	mov	[ebx+ebp],al
	pop	ebp
	ret
006F6C9C                                     CC CC CC CC             ....

;; fn006F6CA0: 006F6CA0
;;   Called from:
;;     006F6D56 (in fn006F6D50)
;;     006F7B12 (in fn006F7890)
;;     006F7B8A (in fn006F7890)
fn006F6CA0 proc
	mov	eax,[0A2EC98h]
	mov	ecx,[eax]
	test	ecx,ecx
	push	ebx
	jz	6F6CE5h

l006F6CAC:
	lea	esp,[esp+0h]

l006F6CB0:
	mov	edx,esi

l006F6CB2:
	mov	bl,[ecx]
	cmp	bl,[edx]
	jnz	6F6CD2h

l006F6CB8:
	test	bl,bl
	jz	6F6CCEh

l006F6CBC:
	mov	bl,[ecx+1h]
	cmp	bl,[edx+1h]
	jnz	6F6CD2h

l006F6CC4:
	add	ecx,2h
	add	edx,2h
	test	bl,bl
	jnz	6F6CB2h

l006F6CCE:
	xor	ecx,ecx
	jmp	6F6CD7h

l006F6CD2:
	sbb	ecx,ecx
	sbb	ecx,0FFh

l006F6CD7:
	test	ecx,ecx
	jz	6F6CE7h

l006F6CDB:
	mov	ecx,[eax+0Ch]
	add	eax,0Ch
	test	ecx,ecx
	jnz	6F6CB0h

l006F6CE5:
	xor	eax,eax

l006F6CE7:
	pop	ebx
	ret
006F6CE9                            CC CC CC CC CC CC CC          .......
006F6CF0 56 8B F0 E8 A8 FF FF FF 85 C0 75 18 A1 8C 6F A1 V.........u...o.
006F6D00 00 56 68 10 58 8D 00 50 E8 C3 A8 FE FF 83 C4 0C .Vh.X..P........
006F6D10 33 C0 5E C3 8B 48 04 85 C9 75 19 8B 0D 8C 6F A1 3.^..H...u....o.
006F6D20 00 56 68 EC 57 8D 00 51 E8 A3 A8 FE FF 83 C4 0C .Vh.W..Q........
006F6D30 33 C0 5E C3 8B 40 08 85 C0 7D 02 F7 D8 50 51 E8 3.^..@...}...PQ.
006F6D40 CC 06 04 00 83 C4 08 5E C3 CC CC CC CC CC CC CC .......^........

;; fn006F6D50: 006F6D50
;;   Called from:
;;     006F834B (in fn006F82C0)
fn006F6D50 proc
	push	esi
	mov	esi,[esp+8h]
	push	edi
	call	6F6CA0h
	mov	edi,eax
	test	edi,edi
	jnz	6F6D64h

l006F6D61:
	pop	edi
	pop	esi
	ret

l006F6D64:
	cmp	dword ptr [edi+4h],0h
	jnz	6F6D84h

l006F6D6A:
	mov	eax,[0A16F8Ch]
	push	esi
	push	8D57ECh
	push	eax
	call	6E15D0h
	add	esp,0Ch
	pop	edi
	or	eax,0FFh
	pop	esi
	ret

l006F6D84:
	push	ebx
	mov	ebx,[edi+8h]
	xor	ecx,ecx
	test	ebx,ebx
	setl	cl
	push	ebp
	mov	ebp,ecx
	test	ebp,ebp
	jz	6F6D98h

l006F6D96:
	neg	ebx

l006F6D98:
	cmp	dword ptr [0A74AF0h],0h
	jz	6F6DBEh

l006F6DA1:
	test	ebp,ebp
	mov	eax,8D5890h
	jnz	6F6DAFh

l006F6DAA:
	mov	eax,8A698Fh

l006F6DAF:
	push	eax
	push	esi
	push	8D5878h
	call	716B20h
	add	esp,0Ch

l006F6DBE:
	mov	edx,[edi+4h]
	push	ebx
	push	edx
	call	737410h
	mov	ebx,eax
	add	esp,8h
	test	ebx,ebx
	jz	6F6E68h

l006F6DD5:
	cmp	dword ptr [ebx+4h],0A27458h
	jz	6F6DF4h

l006F6DDE:
	mov	eax,[0A16B7Ch]
	push	esi
	push	8D584Ch
	push	eax
	call	6E15D0h
	add	esp,0Ch
	jmp	6F6E57h

l006F6DF4:
	test	ebp,ebp
	jz	6F6E42h

l006F6DF8:
	push	esi
	call	6F63A0h
	add	esp,4h
	test	eax,eax
	jz	6F6E57h

l006F6E05:
	push	eax
	call	717230h
	push	esi
	mov	ebp,eax
	call	6F1A70h
	mov	edi,eax
	add	esp,8h
	test	edi,edi
	jz	6F6E57h

l006F6E1C:
	push	edi
	push	8D5840h
	push	ebp
	call	6FD8F0h
	add	esp,0Ch
	add	dword ptr [edi],0FFh
	mov	ebp,eax
	jnz	6F6E3Eh

l006F6E32:
	mov	ecx,[edi+4h]
	mov	edx,[ecx+18h]
	push	edi
	call	edx
	add	esp,4h

l006F6E3E:
	test	ebp,ebp
	jnz	6F6E57h

l006F6E42:
	push	8D5834h
	push	ebx
	push	esi
	call	6F6490h
	mov	esi,eax
	add	esp,0Ch
	test	esi,esi
	jnz	6F6E70h

l006F6E57:
	add	dword ptr [ebx],0FFh
	jnz	6F6E68h

l006F6E5C:
	mov	eax,[ebx+4h]
	mov	ecx,[eax+18h]
	push	ebx
	call	ecx
	add	esp,4h

l006F6E68:
	pop	ebp
	pop	ebx
	pop	edi
	or	eax,0FFh
	pop	esi
	ret

l006F6E70:
	add	dword ptr [ebx],0FFh
	jnz	6F6E81h

l006F6E75:
	mov	edx,[ebx+4h]
	mov	eax,[edx+18h]
	push	ebx
	call	eax
	add	esp,4h

l006F6E81:
	add	dword ptr [esi],0FFh
	jnz	6F6E92h

l006F6E86:
	mov	ecx,[esi+4h]
	mov	edx,[ecx+18h]
	push	esi
	call	edx
	add	esp,4h

l006F6E92:
	pop	ebp
	pop	ebx
	pop	edi
	mov	eax,1h
	pop	esi
	ret
006F6E9C                                     CC CC CC CC             ....

;; fn006F6EA0: 006F6EA0
;;   Called from:
;;     006F8F01 (in fn006F8EC0)
fn006F6EA0 proc
	push	edi
	mov	edi,eax
	test	edi,edi
	jz	6F70B2h

l006F6EAB:
	mov	eax,[edi+4h]
	cmp	eax,0A1D1B8h
	jz	6F6ECBh

l006F6EB5:
	push	0A1D1B8h
	push	eax
	call	6D5670h
	add	esp,8h
	test	eax,eax
	jz	6F70B2h

l006F6ECB:
	cmp	dword ptr [esp+0Ch],0h
	jz	6F70B2h

l006F6ED6:
	mov	eax,[0A6CB98h]
	test	eax,eax
	jnz	6F6EF9h

l006F6EDF:
	push	8CA818h
	call	6F1A70h
	add	esp,4h
	test	eax,eax
	mov	[0A6CB98h],eax
	jnz	6F6EF9h

l006F6EF5:
	xor	eax,eax
	pop	edi
	ret

l006F6EF9:
	cmp	dword ptr [0A6CB9Ch],0h
	jnz	6F6F1Dh

l006F6F02:
	push	8D5840h
	call	6F1A70h
	add	esp,4h
	test	eax,eax
	mov	[0A6CB9Ch],eax
	jz	6F6EF5h

l006F6F18:
	mov	eax,[0A6CB98h]

l006F6F1D:
	mov	ecx,[esp+8h]
	push	esi
	push	eax
	mov	byte ptr [ebx],0h
	push	edi
	mov	dword ptr [ecx],0h
	call	6FBCC0h
	mov	esi,eax
	add	esp,8h
	test	esi,esi
	jz	6F70AAh

l006F6F3F:
	mov	eax,[esi+4h]
	cmp	eax,0A1B450h
	jz	6F6F5Fh

l006F6F49:
	push	0A1B450h
	push	eax
	call	6D5670h
	add	esp,8h
	test	eax,eax
	jz	6F70AAh

l006F6F5F:
	mov	edx,[0A6CB9Ch]
	push	ebp
	push	edx
	push	edi
	call	6FBCC0h
	mov	ebp,[8A4608h]
	add	esp,8h
	test	eax,eax
	jz	6F6FB1h

l006F6F7A:
	cmp	dword ptr [esi+8h],100h
	jle	6F6F9Ch

l006F6F83:
	mov	eax,[0A17E2Ch]
	push	8D5920h
	push	eax
	call	6E0F80h
	add	esp,8h
	pop	ebp
	pop	esi
	xor	eax,eax
	pop	edi
	ret

l006F6F9C:
	lea	eax,[esi+14h]
	mov	edx,ebx
	sub	edx,eax

l006F6FA3:
	mov	cl,[eax]
	mov	[edx+eax],cl
	add	eax,1h
	test	cl,cl
	jnz	6F6FA3h

l006F6FAF:
	jmp	6F701Fh

l006F6FB1:
	add	esi,14h
	push	2Eh
	push	esi
	call	ebp
	add	esp,8h
	test	eax,eax
	jnz	6F6FE9h

l006F6FC0:
	cmp	[esp+14h],eax
	jle	6F6FE0h

l006F6FC6:
	mov	ecx,[0A17E2Ch]
	push	8D58F4h
	push	ecx
	call	6E0F80h
	add	esp,8h
	pop	ebp
	pop	esi
	xor	eax,eax
	pop	edi
	ret

l006F6FE0:
	pop	ebp
	pop	esi
	mov	eax,0A163B8h
	pop	edi
	ret

l006F6FE9:
	sub	eax,esi
	mov	edi,eax
	cmp	edi,100h
	jc	6F700Fh

l006F6FF5:
	mov	edx,[0A17E2Ch]
	push	8D5920h
	push	edx
	call	6E0F80h
	add	esp,8h
	pop	ebp
	pop	esi
	xor	eax,eax
	pop	edi
	ret

l006F700F:
	push	edi
	push	esi
	push	ebx
	call	dword ptr [8A45DCh]
	add	esp,0Ch
	mov	byte ptr [edi+ebx],0h

l006F701F:
	mov	esi,[esp+14h]
	sub	esi,1h
	test	esi,esi
	jle	6F7046h

l006F702A:
	lea	ebx,[ebx+0h]

l006F7030:
	push	2Eh
	push	ebx
	call	ebp
	add	esp,8h
	test	eax,eax
	jz	6F7091h

l006F703C:
	sub	esi,1h
	test	esi,esi
	mov	byte ptr [eax],0h
	jg	6F7030h

l006F7046:
	mov	eax,ebx
	lea	edx,[eax+1h]
	jmp	6F7050h
006F704D                                        8D 49 00              .I.

l006F7050:
	mov	cl,[eax]
	add	eax,1h
	test	cl,cl
	jnz	6F7050h

l006F7059:
	mov	ecx,[esp+10h]
	sub	eax,edx
	mov	[ecx],eax
	call	6F5DA0h
	push	ebx
	push	eax
	call	6FD8B0h
	mov	esi,eax
	add	esp,8h
	test	esi,esi
	jnz	6F708Bh

l006F7076:
	mov	edx,[0A18720h]
	push	ebx
	push	8D58D0h
	push	edx
	call	6E15D0h
	add	esp,0Ch

l006F708B:
	pop	ebp
	mov	eax,esi
	pop	esi
	pop	edi
	ret

l006F7091:
	mov	eax,[0A17E2Ch]
	push	8D589Ch
	push	eax
	call	6E0F80h
	add	esp,8h
	pop	ebp
	pop	esi
	xor	eax,eax
	pop	edi
	ret

l006F70AA:
	pop	esi
	mov	eax,0A163B8h
	pop	edi
	ret

l006F70B2:
	mov	eax,0A163B8h
	pop	edi
	ret
006F70B9                            CC CC CC CC CC CC CC          .......

;; fn006F70C0: 006F70C0
;;   Called from:
;;     006F8BEF (in fn006F8AD0)
fn006F70C0 proc
	mov	eax,[0A6D67Ch]
	push	esi
	mov	esi,[eax+4h]
	cmp	dword ptr [esi+8h],0h
	jnz	6F70DCh

l006F70CF:
	push	8D5538h
	call	6E86F0h
	add	esp,4h

l006F70DC:
	mov	ecx,[esp+8h]
	mov	esi,[esi+8h]
	push	0A163B8h
	push	ecx
	push	esi
	call	6FD8F0h
	add	esp,0Ch
	pop	esi
	ret
006F70F4             CC CC CC CC CC CC CC CC CC CC CC CC     ............

;; fn006F7100: 006F7100
;;   Called from:
;;     006F8587 (in fn006F8440)
fn006F7100 proc
	cmp	edi,0A163B8h
	push	esi
	mov	esi,eax
	jz	6F716Eh

l006F710B:
	test	esi,esi
	jnz	6F7123h

l006F710F:
	mov	eax,[esp+8h]
	push	eax
	push	ecx
	call	6FD8B0h
	mov	esi,eax
	add	esp,8h
	test	esi,esi
	jz	6F716Eh

l006F7123:
	mov	eax,[edi+4h]
	cmp	eax,0A215C0h
	jz	6F7152h

l006F712D:
	push	0A215C0h
	push	eax
	call	6D5670h
	add	esp,8h
	test	eax,eax
	jnz	6F7152h

l006F713F:
	push	esi
	push	ebx
	push	edi
	call	6DF800h
	add	esp,0Ch
	test	eax,eax
	jge	6F716Eh

l006F714E:
	xor	eax,eax
	pop	esi
	ret

l006F7152:
	push	edi
	call	717230h
	add	esp,4h
	test	eax,eax
	jz	6F714Eh

l006F715F:
	push	esi
	push	ebx
	push	eax
	call	6FD8F0h
	add	esp,0Ch
	test	eax,eax
	jl	6F714Eh

l006F716E:
	mov	eax,1h
	pop	esi
	ret
006F7175                CC CC CC CC CC CC CC CC CC CC CC      ...........
006F7180 51 A1 B0 BD A1 00 88 04 24 C1 F8 08 88 44 24 01 Q.......$....D$.
006F7190 66 A1 B2 BD A1 00 88 44 24 02 88 64 24 03 8D 04 f......D$..d$...
006F71A0 24 6A 04 50 E8 07 58 FF FF 83 C4 0C C3 CC CC CC $j.P..X.........
006F71B0 53 6A 00 E8 98 B4 FF FF 8B D8 83 C4 04 85 DB 75 Sj.............u
006F71C0 02 5B C3 56 57 8B 3D 8C CB A6 00 8B 07 85 C0 74 .[.VW.=........t
006F71D0 45 8B 4F 08 8B 57 04 51 52 50 68 38 59 8D 00 E8 E.O..W.QRPh8Y...
006F71E0 1C 30 FF FF 8B F0 83 C4 10 85 F6 74 2F 56 53 E8 .0.........t/VS.
006F71F0 1C B8 FF FF 83 C4 08 85 C0 7C 38 83 06 FF 75 0C .........|8...u.
006F7200 8B 46 04 8B 48 18 56 FF D1 83 C4 04 8B 47 0C 83 .F..H.V......G..
006F7210 C7 0C 85 C0 75 BB 5F 5E 8B C3 5B C3 83 03 FF 75 ....u._^..[....u
006F7220 34 8B 53 04 8B 42 18 53 FF D0 83 C4 04 5F 5E 33 4.S..B.S....._^3
006F7230 C0 5B C3 83 03 FF 75 0C 8B 4B 04 8B 51 18 53 FF .[....u..K..Q.S.
006F7240 D2 83 C4 04 83 06 FF 75 0C 8B 46 04 8B 48 18 56 .......u..F..H.V
006F7250 FF D1 83 C4 04 5F 5E 33 C0 5B C3 CC CC CC CC CC ....._^3.[......
006F7260 51 8B 4C 24 0C 8D 04 24 50 68 3C 59 8D 00 51 E8 Q.L$...$Ph<Y..Q.
006F7270 0C 0A FF FF 83 C4 0C 85 C0 75 04 33 C0 59 C3 8B .........u.3.Y..
006F7280 14 24 52 E8 C8 FA FF FF 83 C4 04 85 C0 7C EC 75 .$R..........|.u
006F7290 0E 83 05 B8 63 A1 00 01 B8 B8 63 A1 00 59 C3 8B ....c.....c..Y..
006F72A0 04 24 50 E8 F8 F0 FF FF 83 C4 04 85 C0 74 03 83 .$P..........t..
006F72B0 00 01 59 C3 CC CC CC CC CC CC CC CC CC CC CC CC ..Y.............
006F72C0 51 8B 4C 24 0C 8D 04 24 50 68 4C 59 8D 00 51 E8 Q.L$...$PhLY..Q.
006F72D0 AC 09 FF FF 83 C4 0C 85 C0 75 02 59 C3 8B 04 24 .........u.Y...$
006F72E0 E8 0B FA FF FF 59 C3 CC CC CC CC CC CC CC CC CC .....Y..........
006F72F0 51 8B 4C 24 0C 8D 04 24 50 68 60 59 8D 00 51 E8 Q.L$...$Ph`Y..Q.
006F7300 7C 09 FF FF 83 C4 0C 85 C0 75 02 59 C3 53 8B 5C |........u.Y.S.\
006F7310 24 04 E8 79 F7 FF FF 50 E8 83 DD 00 00 83 C4 04 $..y...P........
006F7320 5B 59 C3 CC CC CC CC CC CC CC CC CC CC CC CC CC [Y..............
006F7330 51 8B 4C 24 0C 8D 04 24 50 68 70 59 8D 00 51 E8 Q.L$...$PhpY..Q.
006F7340 3C 09 FF FF 83 C4 0C 85 C0 75 02 59 C3 56 8B 74 <........u.Y.V.t
006F7350 24 04 E8 49 F9 FF FF 85 C0 5E 75 0B 50 E8 FE DF $..I.....^u.P...
006F7360 FE FF 83 C4 04 59 C3 8B 40 08 50 E8 F0 DF FE FF .....Y..@.P.....
006F7370 83 C4 04 59 C3 CC CC CC CC CC CC CC CC CC CC CC ...Y............
006F7380 85 C0 56 75 31 80 39 55 75 05 B9 44 77 8A 00 8B ..Vu1.9Uu..Dw...
006F7390 44 24 08 51 50 E8 A6 1C F6 FF 8B F0 83 C4 08 85 D$.QP...........
006F73A0 F6 75 36 8B 0D 58 72 A1 00 51 E8 41 A0 FE FF 83 .u6..Xr..Q.A....
006F73B0 C4 04 8B C6 5E C3 50 E8 A4 88 03 00 8B F0 83 C4 ....^.P.........
006F73C0 04 85 F6 75 16 8B 15 2C 7E A1 00 68 7C 59 8D 00 ...u...,~..h|Y..
006F73D0 52 E8 AA 9B FE FF 83 C4 08 8B C6 5E C3 CC CC CC R..........^....
006F73E0 83 EC 0C 8D 04 24 50 8B 44 24 18 68 F0 6E A2 00 .....$P.D$.h.n..
006F73F0 8D 4C 24 0C 51 8D 54 24 14 52 68 94 59 8D 00 50 .L$.Q.T$.Rh.Y..P
006F7400 C7 44 24 18 00 00 00 00 E8 73 08 FF FF 83 C4 18 .D$......s......
006F7410 85 C0 75 04 83 C4 0C C3 8B 4C 24 04 8B 04 24 56 ..u......L$...$V
006F7420 51 B9 44 77 8A 00 E8 55 FF FF FF 8B F0 83 C4 04 Q.Dw...U........
006F7430 85 F6 75 05 5E 83 C4 0C C3 8B 4C 24 08 53 8B 5C ..u.^.....L$.S.\
006F7440 24 10 57 E8 E8 F2 FF FF 83 7C 24 0C 00 8B F8 75 $.W......|$....u
006F7450 0A 56 FF 15 44 46 8A 00 83 C4 04 8B C7 5F 5B 5E .V..DF......._[^
006F7460 83 C4 0C C3 CC CC CC CC CC CC CC CC CC CC CC CC ................
006F7470 83 EC 0C 56 8D 44 24 04 50 8B 44 24 1C 68 F0 6E ...V.D$.P.D$.h.n
006F7480 A2 00 8D 4C 24 10 51 8D 54 24 18 52 68 AC 59 8D ...L$.Q.T$.Rh.Y.
006F7490 00 50 C7 44 24 1C 00 00 00 00 33 F6 E8 DF 07 FF .P.D$.....3.....
006F74A0 FF 83 C4 18 85 C0 75 07 33 C0 5E 83 C4 0C C3 8B ......u.3.^.....
006F74B0 44 24 04 85 C0 74 18 8B 4C 24 08 51 B9 A8 59 8D D$...t..L$.Q..Y.
006F74C0 00 E8 BA FE FF FF 8B F0 83 C4 04 85 F6 74 D9 8B .............t..
006F74D0 54 24 08 8B 44 24 0C 56 52 50 E8 01 85 05 00 83 T$..D$.VRP......
006F74E0 C4 0C 5E 83 C4 0C C3 CC CC CC CC CC CC CC CC CC ..^.............
006F74F0 83 EC 0C 8D 04 24 50 8B 44 24 18 68 F0 6E A2 00 .....$P.D$.h.n..
006F7500 8D 4C 24 0C 51 8D 54 24 14 52 68 C0 59 8D 00 50 .L$.Q.T$.Rh.Y..P
006F7510 C7 44 24 18 00 00 00 00 E8 63 07 FF FF 83 C4 18 .D$......c......
006F7520 85 C0 75 04 83 C4 0C C3 8B 4C 24 04 8B 04 24 56 ..u......L$...$V
006F7530 51 B9 A8 59 8D 00 E8 45 FE FF FF 8B F0 83 C4 04 Q..Y...E........
006F7540 85 F6 75 05 5E 83 C4 0C C3 8B 54 24 0C 8B 4C 24 ..u.^.....T$..L$
006F7550 08 57 56 52 E8 97 F3 FF FF 83 C4 08 83 7C 24 08 .WVR.........|$.
006F7560 00 8B F8 75 0A 56 FF 15 44 46 8A 00 83 C4 04 8B ...u.V..DF......
006F7570 C7 5F 5E 83 C4 0C C3 CC CC CC CC CC CC CC CC CC ._^.............
006F7580 51 8B 4C 24 0C 8D 04 24 50 68 D4 59 8D 00 51 E8 Q.L$...$Ph.Y..Q.
006F7590 EC 06 FF FF 83 C4 0C 85 C0 75 02 59 C3 8B 14 24 .........u.Y...$
006F75A0 52 E8 DA FB 01 00 83 C4 04 59 C3 CC CC CC CC CC R........Y......
006F75B0 56 57 50 E8 E8 DA 00 00 8B 4C 24 14 8B 54 24 10 VWP......L$..T$.
006F75C0 8B F0 56 51 52 E8 26 63 00 00 83 C4 10 85 F6 8B ..VQR.&c........
006F75D0 F8 74 13 83 06 FF 75 0E 8B 46 04 8B 48 18 56 FF .t....u..F..H.V.
006F75E0 D1 83 C4 04 8B C7 5F 5E C3 CC CC CC CC CC CC CC ......_^........
006F75F0 8B 44 24 0C 83 EC 08 50 68 18 5A 8D 00 E8 FE E5 .D$....Ph.Z.....
006F7600 FE FF 83 C4 08 85 C0 75 07 83 C8 FF 83 C4 08 C3 .......u........
006F7610 8B 54 24 10 8D 0C 24 51 68 08 5A 8D 00 52 E8 5D .T$...$Qh.Z..R.]
006F7620 06 FF FF 83 C4 0C 85 C0 74 DF 56 8B 74 24 04 8B ........t.V.t$..
006F7630 C6 8D 50 01 8A 08 83 C0 01 84 C9 75 F7 2B C2 75 ..P........u.+.u
006F7640 1B A1 8C 6F A1 00 68 F8 59 8D 00 50 E8 2F 99 FE ...o..h.Y..P./..
006F7650 FF 83 C4 08 83 C8 FF 5E 83 C4 08 C3 56 E8 FE ED .......^....V...
006F7660 F5 FF 83 C4 04 83 F8 01 75 1C 8B 0D 8C 6F A1 00 ........u....o..
006F7670 68 E4 59 8D 00 51 E8 05 99 FE FF 83 C4 08 83 C8 h.Y..Q..........
006F7680 FF 5E 83 C4 08 C3 33 C0 5E 83 C4 08 C3 CC CC CC .^....3.^.......
006F7690 83 05 B8 63 A1 00 01 B8 B8 63 A1 00 C3 CC CC CC ...c.....c......
006F76A0 68 60 C5 A1 00 E8 16 2F FE FF 83 C4 04 85 C0 0F h`...../........
006F76B0 8C 50 01 00 00 57 68 F5 03 00 00 6A 00 68 48 BE .P...Wh....j.hH.
006F76C0 A1 00 68 20 C4 A1 00 68 BC 5A 8D 00 E8 3F 1F FF ..h ...h.Z...?..
006F76D0 FF 8B F8 83 C4 14 85 FF 0F 84 26 01 00 00 56 57 ..........&...VW
006F76E0 E8 4B FB 01 00 8B F0 83 C4 04 85 F6 0F 84 11 01 .K..............
006F76F0 00 00 68 AC 5A 8D 00 56 33 C0 E8 B1 FE FF FF 83 ..h.Z..V3.......
006F7700 C4 08 85 C0 0F 8C F9 00 00 00 68 A0 5A 8D 00 56 ..........h.Z..V
006F7710 B8 01 00 00 00 E8 96 FE FF FF 83 C4 08 85 C0 0F ................
006F7720 8C DE 00 00 00 68 94 5A 8D 00 56 B8 02 00 00 00 .....h.Z..V.....
006F7730 E8 7B FE FF FF 83 C4 08 85 C0 0F 8C C3 00 00 00 .{..............
006F7740 68 88 5A 8D 00 56 B8 03 00 00 00 E8 60 FE FF FF h.Z..V......`...
006F7750 83 C4 08 85 C0 0F 8C A8 00 00 00 68 7C 5A 8D 00 ...........h|Z..
006F7760 56 B8 04 00 00 00 E8 45 FE FF FF 83 C4 08 85 C0 V......E........
006F7770 0F 8C 8D 00 00 00 68 6C 5A 8D 00 56 B8 05 00 00 ......hlZ..V....
006F7780 00 E8 2A FE FF FF 83 C4 08 85 C0 7C 76 68 60 5A ..*........|vh`Z
006F7790 8D 00 56 B8 06 00 00 00 E8 13 FE FF FF 83 C4 08 ..V.............
006F77A0 85 C0 7C 5F 68 54 5A 8D 00 56 B8 07 00 00 00 E8 ..|_hTZ..V......
006F77B0 FC FD FF FF 83 C4 08 85 C0 7C 48 68 44 5A 8D 00 .........|HhDZ..
006F77C0 56 B8 08 00 00 00 E8 E5 FD FF FF 83 C4 08 85 C0 V...............
006F77D0 7C 31 68 38 5A 8D 00 56 B8 09 00 00 00 E8 CE FD |1h8Z..V........
006F77E0 FF FF 83 C4 08 85 C0 7C 1A 83 05 60 C5 A1 00 01 .......|...`....
006F77F0 68 60 C5 A1 00 68 28 5A 8D 00 57 E8 A0 27 FF FF h`...h(Z..W..'..
006F7800 83 C4 0C 5E 5F C3 CC CC CC CC CC CC CC CC CC CC ...^_...........

;; fn006F7810: 006F7810
;;   Called from:
;;     006F8052 (in fn006F8050)
;;     0074F9EC (in fn0074F9E0)
fn006F7810 proc
	mov	eax,[0A6CB88h]
	test	eax,eax
	jnz	6F781Ah

l006F7819:
	ret

l006F781A:
	push	ebp
	mov	ebp,[esp+0Ch]
	push	edi
	push	ebp
	push	eax
	call	6FD8B0h
	mov	edi,eax
	add	esp,8h
	test	edi,edi
	jnz	6F7833h

l006F7830:
	pop	edi
	pop	ebp
	ret

l006F7833:
	push	ebx
	mov	ebx,[esp+10h]
	push	esi
	push	ebx
	call	6F63A0h
	mov	esi,eax
	add	esp,4h
	test	esi,esi
	jz	6F7863h

l006F7848:
	push	esi
	call	717230h
	add	esp,4h
	test	eax,eax
	jz	6F7863h

l006F7855:
	push	edi
	push	eax
	call	6FDE40h
	add	esp,8h
	test	eax,eax
	jz	6F786Ah

l006F7863:
	pop	esi
	pop	ebx
	pop	edi
	xor	eax,eax
	pop	ebp
	ret

l006F786A:
	cmp	dword ptr [0A74AF0h],0h
	jz	6F7882h

l006F7873:
	push	ebp
	push	ebx
	push	8D5AC0h
	call	716B20h
	add	esp,0Ch

l006F7882:
	mov	eax,esi
	pop	esi
	pop	ebx
	pop	edi
	pop	ebp
	ret
006F7889                            CC CC CC CC CC CC CC          .......

;; fn006F7890: 006F7890
;;   Called from:
;;     006F84D5 (in fn006F8440)
;;     006F8A35 (in fn006F8960)
fn006F7890 proc
	sub	esp,284h
	mov	eax,[0A14188h]
	xor	eax,esp
	mov	[esp+280h],eax
	mov	eax,[esp+288h]
	push	ebx
	mov	ebx,[esp+290h]
	push	ebp
	mov	ebp,[esp+298h]
	push	esi
	push	edi
	mov	edi,[esp+2A8h]
	mov	[esp+28h],ecx
	xor	ecx,ecx
	cmp	edi,ecx
	mov	[esp+10h],ebx
	mov	[esp+30h],edx
	mov	[esp+20h],edi
	mov	[esp+14h],ecx
	mov	[esp+18h],ecx
	jz	6F78E4h

l006F78E2:
	mov	[edi],ecx

l006F78E4:
	mov	ecx,eax
	lea	esi,[ecx+1h]
	lea	esp,[esp+0h]

l006F78F0:
	mov	dl,[ecx]
	add	ecx,1h
	test	dl,dl
	jnz	6F78F0h

l006F78F9:
	sub	ecx,esi
	cmp	ecx,100h
	jbe	6F7912h

l006F7903:
	mov	eax,[0A18598h]
	push	8D5C3Ch
	jmp	6F8020h

l006F7912:
	lea	edx,[esp+3Ch]
	sub	edx,eax

l006F7918:
	mov	cl,[eax]
	mov	[edx+eax],cl
	add	eax,1h
	test	cl,cl
	jnz	6F7918h

l006F7924:
	test	edi,edi
	jz	6F79EAh

l006F792C:
	push	8D5464h
	call	715DD0h
	mov	esi,eax
	add	esp,4h
	test	esi,esi
	jz	6F7A8Fh

l006F7943:
	mov	eax,[esi+4h]
	cmp	eax,0A1BAF0h
	jz	6F7963h

l006F794D:
	push	0A1BAF0h
	push	eax
	call	6D5670h
	add	esp,8h
	test	eax,eax
	jz	6F7A8Fh

l006F7963:
	add	dword ptr [esi],1h
	push	esi
	call	6F2750h
	mov	ebx,eax
	add	esp,4h
	xor	edi,edi
	test	ebx,ebx
	jle	6F79D5h

l006F7977:
	push	edi
	push	esi
	call	6F2790h
	mov	ecx,[esp+18h]
	add	esp,8h
	cmp	dword ptr [esp+10h],0h
	jnz	6F7991h

l006F798C:
	mov	ecx,0A163B8h

l006F7991:
	push	ecx
	mov	ecx,[esp+2Ch]
	push	ecx
	push	8CBC38h
	push	8D542Ch
	push	eax
	call	7038E0h
	add	esp,14h
	test	eax,eax
	jz	6F7A54h

l006F79B2:
	cmp	eax,0A163B8h
	jnz	6F7A6Eh

l006F79BD:
	add	dword ptr [eax],0FFh
	jnz	6F79CEh

l006F79C2:
	mov	edx,[eax+4h]
	push	eax
	mov	eax,[edx+18h]
	call	eax
	add	esp,4h

l006F79CE:
	add	edi,1h
	cmp	edi,ebx
	jl	6F7977h

l006F79D5:
	add	dword ptr [esi],0FFh
	jnz	6F79E6h

l006F79DA:
	mov	ecx,[esi+4h]
	mov	edx,[ecx+18h]
	push	esi
	call	edx
	add	esp,4h

l006F79E6:
	mov	ebx,[esp+10h]

l006F79EA:
	test	ebx,ebx
	jz	6F7B56h

l006F79F2:
	mov	eax,[ebx+4h]
	cmp	eax,0A1B450h
	jz	6F7A16h

l006F79FC:
	push	0A1B450h
	push	eax
	call	6D5670h
	add	esp,8h
	test	eax,eax
	jz	6F7BCFh

l006F7A12:
	mov	ebx,[esp+10h]

l006F7A16:
	lea	eax,[esp+3Ch]
	lea	edx,[eax+1h]
	lea	ecx,[ecx+0h]

l006F7A20:
	mov	cl,[eax]
	add	eax,1h
	test	cl,cl
	jnz	6F7A20h

l006F7A29:
	sub	eax,edx
	push	ebx
	mov	esi,eax
	call	6ECC00h
	lea	ecx,[eax+esi+1h]
	add	esp,4h
	cmp	ecx,[esp+2A4h]
	jc	6F7A99h

l006F7A43:
	mov	edx,[0A16F8Ch]
	push	8D5C18h
	push	edx
	jmp	6F8021h

l006F7A54:
	add	dword ptr [esi],0FFh
	jnz	6F8029h

l006F7A5D:
	mov	ecx,[esi+4h]
	mov	edx,[ecx+18h]
	push	esi
	call	edx
	add	esp,4h
	jmp	6F8029h

l006F7A6E:
	mov	ecx,[esp+20h]
	mov	[ecx],eax
	add	dword ptr [esi],0FFh
	jnz	6F7A85h

l006F7A79:
	mov	edx,[esi+4h]
	mov	eax,[edx+18h]
	push	esi
	call	eax
	add	esp,4h

l006F7A85:
	mov	eax,0A1BE14h
	jmp	6F802Bh

l006F7A8F:
	push	8D5BE8h
	jmp	6F801Bh

l006F7A99:
	push	ebx
	call	6ECC50h
	add	esp,4h
	mov	edx,ebp

l006F7AA4:
	mov	cl,[eax]
	mov	[edx],cl
	add	eax,1h
	add	edx,1h
	test	cl,cl
	jnz	6F7AA4h

l006F7AB2:
	mov	edi,ebp
	add	edi,0FFh

l006F7AB7:
	mov	al,[edi+1h]
	add	edi,1h
	test	al,al
	jnz	6F7AB7h

l006F7AC1:
	mov	ax,[8A6990h]
	mov	[edi],ax
	lea	eax,[esp+3Ch]
	mov	ecx,eax

l006F7AD0:
	mov	dl,[eax]
	add	eax,1h
	test	dl,dl
	jnz	6F7AD0h

l006F7AD9:
	mov	edi,ebp
	sub	eax,ecx
	mov	esi,ecx
	add	edi,0FFh

l006F7AE2:
	mov	cl,[edi+1h]
	add	edi,1h
	test	cl,cl
	jnz	6F7AE2h

l006F7AEC:
	mov	ecx,eax
	shr	ecx,2h

l006F7AF1:
	rep movsd

l006F7AF3:
	mov	ecx,eax
	and	ecx,3h
	lea	edx,[esp+3Ch]

l006F7AFC:
	rep movsb

l006F7AFE:
	mov	eax,ebp
	sub	edx,ebp

l006F7B02:
	mov	cl,[eax]
	mov	[edx+eax],cl
	add	eax,1h
	test	cl,cl
	jnz	6F7B02h

l006F7B0E:
	lea	esi,[esp+3Ch]
	call	6F6CA0h
	test	eax,eax
	jz	6F7B39h

l006F7B1B:
	mov	edx,ebp
	mov	ecx,esi
	mov	eax,esi
	sub	edx,ecx

l006F7B23:
	mov	cl,[eax]
	mov	[eax+edx],cl
	add	eax,1h
	test	cl,cl
	jnz	6F7B23h

l006F7B2F:
	mov	eax,0A1BE20h
	jmp	6F802Bh

l006F7B39:
	mov	eax,[0A16F8Ch]
	lea	edx,[esp+3Ch]
	push	edx
	push	8D5BC4h
	push	eax
	call	6E15D0h
	add	esp,0Ch
	jmp	6F8029h

l006F7B56:
	lea	ebx,[esp+3Ch]
	call	6F6A90h
	test	eax,eax
	jz	6F7B86h

l006F7B63:
	mov	edx,ebp
	mov	ecx,ebx
	mov	eax,ebx
	sub	edx,ecx
	jmp	6F7B70h
006F7B6D                                        8D 49 00              .I.

l006F7B70:
	mov	cl,[eax]
	mov	[eax+edx],cl
	add	eax,1h
	test	cl,cl
	jnz	6F7B70h

l006F7B7C:
	mov	eax,0A1BE2Ch
	jmp	6F802Bh

l006F7B86:
	lea	esi,[esp+3Ch]
	call	6F6CA0h
	test	eax,eax
	jz	6F7BB6h

l006F7B93:
	mov	edx,ebp
	mov	ecx,esi
	mov	eax,esi
	sub	edx,ecx
	jmp	6F7BA0h
006F7B9D                                        8D 49 00              .I.

l006F7BA0:
	mov	cl,[eax]
	mov	[eax+edx],cl
	add	eax,1h
	test	cl,cl
	jnz	6F7BA0h

l006F7BAC:
	mov	eax,0A1BE20h
	jmp	6F802Bh

l006F7BB6:
	push	8CA548h
	call	715DD0h
	add	esp,4h
	test	eax,eax
	mov	[esp+10h],eax
	jz	6F8016h

l006F7BCF:
	mov	esi,[esp+10h]
	mov	eax,[esi+4h]
	cmp	eax,0A1BAF0h
	jz	6F7BF3h

l006F7BDD:
	push	0A1BAF0h
	push	eax
	call	6D5670h
	add	esp,8h
	test	eax,eax
	jz	6F8016h

l006F7BF3:
	push	8D5484h
	call	715DD0h
	add	esp,4h
	test	eax,eax
	mov	[esp+38h],eax
	jz	6F8008h

l006F7C0C:
	mov	eax,[eax+4h]
	cmp	eax,0A1BAF0h
	jz	6F7C2Ch

l006F7C16:
	push	0A1BAF0h
	push	eax
	call	6D5670h
	add	esp,8h
	test	eax,eax
	jz	6F8008h

l006F7C2C:
	push	8D5470h
	call	715DD0h
	add	esp,4h
	test	eax,eax
	mov	[esp+34h],eax
	jz	6F7FFAh

l006F7C45:
	mov	eax,[eax+4h]
	cmp	eax,0A1D1B8h
	jz	6F7C65h

l006F7C4F:
	push	0A1D1B8h
	push	eax
	call	6D5670h
	add	esp,8h
	test	eax,eax
	jz	6F7FFAh

l006F7C65:
	push	esi
	call	6F2750h
	mov	esi,eax
	lea	eax,[esp+40h]
	add	esp,4h
	mov	[esp+2Ch],esi
	lea	edx,[eax+1h]
	jmp	6F7C80h
006F7C7D                                        8D 49 00              .I.

l006F7C80:
	mov	cl,[eax]
	add	eax,1h
	test	cl,cl
	jnz	6F7C80h

l006F7C89:
	sub	eax,edx
	test	esi,esi
	mov	[esp+24h],eax
	mov	dword ptr [esp+1Ch],0h
	jle	6F7F6Dh

l006F7C9F:
	nop

l006F7CA0:
	mov	edx,[esp+1Ch]
	mov	eax,[esp+10h]
	push	edx
	push	eax
	xor	edi,edi
	call	6F2790h
	mov	ebx,eax
	add	esp,8h
	test	ebx,ebx
	jz	6F8029h

l006F7CBE:
	mov	eax,[ebx+4h]
	cmp	eax,0A23B20h
	jz	6F7CFBh

l006F7CC8:
	push	0A23B20h
	push	eax
	call	6D5670h
	add	esp,8h
	test	eax,eax
	jnz	6F7CFBh

l006F7CDA:
	mov	eax,[ebx+4h]
	cmp	eax,0A1B450h
	jz	6F7D20h

l006F7CE4:
	push	0A1B450h
	push	eax
	call	6D5670h
	add	esp,8h
	test	eax,eax
	jnz	6F7D20h

l006F7CF6:
	jmp	6F7F51h

l006F7CFB:
	mov	ecx,[0A2BD68h]
	mov	edx,[ebx+8h]
	mov	eax,[ebx+0Ch]
	push	0h
	push	ecx
	push	edx
	push	eax
	call	720020h
	mov	edi,eax
	add	esp,10h
	test	edi,edi
	jz	6F8029h

l006F7D1E:
	mov	ebx,edi

l006F7D20:
	mov	esi,[ebx+8h]
	mov	ecx,[esp+24h]
	lea	edx,[esi+ecx+0Eh]
	cmp	edx,[esp+2A4h]
	jc	6F7D56h

l006F7D34:
	test	edi,edi
	jz	6F7F51h

l006F7D3C:
	add	dword ptr [edi],0FFh
	jnz	6F7F51h

l006F7D45:
	mov	eax,[edi+4h]
	mov	ecx,[eax+18h]
	push	edi
	call	ecx
	add	esp,4h
	jmp	6F7F51h

l006F7D56:
	lea	eax,[ebx+14h]
	mov	edx,ebp
	sub	edx,eax
	lea	ecx,[ecx+0h]

l006F7D60:
	mov	cl,[eax]
	mov	[eax+edx],cl
	add	eax,1h
	test	cl,cl
	jnz	6F7D60h

l006F7D6C:
	mov	eax,ebp
	lea	edx,[eax+1h]

l006F7D71:
	mov	cl,[eax]
	add	eax,1h
	test	cl,cl
	jnz	6F7D71h

l006F7D7A:
	sub	eax,edx
	cmp	eax,esi
	jz	6F7DA2h

l006F7D80:
	test	edi,edi
	jz	6F7F51h

l006F7D88:
	add	dword ptr [edi],0FFh
	jnz	6F7F51h

l006F7D91:
	mov	edx,[edi+4h]
	mov	eax,[edx+18h]
	push	edi
	call	eax
	add	esp,4h
	jmp	6F7F51h

l006F7DA2:
	cmp	dword ptr [esp+20h],0h
	jz	6F7E27h

l006F7DA9:
	mov	ecx,[esp+38h]
	mov	edx,[esp+34h]
	push	ecx
	push	edx
	call	6F6AF0h
	add	esp,8h
	test	eax,eax
	jz	6F7F8Bh

l006F7DC3:
	cmp	eax,0A163B8h
	jz	6F7E27h

l006F7DCA:
	mov	ecx,[esp+28h]
	push	ecx
	push	8B22ACh
	push	8D542Ch
	push	eax
	call	7038E0h
	add	esp,10h
	test	edi,edi
	mov	esi,eax
	jz	6F7DF9h

l006F7DE8:
	add	dword ptr [edi],0FFh
	jnz	6F7DF9h

l006F7DED:
	mov	edx,[edi+4h]
	mov	eax,[edx+18h]
	push	edi
	call	eax
	add	esp,4h

l006F7DF9:
	test	esi,esi
	jz	6F8029h

l006F7E01:
	cmp	esi,0A163B8h
	jnz	6F7FAAh

l006F7E0D:
	add	dword ptr [esi],0FFh
	jnz	6F7F51h

l006F7E16:
	mov	ecx,[esi+4h]
	mov	edx,[ecx+18h]
	push	esi
	call	edx
	add	esp,4h
	jmp	6F7F51h

l006F7E27:
	test	esi,esi
	jbe	6F7E3Eh

l006F7E2B:
	mov	al,[esi+ebp-1h]
	cmp	al,5Ch
	jz	6F7E3Eh

l006F7E33:
	cmp	al,2Fh
	jz	6F7E3Eh

l006F7E37:
	mov	byte ptr [esi+ebp],5Ch
	add	esi,1h

l006F7E3E:
	lea	eax,[esp+3Ch]
	mov	edx,eax
	mov	ecx,ebp
	sub	ecx,edx
	lea	edx,[ecx+esi]
	jmp	6F7E50h
006F7E4D                                        8D 49 00              .I.

l006F7E50:
	mov	cl,[eax]
	mov	[eax+edx],cl
	add	eax,1h
	test	cl,cl
	jnz	6F7E50h

l006F7E5C:
	add	esi,[esp+24h]
	push	ebp
	call	656460h
	add	esp,4h
	cmp	eax,1h
	jnz	6F7EB7h

l006F7E6E:
	mov	ebx,ebp
	call	6F6BF0h
	test	eax,eax
	jnz	6F7FB7h

l006F7E7D:
	push	ebp
	push	100h
	lea	eax,[esp+148h]
	push	8D5B90h
	push	eax
	call	dword ptr [8A4650h]
	mov	edx,[0A18EC8h]
	push	1h
	lea	ecx,[esp+154h]
	push	ecx
	push	edx
	call	6E1970h
	add	esp,1Ch
	test	eax,eax
	jnz	6F7FD3h

l006F7EB7:
	mov	ebx,[0A6CB8Ch]
	mov	ecx,[ebx]
	test	ecx,ecx
	mov	[esp+14h],ebx
	jz	6F7F30h

l006F7EC7:
	add	esi,ebp
	jmp	6F7ED4h
006F7ECB                                  EB 03 8D 49 00            ...I.

l006F7ED0:
	mov	ebx,[esp+14h]

l006F7ED4:
	mov	edx,esi

l006F7ED6:
	mov	al,[ecx]
	mov	[edx],al
	add	ecx,1h
	add	edx,1h
	test	al,al
	jnz	6F7ED6h

l006F7EE4:
	cmp	dword ptr [0A74AF0h],1h
	jle	6F7EFBh

l006F7EED:
	push	ebp
	push	8D5B80h
	call	716B20h
	add	esp,8h

l006F7EFB:
	mov	eax,[ebx+4h]
	cmp	byte ptr [eax],55h
	jnz	6F7F08h

l006F7F03:
	mov	eax,8A7744h

l006F7F08:
	push	eax
	push	ebp
	call	659040h
	mov	ebx,eax
	add	esp,8h
	test	ebx,ebx
	mov	[esp+18h],ebx
	jnz	6F7F34h

l006F7F1C:
	mov	eax,[esp+14h]
	mov	ecx,[eax+0Ch]
	add	eax,0Ch
	test	ecx,ecx
	mov	[esp+14h],eax
	jnz	6F7ED0h

l006F7F2E:
	jmp	6F7F34h

l006F7F30:
	mov	ebx,[esp+18h]

l006F7F34:
	test	edi,edi
	jz	6F7F49h

l006F7F38:
	add	dword ptr [edi],0FFh
	jnz	6F7F49h

l006F7F3D:
	mov	eax,[edi+4h]
	mov	ecx,[eax+18h]
	push	edi
	call	ecx
	add	esp,4h

l006F7F49:
	test	ebx,ebx
	jnz	6F7FEAh

l006F7F51:
	mov	eax,[esp+1Ch]
	add	eax,1h
	cmp	eax,[esp+2Ch]
	mov	[esp+1Ch],eax
	jl	6F7CA0h

l006F7F66:
	cmp	dword ptr [esp+18h],0h
	jnz	6F7FEAh

l006F7F6D:
	mov	ecx,[0A16F8Ch]
	lea	eax,[esp+3Ch]
	push	eax
	push	8D5B68h
	push	ecx
	call	6E15D0h
	add	esp,0Ch
	jmp	6F8029h

l006F7F8B:
	test	edi,edi
	jz	6F8029h

l006F7F93:
	add	dword ptr [edi],0FFh
	jnz	6F8029h

l006F7F9C:
	mov	edx,[edi+4h]
	mov	eax,[edx+18h]
	push	edi
	call	eax
	add	esp,4h
	jmp	6F8029h

l006F7FAA:
	mov	ecx,[esp+20h]
	mov	[ecx],esi
	mov	eax,0A1BE14h
	jmp	6F802Bh

l006F7FB7:
	test	edi,edi
	jz	6F7FCCh

l006F7FBB:
	add	dword ptr [edi],0FFh
	jnz	6F7FCCh

l006F7FC0:
	mov	edx,[edi+4h]
	mov	eax,[edx+18h]
	push	edi
	call	eax
	add	esp,4h

l006F7FCC:
	mov	eax,0A1BE38h
	jmp	6F802Bh

l006F7FD3:
	test	edi,edi
	jz	6F8029h

l006F7FD7:
	add	dword ptr [edi],0FFh
	jnz	6F8029h

l006F7FDC:
	mov	ecx,[edi+4h]
	mov	edx,[ecx+18h]
	push	edi
	call	edx
	add	esp,4h
	jmp	6F8029h

l006F7FEA:
	mov	eax,[esp+18h]
	mov	edx,[esp+30h]
	mov	[edx],eax
	mov	eax,[esp+14h]
	jmp	6F802Bh

l006F7FFA:
	mov	ecx,[0A16F8Ch]
	push	8D5B40h
	push	ecx
	jmp	6F8021h

l006F8008:
	mov	edx,[0A16F8Ch]
	push	8D5B10h
	push	edx
	jmp	6F8021h

l006F8016:
	push	8D5AE4h

l006F801B:
	mov	eax,[0A16F8Ch]

l006F8020:
	push	eax

l006F8021:
	call	6E0F80h
	add	esp,8h

l006F8029:
	xor	eax,eax

l006F802B:
	mov	ecx,[esp+290h]
	pop	edi
	pop	esi
	pop	ebp
	pop	ebx
	xor	ecx,esp
	call	694B8Eh
	add	esp,284h
	ret
006F8044             CC CC CC CC CC CC CC CC CC CC CC CC     ............

;; fn006F8050: 006F8050
;;   Called from:
;;     006F8343 (in fn006F82C0)
fn006F8050 proc
	push	edi
	push	edi
	call	6F7810h
	add	esp,8h
	test	eax,eax
	jz	6F8064h

l006F805E:
	mov	eax,1h
	ret

l006F8064:
	push	esi
	mov	esi,[0A1BDB4h]
	mov	ecx,[esi]
	test	ecx,ecx
	jz	6F80A6h

l006F8071:
	mov	eax,edi

l006F8073:
	mov	dl,[eax]
	cmp	dl,[ecx]
	jnz	6F8093h

l006F8079:
	test	dl,dl
	jz	6F808Fh

l006F807D:
	mov	dl,[eax+1h]
	cmp	dl,[ecx+1h]
	jnz	6F8093h

l006F8085:
	add	eax,2h
	add	ecx,2h
	test	dl,dl
	jnz	6F8073h

l006F808F:
	xor	eax,eax
	jmp	6F8098h

l006F8093:
	sbb	eax,eax
	sbb	eax,0FFh

l006F8098:
	test	eax,eax
	jz	6F80AAh

l006F809C:
	mov	ecx,[esi+8h]
	add	esi,8h
	test	ecx,ecx
	jnz	6F8071h

l006F80A6:
	xor	eax,eax
	pop	esi
	ret

l006F80AA:
	cmp	dword ptr [esi+4h],0h
	jnz	6F80C9h

l006F80B0:
	mov	eax,[0A16F8Ch]
	push	edi
	push	8D5C6Ch
	push	eax
	call	6E15D0h
	add	esp,0Ch

l006F80C4:
	or	eax,0FFh
	pop	esi
	ret

l006F80C9:
	cmp	dword ptr [0A74AF0h],0h
	jz	6F80E0h

l006F80D2:
	push	edi
	push	8D5C54h
	call	716B20h
	add	esp,8h

l006F80E0:
	mov	ecx,[esi+4h]
	call	ecx
	call	6E0FC0h
	test	eax,eax
	jnz	6F80C4h

l006F80EE:
	push	edi
	push	edi
	call	6F62D0h
	add	esp,8h
	neg	eax
	sbb	eax,eax
	and	eax,2h
	add	eax,0FFh
	pop	esi
	ret
006F8104             CC CC CC CC CC CC CC CC CC CC CC CC     ............
006F8110 81 EC 0C 01 00 00 A1 88 41 A1 00 33 C4 89 84 24 ........A..3...$
006F8120 08 01 00 00 8B 84 24 10 01 00 00 3D B8 63 A1 00 ......$....=.c..
006F8130 C7 04 24 00 00 00 00 C6 44 24 04 00 75 02 33 C0 ..$.....D$..u.3.
006F8140 57 6A 00 68 01 01 00 00 8D 54 24 10 52 50 51 8D Wj.h.....T$.RPQ.
006F8150 54 24 18 33 C9 E8 36 F7 FF FF 8B F8 83 C4 14 85 T$.3..6.........
006F8160 FF 75 16 5F 8B 8C 24 08 01 00 00 33 CC E8 1C CA .u._..$....3....
006F8170 F9 FF 81 C4 0C 01 00 00 C3 53 55 8B 6C 24 0C 85 .........SU.l$..
006F8180 ED 56 74 29 8B 1D 44 46 8A 00 8B 47 04 53 50 8D .Vt)..DF...G.SP.
006F8190 4C 24 1C 51 55 E8 66 7F 03 00 8B F0 83 C4 10 85 L$.QU.f.........
006F81A0 F6 75 16 55 FF D3 83 C4 04 33 C0 EB 3F 83 05 B8 .u.U.....3..?...
006F81B0 63 A1 00 01 BE B8 63 A1 00 8B 57 08 8B 47 04 8B c.....c...W..G..
006F81C0 0F 52 50 51 8D 54 24 20 52 56 68 94 5C 8D 00 E8 .RPQ.T$ RVh.\...
006F81D0 2C 20 FF FF 83 C4 18 83 06 FF 8B F8 75 0C 8B 46 , ..........u..F
006F81E0 04 8B 48 18 56 FF D1 83 C4 04 8B C7 8B 8C 24 18 ..H.V.........$.
006F81F0 01 00 00 5E 5D 5B 5F 33 CC E8 90 C9 F9 FF 81 C4 ...^][_3........
006F8200 0C 01 00 00 C3 CC CC CC CC CC CC CC CC CC CC CC ................
006F8210 83 EC 08 8B 54 24 10 8D 04 24 50 8D 4C 24 08 51 ....T$...$P.L$.Q
006F8220 68 9C 5C 8D 00 52 C7 44 24 10 00 00 00 00 E8 4D h.\..R.D$......M
006F8230 FA FE FF 83 C4 10 85 C0 75 04 83 C4 08 C3 8B 04 ........u.......
006F8240 24 8B 4C 24 04 50 E8 C5 FE FF FF 83 C4 04 83 C4 $.L$.P..........
006F8250 08 C3 CC CC CC CC CC CC CC CC CC CC CC CC CC CC ................
006F8260 51 8B 4C 24 0C 8D 04 24 50 68 AC 5C 8D 00 51 E8 Q.L$...$Ph.\..Q.
006F8270 0C FA FE FF 83 C4 0C 85 C0 75 04 33 C0 59 C3 57 .........u.3.Y.W
006F8280 8B 7C 24 04 E8 C7 FD FF FF 85 C0 5F 7C ED 75 0E .|$........_|.u.
006F8290 83 05 B8 63 A1 00 01 B8 B8 63 A1 00 59 C3 8B 14 ...c.....c..Y...
006F82A0 24 52 E8 F9 E0 FF FF 83 C4 04 85 C0 74 03 83 00 $R..........t...
006F82B0 01 59 C3 CC CC CC CC CC CC CC CC CC CC CC CC CC .Y..............

;; fn006F82C0: 006F82C0
;;   Called from:
;;     006F854B (in fn006F8440)
;;     006F8A6B (in fn006F8960)
fn006F82C0 proc
	test	esi,esi
	push	ebx
	push	edi
	mov	edi,[esp+0Ch]
	mov	ebx,edx
	jle	6F82EEh

l006F82CC:
	cmp	esi,2h
	jg	6F82EEh

l006F82D1:
	test	eax,eax
	jnz	6F82EEh

l006F82D5:
	mov	eax,[0A17E2Ch]
	push	esi
	push	8D5D6Ch
	push	eax
	call	6E15D0h
	add	esp,0Ch
	pop	edi
	xor	eax,eax
	pop	ebx
	ret

l006F82EE:
	lea	edx,[esi-1h]
	cmp	edx,8h
	ja	6F83FDh

l006F82FA:
	jmp	dword ptr [6F8418h+edx*4]

l006F8301:
	push	eax
	push	edi
	call	6F68F0h
	add	esp,8h
	pop	edi
	pop	ebx
	ret

l006F830E:
	mov	ebx,edi
	call	6F6730h
	pop	edi
	pop	ebx
	ret

l006F8318:
	push	eax
	push	ecx
	push	edi
	call	74F9E0h
	add	esp,0Ch
	pop	edi
	pop	ebx
	ret

l006F8326:
	push	ecx
	push	edi
	call	6F8960h
	add	esp,8h
	pop	edi
	pop	ebx
	ret

l006F8333:
	test	ecx,ecx
	jz	6F833Eh

l006F8337:
	cmp	byte ptr [ecx],0h
	jz	6F833Eh

l006F833C:
	mov	edi,ecx

l006F833E:
	cmp	esi,6h
	jnz	6F834Ah

l006F8343:
	call	6F8050h
	jmp	6F8353h

l006F834A:
	push	edi
	call	6F6D50h
	add	esp,4h

l006F8353:
	test	eax,eax
	jl	6F8413h

l006F835B:
	jnz	6F8387h

l006F835D:
	cmp	esi,6h
	mov	eax,8D5D64h
	jz	6F836Ch

l006F8367:
	mov	eax,8D5D5Ch

l006F836C:
	mov	ecx,[0A16F8Ch]
	push	edi
	push	eax
	push	8D5D34h
	push	ecx
	call	6E15D0h
	add	esp,10h
	pop	edi
	xor	eax,eax
	pop	ebx
	ret

l006F8387:
	call	6F5DA0h
	push	edi
	push	eax
	call	6FD8B0h
	add	esp,8h
	test	eax,eax
	jnz	6F83C4h

l006F839A:
	cmp	esi,6h
	mov	eax,8D5D64h
	jz	6F83A9h

l006F83A4:
	mov	eax,8D5D5Ch

l006F83A9:
	mov	edx,[0A16F8Ch]
	push	edi
	push	eax
	push	8D5D08h
	push	edx
	call	6E15D0h
	add	esp,10h
	pop	edi
	xor	eax,eax
	pop	ebx
	ret

l006F83C4:
	add	dword ptr [eax],1h
	pop	edi
	pop	ebx
	ret

l006F83CA:
	test	ebx,ebx
	jnz	6F83E6h

l006F83CE:
	mov	eax,[0A16F8Ch]
	push	8D5CECh
	push	eax
	call	6E0F80h
	add	esp,8h
	pop	edi
	xor	eax,eax
	pop	ebx
	ret

l006F83E6:
	push	edi
	push	8B22ACh
	push	8D5404h
	push	ebx
	call	7038E0h
	add	esp,10h
	pop	edi
	pop	ebx
	ret

l006F83FD:
	mov	ecx,[0A16F8Ch]
	push	esi
	push	edi
	push	8D5CBCh
	push	ecx
	call	6E15D0h
	add	esp,10h

l006F8413:
	pop	edi
	xor	eax,eax
	pop	ebx
	ret
l006F8418	dd	0x006F8301
l006F841C	dd	0x006F830E
l006F8420	dd	0x006F8318
l006F8424	dd	0x006F83FD
l006F8428	dd	0x006F8326
l006F842C	dd	0x006F8333
l006F8430	dd	0x006F8333
l006F8434	dd	0x006F83FD
l006F8438	dd	0x006F83CA
006F843C                                     CC CC CC CC             ....

;; fn006F8440: 006F8440
;;   Called from:
;;     006F8BA0 (in fn006F8AD0)
;;     006F8BD4 (in fn006F8AD0)
;;     006F8DA8 (in fn006F8C70)
fn006F8440 proc
	sub	esp,11Ch
	mov	eax,[0A14188h]
	xor	eax,esp
	mov	[esp+118h],eax
	mov	eax,[0A6D67Ch]
	push	ebx
	push	ebp
	mov	ebp,[esp+128h]
	push	esi
	mov	esi,[eax+4h]
	cmp	dword ptr [esi+8h],0h
	push	edi
	mov	edi,ecx
	mov	ebx,edx
	mov	[esp+1Ch],edi
	mov	[esp+20h],ebx
	jnz	6F8486h

l006F8479:
	push	8D5538h
	call	6E86F0h
	add	esp,4h

l006F8486:
	mov	esi,[esi+8h]
	push	ebp
	push	esi
	mov	[esp+20h],esi
	call	6FD8B0h
	mov	esi,eax
	xor	eax,eax
	add	esp,8h
	cmp	esi,eax
	jz	6F84A7h

l006F849F:
	add	dword ptr [esi],1h
	jmp	6F85AAh

l006F84A7:
	cmp	edi,0A163B8h
	mov	[esp+10h],eax
	mov	[esp+14h],eax
	jnz	6F8510h

l006F84B7:
	xor	esi,esi

l006F84B9:
	lea	ecx,[esp+10h]
	push	ecx
	push	101h
	lea	edx,[esp+2Ch]
	push	edx
	push	esi
	push	ebx
	lea	edx,[esp+28h]
	mov	ecx,ebp
	mov	byte ptr [esp+38h],0h
	call	6F7890h
	add	esp,14h
	test	esi,esi
	mov	edi,eax
	jz	6F84F4h

l006F84E3:
	add	dword ptr [esi],0FFh
	jnz	6F84F4h

l006F84E8:
	mov	eax,[esi+4h]
	mov	ecx,[eax+18h]
	push	esi
	call	ecx
	add	esp,4h

l006F84F4:
	test	edi,edi
	jnz	6F8537h

l006F84F8:
	mov	edx,[0A16F8Ch]
	push	edx
	call	6E1110h
	add	esp,4h
	test	eax,eax
	jnz	6F8524h

l006F850B:
	jmp	6F85ACh

l006F8510:
	push	8D5840h
	push	edi
	call	6DF760h
	mov	esi,eax
	add	esp,8h
	test	esi,esi
	jnz	6F84B9h

l006F8524:
	call	6E1160h
	add	dword ptr [0A163B8h],1h
	mov	eax,0A163B8h
	jmp	6F85ACh

l006F8537:
	mov	esi,[edi+8h]
	mov	ebx,[esp+10h]
	mov	edi,[esp+14h]
	push	ebp
	mov	edx,ebx
	lea	ecx,[esp+28h]
	mov	eax,edi
	call	6F82C0h
	add	esp,4h
	test	ebx,ebx
	mov	esi,eax
	jz	6F856Ah

l006F8559:
	add	dword ptr [ebx],0FFh
	jnz	6F856Ah

l006F855E:
	mov	eax,[ebx+4h]
	mov	ecx,[eax+18h]
	push	ebx
	call	ecx
	add	esp,4h

l006F856A:
	test	edi,edi
	jz	6F8578h

l006F856E:
	push	edi
	call	dword ptr [8A4644h]
	add	esp,4h

l006F8578:
	mov	ecx,[esp+18h]
	mov	ebx,[esp+20h]
	mov	edi,[esp+1Ch]
	push	ebp
	mov	eax,esi
	call	6F7100h
	add	esp,4h
	test	eax,eax
	jnz	6F85AAh

l006F8593:
	test	esi,esi
	jz	6F85A8h

l006F8597:
	add	dword ptr [esi],0FFh
	jnz	6F85A8h

l006F859C:
	mov	edx,[esi+4h]
	mov	eax,[edx+18h]
	push	esi
	call	eax
	add	esp,4h

l006F85A8:
	xor	esi,esi

l006F85AA:
	mov	eax,esi

l006F85AC:
	mov	ecx,[esp+128h]
	pop	edi
	pop	esi
	pop	ebp
	pop	ebx
	xor	ecx,esp
	call	694B8Eh
	add	esp,11Ch
	ret
006F85C5                CC CC CC CC CC CC CC CC CC CC CC      ...........
006F85D0 81 EC 18 01 00 00 A1 88 41 A1 00 33 C4 89 84 24 ........A..3...$
006F85E0 14 01 00 00 53 55 56 57 8B BC 24 2C 01 00 00 89 ....SUVW..$,....
006F85F0 7C 24 14 E8 98 D2 01 00 8B 40 04 8B 58 14 A1 7C |$.......@..X..|
006F8600 D6 A6 00 8B 70 04 33 ED 39 6E 08 75 0D 68 38 55 ....p.3.9n.u.h8U
006F8610 8D 00 E8 D9 00 FF FF 83 C4 04 3B DD 8B 76 08 89 ..........;..v..
006F8620 74 24 18 89 6C 24 10 89 6C 24 1C 75 12 68 18 5E t$..l$..l$.u.h.^
006F8630 8D 00 E8 B9 00 FF FF 83 C4 04 E9 FD 01 00 00 3B ...............;
006F8640 FD 0F 84 E1 01 00 00 8B 47 04 3D C0 15 A2 00 74 ........G.=....t
006F8650 16 68 C0 15 A2 00 50 E8 14 D0 FD FF 83 C4 08 85 .h....P.........
006F8660 C0 0F 84 C1 01 00 00 57 E8 13 EC 01 00 8B F8 83 .......W........
006F8670 C4 04 85 FF 0F 84 C2 01 00 00 57 56 E8 2F 52 00 ..........WV./R.
006F8680 00 8B 74 24 1C 83 C4 08 3B F0 57 74 19 8B 0D 8C ..t$....;.Wt....
006F8690 6F A1 00 68 EC 5D 8D 00 51 E8 32 8F FE FF 83 C4 o..h.]..Q.2.....
006F86A0 0C E9 96 01 00 00 53 E8 04 52 00 00 83 C4 08 85 ......S..R......
006F86B0 C0 74 08 83 00 01 E9 83 01 00 00 56 57 53 E8 2D .t.........VWS.-
006F86C0 52 00 00 6A 2E 57 FF 15 08 46 8A 00 8B F0 83 C4 R..j.W...F......
006F86D0 14 85 F6 75 07 8B F7 E9 8A 00 00 00 8B D6 2B D7 ...u..........+.
006F86E0 52 57 E8 C9 42 FF FF 8B E8 83 C4 08 85 ED 74 3E RW..B.........t>
006F86F0 8B 44 24 18 55 50 E8 C5 35 00 00 8B D8 83 C4 08 .D$.UP..5.......
006F8700 85 DB 75 34 8B 15 8C 6F A1 00 8D 4D 14 51 68 C0 ..u4...o...M.Qh.
006F8710 5D 8D 00 52 E8 B7 8E FE FF 83 C4 0C 83 45 00 FF ]..R.........E..
006F8720 75 0C 8B 45 04 8B 48 18 55 FF D1 83 C4 04 E8 4D u..E..H.U......M
006F8730 D6 FF FF E9 04 01 00 00 83 45 00 FF 75 0C 8B 55 .........E..u..U
006F8740 04 8B 42 18 55 FF D0 83 C4 04 68 40 58 8D 00 53 ..B.U.....h@X..S
006F8750 83 C6 01 E8 08 70 FE FF 8B E8 83 C4 08 85 ED 75 .....p.........u
006F8760 05 E8 FA 89 FE FF 8D 4C 24 10 51 68 01 01 00 00 .......L$.Qh....
006F8770 8D 54 24 28 52 55 56 8D 54 24 30 8B CF C6 44 24 .T$(RUV.T$0...D$
006F8780 34 00 E8 09 F1 FF FF 83 C4 14 85 ED 8B F0 74 12 4.............t.
006F8790 83 45 00 FF 75 0C 8B 45 04 8B 48 18 55 FF D1 83 .E..u..E..H.U...
006F87A0 C4 04 85 F6 75 20 8B 44 24 10 85 C0 74 11 83 00 ....u .D$...t...
006F87B0 FF 75 0C 8B 50 04 50 8B 42 18 FF D0 83 C4 04 E8 .u..P.P.B.......
006F87C0 BC D5 FF FF EB 76 8B 6C 24 10 8B 5C 24 1C 8B 76 .....v.l$..\$..v
006F87D0 08 57 8B D5 8D 4C 24 24 8B C3 E8 E1 FA FF FF 83 .W...L$$........
006F87E0 C4 04 85 ED 8B F0 74 12 83 45 00 FF 75 0C 8B 4D ......t..E..u..M
006F87F0 04 8B 51 18 55 FF D2 83 C4 04 85 DB 74 0A 53 FF ..Q.U.......t.S.
006F8800 15 44 46 8A 00 83 C4 04 85 F6 75 13 8B 44 24 14 .DF.......u..D$.
006F8810 8B 4C 24 18 50 57 51 E8 D4 50 00 00 83 C4 0C E8 .L$.PWQ..P......
006F8820 5C D5 FF FF 8B C6 EB 16 8B 15 7C 6B A1 00 68 9C \.........|k..h.
006F8830 5D 8D 00 52 E8 47 87 FE FF 83 C4 08 33 C0 8B 8C ]..R.G......3...
006F8840 24 24 01 00 00 5F 5E 5D 5B 33 CC E8 3E C3 F9 FF $$..._^][3..>...
006F8850 81 C4 18 01 00 00 C3 CC CC CC CC CC CC CC CC CC ................
006F8860 83 EC 18 8D 44 24 10 50 8D 4C 24 04 51 8D 54 24 ....D$.P.L$.Q.T$
006F8870 1C 52 8D 44 24 14 50 8B 44 24 30 8D 4C 24 14 51 .R.D$.P.D$0.L$.Q
006F8880 8D 54 24 20 52 68 9C 5E 8D 00 50 E8 F0 F3 FE FF .T$ Rh.^..P.....
006F8890 83 C4 20 85 C0 74 39 8B 0C 24 8A 01 84 C0 74 36 .. ..t9..$....t6
006F88A0 3C 72 74 04 3C 55 75 10 6A 2B 51 FF 15 B0 46 8A <rt.<Uu.j+Q...F.
006F88B0 00 83 C4 08 85 C0 74 1E 8B 0C 24 8B 15 2C 7E A1 ......t...$..,~.
006F88C0 00 51 68 7C 5E 8D 00 52 E8 03 8D FE FF 83 C4 0C .Qh|^..R........
006F88D0 33 C0 83 C4 18 C3 8B 44 24 04 3D B8 63 A1 00 75 3......D$.=.c..u
006F88E0 04 33 C0 EB 50 81 78 04 F0 6E A2 00 74 33 8B 40 .3..P.x..n..t3.@
006F88F0 04 68 F0 6E A2 00 50 E8 74 CD FD FF 83 C4 08 85 .h.n..P.t.......
006F8900 C0 75 1A 8B 0D 2C 7E A1 00 68 50 5E 8D 00 51 E8 .u...,~..hP^..Q.
006F8910 6C 86 FE FF 83 C4 08 33 C0 83 C4 18 C3 8B 44 24 l......3......D$
006F8920 04 8B 54 24 08 8B 0C 24 52 E8 52 EA FF FF 83 C4 ..T$...$R.R.....
006F8930 04 85 C0 74 9B 8B 4C 24 0C 56 8B 74 24 14 51 8B ...t..L$.V.t$.Q.
006F8940 4C 24 10 33 D2 E8 76 F9 FF FF 83 C4 04 5E 83 C4 L$.3..v......^..
006F8950 18 C3 CC CC CC CC CC CC CC CC CC CC CC CC CC CC ................

;; fn006F8960: 006F8960
;;   Called from:
;;     006F8328 (in fn006F82C0)
fn006F8960 proc
	sub	esp,110h
	mov	eax,[0A14188h]
	xor	eax,esp
	mov	[esp+10Ch],eax
	push	ebx
	push	ebp
	mov	ebp,[esp+120h]
	push	esi
	mov	esi,[esp+120h]
	push	edi
	xor	edi,edi
	push	esi
	mov	[esp+14h],edi
	call	6F63A0h
	mov	ebx,eax
	add	esp,4h
	cmp	ebx,edi
	jnz	6F89A2h

l006F899B:
	xor	eax,eax
	jmp	6F8AB4h

l006F89A2:
	cmp	[0A74AF0h],edi
	jz	6F89B9h

l006F89AA:
	push	ebp
	push	esi
	push	8D5EB4h
	call	716B20h
	add	esp,0Ch

l006F89B9:
	push	ebx
	call	717230h
	push	ebp
	mov	[esp+1Ch],eax
	call	6ECAC0h
	mov	ebp,eax
	add	esp,8h
	test	ebp,ebp
	jz	6F8A14h

l006F89D2:
	push	ebp
	push	8D0E84h
	call	6EA200h
	mov	edi,eax
	add	esp,8h
	test	edi,edi
	jz	6F8A14h

l006F89E6:
	mov	eax,[esp+14h]
	push	ebp
	push	8D42BCh
	push	eax
	call	6FD8F0h
	add	esp,0Ch
	test	eax,eax
	jnz	6F8A14h

l006F89FD:
	mov	ecx,[esp+14h]
	push	edi
	push	8D5840h
	push	ecx
	call	6FD8F0h
	add	esp,0Ch
	test	eax,eax
	jz	6F8A18h

l006F8A14:
	xor	ebx,ebx
	jmp	6F8A87h

l006F8A18:
	push	0h
	push	101h
	lea	edx,[esp+20h]
	push	edx
	push	edi
	push	8B2D3Ch
	lea	edx,[esp+24h]
	mov	ecx,esi
	mov	byte ptr [esp+2Ch],0h
	call	6F7890h
	add	esp,14h
	test	eax,eax
	jnz	6F8A5Dh

l006F8A41:
	mov	eax,[0A16F8Ch]
	push	eax
	call	6E1110h
	add	esp,4h
	test	eax,eax
	jz	6F8A14h

l006F8A53:
	call	6E1160h
	add	dword ptr [ebx],1h
	jmp	6F8A87h

l006F8A5D:
	push	esi
	mov	esi,[eax+8h]
	mov	eax,[esp+14h]
	xor	edx,edx
	lea	ecx,[esp+1Ch]
	call	6F82C0h
	mov	ebx,eax
	mov	eax,[esp+14h]
	add	esp,4h
	test	eax,eax
	jz	6F8A87h

l006F8A7D:
	push	eax
	call	dword ptr [8A4644h]
	add	esp,4h

l006F8A87:
	test	edi,edi
	jz	6F8A9Ch

l006F8A8B:
	add	dword ptr [edi],0FFh
	jnz	6F8A9Ch

l006F8A90:
	mov	ecx,[edi+4h]
	mov	edx,[ecx+18h]
	push	edi
	call	edx
	add	esp,4h

l006F8A9C:
	test	ebp,ebp
	jz	6F8AB2h

l006F8AA0:
	add	dword ptr [ebp+0h],0FFh
	jnz	6F8AB2h

l006F8AA6:
	mov	eax,[ebp+4h]
	mov	ecx,[eax+18h]
	push	ebp
	call	ecx
	add	esp,4h

l006F8AB2:
	mov	eax,ebx

l006F8AB4:
	mov	ecx,[esp+11Ch]
	pop	edi
	pop	esi
	pop	ebp
	pop	ebx
	xor	ecx,esp
	call	694B8Eh
	add	esp,110h
	ret
006F8ACD                                        CC CC CC              ...

;; fn006F8AD0: 006F8AD0
;;   Called from:
;;     006F8F39 (in fn006F8EC0)
;;     006F8F80 (in fn006F8EC0)
fn006F8AD0 proc
	push	ecx
	push	ebp
	push	esi
	push	edi
	mov	esi,eax
	mov	ebp,[esi]
	push	2Eh
	push	ebp
	call	dword ptr [8A46B0h]
	mov	ecx,ebp
	add	esp,8h
	lea	edi,[ecx+1h]
	lea	esp,[esp+0h]

l006F8AF0:
	mov	dl,[ecx]
	add	ecx,1h
	test	dl,dl
	jnz	6F8AF0h

l006F8AF9:
	sub	ecx,edi
	jnz	6F8B0Fh

l006F8AFD:
	mov	eax,[esp+14h]
	add	dword ptr [eax],1h
	pop	edi
	mov	dword ptr [esi],0h
	pop	esi
	pop	ebp
	pop	ecx
	ret

l006F8B0F:
	test	eax,eax
	push	ebx
	jnz	6F8B2Dh

l006F8B14:
	mov	ebx,ebp
	mov	[esi],eax
	lea	ecx,[ebx+1h]
	jmp	6F8B20h
006F8B1D                                        8D 49 00              .I.

l006F8B20:
	mov	al,[ebx]
	add	ebx,1h
	test	al,al
	jnz	6F8B20h

l006F8B29:
	sub	ebx,ecx
	jmp	6F8B36h

l006F8B2D:
	lea	ecx,[eax+1h]
	sub	eax,ebp
	mov	[esi],ecx
	mov	ebx,eax

l006F8B36:
	test	ebx,ebx
	jnz	6F8B41h

l006F8B3A:
	push	8D5ED0h
	jmp	6F8B6Bh

l006F8B41:
	mov	eax,[esp+24h]
	mov	esi,[eax]
	mov	eax,[esp+20h]
	add	esi,eax
	cmp	esi,eax
	jz	6F8B57h

l006F8B51:
	mov	byte ptr [esi],2Eh
	add	esi,1h

l006F8B57:
	mov	ecx,esi
	sub	ecx,eax
	lea	edi,[ecx+ebx]
	cmp	edi,100h
	jl	6F8B82h

l006F8B66:
	push	8D5920h

l006F8B6B:
	mov	edx,[0A17E2Ch]
	push	edx
	call	6E0F80h
	add	esp,8h
	pop	ebx
	pop	edi
	pop	esi
	xor	eax,eax
	pop	ebp
	pop	ecx
	ret

l006F8B82:
	push	ebx
	push	ebp
	push	esi
	call	dword ptr [8A45DCh]
	mov	ecx,[esp+2Ch]
	mov	eax,[esp+30h]
	push	ecx
	mov	ecx,[esp+28h]
	mov	byte ptr [esi+ebx],0h
	mov	edx,esi
	mov	[eax],edi
	call	6F8440h
	mov	edi,eax
	add	esp,10h
	cmp	edi,0A163B8h
	jnz	6F8C2Ah

l006F8BB2:
	mov	edx,[esp+1Ch]
	cmp	edx,[esp+18h]
	jz	6F8C2Ah

l006F8BBC:
	add	dword ptr [edi],0FFh
	jnz	6F8BCDh

l006F8BC1:
	mov	eax,[edi+4h]
	mov	ecx,[eax+18h]
	push	edi
	call	ecx
	add	esp,4h

l006F8BCD:
	mov	ecx,[esp+1Ch]
	push	esi
	mov	edx,esi
	call	6F8440h
	mov	edi,eax
	add	esp,4h
	test	edi,edi
	jz	6F8C5Ch

l006F8BE2:
	cmp	edi,0A163B8h
	jz	6F8C2Ah

l006F8BEA:
	mov	esi,[esp+20h]
	push	esi
	call	6F70C0h
	add	esp,4h
	test	eax,eax
	jz	6F8C14h

l006F8BFB:
	add	dword ptr [edi],0FFh
	jnz	6F8C0Ch

l006F8C00:
	mov	edx,[edi+4h]
	mov	eax,[edx+18h]
	push	edi
	call	eax
	add	esp,4h

l006F8C0C:
	pop	ebx
	pop	edi
	pop	esi
	xor	eax,eax
	pop	ebp
	pop	ecx
	ret

l006F8C14:
	push	ebx
	push	ebp
	push	esi
	call	dword ptr [8A45DCh]
	mov	ecx,[esp+30h]
	mov	byte ptr [ebx+esi],0h
	add	esp,0Ch
	mov	[ecx],ebx

l006F8C2A:
	test	edi,edi
	jz	6F8C5Ch

l006F8C2E:
	cmp	edi,0A163B8h
	jnz	6F8C64h

l006F8C36:
	add	dword ptr [edi],0FFh
	jnz	6F8C47h

l006F8C3B:
	mov	edx,[edi+4h]
	mov	eax,[edx+18h]
	push	edi
	call	eax
	add	esp,4h

l006F8C47:
	mov	ecx,[0A16F8Ch]
	push	ebp
	push	8D5B68h
	push	ecx
	call	6E15D0h
	add	esp,0Ch

l006F8C5C:
	pop	ebx
	pop	edi
	pop	esi
	xor	eax,eax
	pop	ebp
	pop	ecx
	ret

l006F8C64:
	pop	ebx
	mov	eax,edi
	pop	edi
	pop	esi
	pop	ebp
	pop	ecx
	ret
006F8C6C                                     CC CC CC CC             ....

;; fn006F8C70: 006F8C70
;;   Called from:
;;     006F8D2D (in fn006F8C70)
;;     006F904F (in fn006F8EC0)
fn006F8C70 proc
	push	ecx
	mov	eax,[esp+8h]
	push	8D5840h
	push	eax
	call	6DF7C0h
	add	esp,8h
	test	eax,eax
	jnz	6F8C8Eh

l006F8C87:
	mov	eax,1h
	pop	ecx
	ret

l006F8C8E:
	mov	ecx,[esp+0Ch]
	push	ebx
	push	ebp
	push	esi
	push	edi
	push	0h
	push	ecx
	mov	dword ptr [esp+18h],0h
	call	703180h
	mov	esi,eax
	add	esp,8h
	test	esi,esi
	jz	6F8DFDh

l006F8CB3:
	mov	ebx,[esp+24h]
	mov	ebp,[esp+20h]
	jmp	6F8CC0h
006F8CBD                                        8D 49 00              .I.

l006F8CC0:
	mov	eax,[esi+4h]
	cmp	eax,0A1B450h
	jz	6F8CE0h

l006F8CCA:
	push	0A1B450h
	push	eax
	call	6D5670h
	add	esp,8h
	test	eax,eax
	jz	6F8E1Fh

l006F8CE0:
	cmp	byte ptr [esi+14h],2Ah
	lea	edi,[esi+14h]
	jnz	6F8D55h

l006F8CE9:
	add	dword ptr [esi],0FFh
	jnz	6F8CFAh

l006F8CEE:
	mov	edx,[esi+4h]
	mov	eax,[edx+18h]
	push	esi
	call	eax
	add	esp,4h

l006F8CFA:
	cmp	dword ptr [esp+28h],0h
	jnz	6F8DDAh

l006F8D05:
	mov	edi,[esp+18h]
	push	8D5F08h
	push	edi
	call	6DF760h
	mov	esi,eax
	add	esp,8h
	test	esi,esi
	jnz	6F8D27h

l006F8D1D:
	call	6E1160h
	jmp	6F8DDAh

l006F8D27:
	push	1h
	push	ebx
	push	ebp
	push	esi
	push	edi
	call	6F8C70h
	add	esp,14h
	add	dword ptr [esi],0FFh
	mov	edi,eax
	jnz	6F8D48h

l006F8D3C:
	mov	ecx,[esi+4h]
	mov	edx,[ecx+18h]
	push	esi
	call	edx
	add	esp,4h

l006F8D48:
	test	edi,edi
	jz	6F8E6Ah

l006F8D50:
	jmp	6F8DDAh

l006F8D55:
	mov	eax,[esp+18h]
	push	esi
	push	eax
	call	6DE3F0h
	add	esp,8h
	test	eax,eax
	jnz	6F8DC9h

l006F8D67:
	mov	eax,edi
	lea	edx,[eax+1h]
	lea	esp,[esp+0h]

l006F8D70:
	mov	cl,[eax]
	add	eax,1h
	test	cl,cl
	jnz	6F8D70h

l006F8D79:
	sub	eax,edx
	add	eax,ebx
	cmp	eax,100h
	jnc	6F8E4Ch

l006F8D88:
	lea	ecx,[ebx+ebp]
	mov	byte ptr [ecx],2Eh
	sub	ecx,edi
	mov	eax,edi
	lea	edx,[ecx+1h]

l006F8D95:
	mov	cl,[eax]
	mov	[edx+eax],cl
	add	eax,1h
	test	cl,cl
	jnz	6F8D95h

l006F8DA1:
	mov	ecx,[esp+18h]
	push	ebp
	mov	edx,edi
	call	6F8440h
	add	esp,4h
	test	eax,eax
	jz	6F8E59h

l006F8DB8:
	add	dword ptr [eax],0FFh
	jnz	6F8DC9h

l006F8DBD:
	mov	ecx,[eax+4h]
	mov	edx,[ecx+18h]
	push	eax
	call	edx
	add	esp,4h

l006F8DC9:
	add	dword ptr [esi],0FFh
	jnz	6F8DDAh

l006F8DCE:
	mov	eax,[esi+4h]
	mov	ecx,[eax+18h]
	push	esi
	call	ecx
	add	esp,4h

l006F8DDA:
	mov	eax,[esp+10h]
	mov	edx,[esp+1Ch]
	add	eax,1h
	push	eax
	push	edx
	mov	[esp+18h],eax
	call	703180h
	mov	esi,eax
	add	esp,8h
	test	esi,esi
	jnz	6F8CC0h

l006F8DFD:
	mov	eax,[0A17CA4h]
	push	eax
	call	6E1110h
	add	esp,4h
	test	eax,eax
	jz	6F8E6Ah

l006F8E0F:
	call	6E1160h
	pop	edi
	pop	esi
	pop	ebp
	mov	eax,1h
	pop	ebx
	pop	ecx
	ret

l006F8E1F:
	mov	ecx,[0A16B7Ch]
	push	8D5EE4h

l006F8E2A:
	push	ecx
	call	6E0F80h
	add	esp,8h
	add	dword ptr [esi],0FFh
	jnz	6F8E6Ah

l006F8E38:
	mov	edx,[esi+4h]
	mov	eax,[edx+18h]
	push	esi
	call	eax
	add	esp,4h
	pop	edi
	pop	esi
	pop	ebp
	xor	eax,eax
	pop	ebx
	pop	ecx
	ret

l006F8E4C:
	mov	ecx,[0A17E2Ch]
	push	8D5920h
	jmp	6F8E2Ah

l006F8E59:
	add	dword ptr [esi],0FFh
	jnz	6F8E6Ah

l006F8E5E:
	mov	ecx,[esi+4h]
	mov	edx,[ecx+18h]
	push	esi
	call	edx
	add	esp,4h

l006F8E6A:
	pop	edi
	pop	esi
	pop	ebp
	xor	eax,eax
	pop	ebx
	pop	ecx
	ret
006F8E72       CC CC CC CC CC CC CC CC CC CC CC CC CC CC   ..............
006F8E80 8B 54 24 08 83 EC 08 8D 04 24 50 8D 4C 24 08 51 .T$......$P.L$.Q
006F8E90 68 10 5F 8D 00 52 E8 E5 ED FE FF 83 C4 10 85 C0 h._..R..........
006F8EA0 75 04 83 C4 08 C3 8B 04 24 8B 4C 24 04 50 51 E8 u.......$.L$.PQ.
006F8EB0 AC FA FF FF 83 C4 08 83 C4 08 C3 CC CC CC CC CC ................

;; fn006F8EC0: 006F8EC0
;;   Called from:
;;     006F90A9 (in fn006F9090)
fn006F8EC0 proc
	sub	esp,110h
	mov	eax,[0A14188h]
	xor	eax,esp
	mov	[esp+10Ch],eax
	mov	eax,[esp+114h]
	push	ebx
	push	ebp
	mov	ebp,[esp+124h]
	push	ecx
	lea	edx,[esp+0Ch]
	mov	[esp+10h],eax
	mov	eax,[esp+124h]
	push	edx
	lea	ebx,[esp+18h]
	mov	dword ptr [esp+10h],0h
	call	6F6EA0h
	add	esp,8h
	test	eax,eax
	jnz	6F8F24h

l006F8F0D:
	pop	ebp
	pop	ebx
	mov	ecx,[esp+10Ch]
	xor	ecx,esp
	call	694B8Eh
	add	esp,110h
	ret

l006F8F24:
	push	edi
	lea	ecx,[esp+0Ch]
	push	ecx
	lea	edx,[esp+18h]
	push	edx
	push	0A163B8h
	push	eax
	lea	eax,[esp+20h]
	call	6F8AD0h
	mov	edi,eax
	add	esp,10h
	test	edi,edi
	jnz	6F8F5Fh

l006F8F47:
	pop	edi
	pop	ebp
	pop	ebx
	mov	ecx,[esp+10Ch]
	xor	ecx,esp
	call	694B8Eh
	add	esp,110h
	ret

l006F8F5F:
	add	dword ptr [edi],1h
	cmp	dword ptr [esp+10h],0h
	push	esi
	mov	esi,edi
	jz	6F8FA8h

l006F8F6C:
	lea	esp,[esp+0h]

l006F8F70:
	lea	eax,[esp+10h]
	push	eax
	lea	ecx,[esp+1Ch]
	push	ecx
	push	esi
	push	esi
	lea	eax,[esp+24h]
	call	6F8AD0h
	add	esp,10h
	add	dword ptr [esi],0FFh
	mov	ebx,eax
	jnz	6F8F9Bh

l006F8F8F:
	mov	edx,[esi+4h]
	mov	eax,[edx+18h]
	push	esi
	call	eax
	add	esp,4h

l006F8F9B:
	test	ebx,ebx
	jz	6F8FEDh

l006F8F9F:
	cmp	dword ptr [esp+14h],0h
	mov	esi,ebx
	jnz	6F8F70h

l006F8FA8:
	cmp	esi,0A163B8h
	jnz	6F9002h

l006F8FB0:
	add	dword ptr [esi],0FFh
	jnz	6F8FC1h

l006F8FB5:
	mov	eax,[esi+4h]
	mov	ecx,[eax+18h]
	push	esi
	call	ecx
	add	esp,4h

l006F8FC1:
	add	dword ptr [edi],0FFh
	jnz	6F8FD2h

l006F8FC6:
	mov	edx,[edi+4h]
	mov	eax,[edx+18h]
	push	edi
	call	eax
	add	esp,4h

l006F8FD2:
	mov	ecx,[0A17E2Ch]
	push	8D5ED0h
	push	ecx
	call	6E0F80h
	add	esp,8h
	xor	eax,eax
	jmp	6F9072h

l006F8FED:
	add	dword ptr [edi],0FFh
	jnz	6F906Ch

l006F8FF2:
	mov	ecx,[edi+4h]
	mov	edx,[ecx+18h]
	push	edi
	call	edx
	add	esp,4h
	xor	eax,eax
	jmp	6F9072h

l006F9002:
	test	ebp,ebp
	jz	6F901Bh

l006F9006:
	cmp	ebp,0A163B8h
	jz	6F901Bh

l006F900E:
	push	ebp
	call	6DEA90h
	add	esp,4h
	test	eax,eax
	jnz	6F9030h

l006F901B:
	add	dword ptr [esi],0FFh
	jnz	6F902Ch

l006F9020:
	mov	edx,[esi+4h]
	mov	eax,[edx+18h]
	push	esi
	call	eax
	add	esp,4h

l006F902C:
	mov	eax,edi
	jmp	6F9072h

l006F9030:
	add	dword ptr [edi],0FFh
	jnz	6F9041h

l006F9035:
	mov	ecx,[edi+4h]
	mov	edx,[ecx+18h]
	push	edi
	call	edx
	add	esp,4h

l006F9041:
	mov	eax,[esp+10h]
	push	0h
	push	eax
	lea	ecx,[esp+20h]
	push	ecx
	push	ebp
	push	esi
	call	6F8C70h
	add	esp,14h
	test	eax,eax
	jnz	6F9070h

l006F905B:
	add	dword ptr [esi],0FFh
	jnz	6F906Ch

l006F9060:
	mov	edx,[esi+4h]
	mov	eax,[edx+18h]
	push	esi
	call	eax
	add	esp,4h

l006F906C:
	xor	eax,eax
	jmp	6F9072h

l006F9070:
	mov	eax,esi

l006F9072:
	mov	ecx,[esp+11Ch]
	pop	esi
	pop	edi
	pop	ebp
	pop	ebx
	xor	ecx,esp
	call	694B8Eh
	add	esp,110h
	ret
006F908B                                  CC CC CC CC CC            .....

;; fn006F9090: 006F9090
;;   Called from:
;;     006F91B7 (in fn006F9120)
;;     0074EA51 (in fn0074E980)
fn006F9090 proc
	push	esi
	call	6F5C60h
	mov	eax,[esp+14h]
	mov	ecx,[esp+0Ch]
	mov	edx,[esp+8h]
	push	eax
	push	ecx
	mov	ecx,[esp+20h]
	push	edx
	call	6F8EC0h
	add	esp,0Ch
	mov	esi,eax
	call	74F680h
	cmp	eax,0FFh
	jz	6F90EBh

l006F90BD:
	mov	ecx,[0A6CB90h]
	test	ecx,ecx
	jz	6F90EBh

l006F90C7:
	cmp	[0A1BDB8h],eax
	jnz	6F90EFh

l006F90CF:
	sub	dword ptr [0A6CB94h],1h
	jnz	6F90EBh

l006F90D8:
	push	ecx
	mov	dword ptr [0A1BDB8h],0FFFFFFFFh
	call	74F570h
	add	esp,4h

l006F90EB:
	mov	eax,esi
	pop	esi
	ret

l006F90EF:
	test	esi,esi
	jz	6F9104h

l006F90F3:
	add	dword ptr [esi],0FFh
	jnz	6F9104h

l006F90F8:
	mov	eax,[esi+4h]
	mov	ecx,[eax+18h]
	push	esi
	call	ecx
	add	esp,4h

l006F9104:
	mov	edx,[0A175E0h]
	push	8D551Ch
	push	edx
	call	6E0F80h
	add	esp,8h
	xor	eax,eax
	pop	esi
	ret
006F911C                                     CC CC CC CC             ....

;; fn006F9120: 006F9120
;;   Called from:
;;     006F92C8 (in fn006F92B0)
fn006F9120 proc
	push	ebx
	push	ebp
	xor	ebx,ebx
	xor	ebp,ebp
	cmp	[0A6CBA0h],ebx
	jnz	6F917Ah

l006F912E:
	push	8D5F2Ch
	call	6F1A70h
	add	esp,4h
	test	eax,eax
	mov	[0A6CBA8h],eax
	jnz	6F9149h

l006F9144:
	pop	ebp
	xor	eax,eax
	pop	ebx
	ret

l006F9149:
	push	8D41A4h
	call	6F1A70h
	add	esp,4h
	test	eax,eax
	mov	[0A6CBA4h],eax
	jz	6F9144h

l006F915F:
	push	8D0D58h
	push	8D5F28h
	call	6EA200h
	add	esp,8h
	test	eax,eax
	mov	[0A6CBA0h],eax
	jz	6F9144h

l006F917A:
	push	esi
	push	edi
	call	708860h
	mov	esi,eax
	test	esi,esi
	jz	6F91A5h

l006F9187:
	mov	eax,[0A6CBA4h]
	add	dword ptr [esi],1h
	push	eax
	push	esi
	call	704220h
	mov	edi,eax
	add	esp,8h
	test	edi,edi
	jz	6F925Fh

l006F91A3:
	jmp	6F91E9h

l006F91A5:
	call	6E1160h
	push	0h
	push	0h
	push	0h
	push	0h
	push	8D144Ch
	call	6F9090h
	mov	edi,eax
	add	esp,14h
	test	edi,edi
	jnz	6F91CAh

l006F91C5:
	pop	edi
	pop	esi
	pop	ebp
	pop	ebx
	ret

l006F91CA:
	mov	ecx,[0A6CBA4h]
	push	edi
	push	ecx
	push	8D5F20h
	call	6EA200h
	mov	esi,eax
	add	esp,0Ch
	test	esi,esi
	jz	6F9274h

l006F91E9:
	mov	eax,[edi+4h]
	cmp	eax,0A1D1B8h
	jz	6F9216h

l006F91F3:
	push	0A1D1B8h
	push	eax
	call	6D5670h
	add	esp,8h
	test	eax,eax
	jnz	6F9216h

l006F9205:
	mov	edx,[0A6CBA8h]
	push	edx
	push	edi
	call	6DE330h
	mov	ebx,eax
	jmp	6F923Eh

l006F9216:
	mov	eax,[0A6CBA8h]
	push	eax
	push	edi
	call	704220h
	mov	ebx,eax
	add	esp,8h
	test	ebx,ebx
	jnz	6F9245h

l006F922B:
	mov	ecx,[0A6CBA8h]
	mov	edx,[0A17E28h]
	push	ecx
	push	edx
	call	6E0E90h

l006F923E:
	add	esp,8h
	test	ebx,ebx
	jz	6F925Fh

l006F9245:
	mov	eax,[0A6CBA0h]
	mov	ecx,[esp+14h]
	push	0h
	push	eax
	push	esi
	push	esi
	push	ecx
	push	ebx
	call	703AF0h
	add	esp,18h
	mov	ebp,eax

l006F925F:
	test	esi,esi
	jz	6F9274h

l006F9263:
	add	dword ptr [esi],0FFh
	jnz	6F9274h

l006F9268:
	mov	edx,[esi+4h]
	mov	eax,[edx+18h]
	push	esi
	call	eax
	add	esp,4h

l006F9274:
	test	edi,edi
	jz	6F9289h

l006F9278:
	add	dword ptr [edi],0FFh
	jnz	6F9289h

l006F927D:
	mov	ecx,[edi+4h]
	mov	edx,[ecx+18h]
	push	edi
	call	edx
	add	esp,4h

l006F9289:
	test	ebx,ebx
	jz	6F929Eh

l006F928D:
	add	dword ptr [ebx],0FFh
	jnz	6F929Eh

l006F9292:
	mov	eax,[ebx+4h]
	mov	ecx,[eax+18h]
	push	ebx
	call	ecx
	add	esp,4h

l006F929E:
	pop	edi
	pop	esi
	mov	eax,ebp
	pop	ebp
	pop	ebx
	ret
006F92A5                CC CC CC CC CC CC CC CC CC CC CC      ...........

;; fn006F92B0: 006F92B0
;;   Called from:
;;     006E19F7 (in fn006E19F0)
;;     00719210 (in fn00718F10)
fn006F92B0 proc
	mov	eax,[esp+4h]
	push	esi
	push	eax
	call	6ECAC0h
	mov	esi,eax
	add	esp,4h
	test	esi,esi
	jnz	6F92C6h

l006F92C4:
	pop	esi
	ret

l006F92C6:
	push	edi
	push	esi
	call	6F9120h
	add	esp,4h
	add	dword ptr [esi],0FFh
	mov	edi,eax
	jnz	6F92E3h

l006F92D7:
	mov	ecx,[esi+4h]
	mov	edx,[ecx+18h]
	push	esi
	call	edx
	add	esp,4h

l006F92E3:
	mov	eax,edi
	pop	edi
	pop	esi
	ret
006F92E8                         CC CC CC CC CC CC CC CC         ........
006F92F0 53 56 57 68 60 C5 A1 00 33 DB E8 C1 12 FE FF 83 SVWh`...3.......
006F9300 C4 04 85 C0 0F 8C 28 01 00 00 39 1D F0 4A A7 00 ......(...9..J..
006F9310 74 0D 68 08 60 8D 00 E8 04 D8 01 00 83 C4 04 6A t.h.`..........j
006F9320 00 E8 2A 93 FF FF 8B F0 83 C4 04 85 F6 0F 84 FF ..*.............
006F9330 00 00 00 56 68 64 54 8D 00 E8 12 CB 01 00 83 C4 ...VhdT.........
006F9340 08 83 06 FF 8B F8 75 0C 8B 46 04 8B 48 18 56 FF ......u..F..H.V.
006F9350 D1 83 C4 04 85 FF 0F 85 D6 00 00 00 E8 5F 49 00 ............._I.
006F9360 00 8B F0 85 F6 0F 84 C7 00 00 00 56 68 70 54 8D ...........VhpT.
006F9370 00 E8 DA CA 01 00 83 C4 08 83 06 FF 8B F8 75 0C ..............u.
006F9380 8B 56 04 8B 42 18 56 FF D0 83 C4 04 85 FF 0F 85 .V..B.V.........
006F9390 9E 00 00 00 57 E8 B6 92 FF FF 8B D8 83 C4 04 85 ....W...........
006F93A0 DB 0F 84 8B 00 00 00 53 68 84 54 8D 00 E8 9E CA .......Sh.T.....
006F93B0 01 00 83 C4 08 85 C0 75 79 68 FC 5F 8D 00 E8 FD .......uyh._....
006F93C0 36 FF FF 8B F0 83 C4 04 85 F6 74 7D 56 E8 4E FD 6.........t}V.N.
006F93D0 FF FF 83 C4 04 83 06 FF 8B F8 75 0C 8B 4E 04 8B ..........u..N..
006F93E0 51 18 56 FF D2 83 C4 04 85 FF 74 5D 68 F0 5F 8D Q.V.......t]h._.
006F93F0 00 57 E8 69 63 FE FF 83 C4 08 83 07 FF 8B F0 75 .W.ic..........u
006F9400 0C 8B 47 04 8B 48 18 57 FF D1 83 C4 04 85 F6 74 ..G..H.W.......t
006F9410 4D 56 53 E8 F8 95 FF FF 83 C4 08 83 06 FF 8B F8 MVS.............
006F9420 75 0C 8B 56 04 8B 42 18 56 FF D0 83 C4 04 85 FF u..V..B.V.......
006F9430 74 41 E8 39 FE FE FF 68 98 5F 8D 00 E8 AF F2 FE tA.9...h._......
006F9440 FF 83 C4 04 E9 70 FF FF FF E8 12 7D FE FF 83 3D .....p.....}...=
006F9450 F0 4A A7 00 00 74 32 68 7C 5F 8D 00 EB 23 E8 FD .J...t2h|_...#..
006F9460 7C FE FF 83 3D F0 4A A7 00 00 74 1D 68 54 5F 8D |...=.J...t.hT_.
006F9470 00 EB 0E 83 3D F0 4A A7 00 00 74 0D 68 38 5F 8D ....=.J...t.h8_.
006F9480 00 E8 9A D6 01 00 83 C4 04 83 03 FF 75 0C 8B 4B ............u..K
006F9490 04 8B 51 18 53 FF D2 83 C4 04 5F 5E 5B C3 CC CC ..Q.S....._^[...

;; fn006F94A0: 006F94A0
;;   Called from:
;;     0074E9CB (in fn0074E980)
fn006F94A0 proc
	push	esi
	mov	esi,[0A6CBB0h]
	test	esi,esi
	jz	6F9524h

l006F94AB:
	mov	eax,[esi+0Ch]
	mov	[0A6CBB0h],eax
	mov	dword ptr [esi+4h],0A1C698h
	mov	dword ptr [esi],1h

l006F94C0:
	mov	eax,[esp+0Ch]
	test	eax,eax
	mov	ecx,[esp+8h]
	mov	[esi+8h],ecx
	jz	6F94D2h

l006F94CF:
	add	dword ptr [eax],1h

l006F94D2:
	mov	[esi+0Ch],eax
	mov	eax,[esp+10h]
	test	eax,eax
	jz	6F94E0h

l006F94DD:
	add	dword ptr [eax],1h

l006F94E0:
	push	edi
	lea	edi,[esi-10h]
	mov	[esi+10h],eax
	cmp	dword ptr [edi+8h],0FEh
	jz	6F94FAh

l006F94ED:
	push	8D0E04h
	call	6E86F0h
	add	esp,4h

l006F94FA:
	mov	dword ptr [edi+8h],0FFFFFFFDh
	mov	edx,[0A1D558h]
	mov	[edi],edx
	mov	eax,[0A1D558h]
	mov	eax,[eax+4h]
	mov	[edi+4h],eax
	mov	[eax],edi
	mov	ecx,[0A1D558h]
	mov	[ecx+4h],edi
	pop	edi
	mov	eax,esi
	pop	esi
	ret

l006F9524:
	push	0A1C698h
	call	6FEF30h
	mov	esi,eax
	add	esp,4h
	test	esi,esi
	jnz	6F94C0h

l006F9537:
	pop	esi
	ret
006F9539                            CC CC CC CC CC CC CC          .......

;; fn006F9540: 006F9540
;;   Called from:
;;     00708AC8 (in fn00708880)
;;     00708B26 (in fn00708880)
fn006F9540 proc
	push	ebx
	push	esi
	mov	esi,[esp+0Ch]
	mov	eax,[esi+8h]
	mov	ebx,[esi+0Ch]
	push	edi
	mov	edi,[eax+4h]
	mov	eax,[eax+8h]
	and	eax,8Fh
	cmp	eax,8h
	ja	6F96A1h

l006F955F:
	jmp	dword ptr [6F96B8h+eax*4]

l006F9566:
	mov	eax,[esp+18h]
	test	eax,eax
	jz	6F957Fh

l006F956E:
	push	eax
	call	6FCF20h
	add	esp,4h
	test	eax,eax
	jnz	6F9656h

l006F957F:
	mov	eax,[esp+14h]
	push	eax
	push	ebx
	call	edi
	add	esp,8h
	pop	edi
	pop	esi
	pop	ebx
	ret

l006F958E:
	mov	ecx,[esp+18h]
	mov	edx,[esp+14h]
	push	ecx
	push	edx
	push	ebx
	call	edi
	add	esp,0Ch
	pop	edi
	pop	esi
	pop	ebx
	ret

l006F95A2:
	mov	eax,[esp+18h]
	test	eax,eax
	jz	6F95BBh

l006F95AA:
	push	eax
	call	6FCF20h
	add	esp,4h
	test	eax,eax
	jnz	6F9656h

l006F95BB:
	mov	eax,[esp+14h]
	mov	eax,[eax+8h]
	test	eax,eax
	jnz	6F95D1h

l006F95C6:
	push	eax
	push	ebx
	call	edi
	add	esp,8h
	pop	edi
	pop	esi
	pop	ebx
	ret

l006F95D1:
	mov	ecx,[esi+8h]
	mov	edx,[ecx]
	push	eax
	mov	eax,[0A16B7Ch]
	push	edx
	push	8D60B4h
	push	eax
	call	6E15D0h
	add	esp,10h
	pop	edi
	pop	esi
	xor	eax,eax
	pop	ebx
	ret

l006F95F1:
	mov	eax,[esp+18h]
	test	eax,eax
	jz	6F9606h

l006F95F9:
	push	eax
	call	6FCF20h
	add	esp,4h
	test	eax,eax
	jnz	6F9656h

l006F9606:
	mov	ecx,[esp+14h]
	mov	eax,[ecx+8h]
	cmp	eax,1h
	jnz	6F9620h

l006F9612:
	mov	ecx,[ecx+0Ch]
	push	ecx
	push	ebx
	call	edi
	add	esp,8h
	pop	edi
	pop	esi
	pop	ebx
	ret

l006F9620:
	mov	edx,[esi+8h]
	mov	ecx,[0A16B7Ch]
	push	eax
	mov	eax,[edx]
	push	eax
	push	8D6084h
	push	ecx
	call	6E15D0h
	add	esp,10h
	pop	edi
	pop	esi
	xor	eax,eax
	pop	ebx
	ret

l006F9641:
	mov	eax,[esp+18h]
	test	eax,eax
	jz	6F9676h

l006F9649:
	push	eax
	call	6FCF20h
	add	esp,4h
	test	eax,eax
	jz	6F9676h

l006F9656:
	mov	edx,[esi+8h]
	mov	eax,[edx]
	mov	ecx,[0A16B7Ch]
	push	eax
	push	8D6060h
	push	ecx
	call	6E15D0h
	add	esp,0Ch
	pop	edi
	pop	esi
	xor	eax,eax
	pop	ebx
	ret

l006F9676:
	mov	eax,[esp+14h]
	mov	ecx,[eax+8h]
	cmp	ecx,1h
	jnz	6F9690h

l006F9682:
	mov	eax,[eax+0Ch]
	push	eax
	push	ebx
	call	edi
	add	esp,8h
	pop	edi
	pop	esi
	pop	ebx
	ret

l006F9690:
	test	ecx,ecx
	jnz	6F9696h

l006F9694:
	xor	eax,eax

l006F9696:
	push	eax
	push	ebx
	call	edi
	add	esp,8h
	pop	edi
	pop	esi
	pop	ebx
	ret

l006F96A1:
	push	70h
	push	8D6044h
	call	6E1DC0h
	add	esp,8h
	pop	edi
	pop	esi
	xor	eax,eax
	pop	ebx
	ret
006F96B6                   8B FF                               ..       
l006F96B8	dd	0x006F9641
l006F96BC	dd	0x006F9566
l006F96C0	dd	0x006F958E
l006F96C4	dd	0x006F958E
l006F96C8	dd	0x006F95A2
l006F96CC	dd	0x006F96A1
l006F96D0	dd	0x006F96A1
l006F96D4	dd	0x006F96A1
l006F96D8	dd	0x006F95F1
006F96DC                                     CC CC CC CC             ....
006F96E0 56 8B 74 24 08 8B 46 F4 8B 4E F0 C7 46 F8 FE FF V.t$..F..N..F...
006F96F0 FF FF 89 08 8B 56 F0 8B 46 F4 89 42 04 C7 46 F0 .....V..F..B..F.
006F9700 00 00 00 00 8B 46 0C 85 C0 74 17 83 00 FF 8B 46 .....F...t.....F
006F9710 0C 83 38 00 75 0C 8B 48 04 8B 51 18 50 FF D2 83 ..8.u..H..Q.P...
006F9720 C4 04 8B 46 10 85 C0 74 27 83 00 FF 8B 46 10 83 ...F...t'....F..
006F9730 38 00 75 2D 8B 48 04 8B 51 18 50 FF D2 A1 B0 CB 8.u-.H..Q.P.....
006F9740 A6 00 83 C4 04 89 46 0C 89 35 B0 CB A6 00 5E C3 ......F..5....^.
006F9750 8B 0D B0 CB A6 00 89 4E 0C 89 35 B0 CB A6 00 5E .......N..5....^
006F9760 C3 8B 15 B0 CB A6 00 89 56 0C 89 35 B0 CB A6 00 ........V..5....
006F9770 5E C3 CC CC CC CC CC CC CC CC CC CC CC CC CC CC ^...............
006F9780 8B 44 24 04 8B 48 08 8B 41 0C 85 C0 74 0A 50 E8 .D$..H..A...t.P.
006F9790 2C 33 FF FF 83 C4 04 C3 83 05 B8 63 A1 00 01 B8 ,3.........c....
006F97A0 B8 63 A1 00 C3 CC CC CC CC CC CC CC CC CC CC CC .c..............
006F97B0 8B 44 24 04 8B 48 08 8B 11 52 E8 01 33 FF FF 83 .D$..H...R..3...
006F97C0 C4 04 C3 CC CC CC CC CC CC CC CC CC CC CC CC CC ................
006F97D0 E8 FB DD 00 00 85 C0 74 16 A1 E0 75 A1 00 68 DC .......t...u..h.
006F97E0 60 8D 00 50 E8 97 77 FE FF 83 C4 08 33 C0 C3 8B `..P..w.....3...
006F97F0 4C 24 04 8B 41 0C 85 C0 75 05 B8 B8 63 A1 00 83 L$..A...u...c...
006F9800 00 01 C3 CC CC CC CC CC CC CC CC CC CC CC CC CC ................
006F9810 8B 4C 24 04 83 79 0C 00 75 14 8B 41 08 8B 08 51 .L$..y..u..A...Q
006F9820 68 38 61 8D 00 E8 46 88 FF FF 83 C4 08 C3 8B 41 h8a...F........A
006F9830 0C 8B 50 04 8B 49 08 50 8B 42 0C 8B 11 50 52 68 ..P..I.P.B...PRh
006F9840 10 61 8D 00 E8 27 88 FF FF 83 C4 10 C3 CC CC CC .a...'..........
006F9850 8B 54 24 04 8B 42 0C 56 8B 74 24 0C 8B 4E 0C 3B .T$..B.V.t$..N.;
006F9860 C1 74 0A 1B C0 83 E0 FE 83 C0 01 5E C3 8B 42 08 .t.........^..B.
006F9870 8B 4E 08 8B 50 04 3B 51 04 75 04 33 C0 5E C3 8B .N..P.;Q.u.3.^..
006F9880 09 8B 00 8A 10 3A 11 75 27 84 D2 74 12 8A 50 01 .....:.u'..t..P.
006F9890 3A 51 01 75 1B 83 C0 02 83 C1 02 84 D2 75 E4 33 :Q.u.........u.3
006F98A0 C0 33 C9 85 C0 0F 9D C1 5E 8D 4C 09 FF 8B C1 C3 .3......^.L.....
006F98B0 1B C0 83 D8 FF 33 C9 85 C0 0F 9D C1 5E 8D 4C 09 .....3......^.L.
006F98C0 FF 8B C1 C3 CC CC CC CC CC CC CC CC CC CC CC CC ................
006F98D0 56 57 8B 7C 24 0C 8B 47 0C 85 C0 75 27 33 F6 8B VW.|$..G...u'3..
006F98E0 47 08 8B 48 04 51 E8 E5 49 FE FF 83 C4 04 83 F8 G..H.Q..I.......
006F98F0 FF 74 21 33 F0 83 FE FF 75 05 BE FE FF FF FF 5F .t!3....u......_
006F9900 8B C6 5E C3 50 E8 D6 49 FE FF 8B F0 83 C4 04 83 ..^.P..I........
006F9910 FE FF 75 CB 5F 83 C8 FF 5E C3 CC CC CC CC CC CC ..u._...^.......
006F9920 53 55 8B 6C 24 0C 33 C9 85 ED 8B D5 74 1B 8B FF SU.l$.3.....t...
006F9930 8B 02 83 38 00 74 0B 83 C0 10 83 C1 01 83 38 00 ...8.t........8.
006F9940 75 F5 8B 52 04 85 D2 75 E7 51 E8 01 8D FF FF 8B u..R...u.Q......
006F9950 D8 83 C4 04 85 DB 74 59 57 33 FF 85 ED 74 37 56 ......tYW3...t7V
006F9960 8B 75 00 8B 06 85 C0 74 25 8D A4 24 00 00 00 00 .u.....t%..$....
006F9970 50 E8 4A 31 FF FF 50 57 53 E8 92 8E FF FF 8B 46 P.J1..PWS......F
006F9980 10 83 C6 10 83 C4 10 83 C7 01 85 C0 75 E2 8B 6D ............u..m
006F9990 04 85 ED 75 CB 5E E8 25 76 FE FF 85 C0 5F 74 16 ...u.^.%v...._t.
006F99A0 83 03 FF 75 0C 8B 43 04 8B 48 18 53 FF D1 83 C4 ...u..C..H.S....
006F99B0 04 5D 33 C0 5B C3 53 E8 24 B4 FF FF 83 C4 04 5D .]3.[.S.$......]
006F99C0 8B C3 5B C3 CC CC CC CC CC CC CC CC CC CC CC CC ..[.............
006F99D0 53 55 8B 6C 24 14 8A 5D 00 80 FB 5F 56 57 75 57 SU.l$..]..._VWuW
006F99E0 38 5D 01 75 52 BF F8 BA 8A 00 8B F5 B9 0C 00 00 8].uR...........
006F99F0 00 33 C0 F3 A6 75 12 8B 4C 24 14 51 E8 1F FF FF .3...u..L$.Q....
006F9A00 FF 83 C4 04 5F 5E 5D 5B C3 BF 58 0D 8D 00 8B F5 ...._^][..X.....
006F9A10 B9 08 00 00 00 33 D2 F3 A6 75 1C 8B 44 24 18 8B .....3...u..D$..
006F9A20 48 04 8B 41 58 85 C0 74 0E 50 E8 91 30 FF FF 83 H..AX..t.P..0...
006F9A30 C4 04 5F 5E 5D 5B C3 8B 74 24 14 85 F6 74 4D 90 .._^][..t$...tM.
006F9A40 8B 3E 8B 07 85 C0 74 3D 3A 18 75 2F 8D 48 01 8D .>....t=:.u/.H..
006F9A50 45 01 8A 10 3A 11 75 1A 84 D2 74 12 8A 50 01 3A E...:.u...t..P.:
006F9A60 51 01 75 0E 83 C0 02 83 C1 02 84 D2 75 E4 33 C0 Q.u.........u.3.
006F9A70 EB 05 1B C0 83 D8 FF 85 C0 74 27 8B 47 10 83 C7 .........t'.G...
006F9A80 10 85 C0 75 C3 8B 76 04 85 F6 75 B4 A1 F0 78 A1 ...u..v...u...x.
006F9A90 00 55 50 E8 E8 74 FE FF 83 C4 08 5F 5E 5D 33 C0 .UP..t....._^]3.
006F9AA0 5B C3 8B 35 B0 CB A6 00 85 F6 74 18 8B 56 0C 89 [..5......t..V..
006F9AB0 15 B0 CB A6 00 C7 46 04 98 C6 A1 00 C7 06 01 00 ......F.........
006F9AC0 00 00 EB 13 68 98 C6 A1 00 E8 62 54 00 00 8B F0 ....h.....bT....
006F9AD0 83 C4 04 85 F6 74 C4 8B 44 24 18 85 C0 89 7E 08 .....t..D$....~.
006F9AE0 74 03 83 00 01 8D 7E F0 89 46 0C C7 46 10 00 00 t.....~..F..F...
006F9AF0 00 00 83 7F 08 FE 74 0D 68 04 0E 8D 00 E8 EE EB ......t.h.......
006F9B00 FE FF 83 C4 04 C7 47 08 FD FF FF FF A1 58 D5 A1 ......G......X..
006F9B10 00 89 07 8B 0D 58 D5 A1 00 8B 41 04 89 47 04 89 .....X....A..G..
006F9B20 38 8B 15 58 D5 A1 00 89 7A 04 5F 8B C6 5E 5D 5B 8..X....z._..^][
006F9B30 C3 CC CC CC CC CC CC CC CC CC CC CC CC CC CC CC ................
006F9B40 83 EC 08 8B 4C 24 14 8B 44 24 0C 8B 54 24 10 51 ....L$..D$..T$.Q
006F9B50 89 44 24 04 52 8D 44 24 08 50 C7 44 24 10 00 00 .D$.R.D$.P.D$...
006F9B60 00 00 E8 69 FE FF FF 83 C4 14 C3 CC CC CC CC CC ...i............

;; fn006F9B70: 006F9B70
;;   Called from:
;;     006E8994 (in fn006E8910)
fn006F9B70 proc
	mov	eax,[0A6CBB0h]
	test	eax,eax
	jz	6F9B9Bh

l006F9B79:
	lea	esp,[esp+0h]

l006F9B80:
	mov	ecx,[eax+0Ch]
	push	eax
	mov	[0A6CBB0h],ecx
	call	6FEFD0h
	mov	eax,[0A6CBB0h]
	add	esp,4h
	test	eax,eax
	jnz	6F9B80h

l006F9B9B:
	ret
006F9B9C                                     CC CC CC CC             ....
006F9BA0 8B 4C 24 04 33 C0 85 C9 74 10 8D 9B 00 00 00 00 .L$.3...t.......
006F9BB0 8B 49 18 83 C0 01 85 C9 75 F6 C3 CC CC CC CC CC .I......u.......
006F9BC0 56 68 58 C7 A1 00 E8 65 53 00 00 8B F0 83 C4 04 VhX....eS.......
006F9BD0 85 F6 74 23 85 FF 8B 44 24 08 C7 46 10 FF FF FF ..t#...D$..F....
006F9BE0 FF 89 46 08 74 03 83 07 01 56 89 7E 0C E8 3E 52 ..F.t....V.~..>R
006F9BF0 00 00 83 C4 04 8B C6 5E C3 CC CC CC CC CC CC CC .......^........

;; fn006F9C00: 006F9C00
;;   Called from:
;;     006F9C80 (in fn006F9C70)
fn006F9C00 proc
	mov	eax,[esi+8h]
	cmp	eax,0A163B8h
	mov	edx,[esi+0Ch]
	jz	6F9C4Dh

l006F9C0D:
	mov	ecx,[eax+4h]
	mov	ecx,[ecx+68h]
	add	ecx,eax
	cmp	[ecx],esi
	jnz	6F9C1Eh

l006F9C19:
	mov	eax,[esi+18h]
	mov	[ecx],eax

l006F9C1E:
	mov	eax,[esi+14h]
	test	eax,eax
	mov	dword ptr [esi+8h],0A163B8h
	jz	6F9C32h

l006F9C2C:
	mov	ecx,[esi+18h]
	mov	[eax+18h],ecx

l006F9C32:
	mov	eax,[esi+18h]
	test	eax,eax
	jz	6F9C3Fh

l006F9C39:
	mov	ecx,[esi+14h]
	mov	[eax+14h],ecx

l006F9C3F:
	mov	dword ptr [esi+14h],0h
	mov	dword ptr [esi+18h],0h

l006F9C4D:
	test	edx,edx
	jz	6F9C69h

l006F9C51:
	add	dword ptr [edx],0FFh
	jnz	6F9C62h

l006F9C56:
	mov	eax,[edx+4h]
	mov	ecx,[eax+18h]
	push	edx
	call	ecx
	add	esp,4h

l006F9C62:
	mov	dword ptr [esi+0Ch],0h

l006F9C69:
	ret
006F9C6A                               CC CC CC CC CC CC           ......

;; fn006F9C70: 006F9C70
;;   Called from:
;;     006FE1B1 (in fn006FE160)
fn006F9C70 proc
	push	esi
	mov	esi,[esp+8h]
	push	edi
	mov	edi,[esi+0Ch]
	mov	dword ptr [esi+0Ch],0h
	call	6F9C00h
	mov	[esi+0Ch],edi
	pop	edi
	pop	esi
	ret
006F9C8B                                  CC CC CC CC CC            .....
006F9C90 56 8B 74 24 08 56 E8 E5 51 00 00 E8 60 FF FF FF V.t$.V..Q...`...
006F9CA0 8B 46 04 8B 88 A0 00 00 00 56 FF D1 83 C4 08 5E .F.......V.....^
006F9CB0 C3 CC CC CC CC CC CC CC CC CC CC CC CC CC CC CC ................
006F9CC0 8B 44 24 04 8B 40 0C 85 C0 74 11 8B 4C 24 0C 51 .D$..@...t..L$.Q
006F9CD0 50 FF 54 24 10 83 C4 08 85 C0 75 02 33 C0 C3 CC P.T$......u.3...
006F9CE0 56 8B 74 24 08 E8 16 FF FF FF 33 C0 5E C3 CC CC V.t$......3.^...
006F9CF0 8B 44 24 0C 8B 4C 24 08 68 B4 CB A6 00 68 78 61 .D$..L$.h....hxa
006F9D00 8D 00 50 51 E8 F7 DD FE FF 83 C4 10 85 C0 74 0B ..PQ..........t.
006F9D10 8B 54 24 04 8B 42 08 83 00 01 C3 33 C0 C3 CC CC .T$..B.....3....
006F9D20 56 8B 74 24 08 8B 46 10 83 F8 FF 75 2E 8B 46 08 V.t$..F....u..F.
006F9D30 3D B8 63 A1 00 75 18 A1 7C 6B A1 00 68 84 61 8D =.c..u..|k..h.a.
006F9D40 00 50 E8 39 72 FE FF 83 C4 08 83 C8 FF 5E C3 50 .P.9r........^.P
006F9D50 E8 8B 45 FE FF 83 C4 04 89 46 10 5E C3 CC CC CC ..E......F.^....
006F9D60 81 EC 04 01 00 00 A1 88 41 A1 00 33 C4 89 84 24 ........A..3...$
006F9D70 00 01 00 00 53 8B 9C 24 0C 01 00 00 8B 43 08 3D ....S..$.....C.=
006F9D80 B8 63 A1 00 75 1D 53 68 EC 61 8D 00 8D 44 24 0C .c..u.Sh.a...D$.
006F9D90 68 00 01 00 00 50 E8 45 B2 02 00 83 C4 10 E9 83 h....P.E........
006F9DA0 00 00 00 56 57 68 18 A8 8C 00 50 33 FF E8 AE 59 ...VWh....P3...Y
006F9DB0 FE FF 8B F0 83 C4 08 85 F6 75 07 E8 A0 73 FE FF .........u...s..
006F9DC0 EB 28 8B 46 04 3D 50 B4 A1 00 74 12 68 50 B4 A1 .(.F.=P...t.hP..
006F9DD0 00 50 E8 99 B8 FD FF 83 C4 08 85 C0 74 0C 8D 7E .P..........t..~
006F9DE0 14 85 FF B9 C4 61 8D 00 75 05 B9 A0 61 8D 00 8B .....a..u...a...
006F9DF0 43 08 8B 50 04 57 50 8B 42 0C 50 53 51 8D 4C 24 C..P.WP.B.PSQ.L$
006F9E00 20 68 00 01 00 00 51 E8 D4 B1 02 00 83 C4 1C 85  h....Q.........
006F9E10 F6 74 11 83 06 FF 75 0C 8B 56 04 8B 42 18 56 FF .t....u..V..B.V.
006F9E20 D0 83 C4 04 5F 5E 8D 4C 24 04 51 E8 90 2C FF FF ...._^.L$.Q..,..
006F9E30 8B 8C 24 08 01 00 00 83 C4 04 5B 33 CC E8 4C AD ..$.......[3..L.
006F9E40 F9 FF 81 C4 04 01 00 00 C3 CC CC CC CC CC CC CC ................
006F9E50 83 7C 24 0C 02 56 75 4E 8B 54 24 08 8B 42 04 8B .|$..VuN.T$..B..
006F9E60 74 24 0C 3B 46 04 75 3E 8B 4A 08 81 F9 B8 63 A1 t$.;F.u>.J....c.
006F9E70 00 74 20 8B 46 08 3D B8 63 A1 00 74 16 5E C7 44 .t .F.=.c..t.^.D
006F9E80 24 0C 02 00 00 00 89 44 24 08 89 4C 24 04 E9 2D $......D$..L$..-
006F9E90 56 FE FF 3B D6 B8 E4 91 A1 00 74 05 B8 D8 91 A1 V..;......t.....
006F9EA0 00 83 00 01 5E C3 83 05 80 64 A1 00 01 B8 80 64 ....^....d.....d
006F9EB0 A1 00 5E C3 CC CC CC CC CC CC CC CC CC CC CC CC ..^.............
006F9EC0 85 C0 C7 01 00 00 00 00 C7 02 00 00 00 00 74 33 ..............t3
006F9ED0 83 78 0C 00 75 2D 81 78 04 58 C7 A1 00 75 05 89 .x..u-.x.X...u..
006F9EE0 01 8B 40 18 85 C0 74 1B 83 78 0C 00 75 15 8B 48 ..@...t..x..u..H
006F9EF0 04 81 F9 E8 C8 A1 00 74 08 81 F9 A8 C9 A1 00 75 .......t.......u
006F9F00 02 89 02 C3 CC CC CC CC CC CC CC CC CC CC CC CC ................
006F9F10 89 41 14 8B 50 18 89 51 18 8B 50 18 85 D2 74 03 .A..P..Q..P...t.
006F9F20 89 4A 14 89 48 18 C3 CC CC CC CC CC CC CC CC CC .J..H...........
006F9F30 8B 0A 85 C9 C7 40 14 00 00 00 00 89 48 18 74 03 .....@......H.t.
006F9F40 89 41 14 89 02 C3 CC CC CC CC CC CC CC CC CC CC .A..............
006F9F50 83 EC 10 8B 54 24 18 53 56 57 8D 44 24 0C 50 8D ....T$.SVW.D$.P.
006F9F60 4C 24 18 51 6A 02 6A 01 68 00 0C 8D 00 33 F6 52 L$.Qj.j.h....3.R
006F9F70 89 74 24 24 E8 57 BB FE FF 83 C4 18 85 C0 0F 84 .t$$.W..........
006F9F80 CA 00 00 00 8B 44 24 14 8B 48 04 F6 41 54 40 0F .....D$..H..AT@.
006F9F90 84 D2 00 00 00 39 71 68 0F 8E C9 00 00 00 81 7C .....9qh.......|
006F9FA0 24 0C B8 63 A1 00 75 04 89 74 24 0C 8B 48 04 8B $..c..u..t$..H..
006F9FB0 79 68 03 F8 8B 07 8D 54 24 18 8D 4C 24 10 E8 FD yh.....T$..L$...
006F9FC0 FE FF FF 39 74 24 0C 8B 5C 24 20 75 1A 81 FB 58 ...9t$..\$ u...X
006F9FD0 C7 A1 00 75 12 8B 44 24 10 85 C0 74 0A 83 00 01 ...u..D$...t....
006F9FE0 5F 5E 5B 83 C4 10 C3 8B 93 98 00 00 00 6A 00 53 _^[..........j.S
006F9FF0 FF D2 8B F0 83 C4 08 85 F6 74 53 8B 44 24 0C 85 .........tS.D$..
006FA000 C0 8B 4C 24 14 C7 46 10 FF FF FF FF 89 4E 08 74 ..L$..F......N.t
006FA010 03 83 00 01 89 46 0C 83 7C 24 0C 00 75 08 81 FB .....F..|$..u...
006FA020 58 C7 A1 00 74 1F 8B 07 8D 54 24 18 8D 4C 24 10 X...t....T$..L$.
006FA030 E8 8B FE FF FF 8B 44 24 18 85 C0 75 1A 8B 44 24 ......D$...u..D$
006FA040 10 85 C0 75 12 8B D7 8B C6 E8 E2 FE FF FF 5F 8B ...u.........._.
006FA050 C6 5E 5B 83 C4 10 C3 8B CE E8 B2 FE FF FF 5F 8B .^[..........._.
006FA060 C6 5E 5B 83 C4 10 C3 8B 41 0C 8B 0D 7C 6B A1 00 .^[.....A...|k..
006FA070 50 68 04 62 8D 00 51 E8 54 75 FE FF 83 C4 0C 5F Ph.b..Q.Tu....._
006FA080 5E 33 C0 5B 83 C4 10 C3 CC CC CC CC CC CC CC CC ^3.[............
006FA090 51 8B 54 24 0C 8D 04 24 50 8B C8 51 6A 02 6A 01 Q.T$...$P..Qj.j.
006FA0A0 68 3C 2D 8B 00 52 E8 25 BA FE FF F7 D8 1B C0 83 h<-..R.%........
006FA0B0 C0 01 83 C4 1C C3 CC CC CC CC CC CC CC CC CC CC ................
006FA0C0 8B 54 24 04 8B 42 04 3D E8 C8 A1 00 74 07 3D A8 .T$..B.=....t.=.
006FA0D0 C9 A1 00 75 22 8B 42 08 3D B8 63 A1 00 75 16 A1 ...u".B.=.c..u..
006FA0E0 24 87 A1 00 68 30 62 8D 00 50 E8 91 6E FE FF 83 $...h0b..P..n...
006FA0F0 C4 08 33 C0 C3 8B D0 8B 44 24 08 8B 48 04 81 F9 ..3.....D$..H...
006FA100 E8 C8 A1 00 74 08 81 F9 A8 C9 A1 00 75 21 8B 40 ....t.......u!.@
006FA110 08 3D B8 63 A1 00 75 17 8B 0D 24 87 A1 00 68 30 .=.c..u...$...h0
006FA120 62 8D 00 51 E8 57 6E FE FF 83 C4 08 33 C0 C3 89 b..Q.Wn.....3...
006FA130 44 24 08 89 54 24 04 E9 F4 41 FE FF CC CC CC CC D$..T$...A......
006FA140 8B 44 24 04 8B 48 04 81 F9 E8 C8 A1 00 74 08 81 .D$..H.......t..
006FA150 F9 A8 C9 A1 00 75 20 8B 40 08 3D B8 63 A1 00 75 .....u .@.=.c..u
006FA160 16 A1 24 87 A1 00 68 30 62 8D 00 50 E8 0F 6E FE ..$...h0b..P..n.
006FA170 FF 83 C4 08 33 C0 C3 89 44 24 04 E9 F0 3D FE FF ....3...D$...=..
006FA180 56 8B 74 24 08 8B 46 04 3D E8 C8 A1 00 74 07 3D V.t$..F.=....t.=
006FA190 A8 C9 A1 00 75 23 8B 46 08 3D B8 63 A1 00 75 17 ....u#.F.=.c..u.
006FA1A0 A1 24 87 A1 00 68 30 62 8D 00 50 E8 D0 6D FE FF .$...h0b..P..m..
006FA1B0 83 C4 08 33 C0 5E C3 8B F0 8B 54 24 0C 8B 42 04 ...3.^....T$..B.
006FA1C0 3D E8 C8 A1 00 74 07 3D A8 C9 A1 00 75 24 8B 42 =....t.=....u$.B
006FA1D0 08 3D B8 63 A1 00 75 18 8B 0D 24 87 A1 00 68 30 .=.c..u...$...h0
006FA1E0 62 8D 00 51 E8 97 6D FE FF 83 C4 08 33 C0 5E C3 b..Q..m.....3.^.
006FA1F0 8B D0 8B 44 24 10 85 C0 74 35 8B 48 04 81 F9 E8 ...D$...t5.H....
006FA200 C8 A1 00 74 08 81 F9 A8 C9 A1 00 75 22 8B 40 08 ...t.......u".@.
006FA210 3D B8 63 A1 00 75 18 8B 15 24 87 A1 00 68 30 62 =.c..u...$...h0b
006FA220 8D 00 52 E8 58 6D FE FF 83 C4 08 33 C0 5E C3 50 ..R.Xm.....3.^.P
006FA230 52 56 E8 49 D4 00 00 83 C4 0C 5E C3 CC CC CC CC RV.I......^.....
006FA240 81 EC A4 00 00 00 A1 88 41 A1 00 33 C4 89 84 24 ........A..3...$
006FA250 A0 00 00 00 8B 84 24 A8 00 00 00 8B 48 08 51 8B ......$.....H.Q.
006FA260 49 04 8B 51 0C 52 50 68 5C 62 8D 00 8D 44 24 10 I..Q.RPh\b...D$.
006FA270 68 A0 00 00 00 50 E8 65 AD 02 00 8D 4C 24 18 51 h....P.e....L$.Q
006FA280 E8 3B 28 FF FF 8B 8C 24 BC 00 00 00 83 C4 1C 33 .;(....$.......3
006FA290 CC E8 F8 A8 F9 FF 81 C4 A4 00 00 00 C3 CC CC CC ................
006FA2A0 8B 44 24 04 8B 40 08 3D B8 63 A1 00 75 18 8B 0D .D$..@.=.c..u...
006FA2B0 24 87 A1 00 68 30 62 8D 00 51 E8 C1 6C FE FF 83 $...h0b..Q..l...
006FA2C0 C4 08 83 C8 FF C3 89 44 24 04 E9 61 41 FE FF CC .......D$..aA...
006FA2D0 8B 54 24 04 8B 42 04 3D E8 C8 A1 00 74 07 3D A8 .T$..B.=....t.=.
006FA2E0 C9 A1 00 75 23 8B 42 08 3D B8 63 A1 00 75 17 A1 ...u#.B.=.c..u..
006FA2F0 24 87 A1 00 68 30 62 8D 00 50 E8 81 6C FE FF 83 $...h0b..P..l...
006FA300 C4 08 83 C8 FF C3 8B D0 8B 44 24 08 8B 48 04 81 .........D$..H..
006FA310 F9 E8 C8 A1 00 74 08 81 F9 A8 C9 A1 00 75 22 8B .....t.......u".
006FA320 40 08 3D B8 63 A1 00 75 18 8B 0D 24 87 A1 00 68 @.=.c..u...$...h
006FA330 30 62 8D 00 51 E8 46 6C FE FF 83 C4 08 83 C8 FF 0b..Q.Fl........
006FA340 C3 89 44 24 08 89 54 24 04 E9 82 50 FE FF CC CC ..D$..T$...P....
006FA350 8B 54 24 04 8B 42 04 3D E8 C8 A1 00 74 07 3D A8 .T$..B.=....t.=.
006FA360 C9 A1 00 75 22 8B 42 08 3D B8 63 A1 00 75 16 A1 ...u".B.=.c..u..
006FA370 24 87 A1 00 68 30 62 8D 00 50 E8 01 6C FE FF 83 $...h0b..P..l...
006FA380 C4 08 33 C0 C3 8B D0 8B 44 24 08 8B 48 04 81 F9 ..3.....D$..H...
006FA390 E8 C8 A1 00 74 08 81 F9 A8 C9 A1 00 75 21 8B 40 ....t.......u!.@
006FA3A0 08 3D B8 63 A1 00 75 17 8B 0D 24 87 A1 00 68 30 .=.c..u...$...h0
006FA3B0 62 8D 00 51 E8 C7 6B FE FF 83 C4 08 33 C0 C3 89 b..Q..k.....3...
006FA3C0 44 24 08 89 54 24 04 E9 04 80 00 00 CC CC CC CC D$..T$..........
006FA3D0 8B 54 24 04 8B 42 04 3D E8 C8 A1 00 74 07 3D A8 .T$..B.=....t.=.
006FA3E0 C9 A1 00 75 22 8B 42 08 3D B8 63 A1 00 75 16 A1 ...u".B.=.c..u..
006FA3F0 24 87 A1 00 68 30 62 8D 00 50 E8 81 6B FE FF 83 $...h0b..P..k...
006FA400 C4 08 33 C0 C3 8B D0 8B 44 24 08 8B 48 04 81 F9 ..3.....D$..H...
006FA410 E8 C8 A1 00 74 08 81 F9 A8 C9 A1 00 75 21 8B 40 ....t.......u!.@
006FA420 08 3D B8 63 A1 00 75 17 8B 0D 24 87 A1 00 68 30 .=.c..u...$...h0
006FA430 62 8D 00 51 E8 47 6B FE FF 83 C4 08 33 C0 C3 89 b..Q.Gk.....3...
006FA440 44 24 08 89 54 24 04 E9 64 7E 00 00 CC CC CC CC D$..T$..d~......
006FA450 8B 54 24 04 8B 42 04 3D E8 C8 A1 00 74 07 3D A8 .T$..B.=....t.=.
006FA460 C9 A1 00 75 22 8B 42 08 3D B8 63 A1 00 75 16 A1 ...u".B.=.c..u..
006FA470 24 87 A1 00 68 30 62 8D 00 50 E8 01 6B FE FF 83 $...h0b..P..k...
006FA480 C4 08 33 C0 C3 8B D0 8B 44 24 08 8B 48 04 81 F9 ..3.....D$..H...
006FA490 E8 C8 A1 00 74 08 81 F9 A8 C9 A1 00 75 21 8B 40 ....t.......u!.@
006FA4A0 08 3D B8 63 A1 00 75 17 8B 0D 24 87 A1 00 68 30 .=.c..u...$...h0
006FA4B0 62 8D 00 51 E8 C7 6A FE FF 83 C4 08 33 C0 C3 89 b..Q..j.....3...
006FA4C0 44 24 08 89 54 24 04 E9 94 A0 00 00 CC CC CC CC D$..T$..........
006FA4D0 8B 54 24 04 8B 42 04 3D E8 C8 A1 00 74 07 3D A8 .T$..B.=....t.=.
006FA4E0 C9 A1 00 75 22 8B 42 08 3D B8 63 A1 00 75 16 A1 ...u".B.=.c..u..
006FA4F0 24 87 A1 00 68 30 62 8D 00 50 E8 81 6A FE FF 83 $...h0b..P..j...
006FA500 C4 08 33 C0 C3 8B D0 8B 44 24 08 8B 48 04 81 F9 ..3.....D$..H...
006FA510 E8 C8 A1 00 74 08 81 F9 A8 C9 A1 00 75 21 8B 40 ....t.......u!.@
006FA520 08 3D B8 63 A1 00 75 17 8B 0D 24 87 A1 00 68 30 .=.c..u...$...h0
006FA530 62 8D 00 51 E8 47 6A FE FF 83 C4 08 33 C0 C3 89 b..Q.Gj.....3...
006FA540 44 24 08 89 54 24 04 E9 C4 7D 00 00 CC CC CC CC D$..T$...}......
006FA550 8B 54 24 04 8B 42 04 3D E8 C8 A1 00 74 07 3D A8 .T$..B.=....t.=.
006FA560 C9 A1 00 75 22 8B 42 08 3D B8 63 A1 00 75 16 A1 ...u".B.=.c..u..
006FA570 24 87 A1 00 68 30 62 8D 00 50 E8 01 6A FE FF 83 $...h0b..P..j...
006FA580 C4 08 33 C0 C3 8B D0 8B 44 24 08 8B 48 04 81 F9 ..3.....D$..H...
006FA590 E8 C8 A1 00 74 08 81 F9 A8 C9 A1 00 75 21 8B 40 ....t.......u!.@
006FA5A0 08 3D B8 63 A1 00 75 17 8B 0D 24 87 A1 00 68 30 .=.c..u...$...h0
006FA5B0 62 8D 00 51 E8 C7 69 FE FF 83 C4 08 33 C0 C3 89 b..Q..i.....3...
006FA5C0 44 24 08 89 54 24 04 E9 44 7F 00 00 CC CC CC CC D$..T$..D.......
006FA5D0 8B 54 24 04 8B 42 04 3D E8 C8 A1 00 74 07 3D A8 .T$..B.=....t.=.
006FA5E0 C9 A1 00 75 22 8B 42 08 3D B8 63 A1 00 75 16 A1 ...u".B.=.c..u..
006FA5F0 24 87 A1 00 68 30 62 8D 00 50 E8 81 69 FE FF 83 $...h0b..P..i...
006FA600 C4 08 33 C0 C3 8B D0 8B 44 24 08 8B 48 04 81 F9 ..3.....D$..H...
006FA610 E8 C8 A1 00 74 08 81 F9 A8 C9 A1 00 75 21 8B 40 ....t.......u!.@
006FA620 08 3D B8 63 A1 00 75 17 8B 0D 24 87 A1 00 68 30 .=.c..u...$...h0
006FA630 62 8D 00 51 E8 47 69 FE FF 83 C4 08 33 C0 C3 89 b..Q.Gi.....3...
006FA640 44 24 08 89 54 24 04 E9 24 7D 00 00 CC CC CC CC D$..T$..$}......
006FA650 56 8B 74 24 08 8B 46 04 3D E8 C8 A1 00 74 07 3D V.t$..F.=....t.=
006FA660 A8 C9 A1 00 75 23 8B 46 08 3D B8 63 A1 00 75 17 ....u#.F.=.c..u.
006FA670 A1 24 87 A1 00 68 30 62 8D 00 50 E8 00 69 FE FF .$...h0b..P..i..
006FA680 83 C4 08 33 C0 5E C3 8B F0 8B 54 24 0C 8B 42 04 ...3.^....T$..B.
006FA690 3D E8 C8 A1 00 74 07 3D A8 C9 A1 00 75 24 8B 42 =....t.=....u$.B
006FA6A0 08 3D B8 63 A1 00 75 18 8B 0D 24 87 A1 00 68 30 .=.c..u...$...h0
006FA6B0 62 8D 00 51 E8 C7 68 FE FF 83 C4 08 33 C0 5E C3 b..Q..h.....3.^.
006FA6C0 8B D0 8B 44 24 10 85 C0 74 35 8B 48 04 81 F9 E8 ...D$...t5.H....
006FA6D0 C8 A1 00 74 08 81 F9 A8 C9 A1 00 75 22 8B 40 08 ...t.......u".@.
006FA6E0 3D B8 63 A1 00 75 18 8B 15 24 87 A1 00 68 30 62 =.c..u...$...h0b
006FA6F0 8D 00 52 E8 88 68 FE FF 83 C4 08 33 C0 5E C3 50 ..R..h.....3.^.P
006FA700 52 56 E8 69 7E 00 00 83 C4 0C 5E C3 CC CC CC CC RV.i~.....^.....
006FA710 8B 44 24 04 8B 48 04 81 F9 E8 C8 A1 00 74 08 81 .D$..H.......t..
006FA720 F9 A8 C9 A1 00 75 20 8B 40 08 3D B8 63 A1 00 75 .....u .@.=.c..u
006FA730 16 A1 24 87 A1 00 68 30 62 8D 00 50 E8 3F 68 FE ..$...h0b..P.?h.
006FA740 FF 83 C4 08 33 C0 C3 89 44 24 04 E9 C0 81 00 00 ....3...D$......
006FA750 8B 44 24 04 8B 48 04 81 F9 E8 C8 A1 00 74 08 81 .D$..H.......t..
006FA760 F9 A8 C9 A1 00 75 20 8B 40 08 3D B8 63 A1 00 75 .....u .@.=.c..u
006FA770 16 A1 24 87 A1 00 68 30 62 8D 00 50 E8 FF 67 FE ..$...h0b..P..g.
006FA780 FF 83 C4 08 33 C0 C3 89 44 24 04 E9 E0 81 00 00 ....3...D$......
006FA790 8B 44 24 04 8B 48 04 81 F9 E8 C8 A1 00 74 08 81 .D$..H.......t..
006FA7A0 F9 A8 C9 A1 00 75 20 8B 40 08 3D B8 63 A1 00 75 .....u .@.=.c..u
006FA7B0 16 A1 24 87 A1 00 68 30 62 8D 00 50 E8 BF 67 FE ..$...h0b..P..g.
006FA7C0 FF 83 C4 08 33 C0 C3 89 44 24 04 E9 60 82 00 00 ....3...D$..`...
006FA7D0 8B 44 24 04 8B 48 04 81 F9 E8 C8 A1 00 74 08 81 .D$..H.......t..
006FA7E0 F9 A8 C9 A1 00 75 20 8B 40 08 3D B8 63 A1 00 75 .....u .@.=.c..u
006FA7F0 16 A1 24 87 A1 00 68 30 62 8D 00 50 E8 7F 67 FE ..$...h0b..P..g.
006FA800 FF 83 C4 08 33 C0 C3 89 44 24 04 E9 C0 81 00 00 ....3...D$......
006FA810 8B 54 24 04 8B 42 04 3D E8 C8 A1 00 74 07 3D A8 .T$..B.=....t.=.
006FA820 C9 A1 00 75 22 8B 42 08 3D B8 63 A1 00 75 16 A1 ...u".B.=.c..u..
006FA830 24 87 A1 00 68 30 62 8D 00 50 E8 41 67 FE FF 83 $...h0b..P.Ag...
006FA840 C4 08 33 C0 C3 8B D0 8B 44 24 08 8B 48 04 81 F9 ..3.....D$..H...
006FA850 E8 C8 A1 00 74 08 81 F9 A8 C9 A1 00 75 21 8B 40 ....t.......u!.@
006FA860 08 3D B8 63 A1 00 75 17 8B 0D 24 87 A1 00 68 30 .=.c..u...$...h0
006FA870 62 8D 00 51 E8 07 67 FE FF 83 C4 08 33 C0 C3 89 b..Q..g.....3...
006FA880 44 24 08 89 54 24 04 E9 64 79 00 00 CC CC CC CC D$..T$..dy......
006FA890 8B 54 24 04 8B 42 04 3D E8 C8 A1 00 74 07 3D A8 .T$..B.=....t.=.
006FA8A0 C9 A1 00 75 22 8B 42 08 3D B8 63 A1 00 75 16 A1 ...u".B.=.c..u..
006FA8B0 24 87 A1 00 68 30 62 8D 00 50 E8 C1 66 FE FF 83 $...h0b..P..f...
006FA8C0 C4 08 33 C0 C3 8B D0 8B 44 24 08 8B 48 04 81 F9 ..3.....D$..H...
006FA8D0 E8 C8 A1 00 74 08 81 F9 A8 C9 A1 00 75 21 8B 40 ....t.......u!.@
006FA8E0 08 3D B8 63 A1 00 75 17 8B 0D 24 87 A1 00 68 30 .=.c..u...$...h0
006FA8F0 62 8D 00 51 E8 87 66 FE FF 83 C4 08 33 C0 C3 89 b..Q..f.....3...
006FA900 44 24 08 89 54 24 04 E9 44 79 00 00 CC CC CC CC D$..T$..Dy......
006FA910 8B 54 24 04 8B 42 04 3D E8 C8 A1 00 74 07 3D A8 .T$..B.=....t.=.
006FA920 C9 A1 00 75 22 8B 42 08 3D B8 63 A1 00 75 16 A1 ...u".B.=.c..u..
006FA930 24 87 A1 00 68 30 62 8D 00 50 E8 41 66 FE FF 83 $...h0b..P.Af...
006FA940 C4 08 33 C0 C3 8B D0 8B 44 24 08 8B 48 04 81 F9 ..3.....D$..H...
006FA950 E8 C8 A1 00 74 08 81 F9 A8 C9 A1 00 75 21 8B 40 ....t.......u!.@
006FA960 08 3D B8 63 A1 00 75 17 8B 0D 24 87 A1 00 68 30 .=.c..u...$...h0
006FA970 62 8D 00 51 E8 07 66 FE FF 83 C4 08 33 C0 C3 89 b..Q..f.....3...
006FA980 44 24 08 89 54 24 04 E9 04 78 00 00 CC CC CC CC D$..T$...x......
006FA990 8B 54 24 04 8B 42 04 3D E8 C8 A1 00 74 07 3D A8 .T$..B.=....t.=.
006FA9A0 C9 A1 00 75 22 8B 42 08 3D B8 63 A1 00 75 16 A1 ...u".B.=.c..u..
006FA9B0 24 87 A1 00 68 30 62 8D 00 50 E8 C1 65 FE FF 83 $...h0b..P..e...
006FA9C0 C4 08 33 C0 C3 8B D0 8B 44 24 08 8B 48 04 81 F9 ..3.....D$..H...
006FA9D0 E8 C8 A1 00 74 08 81 F9 A8 C9 A1 00 75 21 8B 40 ....t.......u!.@
006FA9E0 08 3D B8 63 A1 00 75 17 8B 0D 24 87 A1 00 68 30 .=.c..u...$...h0
006FA9F0 62 8D 00 51 E8 87 65 FE FF 83 C4 08 33 C0 C3 89 b..Q..e.....3...
006FAA00 44 24 08 89 54 24 04 E9 24 77 00 00 CC CC CC CC D$..T$..$w......
006FAA10 8B 54 24 04 8B 42 04 3D E8 C8 A1 00 74 07 3D A8 .T$..B.=....t.=.
006FAA20 C9 A1 00 75 22 8B 42 08 3D B8 63 A1 00 75 16 A1 ...u".B.=.c..u..
006FAA30 24 87 A1 00 68 30 62 8D 00 50 E8 41 65 FE FF 83 $...h0b..P.Ae...
006FAA40 C4 08 33 C0 C3 8B D0 8B 44 24 08 8B 48 04 81 F9 ..3.....D$..H...
006FAA50 E8 C8 A1 00 74 08 81 F9 A8 C9 A1 00 75 21 8B 40 ....t.......u!.@
006FAA60 08 3D B8 63 A1 00 75 17 8B 0D 24 87 A1 00 68 30 .=.c..u...$...h0
006FAA70 62 8D 00 51 E8 07 65 FE FF 83 C4 08 33 C0 C3 89 b..Q..e.....3...
006FAA80 44 24 08 89 54 24 04 E9 44 76 00 00 CC CC CC CC D$..T$..Dv......
006FAA90 8B 44 24 04 8B 48 04 81 F9 E8 C8 A1 00 74 08 81 .D$..H.......t..
006FAAA0 F9 A8 C9 A1 00 75 20 8B 40 08 3D B8 63 A1 00 75 .....u .@.=.c..u
006FAAB0 16 A1 24 87 A1 00 68 30 62 8D 00 50 E8 BF 64 FE ..$...h0b..P..d.
006FAAC0 FF 83 C4 08 33 C0 C3 89 44 24 04 E9 00 82 00 00 ....3...D$......
006FAAD0 8B 44 24 04 8B 48 04 81 F9 E8 C8 A1 00 74 08 81 .D$..H.......t..
006FAAE0 F9 A8 C9 A1 00 75 20 8B 40 08 3D B8 63 A1 00 75 .....u .@.=.c..u
006FAAF0 16 A1 24 87 A1 00 68 30 62 8D 00 50 E8 7F 64 FE ..$...h0b..P..d.
006FAB00 FF 83 C4 08 33 C0 C3 89 44 24 04 E9 B0 83 00 00 ....3...D$......
006FAB10 8B 44 24 04 8B 48 04 81 F9 E8 C8 A1 00 74 08 81 .D$..H.......t..
006FAB20 F9 A8 C9 A1 00 75 20 8B 40 08 3D B8 63 A1 00 75 .....u .@.=.c..u
006FAB30 16 A1 24 87 A1 00 68 30 62 8D 00 50 E8 3F 64 FE ..$...h0b..P.?d.
006FAB40 FF 83 C4 08 33 C0 C3 89 44 24 04 E9 00 85 00 00 ....3...D$......
006FAB50 8B 54 24 04 8B 42 04 3D E8 C8 A1 00 74 07 3D A8 .T$..B.=....t.=.
006FAB60 C9 A1 00 75 22 8B 42 08 3D B8 63 A1 00 75 16 A1 ...u".B.=.c..u..
006FAB70 24 87 A1 00 68 30 62 8D 00 50 E8 01 64 FE FF 83 $...h0b..P..d...
006FAB80 C4 08 33 C0 C3 8B D0 8B 44 24 08 8B 48 04 81 F9 ..3.....D$..H...
006FAB90 E8 C8 A1 00 74 08 81 F9 A8 C9 A1 00 75 21 8B 40 ....t.......u!.@
006FABA0 08 3D B8 63 A1 00 75 17 8B 0D 24 87 A1 00 68 30 .=.c..u...$...h0
006FABB0 62 8D 00 51 E8 C7 63 FE FF 83 C4 08 33 C0 C3 89 b..Q..c.....3...
006FABC0 44 24 08 89 54 24 04 E9 04 7C 00 00 CC CC CC CC D$..T$...|......
006FABD0 8B 54 24 04 8B 42 04 3D E8 C8 A1 00 74 07 3D A8 .T$..B.=....t.=.
006FABE0 C9 A1 00 75 22 8B 42 08 3D B8 63 A1 00 75 16 A1 ...u".B.=.c..u..
006FABF0 24 87 A1 00 68 30 62 8D 00 50 E8 81 63 FE FF 83 $...h0b..P..c...
006FAC00 C4 08 33 C0 C3 8B D0 8B 44 24 08 8B 48 04 81 F9 ..3.....D$..H...
006FAC10 E8 C8 A1 00 74 08 81 F9 A8 C9 A1 00 75 21 8B 40 ....t.......u!.@
006FAC20 08 3D B8 63 A1 00 75 17 8B 0D 24 87 A1 00 68 30 .=.c..u...$...h0
006FAC30 62 8D 00 51 E8 47 63 FE FF 83 C4 08 33 C0 C3 89 b..Q.Gc.....3...
006FAC40 44 24 08 89 54 24 04 E9 E4 7A 00 00 CC CC CC CC D$..T$...z......
006FAC50 8B 54 24 04 8B 42 04 3D E8 C8 A1 00 74 07 3D A8 .T$..B.=....t.=.
006FAC60 C9 A1 00 75 22 8B 42 08 3D B8 63 A1 00 75 16 A1 ...u".B.=.c..u..
006FAC70 24 87 A1 00 68 30 62 8D 00 50 E8 01 63 FE FF 83 $...h0b..P..c...
006FAC80 C4 08 33 C0 C3 8B D0 8B 44 24 08 8B 48 04 81 F9 ..3.....D$..H...
006FAC90 E8 C8 A1 00 74 08 81 F9 A8 C9 A1 00 75 21 8B 40 ....t.......u!.@
006FACA0 08 3D B8 63 A1 00 75 17 8B 0D 24 87 A1 00 68 30 .=.c..u...$...h0
006FACB0 62 8D 00 51 E8 C7 62 FE FF 83 C4 08 33 C0 C3 89 b..Q..b.....3...
006FACC0 44 24 08 89 54 24 04 E9 44 99 00 00 CC CC CC CC D$..T$..D.......
006FACD0 8B 54 24 04 8B 42 04 3D E8 C8 A1 00 74 07 3D A8 .T$..B.=....t.=.
006FACE0 C9 A1 00 75 22 8B 42 08 3D B8 63 A1 00 75 16 A1 ...u".B.=.c..u..
006FACF0 24 87 A1 00 68 30 62 8D 00 50 E8 81 62 FE FF 83 $...h0b..P..b...
006FAD00 C4 08 33 C0 C3 8B D0 8B 44 24 08 8B 48 04 81 F9 ..3.....D$..H...
006FAD10 E8 C8 A1 00 74 08 81 F9 A8 C9 A1 00 75 21 8B 40 ....t.......u!.@
006FAD20 08 3D B8 63 A1 00 75 17 8B 0D 24 87 A1 00 68 30 .=.c..u...$...h0
006FAD30 62 8D 00 51 E8 47 62 FE FF 83 C4 08 33 C0 C3 89 b..Q.Gb.....3...
006FAD40 44 24 08 89 54 24 04 E9 04 7A 00 00 CC CC CC CC D$..T$...z......
006FAD50 8B 54 24 04 8B 42 04 3D E8 C8 A1 00 74 07 3D A8 .T$..B.=....t.=.
006FAD60 C9 A1 00 75 22 8B 42 08 3D B8 63 A1 00 75 16 A1 ...u".B.=.c..u..
006FAD70 24 87 A1 00 68 30 62 8D 00 50 E8 01 62 FE FF 83 $...h0b..P..b...
006FAD80 C4 08 33 C0 C3 8B D0 8B 44 24 08 8B 48 04 81 F9 ..3.....D$..H...
006FAD90 E8 C8 A1 00 74 08 81 F9 A8 C9 A1 00 75 21 8B 40 ....t.......u!.@
006FADA0 08 3D B8 63 A1 00 75 17 8B 0D 24 87 A1 00 68 30 .=.c..u...$...h0
006FADB0 62 8D 00 51 E8 C7 61 FE FF 83 C4 08 33 C0 C3 89 b..Q..a.....3...
006FADC0 44 24 08 89 54 24 04 E9 D4 7A 00 00 CC CC CC CC D$..T$...z......
006FADD0 56 8B 74 24 08 8B 46 04 3D E8 C8 A1 00 74 07 3D V.t$..F.=....t.=
006FADE0 A8 C9 A1 00 75 23 8B 46 08 3D B8 63 A1 00 75 17 ....u#.F.=.c..u.
006FADF0 A1 24 87 A1 00 68 30 62 8D 00 50 E8 80 61 FE FF .$...h0b..P..a..
006FAE00 83 C4 08 33 C0 5E C3 8B F0 8B 54 24 0C 8B 42 04 ...3.^....T$..B.
006FAE10 3D E8 C8 A1 00 74 07 3D A8 C9 A1 00 75 24 8B 42 =....t.=....u$.B
006FAE20 08 3D B8 63 A1 00 75 18 8B 0D 24 87 A1 00 68 30 .=.c..u...$...h0
006FAE30 62 8D 00 51 E8 47 61 FE FF 83 C4 08 33 C0 5E C3 b..Q.Ga.....3.^.
006FAE40 8B D0 8B 44 24 10 85 C0 74 35 8B 48 04 81 F9 E8 ...D$...t5.H....
006FAE50 C8 A1 00 74 08 81 F9 A8 C9 A1 00 75 22 8B 40 08 ...t.......u".@.
006FAE60 3D B8 63 A1 00 75 18 8B 15 24 87 A1 00 68 30 62 =.c..u...$...h0b
006FAE70 8D 00 52 E8 08 61 FE FF 83 C4 08 33 C0 5E C3 50 ..R..a.....3.^.P
006FAE80 52 56 E8 39 7A 00 00 83 C4 0C 5E C3 CC CC CC CC RV.9z.....^.....
006FAE90 8B 54 24 04 8B 42 04 3D E8 C8 A1 00 74 07 3D A8 .T$..B.=....t.=.
006FAEA0 C9 A1 00 75 22 8B 42 08 3D B8 63 A1 00 75 16 A1 ...u".B.=.c..u..
006FAEB0 24 87 A1 00 68 30 62 8D 00 50 E8 C1 60 FE FF 83 $...h0b..P..`...
006FAEC0 C4 08 33 C0 C3 8B D0 8B 44 24 08 8B 48 04 81 F9 ..3.....D$..H...
006FAED0 E8 C8 A1 00 74 08 81 F9 A8 C9 A1 00 75 21 8B 40 ....t.......u!.@
006FAEE0 08 3D B8 63 A1 00 75 17 8B 0D 24 87 A1 00 68 30 .=.c..u...$...h0
006FAEF0 62 8D 00 51 E8 87 60 FE FF 83 C4 08 33 C0 C3 89 b..Q..`.....3...
006FAF00 44 24 08 89 54 24 04 E9 E4 77 00 00 CC CC CC CC D$..T$...w......
006FAF10 8B 54 24 04 8B 42 04 3D E8 C8 A1 00 74 07 3D A8 .T$..B.=....t.=.
006FAF20 C9 A1 00 75 22 8B 42 08 3D B8 63 A1 00 75 16 A1 ...u".B.=.c..u..
006FAF30 24 87 A1 00 68 30 62 8D 00 50 E8 41 60 FE FF 83 $...h0b..P.A`...
006FAF40 C4 08 33 C0 C3 8B D0 8B 44 24 08 8B 48 04 81 F9 ..3.....D$..H...
006FAF50 E8 C8 A1 00 74 08 81 F9 A8 C9 A1 00 75 21 8B 40 ....t.......u!.@
006FAF60 08 3D B8 63 A1 00 75 17 8B 0D 24 87 A1 00 68 30 .=.c..u...$...h0
006FAF70 62 8D 00 51 E8 07 60 FE FF 83 C4 08 33 C0 C3 89 b..Q..`.....3...
006FAF80 44 24 08 89 54 24 04 E9 84 77 00 00 CC CC CC CC D$..T$...w......
006FAF90 8B 54 24 04 8B 42 04 3D E8 C8 A1 00 74 07 3D A8 .T$..B.=....t.=.
006FAFA0 C9 A1 00 75 22 8B 42 08 3D B8 63 A1 00 75 16 A1 ...u".B.=.c..u..
006FAFB0 24 87 A1 00 68 30 62 8D 00 50 E8 C1 5F FE FF 83 $...h0b..P.._...
006FAFC0 C4 08 33 C0 C3 8B D0 8B 44 24 08 8B 48 04 81 F9 ..3.....D$..H...
006FAFD0 E8 C8 A1 00 74 08 81 F9 A8 C9 A1 00 75 21 8B 40 ....t.......u!.@
006FAFE0 08 3D B8 63 A1 00 75 17 8B 0D 24 87 A1 00 68 30 .=.c..u...$...h0
006FAFF0 62 8D 00 51 E8 87 5F FE FF 83 C4 08 33 C0 C3 89 b..Q.._.....3...
006FB000 44 24 08 89 54 24 04 E9 C4 76 00 00 CC CC CC CC D$..T$...v......
006FB010 8B 54 24 04 8B 42 04 3D E8 C8 A1 00 74 07 3D A8 .T$..B.=....t.=.
006FB020 C9 A1 00 75 22 8B 42 08 3D B8 63 A1 00 75 16 A1 ...u".B.=.c..u..
006FB030 24 87 A1 00 68 30 62 8D 00 50 E8 41 5F FE FF 83 $...h0b..P.A_...
006FB040 C4 08 33 C0 C3 8B D0 8B 44 24 08 8B 48 04 81 F9 ..3.....D$..H...
006FB050 E8 C8 A1 00 74 08 81 F9 A8 C9 A1 00 75 21 8B 40 ....t.......u!.@
006FB060 08 3D B8 63 A1 00 75 17 8B 0D 24 87 A1 00 68 30 .=.c..u...$...h0
006FB070 62 8D 00 51 E8 07 5F FE FF 83 C4 08 33 C0 C3 89 b..Q.._.....3...
006FB080 44 24 08 89 54 24 04 E9 14 76 00 00 CC CC CC CC D$..T$...v......
006FB090 8B 54 24 04 8B 42 04 3D E8 C8 A1 00 74 07 3D A8 .T$..B.=....t.=.
006FB0A0 C9 A1 00 75 22 8B 42 08 3D B8 63 A1 00 75 16 A1 ...u".B.=.c..u..
006FB0B0 24 87 A1 00 68 30 62 8D 00 50 E8 C1 5E FE FF 83 $...h0b..P..^...
006FB0C0 C4 08 33 C0 C3 8B D0 8B 44 24 08 8B 48 04 81 F9 ..3.....D$..H...
006FB0D0 E8 C8 A1 00 74 08 81 F9 A8 C9 A1 00 75 21 8B 40 ....t.......u!.@
006FB0E0 08 3D B8 63 A1 00 75 17 8B 0D 24 87 A1 00 68 30 .=.c..u...$...h0
006FB0F0 62 8D 00 51 E8 87 5E FE FF 83 C4 08 33 C0 C3 89 b..Q..^.....3...
006FB100 44 24 08 89 54 24 04 E9 64 75 00 00 CC CC CC CC D$..T$..du......
006FB110 8B 44 24 04 8B 40 08 3D B8 63 A1 00 75 18 8B 0D .D$..@.=.c..u...
006FB120 24 87 A1 00 68 30 62 8D 00 51 E8 51 5E FE FF 83 $...h0b..Q.Q^...
006FB130 C4 08 83 C8 FF C3 89 44 24 04 E9 51 39 FE FF CC .......D$..Q9...
006FB140 56 8B 74 24 08 83 7E 0C 00 74 09 56 E8 2F 3D 00 V.t$..~..t.V./=.
006FB150 00 83 C4 04 E8 A7 EA FF FF 56 E8 71 3E 00 00 83 .........V.q>...
006FB160 C4 04 5E C3 CC CC CC CC CC CC CC CC CC CC CC CC ..^.............
006FB170 8B 44 24 04 8B 40 08 3D B8 63 A1 00 75 17 8B 0D .D$..@.=.c..u...
006FB180 24 87 A1 00 68 30 62 8D 00 51 E8 F1 5D FE FF 83 $...h0b..Q..]...
006FB190 C4 08 33 C0 C3 89 44 24 04 E9 72 80 00 00 CC CC ..3...D$..r.....
006FB1A0 8B 44 24 04 8B 40 08 3D B8 63 A1 00 75 18 8B 0D .D$..@.=.c..u...
006FB1B0 24 87 A1 00 68 30 62 8D 00 51 E8 C1 5D FE FF 83 $...h0b..Q..]...
006FB1C0 C4 08 83 C8 FF C3 89 44 24 04 E9 51 82 00 00 CC .......D$..Q....
006FB1D0 8B 44 24 04 8B 40 08 3D B8 63 A1 00 75 18 8B 0D .D$..@.=.c..u...
006FB1E0 24 87 A1 00 68 30 62 8D 00 51 E8 91 5D FE FF 83 $...h0b..Q..]...
006FB1F0 C4 08 83 C8 FF C3 89 44 24 04 E9 E1 9D 00 00 CC .......D$.......
006FB200 8B 44 24 04 8B 40 08 3D B8 63 A1 00 75 18 8B 0D .D$..@.=.c..u...
006FB210 24 87 A1 00 68 30 62 8D 00 51 E8 61 5D FE FF 83 $...h0b..Q.a]...
006FB220 C4 08 83 C8 FF C3 89 44 24 04 E9 51 8E 00 00 CC .......D$..Q....
006FB230 8B 54 24 04 8B 42 04 3D E8 C8 A1 00 74 07 3D A8 .T$..B.=....t.=.
006FB240 C9 A1 00 75 22 8B 42 08 3D B8 63 A1 00 75 16 A1 ...u".B.=.c..u..
006FB250 24 87 A1 00 68 30 62 8D 00 50 E8 21 5D FE FF 83 $...h0b..P.!]...
006FB260 C4 08 33 C0 C3 8B D0 8B 44 24 08 8B 48 04 81 F9 ..3.....D$..H...
006FB270 E8 C8 A1 00 74 08 81 F9 A8 C9 A1 00 75 21 8B 40 ....t.......u!.@
006FB280 08 3D B8 63 A1 00 75 17 8B 0D 24 87 A1 00 68 30 .=.c..u...$...h0
006FB290 62 8D 00 51 E8 E7 5C FE FF 83 C4 08 33 C0 C3 89 b..Q..\.....3...
006FB2A0 44 24 08 89 54 24 04 E9 74 8F 00 00 CC CC CC CC D$..T$..t.......
006FB2B0 8B 44 24 04 8B 40 08 3D B8 63 A1 00 75 18 8B 0D .D$..@.=.c..u...
006FB2C0 24 87 A1 00 68 30 62 8D 00 51 E8 B1 5C FE FF 83 $...h0b..Q..\...
006FB2D0 C4 08 83 C8 FF C3 8B 4C 24 0C 85 C9 75 0F 8B 54 .......L$...u..T
006FB2E0 24 08 52 50 E8 17 91 00 00 83 C4 08 C3 89 4C 24 $.RP..........L$
006FB2F0 0C 89 44 24 04 E9 06 90 00 00 CC CC CC CC CC CC ..D$............
006FB300 8B 44 24 04 8B 40 08 3D B8 63 A1 00 75 17 8B 0D .D$..@.=.c..u...
006FB310 24 87 A1 00 68 30 62 8D 00 51 E8 61 5C FE FF 83 $...h0b..Q.a\...
006FB320 C4 08 33 C0 C3 89 44 24 04 E9 D2 97 00 00 CC CC ..3...D$........
006FB330 8B 44 24 04 8B 40 08 3D B8 63 A1 00 75 17 8B 0D .D$..@.=.c..u...
006FB340 24 87 A1 00 68 30 62 8D 00 51 E8 31 5C FE FF 83 $...h0b..Q.1\...
006FB350 C4 08 33 C0 C3 89 44 24 04 E9 E2 8C 00 00 CC CC ..3...D$........
006FB360 51 55 8B 6C 24 0C 8B 4D 04 F6 41 54 40 0F 84 BD QU.l$..M..AT@...
006FB370 00 00 00 8B 41 68 85 C0 0F 8E B2 00 00 00 53 8D ....Ah........S.
006FB380 1C 28 8B 03 56 57 8D 54 24 10 8D 4C 24 18 E8 2D .(..VW.T$..L$..-
006FB390 EB FF FF 8B 7C 24 1C 81 FF B8 63 A1 00 75 04 33 ....|$....c..u.3
006FB3A0 FF EB 04 85 FF 75 13 8B 74 24 18 85 F6 74 0B 83 .....u..t$...t..
006FB3B0 06 01 5F 8B C6 5E 5B 5D 59 C3 55 E8 00 E8 FF FF .._..^[]Y.U.....
006FB3C0 8B F0 83 C4 04 85 F6 74 5F 8B 03 8D 54 24 10 8D .......t_...T$..
006FB3D0 4C 24 18 E8 E8 EA FF FF 85 FF 75 26 8B 7C 24 18 L$........u&.|$.
006FB3E0 85 FF 74 2E 83 06 FF 75 0C 8B 46 04 8B 48 18 56 ..t....u..F..H.V
006FB3F0 FF D1 83 C4 04 83 07 01 8B F7 5F 8B C6 5E 5B 5D .........._..^[]
006FB400 59 C3 8B 44 24 10 85 C0 75 17 8B 44 24 18 85 C0 Y..D$...u..D$...
006FB410 75 0F 8B D3 8B C6 E8 15 EB FF FF 5F 5E 5B 5D 59 u.........._^[]Y
006FB420 C3 8B CE E8 E8 EA FF FF 5F 8B C6 5E 5B 5D 59 C3 ........_..^[]Y.
006FB430 8B 51 0C A1 7C 6B A1 00 52 68 04 62 8D 00 50 E8 .Q..|k..Rh.b..P.
006FB440 8C 61 FE FF 83 C4 0C 33 C0 5D 59 C3 CC CC CC CC .a.....3.]Y.....
006FB450 51 53 8B 5C 24 0C 8B 4B 04 F6 41 54 40 0F 84 DC QS.\$..K..AT@...
006FB460 00 00 00 8B 41 68 85 C0 0F 8E D1 00 00 00 55 8D ....Ah........U.
006FB470 2C 18 8B 45 00 56 57 8D 54 24 18 8D 4C 24 10 E8 ,..E.VW.T$..L$..
006FB480 3C EA FF FF 8B 7C 24 1C 81 FF B8 63 A1 00 75 04 <....|$....c..u.
006FB490 33 FF EB 04 85 FF 75 13 8B 74 24 18 85 F6 74 0B 3.....u..t$...t.
006FB4A0 83 06 01 5F 8B C6 5E 5D 5B 59 C3 53 E8 0F E7 FF ..._..^][Y.S....
006FB4B0 FF 8B F0 83 C4 04 85 F6 74 7D 53 E8 B0 43 FE FF ........t}S..C..
006FB4C0 83 C4 04 85 C0 74 09 C7 46 04 A8 C9 A1 00 EB 07 .....t..F.......
006FB4D0 C7 46 04 E8 C8 A1 00 8B 45 00 8D 54 24 18 8D 4C .F......E..T$..L
006FB4E0 24 10 E8 D9 E9 FF FF 85 FF 75 26 8B 7C 24 18 85 $........u&.|$..
006FB4F0 FF 74 26 83 06 FF 75 0C 8B 46 04 8B 48 18 56 FF .t&...u..F..H.V.
006FB500 D1 83 C4 04 83 07 01 8B F7 5F 8B C6 5E 5D 5B 59 ........._..^][Y
006FB510 C3 8B 44 24 18 85 C0 75 17 8B 44 24 10 85 C0 75 ..D$...u..D$...u
006FB520 0F 8B D5 8B C6 E8 06 EA FF FF 5F 5E 5D 5B 59 C3 .........._^][Y.
006FB530 8B CE E8 D9 E9 FF FF 5F 8B C6 5E 5D 5B 59 C3 8B ......._..^][Y..
006FB540 51 0C A1 7C 6B A1 00 52 68 04 62 8D 00 50 E8 7D Q..|k..Rh.b..P.}
006FB550 60 FE FF 83 C4 0C 33 C0 5B 59 C3 CC CC CC CC CC `.....3.[Y......
006FB560 6A 00 50 56 E8 87 85 00 00 83 C4 0C 85 C0 75 0A j.PV..........u.
006FB570 56 E8 0A 62 FE FF 83 C4 04 C3 83 00 FF 75 0A 8B V..b.........u..
006FB580 48 04 8B 51 18 50 FF D2 59 C3 CC CC CC CC CC CC H..Q.P..Y.......
006FB590 83 EC 18 53 8B 5C 24 20 85 DB 57 0F 84 9E 01 00 ...S.\$ ..W.....
006FB5A0 00 8B 43 04 F6 40 54 40 0F 84 91 01 00 00 8B 78 ..C..@T@.......x
006FB5B0 68 85 FF 0F 8E 86 01 00 00 83 3B 00 0F 85 7D 01 h.........;...}.
006FB5C0 00 00 56 8B 34 1F 85 F6 0F 84 D4 00 00 00 83 7E ..V.4..........~
006FB5D0 0C 00 75 1B E8 27 E6 FF FF 8B 34 1F 85 F6 0F 84 ..u..'....4.....
006FB5E0 BE 00 00 00 83 7E 0C 00 75 05 E8 11 E6 FF FF 8B .....~..u.......
006FB5F0 3C 1F 85 FF 0F 84 A8 00 00 00 55 57 E8 9F E5 FF <.........UW....
006FB600 FF 8B F0 83 C4 04 89 74 24 20 E8 B1 59 FE FF 8B .......t$ ..Y...
006FB610 E8 F7 DD 1B ED F7 DD 89 6C 24 24 74 17 8D 44 24 ........l$$t..D$
006FB620 14 50 8D 4C 24 1C 51 8D 54 24 24 52 E8 FF 5A FE .P.L$.Q.T$$R..Z.
006FB630 FF 83 C4 0C 83 FE 01 75 39 8B 5F 0C 8B F7 C7 47 .......u9._....G
006FB640 0C 00 00 00 00 E8 B6 E5 FF FF 85 DB 0F 84 CA 00 ................
006FB650 00 00 8B F3 8B C7 E8 05 FF FF FF 83 03 FF 0F 85 ................
006FB660 B8 00 00 00 8B 43 04 8B 48 18 53 FF D1 E9 A7 00 .....C..H.S.....
006FB670 00 00 8D 14 36 52 E8 A5 46 FE FF 83 C4 04 85 C0 ....6R..F.......
006FB680 89 44 24 10 75 23 85 ED 74 17 8D 44 24 14 50 8D .D$.u#..t..D$.P.
006FB690 4C 24 1C 51 8D 54 24 24 52 E8 92 5A FE FF 83 C4 L$.Q.T$$R..Z....
006FB6A0 0C 5D 5E 5F 5B 83 C4 18 C3 85 F6 7E 5E 8D 58 10 .]^_[......~^.X.
006FB6B0 89 74 24 2C 8B 6F 18 83 07 01 89 7B FC 8B 47 0C .t$,.o.....{..G.
006FB6C0 89 03 8B F7 C7 47 0C 00 00 00 00 E8 30 E5 FF FF .....G......0...
006FB6D0 83 C3 08 83 6C 24 2C 01 8B FD 75 D8 8B 74 24 20 ....l$,...u..t$ 
006FB6E0 85 F6 8B 6C 24 24 8B 44 24 10 7E 1F 8D 78 0C 8B ...l$$.D$.~..x..
006FB6F0 DE 8B 77 04 85 F6 74 0B 8B 07 E8 61 FE FF FF 8B ..w...t....a....
006FB700 44 24 10 83 C7 08 83 EB 01 75 E6 83 00 FF 75 0C D$.......u....u.
006FB710 8B 48 04 8B 51 18 50 FF D2 83 C4 04 85 ED 74 81 .H..Q.P.......t.
006FB720 8B 44 24 14 8B 4C 24 18 8B 54 24 1C 50 51 52 E8 .D$..L$..T$.PQR.
006FB730 CC 56 FE FF 83 C4 0C 5D 5E 5F 5B 83 C4 18 C3 68 .V.....]^_[....h
006FB740 6F 03 00 00 68 80 62 8D 00 E8 72 66 FE FF 83 C4 o...h.b...rf....
006FB750 08 5F 5B 83 C4 18 C3 CC CC CC CC CC CC CC CC CC ._[.............

;; fn006FB760: 006FB760
;;   Called from:
;;     006FBED3 (in fn006FBE60)
fn006FB760 proc
	push	esi
	push	eax
	push	1h
	call	6DFF80h
	mov	esi,eax
	add	esp,8h
	test	esi,esi
	jz	6FB793h

l006FB772:
	mov	ecx,[0A17E28h]
	push	esi
	push	ecx
	call	6E0E90h
	add	esp,8h
	add	dword ptr [esi],0FFh
	jnz	6FB793h

l006FB787:
	mov	edx,[esi+4h]
	mov	eax,[edx+18h]
	push	esi
	call	eax
	add	esp,4h

l006FB793:
	pop	esi
	ret
006FB795                CC CC CC CC CC CC CC CC CC CC CC      ...........
006FB7A0 83 EC 10 53 55 8B 6C 24 1C 8B 5D 14 56 57 8B 7D ...SU.l$..].VW.}
006FB7B0 10 89 7C 24 1C 23 7C 24 2C 89 5C 24 10 8D 04 7F ..|$.#|$,.\$....
006FB7C0 8B 74 83 04 85 F6 8D 1C 83 0F 84 5E 01 00 00 90 .t.........^....
006FB7D0 8B 4C 24 28 3B F1 0F 84 51 01 00 00 8B 15 F8 CC .L$(;...Q.......
006FB7E0 A6 00 3B F2 75 06 89 5C 24 14 EB 68 8B 44 24 2C ..;.u..\$..h.D$,
006FB7F0 39 03 75 58 83 06 01 6A 02 51 56 E8 A0 3D FE FF 9.uX...j.QV..=..
006FB800 83 C4 0C 83 06 FF 89 44 24 18 75 10 8B 4E 04 8B .......D$.u..N..
006FB810 51 18 56 FF D2 8B 44 24 1C 83 C4 04 85 C0 0F 8C Q.V...D$........
006FB820 25 01 00 00 8B 4C 24 10 3B 4D 14 0F 85 D8 00 00 %....L$.;M......
006FB830 00 39 73 04 0F 85 CF 00 00 00 85 C0 0F 8F EB 00 .9s.............
006FB840 00 00 8B 15 F8 CC A6 00 8B 4C 24 28 C7 44 24 14 .........L$(.D$.
006FB850 00 00 00 00 8B 44 24 2C 89 44 24 18 8D 64 24 00 .....D$,.D$..d$.
006FB860 8B 44 24 18 8B 74 24 10 8D 04 B8 8D 7C 07 01 8B .D$..t$.....|...
006FB870 C7 23 44 24 1C 8D 04 40 8D 1C 86 8B 73 04 85 F6 .#D$...@....s...
006FB880 0F 84 B1 00 00 00 3B F1 0F 84 9F 00 00 00 8B 44 ......;........D
006FB890 24 2C 39 03 75 58 3B F2 74 58 83 06 01 6A 02 51 $,9.uX;.tX...j.Q
006FB8A0 56 E8 FA 3C FE FF 83 C4 0C 83 06 FF 8B E8 75 0C V..<..........u.
006FB8B0 8B 4E 04 8B 51 18 56 FF D2 83 C4 04 85 ED 0F 8C .N..Q.V.........
006FB8C0 85 00 00 00 8B 44 24 10 8B 4C 24 24 3B 41 14 75 .....D$..L$$;A.u
006FB8D0 36 39 73 04 75 31 85 ED 7F 53 8B 15 F8 CC A6 00 69s.u1...S......
006FB8E0 8B 4C 24 28 C1 6C 24 18 05 E9 72 FF FF FF 3B F2 .L$(.l$...r...;.
006FB8F0 75 0B 83 7C 24 14 00 75 04 89 5C 24 14 C1 6C 24 u..|$..u..\$..l$
006FB900 18 05 E9 59 FF FF FF 8B E9 8B 7D 10 8B 5D 14 89 ...Y......}..]..
006FB910 7C 24 1C 23 7C 24 2C 89 5C 24 10 8D 14 7F 8B 74 |$.#|$,.\$.....t
006FB920 93 04 85 F6 8D 1C 93 0F 85 A3 FE FF FF 8B C3 5F ..............._
006FB930 5E 5D 5B 83 C4 10 C3 8B 44 24 14 85 C0 75 F0 5F ^][.....D$...u._
006FB940 5E 5D 8B C3 5B 83 C4 10 C3 5F 5E 5D 33 C0 5B 83 ^]..[...._^]3.[.
006FB950 C4 10 C3 CC CC CC CC CC CC CC CC CC CC CC CC CC ................
006FB960 51 8B 44 24 08 8B 4C 24 0C 81 79 04 50 B4 A1 00 Q.D$..L$..y.P...
006FB970 55 8B 68 10 57 8B 78 14 89 7C 24 08 74 19 5F C7 U.h.W.x..|$.t._.
006FB980 40 18 A0 B7 6F 00 5D 83 C4 04 89 4C 24 08 89 44 @...o.]....L$..D
006FB990 24 04 E9 09 FE FF FF 53 8B 5C 24 1C 56 8B F5 23 $......S.\$.V..#
006FB9A0 F3 8D 04 76 8D 3C 87 8B 47 04 85 C0 0F 84 B5 00 ...v.<..G.......
006FB9B0 00 00 3B C1 0F 84 AD 00 00 00 3B 05 F8 CC A6 00 ..;.......;.....
006FB9C0 75 06 89 7C 24 18 EB 1E 39 1F 75 12 51 50 E8 4D u..|$...9.u.QP.M
006FB9D0 F6 FE FF 83 C4 08 85 C0 0F 85 89 00 00 00 C7 44 ...............D
006FB9E0 24 18 00 00 00 00 8B CB 8D 14 B1 8B 4C 24 10 8D $...........L$..
006FB9F0 74 16 01 8B C6 23 C5 8D 04 40 8D 3C 81 8B 47 04 t....#...@.<..G.
006FBA00 85 C0 74 5B 8B 4C 24 1C 3B C1 74 5B 8B 54 24 20 ..t[.L$.;.t[.T$ 
006FBA10 39 17 75 16 3B 05 F8 CC A6 00 74 19 51 50 E8 FD 9.u.;.....t.QP..
006FBA20 F5 FE FF 83 C4 08 85 C0 75 3D 8B 47 04 3B 05 F8 ........u=.G.;..
006FBA30 CC A6 00 75 0B 83 7C 24 18 00 75 04 89 7C 24 18 ...u..|$..u..|$.
006FBA40 C1 EB 05 8D 0C B3 8D 74 0E 01 8B C6 23 C5 8D 14 .......t....#...
006FBA50 40 8B 44 24 10 8D 3C 90 8B 47 04 85 C0 75 A5 8B @.D$..<..G...u..
006FBA60 44 24 18 85 C0 75 02 8B C7 5E 5B 5F 5D 59 C3 CC D$...u...^[_]Y..

;; fn006FBA70: 006FBA70
;;   Called from:
;;     006FBDF7 (in fn006FBD90)
;;     006FCED1 (in fn006FCC90)
fn006FBA70 proc
	mov	eax,[esp+4h]
	mov	ecx,[edi+18h]
	push	ebp
	mov	ebp,[esp+0Ch]
	push	esi
	push	eax
	push	ebx
	push	edi
	call	ecx
	mov	esi,eax
	add	esp,0Ch
	test	esi,esi
	jnz	6FBAB4h

l006FBA8B:
	add	dword ptr [ebx],0FFh
	jnz	6FBA9Ch

l006FBA90:
	mov	edx,[ebx+4h]
	mov	eax,[edx+18h]
	push	ebx
	call	eax
	add	esp,4h

l006FBA9C:
	add	dword ptr [ebp+0h],0FFh
	jnz	6FBAAEh

l006FBAA2:
	mov	ecx,[ebp+4h]
	mov	edx,[ecx+18h]
	push	ebp
	call	edx
	add	esp,4h

l006FBAAE:
	pop	esi
	or	eax,0FFh
	pop	ebp
	ret

l006FBAB4:
	mov	eax,[esi+8h]
	test	eax,eax
	jz	6FBAE5h

l006FBABB:
	mov	[esi+8h],ebp
	add	dword ptr [eax],0FFh
	jnz	6FBACFh

l006FBAC3:
	mov	ecx,[eax+4h]
	mov	edx,[ecx+18h]
	push	eax
	call	edx
	add	esp,4h

l006FBACF:
	add	dword ptr [ebx],0FFh
	jnz	6FBB2Ah

l006FBAD4:
	mov	eax,[ebx+4h]
	mov	ecx,[eax+18h]
	push	ebx
	call	ecx
	add	esp,4h
	pop	esi
	xor	eax,eax
	pop	ebp
	ret

l006FBAE5:
	cmp	dword ptr [esi+4h],0h
	jnz	6FBB04h

l006FBAEB:
	add	dword ptr [edi+8h],1h
	mov	ecx,[esp+0Ch]
	mov	[esi+8h],ebp
	mov	[esi+4h],ebx
	mov	[esi],ecx
	add	dword ptr [edi+0Ch],1h
	pop	esi
	xor	eax,eax
	pop	ebp
	ret

l006FBB04:
	mov	eax,[0A6CCF8h]
	add	dword ptr [eax],0FFh
	jnz	6FBB1Ah

l006FBB0E:
	mov	edx,[eax+4h]
	push	eax
	mov	eax,[edx+18h]
	call	eax
	add	esp,4h

l006FBB1A:
	mov	ecx,[esp+0Ch]
	mov	[esi+4h],ebx
	mov	[esi],ecx
	mov	[esi+8h],ebp
	add	dword ptr [edi+0Ch],1h

l006FBB2A:
	pop	esi
	xor	eax,eax
	pop	ebp
	ret
006FBB2F                                              CC                .

;; fn006FBB30: 006FBB30
;;   Called from:
;;     006FBC44 (in fn006FBB90)
fn006FBB30 proc
	push	ebx
	mov	ebx,[esi+14h]
	push	ebp
	mov	ebp,[esp+10h]
	push	edi
	mov	edi,[esi+10h]
	mov	eax,edi
	and	eax,ebp
	lea	ecx,[eax+eax*2]
	cmp	dword ptr [ebx+ecx*4+4h],0h
	lea	ecx,[ebx+ecx*4]
	mov	edx,ebp
	jz	6FBB6Ah

l006FBB50:
	lea	ecx,[edx+eax*4]
	lea	eax,[eax+ecx+1h]
	mov	ecx,eax
	and	ecx,edi
	lea	ecx,[ecx+ecx*2]
	lea	ecx,[ebx+ecx*4]
	shr	edx,5h
	cmp	dword ptr [ecx+4h],0h
	jnz	6FBB50h

l006FBB6A:
	mov	edx,[esp+10h]
	mov	eax,1h
	add	[esi+8h],eax
	mov	[ecx+4h],edx
	mov	edx,[esp+18h]
	pop	edi
	mov	[ecx],ebp
	pop	ebp
	mov	[ecx+8h],edx
	add	[esi+0Ch],eax
	pop	ebx
	ret
006FBB89                            CC CC CC CC CC CC CC          .......

;; fn006FBB90: 006FBB90
;;   Called from:
;;     006FBE49 (in fn006FBD90)
;;     006FCE72 (in fn006FCC90)
fn006FBB90 proc
	sub	esp,68h
	push	ebx
	mov	ebx,8h
	cmp	eax,ebx
	push	ebp
	mov	ebp,[esp+74h]
	jl	6FBBBEh

l006FBBA2:
	test	ebx,ebx
	jle	6FBBB0h

l006FBBA6:
	add	ebx,ebx
	cmp	ebx,eax
	jle	6FBBA2h

l006FBBAC:
	test	ebx,ebx
	jg	6FBBBEh

l006FBBB0:
	call	6E1210h
	pop	ebp
	or	eax,0FFh
	pop	ebx
	add	esp,68h
	ret

l006FBBBE:
	push	esi
	mov	esi,[ebp+14h]
	xor	ecx,ecx
	lea	eax,[ebp+1Ch]
	cmp	esi,eax
	setnz	cl
	cmp	ebx,8h
	push	edi
	mov	[esp+10h],esi
	mov	[esp+14h],ecx
	jnz	6FBC52h

l006FBBDA:
	cmp	eax,esi
	jnz	6FBBFFh

l006FBBDE:
	mov	edx,[ebp+8h]
	cmp	edx,[ebp+0Ch]
	jz	6FBCB5h

l006FBBEA:
	mov	ecx,18h
	lea	edi,[esp+18h]

l006FBBF3:
	rep movsd

l006FBBF5:
	lea	ecx,[esp+18h]
	mov	[esp+10h],ecx
	mov	esi,ecx

l006FBBFF:
	lea	ecx,[ebx+ebx*2]
	add	ecx,ecx
	add	ecx,ecx
	push	ecx
	xor	edi,edi
	lea	edx,[ebx-1h]
	push	edi
	push	eax
	mov	[ebp+14h],eax
	mov	[ebp+10h],edx
	call	695020h
	mov	ebx,[ebp+8h]
	add	esp,0Ch
	cmp	ebx,edi
	mov	[ebp+0Ch],edi
	mov	[ebp+8h],edi
	jle	6FBCA4h

l006FBC29:
	lea	edi,[esi+4h]
	lea	esp,[esp+0h]

l006FBC30:
	mov	eax,[edi+4h]
	test	eax,eax
	jz	6FBC7Eh

l006FBC37:
	mov	edx,[edi-4h]
	push	eax
	mov	eax,[edi]
	push	edx
	push	eax
	mov	esi,ebp
	sub	ebx,1h
	call	6FBB30h
	mov	esi,[esp+1Ch]
	add	esp,0Ch
	jmp	6FBC9Dh

l006FBC52:
	lea	eax,[ebx+ebx*2]
	add	eax,eax
	add	eax,eax
	jnz	6FBC60h

l006FBC5B:
	mov	eax,1h

l006FBC60:
	push	eax
	call	dword ptr [8A45BCh]
	add	esp,4h
	test	eax,eax
	jnz	6FBBFFh

l006FBC6E:
	call	6E1210h
	pop	edi
	pop	esi
	pop	ebp
	or	eax,0FFh
	pop	ebx
	add	esp,68h
	ret

l006FBC7E:
	mov	eax,[edi]
	test	eax,eax
	jz	6FBC9Dh

l006FBC84:
	add	dword ptr [eax],0FFh
	mov	eax,[edi]
	sub	ebx,1h
	cmp	dword ptr [eax],0h
	jnz	6FBC9Dh

l006FBC91:
	mov	ecx,[eax+4h]
	mov	edx,[ecx+18h]
	push	eax
	call	edx
	add	esp,4h

l006FBC9D:
	add	edi,0Ch
	test	ebx,ebx
	jg	6FBC30h

l006FBCA4:
	cmp	dword ptr [esp+14h],0h
	jz	6FBCB5h

l006FBCAB:
	push	esi
	call	dword ptr [8A45D4h]
	add	esp,4h

l006FBCB5:
	pop	edi
	pop	esi
	pop	ebp
	xor	eax,eax
	pop	ebx
	add	esp,68h
	ret
006FBCBF                                              CC                .

;; fn006FBCC0: 006FBCC0
;;   Called from:
;;     006D609B (in fn006D6060)
;;     006EC8F5 (in fn006EC890)
;;     006F6B0F (in fn006F6AF0)
;;     006F6F2D (in fn006F6EA0)
;;     006F6F68 (in fn006F6EA0)
;;     006FCD4A (in fn006FCC90)
;;     006FCEAB (in fn006FCC90)
;;     006FD8CD (in fn006FD8B0)
;;     007079A0 (in fn00707950)
;;     007084F6 (in fn00708410)
;;     0070A4BB (in fn00708DC0)
;;     0070A519 (in fn00708DC0)
;;     0070A534 (in fn00708DC0)
;;     0070A5E5 (in fn00708DC0)
;;     0070A5FC (in fn00708DC0)
;;     0070C1AF (in fn0070C1A0)
;;     0070C9EF (in fn0070C9E0)
;;     007250F2 (in fn00725010)
;;     0072775A (in fn007276E0)
;;     007290FD (in fn00729040)
;;     00729139 (in fn00729040)
;;     0073605E (in fn00735890)
;;     0073B003 (in fn0073AFB0)
;;     007475A0 (in fn00747580)
;;     007475ED (in fn007475E0)
;;     007476AE (in fn00747610)
;;     0074773A (in fn00747610)
;;     00747757 (in fn00747610)
;;     007477CD (in fn00747610)
;;     007478E5 (in fn00747890)
;;     00747ABD (in fn00747A80)
;;     00747B6A (in fn00747A80)
;;     00747BF4 (in fn00747A80)
;;     00748164 (in fn00748140)
;;     007481BC (in fn00748190)
;;     0074827C (in fn00748190)
;;     0074EB73 (in fn0074EB10)
fn006FBCC0 proc
	sub	esp,8h
	push	ebx
	mov	ebx,[esp+10h]
	mov	eax,[ebx+4h]
	cmp	eax,0A1D1B8h
	jz	6FBCE9h

l006FBCD2:
	push	0A1D1B8h
	push	eax
	call	6D5670h
	add	esp,8h
	test	eax,eax
	jnz	6FBCE9h

l006FBCE4:
	pop	ebx
	add	esp,8h
	ret

l006FBCE9:
	push	esi
	push	edi
	mov	edi,[esp+1Ch]
	cmp	dword ptr [edi+4h],0A1B450h
	jnz	6FBD00h

l006FBCF8:
	mov	esi,[edi+0Ch]
	cmp	esi,0FFh
	jnz	6FBD10h

l006FBD00:
	push	edi
	call	6DE2E0h
	mov	esi,eax
	add	esp,4h
	cmp	esi,0FFh
	jz	6FBD72h

l006FBD10:
	mov	eax,[0A6D67Ch]
	test	eax,eax
	jz	6FBD61h

l006FBD19:
	cmp	dword ptr [eax+28h],0h
	jz	6FBD61h

l006FBD1F:
	lea	eax,[esp+18h]
	push	eax
	lea	ecx,[esp+10h]
	push	ecx
	lea	edx,[esp+18h]
	push	edx
	call	6E1130h
	mov	eax,[ebx+18h]
	push	esi
	push	edi
	push	ebx
	call	eax
	mov	ecx,[esp+30h]
	mov	edx,[esp+24h]
	push	ecx
	mov	esi,eax
	mov	eax,[esp+2Ch]
	push	edx
	push	eax
	call	6E0E00h
	add	esp,24h
	test	esi,esi
	jnz	6FBD80h

l006FBD58:
	pop	edi
	pop	esi
	xor	eax,eax
	pop	ebx
	add	esp,8h
	ret

l006FBD61:
	mov	ecx,[ebx+18h]
	push	esi
	push	edi
	push	ebx
	call	ecx
	mov	esi,eax
	add	esp,0Ch
	test	esi,esi
	jnz	6FBD80h

l006FBD72:
	call	6E1160h
	pop	edi
	pop	esi
	xor	eax,eax
	pop	ebx
	add	esp,8h
	ret

l006FBD80:
	mov	eax,[esi+8h]
	pop	edi
	pop	esi
	pop	ebx
	add	esp,8h
	ret
006FBD8A                               CC CC CC CC CC CC           ......

;; fn006FBD90: 006FBD90
;;   Called from:
;;     006E9A2D (in fn006E99A0)
;;     006EC92C (in fn006EC890)
;;     006F606B (in fn006F5DD0)
;;     006F616E (in fn006F5DD0)
;;     006F6B26 (in fn006F6AF0)
;;     006F6BC4 (in fn006F6AF0)
;;     006FCD80 (in fn006FCC90)
;;     006FD923 (in fn006FD8F0)
;;     007079AF (in fn00707950)
;;     00708341 (in fn00708210)
;;     0070A2FC (in fn00708DC0)
;;     0070A418 (in fn00708DC0)
;;     0070B8D6 (in fn0070B600)
;;     0071743E (in fn007173A0)
;;     007174FA (in fn007173A0)
;;     007262C5 (in fn00726260)
;;     007263DB (in fn00726340)
;;     0072779C (in fn007276E0)
;;     007360C4 (in fn00735890)
;;     00736E86 (in fn007367D0)
;;     007473E6 (in fn00747330)
;;     00747659 (in fn00747610)
;;     00747698 (in fn00747610)
;;     007476F8 (in fn00747610)
;;     00747724 (in fn00747610)
;;     0074777E (in fn00747610)
;;     007477AE (in fn00747610)
;;     007477F4 (in fn00747610)
;;     0074785D (in fn00747610)
;;     007478F8 (in fn00747890)
;;     00747AE4 (in fn00747A80)
;;     00747BAE (in fn00747A80)
;;     00747C07 (in fn00747A80)
;;     00748224 (in fn00748190)
;;     007482A2 (in fn00748190)
;;     0074ECDA (in fn0074EB10)
fn006FBD90 proc
	push	edi
	mov	edi,[esp+8h]
	mov	eax,[edi+4h]
	cmp	eax,0A1D1B8h
	jz	6FBDC8h

l006FBD9F:
	push	0A1D1B8h
	push	eax
	call	6D5670h
	add	esp,8h
	test	eax,eax
	jnz	6FBDC8h

l006FBDB1:
	push	26Dh
	push	8D6320h
	call	6E1DC0h
	add	esp,8h
	or	eax,0FFh
	pop	edi
	ret

l006FBDC8:
	push	ebx
	mov	ebx,[esp+10h]
	cmp	dword ptr [ebx+4h],0A1B450h
	jnz	6FBE0Ah

l006FBDD6:
	mov	eax,[ebx+0Ch]
	cmp	eax,0FFh
	jnz	6FBDE7h

l006FBDDE:
	push	ebx
	call	6DE2E0h
	add	esp,4h

l006FBDE7:
	mov	ecx,[esp+14h]
	push	esi
	mov	esi,[edi+0Ch]
	add	dword ptr [ecx],1h
	add	dword ptr [ebx],1h
	push	ecx
	push	eax
	call	6FBA70h
	add	esp,8h
	test	eax,eax
	jz	6FBE1Dh

l006FBE03:
	pop	esi
	pop	ebx
	or	eax,0FFh
	pop	edi
	ret

l006FBE0A:
	push	ebx
	call	6DE2E0h
	add	esp,4h
	cmp	eax,0FFh
	jnz	6FBDE7h

l006FBE18:
	pop	ebx
	or	eax,eax
	pop	edi
	ret

l006FBE1D:
	mov	eax,[edi+0Ch]
	cmp	eax,esi
	jle	6FBE55h

l006FBE24:
	mov	ecx,[edi+10h]
	lea	edx,[ecx+ecx+2h]
	mov	ecx,[edi+8h]
	lea	ecx,[ecx+ecx*2]
	cmp	ecx,edx
	jl	6FBE55h

l006FBE35:
	xor	edx,edx
	cmp	eax,0C350h
	setle	dl
	push	edi
	lea	edx,[edx+edx+2h]
	imul	edx,eax
	mov	eax,edx
	call	6FBB90h
	add	esp,4h
	pop	esi
	pop	ebx
	pop	edi
	ret

l006FBE55:
	pop	esi
	pop	ebx
	xor	eax,eax
	pop	edi
	ret
006FBE5B                                  CC CC CC CC CC            .....

;; fn006FBE60: 006FBE60
;;   Called from:
;;     006FD970 (in fn006FD950)
;;     00708508 (in fn00708410)
;;     0070A459 (in fn00708DC0)
;;     007476C0 (in fn00747610)
;;     0074790A (in fn00747890)
fn006FBE60 proc
	push	esi
	mov	esi,[esp+8h]
	mov	eax,[esi+4h]
	cmp	eax,0A1D1B8h
	jz	6FBE98h

l006FBE6F:
	push	0A1D1B8h
	push	eax
	call	6D5670h
	add	esp,8h
	test	eax,eax
	jnz	6FBE98h

l006FBE81:
	push	29Fh
	push	8D6320h
	call	6E1DC0h
	add	esp,8h
	or	eax,0FFh
	pop	esi
	ret

l006FBE98:
	push	edi
	mov	edi,[esp+10h]
	cmp	dword ptr [edi+4h],0A1B450h
	jnz	6FBEAEh

l006FBEA6:
	mov	eax,[edi+0Ch]
	cmp	eax,0FFh
	jnz	6FBEBCh

l006FBEAE:
	push	edi
	call	6DE2E0h
	add	esp,4h
	cmp	eax,0FFh
	jz	6FBED8h

l006FBEBC:
	push	eax
	mov	eax,[esi+18h]
	push	edi
	push	esi
	call	eax
	add	esp,0Ch
	test	eax,eax
	jz	6FBED8h

l006FBECB:
	cmp	dword ptr [eax+8h],0h
	jnz	6FBEDEh

l006FBED1:
	mov	eax,edi
	call	6FB760h

l006FBED8:
	pop	edi
	or	eax,0FFh
	pop	esi
	ret

l006FBEDE:
	mov	edi,[eax+4h]
	mov	ecx,[0A6CCF8h]
	add	dword ptr [ecx],1h
	mov	[eax+4h],ecx
	mov	ecx,[eax+8h]
	mov	dword ptr [eax+8h],0h
	add	dword ptr [esi+0Ch],0FFh
	add	dword ptr [ecx],0FFh
	jnz	6FBF0Ch

l006FBF00:
	mov	edx,[ecx+4h]
	mov	eax,[edx+18h]
	push	ecx
	call	eax
	add	esp,4h

l006FBF0C:
	add	dword ptr [edi],0FFh
	jnz	6FBF1Dh

l006FBF11:
	mov	ecx,[edi+4h]
	mov	edx,[ecx+18h]
	push	edi
	call	edx
	add	esp,4h

l006FBF1D:
	pop	edi
	xor	eax,eax
	pop	esi
	ret
006FBF22       CC CC CC CC CC CC CC CC CC CC CC CC CC CC   ..............

;; fn006FBF30: 006FBF30
;;   Called from:
;;     006F626D (in fn006F5DD0)
fn006FBF30 proc
	sub	esp,68h
	push	ebx
	mov	ebx,[esp+70h]
	mov	eax,[ebx+4h]
	cmp	eax,0A1D1B8h
	jz	6FBF58h

l006FBF42:
	push	0A1D1B8h
	push	eax
	call	6D5670h
	add	esp,8h
	test	eax,eax
	jz	6FC03Eh

l006FBF58:
	push	ebp
	push	esi
	mov	esi,[ebx+8h]
	xor	eax,eax
	push	edi
	mov	edi,[ebx+14h]
	lea	ebp,[ebx+1Ch]
	cmp	edi,ebp
	setnz	al
	mov	[esp+7Ch],edi
	mov	[esp+10h],esi
	test	eax,eax
	mov	[esp+14h],eax
	jz	6FBF92h

l006FBF7B:
	push	60h
	push	0h
	push	ebp
	call	695020h
	add	esp,0Ch
	xor	eax,eax
	mov	[ebx+8h],eax
	mov	[ebx+0Ch],eax
	jmp	6FBFD1h

l006FBF92:
	test	esi,esi
	jle	6FC02Ah

l006FBF9A:
	mov	esi,edi
	mov	ecx,18h
	lea	edi,[esp+18h]

l006FBFA5:
	rep movsd

l006FBFA7:
	push	60h
	xor	esi,esi
	lea	eax,[esp+1Ch]
	push	esi
	push	ebp
	mov	[esp+88h],eax
	call	695020h
	mov	edi,[esp+88h]
	mov	[ebx+8h],esi
	mov	[ebx+0Ch],esi
	mov	esi,[esp+1Ch]
	add	esp,0Ch

l006FBFD1:
	test	esi,esi
	mov	dword ptr [ebx+10h],7h
	mov	[ebx+14h],ebp
	jle	6FC02Ah

l006FBFDF:
	add	edi,8h

l006FBFE2:
	mov	eax,[edi-4h]
	test	eax,eax
	jz	6FC01Fh

l006FBFE9:
	add	dword ptr [eax],0FFh
	mov	eax,[edi-4h]
	sub	esi,1h
	cmp	dword ptr [eax],0h
	jnz	6FC003h

l006FBFF7:
	mov	ecx,[eax+4h]
	mov	edx,[ecx+18h]
	push	eax
	call	edx
	add	esp,4h

l006FC003:
	mov	eax,[edi]
	test	eax,eax
	jz	6FC01Fh

l006FC009:
	add	dword ptr [eax],0FFh
	mov	eax,[edi]
	cmp	dword ptr [eax],0h
	jnz	6FC01Fh

l006FC013:
	mov	ecx,[eax+4h]
	mov	edx,[ecx+18h]
	push	eax
	call	edx
	add	esp,4h

l006FC01F:
	add	edi,0Ch
	test	esi,esi
	jg	6FBFE2h

l006FC026:
	mov	edi,[esp+7Ch]

l006FC02A:
	cmp	dword ptr [esp+14h],0h
	jz	6FC03Bh

l006FC031:
	push	edi
	call	dword ptr [8A45D4h]
	add	esp,4h

l006FC03B:
	pop	edi
	pop	esi
	pop	ebp

l006FC03E:
	pop	ebx
	add	esp,68h
	ret
006FC043          CC CC CC CC CC CC CC CC CC CC CC CC CC    .............

;; fn006FC050: 006FC050
;;   Called from:
;;     006F5FAD (in fn006F5DD0)
;;     006F6086 (in fn006F5DD0)
;;     006F60B4 (in fn006F5DD0)
;;     006F6186 (in fn006F5DD0)
;;     007173CB (in fn007173A0)
;;     00717456 (in fn007173A0)
;;     0071747A (in fn007173A0)
;;     00717512 (in fn007173A0)
;;     00726378 (in fn00726340)
;;     0072641D (in fn00726340)
;;     00728AF6 (in fn00728AC0)
;;     00728B31 (in fn00728AC0)
;;     00735EAE (in fn00735890)
;;     00735EE6 (in fn00735890)
;;     007478C9 (in fn00747890)
;;     00747929 (in fn00747890)
;;     00747A9F (in fn00747A80)
;;     00747B15 (in fn00747A80)
;;     00747B54 (in fn00747A80)
;;     00747C27 (in fn00747A80)
;;     00747D61 (in fn00747CA0)
;;     00747DAD (in fn00747CA0)
fn006FC050 proc
	push	esi
	mov	esi,[esp+8h]
	mov	eax,[esi+4h]
	cmp	eax,0A1D1B8h
	jz	6FC073h

l006FC05F:
	push	0A1D1B8h
	push	eax
	call	6D5670h
	add	esp,8h
	test	eax,eax
	jnz	6FC073h

l006FC071:
	pop	esi
	ret

l006FC073:
	push	ebx
	mov	ebx,[esp+10h]
	mov	eax,[ebx]
	test	eax,eax
	jge	6FC083h

l006FC07E:
	pop	ebx
	xor	eax,eax
	pop	esi
	ret

l006FC083:
	mov	ecx,[esi+10h]
	cmp	eax,ecx
	push	edi
	mov	edi,[esi+14h]
	jg	6FC0A4h

l006FC08E:
	lea	edx,[eax+eax*2]
	lea	edx,[edi+edx*4+8h]

l006FC095:
	cmp	dword ptr [edx],0h
	jnz	6FC0A4h

l006FC09A:
	add	eax,1h
	add	edx,0Ch
	cmp	eax,ecx
	jle	6FC095h

l006FC0A4:
	cmp	eax,ecx
	lea	edx,[eax+1h]
	mov	[ebx],edx
	jle	6FC0B3h

l006FC0AD:
	pop	edi
	pop	ebx
	xor	eax,eax
	pop	esi
	ret

l006FC0B3:
	mov	ecx,[esp+18h]
	test	ecx,ecx
	jz	6FC0C4h

l006FC0BB:
	lea	edx,[eax+eax*2]
	mov	edx,[edi+edx*4+4h]
	mov	[ecx],edx

l006FC0C4:
	mov	ecx,[esp+1Ch]
	test	ecx,ecx
	jz	6FC0D5h

l006FC0CC:
	lea	eax,[eax+eax*2]
	mov	edx,[edi+eax*4+8h]
	mov	[ecx],edx

l006FC0D5:
	pop	edi
	pop	ebx
	mov	eax,1h
	pop	esi
	ret
006FC0DE                                           CC CC               ..

;; fn006FC0E0: 006FC0E0
;;   Called from:
;;     00738A63 (in fn007389B0)
;;     00738AAD (in fn007389B0)
fn006FC0E0 proc
	push	esi
	mov	esi,[esp+8h]
	mov	eax,[esi+4h]
	cmp	eax,0A1D1B8h
	jz	6FC103h

l006FC0EF:
	push	0A1D1B8h
	push	eax
	call	6D5670h
	add	esp,8h
	test	eax,eax
	jnz	6FC103h

l006FC101:
	pop	esi
	ret

l006FC103:
	push	ebx
	mov	ebx,[esp+10h]
	mov	eax,[ebx]
	test	eax,eax
	jge	6FC113h

l006FC10E:
	pop	ebx
	xor	eax,eax
	pop	esi
	ret

l006FC113:
	mov	ecx,[esi+10h]
	cmp	eax,ecx
	push	edi
	mov	edi,[esi+14h]
	jg	6FC134h

l006FC11E:
	lea	edx,[eax+eax*2]
	lea	edx,[edi+edx*4+8h]

l006FC125:
	cmp	dword ptr [edx],0h
	jnz	6FC134h

l006FC12A:
	add	eax,1h
	add	edx,0Ch
	cmp	eax,ecx
	jle	6FC125h

l006FC134:
	cmp	eax,ecx
	lea	edx,[eax+1h]
	mov	[ebx],edx
	jle	6FC143h

l006FC13D:
	pop	edi
	pop	ebx
	xor	eax,eax
	pop	esi
	ret

l006FC143:
	mov	edx,[esp+20h]
	lea	eax,[eax+eax*2]
	mov	ecx,[edi+eax*4]
	lea	eax,[edi+eax*4]
	mov	[edx],ecx
	mov	ecx,[esp+18h]
	test	ecx,ecx
	jz	6FC15Fh

l006FC15A:
	mov	edx,[eax+4h]
	mov	[ecx],edx

l006FC15F:
	mov	ecx,[esp+1Ch]
	test	ecx,ecx
	jz	6FC16Ch

l006FC167:
	mov	eax,[eax+8h]
	mov	[ecx],eax

l006FC16C:
	pop	edi
	pop	ebx
	mov	eax,1h
	pop	esi
	ret
006FC175                CC CC CC CC CC CC CC CC CC CC CC      ...........
006FC180 53 8B 5C 24 08 57 8B 7B 08 53 E8 F1 2C 00 00 83 S.\$.W.{.S..,...
006FC190 C4 04 83 3D C4 C4 A6 00 32 0F 8D C1 00 00 00 83 ...=....2.......
006FC1A0 05 C4 C4 A6 00 01 85 FF 8B 43 14 7E 4C 56 8D 70 .........C.~LV.p
006FC1B0 08 83 7E FC 00 74 3A 8B 46 FC 83 00 FF 8B 46 FC ..~..t:.F.....F.
006FC1C0 83 EF 01 83 38 00 75 0C 8B 48 04 8B 51 18 50 FF ....8.u..H..Q.P.
006FC1D0 D2 83 C4 04 83 3E 00 74 18 8B 06 83 00 FF 8B 06 .....>.t........
006FC1E0 83 38 00 75 0C 8B 48 04 8B 51 18 50 FF D2 83 C4 .8.u..H..Q.P....
006FC1F0 04 83 C6 0C 85 FF 7F B9 5E 8B 43 14 8D 4B 1C 3B ........^.C..K.;
006FC200 C1 74 0A 50 FF 15 D4 45 8A 00 83 C4 04 A1 FC CC .t.P...E........
006FC210 A6 00 83 F8 50 7D 1A 81 7B 04 B8 D1 A1 00 75 11 ....P}..{.....u.
006FC220 89 1C 85 B8 CB A6 00 83 C0 01 A3 FC CC A6 00 EB ................
006FC230 0F 8B 53 04 8B 82 A0 00 00 00 53 FF D0 83 C4 04 ..S.......S.....
006FC240 83 2D C4 C4 A6 00 01 83 3D C8 C4 A6 00 00 74 19 .-......=.....t.
006FC250 83 3D C4 C4 A6 00 00 7F 10 5F 5B E9 00 2C FE FF .=......._[..,..
006FC260 53 E8 DA 2B FE FF 83 C4 04 5F 5B C3 CC CC CC CC S..+....._[.....
006FC270 83 EC 0C 55 8B 6C 24 14 56 55 E8 A1 2A FE FF 33 ...U.l$.VU..*..3
006FC280 F6 83 C4 04 3B C6 74 21 0F 8C E8 00 00 00 8B 44 ....;.t!.......D
006FC290 24 1C 68 40 63 8D 00 50 FF 15 E0 45 8A 00 83 C4 $.h@c..P...E....
006FC2A0 08 5E 33 C0 5D 83 C4 0C C3 53 8B 5C 24 20 57 68 .^3.]....S.\$ Wh
006FC2B0 3C 63 8D 00 53 FF 15 E0 45 8A 00 83 C4 08 39 75 <c..S...E.....9u
006FC2C0 10 89 74 24 14 89 74 24 18 0F 8C 8E 00 00 00 89 ..t$..t$........
006FC2D0 74 24 10 8B 7D 14 03 7C 24 10 8B 77 08 85 F6 74 t$..}..|$..w...t
006FC2E0 63 8B 44 24 14 83 06 01 8B C8 83 C0 01 85 C9 89 c.D$............
006FC2F0 44 24 14 7E 0F 68 D0 A2 8A 00 53 FF 15 E0 45 8A D$.~.h....S...E.
006FC300 00 83 C4 08 8B 57 04 6A 00 53 52 E8 B0 2C FE FF .....W.j.SR..,..
006FC310 83 C4 0C 85 C0 75 65 68 70 AE 8B 00 53 FF 15 E0 .....uehp...S...
006FC320 45 8A 00 6A 00 53 56 E8 94 2C FE FF 83 C4 14 85 E..j.SV..,......
006FC330 C0 75 6E 83 06 FF 75 0C 8B 46 04 8B 48 18 56 FF .un...u..F..H.V.
006FC340 D1 83 C4 04 8B 44 24 18 83 44 24 10 0C 83 C0 01 .....D$..D$.....
006FC350 3B 45 10 89 44 24 18 0F 8E 76 FF FF FF 68 38 63 ;E..D$...v...h8c
006FC360 8D 00 53 FF 15 E0 45 8A 00 55 E8 51 2A FE FF 83 ..S...E..U.Q*...
006FC370 C4 0C 5F 33 C0 5B 5E 5D 83 C4 0C C3 83 06 FF 75 .._3.[^].......u
006FC380 0C 8B 56 04 8B 42 18 56 FF D0 83 C4 04 55 E8 2D ..V..B.V.....U.-
006FC390 2A FE FF 83 C4 04 5F 5B 5E 83 C8 FF 5D 83 C4 0C *....._[^...]...
006FC3A0 C3 83 06 FF 75 0C 8B 4E 04 8B 51 18 56 FF D2 83 ....u..N..Q.V...
006FC3B0 C4 04 55 E8 08 2A FE FF 83 C4 04 5F 5B 5E 83 C8 ..U..*....._[^..
006FC3C0 FF 5D 83 C4 0C C3 CC CC CC CC CC CC CC CC CC CC .]..............
006FC3D0 83 EC 14 55 56 8B 74 24 20 56 33 ED E8 3F 29 FE ...UV.t$ V3..?).
006FC3E0 FF 83 C4 04 85 C0 74 1D 7E 13 68 40 63 8D 00 E8 ......t.~.h@c...
006FC3F0 CC 06 FF FF 83 C4 04 5E 5D 83 C4 14 C3 5E 33 C0 .......^]....^3.
006FC400 5D 83 C4 14 C3 39 6E 0C 75 20 68 48 63 8D 00 E8 ]....9n.u hHc...
006FC410 AC 06 FF FF 83 C4 04 56 8B E8 E8 A1 29 FE FF 83 .......V....)...
006FC420 C4 04 5E 8B C5 5D 83 C4 14 C3 57 6A 00 E8 1E 62 ..^..]....Wj...b
006FC430 FF FF 8B F8 83 C4 04 85 FF 0F 84 D5 01 00 00 53 ...............S
006FC440 68 70 AE 8B 00 E8 76 06 FF FF 8B D8 83 C4 04 85 hp....v.........
006FC450 DB 0F 84 92 01 00 00 8D 44 24 18 50 8D 4C 24 20 ........D$.P.L$ 
006FC460 51 8D 54 24 28 52 56 89 6C 24 30 E8 E0 FB FF FF Q.T$(RV.l$0.....
006FC470 83 C4 10 85 C0 0F 84 A9 00 00 00 EB 03 8D 49 00 ..............I.
006FC480 8B 44 24 1C 8B 74 24 18 83 06 01 50 E8 1F 19 FE .D$..t$....P....
006FC490 FF 8D 4C 24 14 53 51 89 44 24 1C E8 A0 FF FE FF ..L$.SQ.D$......
006FC4A0 56 E8 0A 19 FE FF 50 8D 54 24 24 52 E8 0F 00 FF V.....P.T$$R....
006FC4B0 FF 83 C4 18 83 06 FF 75 0C 8B 46 04 8B 48 18 56 .......u..F..H.V
006FC4C0 FF D1 83 C4 04 8B 44 24 10 85 C0 0F 84 18 01 00 ......D$........
006FC4D0 00 50 57 E8 38 65 FF FF 8B F0 8B 44 24 18 83 00 .PW.8e.....D$...
006FC4E0 FF 8B 44 24 18 83 C4 08 39 28 75 0C 8B 50 04 50 ..D$....9(u..P.P
006FC4F0 8B 42 18 FF D0 83 C4 04 85 F6 0F 8C E9 00 00 00 .B..............
006FC500 8D 4C 24 18 51 8B 4C 24 2C 8D 54 24 20 52 8D 44 .L$.Q.L$,.T$ R.D
006FC510 24 28 50 51 E8 37 FB FF FF 83 C4 10 85 C0 0F 85 $(PQ.7..........
006FC520 5C FF FF FF 68 3C 63 8D 00 E8 92 05 FF FF 83 C4 \...h<c.........
006FC530 04 85 C0 89 44 24 10 0F 84 AC 00 00 00 8B 57 0C ....D$........W.
006FC540 8B 02 50 89 44 24 18 8D 44 24 14 50 E8 6F FF FE ..P.D$..D$.P.o..
006FC550 FF 8B 4F 0C 8B 54 24 18 83 C4 08 89 11 39 6C 24 ..O..T$......9l$
006FC560 10 0F 84 82 00 00 00 68 38 63 8D 00 E8 4F 05 FF .......h8c...O..
006FC570 FF 83 C4 04 85 C0 89 44 24 10 74 6D 8B 57 0C 8B .......D$.tm.W..
006FC580 4F 08 8B 4C 8A FC 50 8D 54 24 18 52 89 4C 24 1C O..L..P.T$.R.L$.
006FC590 E8 2B FF FE FF 8B 47 08 8B 4F 0C 8B 54 24 1C 83 .+....G..O..T$..
006FC5A0 C4 08 89 54 81 FC 39 6C 24 14 74 3D 68 D0 A2 8A ...T..9l$.t=h...
006FC5B0 00 E8 0A 05 FF FF 83 C4 04 85 C0 89 44 24 10 74 ............D$.t
006FC5C0 28 57 50 E8 88 20 FF FF 8B E8 8B 44 24 18 83 00 (WP.. .....D$...
006FC5D0 FF 8B 44 24 18 83 C4 08 83 38 00 75 0C 8B 48 04 ..D$.....8.u..H.
006FC5E0 8B 51 18 50 FF D2 83 C4 04 83 07 FF 75 0C 8B 47 .Q.P........u..G
006FC5F0 04 8B 48 18 57 FF D1 83 C4 04 85 DB 74 11 83 03 ..H.W.......t...
006FC600 FF 75 0C 8B 53 04 8B 42 18 53 FF D0 83 C4 04 8B .u..S..B.S......
006FC610 74 24 28 5B 5F 56 E8 A5 27 FE FF 83 C4 04 5E 8B t$([_V..'.....^.
006FC620 C5 5D 83 C4 14 C3 CC CC CC CC CC CC CC CC CC CC .]..............
006FC630 8B 44 24 04 8B 40 0C C3 CC CC CC CC CC CC CC CC .D$..@..........
006FC640 57 8B 7C 24 0C 81 7F 04 50 B4 A1 00 75 08 8B 47 W.|$....P...u..G
006FC650 0C 83 F8 FF 75 12 57 E8 84 1C FE FF 83 C4 04 83 ....u.W.........
006FC660 F8 FF 75 04 33 C0 5F C3 56 8B 74 24 0C 50 8B 46 ..u.3._.V.t$.P.F
006FC670 18 57 56 FF D0 83 C4 0C 85 C0 74 53 8B 40 08 85 .WV.......tS.@..
006FC680 C0 75 51 81 7E 04 B8 D1 A1 00 74 3C A1 00 CD A6 .uQ.~.....t<....
006FC690 00 85 C0 75 12 68 4C 63 8D 00 E8 D1 53 FF FF 83 ...u.hLc....S...
006FC6A0 C4 04 A3 00 CD A6 00 8B 4E 04 50 51 E8 AF 99 FD ........N.PQ....
006FC6B0 FF 83 C4 08 85 C0 74 10 6A 00 57 56 50 E8 2E 74 ......t.j.WVP..t
006FC6C0 00 00 83 C4 10 5E 5F C3 8B C7 E8 91 F0 FF FF 5E .....^_........^
006FC6D0 33 C0 5F C3 83 00 01 5E 5F C3 CC CC CC CC CC CC 3._....^_.......
006FC6E0 8B 44 24 0C 85 C0 75 13 8B 44 24 08 8B 4C 24 04 .D$...u..D$..L$.
006FC6F0 50 51 E8 69 F7 FF FF 83 C4 08 C3 89 44 24 0C E9 PQ.i........D$..
006FC700 8C F6 FF FF CC CC CC CC CC CC CC CC CC CC CC CC ................
006FC710 56 57 8B 7C 24 0C 8B 77 0C 56 E8 31 5F FF FF 83 VW.|$..w.V.1_...
006FC720 C4 04 85 C0 74 26 3B 77 0C 74 26 83 00 FF 75 0C ....t&;w.t&...u.
006FC730 8B 48 04 8B 51 18 50 FF D2 83 C4 04 8B 77 0C 56 .H..Q.P......w.V
006FC740 E8 0B 5F FF FF 83 C4 04 85 C0 75 DA 5F 33 C0 5E .._.......u._3.^
006FC750 C3 8B 4F 14 8B 7F 10 85 FF 7C 26 33 F6 8D 51 04 ..O......|&3..Q.
006FC760 83 C7 01 53 83 7A 04 00 74 0E 8B 0A 83 01 01 8B ...S.z..t.......
006FC770 58 0C 89 0C 1E 83 C6 04 83 C2 0C 83 EF 01 75 E4 X.............u.
006FC780 5B 5F 5E C3 CC CC CC CC CC CC CC CC CC CC CC CC [_^.............
006FC790 56 57 8B 7C 24 0C 8B 77 0C 56 E8 B1 5E FF FF 83 VW.|$..w.V..^...
006FC7A0 C4 04 85 C0 74 26 3B 77 0C 74 26 83 00 FF 75 0C ....t&;w.t&...u.
006FC7B0 8B 48 04 8B 51 18 50 FF D2 83 C4 04 8B 77 0C 56 .H..Q.P......w.V
006FC7C0 E8 8B 5E FF FF 83 C4 04 85 C0 75 DA 5F 33 C0 5E ..^.......u._3.^
006FC7D0 C3 8B 4F 14 8B 7F 10 85 FF 7C 24 33 D2 8D 71 08 ..O......|$3..q.
006FC7E0 83 C7 01 53 8B 0E 85 C9 74 0C 83 01 01 8B 58 0C ...S....t.....X.
006FC7F0 89 0C 1A 83 C2 04 83 C6 0C 83 EF 01 75 E6 5B 5F ............u.[_
006FC800 5E C3 CC CC CC CC CC CC CC CC CC CC CC CC CC CC ^...............
006FC810 53 55 8B 6C 24 0C 8B 5D 0C 56 57 53 E8 2F 5E FF SU.l$..].VWS./^.
006FC820 FF 8B F8 83 C4 04 85 FF 74 4F 8D 9B 00 00 00 00 ........tO......
006FC830 33 F6 85 DB 7E 1B 6A 02 E8 E3 34 FE FF 83 C4 04 3...~.j...4.....
006FC840 85 C0 74 3C 8B 4F 0C 89 04 B1 83 C6 01 3B F3 7C ..t<.O.......;.|
006FC850 E5 3B 5D 0C 74 42 83 07 FF 75 0C 8B 57 04 8B 42 .;].tB...u..W..B
006FC860 18 57 FF D0 83 C4 04 8B 5D 0C 53 E8 E0 5D FF FF .W......].S..]..
006FC870 8B F8 83 C4 04 85 FF 75 B7 5F 5E 5D 33 C0 5B C3 .......u._^]3.[.
006FC880 83 07 FF 75 0C 8B 4F 04 8B 51 18 57 FF D2 83 C4 ...u..O..Q.W....
006FC890 04 5F 5E 5D 33 C0 5B C3 8B 45 10 85 C0 8B 4D 14 ._^]3.[..E....M.
006FC8A0 7C 34 33 DB 8D 71 04 8D 68 01 8D 9B 00 00 00 00 |43..q..h.......
006FC8B0 8B 4E 04 85 C9 74 17 8B 57 0C 8B 06 8B 14 13 83 .N...t..W.......
006FC8C0 00 01 89 42 0C 83 01 01 89 4A 10 83 C3 04 83 C6 ...B.....J......
006FC8D0 0C 83 ED 01 75 DA 8B C7 5F 5E 5D 5B C3 CC CC CC ....u..._^][....
006FC8E0 83 EC 14 8B 54 24 1C 8D 04 24 50 8D 4C 24 0C 51 ....T$...$P.L$.Q
006FC8F0 6A 02 6A 01 68 00 63 8D 00 52 C7 44 24 18 B8 63 j.j.h.c..R.D$..c
006FC900 A1 00 E8 C9 91 FE FF 83 C4 18 85 C0 75 04 83 C4 ............u...
006FC910 14 C3 8B 44 24 18 57 6A 00 50 E8 D1 6D 00 00 8B ...D$.Wj.P..m...
006FC920 F8 83 C4 08 85 FF 75 05 5F 83 C4 14 C3 81 7F 04 ......u._.......
006FC930 B8 D1 A1 00 8B 44 24 0C 53 0F 85 A3 00 00 00 8B .....D$.S.......
006FC940 48 04 81 F9 90 B4 A2 00 74 0C 81 F9 F8 B6 A2 00 H.......t.......
006FC950 0F 85 8C 00 00 00 C7 44 24 18 00 00 00 00 8B 40 .......D$......@
006FC960 0C 57 E8 29 F2 FF FF 83 C4 04 85 C0 0F 85 90 00 .W.)............
006FC970 00 00 8D 4C 24 14 51 8B 4C 24 14 8D 54 24 10 52 ...L$.Q.L$..T$.R
006FC980 8D 44 24 20 50 51 E8 A5 DC 03 00 83 C4 10 85 C0 .D$ PQ..........
006FC990 74 48 8B 44 24 0C 83 00 01 8B 44 24 08 83 00 01 tH.D$.....D$....
006FC9A0 8B 54 24 08 8B 44 24 14 8B 5C 24 0C 52 50 E8 BD .T$..D$..\$.RP..
006FC9B0 F0 FF FF 83 C4 08 85 C0 75 48 8D 4C 24 14 51 8B ........uH.L$.Q.
006FC9C0 4C 24 14 8D 54 24 10 52 8D 44 24 20 50 51 E8 5D L$..T$.R.D$ PQ.]
006FC9D0 DC 03 00 83 C4 10 85 C0 75 B8 5B 8B C7 5F 83 C4 ........u.[.._..
006FC9E0 14 C3 50 E8 18 81 00 00 8B D8 83 C4 04 85 DB 75 ..P............u
006FC9F0 19 83 07 FF 75 0C 8B 57 04 8B 42 18 57 FF D0 83 ....u..W..B.W...
006FCA00 C4 04 5B 33 C0 5F 83 C4 14 C3 55 56 53 E8 2E 76 ..[3._....UVS..v
006FCA10 00 00 8B F0 83 C4 04 85 F6 74 3A EB 03 8D 49 00 .........t:...I.
006FCA20 8B 4C 24 10 51 56 57 E8 D4 78 00 00 83 C4 0C 83 .L$.QVW..x......
006FCA30 06 FF 8B E8 75 0C 8B 56 04 8B 42 18 56 FF D0 83 ....u..V..B.V...
006FCA40 C4 04 85 ED 7C 33 53 E8 F4 75 00 00 8B F0 83 C4 ....|3S..u......
006FCA50 04 85 F6 75 CB E8 66 45 FE FF 85 C0 75 1B 83 03 ...u..fE....u...
006FCA60 FF 75 0C 8B 4B 04 8B 51 18 53 FF D2 83 C4 04 5E .u..K..Q.S.....^
006FCA70 5D 5B 8B C7 5F 83 C4 14 C3 83 03 FF 75 0C 8B 43 ][.._.......u..C
006FCA80 04 8B 48 18 53 FF D1 83 C4 04 83 07 FF 75 0C 8B ..H.S........u..
006FCA90 57 04 8B 42 18 57 FF D0 83 C4 04 5E 5D 5B 33 C0 W..B.W.....^][3.
006FCAA0 5F 83 C4 14 C3 CC CC CC CC CC CC CC CC CC CC CC _...............
006FCAB0 83 EC 08 8B 44 24 10 53 56 50 E8 41 80 00 00 8B ....D$.SVP.A....
006FCAC0 D8 33 F6 83 C4 04 3B DE 89 5C 24 0C 75 09 5E 83 .3....;..\$.u.^.
006FCAD0 C8 FF 5B 83 C4 08 C3 55 57 53 89 74 24 14 E8 5D ..[....UWS.t$..]
006FCAE0 75 00 00 8B F8 83 C4 04 3B FE 0F 84 FD 00 00 00 u.......;.......
006FCAF0 68 8F 69 8A 00 57 E8 A5 82 00 00 8B F0 83 C4 08 h.i..W..........
006FCB00 85 F6 0F 84 F2 00 00 00 8B 46 04 3D F0 BA A1 00 .........F.=....
006FCB10 74 0E 68 F0 BA A1 00 50 E8 53 8B FD FF 83 C4 08 t.h....P.S......
006FCB20 8B 46 08 83 F8 02 0F 85 FB 00 00 00 8B 46 04 3D .F...........F.=
006FCB30 F0 BA A1 00 74 17 68 F0 BA A1 00 50 E8 2F 8B FD ....t.h....P./..
006FCB40 FF 83 C4 08 85 C0 75 05 8B 6E 0C EB 05 8B 4E 0C ......u..n....N.
006FCB50 8B 29 8B 46 04 3D F0 BA A1 00 74 17 68 F0 BA A1 .).F.=....t.h...
006FCB60 00 50 E8 09 8B FD FF 83 C4 08 85 C0 75 05 8B 5E .P..........u..^
006FCB70 10 EB 06 8B 56 0C 8B 5A 04 83 7C 24 24 00 75 12 ....V..Z..|$$.u.
006FCB80 8B 44 24 1C 55 50 E8 35 F1 FF FF 83 C4 08 85 C0 .D$.UP.5........
006FCB90 75 17 8B 4C 24 1C 53 55 51 E8 F2 F1 FF FF 83 C4 u..L$.SUQ.......
006FCBA0 0C 85 C0 0F 8C 9A 00 00 00 83 06 FF 75 0C 8B 56 ............u..V
006FCBB0 04 8B 42 18 56 FF D0 83 C4 04 83 07 FF 75 0C 8B ..B.V........u..
006FCBC0 4F 04 8B 51 18 57 FF D2 83 C4 04 8B 44 24 14 83 O..Q.W......D$..
006FCBD0 44 24 10 01 50 33 F6 E8 64 74 00 00 8B 5C 24 18 D$..P3..dt...\$.
006FCBE0 8B F8 83 C4 04 85 FF 0F 85 03 FF FF FF E8 CE 43 ...............C
006FCBF0 FE FF 85 C0 75 51 33 F6 EB 7A 8B 0D 7C 6B A1 00 ....uQ3..z..|k..
006FCC00 51 E8 0A 45 FE FF 83 C4 04 85 C0 74 3A 8B 54 24 Q..E.......t:.T$
006FCC10 10 A1 7C 6B A1 00 52 68 A0 63 8D 00 50 E8 AE 49 ..|k..Rh.c..P..I
006FCC20 FE FF 83 C4 0C EB 20 8B 4C 24 10 8B 15 2C 7E A1 ...... .L$...,~.
006FCC30 00 50 51 68 58 63 8D 00 52 E8 92 49 FE FF 83 C4 .PQhXc..R..I....
006FCC40 10 EB 04 8B 5C 24 14 85 FF 74 11 83 07 FF 75 0C ....\$...t....u.
006FCC50 8B 47 04 8B 48 18 57 FF D1 83 C4 04 85 F6 74 11 .G..H.W.......t.
006FCC60 83 06 FF 75 0C 8B 56 04 8B 42 18 56 FF D0 83 C4 ...u..V..B.V....
006FCC70 04 83 CE FF 83 03 FF 5F 5D 75 0C 8B 4B 04 8B 51 ......._]u..K..Q
006FCC80 18 53 FF D2 83 C4 04 8B C6 5E 5B 83 C4 08 C3 CC .S.......^[.....

;; fn006FCC90: 006FCC90
;;   Called from:
;;     006FDE4C (in fn006FDE40)
;;     006FDE95 (in fn006FDE60)
fn006FCC90 proc
	push	ecx
	push	ebx
	push	ebp
	mov	ebp,[esp+10h]
	test	ebp,ebp
	jz	6FCF00h

l006FCC9F:
	mov	eax,[ebp+4h]
	cmp	eax,0A1D1B8h
	jz	6FCCBFh

l006FCCA9:
	push	0A1D1B8h
	push	eax
	call	6D5670h
	add	esp,8h
	test	eax,eax
	jz	6FCF00h

l006FCCBF:
	mov	ebx,[esp+14h]
	test	ebx,ebx
	jz	6FCF00h

l006FCCCB:
	mov	eax,[ebx+4h]
	cmp	eax,0A1D1B8h
	push	esi
	push	edi
	jz	6FCE37h

l006FCCDB:
	push	0A1D1B8h
	push	eax
	call	6D5670h
	add	esp,8h
	test	eax,eax
	jnz	6FCE37h

l006FCCF1:
	push	eax
	push	8B0A10h
	push	ebx
	call	7038E0h
	mov	esi,eax
	add	esp,0Ch
	test	esi,esi
	jz	6FCE14h

l006FCD0A:
	push	esi
	call	704B00h
	add	esp,4h
	add	dword ptr [esi],0FFh
	mov	edi,eax
	jnz	6FCD26h

l006FCD1A:
	mov	eax,[esi+4h]
	mov	ecx,[eax+18h]
	push	esi
	call	ecx
	add	esp,4h

l006FCD26:
	test	edi,edi
	jz	6FCE14h

l006FCD2E:
	push	edi
	call	704040h
	mov	esi,eax
	add	esp,4h
	test	esi,esi
	jz	6FCDCBh

l006FCD41:
	cmp	dword ptr [esp+20h],0h
	jnz	6FCD69h

l006FCD48:
	push	esi
	push	ebp
	call	6FBCC0h
	add	esp,8h
	test	eax,eax
	jz	6FCD69h

l006FCD56:
	add	dword ptr [esi],0FFh
	jnz	6FCDB8h

l006FCD5B:
	mov	edx,[esi+4h]
	mov	eax,[edx+18h]
	push	esi
	call	eax
	add	esp,4h
	jmp	6FCDB8h

l006FCD69:
	push	esi
	push	ebx
	call	704220h
	mov	ebx,eax
	add	esp,8h
	test	ebx,ebx
	jz	6FCDF2h

l006FCD79:
	mov	ecx,[esp+18h]
	push	ebx
	push	esi
	push	ecx
	call	6FBD90h
	add	esp,0Ch
	add	dword ptr [esi],0FFh
	mov	ebp,eax
	jnz	6FCD9Bh

l006FCD8F:
	mov	edx,[esi+4h]
	mov	eax,[edx+18h]
	push	esi
	call	eax
	add	esp,4h

l006FCD9B:
	add	dword ptr [ebx],0FFh
	jnz	6FCDACh

l006FCDA0:
	mov	ecx,[ebx+4h]
	mov	edx,[ecx+18h]
	push	ebx
	call	edx
	add	esp,4h

l006FCDAC:
	test	ebp,ebp
	jl	6FCE1Dh

l006FCDB0:
	mov	ebx,[esp+1Ch]
	mov	ebp,[esp+18h]

l006FCDB8:
	push	edi
	call	704040h
	mov	esi,eax
	add	esp,4h
	test	esi,esi
	jnz	6FCD41h

l006FCDCB:
	add	dword ptr [edi],0FFh
	jnz	6FCDDCh

l006FCDD0:
	mov	eax,[edi+4h]
	mov	ecx,[eax+18h]
	push	edi
	call	ecx
	add	esp,4h

l006FCDDC:
	call	6E0FC0h
	test	eax,eax
	jz	6FCEF8h

l006FCDE9:
	pop	edi
	pop	esi
	pop	ebp
	or	eax,0FFh
	pop	ebx
	pop	ecx
	ret

l006FCDF2:
	add	dword ptr [edi],0FFh
	jnz	6FCE03h

l006FCDF7:
	mov	eax,[edi+4h]
	mov	ecx,[eax+18h]
	push	edi
	call	ecx
	add	esp,4h

l006FCE03:
	add	dword ptr [esi],0FFh
	jnz	6FCE14h

l006FCE08:
	mov	edx,[esi+4h]
	mov	eax,[edx+18h]
	push	esi
	call	eax
	add	esp,4h

l006FCE14:
	pop	edi
	pop	esi
	pop	ebp
	or	eax,0FFh
	pop	ebx
	pop	ecx
	ret

l006FCE1D:
	add	dword ptr [edi],0FFh
	jnz	6FCE14h

l006FCE22:
	mov	ecx,[edi+4h]
	mov	edx,[ecx+18h]
	push	edi
	call	edx
	add	esp,4h
	pop	edi
	pop	esi
	pop	ebp
	or	eax,0FFh
	pop	ebx
	pop	ecx
	ret

l006FCE37:
	cmp	ebx,ebp
	jz	6FCEF8h

l006FCE3F:
	mov	ecx,[ebx+0Ch]
	test	ecx,ecx
	jz	6FCEF8h

l006FCE4A:
	mov	edx,[ebp+0Ch]
	test	edx,edx
	jnz	6FCE59h

l006FCE51:
	mov	dword ptr [esp+20h],1h

l006FCE59:
	mov	eax,[ebp+8h]
	mov	esi,[ebp+10h]
	add	eax,ecx
	lea	eax,[eax+eax*2]
	lea	esi,[esi+esi+2h]
	cmp	eax,esi
	jl	6FCE7Eh

l006FCE6C:
	lea	eax,[edx+ecx]
	add	eax,eax
	push	ebp
	call	6FBB90h
	add	esp,4h
	test	eax,eax
	jnz	6FCE14h

l006FCE7E:
	cmp	dword ptr [ebx+10h],0h
	mov	dword ptr [esp+10h],0h
	jl	6FCEF8h

l006FCE8C:
	xor	ebp,ebp
	mov	edi,edi

l006FCE90:
	mov	esi,[ebx+14h]
	add	esi,ebp
	cmp	dword ptr [esi+8h],0h
	jz	6FCEE5h

l006FCE9B:
	cmp	dword ptr [esp+20h],0h
	jnz	6FCEB7h

l006FCEA2:
	mov	ecx,[esi+4h]
	mov	edx,[esp+18h]
	push	ecx
	push	edx
	call	6FBCC0h
	add	esp,8h
	test	eax,eax
	jnz	6FCEE5h

l006FCEB7:
	mov	eax,[esi+4h]
	add	dword ptr [eax],1h
	mov	eax,[esi+8h]
	add	dword ptr [eax],1h
	mov	eax,[esi+8h]
	mov	ecx,[esi]
	mov	ebx,[esi+4h]
	mov	edi,[esp+18h]
	push	eax
	push	ecx
	call	6FBA70h
	add	esp,8h
	test	eax,eax
	jnz	6FCE14h

l006FCEE1:
	mov	ebx,[esp+1Ch]

l006FCEE5:
	mov	eax,[esp+10h]
	add	eax,1h
	add	ebp,0Ch
	cmp	eax,[ebx+10h]
	mov	[esp+10h],eax
	jle	6FCE90h

l006FCEF8:
	pop	edi
	pop	esi
	pop	ebp
	xor	eax,eax
	pop	ebx
	pop	ecx
	ret

l006FCF00:
	push	54Bh
	push	8D6320h
	call	6E1DC0h
	add	esp,8h
	pop	ebp
	or	eax,0FFh
	pop	ebx
	pop	ecx
	ret
006FCF19                            CC CC CC CC CC CC CC          .......

;; fn006FCF20: 006FCF20
;;   Called from:
;;     006E5C2D (in fn006E5C00)
;;     006F956F (in fn006F9540)
;;     006F95AB (in fn006F9540)
;;     006F95FA (in fn006F9540)
;;     006F964A (in fn006F9540)
;;     00727767 (in fn007276E0)
;;     00728ACD (in fn00728AC0)
;;     00728BAE (in fn00728B50)
;;     00728BC8 (in fn00728B50)
;;     00728CC0 (in fn00728BE0)
;;     00728ECE (in fn00728E40)
;;     007360AA (in fn00735890)
;;     00738A10 (in fn007389B0)
fn006FCF20 proc
	push	esi
	mov	esi,[esp+8h]
	test	esi,esi
	jz	6FCF4Ah

l006FCF29:
	mov	eax,[esi+4h]
	cmp	eax,0A1D1B8h
	jz	6FCF45h

l006FCF33:
	push	0A1D1B8h
	push	eax
	call	6D5670h
	add	esp,8h
	test	eax,eax
	jz	6FCF4Ah

l006FCF45:
	mov	eax,[esi+0Ch]
	pop	esi
	ret

l006FCF4A:
	push	5BBh
	push	8D6320h
	call	6E1DC0h
	add	esp,8h
	or	eax,0FFh
	pop	esi
	ret
006FCF61    CC CC CC CC CC CC CC CC CC CC CC CC CC CC CC  ...............
006FCF70 56 8B 74 24 08 85 F6 74 27 8B 46 04 3D B8 D1 A1 V.t$...t'.F.=...
006FCF80 00 74 12 68 B8 D1 A1 00 50 E8 E2 86 FD FF 83 C4 .t.h....P.......
006FCF90 08 85 C0 74 0B 56 E8 75 F7 FF FF 83 C4 04 5E C3 ...t.V.u......^.
006FCFA0 68 C5 05 00 00 68 20 63 8D 00 E8 11 4E FE FF 83 h....h c....N...
006FCFB0 C4 08 33 C0 5E C3 CC CC CC CC CC CC CC CC CC CC ..3.^...........
006FCFC0 83 EC 08 53 55 8B 6C 24 14 56 57 33 FF 33 DB 39 ...SU.l$.VW3.3.9
006FCFD0 7D 10 89 7C 24 1C 89 7C 24 10 0F 8C 06 01 00 00 }..|$..|$.......
006FCFE0 89 7C 24 14 8B 45 14 03 C7 83 78 08 00 0F 84 D4 .|$..E....x.....
006FCFF0 00 00 00 8B 70 04 83 06 01 85 DB 74 40 6A 00 56 ....p......t@j.V
006FD000 53 E8 9A 25 FE FF 83 C4 0C 85 C0 0F 8C E9 00 00 S..%............
006FD010 00 7F 13 8B 4C 24 10 3B 4D 10 7F 0A 8B 55 14 83 ....L$.;M....U..
006FD020 7C 17 08 00 75 17 83 06 FF 0F 85 98 00 00 00 8B |...u...........
006FD030 46 04 8B 48 18 56 FF D1 E9 87 00 00 00 8B 55 14 F..H.V........U.
006FD040 8B 44 24 20 8B 7C 17 08 83 07 01 56 50 E8 6E EC .D$ .|.....VP.n.
006FD050 FF FF 83 C4 08 85 C0 74 16 6A 02 50 57 E8 3E 25 .......t.j.PW.>%
006FD060 FE FF 83 C4 0C 85 C0 0F 8C 9D 00 00 00 75 36 85 .............u6.
006FD070 DB 74 11 83 03 FF 75 0C 8B 4B 04 8B 51 18 53 FF .t....u..K..Q.S.
006FD080 D2 83 C4 04 8B 44 24 1C 85 C0 74 11 83 00 FF 75 .....D$...t....u
006FD090 0C 8B 48 04 8B 51 18 50 FF D2 83 C4 04 8B DE 89 ..H..Q.P........
006FD0A0 7C 24 1C EB 22 83 06 FF 75 0C 8B 46 04 8B 48 18 |$.."...u..F..H.
006FD0B0 56 FF D1 83 C4 04 83 07 FF 75 0C 8B 57 04 8B 42 V........u..W..B
006FD0C0 18 57 FF D0 83 C4 04 8B 44 24 10 8B 7C 24 14 83 .W......D$..|$..
006FD0D0 C0 01 83 C7 0C 3B 45 10 89 44 24 10 89 7C 24 14 .....;E..D$..|$.
006FD0E0 0F 8E FE FE FF FF 8B 4C 24 24 8B 54 24 1C 5F 5E .......L$$.T$._^
006FD0F0 5D 8B C3 89 11 5B 83 C4 08 C3 83 06 FF 75 2D 8B ]....[.......u-.
006FD100 4E 04 8B 51 18 56 FF D2 EB 1F 83 06 FF 75 0C 8B N..Q.V.......u..
006FD110 46 04 8B 48 18 56 FF D1 83 C4 04 83 07 FF 75 0C F..H.V........u.
006FD120 8B 57 04 8B 42 18 57 FF D0 83 C4 04 85 DB 74 11 .W..B.W.......t.
006FD130 83 03 FF 75 0C 8B 4B 04 8B 51 18 53 FF D2 83 C4 ...u..K..Q.S....
006FD140 04 8B 44 24 1C 85 C0 74 11 83 00 FF 75 0C 8B 48 ..D$...t....u..H
006FD150 04 8B 51 18 50 FF D2 83 C4 04 8B 44 24 24 5F 5E ..Q.P......D$$_^
006FD160 5D C7 00 00 00 00 00 33 C0 5B 83 C4 08 C3 CC CC ]......3.[......
006FD170 53 8B 5C 24 0C 8B 4B 0C 56 8B 74 24 0C 8B 46 0C S.\$..K.V.t$..F.
006FD180 3B C1 7D 06 5E 83 C8 FF 5B C3 7E 08 5E B8 01 00 ;.}.^...[.~.^...
006FD190 00 00 5B C3 55 57 8D 44 24 18 50 53 33 ED 56 89 ..[.UW.D$.PS3.V.
006FD1A0 6C 24 20 E8 18 FE FF FF 8B F8 83 C4 0C 85 FF 75 l$ ............u
006FD1B0 0D E8 0A 3E FE FF 8B D8 F7 DB 1B DB EB 77 8D 4C ...>.........w.L
006FD1C0 24 14 51 56 53 E8 F6 FD FF FF 8B 6C 24 20 8B F0 $.QVS......l$ ..
006FD1D0 83 C4 0C 85 F6 75 0E E8 E4 3D FE FF 85 C0 74 05 .....u...=....t.
006FD1E0 83 CB FF EB 2A 33 DB 85 F6 74 10 56 57 E8 DE 21 ....*3...t.VW..!
006FD1F0 FE FF 8B D8 83 C4 08 85 DB 75 14 85 ED 74 10 8B .........u...t..
006FD200 54 24 18 55 52 E8 C6 21 FE FF 83 C4 08 8B D8 83 T$.UR..!........
006FD210 07 FF 75 0C 8B 47 04 8B 48 18 57 FF D1 83 C4 04 ..u..G..H.W.....
006FD220 85 F6 74 11 83 06 FF 75 0C 8B 56 04 8B 42 18 56 ..t....u..V..B.V
006FD230 FF D0 83 C4 04 8B 44 24 18 85 C0 74 11 83 00 FF ......D$...t....
006FD240 75 0C 8B 48 04 8B 51 18 50 FF D2 83 C4 04 85 ED u..H..Q.P.......
006FD250 74 12 83 45 00 FF 75 0C 8B 45 04 8B 48 18 55 FF t..E..u..E..H.U.
006FD260 D1 83 C4 04 5F 5D 5E 8B C3 5B C3 CC CC CC CC CC ...._]^..[......
006FD270 51 8B 4C 24 0C 55 8B 6C 24 0C 8B 45 0C 3B 41 0C Q.L$.U.l$..E.;A.
006FD280 74 05 33 C0 5D 59 C3 53 33 C0 39 45 10 56 57 89 t.3.]Y.S3.9E.VW.
006FD290 44 24 18 0F 8C 80 00 00 00 89 44 24 10 8D 49 00 D$........D$..I.
006FD2A0 8B 55 14 8B 7C 10 08 03 C2 85 FF 74 51 8B 70 04 .U..|......tQ.p.
006FD2B0 8B 44 24 1C 83 07 01 83 06 01 56 50 E8 FF E9 FF .D$.......VP....
006FD2C0 FF 83 C4 08 83 06 FF 8B D8 75 0C 8B 4E 04 8B 51 .........u..N..Q
006FD2D0 18 56 FF D2 83 C4 04 85 DB 74 49 6A 02 53 57 E8 .V.......tIj.SW.
006FD2E0 BC 22 FE FF 83 C4 0C 83 07 FF 8B F0 75 0C 8B 47 ."..........u..G
006FD2F0 04 8B 48 18 57 FF D1 83 C4 04 85 F6 7E 3F 8B 4C ..H.W.......~?.L
006FD300 24 18 8B 44 24 10 83 C1 01 83 C0 0C 3B 4D 10 89 $..D$.......;M..
006FD310 4C 24 18 89 44 24 10 7E 87 5F 5E 5B B8 01 00 00 L$..D$.~._^[....
006FD320 00 5D 59 C3 83 07 FF 75 0C 8B 57 04 8B 42 18 57 .]Y....u..W..B.W
006FD330 FF D0 83 C4 04 5F 5E 5B 33 C0 5D 59 C3 5F 8B C6 ....._^[3.]Y._..
006FD340 5E 5B 5D 59 C3 CC CC CC CC CC CC CC CC CC CC CC ^[]Y............
006FD350 53 8B 5C 24 08 8B 43 04 3D B8 D1 A1 00 56 57 74 S.\$..C.=....VWt
006FD360 12 68 B8 D1 A1 00 50 E8 04 83 FD FF 83 C4 08 85 .h....P.........
006FD370 C0 74 20 8B 7C 24 14 8B 47 04 3D B8 D1 A1 00 74 .t .|$..G.=....t
006FD380 1E 68 B8 D1 A1 00 50 E8 E4 82 FD FF 83 C4 08 85 .h....P.........
006FD390 C0 75 0C 5F B8 80 64 A1 00 83 00 01 5E 5B C3 8B .u._..d.....^[..
006FD3A0 74 24 18 83 FE 02 74 05 83 FE 03 75 E6 57 53 E8 t$....t....u.WS.
006FD3B0 BC FE FF FF 83 C4 08 85 C0 7D 06 5F 5E 33 C0 5B .........}._^3.[
006FD3C0 C3 33 C9 83 FE 02 0F 94 C1 3B C1 B8 E4 91 A1 00 .3.......;......
006FD3D0 74 05 B8 D8 91 A1 00 83 00 01 5F 5E 5B C3 CC CC t........._^[...
006FD3E0 56 8B 74 24 0C 81 7E 04 50 B4 A1 00 75 08 8B 46 V.t$..~.P...u..F
006FD3F0 0C 83 F8 FF 75 12 56 E8 E4 0E FE FF 83 C4 04 83 ....u.V.........
006FD400 F8 FF 75 04 33 C0 5E C3 50 8B 44 24 0C 56 50 8B ..u.3.^.P.D$.VP.
006FD410 40 18 FF D0 83 C4 0C 85 C0 74 E9 33 C9 39 48 08 @........t.3.9H.
006FD420 0F 95 C1 51 E8 37 7F FE FF 83 C4 04 5E C3 CC CC ...Q.7......^...
006FD430 83 EC 08 8B 54 24 10 8D 44 24 04 50 8D 4C 24 04 ....T$..D$.P.L$.
006FD440 51 6A 02 6A 01 68 3C 18 8B 00 52 C7 44 24 1C B8 Qj.j.h<...R.D$..
006FD450 63 A1 00 E8 78 86 FE FF 83 C4 18 85 C0 75 06 33 c...x........u.3
006FD460 C0 83 C4 08 C3 8B 0C 24 81 79 04 50 B4 A1 00 75 .......$.y.P...u
006FD470 08 8B 41 0C 83 F8 FF 75 11 51 E8 61 0E FE FF 83 ..A....u.Q.a....
006FD480 C4 04 83 F8 FF 74 D8 8B 0C 24 50 8B 44 24 10 51 .....t...$P.D$.Q
006FD490 50 8B 40 18 FF D0 83 C4 0C 85 C0 74 C2 8B 40 08 P.@........t..@.
006FD4A0 85 C0 0F 44 44 24 04 83 00 01 83 C4 08 C3 CC CC ...DD$..........
006FD4B0 83 EC 08 8B 54 24 10 8D 44 24 04 50 8D 4C 24 04 ....T$..D$.P.L$.
006FD4C0 51 6A 02 6A 01 68 14 63 8D 00 52 C7 44 24 1C B8 Qj.j.h.c..R.D$..
006FD4D0 63 A1 00 E8 F8 85 FE FF 83 C4 18 85 C0 75 06 33 c............u.3
006FD4E0 C0 83 C4 08 C3 8B 0C 24 81 79 04 50 B4 A1 00 75 .......$.y.P...u
006FD4F0 08 8B 41 0C 83 F8 FF 75 11 51 E8 E1 0D FE FF 83 ..A....u.Q......
006FD500 C4 04 83 F8 FF 74 D8 8B 0C 24 57 8B 7C 24 10 50 .....t...$W.|$.P
006FD510 8B 47 18 51 57 FF D0 83 C4 0C 85 C0 75 05 5F 83 .G.QW.......u._.
006FD520 C4 08 C3 56 8B 70 08 85 F6 75 25 8B 74 24 0C 8B ...V.p...u%.t$..
006FD530 4C 24 08 56 51 57 E8 55 E8 FF FF 83 C4 0C 85 C0 L$.VQW.U........
006FD540 74 0A 33 F6 8B C6 5E 5F 83 C4 08 C3 85 F6 74 03 t.3...^_......t.
006FD550 83 06 01 8B C6 5E 5F 83 C4 08 C3 CC CC CC CC CC .....^_.........
006FD560 8B 44 24 04 50 E8 C6 E9 FF FF 83 05 B8 63 A1 00 .D$.P........c..
006FD570 01 83 C4 04 B8 B8 63 A1 00 C3 CC CC CC CC CC CC ......c.........
006FD580 83 EC 08 8B 54 24 10 8D 04 24 50 8D 4C 24 08 51 ....T$...$P.L$.Q
006FD590 6A 02 6A 01 68 70 98 8C 00 52 C7 44 24 18 00 00 j.j.hp...R.D$...
006FD5A0 00 00 E8 29 85 FE FF 83 C4 18 85 C0 75 04 83 C4 ...)........u...
006FD5B0 08 C3 56 8B 74 24 10 83 7E 0C 00 75 22 8B 44 24 ..V.t$..~..u".D$
006FD5C0 04 85 C0 75 5E A1 28 7E A1 00 68 E8 63 8D 00 50 ...u^.(~..h.c..P
006FD5D0 E8 AB 39 FE FF 83 C4 08 33 C0 5E 83 C4 08 C3 8B ..9.....3.^.....
006FD5E0 4C 24 08 81 79 04 50 B4 A1 00 75 08 8B 41 0C 83 L$..y.P...u..A..
006FD5F0 F8 FF 75 12 51 E8 E6 0C FE FF 83 C4 04 83 F8 FF ..u.Q...........
006FD600 74 36 8B 4C 24 08 50 51 8B 4E 18 56 FF D1 83 C4 t6.L$.PQ.N.V....
006FD610 0C 85 C0 74 23 83 78 08 00 75 24 8B 44 24 04 85 ...t#.x..u$.D$..
006FD620 C0 74 0C 83 00 01 8B 44 24 04 5E 83 C4 08 C3 8B .t.....D$.^.....
006FD630 44 24 08 E8 28 E1 FF FF 33 C0 5E 83 C4 08 C3 8B D$..(...3.^.....
006FD640 48 04 8B 15 F8 CC A6 00 83 02 01 57 8B 78 08 89 H..........W.x..
006FD650 50 04 C7 40 08 00 00 00 00 83 46 0C FF 83 01 FF P..@......F.....
006FD660 75 0C 8B 51 04 8B 42 18 51 FF D0 83 C4 04 8B C7 u..Q..B.Q.......
006FD670 5F 5E 83 C4 08 C3 CC CC CC CC CC CC CC CC CC CC _^..............
006FD680 56 6A 02 33 F6 E8 96 26 FE FF 83 C4 04 85 C0 75 Vj.3...&.......u
006FD690 02 5E C3 57 8B 7C 24 0C 39 77 0C 75 29 83 00 FF .^.W.|$.9w.u)...
006FD6A0 75 0C 8B 48 04 8B 51 18 50 FF D2 83 C4 04 A1 28 u..H..Q.P......(
006FD6B0 7E A1 00 68 04 64 8D 00 50 E8 C2 38 FE FF 83 C4 ~..h.d..P..8....
006FD6C0 08 5F 33 C0 5E C3 8B 4F 14 39 71 08 75 3E 8B 31 ._3.^..O.9q.u>.1
006FD6D0 53 8B 5F 10 3B F3 7F 05 83 FE 01 7D 05 BE 01 00 S._.;......}....
006FD6E0 00 00 8D 14 76 83 7C 91 08 00 8D 0C 91 75 1C 8B ....v.|......u..
006FD6F0 57 14 83 C6 01 3B F3 7E 05 BE 01 00 00 00 8D 0C W....;.~........
006FD700 76 83 7C 8A 08 00 8D 0C 8A 74 E7 5B 8B 51 04 89 v.|......t.[.Q..
006FD710 50 0C 8B 51 08 89 50 10 8B 15 F8 CC A6 00 83 02 P..Q..P.........
006FD720 01 89 51 04 C7 41 08 00 00 00 00 83 47 0C FF 8B ..Q..A......G...
006FD730 4F 14 83 C6 01 5F 89 31 5E C3 CC CC CC CC CC CC O...._.1^.......
006FD740 83 EC 0C 53 8B 5C 24 14 56 57 8D 44 24 0C 50 8D ...S.\$.VW.D$.P.
006FD750 4C 24 14 51 8D 54 24 1C 52 53 C7 44 24 24 00 00 L$.Q.T$.RS.D$$..
006FD760 00 00 E8 E9 E8 FF FF 83 C4 10 85 C0 74 4A 8B 74 ............tJ.t
006FD770 24 24 8B 7C 24 20 8B 44 24 10 85 C0 74 0B 56 50 $$.|$ .D$...t.VP
006FD780 FF D7 83 C4 08 85 C0 75 31 8B 44 24 0C 85 C0 74 .......u1.D$...t
006FD790 0B 56 50 FF D7 83 C4 08 85 C0 75 1E 8D 44 24 0C .VP.......u..D$.
006FD7A0 50 8D 4C 24 14 51 8D 54 24 1C 52 53 E8 9F E8 FF P.L$.Q.T$.RS....
006FD7B0 FF 83 C4 10 85 C0 75 BE 33 C0 5F 5E 5B 83 C4 0C ......u.3._^[...
006FD7C0 C3 CC CC CC CC CC CC CC CC CC CC CC CC CC CC CC ................
006FD7D0 8B 44 24 04 50 E8 56 E7 FF FF 83 C4 04 33 C0 C3 .D$.P.V......3..
006FD7E0 56 8B 74 24 0C 81 7E 04 50 B4 A1 00 75 08 8B 46 V.t$..~.P...u..F
006FD7F0 0C 83 F8 FF 75 13 56 E8 E4 0A FE FF 83 C4 04 83 ....u.V.........
006FD800 F8 FF 75 05 83 C8 FF 5E C3 50 8B 44 24 0C 56 50 ..u....^.P.D$.VP
006FD810 8B 40 18 FF D0 83 C4 0C 85 C0 74 E8 33 C9 39 48 .@........t.3.9H
006FD820 08 5E 0F 95 C1 8B C1 C3 CC CC CC CC CC CC CC CC .^..............
006FD830 8B 44 24 0C 8B 4C 24 08 50 8B 44 24 08 8B 50 18 .D$..L$.P.D$..P.
006FD840 51 50 FF D2 83 C4 0C 85 C0 75 04 83 C8 FF C3 33 QP.......u.....3
006FD850 C9 39 48 08 0F 95 C1 8B C1 C3 CC CC CC CC CC CC .9H.............
006FD860 8B 44 24 04 6A 00 50 8B 80 98 00 00 00 FF D0 83 .D$.j.P.........
006FD870 C4 08 85 C0 74 14 8D 48 1C 89 48 14 C7 40 10 07 ....t..H..H..@..
006FD880 00 00 00 C7 40 18 60 B9 6F 00 C3 CC CC CC CC CC ....@.`.o.......
006FD890 A1 7C 6B A1 00 68 24 64 8D 00 50 E8 E0 36 FE FF .|k..h$d..P..6..
006FD8A0 83 C4 08 83 C8 FF C3 CC CC CC CC CC CC CC CC CC ................

;; fn006FD8B0: 006FD8B0
;;   Called from:
;;     006E198C (in fn006E1970)
;;     006E1A11 (in fn006E19F0)
;;     006E7D16 (in fn006E7CE0)
;;     006F5DF4 (in fn006F5DD0)
;;     006F5E5D (in fn006F5DD0)
;;     006F5F0E (in fn006F5DD0)
;;     006F5F3A (in fn006F5DD0)
;;     006F619E (in fn006F5DD0)
;;     006F6208 (in fn006F5DD0)
;;     006F630E (in fn006F62D0)
;;     006F63C7 (in fn006F63A0)
;;     006F6461 (in fn006F6440)
;;     006F64D9 (in fn006F6490)
;;     006F6580 (in fn006F6490)
;;     006F7068 (in fn006F6EA0)
;;     006F7115 (in fn006F7100)
;;     006F7822 (in fn006F7810)
;;     006F838E (in fn006F82C0)
;;     006F848F (in fn006F8440)
;;     00708C3C (in fn00708C10)
;;     00708CCD (in fn00708C10)
;;     0070A816 (in fn00708DC0)
;;     0070BEC3 (in fn0070BCC0)
;;     00715DE6 (in fn00715DD0)
;;     00715E06 (in fn00715DF0)
;;     00715E6B (in fn00715E50)
;;     00716A56 (in fn00716A00)
;;     007172B7 (in fn00717280)
;;     0074EFDF (in fn0074EFB0)
;;     0074FA7A (in fn0074F9E0)
fn006FD8B0 proc
	mov	eax,[esp+8h]
	push	esi
	push	eax
	call	6ECAC0h
	mov	esi,eax
	add	esp,4h
	test	esi,esi
	jnz	6FD8C6h

l006FD8C4:
	pop	esi
	ret

l006FD8C6:
	mov	ecx,[esp+8h]
	push	edi
	push	esi
	push	ecx
	call	6FBCC0h
	add	esp,8h
	add	dword ptr [esi],0FFh
	mov	edi,eax
	jnz	6FD8E8h

l006FD8DC:
	mov	edx,[esi+4h]
	mov	eax,[edx+18h]
	push	esi
	call	eax
	add	esp,4h

l006FD8E8:
	mov	eax,edi
	pop	edi
	pop	esi
	ret
006FD8ED                                        CC CC CC              ...

;; fn006FD8F0: 006FD8F0
;;   Called from:
;;     006EA03A (in fn006E9FA0)
;;     006F5E4F (in fn006F5DD0)
;;     006F5ED2 (in fn006F5DD0)
;;     006F5F24 (in fn006F5DD0)
;;     006F5F8F (in fn006F5DD0)
;;     006F61FA (in fn006F5DD0)
;;     006F6264 (in fn006F5DD0)
;;     006F6361 (in fn006F62D0)
;;     006F6403 (in fn006F63A0)
;;     006F64F1 (in fn006F6490)
;;     006F652B (in fn006F6490)
;;     006F6E23 (in fn006F6D50)
;;     006F70EA (in fn006F70C0)
;;     006F7162 (in fn006F7100)
;;     006F89F1 (in fn006F8960)
;;     006F8A08 (in fn006F8960)
;;     0070BEDD (in fn0070BCC0)
;;     00715E8E (in fn00715E50)
;;     007171BD (in fn00717180)
;;     007171D7 (in fn00717180)
;;     0073B074 (in fn0073AFB0)
;;     0074E1E3 (in fn0074E190)
fn006FD8F0 proc
	push	ecx
	mov	eax,[esp+0Ch]
	push	eax
	call	6ECAC0h
	add	esp,4h
	test	eax,eax
	mov	[esp],eax
	jnz	6FD90Ah

l006FD905:
	or	eax,0FFh
	pop	ecx
	ret

l006FD90A:
	lea	ecx,[esp]
	push	esi
	push	ecx
	call	6EC890h
	mov	edx,[esp+18h]
	mov	eax,[esp+8h]
	mov	ecx,[esp+10h]
	push	edx
	push	eax
	push	ecx
	call	6FBD90h
	mov	esi,eax
	mov	eax,[esp+14h]
	add	dword ptr [eax],0FFh
	mov	eax,[esp+14h]
	add	esp,10h
	cmp	dword ptr [eax],0h
	jnz	6FD949h

l006FD93D:
	mov	edx,[eax+4h]
	push	eax
	mov	eax,[edx+18h]
	call	eax
	add	esp,4h

l006FD949:
	mov	eax,esi
	pop	esi
	pop	ecx
	ret
006FD94E                                           CC CC               ..

;; fn006FD950: 006FD950
;;   Called from:
;;     006F646F (in fn006F6440)
;;     00715E7C (in fn00715E50)
fn006FD950 proc
	mov	eax,[esp+8h]
	push	esi
	push	eax
	call	6ECAC0h
	mov	esi,eax
	add	esp,4h
	test	esi,esi
	jnz	6FD969h

l006FD964:
	or	eax,0FFh
	pop	esi
	ret

l006FD969:
	mov	ecx,[esp+8h]
	push	edi
	push	esi
	push	ecx
	call	6FBE60h
	add	esp,8h
	add	dword ptr [esi],0FFh
	mov	edi,eax
	jnz	6FD98Bh

l006FD97F:
	mov	edx,[esi+4h]
	mov	eax,[edx+18h]
	push	esi
	call	eax
	add	esp,4h

l006FD98B:
	mov	eax,edi
	pop	edi
	pop	esi
	ret
006FD990 56 53 E8 E9 03 FE FF 8B F0 83 C4 04 85 F6 74 4D VS............tM
006FD9A0 83 07 01 81 FB 50 D4 A1 00 89 7E 08 8B 47 0C 89 .....P....~..G..
006FD9B0 46 0C C7 46 10 00 00 00 00 8B 4F 0C 89 4E 18 75 F..F......O..N.u
006FD9C0 30 68 B8 63 A1 00 68 B8 63 A1 00 6A 02 E8 AE 25 0h.c..h.c..j...%
006FD9D0 FE FF 83 C4 0C 85 C0 89 46 14 75 1C 83 06 FF 75 ........F.u....u
006FD9E0 0C 8B 56 04 8B 42 18 56 FF D0 83 C4 04 33 C0 5E ..V..B.V.....3.^
006FD9F0 C3 C7 46 14 00 00 00 00 8B C6 5E C3 CC CC CC CC ..F.......^.....
006FDA00 56 8B 74 24 08 83 7E 08 00 74 1A 8B 46 08 83 00 V.t$..~..t..F...
006FDA10 FF 8B 46 08 83 38 00 75 0C 8B 48 04 8B 51 18 50 ..F..8.u..H..Q.P
006FDA20 FF D2 83 C4 04 83 7E 14 00 74 1A 8B 46 14 83 00 ......~..t..F...
006FDA30 FF 8B 46 14 83 38 00 75 0C 8B 48 04 8B 51 18 50 ..F..8.u..H..Q.P
006FDA40 FF D2 83 C4 04 56 E8 75 5F 02 00 83 C4 04 5E C3 .....V.u_.....^.
006FDA50 8B 4C 24 04 8B 41 08 33 D2 85 C0 74 0D 56 8B 71 .L$..A.3...t.V.q
006FDA60 0C 3B 70 0C 5E 75 03 8B 51 18 89 54 24 04 E9 8D .;p.^u..Q..T$...
006FDA70 76 00 00 CC CC CC CC CC CC CC CC CC CC CC CC CC v...............
006FDA80 56 8B 74 24 08 57 8B 7E 08 85 FF 74 23 8B 46 0C V.t$.W.~...t#.F.
006FDA90 3B 47 0C 74 20 8B 0D E0 75 A1 00 68 40 64 8D 00 ;G.t ...u..h@d..
006FDAA0 51 E8 DA 34 FE FF 83 C4 08 C7 46 0C FF FF FF FF Q..4......F.....
006FDAB0 5F 33 C0 5E C3 8B 46 10 85 C0 53 7C 2C 8B 4F 10 _3.^..F...S|,.O.
006FDAC0 3B C1 8B 5F 14 7F 18 8D 14 40 8D 54 93 08 8B FF ;.._.....@.T....
006FDAD0 83 3A 00 75 0A 83 C0 01 83 C2 0C 3B C1 7E F1 3B .:.u.......;.~.;
006FDAE0 C1 8D 50 01 89 56 10 7E 1E 83 07 FF 75 0C 8B 47 ..P..V.~....u..G
006FDAF0 04 8B 48 18 57 FF D1 83 C4 04 5B 5F C7 46 08 00 ..H.W.....[_.F..
006FDB00 00 00 00 33 C0 5E C3 83 46 18 FF 8D 14 40 8B 44 ...3.^..F....@.D
006FDB10 93 04 83 00 01 5B 5F 5E C3 CC CC CC CC CC CC CC .....[_^........
006FDB20 56 57 8B 7C 24 0C 8B 77 08 85 F6 74 23 8B 47 0C VW.|$..w...t#.G.
006FDB30 3B 46 0C 74 20 8B 0D E0 75 A1 00 68 40 64 8D 00 ;F.t ...u..h@d..
006FDB40 51 E8 3A 34 FE FF 83 C4 08 C7 47 0C FF FF FF FF Q.:4......G.....
006FDB50 5F 33 C0 5E C3 8B 4F 10 85 C9 53 8B 5E 10 7C 35 _3.^..O...S.^.|5
006FDB60 3B CB 7F 31 8B 46 14 8D 14 49 8D 54 90 08 8B 02 ;..1.F...I.T....
006FDB70 85 C0 75 10 83 C1 01 83 C2 0C 3B CB 7F 17 8B 02 ..u.......;.....
006FDB80 85 C0 74 F0 83 47 18 FF 83 C1 01 5B 89 4F 10 83 ..t..G.....[.O..
006FDB90 00 01 5F 5E C3 83 06 FF 75 0C 8B 46 04 8B 48 18 .._^....u..F..H.
006FDBA0 56 FF D1 83 C4 04 5B C7 47 08 00 00 00 00 5F 33 V.....[.G....._3
006FDBB0 C0 5E C3 CC CC CC CC CC CC CC CC CC CC CC CC CC .^..............
006FDBC0 53 8B 5C 24 08 8B 53 08 85 D2 57 8B 7B 14 74 23 S.\$..S...W.{.t#
006FDBD0 8B 43 0C 3B 42 0C 74 20 8B 0D E0 75 A1 00 68 40 .C.;B.t ...u..h@
006FDBE0 64 8D 00 51 E8 97 33 FE FF 83 C4 08 C7 43 0C FF d..Q..3......C..
006FDBF0 FF FF FF 5F 33 C0 5B C3 55 56 8B 73 10 85 F6 7C ..._3.[.UV.s...|
006FDC00 2A 8B 42 10 3B F0 8B 6A 14 7F 16 8D 0C 76 8D 4C *.B.;..j.....v.L
006FDC10 8D 08 83 39 00 75 0A 83 C6 01 83 C1 0C 3B F0 7E ...9.u.......;.~
006FDC20 F1 3B F0 8D 4E 01 89 4B 10 7E 1F 83 02 FF 75 0C .;..N..K.~....u.
006FDC30 8B 42 04 8B 48 18 52 FF D1 83 C4 04 C7 43 08 00 .B..H.R......C..
006FDC40 00 00 00 5E 5D 5F 33 C0 5B C3 83 3F 01 75 3C 8B ...^]_3.[..?.u<.
006FDC50 47 0C C7 07 02 00 00 00 83 00 FF 8B 47 0C 83 38 G...........G..8
006FDC60 00 75 0C 8B 50 04 50 8B 42 18 FF D0 83 C4 04 8B .u..P.P.B.......
006FDC70 47 10 83 00 FF 8B 47 10 83 38 00 75 1E 8B 48 04 G.....G..8.u..H.
006FDC80 8B 51 18 50 FF D2 83 C4 04 EB 10 6A 02 E8 8E 20 .Q.P.......j... 
006FDC90 FE FF 8B F8 83 C4 04 85 FF 74 A8 83 43 18 FF 8D .........t..C...
006FDCA0 04 76 8D 4C 85 00 8B 41 04 8B 49 08 83 00 01 83 .v.L...A..I.....
006FDCB0 01 01 5E 89 47 0C 5D 89 4F 10 8B C7 5F 5B C3 CC ..^.G.].O..._[..

;; fn006FDCC0: 006FDCC0
;;   Called from:
;;     006E99B7 (in fn006E99A0)
;;     006EC8DD (in fn006EC890)
;;     006F62D9 (in fn006F62D0)
;;     006FDE86 (in fn006FDE60)
;;     00707959 (in fn00707950)
;;     0070A7B1 (in fn00708DC0)
;;     0070B6D0 (in fn0070B600)
;;     007171A6 (in fn00717180)
;;     0071726B (in fn00717230)
;;     00726262 (in fn00726260)
;;     00726351 (in fn00726340)
;;     00728F13 (in fn00728E40)
;;     00728F23 (in fn00728E40)
;;     007365B4 (in fn00736590)
;;     00736E4B (in fn007367D0)
;;     0073B05E (in fn0073AFB0)
;;     0073B1A1 (in fn0073AFB0)
;;     0073B3E8 (in fn0073B3D0)
;;     00747373 (in fn00747330)
;;     00747CB5 (in fn00747CA0)
;;     00747CC8 (in fn00747CA0)
;;     00747CD9 (in fn00747CA0)
;;     00747CEA (in fn00747CA0)
;;     00747CFB (in fn00747CA0)
;;     00747F61 (in fn00747F60)
;;     00747F6F (in fn00747F60)
;;     00748699 (in fn00748670)
;;     0074E9A0 (in fn0074E980)
;;     0074E9A8 (in fn0074E980)
fn006FDCC0 proc
	push	ebx
	xor	ebx,ebx
	cmp	[0A6CCF8h],ebx
	jnz	6FDCE5h

l006FDCCB:
	push	8D646Ch
	call	6ECAC0h
	add	esp,4h
	cmp	eax,ebx
	mov	[0A6CCF8h],eax
	jnz	6FDCE5h

l006FDCE1:
	xor	eax,eax
	pop	ebx
	ret

l006FDCE5:
	mov	eax,[0A6CCFCh]
	cmp	eax,ebx
	push	esi
	push	edi
	jz	6FDD75h

l006FDCF4:
	mov	esi,[0A6CBB4h+eax*4]
	sub	eax,1h
	cmp	[esi+8h],ebx
	mov	[0A6CCFCh],eax
	mov	dword ptr [esi],1h
	jz	6FDD2Dh

l006FDD0E:
	push	60h
	push	ebx
	lea	edi,[esi+1Ch]
	push	edi
	call	695020h
	mov	dword ptr [esi+10h],7h
	mov	[esi+14h],edi
	mov	[esi+0Ch],ebx
	mov	[esi+8h],ebx
	add	esp,0Ch

l006FDD2D:
	lea	edi,[esi-10h]
	mov	dword ptr [esi+18h],6FB960h
	cmp	dword ptr [edi+8h],0FEh
	jz	6FDD4Ah

l006FDD3D:
	push	8D0E04h
	call	6E86F0h
	add	esp,4h

l006FDD4A:
	mov	dword ptr [edi+8h],0FFFFFFFDh
	mov	eax,[0A1D558h]
	mov	[edi],eax
	mov	ecx,[0A1D558h]
	mov	eax,[ecx+4h]
	mov	[edi+4h],eax
	mov	[eax],edi
	mov	edx,[0A1D558h]
	mov	[edx+4h],edi
	pop	edi
	mov	eax,esi
	pop	esi
	pop	ebx
	ret

l006FDD75:
	push	0A1D1B8h
	call	6FEF30h
	mov	esi,eax
	add	esp,4h
	cmp	esi,ebx
	jnz	6FDD0Eh

l006FDD88:
	pop	edi
	pop	esi
	xor	eax,eax
	pop	ebx
	ret
006FDD8E                                           CC CC               ..
006FDD90 51 56 8D 44 24 04 50 6A 01 33 F6 56 51 52 C7 44 QV.D$.Pj.3.VQR.D
006FDDA0 24 18 00 00 00 00 E8 25 7D FE FF 83 C4 14 85 C0 $......%}.......
006FDDB0 75 06 83 C8 FF 5E 59 C3 8B 44 24 04 85 C0 74 35 u....^Y..D$...t5
006FDDC0 68 10 0A 8B 00 50 E8 F5 19 FE FF 83 C4 08 85 C0 h....P..........
006FDDD0 6A 01 74 0D 8B 44 24 08 50 57 E8 B1 EE FF FF EB j.t..D$.PW......
006FDDE0 0B 8B 4C 24 08 51 57 E8 C4 EC FF FF 8B F0 83 C4 ..L$.QW.........
006FDDF0 0C 85 F6 75 13 85 DB 74 0F 6A 01 53 57 E8 8E EE ...u...t.j.SW...
006FDE00 FF FF 83 C4 0C 5E 59 C3 8B C6 5E 59 C3 CC CC CC .....^Y...^Y....
006FDE10 8B 54 24 08 53 8B 5C 24 10 57 8B 7C 24 0C B9 D4 .T$.S.\$.W.|$...
006FDE20 DA 8C 00 E8 68 FF FF FF 83 F8 FF 5F 5B 74 0D 83 ....h......_[t..
006FDE30 05 B8 63 A1 00 01 B8 B8 63 A1 00 C3 33 C0 C3 CC ..c.....c...3...

;; fn006FDE40: 006FDE40
;;   Called from:
;;     006F7857 (in fn006F7810)
;;     00747D24 (in fn00747CA0)
;;     00747D3E (in fn00747CA0)
;;     00747DCF (in fn00747CA0)
;;     00747DE9 (in fn00747CA0)
;;     00747DFF (in fn00747CA0)
;;     00747EAF (in fn00747CA0)
fn006FDE40 proc
	mov	eax,[esp+8h]
	mov	ecx,[esp+4h]
	push	1h
	push	eax
	push	ecx
	call	6FCC90h
	add	esp,0Ch
	ret
006FDE55                CC CC CC CC CC CC CC CC CC CC CC      ...........

;; fn006FDE60: 006FDE60
;;   Called from:
;;     006F6346 (in fn006F62D0)
;;     00707963 (in fn00707950)
fn006FDE60 proc
	push	edi
	mov	edi,[esp+8h]
	test	edi,edi
	jz	6FDEBCh

l006FDE69:
	mov	eax,[edi+4h]
	cmp	eax,0A1D1B8h
	jz	6FDE85h

l006FDE73:
	push	0A1D1B8h
	push	eax
	call	6D5670h
	add	esp,8h
	test	eax,eax
	jz	6FDEBCh

l006FDE85:
	push	esi
	call	6FDCC0h
	mov	esi,eax
	test	esi,esi
	jz	6FDEB7h

l006FDE91:
	push	1h
	push	edi
	push	esi
	call	6FCC90h
	add	esp,0Ch
	test	eax,eax
	jnz	6FDEA6h

l006FDEA1:
	mov	eax,esi
	pop	esi
	pop	edi
	ret

l006FDEA6:
	add	dword ptr [esi],0FFh
	jnz	6FDEB7h

l006FDEAB:
	mov	eax,[esi+4h]
	mov	ecx,[eax+18h]
	push	esi
	call	ecx
	add	esp,4h

l006FDEB7:
	pop	esi
	xor	eax,eax
	pop	edi
	ret

l006FDEBC:
	push	5ABh
	push	8D6320h
	call	6E1DC0h
	add	esp,8h
	xor	eax,eax
	pop	edi
	ret
006FDED2       CC CC CC CC CC CC CC CC CC CC CC CC CC CC   ..............
006FDEE0 53 57 8B 7C 24 0C BB D0 D2 A1 00 E8 A0 FA FF FF SW.|$...........
006FDEF0 5F 5B C3 CC CC CC CC CC CC CC CC CC CC CC CC CC _[..............
006FDF00 53 57 8B 7C 24 0C BB 90 D3 A1 00 E8 80 FA FF FF SW.|$...........
006FDF10 5F 5B C3 CC CC CC CC CC CC CC CC CC CC CC CC CC _[..............
006FDF20 53 57 8B 7C 24 0C BB 50 D4 A1 00 E8 60 FA FF FF SW.|$..P....`...
006FDF30 5F 5B C3 CC CC CC CC CC CC CC CC CC CC CC CC CC _[..............
006FDF40 8B 54 24 08 53 8B 5C 24 10 57 8B 7C 24 0C B9 D8 .T$.S.\$.W.|$...
006FDF50 0C 8D 00 E8 38 FE FF FF 5F 5B C3 CC CC CC CC CC ....8..._[......
006FDF60 E9 FB FE FF FF CC CC CC CC CC CC CC CC CC CC CC ................
006FDF70 56 8B 74 24 08 8B 46 04 F7 40 54 00 40 00 00 74 V.t$..F..@T.@..t
006FDF80 21 8B 80 A4 00 00 00 85 C0 74 0A 56 FF D0 83 C4 !........t.V....
006FDF90 04 85 C0 74 0D 8B 46 F8 85 C0 7E 06 83 C0 FF 89 ...t..F...~.....
006FDFA0 46 F8 33 C0 5E C3 CC CC CC CC CC CC CC CC CC CC F.3.^...........
006FDFB0 56 8B 74 24 08 8B 46 04 F7 40 54 00 40 00 00 74 V.t$..F..@T.@..t
006FDFC0 45 8B 80 A4 00 00 00 85 C0 74 0A 56 FF D0 83 C4 E........t.V....
006FDFD0 04 85 C0 74 31 8B 4E F8 85 C9 8D 46 F0 74 20 83 ...t1.N....F.t .
006FDFE0 F9 FC 75 22 8B 48 04 8B 10 89 11 89 4A 04 8B 4C ..u".H......J..L
006FDFF0 24 0C 8B 51 04 89 50 04 89 41 04 89 02 89 08 C7 $..Q..P..A......
006FE000 40 08 01 00 00 00 33 C0 5E C3 CC CC CC CC CC CC @.....3.^.......

;; fn006FE010: 006FE010
;;   Called from:
;;     006FE5BE (in fn006FE400)
fn006FE010 proc
	push	esi
	mov	esi,[ebx]
	cmp	esi,ebx
	jz	6FE061h

l006FE017:
	cmp	dword ptr [esi+8h],0h
	jz	6FE03Dh

l006FE01D:
	mov	ecx,[esi+14h]
	mov	ecx,[ecx+5Ch]
	lea	eax,[esi+10h]
	push	ebx
	push	6FDFB0h
	push	eax
	mov	dword ptr [esi+8h],0FFFFFFFDh
	call	ecx
	mov	eax,[esi]
	add	esp,0Ch
	jmp	6FE05Bh

l006FE03D:
	mov	ecx,[esi+4h]
	mov	eax,[esi]
	mov	[ecx],eax
	mov	[eax+4h],ecx
	mov	ecx,[edi+4h]
	mov	[esi+4h],ecx
	mov	[edi+4h],esi
	mov	[ecx],esi
	mov	[esi],edi
	mov	dword ptr [esi+8h],0FFFFFFFCh

l006FE05B:
	cmp	eax,ebx
	mov	esi,eax
	jnz	6FE017h

l006FE061:
	pop	esi
	ret
006FE063          CC CC CC CC CC CC CC CC CC CC CC CC CC    .............

;; fn006FE070: 006FE070
;;   Called from:
;;     006FE5F7 (in fn006FE400)
fn006FE070 proc
	push	ebp
	mov	ebp,[esp+8h]
	push	esi
	mov	esi,[ebp+0h]
	cmp	esi,ebp
	jz	6FE0F7h

l006FE07D:
	push	ebx
	mov	edi,edi

l006FE080:
	mov	eax,[esi+14h]
	cmp	eax,0A1EB98h
	mov	ebx,[esi]
	lea	ecx,[esi+10h]
	jnz	6FE0A6h

l006FE08F:
	mov	eax,[0A6CD14h]
	push	eax
	push	ecx
	call	70C9E0h
	add	esp,8h
	neg	eax
	sbb	eax,eax
	neg	eax
	jmp	6FE0CEh

l006FE0A6:
	test	dword ptr [eax+54h],200h
	jz	6FE0BEh

l006FE0AF:
	xor	ecx,ecx
	cmp	[eax+0BCh],ecx
	setnz	cl
	mov	eax,ecx
	jmp	6FE0CEh

l006FE0BE:
	cmp	eax,0A2EE18h
	jnz	6FE0F0h

l006FE0C5:
	push	ecx
	call	750160h
	add	esp,4h

l006FE0CE:
	test	eax,eax
	jz	6FE0F0h

l006FE0D2:
	mov	eax,[esi+4h]
	mov	ecx,[esi]
	mov	[eax],ecx
	mov	[ecx+4h],eax
	mov	eax,[edi+4h]
	mov	[esi+4h],eax
	mov	[edi+4h],esi
	mov	[eax],esi
	mov	[esi],edi
	mov	dword ptr [esi+8h],0FFFFFFFDh

l006FE0F0:
	cmp	ebx,ebp
	mov	esi,ebx
	jnz	6FE080h

l006FE0F6:
	pop	ebx

l006FE0F7:
	pop	esi
	pop	ebp
	ret
006FE0FA                               CC CC CC CC CC CC           ......
006FE100 56 8B 74 24 08 8B 46 04 F7 40 54 00 40 00 00 74 V.t$..F..@T.@..t
006FE110 40 8B 80 A4 00 00 00 85 C0 74 0A 56 FF D0 83 C4 @........t.V....
006FE120 04 85 C0 74 2C 83 7E F8 FC 75 26 8B 4E F4 8B 56 ...t,.~..u&.N..V
006FE130 F0 8D 46 F0 89 11 89 4A 04 8B 4C 24 0C 8B 51 04 ..F....J..L$..Q.
006FE140 89 50 04 89 41 04 89 02 89 08 C7 40 08 FD FF FF .P..A......@....
006FE150 FF 33 C0 5E C3 CC CC CC CC CC CC CC CC CC CC CC .3.^............

;; fn006FE160: 006FE160
;;   Called from:
;;     006FE758 (in fn006FE400)
fn006FE160 proc
	sub	esp,14h
	lea	ecx,[esp+4h]
	mov	edx,ecx
	mov	[esp+8h],ecx
	mov	ecx,[esp+18h]
	push	edi
	mov	edi,[ecx]
	xor	eax,eax
	cmp	edi,ecx
	mov	[esp+4h],eax
	mov	[esp+8h],edx
	jz	6FE28Fh

l006FE186:
	push	ebx
	push	ebp
	push	esi
	lea	esp,[esp+0h]

l006FE190:
	mov	eax,[edi+14h]
	test	byte ptr [eax+54h],40h
	mov	ebp,[edi]
	jz	6FE1F9h

l006FE19B:
	mov	ebx,[eax+68h]
	test	ebx,ebx
	jle	6FE1F9h

l006FE1A2:
	mov	esi,[ebx+edi+10h]
	test	esi,esi
	jz	6FE1F9h

l006FE1AA:
	lea	ebx,[ebx+0h]

l006FE1B0:
	push	esi
	call	6F9C70h
	add	esp,4h
	cmp	dword ptr [esi+0Ch],0h
	jz	6FE1EDh

l006FE1BF:
	cmp	dword ptr [esi-8h],0FCh
	jz	6FE1EDh

l006FE1C5:
	add	dword ptr [esi],1h
	mov	ecx,[esi-0Ch]
	mov	edx,[esi-10h]
	lea	eax,[esi-10h]
	mov	[ecx],edx
	mov	[edx+4h],ecx
	mov	ecx,[esp+18h]
	mov	[eax+4h],ecx
	mov	ecx,[esp+18h]
	mov	[esp+18h],eax
	lea	edx,[esp+14h]
	mov	[ecx],eax
	mov	[eax],edx

l006FE1ED:
	mov	esi,[ebx+edi+10h]
	test	esi,esi
	jnz	6FE1B0h

l006FE1F5:
	mov	ecx,[esp+28h]

l006FE1F9:
	cmp	ebp,ecx
	mov	edi,ebp
	jnz	6FE190h

l006FE1FF:
	mov	eax,[esp+14h]
	lea	ecx,[esp+14h]
	cmp	eax,ecx
	jz	6FE288h

l006FE20B:
	jmp	6FE210h
006FE20D                                        8D 49 00              .I.

l006FE210:
	mov	ebx,[eax+1Ch]
	lea	edi,[eax+10h]
	push	0h
	push	edi
	push	ebx
	mov	esi,eax
	call	703AF0h
	add	esp,0Ch
	test	eax,eax
	jnz	6FE230h

l006FE228:
	push	ebx
	call	6E1780h
	jmp	6FE23Eh

l006FE230:
	add	dword ptr [eax],0FFh
	jnz	6FE241h

l006FE235:
	mov	edx,[eax+4h]
	push	eax
	mov	eax,[edx+18h]
	call	eax

l006FE23E:
	add	esp,4h

l006FE241:
	add	dword ptr [edi],0FFh
	jnz	6FE252h

l006FE246:
	mov	ecx,[edi+4h]
	mov	edx,[ecx+18h]
	push	edi
	call	edx
	add	esp,4h

l006FE252:
	mov	eax,[esp+14h]
	cmp	eax,esi
	jnz	6FE27Bh

l006FE25A:
	mov	eax,[esi+4h]
	mov	ecx,[esi]
	mov	[eax],ecx
	mov	[ecx+4h],eax
	mov	ecx,[esp+2Ch]
	mov	eax,[ecx+4h]
	mov	[esi+4h],eax
	mov	[ecx+4h],esi
	mov	[eax],esi
	mov	[esi],ecx
	mov	eax,[esp+14h]
	jmp	6FE280h

l006FE27B:
	add	dword ptr [esp+10h],1h

l006FE280:
	lea	ecx,[esp+14h]
	cmp	eax,ecx
	jnz	6FE210h

l006FE288:
	mov	eax,[esp+10h]
	pop	esi
	pop	ebp
	pop	ebx

l006FE28F:
	pop	edi
	add	esp,14h
	ret
006FE294             CC CC CC CC CC CC CC CC CC CC CC CC     ............

;; fn006FE2A0: 006FE2A0
;;   Called from:
;;     006FE866 (in fn006FE400)
fn006FE2A0 proc
	cmp	dword ptr [0A6CD0Ch],0h
	push	ebp
	mov	ebp,[esp+8h]
	push	esi
	push	edi
	mov	edi,[ebx]
	jnz	6FE2D2h

l006FE2B2:
	push	0h
	call	6F2650h
	add	esp,4h
	test	eax,eax
	mov	[0A6CD0Ch],eax
	jnz	6FE2D2h

l006FE2C5:
	push	8D654Ch
	call	6E86F0h
	add	esp,4h

l006FE2D2:
	cmp	edi,ebx
	jz	6FE353h

l006FE2D6:
	jmp	6FE2E0h
006FE2D8                         8D A4 24 00 00 00 00 90         ..$.....

l006FE2E0:
	test	byte ptr [0A6CD04h],20h
	lea	esi,[edi+10h]
	jnz	6FE339h

l006FE2EC:
	mov	eax,[esi+4h]
	cmp	eax,0A1EB98h
	jnz	6FE30Dh

l006FE2F6:
	mov	eax,[0A6CD14h]
	push	eax
	push	esi
	call	70C9E0h
	add	esp,8h
	neg	eax
	sbb	eax,eax
	neg	eax
	jmp	6FE335h

l006FE30D:
	test	dword ptr [eax+54h],200h
	jz	6FE325h

l006FE316:
	xor	ecx,ecx
	cmp	[eax+0BCh],ecx
	setnz	cl
	mov	eax,ecx
	jmp	6FE335h

l006FE325:
	cmp	eax,0A2EE18h
	jnz	6FE34Dh

l006FE32C:
	push	esi
	call	750160h
	add	esp,4h

l006FE335:
	test	eax,eax
	jz	6FE34Dh

l006FE339:
	mov	edx,[0A6CD0Ch]
	push	esi
	push	edx
	call	6F2A10h
	add	esp,8h
	test	eax,eax
	jl	6FE374h

l006FE34D:
	mov	edi,[edi]
	cmp	edi,ebx
	jnz	6FE2E0h

l006FE353:
	mov	ecx,[ebx]
	cmp	ecx,ebx
	jz	6FE369h

l006FE359:
	mov	eax,[ebp+4h]
	mov	[eax],ecx
	mov	[ecx+4h],eax
	mov	eax,[ebx+4h]
	mov	[ebp+4h],eax
	mov	[eax],ebp

l006FE369:
	pop	edi
	pop	esi
	mov	[ebx+4h],ebx
	mov	[ebx],ebx
	xor	eax,eax
	pop	ebp
	ret

l006FE374:
	pop	edi
	pop	esi
	or	eax,0FFh
	pop	ebp
	ret
006FE37B                                  CC CC CC CC CC            .....

;; fn006FE380: 006FE380
;;   Called from:
;;     006FE768 (in fn006FE400)
fn006FE380 proc
	push	ebp
	mov	ebp,[esp+8h]
	push	esi
	mov	esi,[ebp+0h]
	cmp	esi,ebp
	jz	6FE3FCh

l006FE38D:
	push	edi
	mov	edi,edi

l006FE390:
	test	byte ptr [0A6CD04h],20h
	lea	edi,[esi+10h]
	jz	6FE3ADh

l006FE39C:
	mov	eax,[0A6CD0Ch]
	push	edi
	push	eax
	call	6F2A10h
	add	esp,8h
	jmp	6FE3D1h

l006FE3AD:
	mov	ecx,[edi+4h]
	mov	eax,[ecx+60h]
	test	eax,eax
	jz	6FE3D1h

l006FE3B7:
	add	dword ptr [edi],1h
	push	edi
	call	eax
	add	esp,4h
	add	dword ptr [edi],0FFh
	jnz	6FE3D1h

l006FE3C5:
	mov	edx,[edi+4h]
	mov	eax,[edx+18h]
	push	edi
	call	eax
	add	esp,4h

l006FE3D1:
	cmp	[ebp+0h],esi
	jnz	6FE3F4h

l006FE3D6:
	mov	eax,[esi+4h]
	mov	ecx,[esi]
	mov	[eax],ecx
	mov	[ecx+4h],eax
	mov	eax,[ebx+4h]
	mov	[esi+4h],eax
	mov	[ebx+4h],esi
	mov	[eax],esi
	mov	[esi],ebx
	mov	dword ptr [esi+8h],0FFFFFFFDh

l006FE3F4:
	mov	esi,[ebp+0h]
	cmp	esi,ebp
	jnz	6FE390h

l006FE3FB:
	pop	edi

l006FE3FC:
	pop	esi
	pop	ebp
	ret
006FE3FF                                              CC                .

;; fn006FE400: 006FE400
;;   Called from:
;;     006FE8D8 (in fn006FE8B0)
;;     006FEE18 (in fn006FEE00)
fn006FE400 proc
	sub	esp,30h
	fldz
	push	ebp
	mov	ebp,[esp+38h]
	fstp	double ptr [esp+0Ch]
	push	esi
	push	edi
	xor	edi,edi
	cmp	[0A6CD14h],edi
	mov	[esp+40h],edi
	mov	[esp+10h],edi
	jnz	6FE445h

l006FE422:
	push	8CFDD8h
	call	6F1A70h
	add	esp,4h
	cmp	eax,edi
	mov	[0A6CD14h],eax
	jnz	6FE445h

l006FE438:
	push	8D6668h
	call	6E86F0h
	add	esp,4h

l006FE445:
	push	ebx
	mov	ebx,1h
	test	[0A6CD04h],bl
	jz	6FE4EEh

l006FE457:
	mov	eax,[0A6CD18h]
	cmp	eax,edi
	jz	6FE49Ah

l006FE460:
	push	edi
	push	8ACC9Ch
	push	eax
	call	7038E0h
	mov	esi,eax
	add	esp,0Ch
	cmp	esi,edi
	jnz	6FE47Ch

l006FE475:
	call	6E1160h
	jmp	6FE49Ah

l006FE47C:
	push	esi
	call	6FF3E0h
	fstp	double ptr [esp+1Ch]
	add	esp,4h
	add	dword ptr [esi],0FFh
	jnz	6FE49Ah

l006FE48E:
	mov	eax,[esi+4h]
	mov	ecx,[eax+18h]
	push	esi
	call	ecx
	add	esp,4h

l006FE49A:
	push	ebp
	push	8D6644h
	call	716B20h
	push	8D6624h
	call	716B20h
	add	esp,0Ch
	mov	esi,0A1D510h

l006FE4B7:
	mov	eax,[esi]
	xor	ecx,ecx
	cmp	eax,esi
	jz	6FE4C8h

l006FE4BF:
	nop

l006FE4C0:
	mov	eax,[eax]
	add	ecx,ebx
	cmp	eax,esi
	jnz	6FE4C0h

l006FE4C8:
	push	ecx
	push	8D6620h
	call	716B20h
	add	esi,18h
	add	esp,8h
	cmp	esi,0A1D558h
	jl	6FE4B7h

l006FE4E1:
	push	8A6DE8h
	call	716B20h
	add	esp,4h

l006FE4EE:
	lea	ecx,[ebp+1h]
	cmp	ecx,3h
	jge	6FE501h

l006FE4F6:
	lea	eax,[ebp+ebp*2+0h]
	add	[0A1D53Ch+eax*8],ebx

l006FE501:
	cmp	ebp,edi
	jl	6FE552h

l006FE505:
	mov	eax,0A1D524h
	lea	ebx,[ebx+0h]

l006FE510:
	mov	[eax],edi
	add	eax,18h
	sub	ecx,ebx
	jnz	6FE510h

l006FE519:
	cmp	ebp,edi
	jle	6FE552h

l006FE51D:
	lea	edx,[ebp+ebp*2+0h]
	lea	edx,[0A1D510h+edx*8]
	mov	eax,0A1D510h
	mov	edi,ebp
	nop

l006FE530:
	mov	esi,[eax]
	cmp	esi,eax
	jz	6FE546h

l006FE536:
	mov	ecx,[edx+4h]
	mov	[ecx],esi
	mov	[esi+4h],ecx
	mov	ecx,[eax+4h]
	mov	[edx+4h],ecx
	mov	[ecx],edx

l006FE546:
	mov	[eax+4h],eax
	mov	[eax],eax
	add	eax,18h
	sub	edi,ebx
	jnz	6FE530h

l006FE552:
	lea	eax,[ebp+ebp*2+0h]
	add	eax,eax
	add	eax,eax
	add	eax,eax
	cmp	ebp,2h
	lea	ebx,[eax+0A1D510h]
	jge	6FE573h

l006FE567:
	lea	ebp,[eax+0A1D528h]
	mov	[esp+10h],ebp
	jmp	6FE579h

l006FE573:
	mov	[esp+10h],ebx
	mov	ebp,ebx

l006FE579:
	mov	eax,[ebx]
	cmp	eax,ebx
	jz	6FE58Ch

l006FE57F:
	nop

l006FE580:
	mov	edx,[eax+10h]
	mov	[eax+8h],edx
	mov	eax,[eax]
	cmp	eax,ebx
	jnz	6FE580h

l006FE58C:
	mov	esi,[ebx]
	cmp	esi,ebx
	jz	6FE5AEh

l006FE592:
	mov	eax,[esi+14h]
	mov	edx,[eax+5Ch]
	push	0h
	lea	ecx,[esi+10h]
	push	6FDF70h
	push	ecx
	call	edx
	mov	esi,[esi]
	add	esp,0Ch
	cmp	esi,ebx
	jnz	6FE592h

l006FE5AE:
	lea	eax,[esp+30h]
	mov	ecx,eax
	mov	edi,eax
	mov	[esp+34h],eax
	mov	[esp+30h],ecx
	call	6FE010h
	cmp	ebx,ebp
	jz	6FE5E2h

l006FE5C7:
	mov	ecx,[ebx]
	cmp	ecx,ebx
	jz	6FE5DDh

l006FE5CD:
	mov	eax,[ebp+4h]
	mov	[eax],ecx
	mov	[ecx+4h],eax
	mov	eax,[ebx+4h]
	mov	[ebp+4h],eax
	mov	[eax],ebp

l006FE5DD:
	mov	[ebx+4h],ebx
	mov	[ebx],ebx

l006FE5E2:
	lea	edx,[esp+20h]
	lea	ecx,[esp+30h]
	mov	eax,edx
	push	ecx
	mov	edi,edx
	mov	[esp+28h],edx
	mov	[esp+24h],eax
	call	6FE070h
	mov	esi,[esp+24h]
	mov	edx,edi
	add	esp,4h
	cmp	esi,edx
	jz	6FE633h

l006FE609:
	lea	esp,[esp+0h]

l006FE610:
	mov	eax,[esi+14h]
	mov	eax,[eax+5Ch]
	lea	ecx,[esp+20h]
	push	ecx
	lea	edx,[esi+10h]
	push	6FE100h
	push	edx
	call	eax
	mov	esi,[esi]
	lea	ecx,[esp+2Ch]
	add	esp,0Ch
	cmp	esi,ecx
	jnz	6FE610h

l006FE633:
	mov	eax,[esp+30h]
	lea	edx,[esp+30h]
	cmp	eax,edx
	mov	ebx,eax
	jz	6FE752h

l006FE645:
	jmp	6FE650h
006FE647                      8D A4 24 00 00 00 00 8B FF        ..$......

l006FE650:
	mov	al,[0A6CD04h]
	add	dword ptr [esp+44h],1h
	test	al,2h
	jz	6FE6DCh

l006FE65E:
	test	al,8h
	lea	esi,[ebx+10h]
	jz	6FE6BEh

l006FE665:
	cmp	dword ptr [esi+4h],0A1EB98h
	jnz	6FE6BEh

l006FE66E:
	mov	eax,[esi+8h]
	mov	edi,[eax+10h]
	test	edi,edi
	jz	6FE6ABh

l006FE678:
	mov	eax,[edi+4h]
	cmp	eax,0A1B450h
	jz	6FE694h

l006FE682:
	push	0A1B450h
	push	eax
	call	6D5670h
	add	esp,8h
	test	eax,eax
	jz	6FE6ABh

l006FE694:
	push	edi
	call	6ECC50h
	add	esp,4h
	push	esi
	push	eax
	push	8D6614h
	push	8D6510h
	jmp	6FE6D4h

l006FE6AB:
	push	esi
	mov	eax,8D0E38h
	push	eax
	push	8D6614h
	push	8D6510h
	jmp	6FE6D4h

l006FE6BE:
	test	al,10h
	jz	6FE6DCh

l006FE6C2:
	mov	ecx,[esi+4h]
	mov	edx,[ecx+0Ch]
	push	esi
	push	edx
	push	8D6614h
	push	8D6534h

l006FE6D4:
	call	716B20h
	add	esp,10h

l006FE6DC:
	mov	eax,[0A6CD18h]
	test	eax,eax
	jz	6FE744h

l006FE6E5:
	test	byte ptr [0A6CD04h],1h
	jz	6FE744h

l006FE6EE:
	push	0h
	push	8ACC9Ch
	push	eax
	call	7038E0h
	mov	esi,eax
	add	esp,0Ch
	test	esi,esi
	jnz	6FE70Bh

l006FE704:
	call	6E1160h
	jmp	6FE744h

l006FE70B:
	push	esi
	call	6FF3E0h
	fsub	double ptr [esp+1Ch]
	add	esp,4h
	add	dword ptr [esi],0FFh
	fstp	double ptr [esp+18h]
	jnz	6FE72Dh

l006FE721:
	mov	eax,[esi+4h]
	mov	ecx,[eax+18h]
	push	esi
	call	ecx
	add	esp,4h

l006FE72D:
	fld	double ptr [esp+18h]
	sub	esp,8h
	fstp	double ptr [esp]
	push	8D6600h
	call	716B20h
	add	esp,0Ch

l006FE744:
	mov	ebx,[ebx]
	lea	edx,[esp+30h]
	cmp	ebx,edx
	jnz	6FE650h

l006FE752:
	lea	eax,[esp+30h]
	push	ebp
	push	eax
	call	6FE160h
	add	[esp+4Ch],eax
	lea	ecx,[esp+38h]
	push	ecx
	mov	ebx,ebp
	call	6FE380h
	mov	eax,[esp+2Ch]
	mov	ebp,[esp+20h]
	lea	edx,[esp+2Ch]
	add	esp,0Ch
	mov	ebx,eax
	cmp	eax,edx
	mov	al,[0A6CD04h]
	jz	6FE82Ch

l006FE78B:
	jmp	6FE790h
006FE78D                                        8D 49 00              .I.

l006FE790:
	add	ebp,1h
	test	al,4h
	jz	6FE81Eh

l006FE79B:
	test	al,8h
	lea	esi,[ebx+10h]
	jz	6FE7FBh

l006FE7A2:
	cmp	dword ptr [esi+4h],0A1EB98h
	jnz	6FE7FBh

l006FE7AB:
	mov	eax,[esi+8h]
	mov	edi,[eax+10h]
	test	edi,edi
	jz	6FE7E8h

l006FE7B5:
	mov	eax,[edi+4h]
	cmp	eax,0A1B450h
	jz	6FE7D1h

l006FE7BF:
	push	0A1B450h
	push	eax
	call	6D5670h
	add	esp,8h
	test	eax,eax
	jz	6FE7E8h

l006FE7D1:
	push	edi
	call	6ECC50h
	add	esp,4h
	push	esi
	push	eax
	push	8D65F0h
	push	8D6510h
	jmp	6FE811h

l006FE7E8:
	push	esi
	mov	eax,8D0E38h
	push	eax
	push	8D65F0h
	push	8D6510h
	jmp	6FE811h

l006FE7FB:
	test	al,10h
	jz	6FE81Eh

l006FE7FF:
	mov	ecx,[esi+4h]
	mov	edx,[ecx+0Ch]
	push	esi
	push	edx
	push	8D65F0h
	push	8D6534h

l006FE811:
	call	716B20h
	mov	al,[0A6CD04h]
	add	esp,10h

l006FE81E:
	mov	ebx,[ebx]
	lea	ecx,[esp+20h]
	cmp	ebx,ecx
	jnz	6FE790h

l006FE82C:
	test	al,1h
	mov	esi,[esp+44h]
	jz	6FE85Dh

l006FE834:
	test	esi,esi
	jnz	6FE84Bh

l006FE838:
	test	ebp,ebp
	jnz	6FE84Bh

l006FE83C:
	push	8D65E4h
	call	716B20h
	add	esp,4h
	jmp	6FE85Dh

l006FE84B:
	push	ebp
	lea	edx,[esi+ebp]
	push	edx
	push	8D65B4h
	call	716B20h
	add	esp,0Ch

l006FE85D:
	mov	eax,[esp+10h]
	push	eax
	lea	ebx,[esp+24h]
	call	6FE2A0h
	add	esp,4h
	call	6E0FC0h
	test	eax,eax
	pop	ebx
	jz	6FE8A6h

l006FE878:
	mov	eax,[0A6CD10h]
	test	eax,eax
	jnz	6FE893h

l006FE881:
	push	8D65A0h
	call	6ECAC0h
	add	esp,4h
	mov	[0A6CD10h],eax

l006FE893:
	push	eax
	call	6E1780h
	push	8D6570h
	call	6E86F0h
	add	esp,8h

l006FE8A6:
	pop	edi
	lea	eax,[esi+ebp]
	pop	esi
	pop	ebp
	add	esp,30h
	ret

;; fn006FE8B0: 006FE8B0
;;   Called from:
;;     006FEF14 (in fn006FEEB0)
fn006FE8B0 proc
	xor	eax,eax
	mov	edx,2h
	mov	ecx,0A1D554h
	push	esi
	lea	ecx,[ecx+0h]

l006FE8C0:
	mov	esi,[ecx]
	cmp	esi,[ecx-4h]
	jg	6FE8D7h

l006FE8C7:
	sub	ecx,18h
	sub	edx,1h
	cmp	ecx,0A1D524h
	jge	6FE8C0h

l006FE8D5:
	pop	esi
	ret

l006FE8D7:
	push	edx
	call	6FE400h
	add	esp,4h
	pop	esi
	ret
006FE8E2       CC CC CC CC CC CC CC CC CC CC CC CC CC CC   ..............
006FE8F0 B8 01 00 00 00 01 05 B8 63 A1 00 A3 5C D5 A1 00 ........c...\...
006FE900 B8 B8 63 A1 00 C3 CC CC CC CC CC CC CC CC CC CC ..c.............
006FE910 83 05 B8 63 A1 00 01 C7 05 5C D5 A1 00 00 00 00 ...c.....\......
006FE920 00 B8 B8 63 A1 00 C3 CC CC CC CC CC CC CC CC CC ...c............
006FE930 A1 5C D5 A1 00 50 E8 25 6A FE FF 83 C4 04 C3 CC .\...P.%j.......
006FE940 51 8B 4C 24 10 8B 54 24 0C 8D 04 24 50 68 38 D7 Q.L$..T$...$Ph8.
006FE950 A1 00 68 9C 66 8D 00 51 52 C7 44 24 14 02 00 00 ..h.f..QR.D$....
006FE960 00 E8 9A 91 FE FF 83 C4 14 85 C0 74 59 8B 04 24 ...........tY..$
006FE970 83 F8 02 77 3E 83 3D 08 CD A6 00 00 74 0D 33 C0 ...w>.=.....t.3.
006FE980 50 E8 9A 67 00 00 83 C4 04 59 C3 50 C7 05 08 CD P..g.....Y.P....
006FE990 A6 00 01 00 00 00 E8 65 FA FF FF 83 C4 04 50 C7 .......e......P.
006FE9A0 05 08 CD A6 00 00 00 00 00 E8 72 67 00 00 83 C4 ..........rg....
006FE9B0 04 59 C3 A1 2C 7E A1 00 68 88 66 8D 00 50 E8 BD .Y..,~..h.f..P..
006FE9C0 25 FE FF 83 C4 08 33 C0 59 C3 CC CC CC CC CC CC %.....3.Y.......
006FE9D0 8B 44 24 08 68 04 CD A6 00 68 A0 66 8D 00 50 E8 .D$.h....h.f..P.
006FE9E0 9C 92 FE FF 83 C4 0C 85 C0 75 01 C3 83 05 B8 63 .........u.....c
006FE9F0 A1 00 01 B8 B8 63 A1 00 C3 CC CC CC CC CC CC CC .....c..........
006FEA00 A1 04 CD A6 00 89 44 24 08 C7 44 24 04 B0 87 8A ......D$..D$....
006FEA10 00 E9 EA B7 FE FF CC CC CC CC CC CC CC CC CC CC ................
006FEA20 8B 44 24 08 68 50 D5 A1 00 68 38 D5 A1 00 68 20 .D$.hP...h8...h 
006FEA30 D5 A1 00 68 AC 66 8D 00 50 E8 42 92 FE FF 83 C4 ...h.f..P.B.....
006FEA40 14 85 C0 75 01 C3 83 05 B8 63 A1 00 01 B8 B8 63 ...u.....c.....c
006FEA50 A1 00 C3 CC CC CC CC CC CC CC CC CC CC CC CC CC ................
006FEA60 A1 50 D5 A1 00 8B 0D 38 D5 A1 00 8B 15 20 D5 A1 .P.....8..... ..
006FEA70 00 50 51 52 68 BC 9E 8C 00 E8 82 B7 FE FF 83 C4 .PQRh...........
006FEA80 10 C3 CC CC CC CC CC CC CC CC CC CC CC CC CC CC ................
006FEA90 A1 54 D5 A1 00 8B 0D 3C D5 A1 00 8B 15 24 D5 A1 .T.....<.....$..
006FEAA0 00 50 51 52 68 BC 9E 8C 00 E8 52 B7 FE FF 83 C4 .PQRh.....R.....
006FEAB0 10 C3 CC CC CC CC CC CC CC CC CC CC CC CC CC CC ................
006FEAC0 8B 4C 24 08 8B 51 08 33 C0 85 D2 56 7E 15 8B 74 .L$..Q.3...V~..t
006FEAD0 24 08 83 C1 0C 39 31 74 0E 83 C0 01 83 C1 04 3B $....91t.......;
006FEAE0 C2 7C F2 33 C0 5E C3 B8 01 00 00 00 5E C3 CC CC .|.3.^......^...
006FEAF0 55 8B 6C 24 08 56 57 8B 7D 00 3B FD 74 3D 8B FF U.l$.VW.}.;.t=..
006FEB00 8B 47 14 8B 40 5C 8D 77 10 3B F3 74 28 3B 74 24 .G..@\.w.;.t(;t$
006FEB10 14 74 22 53 68 C0 EA 6F 00 56 FF D0 83 C4 0C 85 .t"Sh..o.V......
006FEB20 C0 74 12 8B 4C 24 14 56 51 E8 E2 3E FF FF 83 C4 .t..L$.VQ..>....
006FEB30 08 85 C0 7C 0F 8B 3F 3B FD 75 C5 5F 5E B8 01 00 ...|..?;.u._^...
006FEB40 00 00 5D C3 5F 5E 33 C0 5D C3 CC CC CC CC CC CC ..]._^3.].......
006FEB50 57 6A 00 E8 F8 3A FF FF 8B F8 83 C4 04 85 FF 75 Wj...:.........u
006FEB60 02 5F C3 53 8B 5C 24 10 56 BE 10 D5 A1 00 8B FF ._.S.\$.V.......
006FEB70 57 56 E8 79 FF FF FF 83 C4 08 85 C0 74 11 83 C6 WV.y........t...
006FEB80 18 81 FE 58 D5 A1 00 7C E7 5E 5B 8B C7 5F C3 83 ...X...|.^[.._..
006FEB90 07 FF 75 0C 8B 47 04 8B 48 18 57 FF D1 83 C4 04 ..u..G..H.W.....
006FEBA0 5E 5B 33 C0 5F C3 CC CC CC CC CC CC CC CC CC CC ^[3._...........
006FEBB0 8B 44 24 04 8B 4C 24 08 50 51 E8 51 3E FF FF 33 .D$..L$.PQ.Q>..3
006FEBC0 D2 83 C4 08 85 C0 0F 9C C2 8B C2 C3 CC CC CC CC ................
006FEBD0 51 6A 00 E8 78 3A FF FF 83 C4 04 85 C0 89 04 24 Qj..x:.........$
006FEBE0 75 02 59 C3 53 55 8B 6C 24 14 33 DB 39 5D 08 56 u.Y.SU.l$.3.9].V
006FEBF0 57 7E 79 8D 7D 0C EB 08 8D A4 24 00 00 00 00 90 W~y.}.....$.....
006FEC00 8B 37 8B 46 04 F7 40 54 00 40 00 00 74 32 8B 80 .7.F..@T.@..t2..
006FEC10 A4 00 00 00 85 C0 74 0A 56 FF D0 83 C4 04 85 C0 ......t.V.......
006FEC20 74 1E 8B 46 04 8B 40 5C 85 C0 74 14 8B 4C 24 10 t..F..@\..t..L$.
006FEC30 51 68 B0 EB 6F 00 56 FF D0 83 C4 0C 85 C0 75 15 Qh..o.V.......u.
006FEC40 83 C3 01 83 C7 04 3B 5D 08 7C B5 8B 44 24 10 5F ......;].|..D$._
006FEC50 5E 5D 5B 59 C3 8B 44 24 10 83 00 FF 75 0C 8B 50 ^][Y..D$....u..P
006FEC60 04 50 8B 42 18 FF D0 83 C4 04 33 C0 5F 5E 5D 5B .P.B......3._^][
006FEC70 59 C3 CC CC CC CC CC CC CC CC CC CC CC CC CC CC Y...............
006FEC80 57 6A 00 E8 C8 39 FF FF 8B F8 83 C4 04 85 FF 75 Wj...9.........u
006FEC90 02 5F C3 53 BB 10 D5 A1 00 56 8D 9B 00 00 00 00 ._.S.....V......
006FECA0 8B 33 3B F3 74 1B 8D 46 10 3B C7 74 0E 50 57 E8 .3;.t..F.;.t.PW.
006FECB0 5C 3D FF FF 83 C4 08 85 C0 75 17 8B 36 3B F3 75 \=.......u..6;.u
006FECC0 E5 83 C3 18 81 FB 58 D5 A1 00 7C D4 5E 5B 8B C7 ......X...|.^[..
006FECD0 5F C3 83 07 FF 75 0C 8B 47 04 8B 48 18 57 FF D1 _....u..G..H.W..
006FECE0 83 C4 04 5E 5B 33 C0 5F C3 CC CC CC CC CC CC CC ...^[3._........
006FECF0 56 68 F5 03 00 00 6A 00 68 58 DC A1 00 68 40 DF Vh....j.hX...h@.
006FED00 A1 00 68 74 AD 8C 00 E8 04 A9 FE FF 8B F0 83 C4 ..ht............
006FED10 14 85 F6 0F 84 E5 00 00 00 A1 0C CD A6 00 85 C0 ................
006FED20 75 16 50 E8 28 39 FF FF 83 C4 04 85 C0 A3 0C CD u.P.(9..........
006FED30 A6 00 0F 84 C6 00 00 00 83 00 01 50 68 30 67 8D ...........Ph0g.
006FED40 00 56 E8 59 B2 FE FF 83 C4 0C 85 C0 0F 8C AC 00 .V.Y............
006FED50 00 00 83 3D 18 CD A6 00 00 75 1B 68 9C CC 8A 00 ...=.....u.h....
006FED60 E8 4B A5 FF FF 83 C4 04 85 C0 A3 18 CD A6 00 75 .K.............u
006FED70 05 E8 EA 23 FE FF 6A 01 68 24 67 8D 00 56 E8 DD ...#..j.h$g..V..
006FED80 B2 FE FF 83 C4 0C 85 C0 7C 74 6A 02 68 10 67 8D ........|tj.h.g.
006FED90 00 56 E8 C9 B2 FE FF 83 C4 0C 85 C0 7C 60 6A 04 .V..........|`j.
006FEDA0 68 FC 66 8D 00 56 E8 B5 B2 FE FF 83 C4 0C 85 C0 h.f..V..........
006FEDB0 7C 4C 6A 08 68 EC 66 8D 00 56 E8 A1 B2 FE FF 83 |Lj.h.f..V......
006FEDC0 C4 0C 85 C0 7C 38 6A 10 68 DC 66 8D 00 56 E8 8D ....|8j.h.f..V..
006FEDD0 B2 FE FF 83 C4 0C 85 C0 7C 24 6A 20 68 CC 66 8D ........|$j h.f.
006FEDE0 00 56 E8 79 B2 FE FF 83 C4 0C 85 C0 7C 10 6A 3E .V.y........|.j>
006FEDF0 68 C0 66 8D 00 56 E8 65 B2 FE FF 83 C4 0C 5E C3 h.f..V.e......^.

;; fn006FEE00: 006FEE00
;;   Called from:
;;     006E895E (in fn006E8910)
fn006FEE00 proc
	cmp	dword ptr [0A6CD08h],0h
	jz	6FEE0Ch

l006FEE09:
	xor	eax,eax
	ret

l006FEE0C:
	push	2h
	mov	dword ptr [0A6CD08h],1h
	call	6FE400h
	add	esp,4h
	mov	dword ptr [0A6CD08h],0h
	ret
006FEE2B                                  CC CC CC CC CC            .....

;; fn006FEE30: 006FEE30
;;   Called from:
;;     007171F5 (in fn00717180)
;;     0072F7C5 (in fn0072F770)
;;     00738C39 (in fn00738BB0)
fn006FEE30 proc
	push	esi
	mov	esi,[esp+8h]
	add	esi,0F0h
	cmp	dword ptr [esi+8h],0FEh
	jz	6FEE4Bh

l006FEE3E:
	push	8D0E04h
	call	6E86F0h
	add	esp,4h

l006FEE4B:
	mov	dword ptr [esi+8h],0FFFFFFFDh
	mov	eax,[0A1D558h]
	mov	[esi],eax
	mov	ecx,[0A1D558h]
	mov	eax,[ecx+4h]
	mov	[esi+4h],eax
	mov	[eax],esi
	mov	edx,[0A1D558h]
	mov	[edx+4h],esi
	pop	esi
	ret
006FEE72       CC CC CC CC CC CC CC CC CC CC CC CC CC CC   ..............
006FEE80 8B 44 24 04 B9 FE FF FF FF 39 48 F8 74 1B 8B 50 .D$......9H.t..P
006FEE90 F0 89 48 F8 8B 48 F4 89 11 8B 48 F0 8B 50 F4 89 ..H..H....H..P..
006FEEA0 51 04 C7 40 F0 00 00 00 00 C3 CC CC CC CC CC CC Q..@............

;; fn006FEEB0: 006FEEB0
;;   Called from:
;;     006FEF39 (in fn006FEF30)
;;     006FEF6B (in fn006FEF50)
fn006FEEB0 proc
	mov	eax,[esp+4h]
	add	eax,10h
	push	esi
	push	eax
	call	723860h
	mov	esi,eax
	add	esp,4h
	test	esi,esi
	jnz	6FEECDh

l006FEEC7:
	pop	esi
	jmp	6E1210h

l006FEECD:
	mov	dword ptr [esi+8h],0FFFFFFFEh
	mov	eax,[0A1D524h]
	mov	ecx,[0A1D520h]
	add	eax,1h
	cmp	eax,ecx
	mov	[0A1D524h],eax
	jle	6FEF23h

l006FEEEB:
	cmp	dword ptr [0A1D55Ch],0h
	jz	6FEF23h

l006FEEF4:
	test	ecx,ecx
	jz	6FEF23h

l006FEEF8:
	cmp	dword ptr [0A6CD08h],0h
	jnz	6FEF23h

l006FEF01:
	call	6E0FC0h
	test	eax,eax
	jnz	6FEF23h

l006FEF0A:
	mov	dword ptr [0A6CD08h],1h
	call	6FE8B0h
	mov	dword ptr [0A6CD08h],0h

l006FEF23:
	lea	eax,[esi+10h]
	pop	esi
	ret
006FEF28                         CC CC CC CC CC CC CC CC         ........

;; fn006FEF30: 006FEF30
;;   Called from:
;;     006F26B4 (in fn006F2650)
;;     006F9529 (in fn006F94A0)
;;     006FDD7A (in fn006FDCC0)
;;     00717186 (in fn00717180)
;;     00725017 (in fn00725010)
;;     00725DCB (in fn00725DA0)
;;     0072F790 (in fn0072F770)
;;     007500E6 (in fn007500E0)
;;     00750386 (in fn00750380)
fn006FEF30 proc
	push	esi
	mov	esi,[esp+8h]
	mov	eax,[esi+10h]
	push	eax
	call	6FEEB0h
	add	esp,4h
	test	eax,eax
	jz	6FEF4Eh

l006FEF45:
	mov	[eax+4h],esi
	mov	dword ptr [eax],1h

l006FEF4E:
	pop	esi
	ret

;; fn006FEF50: 006FEF50
;;   Called from:
;;     006DFDFC (in fn006DFD20)
;;     0073B0B8 (in fn0073AFB0)
fn006FEF50 proc
	push	esi
	mov	esi,[esp+8h]
	mov	eax,[esi+14h]
	mov	ecx,[esi+10h]
	push	edi
	mov	edi,[esp+10h]
	imul	eax,edi
	lea	eax,[eax+ecx+3h]
	and	eax,0FCh
	push	eax
	call	6FEEB0h
	add	esp,4h
	test	eax,eax
	jz	6FEF83h

l006FEF77:
	mov	[eax+8h],edi
	mov	[eax+4h],esi
	mov	dword ptr [eax],1h

l006FEF83:
	pop	edi
	pop	esi
	ret
006FEF86                   CC CC CC CC CC CC CC CC CC CC       ..........

;; fn006FEF90: 006FEF90
;;   Called from:
;;     006E0BCE (in fn006E0B00)
;;     0073B0FD (in fn0073AFB0)
fn006FEF90 proc
	mov	ecx,[esp+4h]
	mov	eax,[ecx+4h]
	mov	edx,[eax+14h]
	mov	eax,[eax+10h]
	push	esi
	mov	esi,[esp+0Ch]
	imul	edx,esi
	lea	eax,[edx+eax+3h]
	and	eax,0FCh
	add	eax,10h
	push	eax
	add	ecx,0F0h
	push	ecx
	call	723B60h
	add	esp,8h
	test	eax,eax
	jnz	6FEFC6h

l006FEFC0:
	pop	esi
	jmp	6E1210h

l006FEFC6:
	add	eax,10h
	mov	[eax+8h],esi
	pop	esi
	ret
006FEFCE                                           CC CC               ..

;; fn006FEFD0: 006FEFD0
;;   Called from:
;;     006E0BE3 (in fn006E0B00)
;;     006E0CE6 (in fn006E0CA0)
;;     006F2630 (in fn006F2610)
;;     006F9B8A (in fn006F9B70)
;;     0070E83A (in fn0070E820)
;;     00738DA0 (in fn00738D80)
;;     0073B5FA (in fn0073B5E0)
fn006FEFD0 proc
	mov	ecx,[esp+4h]
	cmp	dword ptr [ecx-8h],0FEh
	lea	eax,[ecx-10h]
	jz	6FEFF2h

l006FEFDD:
	mov	edx,[eax]
	mov	ecx,[eax+4h]
	mov	[ecx],edx
	mov	ecx,[eax]
	mov	edx,[eax+4h]
	mov	[ecx+4h],edx
	mov	dword ptr [eax],0h

l006FEFF2:
	cmp	dword ptr [0A1D524h],0h
	jle	6FF002h

l006FEFFB:
	sub	dword ptr [0A1D524h],1h

l006FF002:
	mov	[esp+4h],eax
	jmp	7239C0h
006FF00B                                  CC CC CC CC CC            .....

;; fn006FF010: 006FF010
;;   Called from:
;;     006FF069 (in fn006FF060)
fn006FF010 proc
	push	3E8h
	call	dword ptr [8A45BCh]
	add	esp,4h
	test	eax,eax
	jnz	6FF027h

l006FF022:
	jmp	6E1210h

l006FF027:
	mov	ecx,[0A6CD2Ch]
	mov	[eax],ecx
	mov	[0A6CD2Ch],eax
	add	eax,8h
	push	esi
	lea	esi,[eax+3D0h]
	mov	ecx,esi
	cmp	ecx,eax
	jbe	6FF050h

l006FF044:
	lea	edx,[ecx-10h]
	mov	[ecx+4h],edx
	mov	ecx,edx
	cmp	ecx,eax
	ja	6FF044h

l006FF050:
	mov	eax,esi
	mov	dword ptr [ecx+4h],0h
	pop	esi
	ret
006FF05B                                  CC CC CC CC CC            .....

;; fn006FF060: 006FF060
;;   Called from:
;;     006E9DAB (in fn006E9BD0)
;;     00736251 (in fn00735890)
;;     007362DD (in fn00735890)
;;     007369FE (in fn007367D0)
;;     00736A70 (in fn007367D0)
;;     0073D22A (in fn0073D140)
fn006FF060 proc
	mov	eax,[0A6CD30h]
	test	eax,eax
	jnz	6FF078h

l006FF069:
	call	6FF010h
	test	eax,eax
	mov	[0A6CD30h],eax
	jnz	6FF078h

l006FF077:
	ret

l006FF078:
	mov	edx,[eax+4h]
	fld	double ptr [esp+4h]
	lea	ecx,[eax+4h]
	fstp	double ptr [eax+8h]
	mov	[0A6CD30h],edx
	mov	dword ptr [ecx],0A1E4B8h
	mov	dword ptr [eax],1h
	ret
006FF098                         CC CC CC CC CC CC CC CC         ........
006FF0A0 81 EC 18 02 00 00 A1 88 41 A1 00 33 C4 89 84 24 ........A..3...$
006FF0B0 14 02 00 00 8B 84 24 20 02 00 00 85 C0 56 8B B4 ......$ .....V..
006FF0C0 24 20 02 00 00 74 06 C7 00 00 00 00 00 8B 46 04 $ ...t........F.
006FF0D0 3D 50 B4 A1 00 0F 84 EA 00 00 00 68 50 B4 A1 00 =P.........hP...
006FF0E0 50 E8 8A 65 FD FF 83 C4 08 85 C0 0F 85 D4 00 00 P..e............
006FF0F0 00 8B 46 04 3D 20 3B A2 00 74 59 68 20 3B A2 00 ..F.= ;..tYh ;..
006FF100 50 E8 6A 65 FD FF 83 C4 08 85 C0 75 47 8D 44 24 P.je.......uG.D$
006FF110 0C 50 8D 4C 24 08 51 56 E8 63 27 00 00 83 C4 0C .P.L$.QV.c'.....
006FF120 85 C0 0F 84 AD 00 00 00 8B 15 7C 6B A1 00 68 E8 ..........|k..h.
006FF130 67 8D 00 52 E8 47 1E FE FF 83 C4 08 33 C0 5E 8B g..R.G......3.^.
006FF140 8C 24 14 02 00 00 33 CC E8 41 5A F9 FF 81 C4 18 .$....3..AZ.....
006FF150 02 00 00 C3 8B 46 08 3D 00 01 00 00 7C 2B A1 2C .....F.=....|+.,
006FF160 7E A1 00 68 BC 67 8D 00 50 E8 12 1E FE FF 83 C4 ~..h.g..P.......
006FF170 08 33 C0 5E 8B 8C 24 14 02 00 00 33 CC E8 0C 5A .3.^..$....3...Z
006FF180 F9 FF 81 C4 18 02 00 00 C3 8B 56 0C 6A 00 8D 8C ..........V.j...
006FF190 24 1C 01 00 00 51 50 52 E8 73 D3 01 00 83 C4 10 $....QPR.s......
006FF1A0 85 C0 75 CD 8D 94 24 18 01 00 00 8B C2 89 54 24 ..u...$.......T$
006FF1B0 04 8D 70 01 8A 08 83 C0 01 84 C9 75 F7 2B C6 89 ..p........u.+..
006FF1C0 44 24 0C EB 14 8B 46 08 8D 56 14 89 54 24 04 89 D$....F..V..T$..
006FF1D0 44 24 0C EB 04 8B 54 24 04 8A 02 84 C0 8B 4C 24 D$....T$......L$
006FF1E0 0C 53 57 8D 3C 11 74 2D 8B 1D 84 46 8A 00 8B FF .SW.<.t-...F....
006FF1F0 0F B6 D0 52 FF D3 83 C4 04 85 C0 8B 44 24 0C 74 ...R........D$.t
006FF200 0F 83 C0 01 89 44 24 0C 8A 00 84 C0 75 E2 EB 05 .....D$.....u...
006FF210 80 38 00 75 2D A1 2C 7E A1 00 68 A0 67 8D 00 50 .8.u-.,~..h.g..P
006FF220 E8 5B 1D FE FF 83 C4 08 5F 5B 33 C0 5E 8B 8C 24 .[......_[3.^..$
006FF230 14 02 00 00 33 CC E8 53 59 F9 FF 81 C4 18 02 00 ....3..SY.......
006FF240 00 C3 8D 4C 24 10 51 50 E8 C3 FD 04 00 DD 5C 24 ...L$.QP......\$
006FF250 20 8B 35 E4 46 8A 00 83 C4 08 FF D6 C7 00 00 00  .5.F...........
006FF260 00 00 8B 44 24 10 3B C7 76 06 8B C7 89 44 24 10 ...D$.;.v....D$.
006FF270 8B 4C 24 0C 3B C1 75 43 51 68 7C 67 8D 00 8D 54 .L$.;.uCQh|g...T
006FF280 24 28 68 00 01 00 00 52 E8 53 5D 02 00 8B 0D 2C $(h....R.S]....,
006FF290 7E A1 00 8D 44 24 30 50 51 E8 E2 1C FE FF 83 C4 ~...D$0PQ.......
006FF2A0 18 5F 5B 33 C0 5E 8B 8C 24 14 02 00 00 33 CC E8 ._[3.^..$....3..
006FF2B0 DA 58 F9 FF 81 C4 18 02 00 00 C3 8A 08 84 C9 74 .X.............t
006FF2C0 1E 0F B6 D1 52 FF D3 83 C4 04 85 C0 8B 44 24 10 ....R........D$.
006FF2D0 74 3F 83 C0 01 89 44 24 10 8A 08 84 C9 75 E2 3B t?....D$.....u.;
006FF2E0 C7 74 79 8B 0D 2C 7E A1 00 68 58 67 8D 00 51 E8 .ty..,~..hXg..Q.
006FF2F0 8C 1C FE FF 83 C4 08 5F 5B 33 C0 5E 8B 8C 24 14 ......._[3.^..$.
006FF300 02 00 00 33 CC E8 84 58 F9 FF 81 C4 18 02 00 00 ...3...X........
006FF310 C3 80 38 00 74 C9 8B 44 24 0C 50 68 7C 67 8D 00 ..8.t..D$.Ph|g..
006FF320 8D 4C 24 28 68 00 01 00 00 51 E8 B1 5C 02 00 A1 .L$(h....Q..\...
006FF330 2C 7E A1 00 8D 54 24 30 52 50 E8 41 1C FE FF 83 ,~...T$0RP.A....
006FF340 C4 18 5F 5B 33 C0 5E 8B 8C 24 14 02 00 00 33 CC .._[3.^..$....3.
006FF350 E8 39 58 F9 FF 81 C4 18 02 00 00 C3 D9 EE DD 44 .9X............D
006FF360 24 18 DF E9 DD D8 9F F6 C4 44 7A 19 8B 54 24 0C $........Dz..T$.
006FF370 52 E8 3A 00 05 00 DD 5C 24 1C 83 C4 04 FF D6 C7 R.:....\$.......
006FF380 00 00 00 00 00 DD 44 24 18 83 EC 08 DD 1C 24 E8 ......D$......$.
006FF390 CC FC FF FF 8B 8C 24 28 02 00 00 83 C4 08 5F 5B ......$(......_[
006FF3A0 5E 33 CC E8 E6 57 F9 FF 81 C4 18 02 00 00 C3 CC ^3...W..........
006FF3B0 8B 44 24 04 8B 48 04 81 F9 B8 E4 A1 00 75 0F 8B .D$..H.......u..
006FF3C0 0D 30 CD A6 00 89 48 04 A3 30 CD A6 00 C3 8B 91 .0....H..0......
006FF3D0 A0 00 00 00 89 44 24 04 FF E2 CC CC CC CC CC CC .....D$.........

;; fn006FF3E0: 006FF3E0
;;   Called from:
;;     006E60B1 (in fn006E5C60)
;;     006E60F3 (in fn006E5C60)
;;     006FE47D (in fn006FE400)
;;     006FE70C (in fn006FE400)
;;     00733272 (in fn00733250)
;;     007332E2 (in fn007332C0)
;;     0073638C (in fn00735890)
fn006FF3E0 proc
	sub	esp,8h
	push	esi
	mov	esi,[esp+10h]
	test	esi,esi
	jz	6FF410h

l006FF3EC:
	mov	eax,[esi+4h]
	cmp	eax,0A1E4B8h
	jz	6FF408h

l006FF3F6:
	push	0A1E4B8h
	push	eax
	call	6D5670h
	add	esp,8h
	test	eax,eax
	jz	6FF420h

l006FF408:
	fld	double ptr [esi+8h]
	pop	esi
	add	esp,8h
	ret

l006FF410:
	call	6E11D0h
	fld	double ptr [8A86F8h]
	pop	esi
	add	esp,8h
	ret

l006FF420:
	mov	eax,[esi+4h]
	mov	eax,[eax+30h]
	test	eax,eax
	jz	6FF481h

l006FF42A:
	mov	eax,[eax+50h]
	test	eax,eax
	jz	6FF481h

l006FF431:
	push	esi
	call	eax
	mov	esi,eax
	add	esp,4h
	test	esi,esi
	jz	6FF495h

l006FF43D:
	mov	eax,[esi+4h]
	cmp	eax,0A1E4B8h
	jz	6FF460h

l006FF447:
	push	0A1E4B8h
	push	eax
	call	6D5670h
	add	esp,8h
	test	eax,eax
	jnz	6FF460h

l006FF459:
	push	8D682Ch
	jmp	6FF486h

l006FF460:
	add	dword ptr [esi],0FFh
	fld	double ptr [esi+8h]
	fstp	double ptr [esp+4h]
	jnz	6FF478h

l006FF46C:
	mov	edx,[esi+4h]
	mov	eax,[edx+18h]
	push	esi
	call	eax
	add	esp,4h

l006FF478:
	fld	double ptr [esp+4h]
	pop	esi
	add	esp,8h
	ret

l006FF481:
	push	8D6818h

l006FF486:
	mov	ecx,[0A16B7Ch]
	push	ecx
	call	6E0F80h
	add	esp,8h

l006FF495:
	fld	double ptr [8A86F8h]
	pop	esi
	add	esp,8h
	ret

;; fn006FF4A0: 006FF4A0
;;   Called from:
;;     006FF5DC (in fn006FF5D0)
;;     00701058 (in fn00700EC0)
fn006FF4A0 proc
	sub	esp,24h
	mov	eax,[0A14188h]
	xor	eax,esp
	mov	[esp+20h],eax
	mov	eax,[esp+2Ch]
	push	esi
	push	edi
	push	eax
	push	8D6850h
	mov	esi,ecx
	lea	ecx,[esp+10h]
	push	20h
	push	ecx
	mov	edi,edx
	call	724FE0h
	fld	double ptr [edi+8h]
	mov	eax,[esp+40h]
	fstp	double ptr [esp+8h]
	add	esp,8h
	lea	edx,[esp+10h]
	push	edx
	push	eax
	push	esi
	call	74F280h
	add	esp,14h
	cmp	byte ptr [esi],2Dh
	jnz	6FF4EFh

l006FF4EC:
	add	esi,1h

l006FF4EF:
	cmp	byte ptr [esi],0h
	jz	6FF51Ah

l006FF4F4:
	mov	edi,[8A4700h]
	lea	ebx,[ebx+0h]

l006FF500:
	movzx	ecx,byte ptr [esi]
	push	ecx
	call	edi
	add	esp,4h
	test	eax,eax
	jz	6FF515h

l006FF50D:
	add	esi,1h
	cmp	byte ptr [esi],0h
	jnz	6FF500h

l006FF515:
	cmp	byte ptr [esi],0h
	jnz	6FF527h

l006FF51A:
	mov	byte ptr [esi],2Eh
	add	esi,1h
	mov	byte ptr [esi],30h
	mov	byte ptr [esi+1h],0h

l006FF527:
	mov	ecx,[esp+28h]
	pop	edi
	pop	esi
	xor	ecx,esp
	call	694B8Eh
	add	esp,24h
	ret
006FF538                         CC CC CC CC CC CC CC CC         ........
006FF540 56 8B 37 8B 46 04 3D E8 E7 A1 00 74 71 68 E8 E7 V.7.F.=....tqh..
006FF550 A1 00 50 E8 18 61 FD FF 83 C4 08 85 C0 75 5F 8B ..P..a.......u_.
006FF560 46 04 3D 00 F4 A1 00 74 24 68 00 F4 A1 00 50 E8 F.=....t$h....P.
006FF570 FC 60 FD FF 83 C4 08 85 C0 75 12 83 05 80 64 A1 .`.......u....d.
006FF580 00 01 C7 07 80 64 A1 00 83 C8 FF 5E C3 56 E8 BD .....d.....^.V..
006FF590 1B 01 00 DD 13 DD 05 F8 86 8A 00 83 C4 04 D9 C9 ................
006FF5A0 DF E9 DD D8 9F F6 C4 44 7A 19 E8 11 1A FE FF 85 .......Dz.......
006FF5B0 C0 74 10 C7 07 00 00 00 00 83 C8 FF 5E C3 DB 46 .t..........^..F
006FF5C0 08 DD 1B 33 C0 5E C3 CC CC CC CC CC CC CC CC CC ...3.^..........

;; fn006FF5D0: 006FF5D0
;;   Called from:
;;     00736271 (in fn00735890)
;;     007362F5 (in fn00735890)
;;     00736414 (in fn00735890)
fn006FF5D0 proc
	mov	edx,[esp+8h]
	mov	ecx,[esp+4h]
	push	11h
	push	64h
	call	6FF4A0h
	add	esp,8h
	ret
006FF5E5                CC CC CC CC CC CC CC CC CC CC CC      ...........
006FF5F0 83 EC 68 A1 88 41 A1 00 33 C4 89 44 24 64 8B 44 ..h..A..3..D$d.D
006FF600 24 74 8B 54 24 6C 24 01 F6 D8 56 8B 74 24 74 8D $t.T$l$...V.t$t.
006FF610 4C 24 04 1B C0 83 E0 FB 83 C0 11 50 6A 64 E8 7D L$.........Pjd.}
006FF620 FE FF FF 8D 4C 24 0C 56 51 FF 15 EC 46 8A 00 8B ....L$.VQ...F...
006FF630 4C 24 78 83 C4 10 5E 33 CC 33 C0 E8 4E 55 F9 FF L$x...^3.3..NU..
006FF640 83 C4 68 C3 CC CC CC CC CC CC CC CC CC CC CC CC ..h.............
006FF650 83 EC 68 A1 88 41 A1 00 33 C4 89 44 24 64 8B 54 ..h..A..3..D$d.T
006FF660 24 6C 6A 11 6A 64 8D 4C 24 08 E8 31 FE FF FF 8D $lj.jd.L$..1....
006FF670 44 24 08 50 E8 47 D4 FE FF 8B 4C 24 70 83 C4 0C D$.P.G....L$p...
006FF680 33 CC E8 07 55 F9 FF 83 C4 68 C3 CC CC CC CC CC 3...U....h......
006FF690 83 EC 68 A1 88 41 A1 00 33 C4 89 44 24 64 8B 54 ..h..A..3..D$d.T
006FF6A0 24 6C 6A 0C 6A 64 8D 4C 24 08 E8 F1 FD FF FF 8D $lj.jd.L$.......
006FF6B0 44 24 08 50 E8 07 D4 FE FF 8B 4C 24 70 83 C4 0C D$.P......L$p...
006FF6C0 33 CC E8 C7 54 F9 FF 83 C4 68 C3 CC CC CC CC CC 3...T....h......
006FF6D0 55 8B EC 83 E4 C0 83 EC 34 8B 45 08 DD 40 08 53 U.......4.E..@.S
006FF6E0 56 DD 54 24 34 8B 75 0C 8B 46 04 33 DB 3D B8 E4 V.T$4.u..F.3.=..
006FF6F0 A1 00 57 89 5C 24 20 0F 84 4B 03 00 00 68 B8 E4 ..W.\$ ..K...h..
006FF700 A1 00 DD D8 50 E8 66 5F FD FF DD 44 24 40 83 C4 ....P.f_...D$@..
006FF710 08 85 C0 0F 85 2F 03 00 00 83 EC 08 DD 1C 24 FF ...../........$.
006FF720 15 D4 46 8A 00 83 C4 08 85 C0 8B 46 04 75 51 3D ..F........F.uQ=
006FF730 E8 E7 A1 00 74 2F 68 E8 E7 A1 00 50 E8 2F 5F FD ....t/h....P./_.
006FF740 FF 83 C4 08 85 C0 75 1D 8B 76 04 81 FE 00 F4 A1 ......u..v......
006FF750 00 74 12 68 00 F4 A1 00 56 E8 12 5F FD FF 83 C4 .t.h....V.._....
006FF760 08 85 C0 74 58 D9 EE DD 44 24 38 D9 C9 8B 45 10 ...tX...D$8...E.
006FF770 83 F8 05 0F 87 69 03 00 00 FF 24 85 FC FA 6F 00 .....i....$...o.
006FF780 3D E8 E7 A1 00 0F 84 B5 02 00 00 68 E8 E7 A1 00 =..........h....
006FF790 50 E8 DA 5E FD FF 83 C4 08 85 C0 0F 85 9F 02 00 P..^............
006FF7A0 00 8B 46 04 3D 00 F4 A1 00 74 25 68 00 F4 A1 00 ..F.=....t%h....
006FF7B0 50 E8 BA 5E FD FF 83 C4 08 85 C0 75 13 83 05 80 P..^.......u....
006FF7C0 64 A1 00 01 B8 80 64 A1 00 5F 5E 5B 8B E5 5D C3 d.....d.._^[..].
006FF7D0 DD 44 24 38 D9 C0 D9 EE D9 C0 D9 CA DF EA DD D9 .D$8............
006FF7E0 9F F6 C4 44 7A 08 DD D9 33 FF DD D8 EB 10 DF F1 ...Dz...3.......
006FF7F0 DD D8 76 05 83 CF FF EB 05 BF 01 00 00 00 56 89 ..v...........V.
006FF800 7C 24 28 E8 18 14 01 00 83 C4 04 3B F8 89 44 24 |$(........;..D$
006FF810 28 74 0D DB 44 24 24 DB 44 24 28 E9 4D FF FF FF (t..D$$.D$(.M...
006FF820 56 E8 1A 14 01 00 8B D8 83 C4 04 83 FB FF 75 1F V.............u.
006FF830 E8 8B 17 FE FF 85 C0 74 2B E8 22 19 FE FF DB 44 .......t+."....D
006FF840 24 24 DB 44 24 28 33 DB DC C0 E9 1E FF FF FF 83 $$.D$(3.........
006FF850 FB 30 77 10 56 E8 F6 18 01 00 83 C4 04 33 DB E9 .0w.V........3..
006FF860 03 FF FF FF 85 FF 7D 17 DD 44 24 38 8B 4D 10 8B ......}..D$8.M..
006FF870 14 8D C8 62 A1 00 D9 E0 DD 5C 24 38 89 55 10 DD ...b.....\$8.U..
006FF880 44 24 38 8D 44 24 34 50 83 EC 08 DD 1C 24 FF 15 D$8.D$4P.....$..
006FF890 D0 46 8A 00 8B 44 24 40 DD D8 83 C4 0C 85 C0 0F .F...D$@........
006FF8A0 8C 8C 01 00 00 3B C3 0F 82 84 01 00 00 76 0F DD .....;.......v..
006FF8B0 05 00 C0 8A 00 33 DB D9 E8 E9 AF FE FF FF 33 DB .....3........3.
006FF8C0 39 5C 24 28 C7 44 24 24 00 00 00 00 8B FE 7D 15 9\$(.D$$......}.
006FF8D0 56 E8 3A 30 00 00 8B F8 83 C4 04 85 FF 0F 84 43 V.:0...........C
006FF8E0 01 00 00 EB 03 83 06 01 DD 44 24 38 8D 4C 24 28 .........D$8.L$(
006FF8F0 51 83 EC 08 DD 1C 24 FF 15 D8 46 8A 00 DD 5C 24 Q.....$...F...\$
006FF900 44 83 C4 04 DD 44 24 30 DD 1C 24 E8 A0 0E 01 00 D....D$0..$.....
006FF910 8B F0 83 C4 08 85 F6 0F 84 DF 00 00 00 D9 EE DD ................
006FF920 44 24 38 DF E9 DD D8 9F F6 C4 44 0F 8B 91 00 00 D$8.......D.....
006FF930 00 6A 01 E8 68 57 00 00 83 C4 04 85 C0 89 44 24 .j..hW........D$
006FF940 20 0F 84 9C 00 00 00 8B D0 52 57 E8 A0 28 00 00  ........RW..(..
006FF950 8B D8 83 C4 08 85 DB 0F 84 86 00 00 00 83 07 FF ................
006FF960 75 0C 8B 47 04 8B 48 18 57 FF D1 83 C4 04 8B 54 u..G..H.W......T
006FF970 24 20 52 56 8B FB E8 75 28 00 00 8B D8 83 C4 08 $ RV...u(.......
006FF980 85 DB 74 5F 83 06 FF 75 0C 8B 46 04 8B 48 18 56 ..t_...u..F..H.V
006FF990 FF D1 83 C4 04 8B 54 24 20 52 53 8B F3 E8 2E 27 ......T$ RS....'
006FF9A0 00 00 8B D8 83 C4 08 85 DB 74 38 83 06 FF 75 0C .........t8...u.
006FF9B0 8B 46 04 8B 48 18 56 FF D1 83 C4 04 8B F3 8B 5C .F..H.V........\
006FF9C0 24 20 8B 55 10 52 57 56 E8 D3 FB FD FF 83 C4 0C $ .U.RWV........
006FF9D0 85 C0 7C 13 50 E8 86 59 FE FF 83 C4 04 89 44 24 ..|.P..Y......D$
006FF9E0 24 EB 04 8B 5C 24 20 85 F6 74 11 83 06 FF 75 0C $...\$ ..t....u.
006FF9F0 8B 46 04 8B 48 18 56 FF D1 83 C4 04 85 FF 74 11 .F..H.V.......t.
006FFA00 83 07 FF 75 0C 8B 57 04 8B 42 18 57 FF D0 83 C4 ...u..W..B.W....
006FFA10 04 85 DB 74 11 83 03 FF 75 0C 8B 4B 04 8B 51 18 ...t....u..K..Q.
006FFA20 53 FF D2 83 C4 04 8B 44 24 24 5F 5E 5B 8B E5 5D S......D$$_^[..]
006FFA30 C3 D9 E8 33 DB DD 05 00 C0 8A 00 E9 2D FD FF FF ...3........-...
006FFA40 DB 46 08 E9 1F FD FF FF DD 46 08 E9 1D FD FF FF .F.......F......
006FFA50 D9 C9 DF E9 DD D8 9F F6 C4 44 7B 6A 8B C3 50 89 .........D{j..P.
006FFA60 5C 24 24 E8 F8 58 FE FF 83 C4 04 5F 5E 5B 8B E5 \$$..X....._^[..
006FFA70 5D C3 D9 C9 DF E9 DD D8 9F F6 C4 44 7B DE C7 44 ]..........D{..D
006FFA80 24 20 01 00 00 00 8B 44 24 20 50 E8 D0 58 FE FF $ .....D$ P..X..
006FFA90 83 C4 04 5F 5E 5B 8B E5 5D C3 D9 C9 DF F1 DD D8 ..._^[..].......
006FFAA0 72 BA C7 44 24 20 01 00 00 00 8B 44 24 20 50 E8 r..D$ .....D$ P.
006FFAB0 AC 58 FE FF 83 C4 04 5F 5E 5B 8B E5 5D C3 D9 C9 .X....._^[..]...
006FFAC0 DF F1 DD D8 76 96 C7 44 24 20 01 00 00 00 8B 44 ....v..D$ .....D
006FFAD0 24 20 50 E8 88 58 FE FF 83 C4 04 5F 5E 5B 8B E5 $ P..X....._^[..
006FFAE0 5D C3 8B 44 24 20 DD D8 50 DD D8 E8 70 58 FE FF ]..D$ ..P...pX..
006FFAF0 83 C4 04 5F 5E 5B 8B E5 5D C3 8B FF C0 FA 6F 00 ..._^[..].....o.
006FFB00 9C FA 6F 00 50 FA 6F 00 72 FA 6F 00 BE FA 6F 00 ..o.P.o.r.o...o.
006FFB10 9A FA 6F 00 CC CC CC CC CC CC CC CC CC CC CC CC ..o.............
006FFB20 8B 44 24 04 DD 40 08 83 EC 08 DD 1C 24 E8 EE FA .D$..@......$...
006FFB30 FD FF 83 C4 08 C3 CC CC CC CC CC CC CC CC CC CC ................
006FFB40 83 EC 10 53 56 8B 74 24 1C 81 7E 04 B8 E4 A1 00 ...SV.t$..~.....
006FFB50 57 74 31 8B 46 04 68 B8 E4 A1 00 50 E8 0F 5B FD Wt1.F.h....P..[.
006FFB60 FF 83 C4 08 85 C0 75 1C 8D 5C 24 0C 8D 7C 24 20 ......u..\$..|$ 
006FFB70 E8 CB F9 FF FF 85 C0 7D 12 8B 44 24 20 5F 5E 5B .......}..D$ _^[
006FFB80 83 C4 10 C3 DD 46 08 DD 5C 24 0C 8B 74 24 24 81 .....F..\$..t$$.
006FFB90 7E 04 B8 E4 A1 00 74 31 8B 4E 04 68 B8 E4 A1 00 ~.....t1.N.h....
006FFBA0 51 E8 CA 5A FD FF 83 C4 08 85 C0 75 1C 8D 5C 24 Q..Z.......u..\$
006FFBB0 14 8D 7C 24 24 E8 86 F9 FF FF 85 C0 7D 10 8B 44 ..|$$.......}..D
006FFBC0 24 24 5F 5E 5B 83 C4 10 C3 DD 46 08 EB 04 DD 44 $$_^[.....F....D
006FFBD0 24 14 DC 44 24 0C A1 30 CD A6 00 85 C0 DD 5C 24 $..D$..0......\$
006FFBE0 14 75 15 E8 28 F4 FF FF 85 C0 A3 30 CD A6 00 75 .u..(......0...u
006FFBF0 07 5F 5E 5B 83 C4 10 C3 8B 50 04 DD 44 24 14 8D ._^[.....P..D$..
006FFC00 48 04 DD 58 08 5F 5E 89 15 30 CD A6 00 C7 01 B8 H..X._^..0......
006FFC10 E4 A1 00 C7 00 01 00 00 00 5B 83 C4 10 C3 CC CC .........[......
006FFC20 83 EC 10 53 56 8B 74 24 1C 81 7E 04 B8 E4 A1 00 ...SV.t$..~.....
006FFC30 57 74 31 8B 46 04 68 B8 E4 A1 00 50 E8 2F 5A FD Wt1.F.h....P./Z.
006FFC40 FF 83 C4 08 85 C0 75 1C 8D 5C 24 0C 8D 7C 24 20 ......u..\$..|$ 
006FFC50 E8 EB F8 FF FF 85 C0 7D 12 8B 44 24 20 5F 5E 5B .......}..D$ _^[
006FFC60 83 C4 10 C3 DD 46 08 DD 5C 24 0C 8B 74 24 24 81 .....F..\$..t$$.
006FFC70 7E 04 B8 E4 A1 00 74 31 8B 4E 04 68 B8 E4 A1 00 ~.....t1.N.h....
006FFC80 51 E8 EA 59 FD FF 83 C4 08 85 C0 75 1C 8D 5C 24 Q..Y.......u..\$
006FFC90 14 8D 7C 24 24 E8 A6 F8 FF FF 85 C0 7D 10 8B 44 ..|$$.......}..D
006FFCA0 24 24 5F 5E 5B 83 C4 10 C3 DD 46 08 EB 04 DD 44 $$_^[.....F....D
006FFCB0 24 14 DC 6C 24 0C A1 30 CD A6 00 85 C0 DD 5C 24 $..l$..0......\$
006FFCC0 14 75 15 E8 48 F3 FF FF 85 C0 A3 30 CD A6 00 75 .u..H......0...u
006FFCD0 07 5F 5E 5B 83 C4 10 C3 8B 50 04 DD 44 24 14 8D ._^[.....P..D$..
006FFCE0 48 04 DD 58 08 5F 5E 89 15 30 CD A6 00 C7 01 B8 H..X._^..0......
006FFCF0 E4 A1 00 C7 00 01 00 00 00 5B 83 C4 10 C3 CC CC .........[......
006FFD00 83 EC 10 53 56 8B 74 24 1C 81 7E 04 B8 E4 A1 00 ...SV.t$..~.....
006FFD10 57 74 31 8B 46 04 68 B8 E4 A1 00 50 E8 4F 59 FD Wt1.F.h....P.OY.
006FFD20 FF 83 C4 08 85 C0 75 1C 8D 5C 24 0C 8D 7C 24 20 ......u..\$..|$ 
006FFD30 E8 0B F8 FF FF 85 C0 7D 12 8B 44 24 20 5F 5E 5B .......}..D$ _^[
006FFD40 83 C4 10 C3 DD 46 08 DD 5C 24 0C 8B 74 24 24 81 .....F..\$..t$$.
006FFD50 7E 04 B8 E4 A1 00 74 31 8B 4E 04 68 B8 E4 A1 00 ~.....t1.N.h....
006FFD60 51 E8 0A 59 FD FF 83 C4 08 85 C0 75 1C 8D 5C 24 Q..Y.......u..\$
006FFD70 14 8D 7C 24 24 E8 C6 F7 FF FF 85 C0 7D 10 8B 44 ..|$$.......}..D
006FFD80 24 24 5F 5E 5B 83 C4 10 C3 DD 46 08 EB 04 DD 44 $$_^[.....F....D
006FFD90 24 14 DC 4C 24 0C A1 30 CD A6 00 85 C0 DD 5C 24 $..L$..0......\$
006FFDA0 14 75 15 E8 68 F2 FF FF 85 C0 A3 30 CD A6 00 75 .u..h......0...u
006FFDB0 07 5F 5E 5B 83 C4 10 C3 8B 50 04 DD 44 24 14 8D ._^[.....P..D$..
006FFDC0 48 04 DD 58 08 5F 5E 89 15 30 CD A6 00 C7 01 B8 H..X._^..0......
006FFDD0 E4 A1 00 C7 00 01 00 00 00 5B 83 C4 10 C3 CC CC .........[......
006FFDE0 83 EC 10 53 56 8B 74 24 1C 81 7E 04 B8 E4 A1 00 ...SV.t$..~.....
006FFDF0 57 74 31 8B 46 04 68 B8 E4 A1 00 50 E8 6F 58 FD Wt1.F.h....P.oX.
006FFE00 FF 83 C4 08 85 C0 75 1C 8D 5C 24 0C 8D 7C 24 20 ......u..\$..|$ 
006FFE10 E8 2B F7 FF FF 85 C0 7D 12 8B 44 24 20 5F 5E 5B .+.....}..D$ _^[
006FFE20 83 C4 10 C3 DD 46 08 DD 5C 24 0C 8B 74 24 24 81 .....F..\$..t$$.
006FFE30 7E 04 B8 E4 A1 00 74 31 8B 4E 04 68 B8 E4 A1 00 ~.....t1.N.h....
006FFE40 51 E8 2A 58 FD FF 83 C4 08 85 C0 75 1C 8D 5C 24 Q.*X.......u..\$
006FFE50 14 8D 7C 24 24 E8 E6 F6 FF FF 85 C0 7D 10 8B 44 ..|$$.......}..D
006FFE60 24 24 5F 5E 5B 83 C4 10 C3 DD 46 08 EB 04 DD 44 $$_^[.....F....D
006FFE70 24 14 D9 C0 D9 EE D9 C9 DF E9 DD D8 9F F6 C4 44 $..............D
006FFE80 7A 1F 8B 15 9C 85 A1 00 DD D8 68 58 68 8D 00 52 z.........hXh..R
006FFE90 E8 EB 10 FE FF 83 C4 08 5F 5E 33 C0 5B 83 C4 10 ........_^3.[...
006FFEA0 C3 DC 7C 24 0C A1 30 CD A6 00 85 C0 DD 5C 24 14 ..|$..0......\$.
006FFEB0 75 0E E8 59 F1 FF FF 85 C0 A3 30 CD A6 00 74 D8 u..Y......0...t.
006FFEC0 8B 50 04 DD 44 24 14 8D 48 04 DD 58 08 5F 5E 89 .P..D$..H..X._^.
006FFED0 15 30 CD A6 00 C7 01 B8 E4 A1 00 C7 00 01 00 00 .0..............
006FFEE0 00 5B 83 C4 10 C3 CC CC CC CC CC CC CC CC CC CC .[..............
006FFEF0 83 EC 10 53 56 8B 74 24 1C 81 7E 04 B8 E4 A1 00 ...SV.t$..~.....
006FFF00 57 74 31 8B 46 04 68 B8 E4 A1 00 50 E8 5F 57 FD Wt1.F.h....P._W.
006FFF10 FF 83 C4 08 85 C0 75 1C 8D 5C 24 14 8D 7C 24 20 ......u..\$..|$ 
006FFF20 E8 1B F6 FF FF 85 C0 7D 12 8B 44 24 20 5F 5E 5B .......}..D$ _^[
006FFF30 83 C4 10 C3 DD 46 08 DD 5C 24 14 8B 74 24 24 81 .....F..\$..t$$.
006FFF40 7E 04 B8 E4 A1 00 74 31 8B 4E 04 68 B8 E4 A1 00 ~.....t1.N.h....
006FFF50 51 E8 1A 57 FD FF 83 C4 08 85 C0 75 1C 8D 5C 24 Q..W.......u..\$
006FFF60 0C 8D 7C 24 24 E8 D6 F5 FF FF 85 C0 7D 12 8B 44 ..|$$.......}..D
006FFF70 24 24 5F 5E 5B 83 C4 10 C3 DD 46 08 DD 5C 24 0C $$_^[.....F..\$.
006FFF80 83 3D 04 4B A7 00 02 7C 1A 8B 15 34 8A A1 00 6A .=.K...|...4...j
006FFF90 01 68 68 68 8D 00 52 E8 D4 19 FE FF 83 C4 0C 85 .hhh..R.........
006FFFA0 C0 7C 29 DD 44 24 0C D9 C0 D9 EE D9 C9 DF E9 DD .|).D$..........
006FFFB0 D8 9F F6 C4 44 7A 1E A1 9C 85 A1 00 DD D8 68 58 ....Dz........hX
006FFFC0 68 8D 00 50 E8 B7 0F FE FF 83 C4 08 5F 5E 33 C0 h..P........_^3.
006FFFD0 5B 83 C4 10 C3 DC 7C 24 14 A1 30 CD A6 00 85 C0 [.....|$..0.....
006FFFE0 DD 5C 24 14 75 0E E8 25 F0 FF FF 85 C0 A3 30 CD .\$.u..%......0.
006FFFF0 A6 00 74 D8 8B 50 04 DD 44 24 14 8D 48 04 DD 58 ..t..P..D$..H..X
00700000 08 5F 5E 89 15 30 CD A6 00 C7 01 B8 E4 A1 00 C7 ._^..0..........
00700010 00 01 00 00 00 5B 83 C4 10 C3 CC CC CC CC CC CC .....[..........
00700020 83 EC 10 53 56 8B 74 24 1C 81 7E 04 B8 E4 A1 00 ...SV.t$..~.....
00700030 57 74 31 8B 46 04 68 B8 E4 A1 00 50 E8 2F 56 FD Wt1.F.h....P./V.
00700040 FF 83 C4 08 85 C0 75 1C 8D 5C 24 14 8D 7C 24 20 ......u..\$..|$ 
00700050 E8 EB F4 FF FF 85 C0 7D 12 8B 44 24 20 5F 5E 5B .......}..D$ _^[
00700060 83 C4 10 C3 DD 46 08 DD 5C 24 14 8B 74 24 24 81 .....F..\$..t$$.
00700070 7E 04 B8 E4 A1 00 74 31 8B 4E 04 68 B8 E4 A1 00 ~.....t1.N.h....
00700080 51 E8 EA 55 FD FF 83 C4 08 85 C0 75 1C 8D 5C 24 Q..U.......u..\$
00700090 0C 8D 7C 24 24 E8 A6 F4 FF FF 85 C0 7D 14 8B 44 ..|$$.......}..D
007000A0 24 24 5F 5E 5B 83 C4 10 C3 DD 46 08 DD 54 24 0C $$_^[.....F..T$.
007000B0 EB 04 DD 44 24 0C D9 C0 D9 EE D9 C9 DF E9 DD D8 ...D$...........
007000C0 9F F6 C4 44 7A 1F 8B 15 9C 85 A1 00 DD D8 68 80 ...Dz.........h.
007000D0 68 8D 00 52 E8 A7 0E FE FF 83 C4 08 5F 5E 33 C0 h..R........_^3.
007000E0 5B 83 C4 10 C3 DD 44 24 14 D9 C9 E8 3A 51 F9 FF [.....D$....:Q..
007000F0 DD 54 24 14 D9 C0 D9 EE D9 C0 D9 CA DF EA DD D9 .T$.............
00700100 9F F6 C4 44 7B 2C DD 44 24 0C D9 C9 DB F1 76 07 ...D{,.D$.....v.
00700110 B9 01 00 00 00 EB 02 33 C9 DF F2 76 07 B8 01 00 .......3...v....
00700120 00 00 EB 02 33 C0 3B C8 74 08 DE C1 DD 54 24 14 ....3.;.t....T$.
00700130 EB 02 DD D8 A1 30 CD A6 00 85 C0 75 14 DD D8 E8 .....0.....u....
00700140 CC EE FF FF 85 C0 A3 30 CD A6 00 74 8F DD 44 24 .......0...t..D$
00700150 14 8B 50 04 DD 58 08 8D 48 04 5F 5E 89 15 30 CD ..P..X..H._^..0.
00700160 A6 00 C7 01 B8 E4 A1 00 C7 00 01 00 00 00 5B 83 ..............[.
00700170 C4 10 C3 CC CC CC CC CC CC CC CC CC CC CC CC CC ................
00700180 55 8B EC 83 E4 C0 83 EC 38 53 57 8B 7D 08 81 7F U.......8SW.}...
00700190 04 B8 E4 A1 00 74 2E 8B 47 04 68 B8 E4 A1 00 50 .....t..G.h....P
007001A0 E8 CB 54 FD FF 83 C4 08 85 C0 75 19 8D 5C 24 30 ..T.......u..\$0
007001B0 8D 7D 08 E8 88 F3 FF FF 85 C0 7D 10 8B 45 08 5F .}........}..E._
007001C0 5B 8B E5 5D C3 DD 47 08 DD 5C 24 30 8B 7D 0C 81 [..]..G..\$0.}..
007001D0 7F 04 B8 E4 A1 00 74 2E 8B 4F 04 68 B8 E4 A1 00 ......t..O.h....
007001E0 51 E8 8A 54 FD FF 83 C4 08 85 C0 75 19 8D 5C 24 Q..T.......u..\$
007001F0 38 8D 7D 0C E8 47 F3 FF FF 85 C0 7D 12 8B 45 0C 8.}..G.....}..E.
00700200 5F 5B 8B E5 5D C3 DD 47 08 DD 54 24 38 EB 04 DD _[..]..G..T$8...
00700210 44 24 38 D9 C0 D9 EE D9 C9 DF E9 DD D8 9F F6 C4 D$8.............
00700220 44 7A 1E 8B 15 9C 85 A1 00 DD D8 68 98 68 8D 00 Dz.........h.h..
00700230 52 E8 4A 0D FE FF 83 C4 08 33 C0 5F 5B 8B E5 5D R.J......3._[..]
00700240 C3 DD 44 24 30 D9 C9 E8 DE 4F F9 FF DD 54 24 28 ..D$0....O...T$(
00700250 D9 E8 D9 C0 DD 44 24 38 DC F9 DD 44 24 30 D8 E4 .....D$8...D$0..
00700260 D8 CA DD 54 24 38 D9 C4 D9 EE D9 C0 D9 CA DF EA ...T$8..........
00700270 DD D9 9F F6 C4 44 7B 38 DB F2 76 07 B9 01 00 00 .....D{8..v.....
00700280 00 EB 02 33 C9 DB F5 76 07 B8 01 00 00 00 EB 02 ...3...v........
00700290 33 C0 3B C8 74 78 D9 CD DE C2 D9 C9 DD 54 24 28 3.;.tx.......T$(
007002A0 D9 C9 DE E3 D9 CA DD 54 24 38 D9 CA D9 CB EB 20 .......T$8..... 
007002B0 DD DC D9 C4 DE CD D9 CC DD 54 24 28 D9 CB DB F1 .........T$(....
007002C0 DD D9 D9 CA 76 06 D9 E0 DD 54 24 28 D9 CB D9 CA ....v....T$(....
007002D0 D9 C2 DF E9 DD D8 9F F6 C4 44 7B 38 DD DA 83 EC .........D{8....
007002E0 08 DD D9 DD 1C 24 E8 33 4F F9 FF DD 44 24 40 83 .....$.3O...D$@.
007002F0 C4 08 D8 E1 DD 05 50 B8 8A 00 D9 C9 DF F1 DD D8 ......P.........
00700300 76 06 DC 05 C8 D1 8A 00 DD 44 24 28 EB 12 DD DA v........D$(....
00700310 DD DB EB BC D9 C1 DE CA DE C9 DC 4C 24 30 D9 C9 ...........L$0..
00700320 83 EC 10 DD 5C 24 08 DD 1C 24 68 90 68 8D 00 E8 ....\$...$h.h...
00700330 CC 9E FE FF 83 C4 14 5F 5B 8B E5 5D C3 CC CC CC ......._[..]....
00700340 8B 44 24 08 8B 4C 24 04 50 51 E8 31 FE FF FF 83 .D$..L$.PQ.1....
00700350 C4 08 85 C0 74 22 3D 80 64 A1 00 74 1B 56 8B 70 ....t"=.d..t.V.p
00700360 0C 83 06 01 83 00 FF 75 0C 8B 50 04 50 8B 42 18 .......u..P.P.B.
00700370 FF D0 83 C4 04 8B C6 5E C3 CC CC CC CC CC CC CC .......^........
00700380 55 8B EC 83 E4 C0 83 EC 34 81 7D 10 B8 63 A1 00 U.......4.}..c..
00700390 53 56 57 74 1C A1 7C 6B A1 00 68 10 69 8D 00 50 SVWt..|k..h.i..P
007003A0 E8 DB 0B FE FF 83 C4 08 33 C0 5F 5E 5B 8B E5 5D ........3._^[..]
007003B0 C3 8B 7D 08 BE B8 E4 A1 00 39 77 04 74 2B 8B 4F ..}......9w.t+.O
007003C0 04 56 51 E8 A8 52 FD FF 83 C4 08 85 C0 75 1A 8D .VQ..R.......u..
007003D0 5C 24 38 8D 7D 08 E8 65 F1 FF FF 85 C0 7D 11 8B \$8.}..e.....}..
007003E0 45 08 5F 5E 5B 8B E5 5D C3 DD 47 08 DD 5C 24 38 E._^[..]..G..\$8
007003F0 8B 7D 0C 39 77 04 74 2B 8B 57 04 56 52 E8 6E 52 .}.9w.t+.W.VR.nR
00700400 FD FF 83 C4 08 85 C0 75 1A 8D 5C 24 30 8D 7D 0C .......u..\$0.}.
00700410 E8 2B F1 FF FF 85 C0 7D 13 8B 45 0C 5F 5E 5B 8B .+.....}..E._^[.
00700420 E5 5D C3 DD 47 08 DD 54 24 30 EB 04 DD 44 24 30 .]..G..T$0...D$0
00700430 D9 C0 D9 EE D9 C0 D9 CA DF EA DD D9 9F F6 C4 44 ...............D
00700440 7A 0B DD D8 DD D8 D9 E8 E9 9C 01 00 00 DD 44 24 z.............D$
00700450 38 D9 C0 D9 C2 D9 C9 DF E9 DD D8 9F F6 C4 44 7A 8.............Dz
00700460 2A DD D8 DB F1 DD D9 0F 86 7C 01 00 00 A1 9C 85 *........|......
00700470 A1 00 DD D8 68 E0 68 8D 00 50 E8 01 0B FE FF 83 ....h.h..P......
00700480 C4 08 33 C0 5F 5E 5B 8B E5 5D C3 D9 C9 DF F1 DD ..3._^[..]......
00700490 D8 0F 86 9D 00 00 00 83 EC 08 DD 1C 24 E8 7C 4D ............$.|M
007004A0 F9 FF DD 44 24 38 83 C4 08 D9 C0 DF EA DD D9 9F ...D$8..........
007004B0 F6 C4 44 7B 1F 8B 0D 2C 7E A1 00 DD D8 68 A8 68 ..D{...,~....h.h
007004C0 8D 00 51 E8 B8 0A FE FF 83 C4 08 33 C0 5F 5E 5B ..Q........3._^[
007004D0 8B E5 5D C3 DD 05 F8 86 8A 00 DD 44 24 38 DF E9 ..]........D$8..
007004E0 DD D8 9F F6 C4 44 7A 4C 83 EC 08 DD 1C 24 FF 15 .....DzL.....$..
007004F0 D4 46 8A 00 83 C4 08 85 C0 74 3B DD 44 24 30 83 .F.......t;.D$0.
00700500 EC 08 DC 0D 50 B8 8A 00 DD 1C 24 E8 0E 4D F9 FF ....P.....$..M..
00700510 DC C0 83 C4 08 DD 44 24 30 D9 C9 DF E9 DD D8 9F ......D$0.......
00700520 F6 C4 44 0F 8B 1D FF FF FF DD 05 F8 86 8A 00 E9 ..D.............
00700530 B5 00 00 00 DD D8 8B 35 E4 46 8A 00 FF D6 DD 44 .......5.F.....D
00700540 24 38 DD 44 24 30 C7 00 00 00 00 00 E8 D3 4C F9 $8.D$0........L.
00700550 FF DD 5C 24 38 FF D6 83 38 00 75 40 DD 44 24 38 ..\$8...8.u@.D$8
00700560 8B 0D 18 47 8A 00 D9 C0 DD 01 D9 C9 DF E9 DD D8 ...G............
00700570 9F F6 C4 44 7B 1A DD 01 D9 E0 D9 C9 DF E9 DD D8 ...D{...........
00700580 9F F6 C4 44 7A 35 FF D6 C7 00 22 00 00 00 EB 2B ...Dz5...."....+
00700590 DD D8 FF D6 C7 00 22 00 00 00 EB 1F FF D6 83 38 ......"........8
007005A0 22 75 18 D9 EE DD 44 24 38 DF E9 DD D8 9F F6 C4 "u....D$8.......
007005B0 44 7A 08 FF D6 C7 00 00 00 00 00 FF D6 83 38 00 Dz............8.
007005C0 74 23 FF D6 83 38 22 A1 98 85 A1 00 74 05 A1 2C t#...8".....t..,
007005D0 7E A1 00 50 E8 17 0E FE FF 83 C4 04 33 C0 5F 5E ~..P........3._^
007005E0 5B 8B E5 5D C3 DD 44 24 38 83 EC 08 DD 1C 24 E8 [..]..D$8.....$.
007005F0 6C EA FF FF 83 C4 08 5F 5E 5B 8B E5 5D C3 CC CC l......_^[..]...
00700600 83 EC 08 8B 44 24 0C DD 40 08 A1 30 CD A6 00 85 ....D$..@..0....
00700610 C0 D9 E0 DD 1C 24 75 12 E8 F3 E9 FF FF 85 C0 A3 .....$u.........
00700620 30 CD A6 00 75 04 83 C4 08 C3 8B 50 04 DD 04 24 0...u......P...$
00700630 8D 48 04 DD 58 08 89 15 30 CD A6 00 C7 01 B8 E4 .H..X...0.......
00700640 A1 00 C7 00 01 00 00 00 83 C4 08 C3 CC CC CC CC ................
00700650 8B 44 24 04 83 EC 08 81 78 04 B8 E4 A1 00 75 07 .D$.....x.....u.
00700660 83 00 01 83 C4 08 C3 DD 40 08 A1 30 CD A6 00 85 ........@..0....
00700670 C0 DD 1C 24 75 12 E8 95 E9 FF FF 85 C0 A3 30 CD ...$u.........0.
00700680 A6 00 75 04 83 C4 08 C3 8B 50 04 DD 04 24 8D 48 ..u......P...$.H
00700690 04 DD 58 08 89 15 30 CD A6 00 C7 01 B8 E4 A1 00 ..X...0.........
007006A0 C7 00 01 00 00 00 83 C4 08 C3 CC CC CC CC CC CC ................
007006B0 83 EC 08 8B 44 24 0C DD 40 08 A1 30 CD A6 00 85 ....D$..@..0....
007006C0 C0 D9 E1 DD 1C 24 75 12 E8 43 E9 FF FF 85 C0 A3 .....$u..C......
007006D0 30 CD A6 00 75 04 83 C4 08 C3 8B 50 04 DD 04 24 0...u......P...$
007006E0 8D 48 04 DD 58 08 89 15 30 CD A6 00 C7 01 B8 E4 .H..X...0.......
007006F0 A1 00 C7 00 01 00 00 00 83 C4 08 C3 CC CC CC CC ................
00700700 8B 44 24 04 D9 EE DD 40 08 DF E9 DD D8 9F F6 C4 .D$....@........
00700710 44 7B 06 B8 01 00 00 00 C3 33 C0 C3 CC CC CC CC D{.......3......
00700720 83 EC 08 56 8B 74 24 14 8B 06 8B 40 04 3D E8 E7 ...V.t$....@.=..
00700730 A1 00 0F 84 CB 00 00 00 68 E8 E7 A1 00 50 E8 2D ........h....P.-
00700740 4F FD FF 83 C4 08 85 C0 0F 85 B5 00 00 00 8B 0E O...............
00700750 8B 41 04 3D 00 F4 A1 00 74 4F 68 00 F4 A1 00 50 .A.=....tOh....P
00700760 E8 0B 4F FD FF 83 C4 08 85 C0 75 3D 8B 16 8B 42 ..O.......u=...B
00700770 04 3D B8 E4 A1 00 74 1C 68 B8 E4 A1 00 50 E8 ED .=....t.h....P..
00700780 4E FD FF 83 C4 08 85 C0 75 0A B8 01 00 00 00 5E N.......u......^
00700790 83 C4 08 C3 8B 44 24 10 8B 00 83 00 01 8B 36 83 .....D$.......6.
007007A0 06 01 33 C0 5E 83 C4 08 C3 8B 0E 51 E8 9F 09 01 ..3.^......Q....
007007B0 00 DD 54 24 08 D9 C0 83 C4 04 DD 05 F8 86 8A 00 ..T$............
007007C0 D9 C9 DF E9 DD D8 9F F6 C4 44 7A 17 DD D8 E8 ED .........Dz.....
007007D0 07 FE FF 85 C0 74 08 83 C8 FF 5E 83 C4 08 C3 DD .....t....^.....
007007E0 44 24 04 83 EC 08 DD 1C 24 E8 72 E8 FF FF 8B 54 D$......$.r....T
007007F0 24 18 89 06 8B 02 83 00 01 83 C4 08 33 C0 5E 83 $...........3.^.
00700800 C4 08 C3 8B 06 50 E8 95 49 00 00 89 44 24 18 A1 .....P..I...D$..
00700810 30 CD A6 00 83 C4 04 85 C0 75 20 E8 F0 E7 FF FF 0........u .....
00700820 85 C0 A3 30 CD A6 00 75 12 89 06 8B 44 24 10 8B ...0...u....D$..
00700830 00 83 00 01 33 C0 5E 83 C4 08 C3 8B 50 04 DB 44 ....3.^.....P..D
00700840 24 14 8D 48 04 C7 00 01 00 00 00 DD 58 08 C7 01 $..H........X...
00700850 B8 E4 A1 00 89 06 8B 44 24 10 8B 00 83 00 01 89 .......D$.......
00700860 15 30 CD A6 00 33 C0 5E 83 C4 08 C3 CC CC CC CC .0...3.^........
00700870 8B 44 24 04 50 E8 66 EB FF FF 51 DD 1C 24 E8 2D .D$.P.f...Q..$.-
00700880 FF 00 00 83 C4 08 C3 CC CC CC CC CC CC CC CC CC ................
00700890 8B 44 24 04 83 EC 08 50 E8 43 EB FF FF 83 C4 04 .D$....P.C......
007008A0 8D 0C 24 51 83 EC 08 DD 1C 24 FF 15 D8 46 8A 00 ..$Q.....$...F..
007008B0 DD D8 83 C4 0C DD 05 F0 1D 8D 00 DD 04 24 DB F1 .............$..
007008C0 DD D9 76 1C DD 05 10 1E 8D 00 DF F1 76 12 E8 6D ..v.........v..m
007008D0 47 F9 FF 50 E8 C7 47 00 00 83 C4 04 83 C4 08 C3 G..P..G.........
007008E0 83 EC 08 DD 1C 24 E8 C5 FE 00 00 83 C4 08 83 C4 .....$..........
007008F0 08 C3 CC CC CC CC CC CC CC CC CC CC CC CC CC CC ................
00700900 51 8B 44 24 08 3D B8 E4 A1 00 8B 4C 24 10 8B 54 Q.D$.=.....L$..T
00700910 24 0C C7 04 24 D8 91 A1 00 74 0D 51 52 50 E8 6D $...$....t.QRP.m
00700920 00 00 00 83 C4 0C 59 C3 8D 04 24 50 68 10 E0 A1 ......Y...$Ph...
00700930 00 68 54 69 8D 00 51 52 E8 C3 71 FE FF 83 C4 14 .hTi..QR..q.....
00700940 85 C0 75 02 59 C3 8B 04 24 81 78 04 50 B4 A1 00 ..u.Y...$.x.P...
00700950 74 26 8B 40 04 68 50 B4 A1 00 50 E8 10 4D FD FF t&.@.hP...P..M..
00700960 83 C4 08 85 C0 75 0E 8B 0C 24 51 E8 E0 26 00 00 .....u...$Q..&..
00700970 83 C4 04 59 C3 8B 04 24 6A 00 50 E8 20 E7 FF FF ...Y...$j.P. ...
00700980 83 C4 08 59 C3 CC CC CC CC CC CC CC CC CC CC CC ...Y............
00700990 8B 44 24 0C 8B 4C 24 08 56 50 51 68 B8 E4 A1 00 .D$..L$.VPQh....
007009A0 E8 5B FF FF FF 8B F0 83 C4 0C 85 F6 75 02 5E C3 .[..........u.^.
007009B0 8B 44 24 08 8B 90 98 00 00 00 57 6A 00 50 FF D2 .D$.......Wj.P..
007009C0 8B F8 83 C4 08 85 FF 75 16 83 06 FF 75 0C 8B 46 .......u....u..F
007009D0 04 8B 48 18 56 FF D1 83 C4 04 5F 33 C0 5E C3 DD ..H.V....._3.^..
007009E0 46 08 DD 5F 08 83 06 FF 75 0C 8B 56 04 8B 42 18 F.._....u..V..B.
007009F0 56 FF D0 83 C4 04 8B C7 5F 5E C3 CC CC CC CC CC V......._^......
00700A00 8B 44 24 04 DD 40 08 83 EC 08 DD 1C 24 68 60 69 .D$..@......$h`i
00700A10 8D 00 E8 E9 97 FE FF 83 C4 0C C3 CC CC CC CC CC ................
00700A20 56 8B 74 24 0C 8B 46 04 3D 50 B4 A1 00 74 31 68 V.t$..F.=P...t1h
00700A30 50 B4 A1 00 50 E8 36 4C FD FF 83 C4 08 85 C0 75 P...P.6L.......u
00700A40 1F 8B 46 04 8B 48 0C 8B 15 7C 6B A1 00 51 68 EC ..F..H...|k..Qh.
00700A50 69 8D 00 52 E8 77 0B FE FF 83 C4 0C 33 C0 5E C3 i..R.w......3.^.
00700A60 8D 46 14 57 BF E8 30 8B 00 8B F0 B9 07 00 00 00 .F.W..0.........
00700A70 33 D2 F3 A6 75 07 A1 1C CD A6 00 EB 17 8B F0 BF 3...u...........
00700A80 B8 BA 8A 00 B9 06 00 00 00 33 C0 F3 A6 75 56 A1 .........3...uV.
00700A90 28 CD A6 00 83 E8 00 74 3C 83 E8 01 74 27 83 E8 (......t<...t'..
00700AA0 01 74 12 68 C4 69 8D 00 E8 43 7C FE FF 83 C4 04 .t.h.i...C|.....
00700AB0 5F 33 C0 5E C3 68 B0 69 8D 00 E8 01 C0 FE FF 83 _3.^.h.i........
00700AC0 C4 04 5F 5E C3 68 9C 69 8D 00 E8 F1 BF FE FF 83 .._^.h.i........
00700AD0 C4 04 5F 5E C3 68 C4 89 8A 00 E8 E1 BF FE FF 83 .._^.h..........
00700AE0 C4 04 5F 5E C3 8B 0D 2C 7E A1 00 68 64 69 8D 00 .._^...,~..hdi..
00700AF0 51 E8 8A 04 FE FF 83 C4 08 5F 33 C0 5E C3 CC CC Q........_3.^...
00700B00 8B 54 24 08 83 EC 08 8D 44 24 04 50 8D 4C 24 04 .T$.....D$.P.L$.
00700B10 51 68 FC 6A 8D 00 52 E8 64 71 FE FF 83 C4 10 85 Qh.j..R.dq......
00700B20 C0 75 04 83 C4 08 C3 8B 04 24 53 56 57 BF E8 30 .u.......$SVW..0
00700B30 8B 00 8B F0 B9 07 00 00 00 33 D2 F3 A6 75 0D 8B .........3...u..
00700B40 1D 20 CD A6 00 BA 1C CD A6 00 EB 21 8B F0 BF B8 . .........!....
00700B50 BA 8A 00 B9 06 00 00 00 33 C0 F3 A6 0F 85 AE 00 ........3.......
00700B60 00 00 8B 1D 24 CD A6 00 BA 28 CD A6 00 8B 44 24 ....$....(....D$
00700B70 10 55 BF C4 89 8A 00 8B F0 B9 08 00 00 00 33 ED .U............3.
00700B80 F3 A6 75 18 33 C0 83 05 B8 63 A1 00 01 5D 5F 5E ..u.3....c...]_^
00700B90 89 02 B8 B8 63 A1 00 5B 83 C4 08 C3 BF B0 69 8D ....c..[......i.
00700BA0 00 8B F0 B9 14 00 00 00 33 ED F3 A6 75 07 B8 02 ........3...u...
00700BB0 00 00 00 EB 17 8B F0 BF 9C 69 8D 00 B9 11 00 00 .........i......
00700BC0 00 33 C0 F3 A6 75 2C B8 01 00 00 00 3B C3 74 B6 .3...u,.....;.t.
00700BD0 8B 4C 24 10 8B 15 2C 7E A1 00 51 68 B8 6A 8D 00 .L$...,~..Qh.j..
00700BE0 52 E8 EA 09 FE FF 83 C4 0C 5D 5F 5E 33 C0 5B 83 R........]_^3.[.
00700BF0 C4 08 C3 A1 2C 7E A1 00 68 58 6A 8D 00 50 E8 7D ....,~..hXj..P.}
00700C00 03 FE FF 83 C4 08 5D 5F 5E 33 C0 5B 83 C4 08 C3 ......]_^3.[....
00700C10 8B 0D 2C 7E A1 00 68 20 6A 8D 00 51 E8 5F 03 FE ..,~..h j..Q._..
00700C20 FF 83 C4 08 5F 5E 33 C0 5B 83 C4 08 C3 CC CC CC ...._^3.[.......
00700C30 83 EC 08 DD 05 40 6B 8D 00 53 56 DD 5C 24 08 BA .....@k..SV.\$..
00700C40 08 00 00 00 B8 30 6B 8D 00 8D 4C 24 08 57 8B FF .....0k...L$.W..
00700C50 8B 31 3B 30 75 12 83 EA 04 83 C0 04 83 C1 04 83 .1;0u...........
00700C60 FA 04 73 EC 85 D2 74 5D 0F B6 31 0F B6 38 2B F7 ..s...t]..1..8+.
00700C70 75 45 83 EA 01 83 C0 01 83 C1 01 85 D2 74 46 0F uE...........tF.
00700C80 B6 31 0F B6 38 2B F7 75 2E 83 EA 01 83 C0 01 83 .1..8+.u........
00700C90 C1 01 85 D2 74 2F 0F B6 31 0F B6 38 2B F7 75 17 ....t/..1..8+.u.
00700CA0 83 EA 01 83 C0 01 83 C1 01 85 D2 74 18 0F B6 31 ...........t...1
00700CB0 0F B6 00 2B F0 74 0E 85 F6 B8 01 00 00 00 7F 07 ...+.t..........
00700CC0 83 C8 FF EB 02 33 C0 85 C0 75 0A BF 01 00 00 00 .....3...u......
00700CD0 E9 91 00 00 00 B8 08 00 00 00 B9 24 6B 8D 00 8D ...........$k...
00700CE0 54 24 0C 8B 32 3B 31 75 12 83 E8 04 83 C1 04 83 T$..2;1u........
00700CF0 C2 04 83 F8 04 73 EC 85 C0 74 5D 0F B6 39 0F B6 .....s...t]..9..
00700D00 32 2B F7 75 45 83 E8 01 83 C1 01 83 C2 01 85 C0 2+.uE...........
00700D10 74 46 0F B6 39 0F B6 32 2B F7 75 2E 83 E8 01 83 tF..9..2+.u.....
00700D20 C1 01 83 C2 01 85 C0 74 2F 0F B6 39 0F B6 32 2B .......t/..9..2+
00700D30 F7 75 17 83 E8 01 83 C1 01 83 C2 01 85 C0 74 18 .u............t.
00700D40 0F B6 09 0F B6 32 2B F1 74 0E 85 F6 B8 01 00 00 .....2+.t.......
00700D50 00 7F 07 83 C8 FF EB 02 33 C0 F7 D8 1B C0 83 E0 ........3.......
00700D60 FE 83 C0 02 8B F8 F3 0F 10 05 20 6B 8D 00 89 3D .......... k...=
00700D70 20 CD A6 00 F3 0F 11 44 24 0C B8 04 00 00 00 B9  ......D$.......
00700D80 18 6B 8D 00 8D 54 24 0C 8B 32 3B 31 75 12 83 E8 .k...T$..2;1u...
00700D90 04 83 C1 04 83 C2 04 83 F8 04 73 EC 85 C0 74 5D ..........s...t]
00700DA0 0F B6 32 0F B6 19 2B F3 75 45 83 E8 01 83 C1 01 ..2...+.uE......
00700DB0 83 C2 01 85 C0 74 46 0F B6 32 0F B6 19 2B F3 75 .....tF..2...+.u
00700DC0 2E 83 E8 01 83 C1 01 83 C2 01 85 C0 74 2F 0F B6 ............t/..
00700DD0 32 0F B6 19 2B F3 75 17 83 E8 01 83 C1 01 83 C2 2...+.u.........
00700DE0 01 85 C0 74 18 0F B6 32 0F B6 11 2B F2 74 0E 85 ...t...2...+.t..
00700DF0 F6 B8 01 00 00 00 7F 07 83 C8 FF EB 02 33 C0 85 .............3..
00700E00 C0 75 0A B8 01 00 00 00 E9 94 00 00 00 B8 04 00 .u..............
00700E10 00 00 B9 10 6B 8D 00 8D 54 24 0C EB 03 8D 49 00 ....k...T$....I.
00700E20 8B 32 3B 31 75 12 83 E8 04 83 C1 04 83 C2 04 83 .2;1u...........
00700E30 F8 04 73 EC 85 C0 74 5D 0F B6 19 0F B6 32 2B F3 ..s...t].....2+.
00700E40 75 45 83 E8 01 83 C1 01 83 C2 01 85 C0 74 46 0F uE...........tF.
00700E50 B6 19 0F B6 32 2B F3 75 2E 83 E8 01 83 C1 01 83 ....2+.u........
00700E60 C2 01 85 C0 74 2F 0F B6 19 0F B6 32 2B F3 75 17 ....t/.....2+.u.
00700E70 83 E8 01 83 C1 01 83 C2 01 85 C0 74 18 0F B6 01 ...........t....
00700E80 0F B6 32 2B F0 74 0E 85 F6 B8 01 00 00 00 7F 07 ..2+.t..........
00700E90 83 C8 FF EB 02 33 C0 F7 D8 1B C0 83 E0 FE 83 C0 .....3..........
00700EA0 02 89 3D 1C CD A6 00 5F 5E A3 28 CD A6 00 A3 24 ..=...._^.(....$
00700EB0 CD A6 00 5B 83 C4 08 C3 CC CC CC CC CC CC CC CC ...[............

;; fn00700EC0: 00700EC0
;;   Called from:
;;     006E89B2 (in fn006E8910)
fn00700EC0 proc
	sub	esp,70h
	mov	eax,[0A14188h]
	xor	eax,esp
	mov	[esp+6Ch],eax
	mov	edx,[0A6CD2Ch]
	push	ebx
	push	ebp
	xor	ebp,ebp
	cmp	edx,ebp
	push	esi
	push	edi
	mov	[esp+10h],ebp
	mov	[esp+14h],ebp
	mov	[0A6CD2Ch],ebp
	mov	[0A6CD30h],ebp
	jz	700FA2h

l00700EF6:
	lea	eax,[edx+8h]
	add	ebp,1h
	xor	edi,edi
	mov	ecx,eax
	mov	esi,1Fh

l00700F05:
	mov	ebx,0A1E4B8h
	cmp	[ecx+4h],ebx
	jnz	700F17h

l00700F0F:
	cmp	dword ptr [ecx],0h
	jz	700F17h

l00700F14:
	add	edi,1h

l00700F17:
	cmp	[ecx+14h],ebx
	jnz	700F25h

l00700F1C:
	cmp	dword ptr [ecx+10h],0h
	jz	700F25h

l00700F22:
	add	edi,1h

l00700F25:
	add	ecx,20h
	sub	esi,1h
	jnz	700F05h

l00700F2D:
	test	edi,edi
	mov	esi,[edx]
	jz	700F85h

l00700F33:
	mov	ecx,[0A6CD2Ch]
	mov	[edx],ecx
	mov	[0A6CD2Ch],edx
	mov	ecx,1Fh

l00700F46:
	cmp	[eax+4h],ebx
	jnz	700F50h

l00700F4B:
	cmp	dword ptr [eax],0h
	jnz	700F5Eh

l00700F50:
	mov	edx,[0A6CD30h]
	mov	[eax+4h],edx
	mov	[0A6CD30h],eax

l00700F5E:
	cmp	[eax+14h],ebx
	jnz	700F69h

l00700F63:
	cmp	dword ptr [eax+10h],0h
	jnz	700F7Bh

l00700F69:
	mov	edx,[0A6CD30h]
	mov	[eax+14h],edx
	lea	edx,[eax+10h]
	mov	[0A6CD30h],edx

l00700F7B:
	add	eax,20h
	sub	ecx,1h
	jnz	700F46h

l00700F83:
	jmp	700F94h

l00700F85:
	push	edx
	call	dword ptr [8A45D4h]
	add	esp,4h
	add	dword ptr [esp+10h],1h

l00700F94:
	add	[esp+14h],edi
	test	esi,esi
	mov	edx,esi
	jnz	700EF6h

l00700FA2:
	cmp	dword ptr [0A74AF0h],0h
	jz	70108Fh

l00700FAF:
	mov	edi,[8A46CCh]
	push	8D6BA0h
	call	edi
	mov	ebx,[8A45E0h]
	add	eax,40h
	push	eax
	call	ebx
	mov	edx,[esp+1Ch]
	add	esp,8h
	test	edx,edx
	jnz	700FE5h

l00700FD3:
	push	8A6DE8h
	call	edi
	add	eax,40h
	push	eax
	call	ebx
	add	esp,8h
	jmp	70101Ch

l00700FE5:
	cmp	ebp,1h
	mov	ecx,8A698Fh
	jz	700FF4h

l00700FEF:
	mov	ecx,8B22ACh

l00700FF4:
	cmp	edx,1h
	mov	eax,8A698Fh
	jz	701003h

l00700FFE:
	mov	eax,8B22ACh
