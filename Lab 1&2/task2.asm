
.MODEL SMALL  

.STACK 100H  

.DATA
    ; DEFINE YOUR VARIABLES HERE

.CODE
    MAIN PROC
        
        MOV AX, @DATA
        MOV DS, AX
        
        ; YOUR CODE STARTS HERE 
        
        mov ax, 5
        mov bx, 10
        mov cx, 30
        mov dx, 15
        sub cx, ax ; cx = C-A
        sub ax, cx ; ax = A-(C-A)
        add ax, dx ; ax = A-(C-A)+D
        mov dx, ax ; dx = A-(C-A)+D
        
         
        
        ; YOUR CODE ENDS HERE
        
        MOV AX, 4C00H
        INT 21H
        
    MAIN ENDP
   
    END MAIN