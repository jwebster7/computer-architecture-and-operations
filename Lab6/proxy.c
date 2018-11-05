//
// Proxy to relay signals from FIFO to wildcat process specified
// Messages rcv via FIFO consist of "<src_uid> <src_pid> <dst_pid> <signo>"
// Signals rcv in response should be sent back to /tmp/myfifo<src_uid>
//
#include <stdio.h>
#include <string.h>
#include <fcntl.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <unistd.h>
#include <signal.h>
#include <stdlib.h>

int src_uid;       // User id of process signal sender, default me
int src_pid;       // Process id of signal sender, default this process
char response[80]; // Response to send via FIFO
int myuid;

static struct sigaction sig;

//
// Signal handler
//
void sighandler(int signo, siginfo_t *siginfo, void *context)
{
    // Get pid of signal sender
    pid_t pid = siginfo->si_pid;

    // Generate response to send to proxy via FIFO
	if (signo==SIGUSR1||signo==SIGUSR2)
		sprintf(response,"%d %d %d %d", myuid, pid, src_pid, signo);
}

int main(int argc, char *argv[])
{
    int fd;
    char myfifo[20];
    char fifo[20];
    char arr[80];
	int mypid, signo;

    if (argc > 1)
		myuid = atoi(argv[1]);
	else
		myuid = getuid();

    src_uid = getuid();
    src_pid = getpid();

	sig.sa_sigaction = sighandler;
	sig.sa_flags |= SA_SIGINFO; // Get more detailed information about signal

	if (sigaction(SIGUSR1, &sig, NULL) != 0) {
		perror("Unable to install sig handler");
		return 1;
	}
	if (sigaction(SIGUSR2, &sig, NULL) != 0) {
		perror("Unable to install sig handler");
		return 2;
	}

	sprintf(myfifo,"/tmp/myfifo%d", myuid);

	// Creating the named file(FIFO)
	// mkfifo(<pathname>, <permission>)
	mkfifo(myfifo, 0666);
	printf("Created fifo with name: %s\n", myfifo);

	while(1)
	{
		// Open FIFO to read only
		fd = open(myfifo, O_RDONLY);
		// Read from FIFO
		if (read(fd, arr, sizeof(arr))>0)
		{
			printf("Read: %s\n", arr);
			sscanf(arr,"%d %d %d %d", &src_uid, &src_pid, &mypid, &signo);
			if (signo==SIGUSR1||signo==SIGUSR2)
				kill(mypid,signo);
		}
		close(fd);
        // Send response to proxy via FIFO
		sprintf(fifo,"/tmp/myfifo%d", src_uid);
		if (strlen(response)>0) 
		{
			fd = open(fifo, O_WRONLY);
			printf("Writing to FIFO: %s\n", response);
			if (write(fd, response, sizeof(response))<0)
			{
				printf("Unable to write response to FIFO %s\n", fifo);
			}
			close(fd);
			response[0]='\0';
		}
		sleep(1);
	}
    return 0;
}
