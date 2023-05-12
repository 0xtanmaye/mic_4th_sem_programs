DATA SEGMENT
NUM DB 15H
ONES DB ?
ZEROS DB ?
DATA ENDS

CODE SEGMENT
ASSUME CS:CODE, DS:DATA
START:
        MOV AX, DATA
        MOV DS, AX

        MOV AL, NUM
        MOV BL, 00H
        MOV DL, 00H
        MOV CL, 08H

        NEXTBIT:
        ROL AL, 01H
        JC ONE

        INC DL
        JMP ENDB

        ONE:
        INC BL
        ENDB:
        DEC CL
        JNZ NEXTBIT

        MOV ONES, BL
        MOV ZEROS, DL

        MOV AH, 4CH
        INT 21H
CODE ENDS
END START
