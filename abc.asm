;abc.asm 公式计算
DATA SEGMENT        ;数据段定义伪指令
    X    DW 4
    Y    DW 5
    Z    DW ?
DATA ENDS

;代码段
CODE SEGMENT
          ASSUME CS:CODE, DS:DATA
    START:
    ;传入数据段地址
          MOV    AX,DATA
          MOV    DS,AX
    ;x+y
          MOV    BX,X
          MOV    AX,Y
          ADD    AX,BX
    ;*8 相当于左移三个二进制位
          MOV    CL,3
          SAL    AX,CL               ;算数左移
    ;-X
          SUB    AX,X
    ;算术右移一位，相当于/2
          SAR    AX,1
          MOV    Z,AX                ;结果放到z变量中
          MOV    AH,4CH              ;代表结束程序，返回dos，必须与INT 21H 配合
          INT    21H
CODE ENDS                            ;代码段结束
    END START;整个程序结束
    
