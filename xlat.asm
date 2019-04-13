.MODEL small         ; Flat memory model
.STACK 100h     ; (default is 1-kilobyte stack)
.DATA           ; Begin initialized data segment
                ; Table for encrypting digits:
                ; Input digits:     0 1 2 3 4 5 6 7 8 9
                ; Encrypted digits: 4 6 9 5 0 3 1 8 7 2
    xlat_table	DB "ABCDEF"
    
.CODE           ; Begin code segment
	mov ax,@data
	mov ds,ax
	mov bx,OFFSET xlat_table
	mov al,'5' ; put input character into AL
	sub al,'0' ; convert input character to index
   	xlatb          ; AL = encrypted digit character
END