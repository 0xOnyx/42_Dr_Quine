%macro main 0
;comment
global	main
	section	.text
	extern	dprintf

main:
	push	rbp
	mov		rbp, rsp
	sub		rsp, 16

	mov		rax, 2
	lea		rdi, [rel file]
	mov		rsi, 0x241
	mov		rdx, 0x1FC
	syscall

	cmp		rax, 0
	jl		return
	mov		qword [rsp], rax
	mov		qword rdi, [rsp]
	lea		rsi, [rel string_program]
	mov		rdx, 10
	mov		rcx, 34
	mov		r8,  rsi
	mov		al, 0
	call	dprintf wrt ..plt

	mov		qword rdi, [rsp]
	mov		rax, 3
	syscall

return:
	mov		rax, 0
	mov		rsp, rbp
	pop		rbp
	ret

section	.rodata
	file	db "Grace_kid.asm", 0x0
	string_program	db "%%macro main 0%1$c;comment%1$cglobal	main%1$c	section	.text%1$c	extern	dprintf%1$c%1$cmain:%1$c	push	rbp%1$c	mov		rbp, rsp%1$c	sub		rsp, 16%1$c%1$c	mov		rax, 2%1$c	lea		rdi, [rel file]%1$c	mov		rsi, 0x241%1$c	mov		rdx, 0x1FC%1$c	syscall%1$c%1$c	cmp		rax, 0%1$c	jl		return%1$c	mov		qword [rsp], rax%1$c	mov		qword rdi, [rsp]%1$c	lea		rsi, [rel string_program]%1$c	mov		rdx, 10%1$c	mov		rcx, 34%1$c	mov		r8,  rsi%1$c	mov		al, 0%1$c	call	dprintf wrt ..plt%1$c%1$c	mov		qword rdi, [rsp]%1$c	mov		rax, 3%1$c	syscall%1$c%1$creturn:%1$c	mov		rax, 0%1$c	mov		rsp, rbp%1$c	pop		rbp%1$c	ret%1$c%1$csection	.rodata%1$c	file	db %2$cGrace_kid.asm%2$c, 0x0%1$c	string_program	db %2$c%3$s%2$c, 0x0%1$c%%endmacro%1$c%1$cmain%1$c", 0x0
%endmacro

main
