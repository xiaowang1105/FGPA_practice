`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/10/29 17:08:42
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


module seg7(input [3:0] led, output reg[7:0] scan, output reg [6:0] seg);

always @ (led)
begin
    case (led)
        4'b0001: begin scan = 8'b1111_1110; seg = 7'b1000010; end //d
        4'b0010: begin scan = 8'b1111_1101; seg = 7'b1100010; end //o
        4'b0100: begin scan = 8'b1111_1011; seg = 7'b1100010; end //o
        4'b1000: begin scan = 8'b1111_0111; seg = 7'b0100001; end //G 
        default: begin scan = 8'b1111_1111; seg = 7'b1111111; end
    endcase
end
endmodule
