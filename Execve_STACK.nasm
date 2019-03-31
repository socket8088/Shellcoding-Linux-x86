; Filename: execve-stack.nasm
; Author:  Vivek Ramachandran
; Website:  http://securitytube.net
; Training: http://securitytube-training.com 
; Student: Xavi Bel

global _start			

section .text
_start:

	xor eax, eax
	push eax

	push 0x68736162
	push 0x2f6e6962
	push 0x2f2f2f2f

	mov ebx, esp

	push eax
	mov edx, esp

	push ebx,
	mov ecx, esp

	mov al, 11
	int 0x80
