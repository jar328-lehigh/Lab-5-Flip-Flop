`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/30/2026 08:40:27 AM
// Design Name: 
// Module Name: DFF_tb
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


module DFF_tb;
    reg clk;
    reg d;
    reg rstn;
    reg [2:0] delay;
    wire q_sync;
    wire q_async;
    integer i; 
    dff_sync  dut_sync  (.d(d), .rstn(rstn), .clk(clk), .q(q_sync));
    dff_async dut_async (.d(d), .rstn(rstn), .clk(clk), .q(q_async));
    
    always #10 clk = ~clk;
    
    initial begin
        clk = 0;d = 0; rstn = 0;
        
        #15 d = 1;
        #10 rstn = 1;
        
        for (i = 0; i < 5; i = i + 1) begin
            delay = $random;
            #(delay) d = i[0]; 
        end
       
        #15 d = 1;
        #7  rstn = 0; 
        #15 rstn = 1;
        #40 $finish;
    end
endmodule
