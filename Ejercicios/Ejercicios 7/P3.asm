;getsNum

MODEL   small 
   .STACK 100h

   ;----- Insert INCLUDE "filename" directives here
   ;----- Insert EQU and = equates here

 INCLUDE procs.inc
 
       LOCALS

   .DATA
      mens      db  'Ingrese una cadena: ',0
	  cad		db	32 DUP(?)
 
   .CODE
    ;-----   Insert program, subrutine call, etc., here

    Principal  	PROC
				mov ax,@data 	;Inicializar DS al la direccion
				mov ds,ax     	; del segmento de datos (.DATA)

				call clrscr

				mov  dx,offset mens
				call puts

				call gets

				mov ah,04ch	     ; fin de programa
				mov al,0             ;
				int 21h              ; 

                ENDP

 gets		PROC ; < -- Indica a TASM el inicio del un procedimiento
            
			push ax
			push bx
			push si
			
		@@while:
			call getch
			mov byte ptr [bx+si],al
			
			cmp byte ptr[bx+si],0Dh
				jz @@exit
			cmp byte ptr [bx+si],'0'
				jb @@while
			cmp byte ptr [bx+si],'9'
				ja @@while
				
				call putchar
			
			inc si
			jmp @@while
			
		@@exit:
			mov byte ptr [bx+si],0
			
			pop si
			pop bx
			pop ax
							
			ret
			ENDP; < -- Indica a TASM el fin del procedimiento

         END
