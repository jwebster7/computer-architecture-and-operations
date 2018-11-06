//
// vstack.c - vulnerable stack
//
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <sys/stat.h>
#include <fcntl.h>

char data[128];
FILE *fp;
char *bp;
int fd;
char* addr;

int load_code(char *filename)
{
    fd = open (filename, O_RDWR | O_CREAT, S_IRUSR | S_IWUSR); 
    printf("fd = %d\n", fd);

    addr=mmap((void *)0x12BEE000, 512, PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE,fd,0);
    if (addr == MAP_FAILED) {
	  close(fd);
	  perror("Error mmapping the file");
	  exit(EXIT_FAILURE);
    }
    printf("Addr: %lu\n", (long unsigned) addr);
    close (fd);
    return 0;
}

int bof(char *filename)
{
    char buffer[8];
    int i;

    bp = buffer;
    fp = fopen(filename, "rb");

    /* The following statement has a potential buffer overflow problem */
    while (!feof(fp))
      fread(bp++, sizeof(char), 1, fp);
    fclose(fp);
    return 0;
}

int main(int argc, char **argv)
{
    switch(argc)
    {
      case 3:
        load_code(argv[2]);
        printf("Loaded code\n");
        bof(argv[1]);
        printf("Loaded overflow, so what are we doing back here?\n");
        break;
      default:
        printf("Usage: vstack <overflow> <exploit>\n");
        break;
    }
    return 0;
}
