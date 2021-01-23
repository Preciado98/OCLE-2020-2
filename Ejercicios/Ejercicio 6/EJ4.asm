;Preciado Gudi#o Guillermina Alejandra
;Ejercicio 6 - 4
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
    ;Programa que lea un dato de 8 bits del puerto 0x29, si el dato es menor a 0x5A enviar un 0xCC por el 
    ;puerto 0x12, de lo contrario enviar un 0xFF.
				mov ax,@data 	;Inicializar DS al la direccion
				mov ds,ax     	; del segmento de datos (.DATA)

				call clrscr

				in al,29h           ;entra dato por el puerto 0x29
                
                cmp al,5A           ;comparamos el dato con 5A
                jb @@men            ;si este es mayor salta a @@men
                    mov al,CC       ; en caso de que sea menor se mandara un 0xCC
                    jmp @exit
            @@men: 
                mov al,FF           ;en caso que sea mayor se mandara un 0xFF
            @@exit:
                out 12,al           ;dependiendo del resultado saldra por el puerto 0x12

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
