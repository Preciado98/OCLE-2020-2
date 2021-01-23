;Preciado Gudi#o Guillermina Alejandra
;Practica 6 - 5/f)
;Organizacion de computadoras y lenguaje ensamblador
;05/11/2020

MODEL   small   
   .STACK 100h

   ;----- Insert INCLUDE "filename" directives here
   ;----- Insert EQU and = equates here

 INCLUDE procs.inc
 
       LOCALS

   .DATA
      mens      db  32,0

   .CODE
    ;-----   Insert program, subrutine call, etc., here

    Principal  	PROC
				mov ax,@data 	;Inicializar DS al la direccion
				mov ds,ax     	; del segmento de datos (.DATA)
                
                ;Manejando el do while, solo hace y al final compara y asi hasta que cumpla lo que queremos
		;por lo que como en el ejemplo del while-do, imprimiremos del 1 al 9
				call clrscr

                mov al,31h  			    ;inicilizamos al en 1 en ascci para si impresion en pantalla
            @@do:
                    call putchar		    ;inmediatamente imprimimo
                    inc al			        ;incrementamos al para la comparacion
                    mov  dx,offset mens		;aqui solo imprimimos un espacio
                    call puts
                    cmp al,39h			    ;comparamos (el while) el valor de al para saber si no es un 9 en ascci
                    ja @@while			    ;saltara al final si es mayor que 9 hexadecimal
                    jmp @@do			    ;si no es asi, continuamos en el do-while

            @@while:

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
