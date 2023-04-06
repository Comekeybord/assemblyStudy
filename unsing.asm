;比较，a>b则相减，否则相加

DATA SEGMENT
    RESULT DB ?
DATA ENDS

CODE SEGMENT
          ASSUME CS:CODE
    START:
          MOV    AX,DATA
          MOV    DS,AX
          MOV    AX,8007H
          MOV    BX,0006H
          CMP    AX,BX        ;比较ax与bx
          JA     MAX1         ; JA 表示 A>B 则执行MAX1段
          ADD    AX,BX        ; A<B
          JMP    OUT1         ;跳到 out1段
    MAX1: 
          SUB    AX,BX        ; A<B
    OUT1: 
          MOV    RESULT,AX    ;存储计算结果
          MOV    DL,AL
          MOV    AH,02H       ;输出结果
          INT    21H
          MOV    AH,4CH
          INT    21H

CODE ENDS
    END START
    
    