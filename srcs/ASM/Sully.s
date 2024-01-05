section .rodata
CODE db "section .rodata%4$cCODE db %3$c%1$s%3$c, 0%4$cFILE_TEMPLATE db %3$cSully_%%d.s%3$c, 0%4$cOBJ_TEMPLATE db %3$cSully_%%d.o%3$c, 0%4$cEXEC_TEMPLATE db %3$c./Sully_%%d%3$c, 0%4$cCOMPILE_STRING db %3$cnasm -felf64 %%s%3$c, 0%4$cCMD_STRING db %3$cclang -o %%s %%s%3$c, 0%4$cFILENAME db __FILE__, 0%4$c%4$csection .data%4$cX_VALUE dq %2$d%4$cfilename times 100 db 0%4$cobjname times 100 db 0%4$cexecname times 100 db 0%4$ccmdline times 100 db 0%4$ccompileline times 100 db 0%4$c%4$csection .text%4$cglobal main%4$cextern system%4$cextern sprintf%4$cextern dprintf%4$cextern strstr%4$c%4$cmain:%4$cENTER 0,0%4$cPUSH rbx%4$cPUSH r12%4$cXOR rax, rax%4$cMOV rbx, qword [rel X_VALUE]%4$cCMP rbx, 0%4$cJLE .return%4$cLEA rdi, [rel filename]%4$cLEA rsi, [rel FILE_TEMPLATE]%4$cMOV rdx, rbx%4$cCALL sprintf wrt ..plt%4$cLEA rdi, [rel FILENAME]%4$cLEA rsi, [rel filename]%4$cCALL strstr wrt ..plt%4$cTEST rax, rax%4$cJZ .skip%4$cSUB rbx, 1%4$c.skip:%4$cLEA rdi, [rel filename]%4$cLEA rsi, [rel FILE_TEMPLATE]%4$cMOV rdx, rbx%4$cCALL sprintf wrt ..plt%4$cLEA rdi, [rel execname]%4$cLEA rsi, [rel EXEC_TEMPLATE]%4$cMOV rdx, rbx%4$cCALL sprintf wrt ..plt%4$cLEA rdi, [rel objname]%4$cLEA rsi, [rel OBJ_TEMPLATE]%4$cMOV rdx, rbx%4$cCALL sprintf wrt ..plt%4$cMOV rax, 2%4$cLEA rdi, [rel filename]%4$cMOV rsi, 577%4$cMOV rdx, 420%4$cSYSCALL%4$cMOV r12, rax%4$cMOV rdi, r12%4$cLEA rsi, [rel CODE]%4$cLEA rdx, [rel CODE]%4$cMOV rcx, rbx%4$cMOV r8, 34%4$cMOV r9, 10%4$cXOR rax, rax%4$cCALL dprintf wrt ..plt%4$cMOV rax, 3%4$cMOV rdi, r12%4$cSYSCALL%4$cLEA rdi, [rel compileline]%4$cLEA rsi, [rel COMPILE_STRING]%4$cLEA rdx, [rel filename]%4$cCALL sprintf wrt ..plt%4$cLEA rdi, [rel compileline]%4$cCALL system wrt ..plt%4$cLEA rdi, [rel cmdline]%4$cLEA rsi, [rel CMD_STRING]%4$cLEA rdx, [rel execname]%4$cLEA rcx, [rel objname]%4$cCALL sprintf wrt ..plt%4$cLEA rdi, [rel cmdline]%4$cCALL system wrt ..plt%4$cLEA rdi, [rel execname]%4$cCALL system wrt ..plt%4$c.return:%4$cPOP r12%4$cPOP rbx%4$cLEAVE%4$cRET", 0
FILE_TEMPLATE db "Sully_%d.s", 0
OBJ_TEMPLATE db "Sully_%d.o", 0
EXEC_TEMPLATE db "./Sully_%d", 0
COMPILE_STRING db "nasm -felf64 %s", 0
CMD_STRING db "clang -o %s %s", 0
FILENAME db __FILE__, 0

section .data
X_VALUE dq 5
filename times 100 db 0
objname times 100 db 0
execname times 100 db 0
cmdline times 100 db 0
compileline times 100 db 0

section .text
global main
extern system
extern sprintf
extern dprintf
extern strstr

main:
ENTER 0,0
PUSH rbx
PUSH r12
XOR rax, rax
MOV rbx, qword [rel X_VALUE]
CMP rbx, 0
JLE .return
LEA rdi, [rel filename]
LEA rsi, [rel FILE_TEMPLATE]
MOV rdx, rbx
CALL sprintf wrt ..plt
LEA rdi, [rel FILENAME]
LEA rsi, [rel filename]
CALL strstr wrt ..plt
TEST rax, rax
JZ .skip
SUB rbx, 1
.skip:
LEA rdi, [rel filename]
LEA rsi, [rel FILE_TEMPLATE]
MOV rdx, rbx
CALL sprintf wrt ..plt
LEA rdi, [rel execname]
LEA rsi, [rel EXEC_TEMPLATE]
MOV rdx, rbx
CALL sprintf wrt ..plt
LEA rdi, [rel objname]
LEA rsi, [rel OBJ_TEMPLATE]
MOV rdx, rbx
CALL sprintf wrt ..plt
MOV rax, 2
LEA rdi, [rel filename]
MOV rsi, 577
MOV rdx, 420
SYSCALL
MOV r12, rax
MOV rdi, r12
LEA rsi, [rel CODE]
LEA rdx, [rel CODE]
MOV rcx, rbx
MOV r8, 34
MOV r9, 10
XOR rax, rax
CALL dprintf wrt ..plt
MOV rax, 3
MOV rdi, r12
SYSCALL
LEA rdi, [rel compileline]
LEA rsi, [rel COMPILE_STRING]
LEA rdx, [rel filename]
CALL sprintf wrt ..plt
LEA rdi, [rel compileline]
CALL system wrt ..plt
LEA rdi, [rel cmdline]
LEA rsi, [rel CMD_STRING]
LEA rdx, [rel execname]
LEA rcx, [rel objname]
CALL sprintf wrt ..plt
LEA rdi, [rel cmdline]
CALL system wrt ..plt
LEA rdi, [rel execname]
CALL system wrt ..plt
.return:
POP r12
POP rbx
LEAVE
RET