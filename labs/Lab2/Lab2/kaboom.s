	.file	"kaboom.c"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"whoami > /tmp/tmpKaboom%d.txt"
.LC1:
	.string	"Unable to execute whoami"
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align 4
.LC2:
	.string	"mail caocd@ksu.edu -s CIS450BombDiffused < /tmp/tmpKaboom%d.txt"
	.align 4
.LC3:
	.string	"Unable to notify TA of success, run on CIS Unix system"
	.text
	.globl	report_solution
	.type	report_solution, @function
report_solution:
.LFB41:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%esi
	pushl	%ebx
	subl	$208, %esp
	.cfi_offset 6, -12
	.cfi_offset 3, -16
	call	__x86.get_pc_thunk.bx
	addl	$_GLOBAL_OFFSET_TABLE_, %ebx
	call	getuid@PLT
	subl	$12, %esp
	pushl	%eax
	leal	.LC0@GOTOFF(%ebx), %eax
	pushl	%eax
	pushl	$200
	pushl	$1
	leal	-208(%ebp), %esi
	pushl	%esi
	call	__sprintf_chk@PLT
	addl	$20, %esp
	pushl	%esi
	call	system@PLT
	addl	$16, %esp
	testl	%eax, %eax
	js	.L5
.L2:
	call	getuid@PLT
	subl	$12, %esp
	pushl	%eax
	leal	.LC2@GOTOFF(%ebx), %eax
	pushl	%eax
	pushl	$200
	pushl	$1
	leal	-208(%ebp), %esi
	pushl	%esi
	call	__sprintf_chk@PLT
	addl	$20, %esp
	pushl	%esi
	call	system@PLT
	addl	$16, %esp
	testl	%eax, %eax
	js	.L6
.L1:
	leal	-8(%ebp), %esp
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
.L5:
	.cfi_restore_state
	subl	$12, %esp
	leal	.LC1@GOTOFF(%ebx), %eax
	pushl	%eax
	call	puts@PLT
	addl	$16, %esp
	jmp	.L2
.L6:
	subl	$12, %esp
	leal	.LC3@GOTOFF(%ebx), %eax
	pushl	%eax
	call	puts@PLT
	addl	$16, %esp
	jmp	.L1
	.cfi_endproc
.LFE41:
	.size	report_solution, .-report_solution
	.globl	report_explosion
	.type	report_explosion, @function
report_explosion:
.LFB42:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE42:
	.size	report_explosion, .-report_explosion
	.section	.rodata.str1.4
	.align 4
.LC4:
	.string	"KABOOOOM, THE BOMB EXPLODED!!!"
	.text
	.globl	explode
	.type	explode, @function
explode:
.LFB43:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$16, %esp
	.cfi_offset 3, -12
	call	__x86.get_pc_thunk.bx
	addl	$_GLOBAL_OFFSET_TABLE_, %ebx
	leal	.LC4@GOTOFF(%ebx), %eax
	pushl	%eax
	call	puts@PLT
	movl	$1, (%esp)
	call	exit@PLT
	.cfi_endproc
.LFE43:
	.size	explode, .-explode
	.section	.rodata.str1.1
.LC5:
	.string	"%d %d"
	.text
	.globl	phase_1_of_6
	.type	phase_1_of_6, @function
phase_1_of_6:
.LFB44:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$20, %esp
	.cfi_offset 3, -12
	call	__x86.get_pc_thunk.bx
	addl	$_GLOBAL_OFFSET_TABLE_, %ebx
	leal	-16(%ebp), %eax
	pushl	%eax
	leal	-12(%ebp), %eax
	pushl	%eax
	leal	.LC5@GOTOFF(%ebx), %eax
	pushl	%eax
	movl	stdin@GOT(%ebx), %eax
	pushl	(%eax)
	call	__isoc99_fscanf@PLT
	addl	$16, %esp
	cmpl	$2, %eax
	jne	.L16
	movl	-12(%ebp), %edx
	testl	%edx, %edx
	jle	.L17
	leal	0(,%edx,8), %eax
	subl	%edx, %eax
	cmpl	-16(%ebp), %eax
	jne	.L18
	movl	-4(%ebp), %ebx
	leave
	.cfi_remember_state
	.cfi_restore 5
	.cfi_restore 3
	.cfi_def_cfa 4, 4
	ret
