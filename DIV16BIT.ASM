DATA SEGMENT
NUM1 DW 08H
NUM2 DW 02H
RESULT DW ?
DATA ENDS

CODE SEGMENT
ASSUME CS:CODE, DS:DATA
START:
        MOV AX, DATA
        MOV DS, AX

        XOR AX, AX      ;clear the AX register before division
        XOR DX, DX      ;clear the DX register before division
        MOV AX, NUM1
        MOV BX, NUM2
        DIV BX
        MOV RESULT, AX

        MOV AH, 4CH
        INT 21H
CODE ENDS
END START
