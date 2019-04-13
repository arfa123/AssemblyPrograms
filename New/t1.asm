.model small
.data
	data1 dw a,b,c
	a db 'applied'
	b db 'physics'
	c db 'exams'
.code
	mov ax,@data
	mov ds,ax
	mov bx,offset data1
	mov cx,2
	l1:
	mov si,bx
	push cx
	add si,cx
	add si,cx
	mov cx,3
	l2:
	mov di,[si]
	add di,cx
	mov dl,[di]
	mov ah,2
	int 21h
	loop l2
	pop cx
	loop l1
	mov ah,4ch
	int 21h
end