
.MODEL SMALL  

.STACK 100H  

.DATA
    ; DEFINE YOUR VARIABLES HERE
    a dw 0  
    i db 0
    msg1 db "Var 1 = $"
    msg2 db "No triangle $"
    

.CODE
    MAIN PROC
        
        MOV AX, @DATA
        MOV DS, AX
        
        ; YOUR CODE STARTS HERE
                           
        lea dx, msg1
        mov ah, 9
        int 21h 
        mov dx, 0
                            ; 

         mov ah, 1h
         int 21h
         
         mov ah, 0
         sub al, 48
         mov bx, ax
         mov a, bx   ; store the msb in a
         
         mov ah, 1h
         int 21h
         
         mov ah, 0
         sub al, 48
         mov cl, al
         
         ;checking even or odd
         mov ax, a
         mov ch, 2
         div ch
         
         cmp ah, 0
         
          ;carriage & line feed
          mov ah, 2
          mov dl, 0dh
          int 21h
          mov dl, 0ah
          int 21h
         
         je even
         jne odd
         
         even:
            
            
            L1:
                mov cl, i
                cmp i, bl
                mov al, 0
                jle L2
                jg exit
                
                L2:
                    cmp al, cl
                    jle p_n_1
                    
                    inc i
                    ;carriage & line feed
                    mov ah, 2
                    mov dl, 0dh
                    int 21h
                    mov dl, 0ah
                    int 21h
                    
                    jg L1
                    
                p_n_1:
                    add al, 49
                    mov dl, al
                    mov ah, 2
                    int 21h
                    sub al, 49
                    add al, 1
                    jmp L2 
            
            jmp exit
             
         odd:
            lea dx, msg2
            mov ah, 9
            int 21h
            mov dx, 0
            
            jmp exit
            
         

        
            
        exit:
            mov ax, 4c00h
            int 21h
        
        
         
        
        ; YOUR CODE ENDS HERE
        
        MOV AX, 4C00H
        INT 21H
        
    MAIN ENDP
   
    END MAIN