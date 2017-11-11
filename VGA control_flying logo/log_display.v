`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/11 21:14:35
// Design Name: 
// Module Name: log_display
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


module log_display(input pclk, input rst, input valid, input logo_area, input [9:0] v_cnt, input [11:0] douta, output reg [11:0] vga_data);
reg [13:0] rom_addr; // ROM address

always @(posedge pclk)
    begin: logo_display
        if (rst == 1'b1)
            vga_data <= 12'b0000_0000_0000;
        else 
            begin
                if (valid == 1'b1)
                begin
                    if (logo_area == 1'b1)
                begin
                   rom_addr <= rom_addr + 14'b00000000000001; // scanning the address
                   vga_data <= douta; // import image data from the ROM
                end
                else // if out of the logo area
                begin
                   rom_addr <= rom_addr; // stopping reading data from ROM
                   vga_data <= 12'b000000000000; // shut down the VGA data
                end
             end
             else // no VGA signal at this time
             begin
                vga_data <= 12'b1111_1111_1111; // reset to 1111_1111_1111
                if (v_cnt == 0) // if v_cnt == 0, put the address back to the start
                   rom_addr <= 14'b00_0000_0000_0000; // recycle the address
             end
          end
       end
endmodule
