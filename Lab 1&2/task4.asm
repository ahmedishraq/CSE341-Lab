
.MODEL SMALL  

.STACK 100H  

.DATA
    ; DEFINE YOUR VARIABLES HERE

.CODE
    MAIN PROC
        
        MOV AX, @DATA
        MOV DS, AX
        
        ; YOUR CODE STARTS HERE
        mov al, 5   ;al=5
        mov bl, 2   ;bl=2
        mul bl      ;(5*2)-> al=10
        mov bl, al  ;al -> bl=10
        mov al, 4   ;al=4
        sub al, 0   ;(4-0)-> al=4
        mov cl, 5   ;cl=5
        add cl, 3   ;(5+3)-> cl=8
        add cl, 2   ;(5+3+2)-> cl=10
        add bl, al  ;(5*2)+(4-0)-> bl=14
        add bl, cl  ;(5*2)+(4-0)+(5+3+2)-> bl=24
        mov ax, 6   ;ax=6
        mov dl, 2   ;dl=2
        div dl      ;(6/2)-> al=3 ah=0
        sub bl, al  ;(5*2)+(4-0)+(5+3+2)-(6/2)-> bl=21
         
        
        ; YOUR CODE ENDS HERE
        
        MOV AX, 4C00H
        INT 21H
        
    MAIN ENDP
   
    END MAIN