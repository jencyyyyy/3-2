.model small
.stack 100h

.data  
put db 3
m db 'Hello World$' 
y db ?

.code
main proc
    mov ax,@data
    mov ds,ax
    
    MOV DL,'A'
    MOV AH,02H
    INT 21H       
    
    MOV AH,2
    MOV DL,0AH
    INT 21H
    
    MOV AH,9
    LEA DX,m
    INT 21H
    
   
    mov dl,0ah;
    int 21h 
        
    mov ah,1
    int 21h
           
    mov y,al
    
    mov ah,2
    mov dl,0ah
    int 21h    
    
    mov ah,2
    mov dl,y
    int 21h
        
    mov ah,2
    mov dl,0ah
    int 21h
    
    add put,30h
    mov ah,2
    mov dl,put
    int 21h
     
    
    mov ah,4ch
    int 21h
    
    
    main endp
end main
