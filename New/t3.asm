.model small
.data
	a db 250
	b db 8
	sum dw 1 dup('x')
.code
	mov ax,@data
	mov ds,ax
	mov al,b
	add al,a
	mov ah,0
	mov sum,ax
	mov ah,4ch
	int 21h
end