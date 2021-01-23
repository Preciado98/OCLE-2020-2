;Preciado Gudi#o Guillermina Alejandra
;Practica 6 - Parte 1 - 5
;Organizacion de computadoras y lenguaje ensamblador
;22/11/2020


MODEL   small 
   .STACK 100h

   ;----- Insert INCLUDE "filename" directives here
   ;----- Insert EQU and = equates here

 INCLUDE procs.inc
 
       LOCALS

   .DATA
      mens	db 'H',00001111b,'O',01010010B,'L',01110000B,'A',00110100B

   .CODE
    ;-----   Insert program, subrutine call, etc., here

    Principal  	PROC
				mov ax,@data 	;Inicializar DS al la direccion
				mov ds,ax     	; del segmento de datos (.DATA)
				
				mov es,ax
				mov ah,0
				
				mov al,3
				int 10h
				mov ah,13h
				mov al,3
				mov dh,11	;posicion en y
				mov dl,35	;posicion en x
				mov cx,4
				mov bh,0
				lea bp,mens
				int 10h
				mov ah,0bh
				mov bh,0
				mov bl, 01001000b
				int 10h
			bucle:
				in al,60h
				cmp al,1
				jne bucle
				
				mov ah,4ch
				int 21h
                ENDP
				
; incluir procedimientos	
; ejemplo:
; funcionX PROC ; < -- Indica a TASM el inicio del un procedimiento
;               ; 
;               ; < --- contenido del procedimiento
;           ret
;           ENDP; < -- Indica a TASM el fin del procedimiento


         END
