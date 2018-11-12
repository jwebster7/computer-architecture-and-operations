all: snow shellCode callShell vstack fun buildExploit fun64 funChallenge

snow: callForSnow.c
	gcc -o snow callForSnow.c

shellCode: shellCode.c
	gcc -o shellCode shellCode.c

callShell: callShellCode.c
	gcc -o callShell -z execstack callShellCode.c

vstack: vstack.c
	gcc -g -o vstack -fno-stack-protector -z execstack vstack.c

fun: funWithYooWhoFoo.c
	gcc -o fun -m32 -fno-stack-protector funWithYooWhoFoo.c

fun64: funWithYooWhoFoo64.c
	gcc -o fun64 -fno-stack-protector funWithYooWhoFoo64.c

funChallenge: funWithYooWhoFooChallenge.c
	gcc -o funC -m32 -fno-stack-protector funWithYooWhoFooChallenge.c

buildExploit: buildExploit.c
	gcc -o buildExploit buildExploit.c

clean:
	rm -f snow shellCode callShell vstack fun fun64 funC \
	buildExploit exploit overflow
