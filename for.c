/* Grupo 4
 * Luan Mendes Gonçalves Freitas 15/0015585
 * Programa em C para simular a execução da macro for desenvolvida em NASM
 *
 * 1 - Compilar o arquivo asm_io.asm com o seguinte comando: nasm -f elf -d ELF_TYPE asm_io.asm
 * 2 - Compilar o arquivo for.asm com o seguinte comando: nasm -f elf for.asm
 * 3 - Compilar o arquivo for.c com os objetos gerando nos passos 1 e 2 com comando abaixo:
 * gcc -m32 for.c asm_io.o for.o -o for.exe */

#include <stdio.h>
#include <stdlib.h>

int For(int a, int b, int c);

int main(int argc, char const *argv[]) {
	int resultado = 0;

	if (argc != 4 && (atoi(argv[3]) > 1 || atoi(argv[3]) < 0)) {
		printf("Parametros invalidos, tem que passar o valor de caso\n");
	} else {
		printf("Teste de incremento (++) e decremento (--):\n");
		printf("For i = %s, quantidade = %s e incremento (1) ou decemento (0) %s\n", argv[1], argv[2], argv[3]);
		resultado = For(atoi(argv[1]), atoi(argv[2]), atoi(argv[3]));
		if(atoi(argv[3]) == 1)
			printf("Total de iterações de incremento (++) %d\n", resultado);
		else 
			printf("Total de iterações de decremento (--) %d\n", resultado);
	}
		
	printf("Fim do programa\n");

	return resultado;
}
