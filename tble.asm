.model small
.stack 32
.data
	NLF DB 10,13,'$'
.code
main proc
	mov ax,@data
    	mov ds,ax
    	mov bx,0
    	mov cx,9
    	mov si,1
  	l2:
    		mov bx,0
    		push cx
    		mov cx,10
    		inc si
    		mov di,1
   	l1: 
    		mov ax,si
    		push cx
    		push bx
    		call div12
    		CALL PRNT1
    		pop bx
    		pop cx
		mov dl,'x'
    		mov ah,2
    		int 21h
		mov ax,di
    		push cx
    		push bx
    		call div12
    		CALL PRNT1
    		pop bx
    		pop cx
		mov dl,'='
    		mov ah,2
    		int 21h
   		mov ax,si
    		add bl,al
    		mov ax,bx
    		push cx
    		push bx
    		call div12
    		CALL PRNT1
    		pop bx
    		pop cx
		mov dx,offset nlf
    		mov ah,9
    		int 21h
		inc di
   	loop l1
 		pop cx
	loop l2                           
    	mov ah,4ch
    	int 21h
main endp

DIV12 PROC
	POP BP
	MOV CX,0
	MOV bx,10
	mov dh,0
	DIV1:
		DIV bl
		MOV dl,AH
                PUSH dX
                INC CX
                MOV AH,0
                CMP AL,0
                JZ EXT1
	JMP DIV1
	EXT1:
	PUSH BP
	RET
DIV12 ENDP

PRNT1 PROC
	POP BP
	MOV AH,2
	PRNT2:
		POP DX
		ADD DL,30H
		INT 21H
        LOOP PRNT2
	PUSH BP
	RET
PRNT1 ENDP
end
