
.MODEL SMALL  

.STACK 100H  

.DATA
    ; DEFINE YOUR VARIABLES HERE
    
    arr db 5 dup(?)
    
    ;variables
    a db "Enter 5 numbers: $"
    b db "Sorted order array: $"

.CODE
    MAIN PROC
        
        MOV AX, @DATA
        MOV DS, AX
        
        ; YOUR CODE STARTS HERE
        
        ;enter numbers msg
        lea dx, a
        mov ah, 9
        int 21h
        
        mov cx, 5
        mov si, 0
        mov ah, 1
        
        ;loop
        crawl:
            int 21h 
            mov arr[si], al
            add si, 1
            loop crawl
            
            ;sorting process begins
            mov dl, 0
            crawl_1:
                cmp dl, 3
                jg dead
            
                mov cx, 4
                mov si, 0
                mov di, 1
            
                crawl_2:
                    mov al, arr[si]
                    mov bl, arr[di]
                    cmp al, bl
                    jg interchange
            
                    jmp not_imp
            
                    interchange:
                        mov arr[si], bl
                        mov arr[di], al
                
                    not_imp:
                        add si, 1
                        add di, 1
                
                loop crawl_2
                
                add dl, 1
                
            jmp crawl_1
            
            dead:
            
            ;print the sorted array
            mov ah, 2
            mov dl, 0dh
            int 21h
            mov dl, 0ah
            int 21h
            
            lea dx, b
            mov ah, 9
            int 21h
            
            mov cx, 5
            mov si, 0
            mov ah, 2
            
            print_rst:
                mov dl, arr[si]
                int 21h
                add si, 1
                loop print_rst  
            
        
         
        
        ; YOUR CODE ENDS HERE
        
        MOV AX, 4C00H
        INT 21H
        
    MAIN ENDP
   
    END MAIN