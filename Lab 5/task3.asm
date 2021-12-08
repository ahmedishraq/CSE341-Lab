
.MODEL SMALL  

.STACK 100H  

.DATA
    ; DEFINE YOUR VARIABLES HERE
    
    sum dw 0 
    msg db "Press 1 for Division or Press 2 for Multiplication: $"
    msg1 db "Multiplication Result: $"
    msg2 db "Final Remainder: $"

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
        mov cx, ax
        
        ;line feed & carriage
        mov ah,2
        mov dx, 0dh
        int 21h
        mov dx, 0ah
        int 21h
        
        ;option chossing msg
        lea dx, msg
        mov ah, 9
        int 21h
        
        
        ;choose option for function
        mov ah, 1
        int 21h 
        mov ah, 0h
        
        check:
            cmp ax, 31h
            je div_value
            cmp ax, 32h
            je mul_value
            
        ;value transfer for mul
        mul_value:
            mov ax, cx
            mov cx, 0h
            jmp multp
            
        ;value transfer for div
        div_value:
            mov ax, cx
            mov cx, 0h
            jmp divd
        
        
        ;multiplication method
        multp:
            cmp cx, bx
            jge multp_rst
            add sum, ax
            inc cx
            jmp multp
            
        multp_rst:
            ;line feed & carriage
            mov ah,2
            mov dx, 0dh
            int 21h
            mov dx, 0ah
            int 21h
          
            ;result msg
            lea dx, msg1
            mov ah, 9
            int 21h
          
            ;result calculation  
            add sum, 30h
            mov dx, sum
            mov ah, 2
            int 21h
            jmp exit
          
        ;division method
        divd:
            sub bx, ax
            cmp bx, cx
            je divd_rst
            cmp bx, ax
            jl divd_rst
            jmp divd
            
        divd_rst:
            ;line feed & carriage
            mov ah,2
            mov dx, 0dh
            int 21h
            mov dx, 0ah
            int 21h
          
            ;result msg
            lea dx, msg2
            mov ah, 9
            int 21h
            
            ;result calculation
            add bx, 30h
            mov dx, bx
            mov ah, 2
            int 21h
            jmp exit
            
        exit:
            mov ax, 4c00h
            int 21h
        
        ; YOUR CODE ENDS HERE
        
        MOV AX, 4C00H
        INT 21H
        
    MAIN ENDP
   
    END MAIN