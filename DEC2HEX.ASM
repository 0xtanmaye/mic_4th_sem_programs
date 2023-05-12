DATA SEGMENT
DECI DB 55H
HEX DB ?
DATA ENDS

CODE SEGMENT
ASSUME CS:CODE, DS:DATA
START:
        MOV AX, DATA
        MOV DS, AX

        MOV AL, DECI
        AND AL, 0FH
        MOV DL, AL
        MOV AL, DECI
        AND AL, 0F0H
        MOV CL, 04H
        ROL AL, CL
        MOV DH, 0AH
        MUL DH
        ADD AL, DL
        MOV HEX, AL

        MOV AH, 4CH
        INT 21H
CODE ENDS
END START

