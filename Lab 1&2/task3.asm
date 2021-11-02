                    
.MODEL SMALL  

.STACK 100H  

.DATA
    ; DEFINE YOUR VARIABLES HERE
    x db 10
    y db 1
    z db 3
    w db 5

.CODE
    MAIN PROC
        
        MOV AX, @DATA
        MOV DS, AX
        
        ; YOUR CODE STARTS HERE
        
        mov al, x  ;x-> al=10
        mov bl, z  ;z-> bl=3
        mul bl     ;(x*z)-> ax=30
        mov cx, ax ;ax -> cx=30
        mov al, y  ;y-> al=1 
        mov bl, w  ;w-> bl=5
        mul bl     ;(y*w)-> ax=5
        mov dl, al ;al -> dl=5
        mov ax, cx ;cx -> ax=30
        div dl     ;(x*z)/(y*w)-> al=6
        mov bl, al ;al -> bl=6 
        mov al, z  ;z-> al=3
        mov dl, x  ;x-> dl=10
        mul dl     ;(z*x)-> ax=30
        mov cl, al ;al -> cl=30
        mov al, bl ;bl-> al=6
        div cl     ;al=0, ah=6 
        
        
        
         
        
        ; YOUR CODE ENDS HERE
        
        MOV AX, 4C00H
        INT 21H
        
    MAIN ENDP
   
    END MAIN