//
// boom.c
//
#include <stdio.h>
#include <stdlib.h>

#define MAGIC_NUMBER 13

void explode() {
   printf("KABOOM!!!\n");
   exit(1);
}

void phase_1_of_1 () {
   int args, x, y;
   int sum = 0;

   args = fscanf (stdin, "%d %d", &x, &y);
   if (args != 2)
       explode();

   sum = x+y;

   if ((x<=0)||(y<=0))
       explode();

   if (sum != MAGIC_NUMBER)
       explode();
}

int main() {
   printf("Welcome to the demo bomb.\n");
   printf ("Phase 1\n");
   phase_1_of_1();
   printf("You safely defused the bomb. Well done.\n");
   return 0;
}

