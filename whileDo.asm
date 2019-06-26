; Grupo 4; 
; Luan Mendes Gonçalves Freitas 15/0015585
; Macro que simula o comando while-do do C

%include "asm_io.inc"

; do-while
; Inicia o loop do while-do
; verifica a condição do do-while
%macro while_do 1
	mov ebx, %1
	cmp ebx, 0
	jnz somatorio ; se o valor for diferente de zero saltar para função somatorio se for verdadeiro
	jmp final ; salta para a final da execução se for falso 
%endmacro

segment .data
valor1:	dd 1
valor2:	dd 2
mensagem 		db "Executando o comando while-do", 0xa, 0
quebraLinha 	db "", 0xa, 0

segment .bss
soma: resd 1

segment .text

global whileDo

whileDo:
	enter 0,0 ; cria um frame na pilha
	pusha ; salva os registradores de base, indice e de segmento
	
	;imprimir a mensagem
	mov eax, mensagem
	call print_string
	
	while_do [ebp+8]; chama a macro com o parametro passado no c	

somatorio:				
	mov	eax,[valor1] ; move valor1 para eax = 1
	add	eax,[valor2] ; soma o valor2 = 2 com eax = 1 e atribui no eax = 3
	add	[soma],eax	; soma o eax com a variavel soma
	sub ebx, 1 	; subtrai 1 após a função ser executada
	while_do ebx ; volta para loop
	
final:
	popa ; restaura os registradores de base, indice e de segmentos
	mov eax, [soma] ; move o resultado para registro de retorno
	leave ; desaloca as variaveis locais
	ret

