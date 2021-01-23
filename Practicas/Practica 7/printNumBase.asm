MODEL small
   .STACK 100h

   ;----- Insert INCLUDE "filename" directives here
   ;----- Insert EQU and = equates here

 INCLUDE procs.inc
 
       LOCALS
		CR EQU 13
		LF EQU 10
		BS EQU 8
   .DATA
		
		cadena db 32 dup(?)
		
	.CODE

    Principal  	PROC
				mov ax,@data 	
				mov ds,ax     	
				call clrscr

				mov dx,0
				mov ax,9ffh; valor en hexadecimal
				mov bx,4 ;BASE
				call printNumBase ;funcion
				
				mov ah,04ch	     
				mov al,0             
				int 21h              

                ENDP

	printNumBase	PROC ;inicio del la funcion
				push ax
				push bx
				push cx
					
					
					mov cl,0  ;contador para el tamaño de la pila
					cmp bx,1
					jle @@final
					
	@@while:		cmp ax,bx ;comparacionmientras el dato sea menor que la base
					jl @@out
					
					div bx
					push dx		;se guarda el valor "residuo" de la division
					mov dx,0
					
					inc cl		;incrementa el contador
					jmp @@while
	
	@@out:			cmp al,10	;compara al con 10, si es menor debe saltar caso contrario se le suma 7
					jb @@print
					add al,7
					
	@@print:		add al,30H 	;se le agrega un 30 en hexadecimal para tener el varlo de "al" al imprimirse
					call putchar;impresion del residuo
					
					cmp cl,0	;compara el contador si es 0 entonces se termina el programa, caso contrario, sigue
					jz @@final	;haciendo pops 
					
					pop ax
					dec cl		;se decrementa el contador por cada pop efectuado
					jmp @@out
	@@final:					;fin de programa
					
				pop cx
				pop bx
				pop ax
				ret
		ENDP	
	
    END
