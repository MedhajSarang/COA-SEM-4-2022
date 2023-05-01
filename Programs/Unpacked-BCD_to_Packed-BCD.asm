.model small
.stack 10h

.data
a db 09h ; Input byte

.code
mov ax, @data ; Initialize data section
mov ds, ax; call unpack to separate the nibbles
mov al, a ; Load number1 in al
mov cl, 04h ; Count to roll by 4 bits
and al, 0f0h ; mask upper nibble
rcr al, cl ; rotate it 4 times to right to make it 09h
mov bh, al ; store result in bh
mov al, a ; Load number1 in al
and al, 0fh ; mask lower nibble
mov bl, al ; store result in bl call pack to combine the nibbles
shl bh, 4 ; Shift left to make room for lower nibble
or bh, bl ; OR in the lower nibble display the packed byte
mov a, bh ; store the packed byte
call disp ; display the byte
mov ah, 4ch ; Terminate program
int 21h ; Display the value in A
disp proc near
mov ch, 2 ; Count of digits to be displayed
mov cl, 4 ; Count to roll by 4 bits
l2:
rol a, cl ; Rotate A left by 4 bits
mov dl, a ; Load DL with data to be displayed
and dl, 0fh ; Mask off all but the lower nibble
cmp dl, 9 ; Check if digit is 0-9 or letter A-F
jbe l4
add dl, 7 ; If letter, add 7 to convert to ASCII code
l4:
add dl, 30h ; Convert to ASCII code
mov ah, 02h ; Function 2 under INT 21H (Display character)
int 21h
dec ch ; Decrement count
jnz l2
mov ah, 02h
mov dl, ' '
int 21h
ret
disp endp
