;Preciado Gudi#o Guillermina Alejandra
;Ejercicio 6 - 3
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
    ;Programa que lea un dato de 8 bits del puerto 0x80, si el dato es un carácter del abecedario en 
    ;minúscula, enviar una ‘T’ por el puerto 0x92, de lo contrario enviar una ‘F’.
				mov ax,@data 	;Inicializar DS al la direccion
				mov ds,ax     	; del segmento de datos (.DATA)

				call clrscr

                in al,80h           ;entra dato por el puerto 0x80
                
                cmp al,61h          ;comparamos si este es menor que 'a' en hexadecimal
                jb @@no             ;si este llega a ser menor saltara a @@no
                    cmp al,7Ah      ;comparamos si este es mayor que 'z' en hexadecimal
                    ja @@no         ;si es mayor salta a @@no
                    mov al,'T'      ;pero si entra dentro del parametro de 'a' y 'z' se mandara una 'T'
                    @@exit
            @@no:
                mov al,'F'          ;si este no llega a entrar en el parametro se mandara una 'F'
            @@exit:
                out 92,al           ;los cuales dependiendo del resultado saldra por el puerto 0x92
				

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
