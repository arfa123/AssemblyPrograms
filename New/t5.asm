.model small
.data
	nm db 10 dup('a')
.code
	mov ax,@data
	mov ds,ax
	mov ah,10
	mov dx,offset nm
	int 21h
	mov ah,4ch
	int 21h
end