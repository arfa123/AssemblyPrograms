.MODEL SMALL
.DATA
	TXT DB 'MICROPROCESSORS'
	TXTPTR DW TXT
	ADDR DW 0B800H
.CODE
	MOV AX,@DATA
	MOV DS,AX
	MOV BX,OFFSET TXTPTR
	MOV SI,BX
	DEC SI
	MOV DI,0
	MOV BX,OFFSET ADDR
	MOV AX,[BX]
	MOV ES,AX
	STD
	MOV CX,15
	MOV AH,9
	L1:
	MOVSB
	DEC DI
	LOOP L1
	MOV AH,4CH
	INT 21H
END