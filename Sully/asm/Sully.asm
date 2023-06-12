; +-------------------+  RSP
; |                   |
; |   src_file        |
; |                   |
; +-------------------+  RSP + 16
; |                   |
; |   exec_file       |
; |                   |
; +-------------------+  RSP + 32
; |                   |
; |   exec_cmd        |
; |                   |
; +-------------------+  RSP + 544
; |                   |
; |   fd              |
; |                   |
; +-------------------+  RSP + 552   /// 548 ?
; |                   |
; |   i               |
; |                   |
; +-------------------+  RBP

extern dprintf
extern sprintf
extern system

global	main

	section .rodata
src_file	db	__FILE__, 0x0
sully_d		db	"Sully_%d.asm", 0x0
sylly		db	"Sully_%d", 0x0
compile_asm	db	"asm -felf64 %s -o %s", 0x0
compile_ld	db	"gcc %s -o %s", 0x0
exec_cmd	db	"./%s", 0x0

	section .text
main:
	push		rbp
	mov			rbp, rsp
	sub			rsp, 1024

	mov	qword	[rsp + 552], 5
	cmp	qwrod	[rsp + 552], 0
	jnle		return

	rel			rdi, [rel src_file]
	rsi
	rdx
	rcx
	r8
	r9


return :
	mov		rax, 0
	mov		rsp, rbp
	pop		rbp
	ret
