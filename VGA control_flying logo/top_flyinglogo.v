`timescale 1 ns / 1 ns

//size of display screen: 480 * 640
//size of logo: 169 * 78

module top_flyinglogo(clk, rst, hsync, vsync, vga_r, vga_g, vga_b);

//----------------------In ant Out signal setting----------------------//
input           clk; // clock singal
input           rst; // reset signal
   
output          hsync; // horizontal scanning signal
output          vsync; // vertical scanning signal
output [3:0]    vga_r; // VGA red
output [3:0]    vga_g; // VGA green
output [3:0]    vga_b; // VGA blue
   
//----------------------parameters setting----------------------//   
wire pclk; // VGA clk
wire valid; // Valid signal, which indicates the existence of horizontal and vertical signal
wire [9:0] h_cnt; // Count variable for horizontal scanning 
wire [9:0] v_cnt; // Count variable for vertical scanning
wire [11:0] vga_data; // VGA data = {VGA_R, VGA_G, VGA_B}

wire [11:0] douta; // Out data from ROM
   
wire logo_area; // Bool value, which is decided by whether the logo exist in a self-defined square
wire [9:0] logo_x; // position of x, where logo starts
wire [9:0] logo_y; // position of y, where logo starts

parameter [9:0] logo_length = 10'b0010101001; // Pixel length for logo
parameter [9:0] logo_hight  = 10'b0001001110; // Pixel hight for logo
   
wire [7:0] speed_cnt; //  Used for logo speed control
wire speed_ctrl; // Used for logo movement speed

//----------------------clock generation----------------------// 
dcm_25m clkgen_ins(.clk_in1(clk), .clk_out1(pclk), .reset(rst));
//----------------------ROM init----------------------// 
logo_rom rom_ins(.clka(pclk), .addra(rom_addr), .douta(douta));
//----------------------VGA timing----------------------// 
vga_640x480 vgs_ins(.pclk(pclk), .reset(rst), .hsync(hsync), .vsync(vsync), .valid(valid), .h_cnt(h_cnt), .v_cnt(v_cnt));
//----------------------Logo movement speed control----------------------// 
speed_control speed_ins(pclk, rst, h_cnt, v_cnt, speed_cnt);
//----------------------Logo move----------------------// 
log_move logomove_ins(pclk, rst, speed_ctrl, logo_length, logo_hight, logo_x, logo_y);
assign logo_area = ((v_cnt >= logo_y) & (v_cnt <= logo_y + logo_hight - 1) & (h_cnt >= logo_x) & (h_cnt <= logo_x + logo_length - 1)) ? 1'b1:1'b0; 
// Bool value, which is decided by whether the logo exist in a self-defined square
//----------------------Display part----------------------// 
log_display display_ins(pclk, rst, valid, logo_area, v_cnt, douta, vga_data);
assign vga_r = vga_data[11:8];
assign vga_g = vga_data[7:4];
assign vga_b = vga_data[3:0];
//----------------------Debounce----------------------//   
debounce debounce_ins(.sig_in(speed_cnt[5]), .clk(pclk), .sig_out(speed_ctrl));

endmodule