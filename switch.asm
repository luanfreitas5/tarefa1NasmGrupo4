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

mensagem 	db "Executando o comando Switch", 0xa, 0

valor :	dd 2

segment .bss
resultado: resd 1

segment .text


global Switch
       
Switch:
	enter 0,0 ; cria um frame na pilha
 	pusha ; salva os registradores de base, indice e de segmentos

	;imprimir a mensagem
	mov eax, mensagem
	call print_string
	
	switch [ebp+20]; move o parametro passado no c
	case [ebp+8] ; caso 1 
	    mov	eax,[ebp+8] ; move valor case para eax 
		add	eax,[ebp+8] ; dobra valor case e atribui no eax
		add	[resultado],eax	; move o eax para a variavel resultado 
		break
	case [ebp+12] ; caso 2
		mov	eax,[ebp+12] ; move valor case para eax 
		add	eax,[ebp+12] ; dobra valor case e atribui no eax
		add	[resultado],eax	; move o eax para a variavel resultado 
		break
	case [ebp+16] ; caso 3
		mov	eax,[ebp+16] ; move valor case para eax 
		add	eax,[ebp+16] ; dobra valor case e atribui no eax
		add	[resultado],eax	; move o eax para a variavel resultado 
		break
	default ; default
		mov	eax,[ebp+20] ; move valor case para eax 
		add	eax,[ebp+20] ; dobra valor case e atribui no eax
		add	[resultado],eax	; move o eax para a variavel resultado 
		break
	fimSwitch

    popa ; restaura os registradores de base, indice e de segmentos
	mov eax, [resultado]; move o resultado para registro de retorno
	leave ; desaloca as variaveis locais
    ret
