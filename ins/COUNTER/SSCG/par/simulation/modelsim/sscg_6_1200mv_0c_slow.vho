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

-- DATE "11/06/2021 15:17:45"

-- 
-- Device: Altera EP4CGX15BF14C6 Package FBGA169
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIV;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIV.CYCLONEIV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	sscg IS
    PORT (
	clk : IN std_logic;
	rst_n : IN std_logic;
	load : IN std_logic;
	seq : BUFFER std_logic_vector(15 DOWNTO 0);
	Led : BUFFER std_logic_vector(4 DOWNTO 0)
	);
END sscg;

-- Design Ports Information
-- seq[0]	=>  Location: PIN_M11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seq[1]	=>  Location: PIN_G10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seq[2]	=>  Location: PIN_H12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seq[3]	=>  Location: PIN_F11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seq[4]	=>  Location: PIN_N11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seq[5]	=>  Location: PIN_F9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seq[6]	=>  Location: PIN_L11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seq[7]	=>  Location: PIN_K12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seq[8]	=>  Location: PIN_K10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seq[9]	=>  Location: PIN_K11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seq[10]	=>  Location: PIN_J13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seq[11]	=>  Location: PIN_M13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seq[12]	=>  Location: PIN_K13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seq[13]	=>  Location: PIN_L13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seq[14]	=>  Location: PIN_L9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seq[15]	=>  Location: PIN_N13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Led[0]	=>  Location: PIN_N12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Led[1]	=>  Location: PIN_G9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Led[2]	=>  Location: PIN_H10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Led[3]	=>  Location: PIN_F10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Led[4]	=>  Location: PIN_N10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- load	=>  Location: PIN_L12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_J7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rst_n	=>  Location: PIN_J6,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF sscg IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_rst_n : std_logic;
SIGNAL ww_load : std_logic;
SIGNAL ww_seq : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_Led : std_logic_vector(4 DOWNTO 0);
SIGNAL \rst_n~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \seq[0]~output_o\ : std_logic;
SIGNAL \seq[1]~output_o\ : std_logic;
SIGNAL \seq[2]~output_o\ : std_logic;
SIGNAL \seq[3]~output_o\ : std_logic;
SIGNAL \seq[4]~output_o\ : std_logic;
SIGNAL \seq[5]~output_o\ : std_logic;
SIGNAL \seq[6]~output_o\ : std_logic;
SIGNAL \seq[7]~output_o\ : std_logic;
SIGNAL \seq[8]~output_o\ : std_logic;
SIGNAL \seq[9]~output_o\ : std_logic;
SIGNAL \seq[10]~output_o\ : std_logic;
SIGNAL \seq[11]~output_o\ : std_logic;
SIGNAL \seq[12]~output_o\ : std_logic;
SIGNAL \seq[13]~output_o\ : std_logic;
SIGNAL \seq[14]~output_o\ : std_logic;
SIGNAL \seq[15]~output_o\ : std_logic;
SIGNAL \Led[0]~output_o\ : std_logic;
SIGNAL \Led[1]~output_o\ : std_logic;
SIGNAL \Led[2]~output_o\ : std_logic;
SIGNAL \Led[3]~output_o\ : std_logic;
SIGNAL \Led[4]~output_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \load~input_o\ : std_logic;
SIGNAL \seq~1_combout\ : std_logic;
SIGNAL \rst_n~input_o\ : std_logic;
SIGNAL \rst_n~inputclkctrl_outclk\ : std_logic;
SIGNAL \seq[1]~reg0_q\ : std_logic;
SIGNAL \seq~2_combout\ : std_logic;
SIGNAL \seq[2]~reg0_q\ : std_logic;
SIGNAL \seq~3_combout\ : std_logic;
SIGNAL \seq[3]~reg0_q\ : std_logic;
SIGNAL \seq~4_combout\ : std_logic;
SIGNAL \seq[4]~reg0_q\ : std_logic;
SIGNAL \seq~5_combout\ : std_logic;
SIGNAL \seq[5]~reg0_q\ : std_logic;
SIGNAL \seq~6_combout\ : std_logic;
SIGNAL \seq[6]~reg0_q\ : std_logic;
SIGNAL \seq~7_combout\ : std_logic;
SIGNAL \seq[7]~reg0_q\ : std_logic;
SIGNAL \seq~8_combout\ : std_logic;
SIGNAL \seq[8]~reg0_q\ : std_logic;
SIGNAL \seq~9_combout\ : std_logic;
SIGNAL \seq[9]~reg0_q\ : std_logic;
SIGNAL \seq~10_combout\ : std_logic;
SIGNAL \seq[10]~reg0_q\ : std_logic;
SIGNAL \seq~11_combout\ : std_logic;
SIGNAL \seq[11]~reg0_q\ : std_logic;
SIGNAL \seq~12_combout\ : std_logic;
SIGNAL \seq[12]~reg0_q\ : std_logic;
SIGNAL \seq~13_combout\ : std_logic;
SIGNAL \seq[13]~reg0_q\ : std_logic;
SIGNAL \seq~14_combout\ : std_logic;
SIGNAL \seq[14]~reg0_q\ : std_logic;
SIGNAL \seq~15_combout\ : std_logic;
SIGNAL \seq[15]~reg0_q\ : std_logic;
SIGNAL \seq~0_combout\ : std_logic;
SIGNAL \seq[0]~reg0_q\ : std_logic;

