.MODEL SMALL

.STACK 100H

.DATA
msg1 DB 'Enter String: $' 
msg2 DB 0AH,0DH,'Reversed String using stack: $'
Nl DB 0AH,0DH,'$'

.CODE

MAIN PROC   
    
    MOV AX, DATA
    MOV DS, AX
    
    MOV AH,9
    LEA DX,msg1
    int 21h
    
    MOV CX, 0
    MOV AH, 1
    
    START_INPUT: 
        INT 21H
        CMP AL, 0DH
        JE END_INPUT
        PUSH AX  ; ax=ah al;  tai full ax stack a pathabo
        INC CX
        JMP START_INPUT   
        
    END_INPUT:
                     
    MOV AH, 9
    LEA DX, msg2
    INT 21H
    
    JCXZ EXIT
     
    MOV AH, 2
    
    OUTPUT:
         POP DX
         INT 21H
         LOOP OUTPUT
    
    EXIT:
        
END MAIN
        