`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/10/16 01:20:59
// Design Name: 
// Module Name: blinking
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


module blinking(
    input clk2hz,
    input [2:0] state,
    output reg [2:0] blink
    );

parameter state0 = 0, state1 = 1, state2 = 2, state3 = 3, state4 = 4, state5 = 5, state6 = 6;
always @ (clk2hz)
begin
	case(state)
		state0: blink[2:0] <= 3'b000;
		state1: blink[2] <= clk2hz;
		state2: blink[1] <= clk2hz;
		state3: blink[0] <= clk2hz;
		state4: blink[2:0] <= 3'b000;
		state5: blink[1] <= clk2hz;
		state6: blink[2] <= clk2hz;
	endcase
end
endmodule