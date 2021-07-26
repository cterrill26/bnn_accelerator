`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/26/2021 01:40:42 PM
// Design Name: 
// Module Name: bnnTop_tb
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


module bnnTop_tb(

    );
    
    logic [31:0]M00_AXI_araddr;
    logic [1:0]M00_AXI_arburst;
    logic [3:0]M00_AXI_arcache;
    logic [7:0]M00_AXI_arlen;
    logic [0:0]M00_AXI_arlock;
    logic [2:0]M00_AXI_arprot;
    logic [3:0]M00_AXI_arqos;
    logic [0:0]M00_AXI_arready;
    logic [3:0]M00_AXI_arregion;
    logic [2:0]M00_AXI_arsize;
    logic [0:0]M00_AXI_arvalid;
//    logic [31:0]M00_AXI_awaddr;
//    logic [1:0]M00_AXI_awburst;
//    logic [3:0]M00_AXI_awcache;
//    logic [7:0]M00_AXI_awlen;
//    logic [0:0]M00_AXI_awlock;
//    logic [2:0]M00_AXI_awprot;
//    logic [3:0]M00_AXI_awqos;
//    logic [0:0]M00_AXI_awready;
//    logic [3:0]M00_AXI_awregion;
//    logic [2:0]M00_AXI_awsize;
//    logic [0:0]M00_AXI_awvalid;
//    logic [0:0]M00_AXI_bready;
//    logic [1:0]M00_AXI_bresp;
//    logic [0:0]M00_AXI_bvalid;
    logic [31:0]M00_AXI_rdata;
    logic [0:0]M00_AXI_rlast;
    logic [0:0]M00_AXI_rready;
    logic [1:0]M00_AXI_rresp;
    logic [0:0]M00_AXI_rvalid;
//    logic [31:0]M00_AXI_wdata;
//    logic [0:0]M00_AXI_wlast;
//    logic [0:0]M00_AXI_wready;
//    logic [3:0]M00_AXI_wstrb;
//    logic [0:0]M00_AXI_wvalid;
    logic [31:0]S_AXI_LITE_araddr;
    logic [2:0]S_AXI_LITE_arprot;
    logic [0:0]S_AXI_LITE_arready;
    logic [0:0]S_AXI_LITE_arvalid;
    logic [31:0]S_AXI_LITE_awaddr;
    logic [2:0]S_AXI_LITE_awprot;
    logic [0:0]S_AXI_LITE_awready;
    logic [0:0]S_AXI_LITE_awvalid;
    logic [0:0]S_AXI_LITE_bready;
    logic [1:0]S_AXI_LITE_bresp;
    logic [0:0]S_AXI_LITE_bvalid;
    logic [31:0]S_AXI_LITE_rdata;
    logic [0:0]S_AXI_LITE_rready;
    logic [1:0]S_AXI_LITE_rresp;
    logic [0:0]S_AXI_LITE_rvalid;
    logic [31:0]S_AXI_LITE_wdata;
    logic [0:0]S_AXI_LITE_wready;
    logic [3:0]S_AXI_LITE_wstrb;
    logic [0:0]S_AXI_LITE_wvalid;
    logic clk;
    logic interrupt_0_interrupt;
    logic resetn;
    
    bnnTop_min DUT(
        .M00_AXI_araddr(M00_AXI_araddr),
        .M00_AXI_arburst(M00_AXI_arburst),
        .M00_AXI_arcache(M00_AXI_arcache),
        .M00_AXI_arlen(M00_AXI_arlen),
        .M00_AXI_arlock(M00_AXI_arlock),
        .M00_AXI_arprot(M00_AXI_arprot),
        .M00_AXI_arqos(M00_AXI_arqos),
        .M00_AXI_arready(M00_AXI_arready),
        .M00_AXI_arregion(M00_AXI_arregion),
        .M00_AXI_arsize(M00_AXI_arsize),
        .M00_AXI_arvalid(M00_AXI_arvalid),
//        .M00_AXI_awaddr(M00_AXI_awaddr),
//        .M00_AXI_awburst(M00_AXI_awburst),
//        .M00_AXI_awcache(M00_AXI_awcache),
//        .M00_AXI_awlen(M00_AXI_awlen),
//        .M00_AXI_awlock(M00_AXI_awlock),
//        .M00_AXI_awprot(M00_AXI_awprot),
//        .M00_AXI_awqos(M00_AXI_awqos),
//        .M00_AXI_awready(M00_AXI_awready),
//        .M00_AXI_awregion(M00_AXI_awregion),
//        .M00_AXI_awsize(M00_AXI_awsize),
//        .M00_AXI_awvalid(M00_AXI_awvalid),
//        .M00_AXI_bready(M00_AXI_bready),
//        .M00_AXI_bresp(M00_AXI_bresp),
//        .M00_AXI_bvalid(M00_AXI_bvalid),
        .M00_AXI_rdata(M00_AXI_rdata),
        .M00_AXI_rlast(M00_AXI_rlast),
        .M00_AXI_rready(M00_AXI_rready),
        .M00_AXI_rresp(M00_AXI_rresp),
        .M00_AXI_rvalid(M00_AXI_rvalid),
//        .M00_AXI_wdata(M00_AXI_wdata),
//        .M00_AXI_wlast(M00_AXI_wlast),
//        .M00_AXI_wready(M00_AXI_wready),
//        .M00_AXI_wstrb(M00_AXI_wstrb),
//        .M00_AXI_wvalid(M00_AXI_wvalid),
        .S_AXI_LITE_araddr(S_AXI_LITE_araddr),
        .S_AXI_LITE_arprot(S_AXI_LITE_arprot),
        .S_AXI_LITE_arready(S_AXI_LITE_arready),
        .S_AXI_LITE_arvalid(S_AXI_LITE_arvalid),
        .S_AXI_LITE_awaddr(S_AXI_LITE_awaddr),
        .S_AXI_LITE_awprot(S_AXI_LITE_awprot),
        .S_AXI_LITE_awready(S_AXI_LITE_awready),
        .S_AXI_LITE_awvalid(S_AXI_LITE_awvalid),
        .S_AXI_LITE_bready(S_AXI_LITE_bready),
        .S_AXI_LITE_bresp(S_AXI_LITE_bresp),
        .S_AXI_LITE_bvalid(S_AXI_LITE_bvalid),
        .S_AXI_LITE_rdata(S_AXI_LITE_rdata),
        .S_AXI_LITE_rready(S_AXI_LITE_rready),
        .S_AXI_LITE_rresp(S_AXI_LITE_rresp),
        .S_AXI_LITE_rvalid(S_AXI_LITE_rvalid),
        .S_AXI_LITE_wdata(S_AXI_LITE_wdata),
        .S_AXI_LITE_wready(S_AXI_LITE_wready),
        .S_AXI_LITE_wstrb(S_AXI_LITE_wstrb),
        .S_AXI_LITE_wvalid(S_AXI_LITE_wvalid),
        .clk(clk),
        .interrupt_0_interrupt(interrupt_0_interrupt),
        .resetn(resetn));
        
    parameter REGISTERS_BASE = 'hC0040000;
    
    task axi_lite_write;
        input [31:0] address;
        input [31:0] data;
        begin
            S_AXI_LITE_awaddr = address;
            S_AXI_LITE_awvalid = 1;
            S_AXI_LITE_awprot = 0;
            while (!S_AXI_LITE_awready) begin
                #10;
            end
            #10;
            S_AXI_LITE_awaddr = 0;
            S_AXI_LITE_awvalid = 0;
            S_AXI_LITE_awprot = 0;
            
            S_AXI_LITE_wdata = data;
            S_AXI_LITE_wvalid = 1;
            S_AXI_LITE_wstrb = 4'b1111;
            while (!S_AXI_LITE_wready) begin
                #10;
            end
            #10;
            S_AXI_LITE_wdata = 0;
            S_AXI_LITE_wvalid = 0;
            S_AXI_LITE_wstrb = 0;
            
            S_AXI_LITE_bready = 1;
            while (!S_AXI_LITE_bvalid) begin
                #10;
            end
            if(S_AXI_LITE_bresp != 0) begin
                $display("AXI-LITE Write Error");
            end
            #10; 
            S_AXI_LITE_bready = 0;
            #10;   
        end
    endtask
    
    always #5 clk = ~clk;
    
    initial begin
        M00_AXI_arready = 0;
//        M00_AXI_awready = 0;
//        M00_AXI_bresp = 0;
//        M00_AXI_bvalid = 0;
        M00_AXI_rdata = 0;
        M00_AXI_rlast = 0;
        M00_AXI_rresp = 0;
        M00_AXI_rvalid = 0; 
//        M00_AXI_wready = 0;
        S_AXI_LITE_araddr = 0;
        S_AXI_LITE_arprot = 0;
        S_AXI_LITE_arvalid = 0;
        S_AXI_LITE_awaddr = 0;
        S_AXI_LITE_awprot = 0;
        S_AXI_LITE_awvalid = 0;
        S_AXI_LITE_bready = 0;
        S_AXI_LITE_rready = 0;
        S_AXI_LITE_wdata = 0;
        S_AXI_LITE_wstrb = 0;
        S_AXI_LITE_wvalid = 0;
        clk = 0;
        resetn = 0;
        #100;
        resetn = 1;
        #100;
        axi_lite_write(REGISTERS_BASE + 'h14, 32'd63);
        
    end
    
    
endmodule
