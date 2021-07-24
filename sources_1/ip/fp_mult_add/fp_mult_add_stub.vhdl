-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
-- Date        : Fri Jul 23 21:54:51 2021
-- Host        : LAPTOP-RDE5N9E1 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Users/cdter/Documents/UCLA/cs/259/bnn_accelerator_project/bnn_accelerator_project.srcs/sources_1/ip/fp_mult_add/fp_mult_add_stub.vhdl
-- Design      : fp_mult_add
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xczu7ev-ffvc1156-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fp_mult_add is
  Port ( 
    s_axis_a_tvalid : in STD_LOGIC;
    s_axis_a_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_b_tvalid : in STD_LOGIC;
    s_axis_b_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_c_tvalid : in STD_LOGIC;
    s_axis_c_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_result_tvalid : out STD_LOGIC;
    m_axis_result_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );

end fp_mult_add;

architecture stub of fp_mult_add is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "s_axis_a_tvalid,s_axis_a_tdata[15:0],s_axis_b_tvalid,s_axis_b_tdata[15:0],s_axis_c_tvalid,s_axis_c_tdata[15:0],m_axis_result_tvalid,m_axis_result_tdata[15:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "floating_point_v7_1_10,Vivado 2020.1";
begin
end;
