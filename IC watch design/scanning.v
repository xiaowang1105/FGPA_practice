`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/10/16 01:23:32
// Design Name: 
// Module Name: scanning
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

module scanning(
    input [2:0] state,
    input[2:0] cnt, input[3:0] qhh, input[3:0] qhl, input[3:0] qmh, input[3:0] qml,
    input[3:0] qsh, input[3:0] qsl, 
    input [3:0] cqhh ,input [3:0] cqhl, input [3:0] cqmh, input [3:0] cqml,
    input [3:0] cqsh, input [3:0] cqsl,
    input [3:0] aqmh, input [3:0] aqml,
    input [3:0] aqhh, input [3:0] aqhl,
    input[2:0] blink, output reg [3:0] data, output reg [7:0] scan);
always @ (cnt, qhh, qhl, qmh, qml, qsh, qsl, cqhh, cqhl, cqmh, cqml, cqsh, cqsl, blink)
    begin
        if(state == 4)
            begin 
                case(cnt)
                    3'b000: begin data[3:0] <= cqsl[3:0]; scan[7:0] <= 8'b11111110; end
                    3'b001: begin data[3:0] <= cqsh[3:0]; scan[7:0] <= 8'b11111101; end
                    3'b010: begin data[3:0] <= cqml[3:0]; scan[7:0] <= 8'b11111011; end
                    3'b011: begin data[3:0] <= cqmh[3:0]; scan[7:0] <= 8'b11110111; end
                    3'b100: begin data[3:0] <= cqhl[3:0]; scan[7:0] <= 8'b11101111; end
                    3'b101: begin data[3:0] <= cqhh[3:0]; scan[7:0] <= 8'b11011111; end
                    default: begin data <= 4'bx;scan <= 6'bx; end
                endcase
            end
        else if(state == 5|state == 6)
            begin
                case(cnt)
                3'b000: begin data[3:0] <= 4'b0000; scan[7:0] <= 8'b11111111; end
                3'b001: begin data[3:0] <= 4'b0000; scan[7:0] <= 8'b11111111; end
                3'b010: begin data[3:0] <= aqml[3:0]; scan[7:0] <= 8'b11111011|{8{blink[1]}}; end
                3'b011: begin data[3:0] <= aqmh[3:0]; scan[7:0] <= 8'b11110111|{8{blink[1]}}; end
                3'b100: begin data[3:0] <= aqhl[3:0]; scan[7:0] <= 8'b11101111|{8{blink[2]}}; end
                3'b101: begin data[3:0] <= aqhh[3:0]; scan[7:0] <= 8'b11011111|{8{blink[2]}}; end
                default: begin data <= 4'bx;scan <= 6'bx; end
                endcase
            end
        else
            begin
                case(cnt)
                3'b000: begin data[3:0] <= qsl[3:0]; scan[7:0] <= 8'b11111110|{8{blink[0]}}; end
                3'b001: begin data[3:0] <= qsh[3:0]; scan[7:0] <= 8'b11111101|{8{blink[0]}}; end
                3'b010: begin data[3:0] <= qml[3:0]; scan[7:0] <= 8'b11111011|{8{blink[1]}}; end
                3'b011: begin data[3:0] <= qmh[3:0]; scan[7:0] <= 8'b11110111|{8{blink[1]}}; end
                3'b100: begin data[3:0] <= qhl[3:0]; scan[7:0] <= 8'b11101111|{8{blink[2]}}; end
                3'b101: begin data[3:0] <= qhh[3:0]; scan[7:0] <= 8'b11011111|{8{blink[2]}}; end
                default: begin data <= 4'bx;scan <= 6'bx; end
                endcase
            end
    end
endmodule