BEGIN

ww_clk <= clk;
ww_rst_n <= rst_n;
ww_load <= load;
seq <= ww_seq;
Led <= ww_Led;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\rst_n~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \rst_n~input_o\);

\clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk~input_o\);

-- Location: IOOBUF_X29_Y0_N9
\seq[0]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \seq[0]~reg0_q\,
	devoe => ww_devoe,
	o => \seq[0]~output_o\);

-- Location: IOOBUF_X33_Y22_N9
\seq[1]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \seq[1]~reg0_q\,
	devoe => ww_devoe,
	o => \seq[1]~output_o\);

-- Location: IOOBUF_X33_Y14_N9
\seq[2]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \seq[2]~reg0_q\,
	devoe => ww_devoe,
	o => \seq[2]~output_o\);

-- Location: IOOBUF_X33_Y24_N9
\seq[3]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \seq[3]~reg0_q\,
	devoe => ww_devoe,
	o => \seq[3]~output_o\);

-- Location: IOOBUF_X26_Y0_N2
\seq[4]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \seq[4]~reg0_q\,
	devoe => ww_devoe,
	o => \seq[4]~output_o\);

-- Location: IOOBUF_X33_Y25_N2
\seq[5]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \seq[5]~reg0_q\,
	devoe => ww_devoe,
	o => \seq[5]~output_o\);

-- Location: IOOBUF_X31_Y0_N2
\seq[6]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \seq[6]~reg0_q\,
	devoe => ww_devoe,
	o => \seq[6]~output_o\);

-- Location: IOOBUF_X33_Y11_N9
\seq[7]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \seq[7]~reg0_q\,
	devoe => ww_devoe,
	o => \seq[7]~output_o\);

-- Location: IOOBUF_X31_Y0_N9
\seq[8]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \seq[8]~reg0_q\,
	devoe => ww_devoe,
	o => \seq[8]~output_o\);

-- Location: IOOBUF_X33_Y11_N2
\seq[9]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \seq[9]~reg0_q\,
	devoe => ww_devoe,
	o => \seq[9]~output_o\);

-- Location: IOOBUF_X33_Y15_N9
\seq[10]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \seq[10]~reg0_q\,
	devoe => ww_devoe,
	o => \seq[10]~output_o\);

-- Location: IOOBUF_X33_Y10_N2
\seq[11]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \seq[11]~reg0_q\,
	devoe => ww_devoe,
	o => \seq[11]~output_o\);

-- Location: IOOBUF_X33_Y15_N2
\seq[12]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \seq[12]~reg0_q\,
	devoe => ww_devoe,
	o => \seq[12]~output_o\);

-- Location: IOOBUF_X33_Y12_N9
\seq[13]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \seq[13]~reg0_q\,
	devoe => ww_devoe,
	o => \seq[13]~output_o\);

-- Location: IOOBUF_X24_Y0_N9
\seq[14]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \seq[14]~reg0_q\,
	devoe => ww_devoe,
	o => \seq[14]~output_o\);

-- Location: IOOBUF_X33_Y10_N9
\seq[15]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \seq[15]~reg0_q\,
	devoe => ww_devoe,
	o => \seq[15]~output_o\);

-- Location: IOOBUF_X29_Y0_N2
\Led[0]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \seq[0]~reg0_q\,
	devoe => ww_devoe,
	o => \Led[0]~output_o\);

-- Location: IOOBUF_X33_Y22_N2
\Led[1]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \seq[1]~reg0_q\,
	devoe => ww_devoe,
	o => \Led[1]~output_o\);

-- Location: IOOBUF_X33_Y14_N2
\Led[2]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \seq[2]~reg0_q\,
	devoe => ww_devoe,
	o => \Led[2]~output_o\);

