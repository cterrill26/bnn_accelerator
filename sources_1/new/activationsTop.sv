`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/24/2021 03:03:24 PM
// Design Name: 
// Module Name: activationsTop
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


module activationsTop(
    input s_en, 
    output logic [31:0] s_dout,
    input [31:0] s_din,
    input [3:0] s_we,
    input [16:0] s_addr,
    input clk, resetn, start,
    input [4:0] last_row,
    input [10:0] addr_start, 
    input [5:0] batch,
    output [32*16-1:0] activation_in,
    output [32-1:0] activation_in_valid
    );
    
    logic [31:0][16:0] read_data;
    
    logic s_en1, s_en2;
    logic [3:0] s_addr1, s_addr2;
    logic [32:0] propogate_start;
    
    assign propogate_start[32] = 0;
    
    always_ff @(posedge clk) begin
        s_en1 <= s_en;
        s_en2 <= s_en1;
        s_addr1 <= s_addr[5:2];
        s_addr2 <= s_addr1;       
        if(s_en2) 
            s_dout <= {read_data[2*s_addr2+1], read_data[2*s_addr2]};        
    end
    
    generate
        for(genvar i = 0; i < 32; i += 1) begin : GEN_ACTIVATIONSMEM
            activationsMem activationsMem(
                .clk(clk),
                .resetn(resetn),
                .s_addr(s_addr[16:6]),
                .s_din(s_din[(i%2)*16+:16]),
                .s_dout(read_data[i]),
                .s_we(|s_we[(i%2)*2+:2]),
                .s_en(s_en && (s_addr[5:2] == i/2)),
                .addr_start(addr_start),
                .start((start && (last_row == i)) || propogate_start[i+1]),
                .propogate_start(propogate_start[i]),
                .batch(batch),
                .activation_in(activation_in[i*16+:16]),
                .activation_in_valid(activation_in_valid[i])
            );
        end
    endgenerate
    
endmodule
