.MODEL SMALL
.STACK 32H
.DATA
	X DB 10 DUP('Z')
	NLF DB 10,13,'$'
.CODE
MAIN PROC
	MOV AX,@DATA
	MOV DS,AX
	MOV BX,OFFSET X
	CALL INP
	CALL SORT
	CALL PRN
	MOV AH,4CH
	INT 21H
MAIN ENDP
INP PROC
	MOV AH,1
	MOV CX,0
	L:
		INT 21H
		CMP AL,0DH
		JZ EXT
		CMP AL,20H
		JZ EXT1
		MOV [BX],AL
		INC CX
		INC BX
	EXT1:
	JMP L
	EXT:
	RET
INP ENDP
SORT PROC
	POP BP
	MOV BX,OFFSET X
	MOV DI,CX
	MOV AH,0
	L1:
		MOV SI,1
		PUSH CX
		L2:
			MOV AL,[BX]
			CMP AL,[BX+SI]
			JBE EXT2
			PUSH AX
			MOV AL,[BX+SI]
			MOV [BX],AL
			POP AX
			MOV [BX+SI],AL
		EXT2:
		INC SI
		LOOP L2
		INC BX
		POP CX
	LOOP L1
	PUSH BP
	RET
SORT ENDP
PRN PROC
	MOV DX,OFFSET NLF
	MOV AH,9
	INT 21H
	MOV CX,di
	MOV DH,0
	MOV BX,OFFSET X
	L3:
		MOV DL,[BX]
		MOV AH,2
		INT 21H
		INC BX
	LOOP L3
	RET
PRN ENDP	
END