	.file	"sito.c"
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"Brak liczb pierwszych w przedziale [%lld, %lld]\n"
	.align 8
.LC1:
	.string	"Brak pami\304\231ci dla zakresu do %lld\n"
	.align 8
.LC2:
	.string	"Liczby pierwsze w przedziale [%lld, %lld]:\n"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC3:
	.string	"%lld "
.LC4:
	.string	"Znaleziono: %lld\n"
	.text
	.p2align 4
	.globl	Sieve
	.type	Sieve, @function
Sieve:
.LFB39:
	.cfi_startproc
	endbr64
	xorl	%eax, %eax
	testq	%rdi, %rdi
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	cmovns	%rdi, %rax
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	movq	%rsi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	movq	%rax, %rbx
	cmpq	$1, %rsi
	jle	.L14
	cmpq	%rax, %rsi
	jl	.L14
	leaq	1(%rsi), %r13
	movq	%r13, %rdi
	call	malloc@PLT
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L21
	movq	%r13, %rdx
	movl	$1, %esi
	movq	%rax, %rdi
	call	memset@PLT
	xorl	%eax, %eax
	movw	%ax, (%r12)
	cmpq	$3, %rbp
	jle	.L5
	movl	$2, %edx
	movl	$4, %eax
	jmp	.L8
	.p2align 4,,10
	.p2align 3
.L24:
	addq	$1, %rdx
	movq	%rdx, %rax
	imulq	%rdx, %rax
	cmpq	%rbp, %rax
	jg	.L5
.L8:
	cmpb	$0, (%r12,%rdx)
	jne	.L18
	addq	$1, %rdx
	movq	%rdx, %rax
	imulq	%rdx, %rax
	cmpq	%rbp, %rax
	jle	.L8
.L5:
	movq	%rbp, %rcx
	movq	%rbx, %rdx
	leaq	.LC2(%rip), %rsi
	xorl	%eax, %eax
	movl	$2, %edi
	xorl	%r13d, %r13d
	leaq	.LC3(%rip), %r14
	call	__printf_chk@PLT
	.p2align 4,,10
	.p2align 3
.L13:
	cmpq	$1, %rbx
	jle	.L22
	cmpb	$0, (%r12,%rbx)
	jne	.L23
.L11:
	addq	$1, %rbx
	cmpq	%rbx, %rbp
	jge	.L13
	movl	$10, %edi
	call	putchar@PLT
	movq	%r13, %rdx
	movl	$2, %edi
	xorl	%eax, %eax
	leaq	.LC4(%rip), %rsi
	call	__printf_chk@PLT
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	movq	%r12, %rdi
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	jmp	free@PLT
	.p2align 4,,10
	.p2align 3
.L7:
	.cfi_restore_state
	movb	$0, (%r12,%rax)
	addq	%rdx, %rax
.L18:
	cmpq	%rax, %rbp
	jge	.L7
	jmp	.L24
	.p2align 4,,10
	.p2align 3
.L22:
	addq	$1, %rbx
	jmp	.L13
	.p2align 4,,10
	.p2align 3
.L23:
	movq	%rbx, %rdx
	movq	%r14, %rsi
	movl	$2, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	addq	$1, %r13
	jmp	.L11
	.p2align 4,,10
	.p2align 3
.L14:
	movq	%rbp, %rcx
	movq	%rbx, %rdx
	leaq	.LC0(%rip), %rsi
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	movl	$2, %edi
	popq	%rbp
	.cfi_def_cfa_offset 32
	xorl	%eax, %eax
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	jmp	__printf_chk@PLT
.L21:
	.cfi_restore_state
	movq	stderr(%rip), %rdi
	popq	%rbx
	.cfi_def_cfa_offset 40
	movq	%rbp, %rcx
	movl	$2, %esi
	popq	%rbp
	.cfi_def_cfa_offset 32
	leaq	.LC1(%rip), %rdx
	popq	%r12
	.cfi_def_cfa_offset 24
	xorl	%eax, %eax
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	jmp	__fprintf_chk@PLT
	.cfi_endproc
.LFE39:
	.size	Sieve, .-Sieve
	.section	.rodata.str1.1
.LC5:
	.string	"Podaj poczatek przedzialu: "
.LC6:
	.string	"%lld"
.LC7:
	.string	"Blad: to nie jest liczba.\n"
.LC8:
	.string	"Podaj koniec przedzialu: "
	.section	.rodata.str1.8
	.align 8
.LC9:
	.string	"(Zamienilem kolejnosc: teraz [%lld, %lld])\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB40:
	.cfi_startproc
	endbr64
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	leaq	.LC5(%rip), %rsi
	movl	$2, %edi
	leaq	.LC6(%rip), %rbx
	subq	$32, %rsp
	.cfi_def_cfa_offset 48
	movq	%fs:40, %rax
	movq	%rax, 24(%rsp)
	xorl	%eax, %eax
	call	__printf_chk@PLT
	xorl	%eax, %eax
	leaq	8(%rsp), %rsi
	movq	%rbx, %rdi
	call	__isoc99_scanf@PLT
	cmpl	$1, %eax
	jne	.L33
	leaq	.LC8(%rip), %rsi
	movl	$2, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	xorl	%eax, %eax
	leaq	16(%rsp), %rsi
	movq	%rbx, %rdi
	call	__isoc99_scanf@PLT
	subl	$1, %eax
	jne	.L33
	movq	8(%rsp), %rdi
	movq	16(%rsp), %rsi
	cmpq	%rsi, %rdi
	jg	.L34
.L30:
	call	Sieve
	xorl	%eax, %eax
	jmp	.L25
.L33:
	movq	stderr(%rip), %rcx
	movl	$26, %edx
	movl	$1, %esi
	leaq	.LC7(%rip), %rdi
	call	fwrite@PLT
	movl	$1, %eax
.L25:
	movq	24(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L35
	addq	$32, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
.L34:
	.cfi_restore_state
	movq	%rsi, 8(%rsp)
	movq	%rdi, %rcx
	movq	%rsi, %rdx
	xorl	%eax, %eax
	movq	%rdi, 16(%rsp)
	leaq	.LC9(%rip), %rsi
	movl	$2, %edi
	call	__printf_chk@PLT
	movq	8(%rsp), %rdi
	movq	16(%rsp), %rsi
	jmp	.L30
.L35:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE40:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
