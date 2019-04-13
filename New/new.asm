.model small
.data
	w dw 2143h
.code
	mov ax,@data
	mov ds,ax
	mov ax,w
	mov w,5588h
	mov ah,4ch
	int 21h
end