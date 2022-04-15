module main_dds (
    input 					clk,		// clock, default is 50MHz
    input 					rst_n,		// reset signal

    input 					W_ctrl,		// Wave control
	input 					A_ctrl,		// Amplitude control
	input 					P_ctrl,		// Phase control
	input 					F_ctrl,		// Frequency controls
 
	output wire 	[11:0] 	wave_out,	// waveform serial data output

	// // static seg pin
	// output wire [7:0] A_seg0,
	// output wire [7:0] A_seg1,

	// output wire [7:0] F_seg0,
	// output wire [7:0] F_seg1,

	// output wire [7:0] W_seg0,
	// output wire [7:0] W_seg1

	// dynamic seg pin {Wave, Amplitude, Frequency, Phase}
	output wire 	[5:0] 	sel,		// bit select signal
    output wire 	[7:0] 	seg			// segment select signal

);

	// // static display
	// signal_generator_control u_signal_generator_control(
	// 	.clk      ( clk      ),
	// 	.rst_n    ( rst_n    ),
	// 	.W_ctrl   ( !W_ctrl   ),
	// 	.A_ctrl   ( !A_ctrl   ),
	// 	.P_ctrl   ( !P_ctrl   ),
	// 	.F_ctrl   ( !F_ctrl   ),
	// 	.wave_out ( wave_out ),
	// 	.W_seg0   ( W_seg0   ),
	// 	.W_seg1   ( W_seg1   ),
	// 	.A_seg0   ( A_seg0   ),
	// 	.A_seg1   ( A_seg1   ),
	// 	.F_seg0   ( F_seg0   ),
	// 	.F_seg1   ( F_seg1   )
	// );

	// dynamic display
	signal_generator_control u_signal_generator_control(
		.clk      ( clk      ),
		.rst_n    ( rst_n    ),

		.W_ctrl   ( W_ctrl   ),
		.A_ctrl   ( A_ctrl   ),
		.P_ctrl   ( P_ctrl   ),
		.F_ctrl   ( F_ctrl   ),
		
		.wave_out ( wave_out ),
		
		.sel      ( sel      ),
		.seg      ( seg      )
	);

endmodule