	.file	"Sully.c"
	.intel_syntax noprefix
# GNU C17 (GCC) version 13.2.1 20230801 (x86_64-pc-linux-gnu)
#	compiled by GNU C version 13.2.1 20230801, GMP version 6.3.0, MPFR version 4.2.0-p12, MPC version 1.3.1, isl version isl-0.26-GMP

# warning: MPFR header version 4.2.0-p12 differs from library version 4.2.1.
# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -masm=intel -mtune=generic -march=x86-64 -Og
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Sully_%i.c"
.LC1:
	.string	"Sully.c"
.LC2:
	.string	"./Sully_%i"
	.section	.rodata.str1.8,"aMS",@progbits,1
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
	.section	.rodata.str1.1
.LC4:
	.string	"clang -o %s %s"
	.text
	.globl	main
	.type	main, @function
main:
.LFB22:
	.cfi_startproc
	push	r13	#
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	push	r12	#
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	push	rbp	#
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	push	rbx	#
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	sub	rsp, 184	#,
	.cfi_def_cfa_offset 224
# Sully.c:10: {
	mov	rax, QWORD PTR fs:40	# tmp108, MEM[(<address-space-1> long unsigned int *)40B]
	mov	QWORD PTR 168[rsp], rax	# D.4646, tmp108
	xor	eax, eax	# tmp108
# Sully.c:15: 	sprintf(filename, "Sully_%i.c", i);
	mov	rbx, rsp	# tmp87,
	mov	edx, 5	#,
	lea	rsi, .LC0[rip]	# tmp88,
	mov	rdi, rbx	#, tmp87
	call	sprintf@PLT	#
# Sully.c:16: 	if (strstr(__FILE__, filename)) i--;
	mov	rsi, rbx	#, tmp87
	lea	rdi, .LC1[rip]	# tmp90,
	call	strstr@PLT	#
# Sully.c:16: 	if (strstr(__FILE__, filename)) i--;
	test	rax, rax	# tmp106
	je	.L6	#,
# Sully.c:16: 	if (strstr(__FILE__, filename)) i--;
	mov	r13d, 4	# i,
.L2:
# Sully.c:17: 	sprintf(filename, "Sully_%i.c", i);
	mov	r12, rsp	# tmp91,
	mov	edx, r13d	#, i
	lea	rsi, .LC0[rip]	# tmp92,
	mov	rdi, r12	#, tmp91
	mov	eax, 0	#,
	call	sprintf@PLT	#
# Sully.c:18: 	sprintf(execname, "./Sully_%i", i);
	lea	rbp, 32[rsp]	# tmp93,
	mov	edx, r13d	#, i
	lea	rsi, .LC2[rip]	# tmp94,
	mov	rdi, rbp	#, tmp93
	mov	eax, 0	#,
	call	sprintf@PLT	#
# Sully.c:19: 	int fd = open(filename, O_RDWR | O_CREAT | O_TRUNC, 0644);
	mov	edx, 420	#,
	mov	esi, 578	#,
	mov	rdi, r12	#, tmp91
	mov	eax, 0	#,
	call	open@PLT	#
	mov	ebx, eax	# fd, tmp107
# Sully.c:20: 	dprintf(fd, CODE, CODE, 9, 10, 34, i);
	sub	rsp, 8	#,
	.cfi_def_cfa_offset 232
	push	r13	# i
	.cfi_def_cfa_offset 240
	mov	r9d, 34	#,
	mov	r8d, 10	#,
	mov	ecx, 9	#,
	lea	rsi, .LC3[rip]	# tmp96,
	mov	rdx, rsi	#, tmp96
	mov	edi, eax	#, fd
	mov	eax, 0	#,
	call	dprintf@PLT	#
# Sully.c:21: 	close(fd);
	mov	edi, ebx	#, fd
	call	close@PLT	#
# Sully.c:23: 	sprintf(cmd_str, "clang -o %s %s", execname, filename);
	lea	rbx, 80[rsp]	# tmp100,
	mov	rcx, r12	#, tmp91
	mov	rdx, rbp	#, tmp93
	lea	rsi, .LC4[rip]	# tmp101,
	mov	rdi, rbx	#, tmp100
	mov	eax, 0	#,
	call	sprintf@PLT	#
# Sully.c:24: 	system(cmd_str);
	mov	rdi, rbx	#, tmp100
	call	system@PLT	#
# Sully.c:25: 	system(execname);
	mov	rdi, rbp	#, tmp93
	call	system@PLT	#
# Sully.c:27: }
	mov	rsp, r12	#, tmp91
	.cfi_def_cfa_offset 224
	mov	rax, QWORD PTR 168[rsp]	# tmp109, D.4646
	sub	rax, QWORD PTR fs:40	# tmp109, MEM[(<address-space-1> long unsigned int *)40B]
	jne	.L7	#,
	mov	eax, 0	#,
	add	rsp, 184	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	pop	rbx	#
	.cfi_def_cfa_offset 32
	pop	rbp	#
	.cfi_def_cfa_offset 24
	pop	r12	#
	.cfi_def_cfa_offset 16
	pop	r13	#
	.cfi_def_cfa_offset 8
	ret
.L6:
	.cfi_restore_state
# Sully.c:11: 	int i = 5;
	mov	r13d, 5	# i,
	jmp	.L2	#
.L7:
# Sully.c:27: }
	call	__stack_chk_fail@PLT	#
	.cfi_endproc
.LFE22:
	.size	main, .-main
	.ident	"GCC: (GNU) 13.2.1 20230801"
	.section	.note.GNU-stack,"",@progbits
