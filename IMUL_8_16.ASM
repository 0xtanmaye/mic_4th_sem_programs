DATA SEGMENT
n1 DW -1111H
n2 DB -02H
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
        CWD
        MOV BH, n2
        SAR BX, 08H  ;extend the sign bit throughout the bx register
        ;MOV CL, 08H
        ;SHIFT:
                ;STC
                ;RCR BX, 01H       ;alternative logic for extending the sign
                ;DEC CL            ;bit
                ;JNZ SHIFT
        IMUL BX
        JNC NOCARRY
        INC resh
        NOCARRY:                 
                MOV resl, AX

        MOV AH, 4CH
        INT 21H
CODE ENDS
END START


