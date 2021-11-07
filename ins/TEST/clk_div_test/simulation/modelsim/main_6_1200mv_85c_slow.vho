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

-- DATE "11/07/2021 19:11:40"

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

ENTITY 	main IS
    PORT (
	clk : IN std_logic;
	rst_n : IN std_logic;
	clk_div : BUFFER std_logic
	);
END main;

-- Design Ports Information
-- clk_div	=>  Location: PIN_K13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_J7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rst_n	=>  Location: PIN_J6,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF main IS
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
SIGNAL ww_clk_div : std_logic;
SIGNAL \rst_n~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clk_div~output_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \U1|Add0~0_combout\ : std_logic;
SIGNAL \rst_n~input_o\ : std_logic;
SIGNAL \rst_n~inputclkctrl_outclk\ : std_logic;
SIGNAL \U1|Add0~1\ : std_logic;
SIGNAL \U1|Add0~2_combout\ : std_logic;
SIGNAL \U1|cnt~0_combout\ : std_logic;
SIGNAL \U1|Add0~3\ : std_logic;
SIGNAL \U1|Add0~4_combout\ : std_logic;
SIGNAL \U1|Add0~5\ : std_logic;
SIGNAL \U1|Add0~6_combout\ : std_logic;
SIGNAL \U1|Equal0~9_combout\ : std_logic;
SIGNAL \U1|Add0~7\ : std_logic;
SIGNAL \U1|Add0~8_combout\ : std_logic;
SIGNAL \U1|Add0~9\ : std_logic;
SIGNAL \U1|Add0~10_combout\ : std_logic;
SIGNAL \U1|Add0~11\ : std_logic;
SIGNAL \U1|Add0~12_combout\ : std_logic;
SIGNAL \U1|Add0~13\ : std_logic;
SIGNAL \U1|Add0~14_combout\ : std_logic;
SIGNAL \U1|Equal0~8_combout\ : std_logic;
SIGNAL \U1|Add0~15\ : std_logic;
SIGNAL \U1|Add0~16_combout\ : std_logic;
SIGNAL \U1|Add0~17\ : std_logic;
SIGNAL \U1|Add0~18_combout\ : std_logic;
SIGNAL \U1|Add0~19\ : std_logic;
SIGNAL \U1|Add0~20_combout\ : std_logic;
SIGNAL \U1|Add0~21\ : std_logic;
SIGNAL \U1|Add0~22_combout\ : std_logic;
SIGNAL \U1|Equal0~6_combout\ : std_logic;
SIGNAL \U1|Add0~23\ : std_logic;
SIGNAL \U1|Add0~24_combout\ : std_logic;
SIGNAL \U1|Add0~25\ : std_logic;
SIGNAL \U1|Add0~26_combout\ : std_logic;
SIGNAL \U1|Add0~27\ : std_logic;
SIGNAL \U1|Add0~28_combout\ : std_logic;
SIGNAL \U1|Add0~29\ : std_logic;
SIGNAL \U1|Add0~30_combout\ : std_logic;
SIGNAL \U1|Equal0~5_combout\ : std_logic;
SIGNAL \U1|Equal0~7_combout\ : std_logic;
SIGNAL \U1|Add0~31\ : std_logic;
SIGNAL \U1|Add0~32_combout\ : std_logic;
SIGNAL \U1|Add0~33\ : std_logic;
SIGNAL \U1|Add0~34_combout\ : std_logic;
SIGNAL \U1|Add0~35\ : std_logic;
SIGNAL \U1|Add0~36_combout\ : std_logic;
SIGNAL \U1|Add0~37\ : std_logic;
SIGNAL \U1|Add0~38_combout\ : std_logic;
SIGNAL \U1|Equal0~3_combout\ : std_logic;
SIGNAL \U1|Add0~39\ : std_logic;
SIGNAL \U1|Add0~40_combout\ : std_logic;
SIGNAL \U1|Add0~41\ : std_logic;
SIGNAL \U1|Add0~42_combout\ : std_logic;
SIGNAL \U1|Add0~43\ : std_logic;
SIGNAL \U1|Add0~44_combout\ : std_logic;
SIGNAL \U1|Add0~45\ : std_logic;
SIGNAL \U1|Add0~46_combout\ : std_logic;
SIGNAL \U1|Add0~47\ : std_logic;
SIGNAL \U1|Add0~48_combout\ : std_logic;
SIGNAL \U1|Add0~49\ : std_logic;
SIGNAL \U1|Add0~50_combout\ : std_logic;
SIGNAL \U1|Add0~51\ : std_logic;
SIGNAL \U1|Add0~52_combout\ : std_logic;
SIGNAL \U1|Add0~53\ : std_logic;
SIGNAL \U1|Add0~54_combout\ : std_logic;
SIGNAL \U1|Equal0~1_combout\ : std_logic;
SIGNAL \U1|Add0~55\ : std_logic;
SIGNAL \U1|Add0~56_combout\ : std_logic;
SIGNAL \U1|Add0~57\ : std_logic;
SIGNAL \U1|Add0~58_combout\ : std_logic;
SIGNAL \U1|Add0~59\ : std_logic;
SIGNAL \U1|Add0~60_combout\ : std_logic;
SIGNAL \U1|Add0~61\ : std_logic;
SIGNAL \U1|Add0~62_combout\ : std_logic;
SIGNAL \U1|Equal0~0_combout\ : std_logic;
SIGNAL \U1|Equal0~2_combout\ : std_logic;
SIGNAL \U1|Equal0~4_combout\ : std_logic;
SIGNAL \U1|Equal0~10_combout\ : std_logic;
SIGNAL \U1|clk_div~0_combout\ : std_logic;
SIGNAL \U1|clk_div~q\ : std_logic;
SIGNAL \U1|cnt\ : std_logic_vector(31 DOWNTO 0);

