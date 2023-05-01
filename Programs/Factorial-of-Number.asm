.model small 
.data 
num dw 08h 
.code 
MOV ax, @data ; initialize the data segment 
MOV ds, ax 
MOV ax, 01 ; initialize ax == 1 
MOV bx, num ; load the number into cx 
CALL fact ; call procedure 
MOV di, ax ; store the lsb of result into di 
MOV bp, 2 ; initialize the count for no of times the display is called 
MOV bx, dx ; store the msb of result the into reg bx 
MOV bx, di ; store the lsb of result the into bx 
DEC bp ; decrement bp 
MOV ah,4ch 
Int 21h 
Fact proc near ;function for finding the factorial 
CMP bx,01 ;if bx==1 
JZ l11 ;if yes ax==1 
l12: MUL bx ;find the factorial 
DEC bx ; decrement bx 
CMP bx,01 ;multiply bx==1 
JNE l12 
RET
l11:MOV ax,01 ;initialize ax==1 
RET ;return to the called program 
fact ENDP ;end procedure 
END ;end program
