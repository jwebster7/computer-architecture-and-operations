all: boom

boom: boom.c
	gcc -fno-stack-protector -fno-inline -fno-omit-frame-pointer -S -O1 boom.c
	gcc -fno-stack-protector -fno-inline -fno-omit-frame-pointer -g -O1 -o boom boom.c

clean:
	rm boom boom.s

kaboom: kaboom.c
	gcc -O1 -fno-stack-protector -fno-inline -fno-omit-frame-pointer -m32 -S kaboom.c
	gcc -O1 -fno-stack-protector -fno-inline -fno-omit-frame-pointer -m32 -o kaboom kaboom.c

kaboom64: kaboom.c
	gcc -O1 -fno-stack-protector -fno-inline -o kaboom64 kaboom.c
