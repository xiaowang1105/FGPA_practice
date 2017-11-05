`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/10/29 16:56:38
// Design Name: 
// Module Name: ledout
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


module ledout(input busdata, input en, input [3:0] decoderesult, output reg [3:0] led);

always @ (busdata, en, decoderesult)
begin
    if(en == 1) begin led[3:0] = decoderesult[3:0] & {4{busdata}}; end
    else begin led[3:0] = decoderesult[3:0] & {4{~en}}; end
end

endmodule
