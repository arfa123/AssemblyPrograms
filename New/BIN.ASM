.MODEL SMALL
.DATA
	MSG1 DB 10,13,'Enter 1st binary no: $'
	MSG2 DB 10,13,'Enter 2nd binary no: $'
	MSG3 DB 10,13,'Sum in Hexadecimal: $'
	N1 DB 1 DUP(0)
	N2 DB 1 DUP(0)
	SUM DB 2 DUP(0)
	TABLE DB '0123456789ABCDEF'
.CODE
MAIN PROC
	MOV AX,@DATA
	MOV DS,AX
	CALL NUM1
	CALL NUM2
	CALL ADD1
	CALL PRN
	MOV AH,4CH
	INT 21H
MAIN ENDP
NUM1 PROC
	MOV AH,9
	MOV DX,OFFSET MSG1
	INT 21H
	MOV AH,1
	MOV CX,0
	MOV BH,0
	INP1:
		INT 21H
		CMP AL,0DH
		JZ EXT1
		SUB AL,30H
		MOV BL,AL
		PUSH BX
		INC CX
	JMP INP1
	EXT1:
	MOV DL,1
	MOV BX,0
	EVL1:
		POP AX
		MUL DL
		ADD BX,AX
		MOV AL,DL
		MOV DL,2
		MUL DL
		MOV DL,AL
	LOOP EVL1
	MOV SI,OFFSET N1
	MOV [SI],BX
	RET
NUM1 ENDP
NUM2 PROC
	MOV AH,9
	MOV DX,OFFSET MSG2
	INT 21H
	MOV AH,1
	MOV CX,0
	MOV BH,0
	INP2:
		INT 21H
		CMP AL,0DH
		JZ EXT2
		SUB AL,30H
		MOV BL,AL
		PUSH BX
		INC CX
	JMP INP2
	EXT2:
	MOV DL,1
	MOV BX,0
	EVL2:
		POP AX
		MUL DL
		ADD BX,AX
		MOV AL,DL
		MOV DL,2
		MUL DL
		MOV DL,AL
	LOOP EVL2
	MOV SI,OFFSET N2
	MOV [SI],BX
	RET
NUM2 ENDP
ADD1 PROC
	MOV AL,N1
	ADD AL,N2
	MOV SUM,AL
	RET
ADD1 ENDP
PRN PROC
	MOV AH,9
	MOV DX,OFFSET MSG3
	INT 21H
	MOV AL,SUM
	MOV DL,16
	MOV BH,0
	MOV CX,0
	DIV1:
		MOV AH,0
		DIV DL
		MOV BL,AH
		PUSH BX
		INC CX
		CMP AL,0
		JZ EXT3
	JMP DIV1
	EXT3:
	MOV BX,OFFSET TABLE
	L:	
		POP AX
		XLAT
		MOV DL,AL
		MOV AH,2
		INT 21H
	LOOP L
	RET
PRN ENDP
END