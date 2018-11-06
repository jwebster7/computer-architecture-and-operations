	.file	"boom.c"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"KABOOM!!!"
	.text
	.globl	explode
	.type	explode, @function
explode:
.LFB20:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	leaq	.LC0(%rip), %rdi
	call	puts@PLT
	movl	$1, %edi
	call	exit@PLT
	.cfi_endproc
.LFE20:
	.size	explode, .-explode
	.section	.rodata.str1.1
.LC1:
	.string	"%d %d"
	.text
	.globl	phase_1_of_1
	.type	phase_1_of_1, @function
phase_1_of_1:
.LFB21:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	leaq	-8(%rbp), %rcx
	leaq	-4(%rbp), %rdx
	leaq	.LC1(%rip), %rsi
	movq	stdin(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_fscanf@PLT
	cmpl	$2, %eax
	jne	.L10
	movl	-4(%rbp), %edx
	movl	-8(%rbp), %eax
	leal	(%rdx,%rax), %ecx
	testl	%edx, %edx
	jle	.L8
	testl	%eax, %eax
	jle	.L8
	cmpl	$13, %ecx
	jne	.L11
	leave
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.L10:
	.cfi_restore_state
	movl	$0, %eax
	call	explode
.L8:
	movl	$0, %eax
	call	explode
.L11:
	movl	$0, %eax
	call	explode
	.cfi_endproc
.LFE21:
	.size	phase_1_of_1, .-phase_1_of_1
	.section	.rodata.str1.1
.LC2:
	.string	"Welcome to the demo bomb."
.LC3:
	.string	"Phase 1"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC4:
	.string	"You safely defused the bomb. Well done."
	.text
	.globl	main
	.type	main, @function
main:
.LFB22:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	leaq	.LC2(%rip), %rdi
	call	puts@PLT
	leaq	.LC3(%rip), %rdi
	call	puts@PLT
	movl	$0, %eax
	call	phase_1_of_1
	leaq	.LC4(%rip), %rdi
	call	puts@PLT
	movl	$0, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE22:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 6.3.0-12ubuntu2) 6.3.0 20170406"
	.section	.note.GNU-stack,"",@progbits
