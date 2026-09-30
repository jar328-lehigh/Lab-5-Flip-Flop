
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/30/2026 08:27:53 AM
// Design Name: 
// Module Name: DFF
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


module dff_sync(input d, rstn, clk, output reg q);
    always @ (posedge clk)
        if(!rstn)
            q<=0;
        else   
            q<=d;
endmodule

module dff_async(input d, rstn, clk, output reg q);
    always @ (posedge clk or negedge rstn)
        if(!rstn) 
            q<=0;
        else
            q<=d;
endmodule
