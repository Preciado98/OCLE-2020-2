.MODEL   small 
   .STACK 100h

   ;----- Insert INCLUDE "filename" directives here
   ;----- Insert EQU and = equates here

 INCLUDE procs.inc
 
       LOCALS

   .DATA
      mens      db  'Si es pangrama',0
	  mens_n	db	'No es pangrama',0

   .CODE
    ;-----   Insert program, subrutine call, etc., here

    Principal  	PROC
				mov ax,@data 	;Inicializar DS al la direccion
				mov ds,ax     	; del segmento de datos (.DATA)

				;primero hare la cadena en mayuscula para no estar intercambiando entre mayusculas y minusculas
				call toUpperCase
				call pangrama
				


				mov ah,04ch	     ; fin de programa
				mov al,0             ;
				int 21h              ; 

                ENDP
				
	toUpperCase	PROC ; < -- Indica a TASM el inicio del un procedimiento
				
				mov cx,80h 	;cantidad de argumentos en la cadena
				mov si,81h	;al inicio de argumentos
				
		@@whl:	cmp byte ptr es:[si],0
					jz @@salir
				cmp byte ptr es:[si],61h ;compara si no esta entre la 'a'
					jb @@no
				cmp byte ptr es:[si],7Ah	;o entre la 'z'
					ja @@no
				
				sub byte ptr es:[si],20h	;si esta entre las minusculas, restamos para que sean mayusculas
			@@no:	;como no esta entre las minusculas pasamos a la siguiente letra
				inc si
				loop @@whl
			
			@@salir:
				
				ret
				ENDP
				
	pangrama	PROC
				xor bx,bx	;limpiamos bx, el cual usaremos para comprobrar si son las 26 letras del alfabeto
				mov cx,80h	;tama#o de nuestra cadena
				mov al,41h	;inicializamos en A para ver si esta en la cadena
		
		@@nxt:	mov dx,80h	; cada que vuelva inicializara para ver si la cadena tiene esta letra
				
			@@nxt2: mov si,81h
					cmp byte ptr es:[si],20h ;omitimos directamente los espacios
						je @@no
					cmp byte ptr es:[si],al ;comparamos si esta a letra
						jne @@no
						
						inc bx;si esta incrementamos el contador
						mov dx,0; directamente le ponemos 0 para salirnos del ciclo y seguir con la siguiente letra en a encontrar
					@@no:
						inc si	;en dado caso que no, cambiamos de letra en la cadena
						dec dx ; decrementamos dx para no dar vueltas de mas en la cadena
					cmp dx,0
						jne	@@nxt2; si nos acabamos la palabra entonces volvemos al primer for
				inc al;incrementamos para buscar la siguiente letra
				loop @@nxt
				
			cmp bx,26;comparamos si juntamos las 26 letras
				jne @@no2
				
				mov dx, offset mens;si es asi, lanza un mensaje que logro hacerse el pangrama
				call puts
				jmp @@exit
			@@no2:
				mov dx, offset mens_n;si no, dice que no se hizo el pangrama
				call puts
			@@exit:
				ret
				ENDP
				
; incluir procedimientos	
; ejemplo:
; funcionX PROC ; < -- Indica a TASM el inicio del un procedimiento
;               ; 
;               ; < --- contenido del procedimiento
;           ret
;           ENDP; < -- Indica a TASM el fin del procedimiento



         END
