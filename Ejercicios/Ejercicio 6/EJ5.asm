;Preciado Gudi#o Guillermina Alejandra
;Ejercicio 6 - 5
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
    ;Programa que lea un dato de 8 bits del puerto 0x29, si el dato es igual a 0xAB enviar un 0x11 por el 
    ;puerto 0x12, de lo contrario enviar un 0x22..
				mov ax,@data 	;Inicializar DS al la direccion
				mov ds,ax     	; del segmento de datos (.DATA)

				call clrscr
                    
                in al,29h           ;ingresa dato por el puerto 0x29
                
                cmp al,AB           ;vemos si el dato es igual que AB
                jz@@igual           ;si es igual salta a @@igual
                    mov al,22       ;si no es igual se enviara un 0x22
                    jmp @@exit
            @@igual:
                mov al,11           ;si el dato es igual se enviara un 0x11
            @@exit:
                out 12,al           ;salen por el puerto 0x12
				
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
