dosseg
	.model small
	.data 
		contador dw 0
	.code
	public _conjcollatz
	
	
	_conjcollatz PROC
			push bp
			mov bp,sp

			mov ax,[bp+4]
			
			@@while:
				call printBase
				;se guardan los valores para despues regresarlos a su valor original
				push ax
				push dx
				;dl es el caracter que queremos imprimir
				mov dl,' '
				;mov ah,02h ;ah = 02h es la opcion de la interrupcion 21h para imprimir un caracter
				;int 21h ;interrupcion 21h 
				pop dx 
				pop ax
				;retornoar valores originales
				cmp al,1
				je @@fin

				inc contador

				mov dl,al

				mov bl,2
				div bl

				cmp ah,0

				mov ah,0
				mov al,dl
				jne @@impar
			@@par:
				mov bl,2
				div bl
				jmp @@while

			@@impar:
				mov bl,3
				mul bl
				inc al
				jmp @@while
			
		
			@@fin:
			mov ax,contador
	
			pop bp
			ret
		_conjcollatz ENDP

		printBase PROC
     push ax
     push bx
     push cx

     mov bx,10

    cmp bx,1   
    jle @@end_base

     mov dx,00   
     mov cl,0    

   
    @@_divicion:        
    cmp ax,bx   
    jl @@nxt
     div bx     
     push dx    
     mov dx,00  
     inc cl      
     jmp @@_divicion 
    
    @@nxt:
     cmp al,10   
     jb @@_imprimir  
     add al,7
    @@_imprimir:        
     ;add al,30H

     push ax
     push dx
     mov dl,al
     ;mov ah,02h
     ;int 21h
     pop dx
     pop ax

     

     cmp cl,0   
     jz @@end_base    

    
     pop ax     
     dec cl 
     jmp @@nxt

    @@end_base:                  
     pop cx
     pop bx
     pop ax
     ret
     ENDP printBase
		END 