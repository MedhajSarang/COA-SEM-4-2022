.model small
.stack 100h
.data ; the string to that is to be printed
string db 'madam','$'
string1 db 'String is palindrome','$'
string2 db 'String is not palindrome','$'
.code
main proc far
mov ax, @data
mov ds, ax ; check if the string is palindrome or not 
call palindrome
mov ah, 4ch ; interrupt to exit
int 21h
main endp
palindrome proc ; load the starting address of the string 
mov si, offset string ; traverse to the end of the string 
loop1:
mov ax, [si]
cmp al, '$'
je label1
inc si
jmp loop1 ; load the starting address of the string 
label1 :
mov di, offset string
dec si ; check if the string is palindrome or not 
loop2:
cmp si, di
jl output1
mov ax, [si]
mov bx, [di]
cmp al, bl
jne output2
dec si
inc di
jmp loop2
output1: ; load address of the string 
lea dx, string1 ; output the string that is loaded in dx
mov ah, 09h
int 21h
ret
output2: ; load address of the string 
lea dx, string2 ; output the string loaded in dx 
mov ah, 09h
int 21h
ret
palindrome endp
end main
