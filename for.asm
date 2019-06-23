; Grupo 4; 
; Luan Mendes Gonçalves Freitas 15/0015585
; Macro que simula o comando for do C

%include "asm_io.inc"

; Macro de verificação de fim de interação
%macro fimFor 0
	jnz %$inicioLoop  ; verifica se deve continuar iteracoes
	%$fimLoop: ; se nao, termina a iteracao
	%pop ; remove da pilha 
%endmacro

; Macro de verificação de inicio de interação
%macro for 1
	%push contextoFor ; Cria um contexto no topo da pilha
	j%-1 %$fimLoop  ; j%-1 - Codigo de condição (CC) como argumento macro nz e cria-se 'jnz', 
					; %$fimLoop - Codigo que cria um rotulo para um contexto corrente.
	%$inicioLoop: ; inicia corpo do for
%endmacro

section .data
mensagem db "Executando corpo do for (interação)", 0xa, 0
total db " total de interação", 0xa, 0

global For; declaracao do nome da macro na interface C

section .text

	For:
	enter 0,0 ; cria um frame na pilha
 	pusha ; salva os registradores de base, indice e de segmentos

	mov eax, mensagem 
	mov edx,[ebp+8]  ; parametro de iniciação do i
	mov ebx,[ebp+12] ; Numero de iterações 
	mov ecx,[ebp+16] ; identificação de 1 para incremento e 0 decremento
	mov edi, 0; contador de iteracoes
	cmp edx,ebx       

	for nz 
		cmp ecx,0 ; compara argumento de passo com 0
		jz decrementa ; caso o valor for igual a 0 jump decr. Senão continua
		incrementa: inc edx ; incrementa edx
		jmp verifica 
		decrementa: dec edx ; decrementa edx

		verifica: ; label que verifica situação da condição de parada
			call print_string ; imprime na tela a cada iteracao
			inc edi ; incrementa o registrador contador de iteracoes
			cmp edx,ebx ; condicao de parada

	fimFor
	
	mov eax, edi ; imprime o total de iteracoes
	call print_int  
	mov eax, total  ; imprime cada iteração
	call print_string

	popa ; restaura os registradores de base, indice e de segmentos
    mov	eax, 0; move o 0 para registro de retorno
    leave ; desaloca as variaveis locais

	ret ; retorna ao programa C
