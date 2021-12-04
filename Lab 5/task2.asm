
.MODEL SMALL  

.STACK 100H  

.DATA
    ; DEFINE YOUR VARIABLES HERE
    a db 0
    b db 2
    c db ?
    sum db ?
    count db 10
    i db 2

.CODE
    MAIN PROC
        
        MOV AX, @DATA
        MOV DS, AX
        
        ; YOUR CODE STARTS HERE
        mov cl, count  ;count->cl
        hack:
            cmp i, cl
            jg result
            mov al, a
            mov bl, b
            mov dl, c
            add al, bl  ;al=al+bl(a+b)
            mov bh, al  ;bh->al
            jmp calc
            
        calc:
            add sum, bh
            mov al, bl  ;a=b
            mov a, al
            mov bl, bh  ;b=c
            mov b, bl
            inc i
            jmp hack
            
        result:
            mov dl, bh
            mov ah, 2
            int 21h  
             
         
        
        ; YOUR CODE ENDS HERE
        
        MOV AX, 4C00H
        INT 21H
        
    MAIN ENDP
   
    END MAIN