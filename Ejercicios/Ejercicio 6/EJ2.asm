;Preciado Gudi#o Guillermina Alejandra
;Ejercicio 6 - 2
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
    ;Programa que lee un dato de 16 bits del puerto 0x5AF3, si el dato tiene activos los bits 0, 6, 8 y 15, 
    ;invertir los bits 4, 7 y 9 del dato y enviarlo por el puerto 0x92; de lo contrario activar los bits 2 y 3 y 
    ;enviarlo por el puerto 0x89.
				mov ax,@data 	;Inicializar DS al la direccion
				mov ds,ax     	; del segmento de datos (.DATA)

				call clrscr
				
                in ax,5AF3h             ;entra dato del puerto 5AF3h
                mov bx, ax              ;copiamos el dato para no modificarlo
                and bx, 8141            ; hacemos un and con los datos para verificar los estados de los bits que buscamos
                cmp bx,8141             ;comparamos el resultado con el mismo dato que pediamos
                jz @@yes    
                    or ax,000C          ;en caso de que no esten activos los bits que pedimos en se hace un or para invertir bits   
                    out 89,ax           ;el resultado saldra por el puerto 0x89
                    @@exit
                     
            @@yes:
                xor ax,290              ;en caso de que si esten activos, haremos un xor para activar bits
                out 92,ax               ;y saldra por el puerto 0x92
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
