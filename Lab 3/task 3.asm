
.MODEL SMALL  

.STACK 100H  

.DATA
    ; DEFINE YOUR VARIABLES HERE
    
    pmt1 db "Enter First Initial: $"
    pmt2 db "Enter Second Initial: $"
    pmt3 db "Enter Third Initial: $"
    pmt4 db "Enter Last Initial: $"

.CODE
    MAIN PROC
        
        MOV AX, @DATA
        MOV DS, AX
        
        ; YOUR CODE STARTS HERE
        
        lea dx, pmt1
        mov ah, 9
        int 21h
        
        mov ah, 1
        int 21h
        mov bh, al    ;al-> bh
        
        ;carriage & line feed
        mov ah, 2
        mov dl, 0dh
        int 21h
        mov dl, 0ah
        int 21h
        
        lea dx, pmt2
        mov ah, 9
        int 21h
        
        mov ah, 1
        int 21h
        mov bl, al    ;al-> bl
        
        ;carriage & line feed
        mov ah, 2
        mov dl, 0dh
        int 21h
        mov dl, 0ah
        int 21h
        
        lea dx, pmt3
        mov ah, 9
        int 21h
        
        mov ah, 1
        int 21h
        mov cl, al    ;al-> cl
        
        ;carriage & line feed
        mov ah, 2
        mov dl, 0dh
        int 21h
        mov dl, 0ah
        int 21h
        
        lea dx, pmt4
        mov ah, 9
        int 21h
        
        mov ah, 1
        int 21h
        mov ch, al    ;al-> ch
        
        
        ; printing part start
        
        ;carriage & line feed
        mov ah, 2
        mov dl, 0dh
        int 21h
        mov dl, 0ah
        int 21h
        
        mov ah, 2
        mov dl, bh
        int 21h
        
        ;carriage & line feed
        mov ah, 2
        mov dl, 0dh
        int 21h
        mov dl, 0ah
        int 21h
        
        mov ah, 2
        mov dl, bl
        int 21h
        
        mov ah, 2
        mov dl, cl
        int 21h
        
        ;carriage & line feed
        mov ah, 2
        mov dl, 0dh
        int 21h
        mov dl, 0ah
        int 21h
        
        mov ah, 2
        mov dl, ch
        int 21h
        
        
         
        
        ; YOUR CODE ENDS HERE
        
        MOV AX, 4C00H
        INT 21H
        
    MAIN ENDP
   
    END MAIN