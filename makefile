all: asm_io do-while-c while-do-c
asm_io:
	nasm -f elf -d ELF_TYPE asm_io.asm
	
do-while-asm:
	nasm -f elf doWhile.asm
	
while-do-asm:
	nasm -f elf whileDo.asm

do-while-c: asm_io do-while-asm
	gcc -m32 doWhile.c asm_io.o doWhile.o -o doWhile

while-do-c: asm_io while-do-asm
	gcc -m32 whileDo.c asm_io.o whileDo.o -o whileDo

clean:
	rm *.o