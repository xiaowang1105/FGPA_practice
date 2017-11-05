`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/10/29 16:43:48
// Design Name: 
// Module Name: mux
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

module mux(a,s,y);
input [3:0] a; // ����һ�� wire ��������� a������������ 4 λ�ġ�
input [1:0] s; // ����һ�� wire ��������� s������������ 2 λ�ġ�
output reg y; // ����һ�� 1 λ reg �͵�������� y��
always @ (s or a)
begin
    case (s)
        2'b00: y = a[0];
        2'b01: y = a[1];
        2'b10: y = a[2];
        2'b11: y = a[3];
    default: y = 1'b0;
    endcase
end

endmodule
