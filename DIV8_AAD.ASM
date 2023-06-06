DATA SEGMENT
NUM1 DB 05H
NUM2 DB 08H
RESULT DB ?
DATA ENDS

CODE SEGMENT
ASSUME CS:CODE, DS:DATA
START:
        MOV AX, DATA
        MOV DS, AX

        XOR AX, AX
        MOV AL, NUM2
        MOV AH, NUM1 
        AAD
        MOV BL, 02H
        DIV BL
        MOV RESULT, AL

        MOV AH, 4CH
        INT 21H
CODE ENDS
END START
