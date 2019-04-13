.MODEL SMALL
.Data
Nm db '1'
.CODE
MOV AX,@data
MOV ds,AX
MOV DX,Nm
MOV AH,2
int 21H
MOV AH,4CH
INT 21H
END