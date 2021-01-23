;Preciado Gudi#o Guillermina Alejandra
;Practica 6 - 5/a)
;Organizacion de computadoras y lenguaje ensamblador
;05/11/2020

MODEL   small   
   .STACK 100h

   ;----- Insert INCLUDE "filename" directives here
   ;----- Insert EQU and = equates here

 INCLUDE procs.inc
 
       LOCALS

   .DATA
      mens       db  'Son la misma letra! :D',0

   .CODE
    ;-----   Insert program, subrutine call, etc., here

    Principal  	PROC
				mov ax,@data 	;Inicializar DS al la direccion
				mov ds,ax     	; del segmento de datos (.DATA)
                ;Como es un ejemplo de IF-THEN, vamos a hacer una simple
                ;comparacion para ver si esta letra es la que buscamos
                ;y en caso de que no sea solo saldremos, pero si lo es
                ;saldra un mensaje 
		call clrscr

		mov al,'g'			;inicializaremos el valor
                
                cmp al, 'g'			; compararemos el valor con el que deseamos encontrar
                jne @@exit			;en caso que no sea saldra del programa
                    mov  dx,offset mens		;pero si llega a ser lo que se busca, lanzara un mensaje
                    call puts
                    jmp @@exit
            
            @@exit:

				mov ah,04ch	     ; fin de programa
				mov al,0             ;
				int 21h              ; 

                ENDP

; incluir procedimientos	
; ejemplo:
; funcionX PROC ; < -- Indica a TASM el inicio del un procedimiento
;               ; 
;               ; < --- contenido del procedimiento
;           ret
;           ENDP; < -- Indica a TASM el fin del procedimiento



         END
