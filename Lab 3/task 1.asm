
.MODEL SMALL  

.STACK 100H  

.DATA
    ; DEFINE YOUR VARIABLES HERE
    
    msg db "The result is", "$"
    
.CODE
    MAIN PROC
        
        MOV AX, @DATA
        MOV DS, AX
        
        ; YOUR CODE STARTS HERE
        mov ah, 1     ;taking input 1
        int 21h
        
        mov bl, al    ;al-> bl   
        
        ; carriage & line feed
        mov ah,2
        mov dx, 0dh
        int 21h
        mov dx, 0ah
        int 21h

                      ;taking input 2
        mov ah, 1
        int 21h
        
        mov cl, al    ;al-> cl
 
        ; carriage & line feed
        mov ah,2
        mov dx, 0dh
        int 21h
        mov dx, 0ah
        int 21h
        
        lea dx, msg   ;showing msg
        mov ah, 9
        int 21h
        
        ; carriage & line feed
        mov ah,2
        mov dx, 0dh
        int 21h
        mov dx, 0ah
        int 21h
        
        add bl, cl    ;add two number in ascii code i.e: 3(51)+1(49)=4(52)
        sub bl, 48    ;subtract 48 from 100 to convert the actual value 100-48=52-> (4) 
        
        mov dl, bl
        

        
        mov ah, 2
        int 21h
        
          
        
        ; YOUR CODE ENDS HERE
        
        MOV AX, 4C00H
        INT 21H
        
    MAIN ENDP
   
    END MAIN