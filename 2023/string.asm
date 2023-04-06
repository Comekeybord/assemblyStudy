;1.键盘输入字符串 10号指令
;AH=10 DX=字节缓冲区首地址 INT 21H
;从键盘输入一串ascii字符到缓冲区，用回车结束
;回车符0DH 占用一个单元。若缓冲区溢出则忽略溢出的字符
;定义缓冲区的第一个单元为允许输入的最大字符数，
;第二个单元为实际键入的字符数（系统自动填入）
;从第三个单元开始存放字符，末尾为回车符0DH


;例一，输入一个字符串
;定义数据段
; DATA SEGMENT
;     BUFFER DB 10,?,11 DUP(?),'$'
; DATA ENDS

; ;定义代码段
; CODE SEGMENT
;     ;关联段寄存器与段地址
;     ;用于划分段
;           ASSUME CS:CODE, DS:DATA
;     ;程序开始
;     START:
;           MOV    AX,DATA
;           MOV    DS,AX
;     ;接收字符串到缓冲区
;           MOV    DX,OFFSET BUFFER
;           MOV    AH,10
;           INT    21H
;     ;回到dos
;           MOV    AH,4CH
;           INT    21H
;     ;代码段结束
; CODE ENDS
;     END START
    

;2.显示字符串 9号指令
;AH=9 DX=字符串首地址 INT 21H
;$表示结束符


;例二，输出一个字符串
; ;定义数据
; DATA SEGMENT
;     STRING DB 'Very Good!','$'
; DATA ENDS
; ;代码段
; CODE SEGMENT
;           ASSUME CS:CODE,DS:DATA
;     START:
;           MOV    AX,DATA
;           MOV    DS,AX
;     ;输出字符串
;           MOV    DX,OFFSET STRING
;           MOV    AH,9
;           INT    21H
;     ;退出
;           MOV    AH,4CH
;           INT    21H
; CODE ENDS
;     END START


;例三，输出两行字符串（换行）
;定义数据段
DATA SEGMENT
    MSG1 DB 'Input x:','$'
    MSG2 DB 0AH,0DH,'Input y:$'
DATA ENDS
;代码段
CODE SEGMENT
          ASSUME CS:CODE,DS:DATA
    START:
          MOV    AX,DATA
          MOV    DS,AX
    ;输出两条数据
          MOV    DX,OFFSET MSG1
          MOV    AH,9
          INT    21H
          MOV    DX,OFFSET MSG2
          MOV    AH,9
          INT    21H
    ;结束程序
          MOV    AH,4CH
          INT    21H
CODE ENDS
    END START