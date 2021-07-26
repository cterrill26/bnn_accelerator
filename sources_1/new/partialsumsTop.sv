`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/25/2021 02:56:40 PM
// Design Name: 
// Module Name: partialsumsTop
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


module partialsumsTop(
    input s_en, // Chip Enable Signal (optional)
    output [511:0] s_dout, // Data Out Bus (optional)
    input [16:0] s_addr, // Address Signal (required)
    input clk, resetn, start, accumulate,
    input [10:0] address_start,
    input [5:0] batch,
    input [32*16-1:0] partialsum_out,
    input [32-1:0] partialsum_out_valid,
    input [4:0] last_col,
    output done
    );
    
    generate 
        for(genvar i = 0; i < 32; i += 1) begin : GEN_PARTIALSUMSMEM
            partialsumsMem partialsumsMem(
                .clk(clk),
                .resetn(resetn),
                .start(start),
            
            );
        end
    endgenerate
    
endmodule
