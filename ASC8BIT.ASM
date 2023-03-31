DATA SEGMENT
NUMS DB 33H, 11H, 89H, 07H, 44H
DATA ENDS

CODE SEGMENT
ASSUME CS:CODE, DS:DATA
START:
        MOV AX, DATA
        MOV DS, AX

        MOV CX, 04H
        NEXTPASS:
        MOV BX, CX
        MOV SI, OFFSET NUMS
        NEXTITER:
        INC SI
        MOV AL, [SI]
        CMP AL, [SI+1]
        JB SKIP
        XCHG AL, [SI+1]
        XCHG [SI], AL
        SKIP:                                                                                                                                 

        JB 


