
global	main
	section .text
	extern printf

main:
	push	rbp
	mov		rbp, rsp
;	sub		rsp, 8  for VARIABLE LOCAL

	lea		rdi, [rel string_program]
	mov		rsi, 10
	mov		rdx, 34
	mov		r10, rdi
	call	printf wrt ..plt

	mov		rax, 0
	mov		rsp, rbp
	pop		rbp
	ret

section .data
    string_program: db "global start", 0x0
    len: equ $ - string_program