.L16:
	.cfi_restore_state
	subl	$12, %esp
	pushl	$1
	call	explode
.L17:
	subl	$12, %esp
	pushl	$1
	call	explode
.L18:
	subl	$12, %esp
	pushl	$1
	call	explode
	.cfi_endproc
.LFE44:
	.size	phase_1_of_6, .-phase_1_of_6
	.section	.rodata.str1.1
.LC6:
	.string	"%d %d %d"
	.text
	.globl	phase_2_of_6
	.type	phase_2_of_6, @function
phase_2_of_6:
.LFB45:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$32, %esp
	.cfi_offset 3, -12
	call	__x86.get_pc_thunk.bx
	addl	$_GLOBAL_OFFSET_TABLE_, %ebx
	leal	-20(%ebp), %eax
	pushl	%eax
	leal	-16(%ebp), %eax
	pushl	%eax
	leal	-12(%ebp), %eax
	pushl	%eax
	leal	.LC6@GOTOFF(%ebx), %eax
	pushl	%eax
	movl	stdin@GOT(%ebx), %eax
	pushl	(%eax)
	call	__isoc99_fscanf@PLT
	addl	$32, %esp
	cmpl	$3, %eax
	jne	.L27
	movl	-12(%ebp), %eax
	movl	-16(%ebp), %ecx
	cmpl	%ecx, %eax
	jge	.L28
	cmpl	$200, %ecx
	jg	.L29
	addl	$1, %ecx
	movl	$0, %edx
.L23:
	addl	%eax, %edx
	addl	$1, %eax
	cmpl	%ecx, %eax
	jne	.L23
	cmpl	-20(%ebp), %edx
	jne	.L30
	movl	-4(%ebp), %ebx
	leave
	.cfi_remember_state
	.cfi_restore 5
	.cfi_restore 3
	.cfi_def_cfa 4, 4
	ret
.L27:
	.cfi_restore_state
	subl	$12, %esp
	pushl	$2
	call	explode
.L28:
	subl	$12, %esp
	pushl	$2
	call	explode
.L29:
	subl	$12, %esp
	pushl	$2
	call	explode
.L30:
	subl	$12, %esp
	pushl	$2
	call	explode
	.cfi_endproc
.LFE45:
	.size	phase_2_of_6, .-phase_2_of_6
	.globl	phase_3_of_6
	.type	phase_3_of_6, @function
phase_3_of_6:
.LFB46:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$32, %esp
	.cfi_offset 3, -12
	call	__x86.get_pc_thunk.bx
	addl	$_GLOBAL_OFFSET_TABLE_, %ebx
	leal	-20(%ebp), %eax
	pushl	%eax
	leal	-16(%ebp), %eax
	pushl	%eax
	leal	-12(%ebp), %eax
	pushl	%eax
	leal	.LC6@GOTOFF(%ebx), %eax
	pushl	%eax
	movl	stdin@GOT(%ebx), %eax
	pushl	(%eax)
	call	__isoc99_fscanf@PLT
	addl	$32, %esp
	cmpl	$3, %eax
	jne	.L37
	movl	-12(%ebp), %edx
	movl	-16(%ebp), %eax
	movl	%edx, %ecx
	imull	%eax, %ecx
	testl	%ecx, %ecx
	je	.L38
	movl	-20(%ebp), %ecx
	testl	%ecx, %ecx
	je	.L39
	andl	$-559038737, %edx
	orl	%edx, %eax
	cmpl	%eax, %ecx
	jne	.L40
	movl	-4(%ebp), %ebx
	leave
	.cfi_remember_state
	.cfi_restore 5
	.cfi_restore 3
	.cfi_def_cfa 4, 4
	ret
.L37:
	.cfi_restore_state
	subl	$12, %esp
	pushl	$3
	call	explode
