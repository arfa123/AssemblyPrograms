.MODEL SMALL
.STACK 32H
.DATA
	NLF DB 10,13,'$'
.CODE
	MOV AX,@DATA
	MOV DS,AX
	MOV CX,5
	L:
	MOV AH,2
	PUSH CX
	MOV CX,3
	L1:
	MOV DL,'Z'
	INT 21H
	LOOP L1
	MOV DX,OFFSET NLF
	MOV AX,9
	INT 21H
	POP CX
	LOOP L
	MOV AH,4CH
	INT 21H
END