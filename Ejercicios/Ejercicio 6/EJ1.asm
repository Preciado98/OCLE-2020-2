;Preciado Gudi#o Guillermina Alejandra
;Ejercicio 6 - 1
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

    ;Programa que lee un dato de 8 bits del puerto 0x3AB7, si el dato tiene desactivados los bits 0, 3 y 5,
    ;enviar el dato por el puerto 0x92, de lo contrario enviarlo por el puerto 0x9A

				mov ax,@data 	;Inicializar DS al la direccion
				mov ds,ax     	; del segmento de datos (.DATA)

				call clrscr

				in al, 3AB7h        ;entra el dato por el puerto 0x3AB7
                
                mov bl,al           ;copiamos el dato que esta en al para no modificarlo
                and bl,D6           ;con el and verificaremos los bits desactivados

                cmp al,bl           ;compararemos los datos
                    jz @@yes        ;salto si estos son iguales (con los bits desactivados)
                    out 9A,al       ;en caso contrario se manda el dato que se ingreso por puerto 0x9A
                    jmp @@exit
            
            @@yes: 
                out 92,al           ;en caso de que los bits que se pidieron esten desactivados, 
                                    ;entonces mandamos el dato por el puerto 0x92
            @exit:
                
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
