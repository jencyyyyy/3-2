.model small
.stack 100h
.data 
a db 'enter 1st: $'
b db 0ah,0dh,'enter 2nd: $'
c db 0ah,0dh,'add $'

.code
main proc
     mov ax, @data
     mov ds,ax
     
     
     mov ah,9h
     lea dx,a
     int 21h
     
     
     mov ah,1
     int 21h 
     
     mov bl,al
     
     mov ah,9
     lea dx,b
     int 21h
     
     mov ah,1
     int 21h
     
     add bl,al
     sub bl,30h
     
     mov ah,9
     lea dx,c
     int 21h
     
     mov ah,2
     mov dl,bl
     int 21h
     
     mov ah,4ch
     int 21h
     
     main endp

end main
     