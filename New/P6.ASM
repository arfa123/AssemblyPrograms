.MODEL SMALL
.DATA
	X DB -15
	Y DB 3
.CODE
	MOV AX,@DATA
	MOV DS,AX
	MOV AH,0
	MOV AL,X
	IDIV Y
	MOV AH,4CH
	INT 21H
END