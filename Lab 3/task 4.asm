
.MODEL SMALL  

.STACK 100H  

.DATA
    ; DEFINE YOUR VARIABLES HERE
    
    pmt1 db "ENTER FIRST HEX DIGIT: $"
    pmt2 db "ENTER SECOND HEX DIGIT: $"
    pmt3 db "IN DECIMAL SUBTRACTION IS: $"

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
        mov bh, al
        sub bh, 31h
        
        ; carriage & line feed
        mov ah, 2
        mov dx, 0dh
        int 21h
        mov dx, 0ah
        int 21h
        
        lea dx, pmt2
        mov ah, 9
        int 21h
        
        mov ah, 1
        int 21h
        mov bl, al
        sub bl, 31h
        
        ; carriage & line feed
        mov ah, 2
        mov dx, 0dh
        int 21h
        mov dx, 0ah
        int 21h
        
        lea dx, pmt3
        mov ah, 9
        int 21h
        
        ;testing
         sub bh, bl
         mov dl, bh
         mov ah, 2
         int 21h
        
        ;first decimal digit
        ;mov ah, 2
        ;mov dl, 31h
        ;int 21h
        
        ;mov ah, 2
        ;sub bh, 11h
        ;mov dl, bh
        ;int 21h 
         
        
        ; YOUR CODE ENDS HERE
        
        MOV AX, 4C00H
        INT 21H
        
    MAIN ENDP
   
    END MAIN