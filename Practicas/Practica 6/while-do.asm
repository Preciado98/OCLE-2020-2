;Preciado Gudi#o Guillermina Alejandra
;Practica 6 - 5/e)
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
                
                ;Manejando el While-do, lo cual es comparar y si este es igual o cumple lo que requerimos
		;salimos de este, en este ejemplo imprimiremos del 1 al 9

		    call clrscr

            mov al,31h			            ;inicializamos el valor en 1 hexadecimal

            @@while:	
                cmp al,39h			        ;comparamos al con 9 hexadecimal (while(al<=9){)
                ja @@finwhile			    ;si este es mayor a 9, saldra del ciclo(printf("%d ",al)
                    call putchar		    ;de lo contrario seguira e imprimira el valor de al
                    inc al			        ;incrementamos al (al++)
                    mov  dx,offset mens		;imprimimos un espacio
                    call puts

                    jmp @@while 	    	;saltamos al inicio de la secuencia(})

            @@finwhile:

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
