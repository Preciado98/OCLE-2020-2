;Preciado Gudi#o Guillermina Alejandra
;Practica 8 - Parte 2
;Organizacion de computadoras y lenguaje ensamblador
;23/11/2020


MODEL   small 
   .STACK 100h

   ;----- Insert INCLUDE "filename" directives here
   ;----- Insert EQU and = equates here

 INCLUDE procs.inc
 
       LOCALS

   .DATA
		filename	db	'archivo.txt',0
		vec 		db 	50 dup('$')
		handle 		db 	0
		
		opc 		db	'Error',0
		mens		db	'Escribe lo que se grabara en el archivo: ',0
		mens2		db 	'El archivo tiene escrito: ',0
		nl			db	10,0

   .CODE
    ;-----   Insert program, subrutine call, etc., here

    Principal  	PROC
				mov ax,@data 	;Inicializar DS al la direccion
				mov ds,ax     	; del segmento de datos (.DATA)

				call clrscr
				;crear archivo por si no existe 
				call crear
				
				mov dx, offset	mens
				call puts
				call escribe
				
				mov dx, offset	nl
				call puts
				mov dx, offset	mens2
				call puts
				call abre
				
				mov ah,04ch	     ; fin de programa
				mov al,0             ;
				int 21h              ; 

                ENDP
				
				;crear archivo si es que este no existe
	crear		PROC
				push ax
				push cx
				push dx
				
				mov ah,3ch 
				mov cx,0
				mov dx,offset filename 
				int 21h
				jc	@@fail
				jmp @@salir
				
				;en caso de que no se cree correctamente mostrara el mensaje de error
		@@fail:
				mov dx,offset opc
				call puts
		@@salir:
		
				pop dx
				pop cx
				pop ax
				ret
				ENDP
				
				
				;escribe en el archivo existente
	escribe 	PROC
				push ax
				push bx
				push cx
				push dx
				push si
			
			;guarda en una cadena vacia, lo que queremos que escriba en el archivo
			@@escribe:
				mov ah,01h
				int 21h
				mov vec[si],al
				inc si
				cmp al,0dh
				ja @@escribe
				jb @@escribe

			@@edita:
				;abrir el archivo
				mov ah,3dh
				mov al,1h ;Abrimos el archivo en solo escritura.
				mov dx,offset filename
				int 21h
				jc @@fail ;Si hubo error

				;Escritura de archivo
				mov bx,ax 
				mov cx,si ;num de caracteres a grabar
				mov dx,offset vec
				mov ah,40h
				int 21h
				jmp @@salir
				
				;si hay error al abrir el archivo, mostrara mensaje
			@@fail:
				mov dx,offset opc
				call puts
				
			@@salir:
				call cierra
			
				pop si
				pop dx
				pop cx
				pop bx
				pop ax
				ret
				ENDP
				
				;abre el archivo solo para leerlo
		abre	PROC
				push ax
				push dx
				
				mov	ax,3D02h
				mov	dx,offset filename
				int	21h
				jc	@@fail
				call lee
				call cierra
				jmp @@salir
			@@fail:
				mov dx,offset opc
				call puts
			@@salir:
				pop dx
				pop ax
				ret
				ENDP
				
		;lectura del archivo
		lee 	PROC
				push ax
				push bx
				push cx
				push dx
				
				mov ah,3fh
				mov bx,ax
				mov cx,10
				mov dx,offset vec
				int 21h
				mov ah,09h
				int 21h
				
				pop dx
				pop cx
				pop bx
				pop ax
				ret
				ENDP
				
		cierra	PROC
				push ax
				push bx
				
				mov ah,3eh ;cierra el archivo
				int 21h
				
				pop bx
				pop ax
				ret
				ENDP
		

         END