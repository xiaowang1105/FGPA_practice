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



reg[16:0] count1 = 0; //����0.001��ʱ�ӵļ�����
reg[9:0] count2 = 0; //����1s��ʱ��
reg[8:0] count3 = 0; //����0.5��ʱ��
initial
begin
    clk1hz = 0;
    clk2hz = 0;
    clk1khz = 0;
end


//----------------0.001sʱ�ӵ�����----------------//
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

//----------------1s��0.5sʱ�ӵ����ɣ���̬��ʾ�����Ĳ���----------------//
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
