
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/30/2026 08:28:02 AM
// Design Name: 
// Module Name: TFF
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


module TFF (input  wire clk,input  wire rstn,input  wire t,output reg  q);
    always @(posedge clk) begin
        if (!rstn)
            q <= 1'b0;
        else if (t)
            q <= ~q;
        else 
            q <= q;
    end
endmodule

module counter (input  wire clk,input  wire rstn,input  wire enable,output wire [2:0] count);
    wire t0;
    wire t1;
    wire t2;

    assign t0 = enable;
    assign t1 = enable & count[0];
    assign t2 = enable & count[0] & count[1];

    TFF num_0 (.clk(clk), .rstn(rstn), .t(t0), .q(count[0]));
    TFF num_1 (.clk(clk), .rstn(rstn), .t(t1), .q(count[1]));
    TFF num_2 (.clk(clk), .rstn(rstn), .t(t2), .q(count[2]));
endmodule
