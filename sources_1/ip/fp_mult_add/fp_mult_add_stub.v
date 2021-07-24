// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
// Date        : Fri Jul 23 21:54:51 2021
// Host        : LAPTOP-RDE5N9E1 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/cdter/Documents/UCLA/cs/259/bnn_accelerator_project/bnn_accelerator_project.srcs/sources_1/ip/fp_mult_add/fp_mult_add_stub.v
// Design      : fp_mult_add
// Purpose     : Stub declaration of top-level module interface
// Device      : xczu7ev-ffvc1156-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "floating_point_v7_1_10,Vivado 2020.1" *)
module fp_mult_add(s_axis_a_tvalid, s_axis_a_tdata, 
  s_axis_b_tvalid, s_axis_b_tdata, s_axis_c_tvalid, s_axis_c_tdata, m_axis_result_tvalid, 
  m_axis_result_tdata)
/* synthesis syn_black_box black_box_pad_pin="s_axis_a_tvalid,s_axis_a_tdata[15:0],s_axis_b_tvalid,s_axis_b_tdata[15:0],s_axis_c_tvalid,s_axis_c_tdata[15:0],m_axis_result_tvalid,m_axis_result_tdata[15:0]" */;
  input s_axis_a_tvalid;
  input [15:0]s_axis_a_tdata;
  input s_axis_b_tvalid;
  input [15:0]s_axis_b_tdata;
  input s_axis_c_tvalid;
  input [15:0]s_axis_c_tdata;
  output m_axis_result_tvalid;
  output [15:0]m_axis_result_tdata;
endmodule
