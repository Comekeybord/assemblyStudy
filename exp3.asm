;计算Y=2X+3的值


DATA SEGMENT
    X    DB ?
    Y    DB ?
    MSG  DB 'INPUT X:$'
DATA ENDS

CODE SEGMENT
          ASSUME DS:DATA,CS:CODE
    ;程序开始
    START:
          MOV    AX,DATA
          MOV    DS,AX
          MOV    DX,OFFSET MSG      ;显示msg
          MOV    AH,9
          INT    21H
          MOV    AH,1               ;键盘输入
          INT    21H
          SUB    AL,30H             ;去除ascii码
          MOV    DL,2AH             ;显示乘号
          MOV    AH,2
          INT    21H
          MOV    DL,2+30H           ;显示2
          MOV    AH,2
          INT    21H
          MOV    DL,2BH             ;显示加号
          MOV    AH,2
          INT    21H
          MOV    AH,2               ;显示3
          MOV    DL,3+30H
          INT    21H
          MOV    DL,3DH             ;显示等于号
    
    ;计算
          XOR    AH,AH              ;首先高位归零，否则是字乘法
          MOV    BL,2
          MUL    BL                 ;相乘，结果在AX
          ADD    AX,3               ;加三
          AAA                       ;十进制加法调整，高位在ah，低位在al
          MOV    Y[0],AL            ;保存结果
          MOV    Y[1],AH
          ADD    AX,3030H           ;添加ascii码
          MOV    BX,AX              ;为输出做准备，因为ax待会儿会改变
          MOV    DL,3DH             ;显示等于号
          MOV    AH,2
          INT    21H
          MOV    AH,2               ;输出高位
          MOV    DL,BH
          INT    21H
          MOV    AH,2               ;输出低位
          MOV    DL,BL
          INT    21H
    
    ;返回DOS
          MOV    AH,4CH
          INT    21H
CODE ENDS
    END START
