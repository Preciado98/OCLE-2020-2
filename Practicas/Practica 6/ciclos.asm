;Preciado Gudi#o Guillermina Alejandra
;Practica 6 - 6-b)
;Organizacion de computadoras y lenguaje ensamblador
;08/11/2020

MODEL   small 
   .STACK 100h

   ;----- Insert INCLUDE "filename" directives here
   ;----- Insert EQU and = equates here

 INCLUDE procs.inc
 
       LOCALS

   .DATA
      nl     db  10,0

   .CODE
    ;-----   Insert program, subrutine call, etc., here

    Principal  	PROC
				mov ax,@data 	;Inicializar DS al la direccion
				mov ds,ax     	; del segmento de datos (.DATA)

				call clrscr

				mov al, 31h			;inicializamos los contadores en 1 (i=1)
                mov bl, 31h       ;inicializamos contador en 1 (j=1)

			@@fori:
				;for(i=1;i<=9;i++){
				cmp byte ptr al,39h		;el primer for contara hasta el 9 el cual es el numero que queremos al final de la piramide
					ja @@fini			;si sobrepasa ese 9, saldra del for
				
			@@forj:
				;	for(j=1;j<=i;j++){
					cmp byte ptr bl,al		;en el 2do for compararemos con el al(i) puesto que queremos que se repita el numero en su valor
						ja @@finj			;si sobrepasa el numero que vale, salimos del ciclo
				;	    printf("%d ",i);
						call putchar		;imprimimos loque hay en al que es lo que nos importa
						inc bl				;incrementamos bl, que es nuestro contador de cuantas veces repetir el numero
				;	}			
						jmp @@forj			;volvemos al 2do for
			@@finj:							;al momento de sobrepasar el contador saltamos a donde haremos un salto de linea	
					mov bl, 31h				;volvemos a inicializar el bl para el 2do for
					inc al					;tambien incrementamos al para ir al siguiente valor
					mov dx,offset nl
					call puts				;hacemos el salto de linea
					jmp @@fori				;volvemoa al 1er for
				;	printf("\n");
			@@fini:
				;}

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
