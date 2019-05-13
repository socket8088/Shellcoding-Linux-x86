; HelloWorldShellcode.nasm
; Author:  Vivek Ramachandran
; Website:  http://securitytube.net
; Training: http://securitytube-training.com
; Student: Xavi Bel
; JMP-CALL-POP technique

global _start

section .text

_start:
jmp short call_shellcode

shellcode:

	pop ecx;
	
	; write syscall
	xor eax, eax
	mov al, 0x4

	xor ebx, ebx
	mov bl, 0x1	

	
	mov edx, 13
	int 0x80

	; exit syscall
	xor eax, eax
	mov al, 0x1

	xor ebx, ebx

	int 0x80


call_shellcode:
	call shellcode
	message: db "Hello World!", 0xA
