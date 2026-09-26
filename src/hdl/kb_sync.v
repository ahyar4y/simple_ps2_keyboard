`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/14/2026 11:28:41 AM
// Design Name: 
// Module Name: kb_sync
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


module kb_sync(
    input wire clk,
    input wire reset,
    input wire kb_clk,
    output reg kb_negedge_o
    );
    
    reg previous_value;
    
    always @(posedge clk) begin
        kb_negedge_o <= (previous_value == 1'b1) & (kb_clk == 1'b0);
        previous_value <= kb_clk;
    end
endmodule