.L38:
	subl	$12, %esp
	pushl	$3
	call	explode
.L39:
	subl	$12, %esp
	pushl	$3
	call	explode
.L40:
	subl	$12, %esp
	pushl	$3
	call	explode
	.cfi_endproc
.LFE46:
	.size	phase_3_of_6, .-phase_3_of_6
	.globl	f
	.type	f, @function
f:
.LFB47:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%esi
	pushl	%ebx
	.cfi_offset 6, -12
	.cfi_offset 3, -16
	movl	8(%ebp), %ebx
	movl	$1, %eax
	cmpl	$2, %ebx
	jg	.L45
.L41:
	leal	-8(%ebp), %esp
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
.L45:
	.cfi_restore_state
	subl	$12, %esp
	leal	-1(%ebx), %eax
	pushl	%eax
	call	f
	movl	%eax, %esi
	subl	$3, %ebx
	movl	%ebx, (%esp)
	call	f
	addl	$16, %esp
	addl	%esi, %eax
	jmp	.L41
	.cfi_endproc
.LFE47:
	.size	f, .-f
	.section	.rodata.str1.4
	.align 4
.LC7:
	.string	"Congratulations, you solved the secret."
	.text
	.globl	phase_4_of_6
	.type	phase_4_of_6, @function
phase_4_of_6:
.LFB48:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$28, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	call	__x86.get_pc_thunk.bx
	addl	$_GLOBAL_OFFSET_TABLE_, %ebx
	leal	-32(%ebp), %eax
	pushl	%eax
	leal	-28(%ebp), %eax
	pushl	%eax
	leal	.LC5@GOTOFF(%ebx), %eax
	pushl	%eax
	movl	stdin@GOT(%ebx), %eax
	pushl	(%eax)
	call	__isoc99_fscanf@PLT
	addl	$16, %esp
	cmpl	$2, %eax
	jne	.L52
	movl	-28(%ebp), %esi
	cmpl	$7, %esi
	jle	.L53
	subl	$12, %esp
	leal	-1(%esi), %eax
	pushl	%eax
	call	f
	movl	%eax, %edi
	subl	$3, %esi
	movl	%esi, (%esp)
	call	f
	addl	$16, %esp
	addl	%eax, %edi
	cmpl	-32(%ebp), %edi
	jne	.L54
	cmpl	$60, %edi
	je	.L55
.L46:
	leal	-12(%ebp), %esp
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
.L52:
	.cfi_restore_state
	subl	$12, %esp
	pushl	$4
	call	explode
.L53:
	subl	$12, %esp
	pushl	$4
	call	explode
.L54:
	subl	$12, %esp
	pushl	$4
	call	explode
.L55:
	subl	$12, %esp
	leal	.LC7@GOTOFF(%ebx), %eax
	pushl	%eax
	call	puts@PLT
	addl	$16, %esp
	jmp	.L46
	.cfi_endproc
.LFE48:
	.size	phase_4_of_6, .-phase_4_of_6
	.globl	who
	.type	who, @function
who:
.LFB49:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	movl	$1, %eax
	movl	8(%ebp), %ecx
	sall	%cl, %eax
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE49:
	.size	who, .-who
	.globl	yoo
	.type	yoo, @function
yoo:
.LFB50:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	.cfi_offset 3, -12
	movl	8(%ebp), %eax
	leal	1(%eax), %ebx
	pushl	%ebx
	call	who
	addl	$4, %esp
	addl	%ebx, %eax
	movl	-4(%ebp), %ebx
	leave
	.cfi_restore 5
	.cfi_restore 3
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE50:
	.size	yoo, .-yoo
	.globl	phase_5_of_6
	.type	phase_5_of_6, @function
