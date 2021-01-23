;Preciado Gudi#o Guillermina Alejandra
;Practica 6 - 6-a)
;Organizacion de computadoras y lenguaje ensamblador
;08/11/2020

MODEL   small 
   .STACK 100h

   ;----- Insert INCLUDE "filename" directives here
   ;----- Insert EQU and = equates here

 INCLUDE procs.inc
 
       LOCALS

   .DATA
      g10       db  'Grado 10',0
	  g9       	db  'Grado 9',0
	  g8		db  'Grado 8',0
	  g7		db  'Grado 7',0
	  g6		db  'Grado 6',0
	  g5		db  'Grado 5',0

   .CODE
    ;-----   Insert program, subrutine call, etc., here

    Principal  	PROC
				mov ax,@data 	;Inicializar DS al la direccion
				mov ds,ax     	; del segmento de datos (.DATA)

				call clrscr
				
				mov al,33		; manejando valores en hexadecimal, seria 51 en decimal
				mov bl,6		
				mov cl,33		;58 en hexadecimal = 3A

				;CODIGO EN C 
		; if(a>50&&b<7&&c>56){
            ; printf("Grado 10");
		;Como haremos una comparacion del grado 10, este tiene que cumplir con que este arriba de 50
		;sea menor de 7 y sea mayor a 56, si acaso no cumple alguna de las 3 instrucciones que nos
		;pide salta al else 
			cmp al ,32
				jb @@else
				cmp bl,7
					ja @@else
						cmp cl,38
							jb @@else 
							mov dx, offset g10			;de lo contrario imprimira 
							jmp @@imprimir
				
        ; }else
		;en dado caso que no cumpla con el primero brincara al segundo lo cual debe ser mayor de 50 y
		;menor que 7, en dado caso que no saltara al 2do else
		@@else:
            ; if(a>50&&b<7){
                ; printf("Grado 9");
			cmp al ,32
				jb @@else2
				cmp bl,7
					ja @@else2
					mov dx, offset g9				;de lo contrario imprimira
							jmp @@imprimir
            ; }else
			
			;si no cumple, ahora se comparara con en los demas, respetando la tabla que se impuso en la practica
		@@else2:			
                ; if(b<7&&c>56){
                    ; printf("Grado 8");
			cmp bl,7
				ja @@else3
					cmp cl,38
						jb @@else3
						mov dx, offset g8
						jmp @@imprimir
                ; }else
		@@else3:
                    ; if(a>50&&c>56){
                        ; printf("Grado 7");
			cmp al ,32
				jb @@else4
					cmp cl,38
						jb @@else4 
						mov dx, offset g7
						jmp @@imprimir
                    ; }else 
		@@else4:
                        ; if(a>50||b<7||c>56){
                            ; printf("Grado 6");
			cmp al ,32
				ja @@else5
				cmp bl,7
					jb @@else5
						cmp cl,38
							ja @@else5 
							mov dx, offset g6
							jmp @@imprimir
						; } else 
                            
		@@else5:
							; printf("Grado 5");
			mov dx, offset g6
		@@imprimir:
			call puts
                        

                

				mov ah,04ch	     ; fin de programa
				mov al,0             ;
				int 21h              ; 

                ENDP

; incluir procedimientos	
; ejemplo:
; funcionX PROC ; < -- Indica a TASM el inicio del un procedimiento
;               ; 
;               ; < --- contenido del procedimiento
;           ret
;           ENDP; < -- Indica a TASM el fin del procedimiento



         END
