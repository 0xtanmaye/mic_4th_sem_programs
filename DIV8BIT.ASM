DATA SEGMENT
NUM1 DB 09H
NUM2 DB 03H
RESULT DB ?
DATA ENDS

CODE SEGMENT
ASSUME CS:CODE, DS:DATA
START:
        MOV AX, DATA
        MOV DS, AX

        XOR AX, AX ;clear the ax register before division
        MOV AL, NUM1
        MOV BL, NUM2
        DIV BL
        MOV RESULT, AL

        MOV AH, 4CH
        INT 21H
CODE ENDS
END START
