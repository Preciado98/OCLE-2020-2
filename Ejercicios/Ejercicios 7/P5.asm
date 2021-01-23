;removeChar

MODEL   small 
   .STACK 100h

   ;----- Insert INCLUDE "filename" directives here
   ;----- Insert EQU and = equates here

 INCLUDE procs.inc
 
       LOCALS

   .DATA
      mens      db  'Ingresa cadena: ',0
	  mens2		db	10,'Letra a borrar: ',0
	  mens3		db 	10,10 ,'Cadena corregida: ',0

   .CODE
    ;-----   Insert program, subrutine call, etc., here

    Principal  	PROC
				mov ax,@data 	;Inicializar DS al la direccion
				mov ds,ax     	; del segmento de datos (.DATA)

				call clrscr

				mov  dx,offset mens
				call puts
				call gets
				
				mov  dx,offset mens2
				call puts
				call getchar
				
				mov  dx,offset mens3
				call puts
				call removeChar
				

				mov ah,04ch	     ; fin de programa
				mov al,0             ;
				int 21h              ; 

                ENDP

	removeChar	PROC ; < -- Indica a TASM el inicio del un procedimiento
				push ax
				push bx
				push cx
				push si
				push di
				xor si,si
				
				mov cl,al
				
			@@whl:
				cmp byte ptr[bx+si],0
					jz @@imprime
				cmp byte ptr[bx+si],cl
					jne @@no
					mov di,si
					jmp @@mueve
				@@no:
					inc si
					jmp @@whl
					
			@@mueve:
				cmp byte ptr[bx+di],0
					jz @@whl
				mov byte ptr ch,[bx+di+1]
				mov byte ptr [bx+di],ch 
				jmp @@mueve
					
			@@imprime: 
				mov byte ptr al,[bx+si]
				call putchar
				inc si
				jmp @@whl
					
			@@salir:
				
				pop di
				pop si
				pop cx
				pop bx
				pop ax
				ret
				ENDP; < -- Indica a TASM el fin del procedimiento
				
				
	gets		PROC ; < -- Indica a TASM el inicio del un procedimiento
            
			push ax
			push bx
			push si
			
		@@while:
			call getchar
			mov byte ptr [bx+si],al
			
			cmp byte ptr[bx+si],08h
				jz @@backpace
			cmp byte ptr[bx+si],0Dh
				jz @@exit
			
			inc si
			jmp @@while
			
		@@backpace:
			mov al,' '
			dec si
			mov byte ptr [bx+si],al
			call putchar
			jmp @@while
			
		@@exit:
			mov byte ptr [bx+si],0
			
			pop si
			pop bx
			pop ax
							
			ret
			ENDP; < -- Indica a TASM el fin del procedimiento

         END