`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/10/29 16:50:29
// Design Name: 
// Module Name: decode
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


module decode(input [1:0] cnt, input en, input s_4, output reg [3:0] decoderesult);

always @ (cnt)
if (en == 1)
    begin
        case(cnt)
            2'b00: decoderesult <= 4'b1000;
            2'b01: decoderesult <= 4'b0100;
            2'b10: decoderesult <= 4'b0010;
            2'b11: decoderesult <= 4'b0001;
            default: decoderesult <= 4'b0000;
        endcase
    end
else
    begin
        decoderesult <= 4'b0000;
    end
endmodule
