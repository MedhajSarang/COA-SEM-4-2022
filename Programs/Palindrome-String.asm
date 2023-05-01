.model small
.stack 100h
.data
string db 'madam','$'
string1 db 'String is palindrome','$'
string2 db 'String is not palindrome','$'
.code
main proc far
mov ax, @data
mov ds, ax
call palindrome
mov ah, 4ch
int 21h
main endp
palindrome proc
mov si, offset string
loop1:
mov ax, [si]
cmp al, '$'
je label1
inc si
jmp loop1
label1 :
mov di, offset string
dec si
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
output1:
lea dx, string1
mov ah, 09h
int 21h
ret
output2:
lea dx, string2
mov ah, 09h
int 21h
ret
palindrome endp
end main
