DATA SEGMENT
NUM1 DB '5' 
NUM2 DB '2' ; if instead of '2' we use '7' then the result of addition would be C i.e. in which case the only the lower nibble of AL is containing 2 and ah+=1
RESULT DB ?
DATA ENDS

CODE SEGMENT
ASSUME CS:CODE, DS:DATA
START:
        MOV AX, DATA
        MOV DS, AX

        MOV AL, NUM1
        MOV BL, NUM2
        SUB AL, BL
        AAS
        MOV RESULT, AL

        MOV AH, 4CH
        INT 21H
CODE ENDS
END START
