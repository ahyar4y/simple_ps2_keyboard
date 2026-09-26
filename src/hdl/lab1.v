`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/14/2026 04:19:00 PM
// Design Name: 
// Module Name: lab1
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


module lab1(
    input sys_clk, 
    input reset, 
    input kb_clk, 
    input kb_data, 
    output [7:0]display_o
    );
    
    wire kb_negedge;
    wire valid;
    wire [9:0]char_o;
    
    kb_sync kb_sync1(
        .clk (sys_clk),
        .reset (reset),
        .kb_clk (kb_clk),
        .kb_negedge_o (kb_negedge)
        );
        
    s2p s2p1(
        .clk (sys_clk),
        .reset (reset),
        .kb_negedge (kb_negedge),
        .kb_data (kb_data),
        .valid_o (valid),
        .char_o (char_o)
        );
        
    display display1(
        .clk (sys_clk),
        .reset (reset),
        .valid (valid),
        .char_i (char_o),
        .display_o (display_o)
        );
endmodule
