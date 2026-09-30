`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/30/2026 09:11:14 AM
// Design Name: 
// Module Name: Clock_Divider_tb
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


module Clock_Divider_tb;
    reg clock_in;
    reg rstn;
    wire clock_out;

    Clock_Divider uut (.clock_in(clock_in),.rstn(rstn),.clock_out(clock_out));

    initial begin
        clock_in = 0;
        forever #5 clock_in = ~clock_in;
    end

    initial begin
        rstn = 0;       
        #15;
        rstn = 1;
        #400;          
        $finish;        
    end

endmodule
