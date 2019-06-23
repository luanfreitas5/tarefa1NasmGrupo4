; Grupo 4; 
; Luan Mendes Gonçalves Freitas 15/0015585
; Macro que simula o comando switch do C

%include "asm_io.inc"

; switch
; cria um contexto do switch no topo da pilha
; inicia numero do caso 
; pula para o primeiro caso
%macro switch 1
	%push contextoSwitch
	%assign %$caseNumero 1 ;cria uma variavel no contexto com o valor parametro
	mov eax, %1
	jmp %$case%$caseNumero ; jump para o caso
%endmacro

; case
; incrementa numero do caso e pula para o próximo
; avança para o proximo caso se condição não for satisfeita
%macro case 1
	%$case%$caseNumero:
		cmp eax, %1
		%assign %$caseNumero %$caseNumero+1
		jne %$case%$caseNumero
%endmacro

; default
; usando quando não entra nenhum case
%macro default 0
		%$case%$caseNumero:
%endmacro

; break
; pula para o fim do switch fimSwitch
%macro break 0
	jmp %$breakSwitch
%endmacro

; fimSwitch
; desempilha contexto do switch (contextoSwitch)
%macro fimSwitch 0
	%$breakSwitch:
	%pop contextoSwitch
%endmacro

segment .data

; mensagens que serão impressão no qual entrar num caso
caso1Mensagem 		db "Entrou no Caso 1 valor 50", 0xa, 0
caso2Mensagem 		db "Entrou no Caso 2 valor 60", 0xa, 0
caso3Mensagem 		db "Entrou no Caso 3 valor 70", 0xa, 0
defaultMensagem 	db "Entrou no Default valor invalido", 0xa, 0

testeMensagem 		db "Teste do Switch", 0xa, 0

; valores que determina qual o caso da condição satisfeita
caso1Valor	equ 50
caso2Valor	equ 60
caso3Valor	equ 70

segment .bss

global Switch

segment .text
       
Switch:
	enter 0,0 ; cria um frame na pilha
 	pusha ; salva os registradores de base, indice e de segmentos

	;imprimir a mensagem
	mov eax, testeMensagem
	call print_string
	
	switch [ebp+8]; move o parametro passado no c
	case caso1Valor
		mov eax, caso1Mensagem
		call print_string
		break
	case caso2Valor
		mov eax, caso2Mensagem
		call print_string
		break
	case caso3Valor
		mov eax, caso3Mensagem
		call print_string
		break
	default
		mov eax, defaultMensagem
		call print_string
		break
	fimSwitch

    popa ; restaura os registradores de base, indice e de segmentos
	mov eax, 0; move o 0 para registro de retorno
	leave ; desaloca as variaveis locais
    ret
