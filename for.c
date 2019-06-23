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

int main() {
	int resultado;

	printf("Teste de incremento ++: for(int i = 0; i < 10; i++) [10 iteracoes esperadas] \n");
	resultado = For(0, 10, 1);
	printf("\n\n");
	printf("Teste de decremento --: for(int i = 10; i > 5; i--) [5 iteracoes esperadas]\n");
	resultado = For(10, 5, 0);

	return resultado;
}
