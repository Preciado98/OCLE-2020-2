MODEL   small 
   .STACK 100h

   ;----- Insert INCLUDE "filename" directives here
   ;----- Insert EQU and = equates here

 INCLUDE procs.inc
 
       LOCALS

   .DATA
		mens_directo		db	13,10,'Desplegado de caracter en forma directa: ',0
		mens_DOS			db	13,10,'Desplegado de caracter usando DOS: ',0
		mens_BIOS			db	13,10,'Desplegado de caracter usando BIOS: ',0

   .CODE
    ;-----   Insert program, subrutine call, etc., here

    Principal  	PROC
				mov ax,@data 	;Inicializar DS al la direccion
				mov ds,ax     	; del segmento de datos (.DATA)

				call clrscr

				mov dx, offset mens_directo
				call puts
				mov ax,'X'
				mov bl, 41
				mov bl,0
				call putcharxy
				
				mov dx, offset mens_DOS
				call puts
				mov dl,'Y'
				mov ah,2
				int 21h
				
				mov dx, offset mens_BIOS
				call puts
				mov al,'Z'
				mov ah,0Ah
				mov bx,0
				mov cx,1
				int 10h

				call getch

				mov ah,04ch	     ; fin de programa
				mov al,0             ;
				int 21h              ; 

                ENDP
		
	putcharxy	PROC
				push ax
				push bx
				push cx
				push dx
				push ds
				
				mov dx,ax
				mov ax, 0b800h
				mov dx,ax
				mov cl,160
				mov al, bl
				mul cl
				mov bl,bh
				mov bh,0
				shl bx,1
				add bx,ax
				mov [bx],dl
				
				pop ds
				pop dx
				pop cx
				pop bx
				pop ax
				ENDP



         END
