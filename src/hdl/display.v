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
    input wire [9:0]char_i,
    output reg [7:0]display_o = 0
    );

    always @(negedge reset) begin
        display_o <= 10'b0;
    end
    
    always @(valid) begin
        if (valid)
            display_o = char_i[7:0];
    end
endmodule
