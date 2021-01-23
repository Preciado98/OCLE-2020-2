MODEL small
   .STACK 100h

   ;----- Insert INCLUDE "filename" directives here
   ;----- Insert EQU and = equates here

 INCLUDE procs.inc
 
      LOCALS

   .DATA

      mns_si db 10,13,' Si es un pangrama. ',0
      mns_no db  10,13, ' No es un pangrama. ',0
      newLine db 10,13,0    ;Salto de linea
      i db (?)              ;Variable i
      j db (?)              ;Variable j

   .CODE
    ;-----   Insert program, subrutine call, etc., here

   Principal  PROC
		mov ax,@data 	            ;Inicializar DS al la direccion
		mov ds,ax     	            ; del segmento de datos (.DATA)
            call clrscr                 ;Limpia la pantalla          

            call Pangrama           ;Se llama a la funcion Pangrama

            mov dx, offset newline  ;Se hace un salto de linea
            call puts  

            ;Fin del programa  
            mov ah, 4ch                 
            mov al,0                    
            int 21h                     

   ENDP       

   Pangrama PROC
            mov si,80h           ;Se apunta SI al inicio del argumento
            mov cl,61h           ;Se mueve 61h (a) a CL
            mov dl,41h           ;Se mueve 41h (A) a DL
            mov byte ptr [i],0   ;Se limpia la variable i
            mov byte ptr [j],0   ;Se limpia la variable j
         
      @@pan:
            mov bh,0             ;Se limpia BH
            mov bl,es:[si]       ;BL recibe el caracter que este en SI
            cmp bl,0dh           ;Compara Bl con 0dh (CR), para indicar final de argumento
            je @@letter          ;Si es igual, hace un salto a letter, para capturar una letra e ir a la siguiente letra
            cmp bl,cl            ;Se compara BL con CL, para ver si tienen el mismo caracter
            je @@siguiente       ;Si es igual, hace un salto a siguiente
            cmp bl,dl            ;Se compara BL con DL, para ver si tienen el mismo caracter
            je @@siguiente       ;Si es igual, hace un salto a siguiente
            jmp @@next           ;Se hace un salto incondicional a next
            
      @@letter:
            inc byte ptr [j]     ;Se incrementa el valor de la variable j
            inc cx               ;Se incrementa el valor de CX, para ser la siguiente letra
            inc dx               ;Se incrementa el valor de DX, para ser la siguiente letra
            cmp byte ptr [i],0   ;Se compara el valor de la variable i con 0, para ver si se a encontrado algun caracter valido
            je @@No              ;Si es igual a 0 hace un salto a No, para indicar que no es un pangrama
            cmp byte ptr [j],26  ;Se compara el valor de la variable j con 26, para verificar si se cumplio las 26 letras del abecedario ingles
            je @@YES             ;Si es igual a 26 hace un salto a Yes, para indicar que es un pangrama
            jmp @@inicio         ;Hace un salto incondicional a inicio
      
      @@siguiente:
            inc byte ptr [i]     ;Se incrementa el valor de la variable i

      @@next:
            inc si               ;Se incrementa el valor de SI, para ser la siguiente caracter
            jmp @@pan            ;Se hace un salto incondicional a pan
            
      @@inicio:
            mov byte ptr [i],0   ;Se limpia la variable i
            mov si,80h           ;Se apunta SI al inicio del argumento
            jmp @@pan            ;Se hace un salto incondicional a pan
            
      @@No:
            mov dx, offset mns_no
            call puts
            jmp @@fin            ;Se hace un salto incondicional a fin
            
      @@Yes:
            mov dx, offset mns_si
            call puts 
            jmp @@fin            ;Se hace un salto incondicional a fin

      @@fin:
		ret			   ;Se regresa al programa original
	ENDP

END