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

-- DATE "11/04/2021 11:16:08"

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

ENTITY 	SS_TEST IS
    PORT (
	clk : IN std_logic;
	rst_n : IN std_logic;
	load : IN std_logic;
	seq_jug : BUFFER std_logic
	);
END SS_TEST;

-- Design Ports Information
-- seq_jug	=>  Location: PIN_C13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_J7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rst_n	=>  Location: PIN_J6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- load	=>  Location: PIN_D13,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF SS_TEST IS
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
SIGNAL ww_seq_jug : std_logic;
SIGNAL \rst_n~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \seq_jug~output_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \load~input_o\ : std_logic;
SIGNAL \U1|seq~15_combout\ : std_logic;
SIGNAL \rst_n~input_o\ : std_logic;
SIGNAL \rst_n~inputclkctrl_outclk\ : std_logic;
SIGNAL \U1|seq~14_combout\ : std_logic;
SIGNAL \U1|seq~13_combout\ : std_logic;
SIGNAL \U1|seq~12_combout\ : std_logic;
SIGNAL \U1|seq~11_combout\ : std_logic;
SIGNAL \U1|seq~10_combout\ : std_logic;
SIGNAL \U1|seq~9_combout\ : std_logic;
SIGNAL \U1|seq~8_combout\ : std_logic;
SIGNAL \U1|seq~7_combout\ : std_logic;
SIGNAL \U1|seq~6_combout\ : std_logic;
SIGNAL \U1|seq~5_combout\ : std_logic;
SIGNAL \U1|seq~4_combout\ : std_logic;
SIGNAL \U1|seq~3_combout\ : std_logic;
SIGNAL \U1|seq~2_combout\ : std_logic;
SIGNAL \U1|seq~1_combout\ : std_logic;
SIGNAL \U1|seq~0_combout\ : std_logic;
SIGNAL \U2|Mux2~0_combout\ : std_logic;
SIGNAL \U2|Mux0~0_combout\ : std_logic;
SIGNAL \U2|Mux1~0_combout\ : std_logic;
SIGNAL \U2|Equal0~0_combout\ : std_logic;
SIGNAL \U1|seq\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \U1|Led\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \U2|state\ : std_logic_vector(2 DOWNTO 0);

BEGIN

ww_clk <= clk;
ww_rst_n <= rst_n;
ww_load <= load;
seq_jug <= ww_seq_jug;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\rst_n~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \rst_n~input_o\);

\clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk~input_o\);

-- Location: IOOBUF_X29_Y31_N2
\seq_jug~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U2|Equal0~0_combout\,
	devoe => ww_devoe,
	o => \seq_jug~output_o\);

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

-- Location: IOIBUF_X29_Y31_N8
\load~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_load,
	o => \load~input_o\);

-- Location: LCCOMB_X29_Y29_N26
\U1|seq~15\ : cycloneiv_lcell_comb
-- Equation(s):
-- \U1|seq~15_combout\ = (!\load~input_o\ & \U1|Led\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \load~input_o\,
	datad => \U1|Led\(0),
	combout => \U1|seq~15_combout\);

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

-- Location: FF_X29_Y29_N27
\U1|Led[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U1|seq~15_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|Led\(1));

-- Location: LCCOMB_X29_Y29_N4
\U1|seq~14\ : cycloneiv_lcell_comb
-- Equation(s):
-- \U1|seq~14_combout\ = (\U1|Led\(1)) # (\load~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \U1|Led\(1),
	datad => \load~input_o\,
	combout => \U1|seq~14_combout\);

-- Location: FF_X29_Y29_N5
\U1|Led[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U1|seq~14_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|Led\(2));

-- Location: LCCOMB_X29_Y29_N6
\U1|seq~13\ : cycloneiv_lcell_comb
-- Equation(s):
-- \U1|seq~13_combout\ = (\U1|Led\(2) & !\load~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \U1|Led\(2),
	datad => \load~input_o\,
	combout => \U1|seq~13_combout\);

