                                                        
.MODEL SMALL  

.STACK 100H  

.DATA
    ; DEFINE YOUR VARIABLES HERE
    
    pmt1 db "1st input: $"
    pmt2 db "2nd input: $"
    pmt3 db "3rd input: $"
    

.CODE
    MAIN PROC
        
        MOV AX, @DATA
        MOV DS, AX
        
        ; YOUR CODE STARTS HERE
        
        ; promt 1st input message
        lea dx, pmt1
        mov ah, 9
        int 21h
        
        ; taking 1st input
        mov ah, 1
        int 21h
        mov bl,al    ; al->bl
        
        ;carriage & line feed
        mov ah, 2
        mov dl, 0dh
        int 21h
        mov dl, 0ah
        int 21h
        
        ;promt 2nd input message
        lea dx, pmt2
        mov ah, 9
        int 21h
        
        ;taking 2nd input
        mov ah, 1
        int 21h
        mov cl, al    ;al->cl
        
        ;carriage & line feed
        mov ah, 2
        mov dl, 0dh
        int 21h
        mov dl, 0ah
        int 21h
        
        ;promt 3rd input message
        lea dx, pmt3
        mov ah, 9
        int 21h
        
        ;taking 3rd input 
        mov ah, 1
        int 21h
        mov bh, al    ;al->bh
        
        ;carriage & line feed
        mov ah, 2
        mov dl, 0dh
        int 21h
        mov dl, 0ah
        int 21h
        
        ;1st input (a) = bl
        ;2nd input (b) = cl
        ;3rd input (c) = bh
        
        
        
        cmp bl, cl    ;if bl(a) > cl(b)
        jge rst_a_max
        jmp rst_b_max ;else bl(a) < cl(b)   
        
        
        rst_a_max:
            cmp bl, bh   ; if bl(a) > bh(c)
            jge set_a
            jmp set_c    ; else 
        
        
        rst_b_max:
            cmp cl, bh
            jge set_b    ; if cl(b) > bh(c)
            jmp set_c    ; else
            
        
        set_a:
            mov ah, 2
            mov dl, bl   ;output 1st input
            int 21h
            jmp exit
        
        set_b:
            mov ah, 2
            mov dl, cl   ;output 2nd input
            int 21h
            jmp exit
            
        set_c:
            mov ah, 2
            mov dl, bh   ;output 3rd input
            int 21h
            jmp exit
            
        
        exit:
         
        
        ; YOUR CODE ENDS HERE
        
        MOV AX, 4C00H
        INT 21H
        
    MAIN ENDP
   
    END MAIN