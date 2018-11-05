int main() {
__asm__(
  "mov    $0x0,%rdx\n\t"        // arg 3 = NULL
  "mov    $0x0,%rdi\n\t"
  "push   %rdi\n\t"             // push "NULL" onto stack
  "mov    $0x0068732e776f6e73,%rdi\n\t"
  "push   %rdi\n\t"             // push "snow.sh" onto stack
  "mov    $0x0068732f6e69622f,%rdi\n\t"
  "push   %rdi\n\t"             // push "/bin/sh" onto stack
  "mov    $0x0,%rdi\n\t"
  "push   %rdi\n\t"             // push "NULL" onto stack
  "leaq   24(%rsp),%rdi\n\t"    
  "push   %rdi\n\t"             // push address of "snow.sh"
  "leaq   24(%rsp),%rdi\n\t"    
  "push   %rdi\n\t"             // push address of "/bin/sh"
  "mov    $0x0,%rdi\n\t"
  "push   %rdi\n\t"             // push "NULL" onto stack
  "mov    %rsp,%rdx\n\t"        
  "mov    8(%rsp),%rdi\n\t"
  "leaq   8(%rsp),%rsi\n\t"
  "leaq   8(%rsp),%rcx\n\t"
  "mov    $0x3b,%rax\n\t"       // syscall number = 59
  "syscall\n\t"
);
}
