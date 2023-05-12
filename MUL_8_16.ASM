DATA SEGMENT
n1 DW 1111H
n2 DB 02H
resl DW ?
resh DW ?
DATA ENDS

CODE SEGMENT
ASSUME CS:CODE, DS:DATA
START:
        MOV AX, DATA
        MOV DS, AX

        XOR AX, AX
        XOR BX, BX
        XOR DX, DX

        MOV AX, n1
        MOV BL, n2
        MUL BX
        JNC NOCARRY
        INC resh
        NOCARRY:
                MOV resl, AX

        MOV AH, 4CH
        INT 21H
CODE ENDS
END START


