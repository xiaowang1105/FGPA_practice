`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/11 21:24:31
// Design Name: 
// Module Name: log_move
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



module log_move(input pclk, input rst, input speed_ctrl, input [9:0] logo_length, input [9:0] logo_hight, output reg [9:0] logo_x, output reg [9:0] logo_y);
reg [1:0] flag_add_sub; // Used to indicate the flying direction for the logo
reg [3:0] flag_edge; // Indicates which edge of logo touches the screen bound

   always @(posedge pclk) // log movement part
    begin: logo_move

       
       if (rst == 1'b1)
       begin
          flag_add_sub = 2'b01;
          logo_x <= 10'b0110101110; // moving starting point in x axis, 430
          logo_y <= 10'b0000110010; // moving starting point in y axis, 50
       end
       else
       begin
          if (speed_ctrl == 1'b1)
          begin
             if (logo_x == 1)
             begin
                if (logo_y == 1)
                begin
                   flag_edge <= 4'h1;
                   flag_add_sub = 2'b00;
                end
                else if (logo_y == 480 - logo_hight)
                begin
                   flag_edge <= 4'h2;
                   flag_add_sub = 2'b01;
                end
                else
                begin
                   flag_edge <= 4'h3;
                   flag_add_sub[1] = (~flag_add_sub[1]);
                end
             end
             
             else if (logo_x == 640 - logo_length)
             begin
                if (logo_y == 1)
                begin
                   flag_edge <= 4'h4;
                   flag_add_sub = 2'b10;
                end
                else if (logo_y == 480 - logo_hight)
                begin
                   flag_edge <= 4'h5;
                   flag_add_sub = 2'b11;
                end
                else
                begin
                   flag_edge <= 4'h6;
                   flag_add_sub[1] = (~flag_add_sub[1]);
                end
             end
             
             else if (logo_y == 1)
             begin
                flag_edge <= 4'h7;
                flag_add_sub[0] = (~flag_add_sub[0]);
             end
             else if (logo_y == 480 - logo_hight)
             begin
                flag_edge <= 4'h8;
                flag_add_sub[0] = (~flag_add_sub[0]);
             end
             else
             begin
                flag_edge <= 4'h9;
                flag_add_sub = flag_add_sub;
             end
             
             case (flag_add_sub)
                2'b00 :
                   begin
                      logo_x <= logo_x + 10'b0000000001;
                      logo_y <= logo_y + 10'b0000000001;
                   end
                2'b01 :
                   begin
                      logo_x <= logo_x + 10'b0000000001;
                      logo_y <= logo_y - 10'b0000000001;
                   end
                2'b10 :
                   begin
                      logo_x <= logo_x - 10'b0000000001;
                      logo_y <= logo_y + 10'b0000000001;
                   end
                2'b11 :
                   begin
                      logo_x <= logo_x - 10'b0000000001;
                      logo_y <= logo_y - 10'b0000000001;
                   end
                default :
                   begin
                      logo_x <= logo_x + 10'b0000000001;
                      logo_y <= logo_y + 10'b0000000001;
                   end
             endcase
          end
          
       end
    end
endmodule
