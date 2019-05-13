; Filename: execve.nasm
; Author:  Vivek Ramachandran
; Website:  http://securitytube.net
; Training: http://securitytube-training.com 
; Student: Xavi Bel

global _start			

section .text
_start:
	jmp short call_shellcode

shellcode:
	pop esi

	xor ebx, ebx
	mov byte [esi +9], bl
	mov dword [esi +10], esi
	mov dword [esi +14], ebx

	lea ebx, [esi]
	lea ecx, [esi +10]
	lea edx, [esi +14]
	xor eax, eax
	mov al, 0xb
	int 0x80

call_shellcode:
	call shellcode	
	; A=0 B=address of /bin/bash C=0x00000000
	message db "/bin/bashABBBBCCCC"
