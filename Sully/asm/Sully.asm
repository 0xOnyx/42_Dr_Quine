%macro main 1

extern	dprintf
extern	sprintf
extern	strcmp
extern	system

global	main

	section .rodata
src_file			db	__FILE__, 0x0
sully_asm_d			db	"Sully_%d.asm", 0x0
sully_o_d           db  "Sully_%d.o", 0x0
sully				db	"Sully_%d", 0x0
compile_asm			db	"nasm -felf64 %s -o %s", 0x0
compile_ld			db	"gcc %s -o %s", 0x0
exec_cmd			db	"./%s", 0x0
string_programme	db	"%%macro main 1%1$c%1$cextern	dprintf%1$cextern	sprintf%1$cextern	strcmp%1$cextern	system%1$c%1$cglobal	main%1$c%1$c	section .rodata%1$csrc_file			db	__FILE__, 0x0%1$csully_asm_d			db	%2$cSully_%%d.asm%2$c, 0x0%1$csully_o_d           db  %2$cSully_%%d.o%2$c, 0x0%1$csully				db	%2$cSully_%%d%2$c, 0x0%1$ccompile_asm			db	%2$cnasm -felf64 %%s -o %%s%2$c, 0x0%1$ccompile_ld			db	%2$cgcc %%s -o %%s%2$c, 0x0%1$cexec_cmd			db	%2$c./%%s%2$c, 0x0%1$cstring_programme	db	%2$c%3$s%2$c, 0x0%1$c%1$c	section .text%1$cmain:%1$c	push		rbp%1$c	mov			rbp, rsp%1$c	sub			rsp, 539%1$c%1$c	mov			dword [rsp + 535], %%1%1$c	cmp			dword [rsp + 535], 0%1$c	jle			return%1$c%1$c	lea			rdi, [rsp]%1$c	lea			rsi, [rel sully_asm_d]%1$c	mov			edx, dword [rsp + 535]%1$c	mov			al, 0%1$c	call		sprintf wrt ..plt%1$c%1$c	lea			rdi, [rel src_file]%1$c	mov			rsi, rsp%1$c	call		strcmp wrt ..plt%1$c	cmp			rax, 0%1$c	jne			continue%1$c	sub			dword [rsp + 535], 1%1$c%1$ccontinue:%1$c	lea			rdi, [rsp]%1$c	lea			rsi, [rel sully_asm_d]%1$c	mov			edx, dword [rsp + 535]%1$c	mov			al, 0%1$c	call		sprintf wrt ..plt%1$c%1$c	lea			rdi, [rsp]%1$c	mov			rsi, 0x241%1$c	mov			rdx, 0x1FC%1$c	mov			rax, 2%1$c	syscall%1$c%1$c%1$c	cmp			rax, 0%1$c	jl			return%1$c%1$c	mov 		dword [rsp + 531], eax%1$c	mov 		edi, dword [rsp + 531]%1$c	lea			rsi, [rel string_programme]%1$c	mov			rdx, 10%1$c	mov			rcx, 34%1$c	mov			r8, rsi%1$c	mov			r9d, dword [rsp + 535]%1$c	mov			al, 0%1$c	call		dprintf wrt ..plt%1$c%1$c    lea			rdi, [rsp + 13]%1$c    lea			rsi, [rel sully_o_d]%1$c    mov 		edx, dword [rsp + 535]%1$c    mov			al, 0%1$c    call		sprintf wrt ..plt%1$c%1$c    lea			rdi, [rsp + 23]%1$c    lea			rsi, [rel compile_asm]%1$c    lea			rdx, [rsp]%1$c    lea			rcx, [rsp + 13]%1$c    mov			al, 0%1$c    call		sprintf wrt ..plt%1$c%1$c	lea			rdi, [rsp + 23]%1$c	call		system	wrt ..plt%1$c%1$c	lea			rdi, [rsp]%1$c	lea			rsi, [rel sully]%1$c	mov 		edx, dword [rsp + 535]%1$c	mov			al, 0%1$c	call		sprintf wrt ..plt%1$c%1$c	lea			rdi, [rsp + 23]%1$c	lea			rsi, [rel compile_ld]%1$c	lea			rdx, [rsp + 13]%1$c	mov			rcx, rsp%1$c	mov			al, 0%1$c	call		sprintf	wrt ..plt%1$c%1$c	lea			rdi, [rsp + 23]%1$c	call		system	wrt ..plt%1$c%1$c	lea			rdi, [rsp + 23]%1$c	lea			rsi, [rel exec_cmd]%1$c	lea			rdx, [rsp]%1$c	mov			al, 0%1$c	call		sprintf wrt ..plt%1$c%1$c	lea			rdi, [rsp + 23]%1$c	call		system wrt ..plt%1$c%1$c	mov			rax, 3%1$c	mov			rdi, [rsp + 531]%1$c	syscall%1$c%1$c%1$c%1$c%1$creturn :%1$c	mov		rax, 0%1$c	mov		rsp, rbp%1$c	pop		rbp%1$c	ret%1$c%1$c%%endmacro%1$c%1$cmain %4$d%1$c", 0x0

	section .text
