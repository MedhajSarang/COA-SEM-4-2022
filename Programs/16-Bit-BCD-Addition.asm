.model small
.data
a dw 3629H
b dw 4738H
.code
mov ax, @data ; Initialize the data section 
mov ds, ax
mov ax, a ; Load number1 into ax 
mov bx, b ; Load number2 into bx
add al, bl; add lower two digit result in al
daa ; adjust result in valid bcd 
mov bl, al ; store the result in bl 
adc ah, bh ; add upper two digit result in ah 
mov al, ah; al=ah as daa works on al only 
daa ; adjust result to valid bcd 
mov bh, al; store the result in bh 
mov ch, 04h ; Count of digits to be displayed 
mov cl, 04h ; Count to roll by 4 bits cl, 04h
l2:rol bx, cl ; roll bl so that msb comes to lsb 
mov dl, bl ; load dl with data to be displayed 
and dl, 0fH ; get only lsb dl, 0fH 
cmp dl, 09 ; check if digit is 0-9 or letter A-F 
jbe l4
add dl, 07 ; if letter add 37H orelse only add 
l4: add dl, 30H 
mov ah, 02 ; Function 2 under INT 21H (Display character)
int 21H
dec ch ; Decrement Count 
jnz l2
mov ah, 4cH ;Terminate Program
int 21H
end
