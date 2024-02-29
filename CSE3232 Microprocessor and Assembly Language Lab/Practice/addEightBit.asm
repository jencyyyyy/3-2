.model small
.stack 100h
.data
    num1 db 12h ; first 8-bit number
    num2 db 34h ; second 8-bit number

.code
main proc    
    mov ax,@data ; get data segment
    
    ; Load the two numbers into registers AL and BL
    mov al, num1
    mov bl, num2

    ; Add the two numbers and store the result in AL
    add al, bl     
    
    lea dx,al   ;load effective address
    mov ah,9h    ; string output
    int 21h
    
    
 
main endp
end main
