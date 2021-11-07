-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.1.0 Build 162 10/23/2013 SJ Full Version"

-- DATE "11/06/2021 15:10:11"

-- 
-- Device: Altera EP4CGX15BF14C6 Package FBGA169
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEIV;
LIBRARY IEEE;
USE CYCLONEIV.CYCLONEIV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	h_adder1_udp IS
    PORT (
	ain : IN std_logic;
	bin : IN std_logic;
	cin : IN std_logic;
	sout : BUFFER std_logic;
	cout : BUFFER std_logic
	);
END h_adder1_udp;

-- Design Ports Information
-- cin	=>  Location: PIN_A6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sout	=>  Location: PIN_N4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cout	=>  Location: PIN_M6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ain	=>  Location: PIN_N10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- bin	=>  Location: PIN_L4,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF h_adder1_udp IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_ain : std_logic;
SIGNAL ww_bin : std_logic;
SIGNAL ww_cin : std_logic;
SIGNAL ww_sout : std_logic;
SIGNAL ww_cout : std_logic;
SIGNAL \cin~input_o\ : std_logic;
SIGNAL \sout~output_o\ : std_logic;
SIGNAL \cout~output_o\ : std_logic;
SIGNAL \ain~input_o\ : std_logic;
SIGNAL \bin~input_o\ : std_logic;
SIGNAL \U1|DOUT~0_combout\ : std_logic;
SIGNAL \U2~combout\ : std_logic;

BEGIN

ww_ain <= ain;
ww_bin <= bin;
ww_cin <= cin;
sout <= ww_sout;
cout <= ww_cout;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

-- Location: IOOBUF_X10_Y0_N9
\sout~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U1|DOUT~0_combout\,
	devoe => ww_devoe,
	o => \sout~output_o\);

-- Location: IOOBUF_X12_Y0_N9
\cout~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U2~combout\,
	devoe => ww_devoe,
	o => \cout~output_o\);

-- Location: IOIBUF_X26_Y0_N8
\ain~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ain,
	o => \ain~input_o\);

-- Location: IOIBUF_X8_Y0_N8
\bin~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_bin,
	o => \bin~input_o\);

-- Location: LCCOMB_X10_Y1_N8
\U1|DOUT~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \U1|DOUT~0_combout\ = \ain~input_o\ $ (\bin~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \ain~input_o\,
	datad => \bin~input_o\,
	combout => \U1|DOUT~0_combout\);

-- Location: LCCOMB_X10_Y1_N10
U2 : cycloneiv_lcell_comb
-- Equation(s):
-- \U2~combout\ = (\ain~input_o\ & \bin~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \ain~input_o\,
	datad => \bin~input_o\,
	combout => \U2~combout\);

-- Location: IOIBUF_X10_Y31_N1
\cin~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_cin,
	o => \cin~input_o\);

ww_sout <= \sout~output_o\;

ww_cout <= \cout~output_o\;
END structure;


