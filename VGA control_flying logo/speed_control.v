`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/11 21:20:10
// Design Name: 
// Module Name: speed_control
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


module speed_control(input pclk, input rst, input [9:0] h_cnt, input [9:0] v_cnt, output reg [7:0] speed_cnt);
   always @(posedge pclk) // output a speed_cnt signal, which is used for logo movement
    begin: speed_control
       if (rst == 1'b1)
          speed_cnt <= 8'h00;
       else 
       begin
          if ((v_cnt[5] == 1'b1) & (h_cnt == 1))
             speed_cnt <= speed_cnt + 8'h01;
       end
    end
endmodule
