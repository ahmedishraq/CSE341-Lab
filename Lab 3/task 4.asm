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
        
        ; carriage & line feed
        mov ah, 2
        mov dx, 0dh
        int 21h
        mov dx, 0ah
        int 21h
        
        lea dx, pmt3
        mov ah, 9
        int 21h
        
        
        sub bh, 11h
        sub bl, 11h
        sub bh, bl
        add bh, 48
        
        
        mov dl, bh
        mov ah, 2
        int 21h 
         
        
        ; YOUR CODE ENDS HERE
        
        MOV AX, 4C00H
        INT 21H
        
    MAIN ENDP
   
    END MAIN