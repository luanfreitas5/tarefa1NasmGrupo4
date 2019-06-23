; Grupo 4; 
; Luan Mendes Gonçalves Freitas 15/0015585
; Macro que simula o comando do-while do C

%include "asm_io.inc"

; do-while
; Inicia o loop do do-while
%macro do_While 0
	%push contextoDoWhile  ;empilha o contexto do-while
	%$iniciarLoop:
%endmacro

; verifica a condição do do-while
%macro fim_do_While 1
	mov ebx, %1
	cmp ebx, 0
	jnz %$iniciarLoop ; se o valor for diferente de zero saltar para função iniciarLoop se for verdadeiro
	%pop  ; se for falso, termina a iteracao
%endmacro

section .dat
mensagem 		db "Simulação do-while", 0xa, 0
quebraLinha 	db "", 0xa, 0

segment .bss

global  doWhile

segment .text

doWhile:
	enter 0,0 ; cria um frame na pilha
	pusha ; salva os registradores de base, indice e de segmentos
	mov ecx, [ebp+8]; move o parametro passado no c
	
	;imprimir a mensagem
	mov eax, mensagem
	call print_string

do_While 
	;imprimir os valores de iteração
	mov eax, ecx
	call print_int
	mov eax, quebraLinha
	call print_string
	sub ecx, 1
	fim_do_While ecx
	
	popa ; restaura os registradores de base, indice e de segmentos
	mov eax, 0; move o 0 para registro de retorno
	leave ; desaloca as variaveis locais
	ret
