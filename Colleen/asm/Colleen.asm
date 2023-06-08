;comment outside
global		main
	section	.text
	extern	printf

colleen:
	lea		rdi, [rel string_program]
	mov		rsi, 10
	mov		rdx, 34
	mov		rcx, rdi
	mov 	al,	0
	call	printf wrt ..plt
	ret
	; comment inside
main:
	jmp		colleen
	mov		rax, 0
	ret

section .data
	string_program: db ";comment outside%1$cglobal		main%1$c	section	.text%1$c	extern	printf%1$c%1$ccolleen:%1$c	lea		rdi, [rel string_program]%1$c	mov		rsi, 10%1$c	mov		rdx, 34%1$c	mov		rcx, rdi%1$c	mov 	al,	0%1$c	call	printf wrt ..plt%1$c	ret%1$c	; comment inside%1$cmain:%1$c	jmp		colleen%1$c	mov		rax, 0%1$c	ret%1$c%1$csection .data%1$c	string_program: db %2$c%3$s%2$c, 0x0%1$c", 0x0
