.MODEL SMALL
.CODE
	IN AL,61H
	OR AL,3
	OUT 61H,AL
	MOV CX,5
	L1:
		LOOP L1
	IN AL,61H
	AND AL,0FCH
	OUT 61H,AL
	MOV AH,4CH
	INT 21H
END