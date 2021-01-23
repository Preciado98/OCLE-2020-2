dosseg
	.model small
	.data 
		contador dw 0
	.code
	;public _mcd
	
		mcd		PROC
				push bp
				mov bp,sp

				mov al,[bp+4]
				mov bl,[bp+6]
				
				call mcd22
				call printBase
				
				pop bp
				ret

                ENDP

			mcd22 PROC
		
				cmp bx,0
				je @@fin
				
				div bl
				;je @@fin
					mov cx,ax ;guardar el valor en cx residuo como resultado
					
					mov ax,bx ;cambiar el valor de AL por el de BL
					mov bl,ch ;cambiar el valor de BL, por el residuo de AH que se guarda en CH
					call mcd  ;Recursividad
				
				@@fin:
				 ret
				ENDP
			
			printBase 	PROC

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
						 ; add al,30H  
						 ; call putchar  

						 cmp cl,0   
						 jz @@end_base   

						 pop ax     
						 dec cl 
						 jmp @@nxt

						@@end_base:
						 ret
						 ENDP 

         END