phase_5_of_6:
.LFB51:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%esi
	pushl	%ebx
	subl	$28, %esp
	.cfi_offset 6, -12
	.cfi_offset 3, -16
	call	__x86.get_pc_thunk.bx
	addl	$_GLOBAL_OFFSET_TABLE_, %ebx
	leal	-20(%ebp), %eax
	pushl	%eax
	leal	-16(%ebp), %eax
	pushl	%eax
	leal	-12(%ebp), %eax
	pushl	%eax
	leal	.LC6@GOTOFF(%ebx), %eax
	pushl	%eax
	movl	stdin@GOT(%ebx), %eax
	pushl	(%eax)
	call	__isoc99_fscanf@PLT
	addl	$32, %esp
	cmpl	$3, %eax
	jne	.L66
	movl	-12(%ebp), %eax
	cmpl	$2, %eax
	jle	.L62
	movl	-16(%ebp), %esi
	cmpl	$2, %esi
	jle	.L62
	subl	$12, %esp
	pushl	%eax
	call	yoo
	movl	%eax, %ebx
	movl	%esi, (%esp)
	call	who
	addl	$16, %esp
	addl	%eax, %ebx
	cmpl	-20(%ebp), %ebx
	jne	.L67
	leal	-8(%ebp), %esp
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
.L66:
	.cfi_restore_state
	subl	$12, %esp
	pushl	$5
	call	explode
.L62:
	subl	$12, %esp
	pushl	$5
	call	explode
.L67:
	subl	$12, %esp
	pushl	$5
	call	explode
	.cfi_endproc
.LFE51:
	.size	phase_5_of_6, .-phase_5_of_6
	.globl	phase_6_of_6
	.type	phase_6_of_6, @function
phase_6_of_6:
.LFB52:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$44, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	call	__x86.get_pc_thunk.bx
	addl	$_GLOBAL_OFFSET_TABLE_, %ebx
	leal	-32(%ebp), %eax
	pushl	%eax
	leal	-28(%ebp), %eax
	pushl	%eax
	leal	.LC5@GOTOFF(%ebx), %eax
	pushl	%eax
	movl	stdin@GOT(%ebx), %eax
	pushl	(%eax)
	call	__isoc99_fscanf@PLT
	addl	$16, %esp
	cmpl	$2, %eax
	jne	.L77
	movl	-28(%ebp), %eax
	movl	%eax, -44(%ebp)
	movl	-32(%ebp), %esi
	imull	%esi, %eax
	testl	%eax, %eax
	jle	.L78
	movl	$0, %edx
	movl	$0, %edi
.L70:
	addl	$1, %edi
	leal	0(,%edi,4), %ebx
	movl	$0, %eax
.L71:
	addl	$2, %eax
	leal	(%eax,%ebx), %ecx
	addl	%ecx, %edx
	cmpl	%eax, %esi
	jge	.L71
	cmpl	%edi, -44(%ebp)
	jge	.L70
	cmpl	$108, %edx
	jne	.L79
	leal	-12(%ebp), %esp
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
.L77:
	.cfi_restore_state
	subl	$12, %esp
	pushl	$6
	call	explode
.L78:
	subl	$12, %esp
	pushl	$6
	call	explode
.L79:
	subl	$12, %esp
	pushl	$6
	call	explode
	.cfi_endproc
.LFE52:
	.size	phase_6_of_6, .-phase_6_of_6
	.section	.rodata.str1.4
	.align 4
.LC8:
	.string	"Welcome to the bomb. There are six phases. Good luck."
	.section	.rodata.str1.1
.LC9:
	.string	"Phase 1..."
	.section	.rodata.str1.4
	.align 4
.LC10:
	.string	"Congratulations, you completed phase 1 of 6."
	.section	.rodata.str1.1
.LC11:
	.string	"Phase 2..."
	.section	.rodata.str1.4
	.align 4
.LC12:
	.string	"Congratulations, you completed phase 2 of 6."
	.section	.rodata.str1.1
.LC13:
	.string	"Phase 3..."
	.section	.rodata.str1.4
	.align 4
.LC14:
	.string	"Congratulations, you completed phase 3 of 6."
	.section	.rodata.str1.1
.LC15:
	.string	"Phase 4..."
	.section	.rodata.str1.4
	.align 4
.LC16:
	.string	"Congratulations, you completed phase 4 of 6."
	.section	.rodata.str1.1
