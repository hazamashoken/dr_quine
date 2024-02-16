### ASM
- when using sprintf, you need to save the rbp register or ENTER 0,0 and LEAVE

- when using stack declare data use `LEA [rel <name>]` due to PIE imple
- don't use %i with *printf family function (still have dig deep yet)
- set AL to 0 before syscall/call that use AL counter

- YOU CANNOT USE MORE THAN 6 ARGUMENTS in a syscall/call