main:
	push		rbp
	mov			rbp, rsp
	sub			rsp, 539

	mov			dword [rsp + 535], %1
	cmp			dword [rsp + 535], 0
	jle			return

	lea			rdi, [rsp]
	lea			rsi, [rel sully_asm_d]
	mov			edx, dword [rsp + 535]
	mov			al, 0
	call		sprintf wrt ..plt

	lea			rdi, [rel src_file]
	mov			rsi, rsp
	call		strcmp wrt ..plt
	cmp			rax, 0
	jne			continue
	sub			dword [rsp + 535], 1

continue:
	lea			rdi, [rsp]
	lea			rsi, [rel sully_asm_d]
	mov			edx, dword [rsp + 535]
	mov			al, 0
	call		sprintf wrt ..plt

	lea			rdi, [rsp]
	mov			rsi, 0x241
	mov			rdx, 0x1FC
	mov			rax, 2
	syscall


	cmp			rax, 0
	jl			return

	mov 		dword [rsp + 531], eax
	mov 		edi, dword [rsp + 531]
	lea			rsi, [rel string_programme]
	mov			rdx, 10
	mov			rcx, 34
	mov			r8, rsi
	mov			r9d, dword [rsp + 535]
	mov			al, 0
	call		dprintf wrt ..plt

    lea			rdi, [rsp + 13]
    lea			rsi, [rel sully_o_d]
    mov 		edx, dword [rsp + 535]
    mov			al, 0
    call		sprintf wrt ..plt

    lea			rdi, [rsp + 23]
    lea			rsi, [rel compile_asm]
    lea			rdx, [rsp]
    lea			rcx, [rsp + 13]
    mov			al, 0
    call		sprintf wrt ..plt

	lea			rdi, [rsp + 23]
	call		system	wrt ..plt

	lea			rdi, [rsp]
	lea			rsi, [rel sully]
	mov 		edx, dword [rsp + 535]
	mov			al, 0
	call		sprintf wrt ..plt

	lea			rdi, [rsp + 23]
	lea			rsi, [rel compile_ld]
	lea			rdx, [rsp + 13]
	mov			rcx, rsp
	mov			al, 0
	call		sprintf	wrt ..plt

	lea			rdi, [rsp + 23]
	call		system	wrt ..plt

	lea			rdi, [rsp + 23]
	lea			rsi, [rel exec_cmd]
	lea			rdx, [rsp]
	mov			al, 0
	call		sprintf wrt ..plt

	lea			rdi, [rsp + 23]
	call		system wrt ..plt

	mov			rax, 3
	mov			rdi, [rsp + 531]
	syscall




return :
	mov		rax, 0
	mov		rsp, rbp
	pop		rbp
	ret

%endmacro

main 5
