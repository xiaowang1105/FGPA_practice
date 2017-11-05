`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/10/29 16:38:05
// Design Name: 
// Module Name: clkgenerate
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


module clkgenerate(input inclk, output reg outclk, output reg [1:0] cnt);

reg clk1khz;
reg[16:0] count1 = 0; //生成0.001秒时钟的计数器
reg[9:0] count2 = 0; //生成1s的时钟

initial
begin
    outclk = 0;
    clk1khz = 0;
end


//----------------0.001s时钟的生成----------------//
always @(posedge inclk)
begin
    if(count1 == 50000)
        begin
            count1 <= 0;
            clk1khz <= ~clk1khz;
        end
    else
        begin count1 <= count1+1; end
end

//----------------1s时钟的生成----------------//
always @ (posedge clk1khz)
begin
	if(count2 == 500) begin outclk <= ~outclk; count2 <= 0; end 
	else begin count2 <= count2 + 1; end

//	if(cnt == 3) begin cnt <= 0; end
//	else begin cnt <= cnt + 1; end
end

//轮询信号调整为1s
always @ (posedge outclk)
begin
    if(cnt == 2'b11) begin cnt <= 0; end
    else begin cnt <= cnt + 1; end
end

endmodule