-- Location: FF_X29_Y29_N7
\U1|Led[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U1|seq~13_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|Led\(3));

-- Location: LCCOMB_X29_Y29_N0
\U1|seq~12\ : cycloneiv_lcell_comb
-- Equation(s):
-- \U1|seq~12_combout\ = (\load~input_o\) # (\U1|Led\(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \load~input_o\,
	datad => \U1|Led\(3),
	combout => \U1|seq~12_combout\);

-- Location: FF_X29_Y29_N1
\U1|Led[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U1|seq~12_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|Led\(4));

-- Location: LCCOMB_X29_Y29_N2
\U1|seq~11\ : cycloneiv_lcell_comb
-- Equation(s):
-- \U1|seq~11_combout\ = (!\load~input_o\ & \U1|Led\(4))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \load~input_o\,
	datad => \U1|Led\(4),
	combout => \U1|seq~11_combout\);

-- Location: FF_X29_Y29_N3
\U1|seq[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U1|seq~11_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|seq\(5));

-- Location: LCCOMB_X29_Y29_N20
\U1|seq~10\ : cycloneiv_lcell_comb
-- Equation(s):
-- \U1|seq~10_combout\ = (!\load~input_o\ & \U1|seq\(5))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \load~input_o\,
	datad => \U1|seq\(5),
	combout => \U1|seq~10_combout\);

-- Location: FF_X29_Y29_N21
\U1|seq[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U1|seq~10_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|seq\(6));

-- Location: LCCOMB_X29_Y29_N14
\U1|seq~9\ : cycloneiv_lcell_comb
-- Equation(s):
-- \U1|seq~9_combout\ = (\load~input_o\) # (\U1|seq\(6))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \load~input_o\,
	datad => \U1|seq\(6),
	combout => \U1|seq~9_combout\);

-- Location: FF_X29_Y29_N15
\U1|seq[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U1|seq~9_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|seq\(7));

-- Location: LCCOMB_X29_Y29_N16
\U1|seq~8\ : cycloneiv_lcell_comb
-- Equation(s):
-- \U1|seq~8_combout\ = (\U1|seq\(7)) # (\load~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \U1|seq\(7),
	datad => \load~input_o\,
	combout => \U1|seq~8_combout\);

-- Location: FF_X29_Y29_N17
\U1|seq[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U1|seq~8_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|seq\(8));

-- Location: LCCOMB_X29_Y29_N22
\U1|seq~7\ : cycloneiv_lcell_comb
-- Equation(s):
-- \U1|seq~7_combout\ = (!\load~input_o\ & \U1|seq\(8))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \load~input_o\,
	datad => \U1|seq\(8),
	combout => \U1|seq~7_combout\);

-- Location: FF_X29_Y29_N23
\U1|seq[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U1|seq~7_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|seq\(9));

-- Location: LCCOMB_X29_Y29_N8
\U1|seq~6\ : cycloneiv_lcell_comb
-- Equation(s):
-- \U1|seq~6_combout\ = (\U1|seq\(9)) # (\load~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \U1|seq\(9),
	datad => \load~input_o\,
	combout => \U1|seq~6_combout\);

-- Location: FF_X29_Y29_N9
\U1|seq[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U1|seq~6_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|seq\(10));

-- Location: LCCOMB_X29_Y29_N10
\U1|seq~5\ : cycloneiv_lcell_comb
-- Equation(s):
-- \U1|seq~5_combout\ = (\U1|seq\(10)) # (\load~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \U1|seq\(10),
	datad => \load~input_o\,
	combout => \U1|seq~5_combout\);

-- Location: FF_X29_Y29_N11
\U1|seq[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U1|seq~5_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|seq\(11));

-- Location: LCCOMB_X29_Y29_N24
\U1|seq~4\ : cycloneiv_lcell_comb
-- Equation(s):
-- \U1|seq~4_combout\ = (!\load~input_o\ & \U1|seq\(11))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \load~input_o\,
	datad => \U1|seq\(11),
	combout => \U1|seq~4_combout\);

