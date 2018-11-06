AR = ar
AFLAGS = rcs
CC = gcc
CFLAGS = -g -Wall -O2
LIBS = libString.a
OBJS = myShell.o clock.o
LIBOBJS = split.o toUpper.o

all: mylib mysh wildcat

mysh: $(OBJS) $(LIBOBJS) myShell.c
	$(CC) $(CFLAGS) -o mysh $(OBJS) $(LIBOBJS)

wildcat: wildcat.c proxy.c
	$(CC) $(CFLAGS) -o wildcat wildcat.c
	$(CC) $(CFLAGS) -o wildcatd proxy.c

mylib: $(LIBOBJS)
	$(AR) $(AFLAGS) $(LIBS) $(LIBOBJS)

clean:
	-rm -f $(OBJS) $(LIBOBJS) mysh wildcat wildcatd $(LIBS)
