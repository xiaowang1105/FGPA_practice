`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/10/16 01:21:36
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


module clkgenerate(input clk, output reg clk1hz, output reg clk2hz, output reg clk1khz, output reg [2:0] cnt);



reg[16:0] count1 = 0; //生成0.001秒时钟的计数器
reg[9:0] count2 = 0; //生成1s的时钟
reg[8:0] count3 = 0; //生成0.5的时钟
initial
begin
    clk1hz = 0;
    clk2hz = 0;
    clk1khz = 0;
end


//----------------0.001s时钟的生成----------------//
always @(posedge clk)
begin
    if(count1 == 50000)
        begin
            count1 <= 0;
            clk1khz <= ~clk1khz;
        end
    else
        begin count1 <= count1+1; end
end

//----------------1s和0.5s时钟的生成，动态显示变量的产生----------------//
always @ (posedge clk1khz)
begin
	if(count2 == 500) begin clk1hz <= ~clk1hz; count2 <= 0; end 
	else begin count2 <= count2 + 1; end
	
	if(count3 == 250) begin clk2hz <= ~clk2hz; count3 <= 0; end
	else begin count3 <= count3 + 1; end

	if(cnt == 5) begin cnt <= 0; end
	else begin cnt <= cnt + 1; end
end
endmodule
