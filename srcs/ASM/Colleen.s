; HELLO WORLD
section .data
	string db "; HELLO WORLD%3$csection .data%3$c%2$cstring db %4$c%s%4$c, 0%3$c%3$csection .text%3$c%2$cglobal main%3$c%2$cextern printf%3$c%3$ccode:%3$c%2$c%2$c%2$c%2$cLEA%2$c%2$crdi, [rel string]%2$c; load string as printf format%3$c%2$c%2$c%2$c%2$cLEA%2$c%2$crsi, [rel string]%2$c; load string as first arg%3$c%2$c%2$c%2$c%2$cMOV%2$c%2$crdx, 9%2$c%2$c%2$c%2$c; set tab as second arg%3$c%2$c%2$c%2$c%2$cMOV%2$c%2$crcx, 10%2$c%2$c%2$c%2$c; set newline as third arg%3$c%2$c%2$c%2$c%2$cMOV%2$c%2$cr8, 34%2$c%2$c%2$c%2$c; set dquote as forth arg%3$c%2$c%2$c%2$c%2$cCALL%2$cprintf wrt ..plt%2$c; call printf%3$c%2$c%2$c%2$c%2$cRET%3$c%3$cmain:%3$c%2$c%2$c%2$c%2$cCALL%2$ccode%2$c%2$c%2$c%2$c; call code%3$c%2$c%2$c%2$c%2$cXOR%2$c%2$crax, rax%2$c%2$c%2$c; reset ret to 0%3$c%2$c%2$c%2$c%2$cRET%3$c", 0

section .text
	global main
	extern printf

code:
				LEA		rdi, [rel string]	; load string as printf format
				LEA		rsi, [rel string]	; load string as first arg
				MOV		rdx, 9				; set tab as second arg
				MOV		rcx, 10				; set newline as third arg
				MOV		r8, 34				; set dquote as forth arg
				CALL	printf wrt ..plt	; call printf
				RET

main:
				CALL	code				; call code
				XOR		rax, rax			; reset ret to 0
				RET
