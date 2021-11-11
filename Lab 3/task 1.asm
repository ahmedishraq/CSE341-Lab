
.MODEL SMALL  

.STACK 100H  

.DATA
    ; DEFINE YOUR VARIABLES HERE
    
    msg db "The result is$"
    
.CODE
    MAIN PROC
        
        MOV AX, @DATA
        MOV DS, AX
        
        ; YOUR CODE STARTS HERE
        
        ; taking input 1
        mov ah, 1
        int 21h
        mov bl, al; al-> bl=6
        
        ; taking input 2
        mov ah, 1
        int 21h
        
        ; add two inputs
        add al, bl; 6+5=11 al=11
        
        
        ;Print the msg
        lea cx, msg
        mov ah, 9
        int 21h
        
        ;creating carriage return and line feed
        mov ah, 2
        mov dl, 0dh
        int 21h
        mov dl, 0ah
        int 21h
        
        mov dl, al ; dl-> al dl=11
        mov ah,2
        int 21h
        
          
        
        ; YOUR CODE ENDS HERE
        
        MOV AX, 4C00H
        INT 21H
        
    MAIN ENDP
   
    END MAIN