BEGIN

ww_clk <= clk;
ww_rst_n <= rst_n;
clk_div <= ww_clk_div;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\rst_n~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \rst_n~input_o\);

\clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk~input_o\);

-- Location: IOOBUF_X33_Y15_N2
\clk_div~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U1|clk_div~q\,
	devoe => ww_devoe,
	o => \clk_div~output_o\);

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

-- Location: LCCOMB_X25_Y15_N0
\U1|Add0~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \U1|Add0~0_combout\ = \U1|cnt\(0) $ (VCC)
-- \U1|Add0~1\ = CARRY(\U1|cnt\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \U1|cnt\(0),
	datad => VCC,
	combout => \U1|Add0~0_combout\,
	cout => \U1|Add0~1\);

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

-- Location: FF_X25_Y15_N1
\U1|cnt[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U1|Add0~0_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|cnt\(0));

-- Location: LCCOMB_X25_Y15_N2
\U1|Add0~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \U1|Add0~2_combout\ = (\U1|cnt\(1) & (!\U1|Add0~1\)) # (!\U1|cnt\(1) & ((\U1|Add0~1\) # (GND)))
-- \U1|Add0~3\ = CARRY((!\U1|Add0~1\) # (!\U1|cnt\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U1|cnt\(1),
	datad => VCC,
	cin => \U1|Add0~1\,
	combout => \U1|Add0~2_combout\,
	cout => \U1|Add0~3\);

-- Location: LCCOMB_X26_Y15_N10
\U1|cnt~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \U1|cnt~0_combout\ = (\U1|Add0~2_combout\ & !\U1|Equal0~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \U1|Add0~2_combout\,
	datad => \U1|Equal0~10_combout\,
	combout => \U1|cnt~0_combout\);

-- Location: FF_X25_Y15_N3
\U1|cnt[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \U1|cnt~0_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|cnt\(1));

