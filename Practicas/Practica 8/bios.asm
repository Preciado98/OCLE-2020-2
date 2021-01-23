;Preciado Gudi#o Guillermina Alejandra
;Practica 6 - Parte 1 - 3
;Organizacion de computadoras y lenguaje ensamblador
;22/11/2020


MODEL   small 
   .STACK 100h

   ;----- Insert INCLUDE "filename" directives here
   ;----- Insert EQU and = equates here

 INCLUDE procs.inc
 
       LOCALS

   .DATA
		mens		db	'Presione cualquier caracter: ',0
		espacio	    db  13,10,0
		mens2		db 	'Caracter capturado y almacenado en AL: ',0

   .CODE
    ;-----   Insert program, subrutine call, etc., here

    Principal  	PROC
				mov ax,@data 	;Inicializar DS al la direccion
				mov ds,ax     	; del segmento de datos (.DATA)

				call clrscr

				;mensaje para pedir y ver que se almaceno
				mov dx,offset mens
				call puts
				
				;Aparece automaticamente el caracter almacenado en AL por BIOS 
				;NO MUESTRA EL CARACTER EN PANTALLA
				mov ah,10h
				int 16h
				call putchar
				
				mov  dx,offset espacio
				call puts
				;comprobacion de que se almaceno
				mov  dx,offset mens2
				call puts
				call putchar


				mov ah,04ch	     ; fin de programa
				mov al,0             ;
				int 21h              ; 

                ENDP



         END
