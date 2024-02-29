.model small
.stack 100H
.data
    nl db 0ah, 0dh,'$'
.code 
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,1
    int 21h
    
    mov bl,al
    
    mov ah,9
    lea dx,nl
    int 21h
    
    mov ah,2
    mov dl,bl
    int 21h  
    
    
    
    mov ah,4ch
    int 21h
    main endp
    
end main
