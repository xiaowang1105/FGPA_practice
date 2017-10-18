`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/10/16 01:23:03
// Design Name: 
// Module Name: modetransfer
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


module modetransfer(
    input mode,
    input clr,
    output reg [2:0] state
    );
always @ (posedge mode)
    begin
        if(clr) begin state <= 0; end
        else 
        begin
            if(state == 6)
            begin state <= 0; end
            else begin state <= state + 1; end
        end
    end
endmodule