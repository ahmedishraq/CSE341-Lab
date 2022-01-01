
.MODEL SMALL  

.STACK 100H  

.DATA
    ; DEFINE YOUR VARIABLES HERE
    

.CODE
    MAIN PROC
        
        MOV AX, @DATA
        MOV DS, AX
        
        ; YOUR CODE STARTS HERE
        
        mov dl, 10
        mov bl, 0
        
        scan_digit:
            mov ah, 1h
            int 21h
            
            cmp al, 13  ;if press enter done with taking input
            je exit
            
            mov ah, 0
            sub al, 48  ;ascii to decimal
            
            mov cl, al
            mov al, bl
            
            mul dl
            
            add al, cl
            mov bl, al
            
            jmp scan_digit
            
        exit:
            mov ax, 4c00h
            int 21h
        
        
         
        
        ; YOUR CODE ENDS HERE
        
        MOV AX, 4C00H
        INT 21H
        
    MAIN ENDP
   
    END MAIN