.MODEL SMALL

.STACK 100H

.DATA

.CODE

MAIN PROC  
    MOV AH, 01H
    INT 21H      
    AND AL,0FH     
    
    MOV CL,AL
    MOV BL,0
    
    SUM_LOOP: 
        ADD BL,CL
        DEC CL
        CMP CL,0
        JG SUM_LOOP 
        
   
    MOV DX,[BL]        
    MOV AH, 0CH
   ; MOV DL,BL
    INT 21h
    
    
    
END MAIN    