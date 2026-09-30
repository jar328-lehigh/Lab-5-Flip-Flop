`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/30/2026 08:27:02 AM
// Design Name: 
// Module Name: SR_Latch_and_Flip_Flop
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


module SR_Latch(input S, input R, output Q, output Qbar);
    nor #1 N1(Q, R, Qbar);
    nor #1 N2(Qbar, S, Q);
endmodule

module SR_FF(input  wire clk, input  wire rst, input  wire S, input  wire R, output reg  Q, output wire Qbar);
    assign Qbar = ~Q;

    always @(posedge clk or posedge rst) begin
        if(rst) begin
            Q <= 1'b0;
        end else begin
            case ({S, R})
                2'b00: Q <= Q;        
                2'b01: Q <= 1'b0;     
                2'b10: Q <= 1'b1;     
                2'b11: Q <= 1'bx;     
            endcase
        end
    end
endmodule
