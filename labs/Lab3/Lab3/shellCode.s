0000000000000660 <main>:
 660:	55                   	push   %rbp
 661:	48 89 e5             	mov    %rsp,%rbp
 664:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx
 66b:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi
 672:	48 bf 2f 62 69 6e 2f 	movabs $0x68732f6e69622f,%rdi
 679:	73 68 00 
 67c:	57                   	push   %rdi
 67d:	48 89 e7             	mov    %rsp,%rdi
 680:	48 c7 c0 3b 00 00 00 	mov    $0x3b,%rax
 687:	0f 05                	syscall 
 689:	b8 00 00 00 00       	mov    $0x0,%eax
 68e:	5d                   	pop    %rbp
 68f:	c3                   	retq   
