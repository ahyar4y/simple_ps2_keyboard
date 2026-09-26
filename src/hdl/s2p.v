`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/14/2026 02:36:05 PM
// Design Name: 
// Module Name: s2p
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


module s2p(
    input wire clk,
    input wire reset,
    input wire kb_negedge,
    input wire kb_data,
    output reg valid_o,
    output reg [9:0]char_o
    );
    
    reg [1:0]state = 2'b00;
    reg [3:0]count = 0;
    
    always @(state or kb_negedge) begin
        case (state)
        2'b00:
              count = 0;
        2'b10: 
            if (kb_negedge) begin
                char_o = {kb_data, char_o[9:1]};
                count = count + 1;
            end
        endcase
    end
    
    always @(posedge kb_negedge) begin
        if (!reset)
            state <= 2'b00;
        else
            case (state)
            2'b00: //idle
                if (!kb_data) begin
                    state <= 2'b01;
                    char_o <= 10'b0;
                end
            2'b01: //start
                state <= 2'b10;
            2'b10: //receive
                if (count == 10) begin
                    state <= 2'b00;
                    valid_o <= char_o[9:9] == 1'b1;
                end else
                    valid_o <= 0;
            endcase
    end
endmodule
