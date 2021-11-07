# Copyright (C) 1991-2013 Altera Corporation
# Your use of Altera Corporation's design tools, logic functions 
# and other software and tools, and its AMPP partner logic 
# functions, and any output files from any of the foregoing 
# (including device programming or simulation files), and any 
# associated documentation or information are expressly subject 
# to the terms and conditions of the Altera Program License 
# Subscription Agreement, Altera MegaCore Function License 
# Agreement, or other applicable license agreement, including, 
# without limitation, that your use is for the sole purpose of 
# programming logic devices manufactured by Altera and sold by 
# Altera or its authorized distributors.  Please refer to the 
# applicable agreement for further details.

# Quartus II 64-Bit Version 13.1.0 Build 162 10/23/2013 SJ Full Version
# File: D:\KAITUOZHE\1_Verilog\6_seg_led_dynamic\doc\top_seg_led.tcl
# Generated on: Mon May 24 16:44:23 2021

package require ::quartus::project

set_location_assignment PIN_M2 -to sys_clk
set_location_assignment PIN_M1 -to sys_rst_n
set_location_assignment PIN_M11 -to seg_led[0]
set_location_assignment PIN_N12 -to seg_led[1]
set_location_assignment PIN_C9 -to seg_led[2]
set_location_assignment PIN_N13 -to seg_led[3]
set_location_assignment PIN_M10 -to seg_led[4]
set_location_assignment PIN_N11 -to seg_led[5]
set_location_assignment PIN_P11 -to seg_led[6]
set_location_assignment PIN_D9 -to seg_led[7]
set_location_assignment PIN_T15 -to seg_sel[5]
set_location_assignment PIN_R16 -to seg_sel[4]
set_location_assignment PIN_P15 -to seg_sel[3]
set_location_assignment PIN_P16 -to seg_sel[2]
set_location_assignment PIN_N15 -to seg_sel[1]
set_location_assignment PIN_N16 -to seg_sel[0]
