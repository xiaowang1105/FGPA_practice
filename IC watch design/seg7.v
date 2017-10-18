`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/10/16 01:24:10
// Design Name: 
// Module Name: seg7
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


module seg7(input [3:0] data, output reg [6:0] seg7de);

always @ (data[3:0])
begin
    case(data[3:0])
        4'b0000: begin seg7de = 7'b0000001; end //0
        4'b0001: begin seg7de = 7'b1001111; end //1
        4'b0010: begin seg7de = 7'b0010010; end //2
        4'b0011: begin seg7de = 7'b0000110; end //3
        4'b0100: begin seg7de = 7'b1001100; end //4
        4'b0101: begin seg7de = 7'b0100100; end //5
        4'b0110: begin seg7de = 7'b0100000; end //6
        4'b0111: begin seg7de = 7'b0001111; end //7
        4'b1000: begin seg7de = 7'b0000000; end //8
        4'b1001: begin seg7de = 7'b0000100; end //9
        default: begin seg7de = 7'b1111111; end
    endcase
end
endmodule
