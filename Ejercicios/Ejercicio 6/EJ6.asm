;Preciado Gudi#o Guillermina Alejandra
;Ejercicio 6 - 6
;Organizacion de computadoras y lenguaje ensamblador
;05/11/2020

MODEL small
   .STACK 100h

   ;----- Insert INCLUDE "filename" directives here
   ;----- Insert EQU and = equates here

 INCLUDE procs.inc
 
       LOCALS

   .DATA
      mens       db  'Hola Mundo',0

   .CODE
    ;-----   Insert program, subrutine call, etc., here

    Principal  	PROC
    ;Programa que escriba en el puerto 0x92 los caracteres del abecedario al revés.
				mov ax,@data 	;Inicializar DS al la direccion
				mov ds,ax     	; del segmento de datos (.DATA)

				call clrscr

				mov al,7Ah              ;inicializamos en 'z'
                
            @@imprime:
                cmp al,61h              ;si el dato es menor que 'a' se sale de la impresion
                jb@@exit
                    out 92,al           ;imprimimos el dato por puerto 0x92
                    dec al              ;decrementamos el dato
                    jmp @@imprime       ;volvemos a la comparacion
                
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
