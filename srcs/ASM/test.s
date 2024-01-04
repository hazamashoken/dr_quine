
section .data
    code:  db "hello world", 10, 0
section .text
    global _start
    extern printf
_start:
    LEA     rdi, [rel code]
    CALL    printf
    RET