.LC17:
	.string	"Phase 5..."
	.section	.rodata.str1.4
	.align 4
.LC18:
	.string	"Congratulations, you completed phase 5 of 6."
	.section	.rodata.str1.1
.LC19:
	.string	"Phase 6..."
	.section	.rodata.str1.4
	.align 4
.LC20:
	.string	"Congratulations, you completed phase 6 of 6."
	.align 4
.LC21:
	.string	"Hooray, you diffused the bomb!!!"
	.text
	.globl	main
	.type	main, @function
main:
.LFB53:
	.cfi_startproc
	leal	4(%esp), %ecx
	.cfi_def_cfa 1, 0
	andl	$-16, %esp
	pushl	-4(%ecx)
	pushl	%ebp
	.cfi_escape 0x10,0x5,0x2,0x75,0
	movl	%esp, %ebp
	pushl	%ebx
	pushl	%ecx
	.cfi_escape 0xf,0x3,0x75,0x78,0x6
	.cfi_escape 0x10,0x3,0x2,0x75,0x7c
	call	__x86.get_pc_thunk.bx
	addl	$_GLOBAL_OFFSET_TABLE_, %ebx
	subl	$12, %esp
	leal	.LC8@GOTOFF(%ebx), %eax
	pushl	%eax
	call	puts@PLT
	leal	.LC9@GOTOFF(%ebx), %eax
	movl	%eax, (%esp)
	call	puts@PLT
	call	phase_1_of_6
	leal	.LC10@GOTOFF(%ebx), %eax
	movl	%eax, (%esp)
	call	puts@PLT
	leal	.LC11@GOTOFF(%ebx), %eax
	movl	%eax, (%esp)
	call	puts@PLT
	call	phase_2_of_6
	leal	.LC12@GOTOFF(%ebx), %eax
	movl	%eax, (%esp)
	call	puts@PLT
	leal	.LC13@GOTOFF(%ebx), %eax
	movl	%eax, (%esp)
	call	puts@PLT
	call	phase_3_of_6
	leal	.LC14@GOTOFF(%ebx), %eax
	movl	%eax, (%esp)
	call	puts@PLT
	leal	.LC15@GOTOFF(%ebx), %eax
	movl	%eax, (%esp)
	call	puts@PLT
	call	phase_4_of_6
	leal	.LC16@GOTOFF(%ebx), %eax
	movl	%eax, (%esp)
	call	puts@PLT
	leal	.LC17@GOTOFF(%ebx), %eax
	movl	%eax, (%esp)
	call	puts@PLT
	call	phase_5_of_6
	leal	.LC18@GOTOFF(%ebx), %eax
	movl	%eax, (%esp)
	call	puts@PLT
	leal	.LC19@GOTOFF(%ebx), %eax
	movl	%eax, (%esp)
	call	puts@PLT
	call	phase_6_of_6
	leal	.LC20@GOTOFF(%ebx), %eax
	movl	%eax, (%esp)
	call	puts@PLT
	leal	.LC21@GOTOFF(%ebx), %eax
	movl	%eax, (%esp)
	call	puts@PLT
	call	report_solution
	movl	$0, %eax
	leal	-8(%ebp), %esp
	popl	%ecx
	.cfi_restore 1
	.cfi_def_cfa 1, 0
	popl	%ebx
	.cfi_restore 3
	popl	%ebp
	.cfi_restore 5
	leal	-4(%ecx), %esp
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE53:
	.size	main, .-main
	.section	.text.__x86.get_pc_thunk.bx,"axG",@progbits,__x86.get_pc_thunk.bx,comdat
	.globl	__x86.get_pc_thunk.bx
	.hidden	__x86.get_pc_thunk.bx
	.type	__x86.get_pc_thunk.bx, @function
__x86.get_pc_thunk.bx:
.LFB54:
	.cfi_startproc
	movl	(%esp), %ebx
	ret
	.cfi_endproc
.LFE54:
	.ident	"GCC: (Ubuntu 6.3.0-12ubuntu2) 6.3.0 20170406"
	.section	.note.GNU-stack,"",@progbits