-- Location: IOOBUF_X33_Y24_N2
\Led[3]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \seq[3]~reg0_q\,
	devoe => ww_devoe,
	o => \Led[3]~output_o\);

-- Location: IOOBUF_X26_Y0_N9
\Led[4]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \seq[4]~reg0_q\,
	devoe => ww_devoe,
	o => \Led[4]~output_o\);

-- Location: IOIBUF_X16_Y0_N15
\clk~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: CLKCTRL_G17
\clk~inputclkctrl\ : cycloneiv_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk~inputclkctrl_outclk\);

-- Location: IOIBUF_X33_Y12_N1
\load~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_load,
	o => \load~input_o\);

-- Location: LCCOMB_X32_Y11_N2
\seq~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \seq~1_combout\ = (!\load~input_o\ & \seq[0]~reg0_q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \load~input_o\,
	datad => \seq[0]~reg0_q\,
	combout => \seq~1_combout\);

-- Location: IOIBUF_X16_Y0_N22
\rst_n~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rst_n,
	o => \rst_n~input_o\);

-- Location: CLKCTRL_G19
\rst_n~inputclkctrl\ : cycloneiv_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \rst_n~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \rst_n~inputclkctrl_outclk\);

-- Location: FF_X32_Y11_N3
\seq[1]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \seq~1_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seq[1]~reg0_q\);

-- Location: LCCOMB_X32_Y11_N0
\seq~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \seq~2_combout\ = (\load~input_o\) # (\seq[1]~reg0_q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \load~input_o\,
	datad => \seq[1]~reg0_q\,
	combout => \seq~2_combout\);

-- Location: FF_X32_Y11_N1
\seq[2]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \seq~2_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seq[2]~reg0_q\);

-- Location: LCCOMB_X32_Y11_N22
\seq~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \seq~3_combout\ = (!\load~input_o\ & \seq[2]~reg0_q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \load~input_o\,
	datad => \seq[2]~reg0_q\,
	combout => \seq~3_combout\);

-- Location: FF_X32_Y11_N23
\seq[3]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \seq~3_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seq[3]~reg0_q\);

-- Location: LCCOMB_X32_Y11_N24
\seq~4\ : cycloneiv_lcell_comb
-- Equation(s):
-- \seq~4_combout\ = (\seq[3]~reg0_q\) # (\load~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \seq[3]~reg0_q\,
	datad => \load~input_o\,
	combout => \seq~4_combout\);

-- Location: FF_X32_Y11_N25
\seq[4]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \seq~4_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seq[4]~reg0_q\);

-- Location: LCCOMB_X32_Y11_N26
\seq~5\ : cycloneiv_lcell_comb
-- Equation(s):
-- \seq~5_combout\ = (!\load~input_o\ & \seq[4]~reg0_q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \load~input_o\,
	datad => \seq[4]~reg0_q\,
	combout => \seq~5_combout\);

-- Location: FF_X32_Y11_N27
\seq[5]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \seq~5_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seq[5]~reg0_q\);

-- Location: LCCOMB_X32_Y11_N4
\seq~6\ : cycloneiv_lcell_comb
-- Equation(s):
-- \seq~6_combout\ = (!\load~input_o\ & \seq[5]~reg0_q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \load~input_o\,
	datac => \seq[5]~reg0_q\,
	combout => \seq~6_combout\);

-- Location: FF_X32_Y11_N5
\seq[6]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \seq~6_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seq[6]~reg0_q\);

-- Location: LCCOMB_X32_Y11_N18
\seq~7\ : cycloneiv_lcell_comb
-- Equation(s):
-- \seq~7_combout\ = (\load~input_o\) # (\seq[6]~reg0_q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \load~input_o\,
	datac => \seq[6]~reg0_q\,
	combout => \seq~7_combout\);

-- Location: FF_X32_Y11_N19
\seq[7]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \seq~7_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seq[7]~reg0_q\);

-- Location: LCCOMB_X32_Y11_N28
\seq~8\ : cycloneiv_lcell_comb
-- Equation(s):
-- \seq~8_combout\ = (\load~input_o\) # (\seq[7]~reg0_q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \load~input_o\,
	datad => \seq[7]~reg0_q\,
	combout => \seq~8_combout\);

-- Location: FF_X32_Y11_N29
\seq[8]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \seq~8_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seq[8]~reg0_q\);

-- Location: LCCOMB_X32_Y11_N10
\seq~9\ : cycloneiv_lcell_comb
-- Equation(s):
-- \seq~9_combout\ = (!\load~input_o\ & \seq[8]~reg0_q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \load~input_o\,
	datad => \seq[8]~reg0_q\,
	combout => \seq~9_combout\);

