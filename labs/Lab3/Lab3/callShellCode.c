//
// callShellCode.c - a program that writes some code to execute a shell,
//                   and then jumps to that buffer to execute the shell
//
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

char code[] =
    "\x55"                          /* push   %rbp */
    "\x48\x89\xe5"                  /* mov    %rsp,%rbp */
    "\x48\xc7\xc2\x00\x00\x00\x00"  /* mov    $0x0,%rdx */
    "\x48\xc7\xc6\x00\x00\x00\x00"  /* mov    $0x0,%rsi */
    "\x48\xbf\x2f\x62\x69\x6e\x2f"  /* movabs $0x68732f6e69622f,%rdi */
    "\x73\x68\x00"
    "\x57"                          /* push   %rdi */
    "\x48\x89\xe7"                  /* mov    %rsp,%rdi */
    "\x48\xc7\xc0\x3b\x00\x00\x00"  /* mov    $0x3b,%rax */
    "\x0f\x05"                      /* syscall */
    "\x5d"                          /* pop    %rbp */
    "\xc3"                          /* retq */
    "\x90"                          /* nop */
    "\x00"                          /* end of string marker added */
;

int main(int argc, char **argv)
{
   ((void(*)( ))code)();
} 

