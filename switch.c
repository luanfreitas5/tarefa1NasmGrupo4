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

int Switch(int case1, int case2, int case3, int key);

int main(int argc, char const *argv[]) {
	int resultado = 0;

	if (argc != 5) {
		printf("Parametros invalidos, tem que passar 3 valores de casos e uma chave\n");
	} else {
		printf("case1 %s, case2: %s, case3 %s default e chave %s\n", argv[1], argv[2], argv[3], argv[4]);
		resultado = Switch(atoi(argv[1]), atoi(argv[2]), atoi(argv[3]), atoi(argv[4]));
			printf("Dobro do case = %d\n", resultado);
	}
	printf("Fim do programa\n");

	return resultado;
}
