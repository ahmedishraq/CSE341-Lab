
.MODEL SMALL  

.STACK 100H  

.DATA
    ; DEFINE YOUR VARIABLES HERE 
    a db 5
    b db 10
    c db 30
    d db 15 

.CODE
    MAIN PROC
        
        MOV AX, @DATA
        MOV DS, AX
        
        ; YOUR CODE STARTS HERE 
          
        mov al, a
        mov bl, b
        mov cl, c
        mov dl, d
        sub cl, al ; cl = C-A
        sub al, cl ; al = A-(C-A)
        add al, dl ; al = A-(C-A)+D
        mov dl, al ; dl = A-(C-A)+D
        
         
        
        ; YOUR CODE ENDS HERE
        
        MOV AX, 4C00H
        INT 21H
        
    MAIN ENDP
   
    END MAIN