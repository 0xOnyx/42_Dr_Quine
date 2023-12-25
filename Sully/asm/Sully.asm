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

;rdi, rsi, rdx, rcx, r8, r9,

;preserve rbx, rsp, rbp, r12, r13, r14, and r15

extern	dprintf
extern	sprintf
extern	strcmp
extern	system

global	main

	section .rodata
src_file			db	__FILE__, 0x0
sully_d				db	"Sully_%d.asm", 0x0
sully				db	"Sully_%d", 0x0
compile_asm			db	"asm -felf64 %s -o %s", 0x0
compile_ld			db	"gcc %s -o %s", 0x0
exec_cmd			db	"./%s", 0x0
string_programme	db	"", 0x0

	section .text
main:
	push		rbp
	mov			rbp, rsp
	sub			rsp, 539

	mov	dword 	[rsp + 535], 5
	cmp	dwrod	[rsp + 535], 0
	jnle		return

	lea			rdi, rsp
	lea			rsi, [rel sully_d]
	mov	dword	rdx, [rsp + 535]
	call		sprintf wrt ..plt

	lea			rdi, [rel src_file]
	lea			rsi, rsp
	call		strcmp
	cmp			rax, 0
	jz			continue
	sub	dword	[rsp + 535], 1

continue:
	lea			rdi, rsp
	lea			rsi, [rel sully_d]
	mov	dword	rdx, [rsp + 531]
	call		sprintf wrt ..plt

	lea			rdi, rsp
	mov			rsi, 0x241
	mov			rdx, 0x1FC
	mov			rax, 2
	syscall

	cmp			rax, 0
	jl			return

	mov dword	[rsp + 531], rax
	mov dword	rdi, [rsp + 531]
	lea			rsi, [rel string_programme]
	mov			rdx, 10
	mov			rcx, 34
	mov			r8, rsi
	mov	qword	r9, [rsp + 535]
	mov			al, 0
	call		dprintf wrt ..plt

	lea			rdi, [rsp + 16]
	lea			rsi, [rel sully]
	mov			rdx, [rsp + 548]
	call		sprintf

	lea			rdi, [rsp + 32]
	lea			rsi, [rel compile_asm]
	lea			rdx,


return :
	mov		rax, 0
	mov		rsp, rbp
	pop		rbp
	ret
