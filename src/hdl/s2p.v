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
    output reg [7:0]char_o
    );
    
    reg [1:0]state = 2'b00;
    reg [9:0]shift_reg = 10'b0;
    reg [3:0]count = 0;
    
    always @(posedge clk or negedge reset) begin
        if (!reset) begin
                count <= 0;
                valid_o <= 0;
                shift_reg <= 0;
                char_o <= 0;
                state <= 0;
            end
        else begin
            valid_o <= 0;
            
            case (state)
            2'b00: begin
                if (kb_negedge & !kb_data)
                    state <= 2'b01;
                    
                count <= 0;
                shift_reg <= 0;
                char_o <= 0;
            end
            2'b01: begin
                if (kb_negedge) begin
                    shift_reg <= {kb_data, shift_reg[9:1]};
                    count <= count + 1;
                    
                    if (count == 9) begin
                        state <= 2'b00;
                        
                        if (kb_data == 1'b1) begin
                            char_o <= shift_reg[8:1];
                            valid_o <= 1'b1;
                        end
                    end 
                end
            end
            endcase
        end
    end
endmodule
