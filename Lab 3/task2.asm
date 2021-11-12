
.MODEL SMALL  

.STACK 100H  

.DATA
    ; DEFINE YOUR VARIABLES HERE

.CODE
    MAIN PROC
        
        MOV AX, @DATA
        MOV DS, AX
        
        ; YOUR CODE STARTS HERE
        
        mov ah, 1      ;taking input
        int 21h
        mov bl, al
        
        ;carriage & line feed
        mov ah, 2
        mov dx, 0dh
        int 21h
        mov dx, 0ah
        int 21h
        
        mov al, 32     ;subtract 32 to make the character capital
        sub bl, al
        
        mov dl, bl
        int 21h
        
         
        
        ; YOUR CODE ENDS HERE
        
        MOV AX, 4C00H
        INT 21H
        
    MAIN ENDP
   
    END MAIN