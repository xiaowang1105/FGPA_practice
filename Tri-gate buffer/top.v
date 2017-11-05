`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/10/29 17:20:51
// Design Name: 
// Module Name: top
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


module top(input [3:0] number, input clk, input en, input s_4, output wire testled, output wire [7:0] scan, output wire [6:0] seg);

//--------------------生成时钟和计数器问询信号--------------------//
wire outclk;
wire [1:0] cnt;
clkgenerate instance_clkgen(clk, outclk, cnt);

//--------------------选择器工作--------------------//
wire y;
mux instance_mux(number,cnt,y);

//--------------------三态选择器工作--------------------//
wire busdata;
tristate instance_tri(y, en, s_4, busdata, testled);

//--------------------译码器工作--------------------//
wire [3:0] decoderesult;
decode instance_decode(cnt, en, s_4, decoderesult);

//--------------------LED显示--------------------//
wire [3:0] led;
ledout instance_ledout(busdata, en, decoderesult, led);

//--------------------七段显示--------------------//
seg7 instance_seg(led, scan, seg);

endmodule
