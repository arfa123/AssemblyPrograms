.model small
.data
	temp db 10
.code
	mov dx,@data
	mov ds,bx
	mov dx,offset temp
	mov byte ptr[dx],4
	mov temp,4
	mov ah,4ch
	int 21h
end