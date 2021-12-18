
.MODEL SMALL  

.STACK 100H  

.DATA
    
    n db 4 dup(?)
    
    ;variabels
    a db "Enter Four Numbers: $"
    b db "Sum: $"
    sum db 0

.CODE
    MAIN PROC
        
        MOV AX, @DATA
        MOV DS, AX
        
        ;showing enter number msg
        lea dx, a
        mov ah, 9
        int 21h
        
        ;array indexing 
        mov cx, 4
        mov si, 0
        mov ah, 1
        
        ;taking array input using loop
        run:
            int 21h 
            mov n[si], al
            add si, 1
            loop run
            
        ;adding odd numbers from the array
        mov bx, 0
        mov si, 0
        mov ah, 2
        
        
        ;checking odd index
        check_odd:
            cmp bx, 4
            jl add_odd
            jmp print_rst
             
        
        add_odd:
            mov dl, n[si]
            add sum, dl
            add si, 2
            add bx, 2 
            jmp check_odd
            
        
        ;print result
        print_rst:    
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
        
            mov dl, sum
            sub dl, 30h
            mov ah, 2
            int 21h
        
        MOV AX, 4C00H
        INT 21H
        
    MAIN ENDP
   
    END MAIN