-- Location: FF_X32_Y11_N11
\seq[9]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \seq~9_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seq[9]~reg0_q\);

-- Location: LCCOMB_X32_Y11_N8
\seq~10\ : cycloneiv_lcell_comb
-- Equation(s):
-- \seq~10_combout\ = (\load~input_o\) # (\seq[9]~reg0_q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \load~input_o\,
	datad => \seq[9]~reg0_q\,
	combout => \seq~10_combout\);

-- Location: FF_X32_Y11_N9
\seq[10]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \seq~10_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seq[10]~reg0_q\);

-- Location: LCCOMB_X32_Y11_N6
\seq~11\ : cycloneiv_lcell_comb
-- Equation(s):
-- \seq~11_combout\ = (\load~input_o\) # (\seq[10]~reg0_q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \load~input_o\,
	datac => \seq[10]~reg0_q\,
	combout => \seq~11_combout\);

-- Location: FF_X32_Y11_N7
\seq[11]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \seq~11_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seq[11]~reg0_q\);

-- Location: LCCOMB_X32_Y11_N12
\seq~12\ : cycloneiv_lcell_comb
-- Equation(s):
-- \seq~12_combout\ = (!\load~input_o\ & \seq[11]~reg0_q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \load~input_o\,
	datad => \seq[11]~reg0_q\,
	combout => \seq~12_combout\);

-- Location: FF_X32_Y11_N13
\seq[12]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \seq~12_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seq[12]~reg0_q\);

-- Location: LCCOMB_X32_Y11_N14
\seq~13\ : cycloneiv_lcell_comb
-- Equation(s):
-- \seq~13_combout\ = (!\load~input_o\ & \seq[12]~reg0_q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \load~input_o\,
	datad => \seq[12]~reg0_q\,
	combout => \seq~13_combout\);

-- Location: FF_X32_Y11_N15
\seq[13]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \seq~13_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seq[13]~reg0_q\);

-- Location: LCCOMB_X32_Y11_N20
\seq~14\ : cycloneiv_lcell_comb
-- Equation(s):
-- \seq~14_combout\ = (!\load~input_o\ & \seq[13]~reg0_q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \load~input_o\,
	datac => \seq[13]~reg0_q\,
	combout => \seq~14_combout\);

-- Location: FF_X32_Y11_N21
\seq[14]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \seq~14_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seq[14]~reg0_q\);

-- Location: LCCOMB_X32_Y11_N30
\seq~15\ : cycloneiv_lcell_comb
-- Equation(s):
-- \seq~15_combout\ = (!\load~input_o\ & \seq[14]~reg0_q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \load~input_o\,
	datad => \seq[14]~reg0_q\,
	combout => \seq~15_combout\);

-- Location: FF_X32_Y11_N31
\seq[15]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \seq~15_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seq[15]~reg0_q\);

-- Location: LCCOMB_X32_Y11_N16
\seq~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \seq~0_combout\ = (\seq[15]~reg0_q\) # (\load~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \seq[15]~reg0_q\,
	datad => \load~input_o\,
	combout => \seq~0_combout\);

-- Location: FF_X32_Y11_N17
\seq[0]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \seq~0_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seq[0]~reg0_q\);

ww_seq(0) <= \seq[0]~output_o\;

ww_seq(1) <= \seq[1]~output_o\;

ww_seq(2) <= \seq[2]~output_o\;

ww_seq(3) <= \seq[3]~output_o\;

ww_seq(4) <= \seq[4]~output_o\;

ww_seq(5) <= \seq[5]~output_o\;

ww_seq(6) <= \seq[6]~output_o\;

ww_seq(7) <= \seq[7]~output_o\;

ww_seq(8) <= \seq[8]~output_o\;

ww_seq(9) <= \seq[9]~output_o\;

ww_seq(10) <= \seq[10]~output_o\;

ww_seq(11) <= \seq[11]~output_o\;

ww_seq(12) <= \seq[12]~output_o\;

ww_seq(13) <= \seq[13]~output_o\;

ww_seq(14) <= \seq[14]~output_o\;

ww_seq(15) <= \seq[15]~output_o\;

ww_Led(0) <= \Led[0]~output_o\;

ww_Led(1) <= \Led[1]~output_o\;

ww_Led(2) <= \Led[2]~output_o\;

ww_Led(3) <= \Led[3]~output_o\;

ww_Led(4) <= \Led[4]~output_o\;
END structure;


