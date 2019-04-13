.model small
.data
	adr dw adr1
	adr1 dw l3,l4
	l3 db 'microprocessors',0dh,0ah,'$'
	l4 db 'exam $'
.code
	mov ax,@data
	mov ds,ax
	mov bx,offset adr
	mov si,0
	cld
	mov si,[bx]
	lodsw
	mov dx,[si]
	mov ah,9
	int 21h
	std
	lodsw
	mov ah,9
	mov dx,[si]
	int 21h
	mov ah,4ch
	int 21h
end