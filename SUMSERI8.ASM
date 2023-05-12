DATA SEGMENT
NUMS DB 10H, 20H, 30H
SUM DB ?
DATA ENDS

CODE SEGMENT
ASSUME CS:CODE, DS:DATA
START:
        MOV AX, DATA
        MOV DS, AX

        MOV SI, OFFSET NUMS
        MOV AL, [SI]
        MOV CL, 02H
        ITER:
        INC SI
        ADD AL, [SI]
        DEC CL
        JNZ ITER

        MOV SUM, AL
        ;OR
        ;MOV DI, OFFSET SUM
        ;MOV [DI], AL

        MOV AH, 4CH
        INT 21H
CODE ENDS
END START

