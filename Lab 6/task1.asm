
.MODEL SMALL  

.STACK 100H  

.DATA
    ; DEFINE YOUR VARIABLES HERE
    s db 12 dup(?)
    
    ;variables
    a db "Enter name: $"
    b db "Output: $"

.CODE
    MAIN PROC
        
        MOV AX, @DATA
        MOV DS, AX
        
        ; YOUR CODE STARTS HERE
        
        ;Showing enter name msg
        lea dx, a
        mov ah, 9
        int 21h
        
        ;array indexing 
        mov cx, 12
        mov si, 0
        mov ah, 1
        
        ;taking array input using loop
        walk:
            int 21h
            mov s[si], al
            add si, 1
            loop walk
            
        ;line feed & carraige
        mov ah, 2
        mov dl, 0dh
        int 21h
        mov dl, 0ah
        int 21h
        
        ;showing output msg
        lea dx, b
        mov ah, 9
        int 21h
            
        ;printing the array elements
        mov cx, 12
        mov ah, 2
        mov si, 0
        
        show:
            mov dl, s[si]
            int 21h
            add si, 1
            loop show 
        
         
        
        ; YOUR CODE ENDS HERE
        
        MOV AX, 4C00H
        INT 21H
        
    MAIN ENDP
   
    END MAIN