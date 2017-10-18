`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/10/16 01:24:45
// Design Name: 
// Module Name: transferToBCD
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


module transferToBCD(input[7:0] decimal, output reg [3:0] higher, output reg[3:0] lower);
always @ (decimal)
//----------------秒数十进制转换成BCD码----------------//
begin
	case(decimal[7:0])
		8'd0: begin higher[3:0] <= 4'b0000; lower[3:0] <= 4'b0000; end
		8'd1: begin higher[3:0] <= 4'b0000; lower[3:0] <= 4'b0001; end
		8'd2: begin higher[3:0] <= 4'b0000; lower[3:0] <= 4'b0010; end
		8'd3: begin higher[3:0] <= 4'b0000; lower[3:0] <= 4'b0011; end
		8'd4: begin higher[3:0] <= 4'b0000; lower[3:0] <= 4'b0100; end
		8'd5: begin higher[3:0] <= 4'b0000; lower[3:0] <= 4'b0101; end
		8'd6: begin higher[3:0] <= 4'b0000; lower[3:0] <= 4'b0110; end
		8'd7: begin higher[3:0] <= 4'b0000; lower[3:0] <= 4'b0111; end
		8'd8: begin higher[3:0] <= 4'b0000; lower[3:0] <= 4'b1000; end
		8'd9: begin higher[3:0] <= 4'b0000; lower[3:0] <= 4'b1001; end
		
		8'd10: begin higher[3:0] <= 4'b0001; lower[3:0] <= 4'b0000; end
		8'd11: begin higher[3:0] <= 4'b0001; lower[3:0] <= 4'b0001; end
		8'd12: begin higher[3:0] <= 4'b0001; lower[3:0] <= 4'b0010; end
		8'd13: begin higher[3:0] <= 4'b0001; lower[3:0] <= 4'b0011; end
		8'd14: begin higher[3:0] <= 4'b0001; lower[3:0] <= 4'b0100; end
		8'd15: begin higher[3:0] <= 4'b0001; lower[3:0] <= 4'b0101; end
		8'd16: begin higher[3:0] <= 4'b0001; lower[3:0] <= 4'b0110; end
		8'd17: begin higher[3:0] <= 4'b0001; lower[3:0] <= 4'b0111; end
		8'd18: begin higher[3:0] <= 4'b0001; lower[3:0] <= 4'b1000; end
		8'd19: begin higher[3:0] <= 4'b0001; lower[3:0] <= 4'b1001; end

		8'd20: begin higher[3:0] <= 4'b0010; lower[3:0] <= 4'b0000; end
		8'd21: begin higher[3:0] <= 4'b0010; lower[3:0] <= 4'b0001; end
		8'd22: begin higher[3:0] <= 4'b0010; lower[3:0] <= 4'b0010; end
		8'd23: begin higher[3:0] <= 4'b0010; lower[3:0] <= 4'b0011; end
		8'd24: begin higher[3:0] <= 4'b0010; lower[3:0] <= 4'b0100; end
		8'd25: begin higher[3:0] <= 4'b0010; lower[3:0] <= 4'b0101; end
		8'd26: begin higher[3:0] <= 4'b0010; lower[3:0] <= 4'b0110; end
		8'd27: begin higher[3:0] <= 4'b0010; lower[3:0] <= 4'b0111; end
		8'd28: begin higher[3:0] <= 4'b0010; lower[3:0] <= 4'b1000; end
		8'd29: begin higher[3:0] <= 4'b0010; lower[3:0] <= 4'b1001; end
		
		8'd30: begin higher[3:0] <= 4'b0011; lower[3:0] <= 4'b0000; end
		8'd31: begin higher[3:0] <= 4'b0011; lower[3:0] <= 4'b0001; end
		8'd32: begin higher[3:0] <= 4'b0011; lower[3:0] <= 4'b0010; end
		8'd33: begin higher[3:0] <= 4'b0011; lower[3:0] <= 4'b0011; end
		8'd34: begin higher[3:0] <= 4'b0011; lower[3:0] <= 4'b0100; end
		8'd35: begin higher[3:0] <= 4'b0011; lower[3:0] <= 4'b0101; end
		8'd36: begin higher[3:0] <= 4'b0011; lower[3:0] <= 4'b0110; end
		8'd37: begin higher[3:0] <= 4'b0011; lower[3:0] <= 4'b0111; end
		8'd38: begin higher[3:0] <= 4'b0011; lower[3:0] <= 4'b1000; end
		8'd39: begin higher[3:0] <= 4'b0011; lower[3:0] <= 4'b1001; end
		
		8'd40: begin higher[3:0] <= 4'b0100; lower[3:0] <= 4'b0000; end
		8'd41: begin higher[3:0] <= 4'b0100; lower[3:0] <= 4'b0001; end
		8'd42: begin higher[3:0] <= 4'b0100; lower[3:0] <= 4'b0010; end
		8'd43: begin higher[3:0] <= 4'b0100; lower[3:0] <= 4'b0011; end
		8'd44: begin higher[3:0] <= 4'b0100; lower[3:0] <= 4'b0100; end
		8'd45: begin higher[3:0] <= 4'b0100; lower[3:0] <= 4'b0101; end
		8'd46: begin higher[3:0] <= 4'b0100; lower[3:0] <= 4'b0110; end
		8'd47: begin higher[3:0] <= 4'b0100; lower[3:0] <= 4'b0111; end
		8'd48: begin higher[3:0] <= 4'b0100; lower[3:0] <= 4'b1000; end
		8'd49: begin higher[3:0] <= 4'b0100; lower[3:0] <= 4'b1001; end
		
		8'd50: begin higher[3:0] <= 4'b0101; lower[3:0] <= 4'b0000; end
		8'd51: begin higher[3:0] <= 4'b0101; lower[3:0] <= 4'b0001; end
		8'd52: begin higher[3:0] <= 4'b0101; lower[3:0] <= 4'b0010; end
		8'd53: begin higher[3:0] <= 4'b0101; lower[3:0] <= 4'b0011; end
		8'd54: begin higher[3:0] <= 4'b0101; lower[3:0] <= 4'b0100; end
		8'd55: begin higher[3:0] <= 4'b0101; lower[3:0] <= 4'b0101; end
		8'd56: begin higher[3:0] <= 4'b0101; lower[3:0] <= 4'b0110; end
		8'd57: begin higher[3:0] <= 4'b0101; lower[3:0] <= 4'b0111; end
		8'd58: begin higher[3:0] <= 4'b0101; lower[3:0] <= 4'b1000; end
		8'd59: begin higher[3:0] <= 4'b0101; lower[3:0] <= 4'b1001; end
	endcase
end
endmodule
