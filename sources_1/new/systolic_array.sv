`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/19/2021 01:03:08 AM
// Design Name: 
// Module Name: systolic_array
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


module systolic_array #(parameter ROWS = 32, parameter COLS = 32)(
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TDATA" *)
    input [31:0] s_axis_tdata, // Transfer Data (optional)
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TKEEP" *)
    input [2:0] s_axis_tkeep, // Transfer Null Byte Indicators (optional)
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TLAST" *)
    input s_axis_tlast, // Packet Boundary Indicator (optional)
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TVALID" *)
    input s_axis_tvalid, // Transfer valid (required)
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TREADY" *)
    output s_axis_tready, // Transfer ready (optional)
    input clk,
    input [ROWS-1:0][15:0] activation_in,
    input [ROWS-1:0] activation_in_valid,
    input [$clog2(ROWS)-1:0] last_row,
    input [$clog2(COLS)-1:0] last_col,
    output logic [COLS-1:0][15:0] partialsum_out,
    output logic [COLS-1:0] partialsum_out_valid
    );
    
    logic [ROWS-1:0][COLS:0] activation_valid;
    logic [ROWS-1:0][COLS:0][15:0] activation;
    logic [ROWS:0][COLS-1:0] partialsum_valid;
    logic [ROWS:0][COLS-1:0][15:0] partialsum;
    logic [ROWS-1:0][COLS-1:0][15:0] weight;
    
    always_comb begin
        for(int i = 0; i < ROWS; i += 1) begin
            activation_valid[i][0] = activation_in_valid[i];
            activation[i][0] = activation_in[i];
        end
        
        for(int i = 0; i < COLS; i += 1) begin
            partialsum_valid[ROWS][i] = 0;
            partialsum[ROWS][i] = 0;
            partialsum_out_valid[i] = partialsum_valid[0][i];
            partialsum_out[i] = partialsum[0][i];
        end    
    end
    
    generate
        for(genvar i = 0; i < ROWS; i += 1) begin : GEN_ROWS
            for(genvar j = 0; j < COLS; j += 1) begin : GEN_COLS
                array_element array_element(
                    .clk(clk), 
                    .element_on((i <= last_row) && (j <= last_col)), 
                    .activation_in_valid(activation_valid[i][j]), 
                    .partialsum_in_valid(partialsum_valid[i+1][j]),
                    .activation_in(activation[i][j]),
                    .partialsum_in(partialsum[i+1][j]),
                    .weight(weight[i][j]),
                    .activation_out_valid(activation_valid[i][j+1]), 
                    .partialsum_out_valid(partialsum_valid[i][j]),
                    .activation_out(activation[i][j+1]),
                    .partialsum_out(partialsum[i][j])
                    );    
            end
        end
    endgenerate 
    
endmodule
