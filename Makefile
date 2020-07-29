all:	bsa bsa.prg

bsa:	bsa.c Makefile
	gcc -o bsa bsa.c

mega65-libc/cc65/src/memory.s:
	git submodule init
	git submodule update

bsa.prg:	bsa.c Makefile mega65-libc/cc65/src/memory.c
	cl65 -Os --target c64 --cpu 65c02 -o bsa.prg -I mega65-libc/cc65/include bsa.c mega65-libc/cc65/src/memory.c
