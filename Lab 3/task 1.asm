
.MODEL SMALL  

.STACK 100H  

.DATA
    ; DEFINE YOUR VARIABLES HERE
    
    msg db "The result is", "$"
    
.CODE
    MAIN PROC
        
        MOV AX, @DATA
        MOV DS, AX
        
        ; YOUR CODE STARTS HERE
        mov ah, 1
        int 21h
        
        mov bl, al
        
        ; carriage & line feed
        mov ah,2
        mov dx, 0dh
        int 21h
        mov dx, 0ah
        int 21h

        
        mov ah, 1
        int 21h
        
        mov cl, al
 
        ; carriage & line feed
        mov ah,2
        mov dx, 0dh
        int 21h
        mov dx, 0ah
        int 21h
        
        lea dx, msg
        mov ah, 9
        int 21h
        
        ; carriage & line feed
        mov ah,2
        mov dx, 0dh
        int 21h
        mov dx, 0ah
        int 21h
        
        add bl, cl
        sub bl, 48
        
        mov dl, bl
        

        
        mov ah, 2
        int 21h
        
          
        
        ; YOUR CODE ENDS HERE
        
        MOV AX, 4C00H
        INT 21H
        
    MAIN ENDP
   
    END MAIN