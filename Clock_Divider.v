
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/30/2026 08:28:34 AM
// Design Name: 
// Module Name: Clock_Divider
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


module Clock_Divider (input  wire clock_in,input  wire rstn,output reg  clock_out);
    reg counter;
    always @(posedge clock_in or negedge rstn) begin
        if (!rstn) begin
            counter   <= 1'b0;
            clock_out <= 1'b0;
        end else begin
            if (counter == 1'b1) begin
                clock_out <= ~clock_out;  
                counter   <= 1'b0;
            end else begin
                counter   <= counter + 1'b1;
            end
        end
    end
endmodule
