PRINTS MACRO STR
MOV AH, 09H
LEA DX, STR
INT 21H
ENDM

READS MACRO BUFF
MOV AH, 0AH
LEA DX, BUFF
INT 21H
ENDM

DATA SEGMENT
newline DB 0DH, 0AH, '$'
enter_str_msg DB "Enter a string: $"
rev_str_msg DB "Reverse: $"
str_buff DB 30, 0, 30 DUP('$')
rev_str_buff DB 30, 0, 30 DUP('$')
str_len DB ?
DATA ENDS

CODE SEGMENT
ASSUME CS:CODE, DS:DATA
START:
        MOV AX, DATA
        MOV DS, AX

        PRINTS enter_str_msg
        PRINTS newline
        READS str_buff

        LEA SI, str_buff+2
        MOV CX, 0000H
        LEN_CAL:
                
                MOV AL, [SI]
                CMP AL, "$"
                JE LEN_CAL_DONE
                INC SI
                INC CL
                JMP LEN_CAL
        LEN_CAL_DONE:
                MOV str_len, CL

        ;LEA SI, str_buff+2
        ;ADD SI, CX
        ;LEA DI, rev_str_buff+2
        LEA SI, str_buff+2
        LEA DI, rev_str_buff
        ADD DI, CX
        COPY_REV:
                MOV AL, [SI]
                MOV [DI], AL
                ;DEC SI
                ;INC DI
                INC SI
                DEC DI
                DEC CL
                JNZ COPY_REV

        PRINTS newline
        PRINTS rev_str_msg
        PRINTS newline
        PRINTS rev_str_buff+2

        MOV AH, 4CH
        INT 21H
CODE ENDS
END START




