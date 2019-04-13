.model small
.data
nm db '10'
.code
mov ax,@data
mov ds,ax
mov dx,offset nm
mov ah,9
int 21h
mov ah,4ch
int 21h
end