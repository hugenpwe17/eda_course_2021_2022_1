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

-- DATE "11/06/2021 18:43:45"

-- 
-- Device: Altera EP4CE10F17C8 Package FBGA256
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	seg_8_hex_led IS
    PORT (
	cnt4 : IN std_logic_vector(3 DOWNTO 0);
	seg : BUFFER std_logic_vector(7 DOWNTO 0)
	);
END seg_8_hex_led;

-- Design Ports Information
-- seg[0]	=>  Location: PIN_P3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg[1]	=>  Location: PIN_A3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg[2]	=>  Location: PIN_A6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg[3]	=>  Location: PIN_P6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg[4]	=>  Location: PIN_N3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg[5]	=>  Location: PIN_N6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg[6]	=>  Location: PIN_K12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg[7]	=>  Location: PIN_E10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cnt4[0]	=>  Location: PIN_F5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cnt4[1]	=>  Location: PIN_N1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cnt4[2]	=>  Location: PIN_K6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cnt4[3]	=>  Location: PIN_E1,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF seg_8_hex_led IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_cnt4 : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_seg : std_logic_vector(7 DOWNTO 0);
SIGNAL \seg[0]~output_o\ : std_logic;
SIGNAL \seg[1]~output_o\ : std_logic;
SIGNAL \seg[2]~output_o\ : std_logic;
SIGNAL \seg[3]~output_o\ : std_logic;
SIGNAL \seg[4]~output_o\ : std_logic;
SIGNAL \seg[5]~output_o\ : std_logic;
SIGNAL \seg[6]~output_o\ : std_logic;
SIGNAL \seg[7]~output_o\ : std_logic;
SIGNAL \cnt4[3]~input_o\ : std_logic;
SIGNAL \cnt4[1]~input_o\ : std_logic;
SIGNAL \cnt4[2]~input_o\ : std_logic;
SIGNAL \cnt4[0]~input_o\ : std_logic;
SIGNAL \Decoder0~0_combout\ : std_logic;
SIGNAL \seg~0_combout\ : std_logic;
SIGNAL \ALT_INV_seg~0_combout\ : std_logic;
SIGNAL \ALT_INV_Decoder0~0_combout\ : std_logic;

BEGIN

ww_cnt4 <= cnt4;
seg <= ww_seg;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_seg~0_combout\ <= NOT \seg~0_combout\;
\ALT_INV_Decoder0~0_combout\ <= NOT \Decoder0~0_combout\;

-- Location: IOOBUF_X1_Y0_N16
\seg[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_Decoder0~0_combout\,
	devoe => ww_devoe,
	o => \seg[0]~output_o\);

-- Location: IOOBUF_X3_Y24_N16
\seg[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_seg~0_combout\,
	devoe => ww_devoe,
	o => \seg[1]~output_o\);

-- Location: IOOBUF_X9_Y24_N16
\seg[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_seg~0_combout\,
	devoe => ww_devoe,
	o => \seg[2]~output_o\);

-- Location: IOOBUF_X7_Y0_N2
\seg[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_Decoder0~0_combout\,
	devoe => ww_devoe,
	o => \seg[3]~output_o\);

-- Location: IOOBUF_X1_Y0_N23
\seg[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_Decoder0~0_combout\,
	devoe => ww_devoe,
	o => \seg[4]~output_o\);

-- Location: IOOBUF_X7_Y0_N16
\seg[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_Decoder0~0_combout\,
	devoe => ww_devoe,
	o => \seg[5]~output_o\);

-- Location: IOOBUF_X34_Y3_N16
\seg[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \seg[6]~output_o\);

-- Location: IOOBUF_X28_Y24_N23
\seg[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \seg[7]~output_o\);

-- Location: IOIBUF_X0_Y11_N8
\cnt4[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_cnt4(3),
	o => \cnt4[3]~input_o\);

-- Location: IOIBUF_X0_Y7_N22
\cnt4[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_cnt4(1),
	o => \cnt4[1]~input_o\);

-- Location: IOIBUF_X0_Y9_N1
\cnt4[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_cnt4(2),
	o => \cnt4[2]~input_o\);

-- Location: IOIBUF_X0_Y23_N15
\cnt4[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_cnt4(0),
	o => \cnt4[0]~input_o\);

-- Location: LCCOMB_X1_Y11_N24
\Decoder0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Decoder0~0_combout\ = (!\cnt4[3]~input_o\ & (!\cnt4[1]~input_o\ & (!\cnt4[2]~input_o\ & !\cnt4[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \cnt4[3]~input_o\,
	datab => \cnt4[1]~input_o\,
	datac => \cnt4[2]~input_o\,
	datad => \cnt4[0]~input_o\,
	combout => \Decoder0~0_combout\);

-- Location: LCCOMB_X1_Y11_N18
\seg~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \seg~0_combout\ = (!\cnt4[1]~input_o\ & (!\cnt4[2]~input_o\ & !\cnt4[3]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \cnt4[1]~input_o\,
	datac => \cnt4[2]~input_o\,
	datad => \cnt4[3]~input_o\,
	combout => \seg~0_combout\);

ww_seg(0) <= \seg[0]~output_o\;

ww_seg(1) <= \seg[1]~output_o\;

ww_seg(2) <= \seg[2]~output_o\;

ww_seg(3) <= \seg[3]~output_o\;

ww_seg(4) <= \seg[4]~output_o\;

ww_seg(5) <= \seg[5]~output_o\;

ww_seg(6) <= \seg[6]~output_o\;

ww_seg(7) <= \seg[7]~output_o\;
END structure;


