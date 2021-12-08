
.MODEL SMALL  

.STACK 100H  

.DATA
    ; DEFINE YOUR VARIABLES HERE
    
    tmp dw ?
    sum dw 0 
    subtrct dw ?

.CODE
    MAIN PROC
        
        MOV AX, @DATA
        MOV DS, AX
        
        ; YOUR CODE STARTS HERE
        
        ;1st input
        mov ah, 1
        int 21h
        mov ah, 0h
        mov bx, ax
        sub bx, 30h
        
        ;2nd input
        mov ah, 1
        int 21h
        mov ah, 0h
        sub ax, 30h
        
        mov tmp, ax
        mov cx, ax
        mov bx, 0h
        
        ;multiplication method
        multp:
            cmp bx, ax
            jge multp_rst
            add sum, ax
            inc bx
            jmp multp
            
        multp_rst:
          add sum, 30h
          mov dx, sum
          mov ah, 2
          int 21h   
            
         
        
        ; YOUR CODE ENDS HERE
        
        MOV AX, 4C00H
        INT 21H
        
    MAIN ENDP
   
    END MAIN