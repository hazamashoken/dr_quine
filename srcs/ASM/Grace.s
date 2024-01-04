; comment
%define OPEN 2
%define CLOSE 3
%define PERM 577

section .data
	code db "; comment%3$c%%define OPEN 2%3$c%%define CLOSE 3%3$c%%define PERM 577%3$c%3$csection .data%3$c%2$ccode db %4$c%1$s%4$c, 0%3$c%2$cfilename db %4$cGrace_kid.s%4$c, 0%3$c%2$cmode equ 420%3$c%3$csection .text%3$c%2$cglobal main%3$c%2$cextern dprintf%3$c%3$cmain:%3$c%2$c%2$c%2$c%2$cPUSH%2$crbx%3$c%2$c%2$c%2$c%2$cMOV%2$c%2$crax, OPEN%3$c%2$c%2$c%2$c%2$cLEA%2$c%2$crdi, [rel filename]%3$c%2$c%2$c%2$c%2$cMOV%2$c%2$crsi, PERM%3$c%2$c%2$c%2$c%2$cMOV%2$c%2$crdx, mode%3$c%2$c%2$c%2$c%2$cSYSCALL%3$c%2$c%2$c%2$c%2$cMOV%2$c%2$crbx, rax%3$c%2$c%2$c%2$c%2$cMOV%2$c%2$crdi, rbx%3$c%2$c%2$c%2$c%2$cLEA%2$c%2$crsi, [rel code]%3$c%2$c%2$c%2$c%2$cLEA%2$c%2$crdx, [rel code]%3$c%2$c%2$c%2$c%2$cMOV%2$c%2$crcx, 9%3$c%2$c%2$c%2$c%2$cMOV%2$c%2$cr8, 10%3$c%2$c%2$c%2$c%2$cMOV%2$c%2$cr9, 34%3$c%2$c%2$c%2$c%2$cCALL%2$cdprintf wrt ..plt%3$c%2$c%2$c%2$c%2$cMOV%2$c%2$crdi, rbx%3$c%2$c%2$c%2$c%2$cMOV%2$c%2$crax, CLOSE%3$c%2$c%2$c%2$c%2$cSYSCALL%3$c%2$c%2$c%2$c%2$cPOP%2$c%2$crbx%3$c%2$c%2$c%2$c%2$cRET%3$c", 0
	filename db "Grace_kid.s", 0
	mode equ 420

section .text
	global main
	extern dprintf

main:
				PUSH	rbx
				MOV		rax, OPEN
				LEA		rdi, [rel filename]
				MOV		rsi, PERM
				MOV		rdx, mode
				SYSCALL
				MOV		rbx, rax
				MOV		rdi, rbx
				LEA		rsi, [rel code]
				LEA		rdx, [rel code]
				MOV		rcx, 9
				MOV		r8, 10
				MOV		r9, 34
				CALL	dprintf wrt ..plt
				MOV		rdi, rbx
				MOV		rax, CLOSE
				SYSCALL
				POP		rbx
				RET
