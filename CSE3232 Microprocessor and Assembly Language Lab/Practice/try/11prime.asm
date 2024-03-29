;ASSEMBLY CODE TO CHECK IF N IS PRIME OR NOT, N<=9

.MODEL SMALL

.STACK 100H

.DATA
 
PRIME_MSG DB 0AH,0DH,'PRIME','$'   
NOT_PRIME_MSG DB 0AH,0DH,'NOT PRIME','$'

.CODE

MAIN PROC  
    
    MOV AX, @DATA
    MOV DS, AX
      
    MOV AH, 1
    INT 21H      
    SUB AL, '0' 
    
    CMP AL, 2
    JE PRINT_PRIME_MSG
    
    CMP AL, 3
    JE PRINT_PRIME_MSG 
    
    CMP AL, 5
    JE PRINT_PRIME_MSG 
    
    CMP AL, 7
    JE PRINT_PRIME_MSG    
    
    LEA DX, NOT_PRIME_MSG
    MOV AH, 9
    INT 21H
    JMP EXIT  
        
    PRINT_PRIME_MSG:
        LEA DX, PRIME_MSG
        MOV AH, 9
        INT 21H

    EXIT:
             
END MAIN 