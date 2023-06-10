
extern dprintf
global	main

	section .text

main:
	push	rbp
	mov		rbp, rsp
	sub		rsp, 1024

	mov		[rsp]