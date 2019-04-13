DATA SEGMENT
DATA ENDS
CODE SEGMENT
        ASSUME DS:DATA,CS:CODE
        START :
                MOV AX,DATA
                MOV DS,AX

        MOV BL,00H
        MOV CH,00H
        MOV CL,0AH
        
        
    L1   :  MOV DH,00H
        MOV DL,BL
        ADD DL,'0'
        MOV AH,02H
        INT 21H
        INC BL
        LOOP L1
    
                MOV AH,4CH
                INT 21H
CODE ENDS
        END START