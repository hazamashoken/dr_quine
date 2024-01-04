section .rodata
	CODE db "%s $c %c %c %d", 0
	FILE_TEMPLATE db "Sully_%d.c", 0
	EXEC_TEMPLATE db "./Sully_%d", 0
	CMD_STRING db "clang -o %s %s", 0

section .data
	X_VALUE	dq 5
	filename times 100 db 0
	execname times 100 db 0
	cmdline times 100 db 0

section .text
	global main
	extern system
	extern sprintf
	extern dprintf

main:
				ENTER	0,0
				PUSH	rbx
				PUSH	r12
				XOR		rax, rax
				MOV		rbx, qword [rel X_VALUE]

				CMP		rbx, 0
				JLE		.return

				LEA		rdi, [rel filename]
				LEA		rsi, [rel FILE_TEMPLATE]
				MOV		rdx, rbx
				CALL	sprintf wrt ..plt

				LEA		rdi, [rel execname]
				LEA		rsi, [rel EXEC_TEMPLATE]
				MOV		rdx, rbx
				CALL	sprintf wrt ..plt

				MOV		rax, 2
				LEA		rdi, [rel filename]
				MOV		rsi, 577
				MOV		rdx, 420
				SYSCALL

				MOV		r12, rax
				MOV		rdi, r12
				LEA		rsi, [rel CODE]
				LEA		rdx, [rel CODE]
				MOV		rcx, 9
				MOV		r8, 10
				MOV		r9, 34
				PUSH	qword [rbx - 1]
				CALL	dprintf wrt ..plt

				MOV		rax, 3
				MOV		rdi, r12
				SYSCALL

				LEA		rdi, [rel cmdline]
				LEA		rsi, [rel CMD_STRING]
				LEA		rsi, [rel execname]
				LEA		rsi, [rel filename]
				CALL	sprintf wrt ..plt

				LEA		rdi, [rel cmdline]
				CALL	system wrt ..plt

				LEA		rdi, [rel execname]
				CALL	system wrt ..plt

.return:
				POP	r12
				POP	rbx
				LEAVE
				RET