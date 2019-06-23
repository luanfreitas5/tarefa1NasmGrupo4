/* Grupo 4
 * Luan Mendes Gonçalves Freitas 15/0015585
 * Programa em C para simular a execução da macro do-while desenvolvida em NASM
 *
 * 1 - Compilar o arquivo asm_io.asm com o seguinte comando: nasm -f elf -d ELF_TYPE asm_io.asm
 * 2 - Compilar o arquivo doWhile.asm com o seguinte comando: nasm -f elf doWhile.asm
 * 3 - Compilar o arquivo doWhile.c com os objetos gerando nos passos 1 e 2 com comando abaixo:
 * gcc -m32 doWhile.c asm_io.o doWhile.o -o doWhile.exe */

#include <stdio.h>
#include <stdlib.h>

/**
 *	Função para simular a execução do comando do-while.
 *	Parâmetro: Número inteiro que representa o número de vezes que o laço deve ser executado.
 *	Retorno: Retorna zero.
 **/
int doWhile(int valor);

int main(int argc, char const *argv[]) {
	int resultado = 0;

	if (argc != 2) {
		printf("Parametros invalidos, tem que passar o valor de repetição\n");
	} else {
		resultado = doWhile(atoi(argv[1]));
	}

	printf("Fim do programa\n");

	return resultado;
}
