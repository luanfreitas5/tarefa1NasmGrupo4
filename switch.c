/* Grupo 4
 * Luan Mendes Gonçalves Freitas 15/0015585
 * Programa em C para simular a execução da macro do-while desenvolvida em NASM
 *
 * 1 - Compilar o arquivo asm_io.asm com o seguinte comando: nasm -f elf -d ELF_TYPE asm_io.asm
 * 2 - Compilar o arquivo switch.asm com o seguinte comando: nasm -f elf switch.asm
 * 3 - Compilar o arquivo switch.c com os objetos gerando nos passos 1 e 2 com comando abaixo:
 * gcc -m32 switch.c asm_io.o switch.o -o switch.exe */

#include <stdio.h>
#include <stdlib.h>

int Switch(int key);

int main(int argc, char const *argv[]) {
	int resultado = 0;

	if (argc != 2) {
		printf("Parametros invalidos, tem que passar o valor de caso\n");
	} else {
		printf("Os valores da chave pode ser: 50, 60, 70 ou outro\n");
		resultado = Switch(atoi(argv[1]));
	}
	printf("Fim do programa\n");

	return resultado;
}
