	.file	"Sully.c"
	.intel_syntax noprefix
# GNU C17 (GCC) version 13.2.1 20230801 (x86_64-pc-linux-gnu)
#	compiled by GNU C version 13.2.1 20230801, GMP version 6.3.0, MPFR version 4.2.0-p12, MPC version 1.3.1, isl version isl-0.26-GMP

# warning: MPFR header version 4.2.0-p12 differs from library version 4.2.1.
# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -masm=intel -mtune=generic -march=x86-64 -O0
	.text
	.section	.rodata
.LC0:
	.string	"Sully_%i.c"
.LC1:
	.string	"Sully.c"
.LC2:
	.string	"./Sully_%i"
	.align 8
.LC3:
	.ascii	"#include <stdio.h>%3$c#include <fcntl.h>%3$c#include <unistd"
	.ascii	".h>%3$c#include <stdlib.h>%3$c#include <string.h>%3$c%3$c#de"
	.ascii	"fine CODE %4$c%1$s%4$c%3$c%3$cint main(void)%3$c{%3$c%2$cint"
	.ascii	" i = %5$i;%3$c%2$cif (i <= 0) return 0;%3$c%2$cchar filename"
	.ascii	"[20];%3$c%2$cchar execname[20];%3$c%2$csprintf(filename, %4$"
	.ascii	"cSully_%%i.c%4$c, i);%3$c%2$cif (strstr(__FILE__, filename))"
	.ascii	" i--;%3$c%2$csprintf(filename, %4$cSully_%%i.c%4$c, i);%3$c%"
	.ascii	"2$csprintf(execname, %4$c./Sully_%%i%4$c, i);%3$c%2$cint fd "
	.ascii	"= open(filename, O_RDWR | O_CREAT"
	.string	" | O_TRUNC, 0644);%3$c%2$cdprintf(fd, CODE, CODE, 9, 10, 34, i);%3$c%2$cclose(fd);%3$c%2$cchar cmd_str[100];%3$c%2$csprintf(cmd_str, %4$cclang -o %%s %%s%4$c, execname, filename);%3$c%2$csystem(cmd_str);%3$c%2$csystem(execname);%3$c%2$creturn (0);%3$c}%3$c"
.LC4:
	.string	"clang -o %s %s"
	.text
	.globl	main
	.type	main, @function
main:
.LFB6:
	.cfi_startproc
	push	rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp	#,
	.cfi_def_cfa_register 6
	sub	rsp, 192	#,
# Sully.c:10: {
	mov	rax, QWORD PTR fs:40	# tmp110, MEM[(<address-space-1> long unsigned int *)40B]
	mov	QWORD PTR -8[rbp], rax	# D.4582, tmp110
	xor	eax, eax	# tmp110
# Sully.c:11: 	int i = 5;
	mov	DWORD PTR -184[rbp], 5	# i,
# Sully.c:12: 	if (i <= 0) return 0;
	cmp	DWORD PTR -184[rbp], 0	# i,
	jg	.L2	#,
# Sully.c:12: 	if (i <= 0) return 0;
	mov	eax, 0	# _3,
# Sully.c:12: 	if (i <= 0) return 0;
	jmp	.L5	#
.L2:
# Sully.c:15: 	sprintf(filename, "Sully_%i.c", i);
	mov	edx, DWORD PTR -184[rbp]	# tmp85, i
	lea	rax, -176[rbp]	# tmp86,
	lea	rcx, .LC0[rip]	# tmp87,
	mov	rsi, rcx	#, tmp87
	mov	rdi, rax	#, tmp86
	mov	eax, 0	#,
	call	sprintf@PLT	#
# Sully.c:16: 	if (strstr(__FILE__, filename)) i--;
	lea	rax, -176[rbp]	# tmp88,
	mov	rsi, rax	#, tmp88
	lea	rax, .LC1[rip]	# tmp89,
	mov	rdi, rax	#, tmp89
	call	strstr@PLT	#
# Sully.c:16: 	if (strstr(__FILE__, filename)) i--;
	test	rax, rax	# _1
	je	.L4	#,
# Sully.c:16: 	if (strstr(__FILE__, filename)) i--;
	sub	DWORD PTR -184[rbp], 1	# i,
.L4:
# Sully.c:17: 	sprintf(filename, "Sully_%i.c", i);
	mov	edx, DWORD PTR -184[rbp]	# tmp90, i
	lea	rax, -176[rbp]	# tmp91,
	lea	rcx, .LC0[rip]	# tmp92,
	mov	rsi, rcx	#, tmp92
	mov	rdi, rax	#, tmp91
	mov	eax, 0	#,
	call	sprintf@PLT	#
# Sully.c:18: 	sprintf(execname, "./Sully_%i", i);
	mov	edx, DWORD PTR -184[rbp]	# tmp93, i
	lea	rax, -144[rbp]	# tmp94,
	lea	rcx, .LC2[rip]	# tmp95,
	mov	rsi, rcx	#, tmp95
	mov	rdi, rax	#, tmp94
	mov	eax, 0	#,
	call	sprintf@PLT	#
# Sully.c:19: 	int fd = open(filename, O_RDWR | O_CREAT | O_TRUNC, 0644);
	lea	rax, -176[rbp]	# tmp96,
	mov	edx, 420	#,
	mov	esi, 578	#,
	mov	rdi, rax	#, tmp96
	mov	eax, 0	#,
	call	open@PLT	#
	mov	DWORD PTR -180[rbp], eax	# fd, tmp97
# Sully.c:20: 	dprintf(fd, CODE, CODE, 9, 10, 34, i);
	mov	eax, DWORD PTR -180[rbp]	# tmp98, fd
	sub	rsp, 8	#,
	mov	edx, DWORD PTR -184[rbp]	# tmp99, i
	push	rdx	# tmp99
	mov	r9d, 34	#,
	mov	r8d, 10	#,
	mov	ecx, 9	#,
	lea	rdx, .LC3[rip]	# tmp100,
	lea	rsi, .LC3[rip]	# tmp101,
	mov	edi, eax	#, tmp98
	mov	eax, 0	#,
	call	dprintf@PLT	#
	add	rsp, 16	#,
# Sully.c:21: 	close(fd);
	mov	eax, DWORD PTR -180[rbp]	# tmp102, fd
	mov	edi, eax	#, tmp102
	call	close@PLT	#
# Sully.c:23: 	sprintf(cmd_str, "clang -o %s %s", execname, filename);
	lea	rcx, -176[rbp]	# tmp103,
	lea	rdx, -144[rbp]	# tmp104,
	lea	rax, -112[rbp]	# tmp105,
	lea	rsi, .LC4[rip]	# tmp106,
	mov	rdi, rax	#, tmp105
	mov	eax, 0	#,
	call	sprintf@PLT	#
# Sully.c:24: 	system(cmd_str);
	lea	rax, -112[rbp]	# tmp107,
	mov	rdi, rax	#, tmp107
	call	system@PLT	#
# Sully.c:25: 	system(execname);
	lea	rax, -144[rbp]	# tmp108,
	mov	rdi, rax	#, tmp108
	call	system@PLT	#
# Sully.c:26: 	return (0);
	mov	eax, 0	# _3,
.L5:
# Sully.c:27: }
	mov	rdx, QWORD PTR -8[rbp]	# tmp111, D.4582
	sub	rdx, QWORD PTR fs:40	# tmp111, MEM[(<address-space-1> long unsigned int *)40B]
	je	.L6	#,
	call	__stack_chk_fail@PLT	#
.L6:
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.ident	"GCC: (GNU) 13.2.1 20230801"
	.section	.note.GNU-stack,"",@progbits
