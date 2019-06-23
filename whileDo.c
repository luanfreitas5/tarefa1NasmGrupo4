/* Grupo 4
 * Luan Mendes Gonçalves Freitas 15/0015585
 * Programa em C para simular a execução da macro while-do desenvolvida em NASM
 *
 * 1 - Compilar o arquivo asm_io.asm com o seguinte comando: nasm -f elf -d ELF_TYPE asm_io.asm
 * 2 - Compilar o arquivo whileDo.asm com o seguinte comando: nasm -f elf whileDo.asm
 * 3 - Compilar o arquivo whileDo.c com os objetos gerando nos passos 1 e 2 com comando abaixo:
 * gcc -m32 whileDo.c asm_io.o whileDo.o -o whileDo.exe */

#include <stdio.h>
#include <stdlib.h>

/**
 *	Função para simular a execução do comando while-do.
 *	Parâmetro: Número inteiro que representa o número de vezes que o laço deve ser executado.
 *	Retorno: Retorna o valor da variavel soma que acumulado a cada iteração do laço que foi executado.
 **/
int whileDo(int valor);

int main(int argc, char const *argv[]) {
	int resultado = 0;

	if (argc != 2) {
		printf("Parametros invalidos, tem que passar o valor de repetição\n");
	} else {
		resultado = whileDo(atoi(argv[1]));
		printf("Resultado: %d\n", resultado);
	}

	printf("Fim do programa\n");

	return resultado;
}
