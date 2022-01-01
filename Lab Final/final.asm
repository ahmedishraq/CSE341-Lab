
.MODEL SMALL  

.STACK 100H  

.DATA
    ; DEFINE YOUR VARIABLES HERE
    a dw 0
    msg1 db "Var 1 = $"
    msg2 db "Even Number! $"
    msg3 db "Odd Number! $"
    

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
;        mov dl, 10
;        mov bl, 0
;        
;        scan_digit:
;            mov ah, 1h
;            int 21h
;            
;            cmp al, 13  ;if press enter done with taking input
;            je exit
;            
;            mov ah, 0
;            sub al, 48  ;ascii to decimal
;            
;            mov cl, al
;            mov al, bl
;            
;            ;mul dl
;            
;            add al, cl
;            mov bl, al
;            
;            jmp scan_digit  

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
         je print_1
         jne print_2
         
         print_1:
            ;carriage & line feed
            mov ah, 2
            mov dl, 0dh
            int 21h
            mov dl, 0ah
            int 21h 
            
            lea dx, msg2
            mov ah, 9
            int 21h 
            mov dx, 0
            
            jmp exit
             
         print_2:
            ;carriage & line feed
            mov ah, 2
            mov dl, 0dh
            int 21h
            mov dl, 0ah
            int 21h
            
            lea dx, msg3
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