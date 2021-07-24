`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/24/2021 01:57:08 PM
// Design Name: 
// Module Name: registers
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


module registers(
    (* X_INTERFACE_INFO = "xilinx.com:interface:apb:1.0 APB_S PADDR" *)
    input [31:0] s_apb_paddr, // Address (required)
    (* X_INTERFACE_INFO = "xilinx.com:interface:apb:1.0 APB_S PSEL" *)
    input s_apb_psel, // Slave Select (required)
    (* X_INTERFACE_INFO = "xilinx.com:interface:apb:1.0 APB_S PENABLE" *)
    input s_apb_penable, // Enable (required)
    (* X_INTERFACE_INFO = "xilinx.com:interface:apb:1.0 APB_S PWRITE" *)
    input s_apb_pwrite, // Write Control (required)
    (* X_INTERFACE_INFO = "xilinx.com:interface:apb:1.0 APB_S PWDATA" *)
    input [31:0] s_apb_pwdata, // Write Data (required)
    (* X_INTERFACE_INFO = "xilinx.com:interface:apb:1.0 APB_S PREADY" *)
    output s_apb_pready, // Slave Ready (required)
    (* X_INTERFACE_INFO = "xilinx.com:interface:apb:1.0 APB_S PRDATA" *)
    output [31:0] s_apb_prdata, // Read Data (required)
    (* X_INTERFACE_INFO = "xilinx.com:interface:apb:1.0 APB_S PSLVERR" *)
    output reg s_apb_pslverr, // Slave Error Response (required)
    input clk, resetn,
    output reg weight_transfer,
    output reg [4:0] last_row, last_col
    );
    
    //address 0x0 write a 1 to transfer buffered weights
    //address 0x4 write the last active row of the systolic array
    //address 0x8 write the last active column of the systolic array
    
    localparam NUM_STATES = 2;
    localparam IDLE = 1;
    localparam RESPONDED = 2;
    
    assign s_apb_pready = 1;
    assign s_apb_prdata = 0; //these are write only registers
 
    reg [NUM_STATES-1:0] state;
    
    always @ (posedge clk) begin
        if (resetn) begin
            weight_transfer <= 0;
            last_row <= 0;
            last_col <= 0;
            state <= IDLE;
            s_apb_pslverr <= 0;
        end
        else begin
            weight_transfer <= (state == IDLE) && (s_apb_paddr[4:2] == 0) && s_apb_psel && s_apb_pwrite && s_apb_prdata[0];
            
            if((state == IDLE) && (s_apb_paddr[4:2] == 1) && s_apb_psel && s_apb_pwrite)
                last_row <= s_apb_prdata[4:0];
            
            if((state == IDLE) && (s_apb_paddr[4:2] == 2) && s_apb_psel && s_apb_pwrite)
                last_col <= s_apb_prdata[4:0];
            
            if (state == IDLE && s_apb_psel)
                state <= RESPONDED;
            else
                state <= IDLE;
            
            if (state == IDLE && s_apb_psel && !s_apb_pwrite)
                s_apb_pslverr <= 1;
            else
                s_apb_pslverr <= 0;
        end
    end
    
    
    
endmodule
