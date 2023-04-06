;直接写显存显示字符


;显存地址为B8000H-BFFFFH 共 32kb

;1.字符属性

;2.显示位置
;一行160字节单元，第0行起始，为 000H-09FH，后面以此类推，两行之差为A0H
;一列两个字节单元，第0列起始为 00H，01H, 共80列

;位置计算公式：位置=行号*160 + 列号*2



;例一，在屏幕的2行3列上显示蓝底黄字的字符串 "Good!"
;计算位置 2*160 + 3*2 = 146H
; DATA SEGMENT
;       DISP DB 'Good!'
; DATA ENDS

; CODE SEGMENT
;             ASSUME CS:CODE, DS:DATA
;       START:
;             MOV    AX,DATA
;             MOV    DS,AX
;             MOV    AX,0B800H                   ;将显存首地址载入到附加段
;             MOV    ES,AX
;             MOV    AL,DISP[0]                  ;第一个字母 G 给ax
;             MOV    ES:[146H],AL                ;在2行3列上写入G
;             MOV    BYTE PTR ES:[147H],1EH      ;写入属性 蓝底黄字
;             MOV    AL,DISP[1]                  ;下同，依次送入并设定属性
;             MOV    ES:[148H],AL
;             MOV    BYTE PTR ES:[149H],1EH      ;写入属性 蓝底黄字
;             MOV    AL,DISP[2]                  ;下同，依次送入并设定属性
;             MOV    ES:[14AH],AL
;             MOV    BYTE PTR ES:[14BH],1EH      ;写入属性 蓝底黄字
;             MOV    AL,DISP[3]                  ;下同，依次送入并设定属性
;             MOV    ES:[14CH],AL
;             MOV    BYTE PTR ES:[14DH],1EH      ;写入属性 蓝底黄字
;             MOV    AL,DISP[4]                  ;下同，依次送入并设定属性
;             MOV    ES:[14EH],AL
;             MOV    BYTE PTR ES:[14FH],1EH      ;写入属性 蓝底黄字
;       ;结束程序返回DOS
;             MOV    AH,4CH
;             INT    21H
; CODE ENDS
;     END START




; 利用循环指令实现多彩字符串

;位置计算公式：位置=行号*160 + 列号*2


;写hello world

DATA SEGMENT
      STR  DB 'hello world!'
      LEN  DB 0                   ;存储字符串长度
DATA ENDS


CODE SEGMENT
               ASSUME CS:CODE, DS:DATA

      START:   
               MOV    AX,DATA
               MOV    DS,AX
               MOV    DH,5                       ;行
               MOV    DL,16                      ;列
               MOV    BL,4                       ;属性
               MOV    SI,0

      SHOW_STR:
               MOV    AX,0B800H
               MOV    ES,AX
               MOV    AX,160
               MUL    DH                         ;行号*160 AL*DH
               MOV    DI,AX                      ; 起始行位置
               SAL    DL,1                       ;左移乘2, 列*2
               MOV    DH,0
               ADD    DI,DX
               MOV    CX,LEN-STR                 ;字符串长度
      LET1:    
               MOV    AL,[SI]                    ;循环写字符和属性到显存
               MOV    ES:[DI],AL
               MOV    BYTE PTR ES:[DI+1],BL
               INC    SI
               INC    BL
               ADD    DI,2
               LOOP   LET1                       ;CX = CX - 1  如果不为0则跳到LET1
               MOV    AH,4CH
               INT    21H

      
CODE ENDS
      END START