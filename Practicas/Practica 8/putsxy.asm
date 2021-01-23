;Preciado Gudi#o Guillermina Alejandra
;Practica 6 - Parte 1 - 6
;Organizacion de computadoras y lenguaje ensamblador
;22/11/2020


MODEL   small 
   .STACK 100h

   ;----- Insert INCLUDE "filename" directives here
   ;----- Insert EQU and = equates here

 INCLUDE procs.inc
 
       LOCALS

   .DATA
      mens      db  'Hola',0
	  espo		db	' ',0
	  nl		db	10,0

   .CODE
    ;-----   Insert program, subrutine call, etc., here

    Principal  	PROC
				mov ax,@data 	;Inicializar DS al la direccion
				mov ds,ax     	; del segmento de datos (.DATA)

				call clrscr

				mov bh,11;posicion en y
				mov bl,35;posicion en x
				
				;imprime los saltos de linea necesarios
		@@for:	cmp bh,0
				je	@@for2
					mov dx, offset nl
					call puts
					dec bh
					jmp @@for
				;imprime los espacios necesarios
		@@for2:	cmp bl,0
				je @@imprime
					mov dx, offset espo
					call puts
					dec bl
					jmp @@for2
		
				;imprime la cadena en la ultima posicion de cursor
	@@imprime:	mov dx, offset mens
				call puts

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
