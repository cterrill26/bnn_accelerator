`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/24/2021 03:11:36 PM
// Design Name: 
// Module Name: activationsTop_wrapper
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


module activationsTop_wrapper(
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *)
    // Uncomment the following to set interface specific parameter on the bus interface.
    (* X_INTERFACE_PARAMETER = "MASTER_TYPE Stand Alone,MEM_ECC No ECC,MEM_WIDTH 32,MEM_SIZE 131072,READ_WRITE_MODE READ WRITE" *)
    input s_en, // Chip Enable Signal (optional)
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *)
    output [31:0] s_dout, // Data Out Bus (optional)
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *)
    input [31:0] s_din, // Data In Bus (optional)
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *)
    input [3:0] s_we, // Byte Enables (optional)
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *)
    input [16:0] s_addr, // Address Signal (required)
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *)
    input s_clk, // Clock Signal (required)
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORTA RST" *)
    input s_rst, // Reset Signal (required)
    input clk, resetn, start,
    input [10:0] addr_start, 
    input [5:0] batch,
    output [32*16-1:0] activation_in,
    output [32-1:0] activation_in_valid 
    );
    
    
    
endmodule
