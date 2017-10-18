`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/10/16 01:25:56
// Design Name: 
// Module Name: clock
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

module clock(seg, scan, clk, clr, en, zero, mode, inc, sound);
output wire [6:0] seg; //�������ʾ�ź�
output wire [7:0] scan; //��̬��ʾ��飬 Ƭѡ�ź�
output wire sound; //�����ź�
input clk, clr, en, mode, inc, zero; //clkʱ�ӣ�clr���㣬en��ͣ��modeģʽת����inc��ʱ�䣬��ʾ��1
wire [2:0] state; //�ֱ������ĸ�״̬
wire [3:0] qhh, qhl, qmh, qml, qsh, qsl, cqhh, cqhl, cqmh, cqml, cqsh, cqsl, aqmh, aqml, aqhh, aqhl; 
//qhhСʱ��λ��qhlСʱ��λ��qmh ���Ӹ�λ��qml���ӵ�λ��qsh������λ��qsk������λ
wire clk1khz, clk1hz, clk2hz; //1�룬0.5�룬0.001��ʱ��
wire [2:0] cnt; //��̬��ʾ��ָʾ��ֵ
wire [7:0] sec, min, hour, countsec, countmin, counthour, amin, ahour; //ʮ���Ʊ�ʾ�����֣�������0-59�����ӣ�0-59��Сʱ��0-23��count���a����
parameter state0 = 0, state1 = 1, state2 = 2, state3 = 3, state4 = 4, state5 = 5, state6 = 6; // ͨ��Mode buttonȥ����ģʽ��ת��
//state0����������state1����Сʱ��state2���÷��ӣ�state3�����룬state4����ʱ��state5���ӷ��ӣ�state6����Сʱ
wire [3:0] data; //�������ʾ�������ź�
wire [2:0] blink; //��ʱ��ʱ�����˸ģ��

//----------------0.001s1s��0.5sʱ�ӵ����ɣ���̬��ʾ�����Ĳ���----------------//
clkgenerate instance_clkgen(clk, clk1hz, clk2hz, clk1khz, cnt);
//----------------ģʽת��----------------//
modetransfer instance_mode(mode, clr, state);
//----------------״̬����----------------//
controlstate instance_control(clk1hz, en, clr, state, inc, zero, hour, min, sec,countsec, countmin, counthour, amin, ahour);
//----------------������ʱ��ʱ�����������˸----------------//
blinking instance_blink(clk2hz, state, blink);
//----------------����ģ��----------------//
alarm instance_alarm(clk1hz, hour, min, ahour, amin, sound);
//----------------����ʮ����ת����BCD��----------------//
transferToBCD instance_secBCD(sec, qsh, qsl);
transferToBCD instance_csecBCD(countsec, cqsh, cqsl);
//----------------����ʮ����ת����BCD��----------------//
transferToBCD instance_minBCD(min, qmh, qml);
transferToBCD instance_cminBCD(countmin, cqmh, cqml);
transferToBCD instance_aminBCD(amin, aqmh, aqml);
//----------------Сʱʮ����ת����BCD��----------------//
transferToBCD instance_hourBCD(hour, qhh, qhl);
transferToBCD instance_chourBCD(counthour, cqhh, cqhl);
transferToBCD instance_ahourBCD(ahour, aqhh, aqhl);
//----------------����ܶ�̬ɨ��----------------//
scanning instance_scanning(state, cnt, qhh, qhl, qmh, qml, qsh, qsl,cqhh, cqhl, cqmh, cqml, cqsh, cqsl,aqmh, aqml, aqhh, aqhl, blink, data, scan);
//----------------7������----------------//
seg7 instance_seg7(data, seg);
endmodule
