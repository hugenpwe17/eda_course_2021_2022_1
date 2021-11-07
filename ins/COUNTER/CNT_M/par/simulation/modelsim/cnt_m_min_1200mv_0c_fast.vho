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

-- DATE "11/06/2021 19:55:18"

-- 
-- Device: Altera EP4CE10F17C8 Package FBGA256
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	cnt_m IS
    PORT (
	sys_clk : IN std_logic;
	sys_rst_n : IN std_logic;
	cnt : BUFFER std_logic_vector(3 DOWNTO 0)
	);
END cnt_m;

-- Design Ports Information
-- cnt[0]	=>  Location: PIN_F5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cnt[1]	=>  Location: PIN_E5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cnt[2]	=>  Location: PIN_B1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cnt[3]	=>  Location: PIN_D4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sys_clk	=>  Location: PIN_E1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sys_rst_n	=>  Location: PIN_M2,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF cnt_m IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_sys_clk : std_logic;
SIGNAL ww_sys_rst_n : std_logic;
SIGNAL ww_cnt : std_logic_vector(3 DOWNTO 0);
SIGNAL \sys_rst_n~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \sys_clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \cnt[0]~output_o\ : std_logic;
SIGNAL \cnt[1]~output_o\ : std_logic;
SIGNAL \cnt[2]~output_o\ : std_logic;
SIGNAL \cnt[3]~output_o\ : std_logic;
SIGNAL \sys_clk~input_o\ : std_logic;
SIGNAL \sys_clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \cnt[0]~3_combout\ : std_logic;
SIGNAL \sys_rst_n~input_o\ : std_logic;
SIGNAL \sys_rst_n~inputclkctrl_outclk\ : std_logic;
SIGNAL \cnt[0]~reg0_q\ : std_logic;
SIGNAL \cnt[1]~0_combout\ : std_logic;
SIGNAL \cnt[1]~reg0_q\ : std_logic;
SIGNAL \cnt[2]~1_combout\ : std_logic;
SIGNAL \cnt[2]~reg0_q\ : std_logic;
SIGNAL \cnt[3]~2_combout\ : std_logic;
SIGNAL \cnt[3]~reg0_q\ : std_logic;

BEGIN

ww_sys_clk <= sys_clk;
ww_sys_rst_n <= sys_rst_n;
cnt <= ww_cnt;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\sys_rst_n~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \sys_rst_n~input_o\);

\sys_clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \sys_clk~input_o\);

-- Location: IOOBUF_X0_Y23_N16
\cnt[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \cnt[0]~reg0_q\,
	devoe => ww_devoe,
	o => \cnt[0]~output_o\);

-- Location: IOOBUF_X0_Y23_N9
\cnt[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \cnt[1]~reg0_q\,
	devoe => ww_devoe,
	o => \cnt[1]~output_o\);

-- Location: IOOBUF_X0_Y22_N2
\cnt[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \cnt[2]~reg0_q\,
	devoe => ww_devoe,
	o => \cnt[2]~output_o\);

-- Location: IOOBUF_X0_Y23_N2
\cnt[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \cnt[3]~reg0_q\,
	devoe => ww_devoe,
	o => \cnt[3]~output_o\);

-- Location: IOIBUF_X0_Y11_N8
\sys_clk~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_sys_clk,
	o => \sys_clk~input_o\);

-- Location: CLKCTRL_G2
\sys_clk~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \sys_clk~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \sys_clk~inputclkctrl_outclk\);

-- Location: LCCOMB_X1_Y23_N12
\cnt[0]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \cnt[0]~3_combout\ = !\cnt[0]~reg0_q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \cnt[0]~reg0_q\,
	combout => \cnt[0]~3_combout\);

-- Location: IOIBUF_X0_Y11_N15
\sys_rst_n~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_sys_rst_n,
	o => \sys_rst_n~input_o\);

-- Location: CLKCTRL_G4
\sys_rst_n~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \sys_rst_n~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \sys_rst_n~inputclkctrl_outclk\);

-- Location: FF_X1_Y23_N13
\cnt[0]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~inputclkctrl_outclk\,
	d => \cnt[0]~3_combout\,
	clrn => \sys_rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cnt[0]~reg0_q\);

-- Location: LCCOMB_X1_Y23_N6
\cnt[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \cnt[1]~0_combout\ = \cnt[1]~reg0_q\ $ (\cnt[0]~reg0_q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \cnt[1]~reg0_q\,
	datad => \cnt[0]~reg0_q\,
	combout => \cnt[1]~0_combout\);

-- Location: FF_X1_Y23_N7
\cnt[1]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~inputclkctrl_outclk\,
	d => \cnt[1]~0_combout\,
	clrn => \sys_rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cnt[1]~reg0_q\);

-- Location: LCCOMB_X1_Y23_N24
\cnt[2]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \cnt[2]~1_combout\ = \cnt[2]~reg0_q\ $ (((\cnt[1]~reg0_q\ & \cnt[0]~reg0_q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \cnt[1]~reg0_q\,
	datac => \cnt[2]~reg0_q\,
	datad => \cnt[0]~reg0_q\,
	combout => \cnt[2]~1_combout\);

-- Location: FF_X1_Y23_N25
\cnt[2]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~inputclkctrl_outclk\,
	d => \cnt[2]~1_combout\,
	clrn => \sys_rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cnt[2]~reg0_q\);

-- Location: LCCOMB_X1_Y23_N30
\cnt[3]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \cnt[3]~2_combout\ = \cnt[3]~reg0_q\ $ (((\cnt[0]~reg0_q\ & (\cnt[2]~reg0_q\ & \cnt[1]~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \cnt[0]~reg0_q\,
	datab => \cnt[2]~reg0_q\,
	datac => \cnt[3]~reg0_q\,
	datad => \cnt[1]~reg0_q\,
	combout => \cnt[3]~2_combout\);

-- Location: FF_X1_Y23_N31
\cnt[3]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~inputclkctrl_outclk\,
	d => \cnt[3]~2_combout\,
	clrn => \sys_rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cnt[3]~reg0_q\);

ww_cnt(0) <= \cnt[0]~output_o\;

ww_cnt(1) <= \cnt[1]~output_o\;

ww_cnt(2) <= \cnt[2]~output_o\;

ww_cnt(3) <= \cnt[3]~output_o\;
END structure;


