;comment outside
global		main
	section	.text
	extern	printf

colleen:
	lea		rdi, [rel string_program]
	mov		rsi, 10 ;1 \n
	mov		rdx, 34 ;2 "
	mov		rcx, 59 ;3 ;
	mov		r8, rdi
	mov 	al,0
	call	printf wrt ..plt
	ret

main:
	push	rbp
	mov		rbp, rsp
;	sub		rsp, 8  for VARIABLE LOCAL COMMENT

	jmp		colleen

	mov		rax, 0
	mov		rsp, rbp
	pop		rbp
	ret

section .data
    string_program: db "a%3$ca", 0x0A, 0x0
    len: equ $ - string_program
