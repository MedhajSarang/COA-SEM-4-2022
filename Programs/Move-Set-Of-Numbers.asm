.model small 
.code 
start: 
MOV SI,1000h 
MOV DI,2000h 
MOV Cl,05h 
LOOP1: MOV bl,[SI] 
MOV [DI],bl 
INC SI 
INC DI 
DEC Cl 
JNZ LOOP1 
int 03h 
end start