-- Location: FF_X29_Y29_N25
\U1|seq[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U1|seq~4_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|seq\(12));

-- Location: LCCOMB_X29_Y29_N18
\U1|seq~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \U1|seq~3_combout\ = (!\load~input_o\ & \U1|seq\(12))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \load~input_o\,
	datad => \U1|seq\(12),
	combout => \U1|seq~3_combout\);

-- Location: FF_X29_Y29_N19
\U1|seq[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U1|seq~3_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|seq\(13));

-- Location: LCCOMB_X29_Y29_N12
\U1|seq~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \U1|seq~2_combout\ = (!\load~input_o\ & \U1|seq\(13))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \load~input_o\,
	datad => \U1|seq\(13),
	combout => \U1|seq~2_combout\);

-- Location: FF_X29_Y29_N13
\U1|seq[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U1|seq~2_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|seq\(14));

-- Location: LCCOMB_X29_Y29_N30
\U1|seq~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \U1|seq~1_combout\ = (!\load~input_o\ & \U1|seq\(14))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \load~input_o\,
	datad => \U1|seq\(14),
	combout => \U1|seq~1_combout\);

-- Location: FF_X29_Y29_N31
\U1|seq[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U1|seq~1_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|seq\(15));

-- Location: LCCOMB_X29_Y29_N28
\U1|seq~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \U1|seq~0_combout\ = (\U1|seq\(15)) # (\load~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \U1|seq\(15),
	datad => \load~input_o\,
	combout => \U1|seq~0_combout\);

-- Location: FF_X29_Y29_N29
\U1|Led[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U1|seq~0_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|Led\(0));

-- Location: LCCOMB_X30_Y29_N28
\U2|Mux2~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \U2|Mux2~0_combout\ = (\U2|state\(2) & (!\U2|state\(1) & (\U2|state\(0) $ (!\U1|Led\(0))))) # (!\U2|state\(2) & (\U1|Led\(0) & ((!\U2|state\(0)) # (!\U2|state\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011010100000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|state\(2),
	datab => \U2|state\(1),
	datac => \U2|state\(0),
	datad => \U1|Led\(0),
	combout => \U2|Mux2~0_combout\);

-- Location: FF_X30_Y29_N29
\U2|state[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U2|Mux2~0_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U2|state\(0));

-- Location: LCCOMB_X30_Y29_N26
\U2|Mux0~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \U2|Mux0~0_combout\ = (\U2|state\(1) & (\U2|state\(0) & (!\U2|state\(2) & \U1|Led\(0)))) # (!\U2|state\(1) & (!\U2|state\(0) & (\U2|state\(2) & !\U1|Led\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|state\(1),
	datab => \U2|state\(0),
	datac => \U2|state\(2),
	datad => \U1|Led\(0),
	combout => \U2|Mux0~0_combout\);

-- Location: FF_X30_Y29_N27
\U2|state[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U2|Mux0~0_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U2|state\(2));

-- Location: LCCOMB_X30_Y29_N12
\U2|Mux1~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \U2|Mux1~0_combout\ = (\U2|state\(1) & (!\U2|state\(2) & (\U2|state\(0) $ (\U1|Led\(0))))) # (!\U2|state\(1) & (\U2|state\(0) & (\U2|state\(2) $ (!\U1|Led\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001100001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|state\(2),
	datab => \U2|state\(0),
	datac => \U2|state\(1),
	datad => \U1|Led\(0),
	combout => \U2|Mux1~0_combout\);

-- Location: FF_X30_Y29_N13
\U2|state[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U2|Mux1~0_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U2|state\(1));

-- Location: LCCOMB_X30_Y29_N30
\U2|Equal0~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \U2|Equal0~0_combout\ = (!\U2|state\(1) & (\U2|state\(2) & \U2|state\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U2|state\(1),
	datac => \U2|state\(2),
	datad => \U2|state\(0),
	combout => \U2|Equal0~0_combout\);

ww_seq_jug <= \seq_jug~output_o\;
END structure;


