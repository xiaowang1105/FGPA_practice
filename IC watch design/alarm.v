`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/10/16 01:20:16
// Design Name: 
// Module Name: alarm
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


module alarm(
    input clk1hz,
    input [7:0] hour,
    input [7:0] min,
    input [7:0] ahour,
    input [7:0] amin,
    output reg Sound
    );
always @ (clk1hz)
begin
if(hour == ahour && amin == min) begin Sound <= 1; end
else begin Sound <= 0; end
end

endmodule
