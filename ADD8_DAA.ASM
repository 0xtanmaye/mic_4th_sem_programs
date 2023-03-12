DATA SEGMENT
NUM1 DB 25H ; if NUM1 = 50H
NUM2 DB 28H ; and NUM2 = 55H then the resulting decimal value after addition would require more than 2 digits which will make DAA results unexpected 
RESULT DB ?
DATA ENDS

CODE SEGMENT
ASSUME CS:CODE, DS:DATA
START:
        MOV AX, DATA
        MOV DS, AX

        MOV AL, NUM1
        MOV BL, NUM2
        ADD AL, BL
        DAA
        MOV RESULT, AL

        MOV AH, 4CH
        INT 21H
CODE ENDS
END START
