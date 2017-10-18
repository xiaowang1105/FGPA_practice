`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/10/16 01:25:56
// Design Name: 
// Module Name: clock
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module clock(seg, scan, clk, clr, en, zero, mode, inc, sound);
output wire [6:0] seg; //数码管显示信号
output wire [7:0] scan; //动态显示板块， 片选信号
output wire sound; //闹钟信号
input clk, clr, en, mode, inc, zero; //clk时钟，clr清零，en暂停，mode模式转换，inc调时间，表示加1
wire [2:0] state; //手表工作在哪个状态
wire [3:0] qhh, qhl, qmh, qml, qsh, qsl, cqhh, cqhl, cqmh, cqml, cqsh, cqsl, aqmh, aqml, aqhh, aqhl; 
//qhh小时高位，qhl小时低位，qmh 分钟高位，qml分钟地位，qsh秒数高位，qsk秒数地位
wire clk1khz, clk1hz, clk2hz; //1秒，0.5秒，0.001秒时钟
wire [2:0] cnt; //动态显示的指示数值
wire [7:0] sec, min, hour, countsec, countmin, counthour, amin, ahour; //十进制表示的数字，秒数：0-59，分钟：0-59，小时：0-23，count秒表，a闹钟
parameter state0 = 0, state1 = 1, state2 = 2, state3 = 3, state4 = 4, state5 = 5, state6 = 6; // 通过Mode button去控制模式的转换
//state0正常计数，state1设置小时，state2设置分钟，state3设置秒，state4秒表计时，state5闹钟分钟，state6闹钟小时
wire [3:0] data; //数码管显示的最终信号
wire [2:0] blink; //调时间时候的闪烁模块

//----------------0.001s1s和0.5s时钟的生成，动态显示变量的产生----------------//
clkgenerate instance_clkgen(clk, clk1hz, clk2hz, clk1khz, cnt);
//----------------模式转换----------------//
modetransfer instance_mode(mode, clr, state);
//----------------状态控制----------------//
controlstate instance_control(clk1hz, en, clr, state, inc, zero, hour, min, sec,countsec, countmin, counthour, amin, ahour);
//----------------当更改时间时候，让数码管闪烁----------------//
blinking instance_blink(clk2hz, state, blink);
//----------------闹钟模块----------------//
alarm instance_alarm(clk1hz, hour, min, ahour, amin, sound);
//----------------秒数十进制转换成BCD码----------------//
transferToBCD instance_secBCD(sec, qsh, qsl);
transferToBCD instance_csecBCD(countsec, cqsh, cqsl);
//----------------分钟十进制转换成BCD码----------------//
transferToBCD instance_minBCD(min, qmh, qml);
transferToBCD instance_cminBCD(countmin, cqmh, cqml);
transferToBCD instance_aminBCD(amin, aqmh, aqml);
//----------------小时十进制转换成BCD码----------------//
transferToBCD instance_hourBCD(hour, qhh, qhl);
transferToBCD instance_chourBCD(counthour, cqhh, cqhl);
transferToBCD instance_ahourBCD(ahour, aqhh, aqhl);
//----------------数码管动态扫描----------------//
scanning instance_scanning(state, cnt, qhh, qhl, qmh, qml, qsh, qsl,cqhh, cqhl, cqmh, cqml, cqsh, cqsl,aqmh, aqml, aqhh, aqhl, blink, data, scan);
//----------------7段译码----------------//
seg7 instance_seg7(data, seg);
endmodule
