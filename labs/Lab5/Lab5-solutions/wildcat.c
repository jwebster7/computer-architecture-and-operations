//
// player.c - Player Template
//
// Developer: Sample Solution
//
#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <sys/stat.h>
#include <string.h>
#include <unistd.h>
#include <string.h>
#include <ctype.h>
#include <signal.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <errno.h>

#define MAX_LIVES 10
#define MAXLINE 100

int timeout;
double currentCycles;
double MHZ;
int shotCount = 0;
static struct sigaction sig;

int n;
int pid[20];

//
// Update pids
//
void updatePid(pid_t sender)
{
  int found = 0;
  int i;

  for(i=0; i<n; i++)
    if (pid[i] == sender)
      found = 1;

  if (!found)
  {
    pid[n] = sender;
    n++;
  }
  return;
}

//
// Signal handler
//
void sighandler(int signo, siginfo_t *siginfo, void *context)
{
  // Get pid of sender
  pid_t sender_pid = siginfo->si_pid;

  switch(signo)
  {
    case SIGUSR1:
	  shotCount++;
	  printf("Process %d shot by %d, shot %d times\n", getpid(), sender_pid, shotCount);
      if (shotCount>=MAX_LIVES)
      {
		printf("Process %d is dead...\n", getpid());
		exit(0);
      }
	  updatePid(sender_pid);
      break;
    case SIGUSR2:
	  shotCount+=2;
	  printf("Process %d blasted by %d, shot %d times\n", getpid(), sender_pid, shotCount);
      if (shotCount>=MAX_LIVES)
      {
		printf("Process %d is dead...\n", getpid());
		exit(0);
      }
	  updatePid(sender_pid);
      break;
    default:
      printf("\n\n*** Process %d caught unexpected signal %d ***\n\n", getpid(), signo);
      printf("mysh>");
      fflush(stdout);
      break;
  }
  return;
}

int main(int argc, char *argv[])
{
  int i, j, k, signo, myPid;

  printf("Player %d started with arguments: ", getpid());
  for (i=1; i<argc; i++)
    printf("%s ", argv[i]);
  printf("\n");
  fflush(stdout);

  sig.sa_sigaction = sighandler;
  sig.sa_flags |= SA_SIGINFO; // Get more detailed information about signal

  if (sigaction(SIGUSR1, &sig, NULL) != 0) {
	perror("Unable to install sig handler");
    return errno;
  }
  if (sigaction(SIGUSR2, &sig, NULL) != 0) {
	perror("Unable to install sig handler");
    return errno;
  }

  myPid = getpid();
  printf("In player with PID: %d\n", myPid);
  srand(myPid);

  for (i=1; i<argc; i++)
    pid[i-1] = atoi(argv[i]);
  n = argc-1;

  while(1)
  {
    j=rand()%2;
	if (j==0)
	  signo = SIGUSR1;
	else
	  signo = SIGUSR2;
	sleep(rand()%10+1);
    if (n>0)
    {
	  k=rand()%n;
	  while((kill(pid[k],0)!=0)||(pid[k]==myPid))
      {
	    sleep(1);
	    k=rand()%n;
      }
	  if (signo == SIGUSR1)
		printf("%d --> %d\n", myPid, pid[k]);
	  else
		printf("%d ==> %d\n", myPid, pid[k]);
	  kill(pid[k],signo);
    }
  }

  return 0;
}
