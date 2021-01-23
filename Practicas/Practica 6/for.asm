;Preciado Gudi#o Guillermina Alejandra
;Practica 6 - 5/d)
;Organizacion de computadoras y lenguaje ensamblador
;05/11/2020

MODEL   small   
   .STACK 100h

   ;----- Insert INCLUDE "filename" directives here
   ;----- Insert EQU and = equates here

 INCLUDE procs.inc
 
       LOCALS

   .DATA
      mens      db  10,0

   .CODE
    ;-----   Insert program, subrutine call, etc., here

    Principal  	PROC
				mov ax,@data 	;Inicializar DS al la direccion
				mov ds,ax     	; del segmento de datos (.DATA)
                
                ;Como manejamos un ciclo for, solo quiero que me muestre en pantalla
                ;los numeros del 1 al 9, saltando renglon.
                call clrscr

                mov cl,0			        ;usaremos al cl como un contador y lo inicializamos en 0(i=0)
                mov al,31h			        ;el valor que imprimiremos 
            @@for:
                cmp cl,9			        ;aqui podremos hasta donde debe llegar dicho cliclo (i<=9)
                je @@exit			        ;en dado caso que lo cumpla salimos de la secuencia
                    call putchar		    ;si no imprimimos
                    inc al			        ;incrementamos valor de lo que imprimimos
                    mov  dx,offset mens		;imprimimos salto de linea
                    call puts
                    
                    inc cl			        ;incrementamos contador (i++)
                    jmp @@for			    ;volvemos al for

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
