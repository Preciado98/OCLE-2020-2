;Preciado Gudi#o Guillermina Alejandra
;Practica 6 - 5/c)
;Organizacion de computadoras y lenguaje ensamblador
;05/11/2020

MODEL   small   
   .STACK 100h

   ;----- Insert INCLUDE "filename" directives here
   ;----- Insert EQU and = equates here

 INCLUDE procs.inc
 
       LOCALS

   .DATA
      mens      db  'La letra es a! :D',0
      mens2     db  'La letra es b! :D',0
      mens3     db  'La letra es c! :D',0
      mens4     db  'La letra no es a,b,c! :D',0

   .CODE
    ;-----   Insert program, subrutine call, etc., here

    Principal  	PROC
				mov ax,@data 	;Inicializar DS al la direccion
				mov ds,ax     	; del segmento de datos (.DATA)
                
                ;En este caso es un CASE OF, lo cual significa que habra varias 
                ;opciones, por lo cual en el ejemplo solo buscaremos la letra a, b o c 
                ;y si no saldra un mensaje
		call clrscr

		mov al,'z'			;aqui ponemos un valor aleatorio en al (switch(al))
                
                cmp al, 'a'			;iniciamos con las comparaciones para saber que letra se identifica(case 1:)
                jne @@of			;en dado caso que no, saltara al siguiente case
                    mov  dx,offset mens		;si no imprimira 
                    call puts
                    jmp @@exit			;y se saldra automaticamente de la secuencia
            @@of:				
                cmp al,'b'			;repite lo mismo que se explico antes(case 2)
                    jne @@of1
                    mov  dx,offset mens2
                    call puts
                    jmp @@exit
            @@of1:
                cmp al,'c'			;(case 3)
                jne @@default
                    mov  dx,offset mens3
                    call puts
                    jmp @@exit
            @@default:				;en dado caso que no cumpla, imprimira un mensaje diferente(default)
                mov  dx,offset mens4
                call puts
            
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
