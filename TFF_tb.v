`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/30/2026 08:53:51 AM
// Design Name: 
// Module Name: TFF_tb
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


module TFF_tb;
    reg clk, rstn, enable;
    wire [2:0] count;

    counter dut (.clk(clk),.rstn(rstn),.enable(enable),.count(count));

    always #5 clk = ~clk;

    initial begin
        clk = 0; 
        rstn = 0; 
        enable = 0;
        
        #12 rstn = 1;
        #10 enable = 1;
        #90; 
        enable = 0;
        #20;
        enable = 1;
        #40;
        $finish;
    end
endmodule
