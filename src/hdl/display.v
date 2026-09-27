`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/14/2026 04:04:50 PM
// Design Name: 
// Module Name: display
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


module display(
    input wire clk,
    input wire reset,
    input wire valid,
    input wire [7:0]char_i,
    output reg [7:0]display_o = 0
    );
    
    always @(posedge clk or negedge reset) begin
        if (!reset)
            display_o <= 10'b0;
        else 
            if (valid)
                display_o <= char_i;
    end
endmodule
