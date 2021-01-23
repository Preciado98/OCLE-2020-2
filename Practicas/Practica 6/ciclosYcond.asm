;Preciado Gudi#o Guillermina Alejandra
;Practica 6 - 6-c)
;Organizacion de computadoras y lenguaje ensamblador
;08/11/2020

MODEL   small 
   .STACK 100h

   ;----- Insert INCLUDE "filename" directives here
   ;----- Insert EQU and = equates here

 INCLUDE procs.inc
 
       LOCALS

   .DATA
		nl	db	10,0

   .CODE
    ;-----   Insert program, subrutine call, etc., here

    Principal  	PROC
				mov ax,@data 	;Inicializar DS al la direccion
				mov ds,ax     	; del segmento de datos (.DATA)

				;call clrscr

				mov cl, 0			;i=1
                mov ch, 0       ;j=1

			@@fori:
				; for(i=0;i<7;i++){
				cmp cl,7			;comparamos cl con 7 puesto que 7 es el tama#o de la matriz
				je @@fini			;aunque no llegaremos a 7 por que contando el 0 debemos llegar a 6
				
				@@forj:
					; for(j=0;j<7;j++){
					cmp ch,7			;volvemos a comparar con 7, ya se explico anteriormente
					je @@finj
						; if((i==j)|| (i+j==6)){
						cmp ch,cl		;imprimira un '*' si ch y cl son iguales
							jne @@nxt	; si no son iguales deben cumplir otro requisito por si puede imprimir '*'
							; printf("*");
							jmp @@ast
						@@nxt:
							mov bl,cl		
							add	bl,ch	;sumaremos bl, que tiene el contenido de cl, con ch 
							cmp bl,6	;si estos juntos, suman 6 se imprimira el '*'
							jne @@else	; si no cumple, entonces saltara para imprimir un espacio
						@@ast:
							mov al,'*'
							call putchar
							jmp @@incj
						; }
						; else
						@@else:
							; printf(" ");
							mov al, ' '
							call putchar
						@@incj:
							inc ch
							jmp @@forj
					; }
					@@finj:
					; printf("\n");
						xor ch,ch		;cuando acabe le ciclo del forj, limpiaremos ch por si se vuelve a usar el forj
						mov dx,offset nl	;se hace un salto de linea	
						call puts
						inc cl			;se incrementa cl para ir en el siguiente renglon
						jmp @@fori		;volvemos al inicio
				; }
				@@fini:
				
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
