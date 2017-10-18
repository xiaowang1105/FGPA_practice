`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/10/16 01:22:16
// Design Name: 
// Module Name: controlstate
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


module controlstate(
    input clk1hz,
    input en,
    input clr,
    input [2:0] state,
    input inc,
    input zero,
    output reg [7:0] hour,
    output reg [7:0] min,
    output reg [7:0] sec,
    output reg [7:0] countsec,
    output reg [7:0] countmin,
    output reg [7:0] counthour,
    output reg [7:0] amin,
    output reg [7:0] ahour 
    );
parameter state0 = 0, state1 = 1, state2 = 2, state3 = 3, state4 = 4, state5 = 5, state6 = 6;
reg timing = 1'b1;

initial
begin
    hour = 0;counthour = 0; ahour = 0;
    min = 0; countmin = 0; amin = 0;
    sec = 0; countsec = 0;
end

always @ (posedge clk1hz)
begin
	if(en)
		begin hour <= hour; min <= min; sec <= sec; end //��ͣ����
	else if(clr)
		begin hour <= 0; min <= 0; sec <= 0; end //�������
	
	else
		begin
			case(state)
				state0: 
					begin //ģʽ0������ʱ
						if(sec == 59)
							begin sec <= 0; 
								if(min == 59)
									begin min <= 0;
										if(hour == 23) begin hour <= 0; end
										else begin hour <= hour + 1; end
									end
								else
									begin min <= min + 1; end
							end
						else
							begin sec <= sec + 1; end
					end
				state1:
					begin //ģʽ1���趨Сʱʱ��
						if(inc)
							begin
									if(hour == 23) begin hour <= 0; end
									else begin hour <= hour + 1; end
							end
						else begin hour <= hour; end
					end
				state2:
					begin //ģʽ2���趨����ʱ��
						if(inc)
							begin
								if(min == 59) begin min <= 0; end
								else begin min <= min + 1; end
							end
						else begin min <= min; end
					end
				state3:
					begin //ģʽ3���趨����ʱ��
						if(inc)
							begin
								if(sec == 59) begin sec <= 0; end
								else begin sec <= sec + 1; end
							end
						else begin sec <= sec; end
					end
				state4: //���������ټӵ������
					begin //������ʱ
                        if(sec == 59)
                            begin sec <= 0; 
                                if(min == 59)
                                    begin min <= 0;
                                        if(hour == 23) begin hour <= 0; end
                                        else begin hour <= hour + 1; end
                                    end
                                else
                                    begin min <= min + 1; end
                            end
                        else
                            begin sec <= sec + 1; end
                        //���ģ��
                        if(zero)
                            begin counthour <= 0; countmin <= 0; countsec <= 0; end
                        else
                            case (timing)
                            1'b0:
                                begin //�����
                                    if(countsec == 59)
                                        begin countsec <= 0; 
                                            if(countmin == 59)
                                                begin countmin <= 0;
                                                    if(counthour == 23) begin counthour <= 0; end
                                                    else begin counthour <= counthour + 1; end
                                                end
                                            else
                                                begin countmin <= countmin + 1; end
                                        end
                                    else
                                        begin countsec <= countsec + 1; end
                                end
                            1'b1:
                                begin
                                    countsec <= countsec; countmin <= countmin; counthour <= counthour;
                                end
                            endcase                        
				     end
                state5: 
					begin //ģʽ5���趨���ӷ���ʱ�䣬����ʱ���˶�
						if(sec == 59)
                        begin sec <= 0; 
                            if(min == 59)
                                begin min <= 0;
                                    if(hour == 23) begin hour <= 0; end
                                    else begin hour <= hour + 1; end
                                end
                            else
                                begin min <= min + 1; end
                        end
                        else
                            begin sec <= sec + 1; end					
                    if(inc)
                        begin
                            if(amin == 59) begin amin <= 0; end
                            else begin amin <= amin + 1; end
                        end
                    else begin amin <= amin; end
                    end
                state6:
					begin //ģʽ6���趨����Сʱʱ�䣬����ʱ���˶�
					   if(sec == 59)
                       begin sec <= 0; 
                            if(min == 59)
                                begin min <= 0;
                                    if(hour == 23) begin hour <= 0; end
                                    else begin hour <= hour + 1; end
                                 end
                            else
                                begin min <= min + 1; end
                        end
                        else
                            begin sec <= sec + 1; end					
                    if(inc)
                        begin
                            if(ahour == 23) begin ahour <= 0; end
                            else begin ahour <= ahour + 1; end
                        end
                    else begin ahour <= ahour; end
                    end                
			endcase
		end
end

//���Ŀ����źţ���ͣ���߿�ʼ
always @ (posedge inc or posedge zero)
begin
if(zero) begin timing <= 1; end
else if(inc) begin timing <= timing + 1; end
end

endmodule
