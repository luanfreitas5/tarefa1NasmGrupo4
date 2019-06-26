; Grupo 4; 
; Luan Mendes Gonçalves Freitas 15/0015585
; Macro que simula o comando do-while do C

%include "asm_io.inc"

; do
; Inicia o loop do do-while
%macro do 0
	%push contextoDoWhile  ;empilha o contexto do-while
	%$iniciarLoop:
%endmacro

; while
; verifica a condição do do-while
%macro while 1
	mov ebx, %1
	cmp ebx, 0
	jnz %$iniciarLoop ; se o valor for diferente de zero saltar para função iniciarLoop se for verdadeiro
	%pop  ; se for falso, termina a iteracao
%endmacro

section .dat
valor1:	dd 1
valor2:	dd 2
mensagem 		db "Executando o comando do-while", 0xa, 0
quebraLinha 	db "", 0xa, 0

segment .bss
soma: resd 1

segment .text

global  doWhile

doWhile:
	enter 0,0 ; cria um frame na pilha
	pusha ; salva os registradores de base, indice e de segmentos
	mov ecx, [ebp+8]; move o parametro passado no c
	
	;imprimir a mensagem
	mov eax, mensagem
	call print_string

	do 
		mov	eax,[valor1] ; move valor1 para eax = 1
		add	eax,[valor2] ; soma o valor2 = 2 com eax = 1 e atribui no eax = 3
		add	[soma],eax	; soma o eax com a variavel soma
		sub ecx, 1 ; descrementa o contador
	while ecx 
	
	popa ; restaura os registradores de base, indice e de segmentos
	mov eax, [soma]; move o 0 para registro de retorno
	leave ; desaloca as variaveis locais
	ret
