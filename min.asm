;简化程序格式
;从MASM5.0开始提供了简化的段定义结构，这种结构用于小规模的程序设计中。
;一般格式为.MODEL SMALL。
;这种格式是小型模式，程序可以有一个代码段，一个数据段
;每段不大于64KB。数据段是和堆栈段、附加段公用的




;例4-8 用简化的程序格式从键盘输入两个一位的十进制数，做加法运算。
;相加后以蓝底黄字显示在屏幕上
