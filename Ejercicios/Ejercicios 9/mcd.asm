MODEL   small 
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
				mov ax,@data 	;Inicializar DS al la direccion
^
				call clrscr

				mov al,78
				mov bl,36
				
				call mcd
				
				call putchar

				mov ah,04ch	     ; fin de programa
				mov al,0             ;
				int 21h              ; 

                ENDP

			mcd	PROC
				push ax
				push bx
				
				cmp bl,0
				je	@@exit
					div bl
					xor al,al
					xchg al,ah
					xchg al,bl
					call mcd
					
		; int mcd(int a, int b) {
			; if(b == 0) return a;
			; return mcd(b, a%b);
		; }
			@@exit:
				pop bx
				pop ax
				ret 
				ENDP

         END




