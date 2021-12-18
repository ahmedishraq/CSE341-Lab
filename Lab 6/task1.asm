
.MODEL SMALL  

.STACK 100H  

.DATA
    s db 12 dup(?)
    ;variables
    a db "Enter name: $"
    b db "Output: $"

.CODE
    MAIN PROC
        
        MOV AX, @DATA
        MOV DS, AX
        
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
        
        ;capital small checking loop with array
        mov cx, 12
        mov si, 0
        mov ah, 2
                
        walk_fast:
            cmp s[si], 41h
            jge capital_cross_check
            
            ;checking space
            cmp s[si], 20h
            je print_rst
            
        capital_cross_check:
            cmp s[si], 54h
            jle cap_letter
            jmp small_cross_check
            
        cap_letter:
            mov s[si], 47h
            jmp print_rst
            
        small_cross_check:
            cmp s[si], 7Ah
            jle small_letter
            
        small_letter:
            mov s[si], 68h
            jmp print_rst
            
        print_rst:
            mov dl, s[si]
            mov ah, 2
            int 21h
            add si, 1
        
        loop walk_fast
        
        ;exit
        exit:
            mov ax, 4c00h
            int 21h
        
        MOV AX, 4C00H
        INT 21H
        
    MAIN ENDP
   
    END MAIN