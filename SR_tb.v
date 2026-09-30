`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/30/2026 08:45:13 AM
// Design Name: 
// Module Name: SR_tb
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


module SR_tb;

    reg clk, rst, S, R;
    wire q_latch, qbar_latch;
    wire q_ff, qbar_ff;

    SR_Latch dut1 (.S(S), .R(R), .Q(q_latch), .Qbar(qbar_latch));
    SR_FF dut2(.clk(clk), .rst(rst), .S(S), .R(R), .Q(q_ff), .Qbar(qbar_ff));
    
    
    initial begin
        clk=0;
        forever #10 clk=~clk;
    end
    
    initial begin
        rst = 1;S = 0;R = 0;
        #25; rst = 0;
        #20; S = 1; R = 0;
        #40; S = 0; R = 0;
        #40; S = 0; R = 1;
        #40; S = 0; R = 0;
        #40; S = 1; R = 1;
        #40; S = 0; R = 0;
        #50; $finish; 
   end
    
endmodule
