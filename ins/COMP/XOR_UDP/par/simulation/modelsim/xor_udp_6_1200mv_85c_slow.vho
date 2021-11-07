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

-- DATE "11/06/2021 15:08:17"

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

ENTITY 	xor_udp IS
    PORT (
	DOUT : OUT std_logic;
	X1 : IN std_logic;
	X2 : IN std_logic
	);
END xor_udp;

-- Design Ports Information
-- DOUT	=>  Location: PIN_A7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- X1	=>  Location: PIN_A8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- X2	=>  Location: PIN_A12,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF xor_udp IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_DOUT : std_logic;
SIGNAL ww_X1 : std_logic;
SIGNAL ww_X2 : std_logic;
SIGNAL \DOUT~output_o\ : std_logic;
SIGNAL \X2~input_o\ : std_logic;
SIGNAL \X1~input_o\ : std_logic;
SIGNAL \comb~0_combout\ : std_logic;

BEGIN

DOUT <= ww_DOUT;
ww_X1 <= X1;
ww_X2 <= X2;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

-- Location: IOOBUF_X12_Y31_N2
\DOUT~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \comb~0_combout\,
	devoe => ww_devoe,
	o => \DOUT~output_o\);

-- Location: IOIBUF_X20_Y31_N8
\X2~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_X2,
	o => \X2~input_o\);

-- Location: IOIBUF_X12_Y31_N8
\X1~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_X1,
	o => \X1~input_o\);

-- Location: LCCOMB_X12_Y30_N0
\comb~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \comb~0_combout\ = \X2~input_o\ $ (\X1~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \X2~input_o\,
	datad => \X1~input_o\,
	combout => \comb~0_combout\);

ww_DOUT <= \DOUT~output_o\;
END structure;


