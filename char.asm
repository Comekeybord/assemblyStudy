;1.输入字符 1号指令
;AH=1 INT 21H; 表示输入字符
;从键盘输入一个字符存入AL中



;2.输出字符 2号指令
;AH=2 DL=字符 INT=21H
;将DL中的字符输出到屏幕
;执行后AL被修改为DL的值


CODE SEGMENT
            ASSUME CS:CODE
      ;程序开始
      START:
      ;输如一个字符
            MOV    AH,1
            INT    21H
      ;将大写字符改为小写字符
            ADD    AL,20H
      ;输出该字符
            MOV    DL,AL
            MOV    AH,2
            INT    21H
      ;程序结束
            MOV    AH,4CH
            INT    21H
CODE ENDS
    END START

