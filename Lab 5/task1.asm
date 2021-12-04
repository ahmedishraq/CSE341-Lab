
.MODEL SMALL  

.STACK 100H  

.DATA
    ; DEFINE YOUR VARIABLES HERE
    a db ?
    b db ?
    i db ?
    x db 5
    sum db 0

.CODE
    MAIN PROC
        
        MOV AX, @DATA
        MOV DS, AX
        
        ; YOUR CODE STARTS HERE
        ; 1st input
        mov ah, 1
        int 21h
        
        sub al, 30h
        mov a, al   ;al->a (1st input)
        mov i, al
        
        ; 2nd input
        mov ah, 1
        int 21h
        
        sub al, 30h
        mov b, al   ;al->b (2nd input)
        
        ;line break
        mov ah, 2      
        mov dl, 0dh    
        int 21h       
        mov dl, 0ah    
        int 21h
        
        mov cl, b
        
        hack:
            cmp i, cl
            jg result
            mov al, i  ;al->i
            mov ah, 0h ;ah (remainder initialize with 0)
            div x
            mov ch, ah ;ah->ch
            
            ;if remaider is 0 ?
            cmp ch, 0
            je total
            inc i
            jmp hack 
            
        
        total:
            mov bh, sum
            add bh, i
            mov sum, bh
            inc i
            jmp hack
            
            
            
            
        result:
            ;line break
            mov ah, 2      
            mov dl, 0dh    
            int 21h       
            mov dl, 0ah    
            int 21h
            mov dl, sum
            add dl, 30h
            mov ah, 2
            int 21h
            
         
         
        
        ; YOUR CODE ENDS HERE
        
        MOV AX, 4C00H
        INT 21H
        
    MAIN ENDP
   
    END MAIN