-- Location: LCCOMB_X25_Y15_N4
\U1|Add0~4\ : cycloneiv_lcell_comb
-- Equation(s):
-- \U1|Add0~4_combout\ = (\U1|cnt\(2) & (\U1|Add0~3\ $ (GND))) # (!\U1|cnt\(2) & (!\U1|Add0~3\ & VCC))
-- \U1|Add0~5\ = CARRY((\U1|cnt\(2) & !\U1|Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U1|cnt\(2),
	datad => VCC,
	cin => \U1|Add0~3\,
	combout => \U1|Add0~4_combout\,
	cout => \U1|Add0~5\);

-- Location: FF_X25_Y15_N5
\U1|cnt[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U1|Add0~4_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|cnt\(2));

-- Location: LCCOMB_X25_Y15_N6
\U1|Add0~6\ : cycloneiv_lcell_comb
-- Equation(s):
-- \U1|Add0~6_combout\ = (\U1|cnt\(3) & (!\U1|Add0~5\)) # (!\U1|cnt\(3) & ((\U1|Add0~5\) # (GND)))
-- \U1|Add0~7\ = CARRY((!\U1|Add0~5\) # (!\U1|cnt\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|cnt\(3),
	datad => VCC,
	cin => \U1|Add0~5\,
	combout => \U1|Add0~6_combout\,
	cout => \U1|Add0~7\);

-- Location: FF_X25_Y15_N7
\U1|cnt[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U1|Add0~6_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|cnt\(3));

-- Location: LCCOMB_X26_Y15_N22
\U1|Equal0~9\ : cycloneiv_lcell_comb
-- Equation(s):
-- \U1|Equal0~9_combout\ = (\U1|cnt\(0) & (!\U1|cnt\(3) & (!\U1|cnt\(2) & !\U1|cnt\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U1|cnt\(0),
	datab => \U1|cnt\(3),
	datac => \U1|cnt\(2),
	datad => \U1|cnt\(1),
	combout => \U1|Equal0~9_combout\);

-- Location: LCCOMB_X25_Y15_N8
\U1|Add0~8\ : cycloneiv_lcell_comb
-- Equation(s):
-- \U1|Add0~8_combout\ = (\U1|cnt\(4) & (\U1|Add0~7\ $ (GND))) # (!\U1|cnt\(4) & (!\U1|Add0~7\ & VCC))
-- \U1|Add0~9\ = CARRY((\U1|cnt\(4) & !\U1|Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U1|cnt\(4),
	datad => VCC,
	cin => \U1|Add0~7\,
	combout => \U1|Add0~8_combout\,
	cout => \U1|Add0~9\);

-- Location: FF_X25_Y15_N9
\U1|cnt[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U1|Add0~8_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|cnt\(4));

-- Location: LCCOMB_X25_Y15_N10
\U1|Add0~10\ : cycloneiv_lcell_comb
-- Equation(s):
-- \U1|Add0~10_combout\ = (\U1|cnt\(5) & (!\U1|Add0~9\)) # (!\U1|cnt\(5) & ((\U1|Add0~9\) # (GND)))
-- \U1|Add0~11\ = CARRY((!\U1|Add0~9\) # (!\U1|cnt\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|cnt\(5),
	datad => VCC,
	cin => \U1|Add0~9\,
	combout => \U1|Add0~10_combout\,
	cout => \U1|Add0~11\);

-- Location: FF_X25_Y15_N11
\U1|cnt[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U1|Add0~10_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|cnt\(5));

-- Location: LCCOMB_X25_Y15_N12
\U1|Add0~12\ : cycloneiv_lcell_comb
-- Equation(s):
-- \U1|Add0~12_combout\ = (\U1|cnt\(6) & (\U1|Add0~11\ $ (GND))) # (!\U1|cnt\(6) & (!\U1|Add0~11\ & VCC))
-- \U1|Add0~13\ = CARRY((\U1|cnt\(6) & !\U1|Add0~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|cnt\(6),
	datad => VCC,
	cin => \U1|Add0~11\,
	combout => \U1|Add0~12_combout\,
	cout => \U1|Add0~13\);

-- Location: FF_X25_Y15_N13
\U1|cnt[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U1|Add0~12_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|cnt\(6));

-- Location: LCCOMB_X25_Y15_N14
\U1|Add0~14\ : cycloneiv_lcell_comb
-- Equation(s):
-- \U1|Add0~14_combout\ = (\U1|cnt\(7) & (!\U1|Add0~13\)) # (!\U1|cnt\(7) & ((\U1|Add0~13\) # (GND)))
-- \U1|Add0~15\ = CARRY((!\U1|Add0~13\) # (!\U1|cnt\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U1|cnt\(7),
	datad => VCC,
	cin => \U1|Add0~13\,
	combout => \U1|Add0~14_combout\,
	cout => \U1|Add0~15\);

-- Location: FF_X25_Y15_N15
\U1|cnt[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U1|Add0~14_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|cnt\(7));

-- Location: LCCOMB_X26_Y15_N20
\U1|Equal0~8\ : cycloneiv_lcell_comb
-- Equation(s):
-- \U1|Equal0~8_combout\ = (!\U1|cnt\(5) & (!\U1|cnt\(6) & (!\U1|cnt\(4) & !\U1|cnt\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U1|cnt\(5),
	datab => \U1|cnt\(6),
	datac => \U1|cnt\(4),
	datad => \U1|cnt\(7),
	combout => \U1|Equal0~8_combout\);

-- Location: LCCOMB_X25_Y15_N16
\U1|Add0~16\ : cycloneiv_lcell_comb
-- Equation(s):
-- \U1|Add0~16_combout\ = (\U1|cnt\(8) & (\U1|Add0~15\ $ (GND))) # (!\U1|cnt\(8) & (!\U1|Add0~15\ & VCC))
-- \U1|Add0~17\ = CARRY((\U1|cnt\(8) & !\U1|Add0~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U1|cnt\(8),
	datad => VCC,
	cin => \U1|Add0~15\,
	combout => \U1|Add0~16_combout\,
	cout => \U1|Add0~17\);

-- Location: FF_X25_Y15_N17
\U1|cnt[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U1|Add0~16_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|cnt\(8));

-- Location: LCCOMB_X25_Y15_N18
\U1|Add0~18\ : cycloneiv_lcell_comb
-- Equation(s):
-- \U1|Add0~18_combout\ = (\U1|cnt\(9) & (!\U1|Add0~17\)) # (!\U1|cnt\(9) & ((\U1|Add0~17\) # (GND)))
-- \U1|Add0~19\ = CARRY((!\U1|Add0~17\) # (!\U1|cnt\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U1|cnt\(9),
	datad => VCC,
	cin => \U1|Add0~17\,
	combout => \U1|Add0~18_combout\,
	cout => \U1|Add0~19\);

-- Location: FF_X25_Y15_N19
\U1|cnt[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U1|Add0~18_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|cnt\(9));

-- Location: LCCOMB_X25_Y15_N20
\U1|Add0~20\ : cycloneiv_lcell_comb
-- Equation(s):
-- \U1|Add0~20_combout\ = (\U1|cnt\(10) & (\U1|Add0~19\ $ (GND))) # (!\U1|cnt\(10) & (!\U1|Add0~19\ & VCC))
-- \U1|Add0~21\ = CARRY((\U1|cnt\(10) & !\U1|Add0~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U1|cnt\(10),
	datad => VCC,
	cin => \U1|Add0~19\,
	combout => \U1|Add0~20_combout\,
	cout => \U1|Add0~21\);

-- Location: FF_X25_Y15_N21
\U1|cnt[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U1|Add0~20_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|cnt\(10));

-- Location: LCCOMB_X25_Y15_N22
\U1|Add0~22\ : cycloneiv_lcell_comb
-- Equation(s):
-- \U1|Add0~22_combout\ = (\U1|cnt\(11) & (!\U1|Add0~21\)) # (!\U1|cnt\(11) & ((\U1|Add0~21\) # (GND)))
-- \U1|Add0~23\ = CARRY((!\U1|Add0~21\) # (!\U1|cnt\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|cnt\(11),
	datad => VCC,
	cin => \U1|Add0~21\,
	combout => \U1|Add0~22_combout\,
	cout => \U1|Add0~23\);

-- Location: FF_X25_Y15_N23
\U1|cnt[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U1|Add0~22_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|cnt\(11));

-- Location: LCCOMB_X26_Y15_N4
\U1|Equal0~6\ : cycloneiv_lcell_comb
-- Equation(s):
-- \U1|Equal0~6_combout\ = (!\U1|cnt\(11) & !\U1|cnt\(10))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \U1|cnt\(11),
	datad => \U1|cnt\(10),
	combout => \U1|Equal0~6_combout\);

-- Location: LCCOMB_X25_Y15_N24
\U1|Add0~24\ : cycloneiv_lcell_comb
-- Equation(s):
-- \U1|Add0~24_combout\ = (\U1|cnt\(12) & (\U1|Add0~23\ $ (GND))) # (!\U1|cnt\(12) & (!\U1|Add0~23\ & VCC))
-- \U1|Add0~25\ = CARRY((\U1|cnt\(12) & !\U1|Add0~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U1|cnt\(12),
	datad => VCC,
	cin => \U1|Add0~23\,
	combout => \U1|Add0~24_combout\,
	cout => \U1|Add0~25\);

-- Location: FF_X25_Y15_N25
\U1|cnt[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U1|Add0~24_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|cnt\(12));

-- Location: LCCOMB_X25_Y15_N26
\U1|Add0~26\ : cycloneiv_lcell_comb
-- Equation(s):
-- \U1|Add0~26_combout\ = (\U1|cnt\(13) & (!\U1|Add0~25\)) # (!\U1|cnt\(13) & ((\U1|Add0~25\) # (GND)))
-- \U1|Add0~27\ = CARRY((!\U1|Add0~25\) # (!\U1|cnt\(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|cnt\(13),
	datad => VCC,
	cin => \U1|Add0~25\,
	combout => \U1|Add0~26_combout\,
	cout => \U1|Add0~27\);

-- Location: FF_X25_Y15_N27
\U1|cnt[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U1|Add0~26_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|cnt\(13));

-- Location: LCCOMB_X25_Y15_N28
\U1|Add0~28\ : cycloneiv_lcell_comb
-- Equation(s):
-- \U1|Add0~28_combout\ = (\U1|cnt\(14) & (\U1|Add0~27\ $ (GND))) # (!\U1|cnt\(14) & (!\U1|Add0~27\ & VCC))
-- \U1|Add0~29\ = CARRY((\U1|cnt\(14) & !\U1|Add0~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U1|cnt\(14),
	datad => VCC,
	cin => \U1|Add0~27\,
	combout => \U1|Add0~28_combout\,
	cout => \U1|Add0~29\);

-- Location: FF_X25_Y15_N29
\U1|cnt[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U1|Add0~28_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|cnt\(14));

-- Location: LCCOMB_X25_Y15_N30
\U1|Add0~30\ : cycloneiv_lcell_comb
-- Equation(s):
-- \U1|Add0~30_combout\ = (\U1|cnt\(15) & (!\U1|Add0~29\)) # (!\U1|cnt\(15) & ((\U1|Add0~29\) # (GND)))
-- \U1|Add0~31\ = CARRY((!\U1|Add0~29\) # (!\U1|cnt\(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|cnt\(15),
	datad => VCC,
	cin => \U1|Add0~29\,
	combout => \U1|Add0~30_combout\,
	cout => \U1|Add0~31\);

-- Location: FF_X25_Y15_N31
\U1|cnt[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U1|Add0~30_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|cnt\(15));

-- Location: LCCOMB_X26_Y15_N2
\U1|Equal0~5\ : cycloneiv_lcell_comb
-- Equation(s):
-- \U1|Equal0~5_combout\ = (!\U1|cnt\(13) & (!\U1|cnt\(12) & (!\U1|cnt\(15) & !\U1|cnt\(14))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U1|cnt\(13),
	datab => \U1|cnt\(12),
	datac => \U1|cnt\(15),
	datad => \U1|cnt\(14),
	combout => \U1|Equal0~5_combout\);

-- Location: LCCOMB_X26_Y15_N26
\U1|Equal0~7\ : cycloneiv_lcell_comb
-- Equation(s):
-- \U1|Equal0~7_combout\ = (!\U1|cnt\(8) & (!\U1|cnt\(9) & (\U1|Equal0~6_combout\ & \U1|Equal0~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U1|cnt\(8),
	datab => \U1|cnt\(9),
	datac => \U1|Equal0~6_combout\,
	datad => \U1|Equal0~5_combout\,
	combout => \U1|Equal0~7_combout\);

-- Location: LCCOMB_X25_Y14_N0
\U1|Add0~32\ : cycloneiv_lcell_comb
-- Equation(s):
-- \U1|Add0~32_combout\ = (\U1|cnt\(16) & (\U1|Add0~31\ $ (GND))) # (!\U1|cnt\(16) & (!\U1|Add0~31\ & VCC))
-- \U1|Add0~33\ = CARRY((\U1|cnt\(16) & !\U1|Add0~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U1|cnt\(16),
	datad => VCC,
	cin => \U1|Add0~31\,
	combout => \U1|Add0~32_combout\,
	cout => \U1|Add0~33\);

-- Location: FF_X25_Y14_N1
\U1|cnt[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U1|Add0~32_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|cnt\(16));

-- Location: LCCOMB_X25_Y14_N2
\U1|Add0~34\ : cycloneiv_lcell_comb
-- Equation(s):
-- \U1|Add0~34_combout\ = (\U1|cnt\(17) & (!\U1|Add0~33\)) # (!\U1|cnt\(17) & ((\U1|Add0~33\) # (GND)))
-- \U1|Add0~35\ = CARRY((!\U1|Add0~33\) # (!\U1|cnt\(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U1|cnt\(17),
	datad => VCC,
	cin => \U1|Add0~33\,
	combout => \U1|Add0~34_combout\,
	cout => \U1|Add0~35\);

-- Location: FF_X25_Y14_N3
\U1|cnt[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U1|Add0~34_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|cnt\(17));

-- Location: LCCOMB_X25_Y14_N4
\U1|Add0~36\ : cycloneiv_lcell_comb
-- Equation(s):
-- \U1|Add0~36_combout\ = (\U1|cnt\(18) & (\U1|Add0~35\ $ (GND))) # (!\U1|cnt\(18) & (!\U1|Add0~35\ & VCC))
-- \U1|Add0~37\ = CARRY((\U1|cnt\(18) & !\U1|Add0~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U1|cnt\(18),
	datad => VCC,
	cin => \U1|Add0~35\,
	combout => \U1|Add0~36_combout\,
	cout => \U1|Add0~37\);

-- Location: FF_X25_Y14_N5
\U1|cnt[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U1|Add0~36_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|cnt\(18));

-- Location: LCCOMB_X25_Y14_N6
\U1|Add0~38\ : cycloneiv_lcell_comb
-- Equation(s):
-- \U1|Add0~38_combout\ = (\U1|cnt\(19) & (!\U1|Add0~37\)) # (!\U1|cnt\(19) & ((\U1|Add0~37\) # (GND)))
-- \U1|Add0~39\ = CARRY((!\U1|Add0~37\) # (!\U1|cnt\(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|cnt\(19),
	datad => VCC,
	cin => \U1|Add0~37\,
	combout => \U1|Add0~38_combout\,
	cout => \U1|Add0~39\);

-- Location: FF_X25_Y14_N7
\U1|cnt[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U1|Add0~38_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|cnt\(19));

-- Location: LCCOMB_X26_Y14_N10
\U1|Equal0~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \U1|Equal0~3_combout\ = (!\U1|cnt\(16) & (!\U1|cnt\(18) & (!\U1|cnt\(19) & !\U1|cnt\(17))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U1|cnt\(16),
	datab => \U1|cnt\(18),
	datac => \U1|cnt\(19),
	datad => \U1|cnt\(17),
	combout => \U1|Equal0~3_combout\);

-- Location: LCCOMB_X25_Y14_N8
\U1|Add0~40\ : cycloneiv_lcell_comb
-- Equation(s):
-- \U1|Add0~40_combout\ = (\U1|cnt\(20) & (\U1|Add0~39\ $ (GND))) # (!\U1|cnt\(20) & (!\U1|Add0~39\ & VCC))
-- \U1|Add0~41\ = CARRY((\U1|cnt\(20) & !\U1|Add0~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U1|cnt\(20),
	datad => VCC,
	cin => \U1|Add0~39\,
	combout => \U1|Add0~40_combout\,
	cout => \U1|Add0~41\);

-- Location: FF_X25_Y14_N9
\U1|cnt[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U1|Add0~40_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|cnt\(20));

-- Location: LCCOMB_X25_Y14_N10
\U1|Add0~42\ : cycloneiv_lcell_comb
-- Equation(s):
-- \U1|Add0~42_combout\ = (\U1|cnt\(21) & (!\U1|Add0~41\)) # (!\U1|cnt\(21) & ((\U1|Add0~41\) # (GND)))
-- \U1|Add0~43\ = CARRY((!\U1|Add0~41\) # (!\U1|cnt\(21)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|cnt\(21),
	datad => VCC,
	cin => \U1|Add0~41\,
	combout => \U1|Add0~42_combout\,
	cout => \U1|Add0~43\);

-- Location: FF_X25_Y14_N11
\U1|cnt[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U1|Add0~42_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|cnt\(21));

-- Location: LCCOMB_X25_Y14_N12
\U1|Add0~44\ : cycloneiv_lcell_comb
-- Equation(s):
-- \U1|Add0~44_combout\ = (\U1|cnt\(22) & (\U1|Add0~43\ $ (GND))) # (!\U1|cnt\(22) & (!\U1|Add0~43\ & VCC))
-- \U1|Add0~45\ = CARRY((\U1|cnt\(22) & !\U1|Add0~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|cnt\(22),
	datad => VCC,
	cin => \U1|Add0~43\,
	combout => \U1|Add0~44_combout\,
	cout => \U1|Add0~45\);

-- Location: FF_X25_Y14_N13
\U1|cnt[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U1|Add0~44_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|cnt\(22));

-- Location: LCCOMB_X25_Y14_N14
\U1|Add0~46\ : cycloneiv_lcell_comb
-- Equation(s):
-- \U1|Add0~46_combout\ = (\U1|cnt\(23) & (!\U1|Add0~45\)) # (!\U1|cnt\(23) & ((\U1|Add0~45\) # (GND)))
-- \U1|Add0~47\ = CARRY((!\U1|Add0~45\) # (!\U1|cnt\(23)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U1|cnt\(23),
	datad => VCC,
	cin => \U1|Add0~45\,
	combout => \U1|Add0~46_combout\,
	cout => \U1|Add0~47\);

-- Location: FF_X25_Y14_N15
\U1|cnt[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U1|Add0~46_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|cnt\(23));

-- Location: LCCOMB_X25_Y14_N16
\U1|Add0~48\ : cycloneiv_lcell_comb
-- Equation(s):
-- \U1|Add0~48_combout\ = (\U1|cnt\(24) & (\U1|Add0~47\ $ (GND))) # (!\U1|cnt\(24) & (!\U1|Add0~47\ & VCC))
-- \U1|Add0~49\ = CARRY((\U1|cnt\(24) & !\U1|Add0~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U1|cnt\(24),
	datad => VCC,
	cin => \U1|Add0~47\,
	combout => \U1|Add0~48_combout\,
	cout => \U1|Add0~49\);

-- Location: FF_X25_Y14_N17
\U1|cnt[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U1|Add0~48_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|cnt\(24));

-- Location: LCCOMB_X25_Y14_N18
\U1|Add0~50\ : cycloneiv_lcell_comb
-- Equation(s):
-- \U1|Add0~50_combout\ = (\U1|cnt\(25) & (!\U1|Add0~49\)) # (!\U1|cnt\(25) & ((\U1|Add0~49\) # (GND)))
-- \U1|Add0~51\ = CARRY((!\U1|Add0~49\) # (!\U1|cnt\(25)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U1|cnt\(25),
	datad => VCC,
	cin => \U1|Add0~49\,
	combout => \U1|Add0~50_combout\,
	cout => \U1|Add0~51\);

-- Location: FF_X25_Y14_N19
\U1|cnt[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U1|Add0~50_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|cnt\(25));

-- Location: LCCOMB_X25_Y14_N20
\U1|Add0~52\ : cycloneiv_lcell_comb
-- Equation(s):
-- \U1|Add0~52_combout\ = (\U1|cnt\(26) & (\U1|Add0~51\ $ (GND))) # (!\U1|cnt\(26) & (!\U1|Add0~51\ & VCC))
-- \U1|Add0~53\ = CARRY((\U1|cnt\(26) & !\U1|Add0~51\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U1|cnt\(26),
	datad => VCC,
	cin => \U1|Add0~51\,
	combout => \U1|Add0~52_combout\,
	cout => \U1|Add0~53\);

-- Location: FF_X25_Y14_N21
\U1|cnt[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U1|Add0~52_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|cnt\(26));

-- Location: LCCOMB_X25_Y14_N22
\U1|Add0~54\ : cycloneiv_lcell_comb
-- Equation(s):
-- \U1|Add0~54_combout\ = (\U1|cnt\(27) & (!\U1|Add0~53\)) # (!\U1|cnt\(27) & ((\U1|Add0~53\) # (GND)))
-- \U1|Add0~55\ = CARRY((!\U1|Add0~53\) # (!\U1|cnt\(27)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|cnt\(27),
	datad => VCC,
	cin => \U1|Add0~53\,
	combout => \U1|Add0~54_combout\,
	cout => \U1|Add0~55\);

-- Location: FF_X25_Y14_N23
\U1|cnt[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U1|Add0~54_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|cnt\(27));

-- Location: LCCOMB_X26_Y14_N2
\U1|Equal0~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \U1|Equal0~1_combout\ = (!\U1|cnt\(24) & (!\U1|cnt\(25) & (!\U1|cnt\(26) & !\U1|cnt\(27))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U1|cnt\(24),
	datab => \U1|cnt\(25),
	datac => \U1|cnt\(26),
	datad => \U1|cnt\(27),
	combout => \U1|Equal0~1_combout\);

-- Location: LCCOMB_X25_Y14_N24
\U1|Add0~56\ : cycloneiv_lcell_comb
-- Equation(s):
-- \U1|Add0~56_combout\ = (\U1|cnt\(28) & (\U1|Add0~55\ $ (GND))) # (!\U1|cnt\(28) & (!\U1|Add0~55\ & VCC))
-- \U1|Add0~57\ = CARRY((\U1|cnt\(28) & !\U1|Add0~55\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U1|cnt\(28),
	datad => VCC,
	cin => \U1|Add0~55\,
	combout => \U1|Add0~56_combout\,
	cout => \U1|Add0~57\);

-- Location: FF_X25_Y14_N25
\U1|cnt[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U1|Add0~56_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|cnt\(28));

-- Location: LCCOMB_X25_Y14_N26
\U1|Add0~58\ : cycloneiv_lcell_comb
-- Equation(s):
-- \U1|Add0~58_combout\ = (\U1|cnt\(29) & (!\U1|Add0~57\)) # (!\U1|cnt\(29) & ((\U1|Add0~57\) # (GND)))
-- \U1|Add0~59\ = CARRY((!\U1|Add0~57\) # (!\U1|cnt\(29)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|cnt\(29),
	datad => VCC,
	cin => \U1|Add0~57\,
	combout => \U1|Add0~58_combout\,
	cout => \U1|Add0~59\);

-- Location: FF_X25_Y14_N27
\U1|cnt[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U1|Add0~58_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|cnt\(29));

-- Location: LCCOMB_X25_Y14_N28
\U1|Add0~60\ : cycloneiv_lcell_comb
-- Equation(s):
-- \U1|Add0~60_combout\ = (\U1|cnt\(30) & (\U1|Add0~59\ $ (GND))) # (!\U1|cnt\(30) & (!\U1|Add0~59\ & VCC))
-- \U1|Add0~61\ = CARRY((\U1|cnt\(30) & !\U1|Add0~59\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \U1|cnt\(30),
	datad => VCC,
	cin => \U1|Add0~59\,
	combout => \U1|Add0~60_combout\,
	cout => \U1|Add0~61\);

-- Location: FF_X25_Y14_N29
\U1|cnt[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U1|Add0~60_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|cnt\(30));

-- Location: LCCOMB_X25_Y14_N30
\U1|Add0~62\ : cycloneiv_lcell_comb
-- Equation(s):
-- \U1|Add0~62_combout\ = \U1|cnt\(31) $ (\U1|Add0~61\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \U1|cnt\(31),
	cin => \U1|Add0~61\,
	combout => \U1|Add0~62_combout\);

-- Location: FF_X25_Y14_N31
\U1|cnt[31]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U1|Add0~62_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|cnt\(31));

-- Location: LCCOMB_X26_Y14_N8
\U1|Equal0~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \U1|Equal0~0_combout\ = (!\U1|cnt\(29) & (!\U1|cnt\(28) & (!\U1|cnt\(31) & !\U1|cnt\(30))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U1|cnt\(29),
	datab => \U1|cnt\(28),
	datac => \U1|cnt\(31),
	datad => \U1|cnt\(30),
	combout => \U1|Equal0~0_combout\);

-- Location: LCCOMB_X26_Y14_N12
\U1|Equal0~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \U1|Equal0~2_combout\ = (!\U1|cnt\(22) & (!\U1|cnt\(23) & (!\U1|cnt\(20) & !\U1|cnt\(21))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U1|cnt\(22),
	datab => \U1|cnt\(23),
	datac => \U1|cnt\(20),
	datad => \U1|cnt\(21),
	combout => \U1|Equal0~2_combout\);

-- Location: LCCOMB_X26_Y14_N0
\U1|Equal0~4\ : cycloneiv_lcell_comb
-- Equation(s):
-- \U1|Equal0~4_combout\ = (\U1|Equal0~3_combout\ & (\U1|Equal0~1_combout\ & (\U1|Equal0~0_combout\ & \U1|Equal0~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U1|Equal0~3_combout\,
	datab => \U1|Equal0~1_combout\,
	datac => \U1|Equal0~0_combout\,
	datad => \U1|Equal0~2_combout\,
	combout => \U1|Equal0~4_combout\);

-- Location: LCCOMB_X26_Y15_N12
\U1|Equal0~10\ : cycloneiv_lcell_comb
-- Equation(s):
-- \U1|Equal0~10_combout\ = (\U1|Equal0~9_combout\ & (\U1|Equal0~8_combout\ & (\U1|Equal0~7_combout\ & \U1|Equal0~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U1|Equal0~9_combout\,
	datab => \U1|Equal0~8_combout\,
	datac => \U1|Equal0~7_combout\,
	datad => \U1|Equal0~4_combout\,
	combout => \U1|Equal0~10_combout\);

-- Location: LCCOMB_X26_Y15_N0
\U1|clk_div~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \U1|clk_div~0_combout\ = \U1|clk_div~q\ $ (\U1|Equal0~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \U1|clk_div~q\,
	datad => \U1|Equal0~10_combout\,
	combout => \U1|clk_div~0_combout\);

-- Location: FF_X26_Y15_N1
\U1|clk_div\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \U1|clk_div~0_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U1|clk_div~q\);

ww_clk_div <= \clk_div~output_o\;
END structure;


