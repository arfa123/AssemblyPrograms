.MODEL SMALL
.DATA
	X DW 2 DUP(0)
.CODE
MAIN PROC
	MOV AX,@DATA
	MOV DS,AX
	CALL INP
	CALL EVL
	CALL PRN
	MOV AH,4CH
	INT 21H
MAIN ENDP
INP PROC
	POP BP
	MOV BH,0
	MOV CX,0
	MOV AH,1
	L:
		INT 21H
		CMP AL,0DH
		JZ EXT
		CMP AL,39H
		JA HEX
		SUB AL,30H
		MOV BL,AL
		PUSH BX
		INC CX
	JMP L
	HEX:
		SUB AL,37H
		MOV BL,AL
		PUSH BX
		INC CX
	JMP L
	EXT:
	PUSH BP
	RET
INP ENDP
EVL PROC
	POP BP
	MOV SI,1
	MOV BX,0
	L1:
		POP AX
		MUL SI
		ADD BX,AX
		MOV AX,SI
		MOV SI,16
		MUL SI
		MOV SI,AX
	LOOP L1
	MOV SI,OFFSET X
	MOV [SI],BX
	PUSH BP
	RET
EVL ENDP
PRN PROC
	POP BP
	MOV AX,X
	MOV DL,10
	MOV BH,0
	MOV CX,0
	L2:
		MOV AH,0
		DIV DL
		MOV BL,AH
		PUSH BX
		INC CX
		CMP AL,0
		JZ EXT1
	JMP L2
	EXT1:
	MOV AH,2
	PRNT:
		POP DX
		ADD DL,30H
		INT 21H
	LOOP PRNT
	PUSH BP
	RET
PRN ENDP	
END