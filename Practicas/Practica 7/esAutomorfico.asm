MODEL small
   .STACK 100h

   ;----- Insert INCLUDE "filename" directives here
   ;----- Insert EQU and = equates here

 INCLUDE procs.inc
 
       LOCALS

   .DATA
   
		num	db '5',0

   .CODE
    ;-----   Insert program, subrutine call, etc., here

    Principal  	PROC
				mov ax,@data 	;Inicializar DS al la direccion
				mov ds,ax     	; del segmento de datos (.DATA)
				call clrscr

				lea  dx, num
				call atoi
				
				mov bx,10
				call printNumBase
				
				call Auto

				mov ah,04ch	     ; fin de programa
				mov al,0             ;
				int 21h              ; 

                ENDP
;--------------------------------------------------
;if((pow(n, 2) % 10) == n)		
	Auto		PROC
				push ax
				push bx
				
				mov bx,ax
				mov cx,10
				;if
				mul ax
				div cx
				cmp ax,bx
				jne @@no
					mov ax, '1'
					jmp @@fin
			@@no:
				mov ax,'0'
			@@fin:
				call puts
				
				pop bx
				pop ax
		
				ENDP
				
;-------------------------------------------------				
	atoi		PROC
				push di
				push bx
				push cx
								

				mov ax,0
				mov cx,0
				mov di,10

	@@repeat:   cmp byte ptr[bx],0
				jz @@out
				mul di
				mov cl,[bx]
				sub cx,48
				add ax,cx
				mov cx,0
				
				inc bx
				jmp @@repeat

	@@out:				
				pop cx
				pop bx
				pop di
				
				ret
				ENDP
	
;------------------------------------------------------------	
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
					
	@@print:		;add al,30H 	;se le agrega un 30 en hexadecimal para tener el varlo de "al" al imprimirse
					;call putchar;impresion del residuo
					
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
