INCLUDE DMAC.INC
.MODEL SMALL
.DATA
	MSG DB 'HELLO WORLD!$'
.CODE
	MOV AX,@DATA
	mov ds,ax
	PRN MSG
	DISP
	MOV AH,4CH
	INT 21H
END