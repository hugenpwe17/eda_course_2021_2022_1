// Sequence signal generation and detectation test
// The sequence generator: 16'b0000_1101_1001_0101;
// Sequence detector: 5'b10110;

module ssgd_control(
	input 				clk,		// clock, default is 50MHz	
	input 				rst_n,		// reset signal
	input 				load,		// load signal
	
	output 				seq_jug,	// Determine whether the signal(5'b10110) is detected,
									// 1 => Determine whether a signal is detected,
									// 0 => nothing.
	output wire [15:0] 	seq,		// the sequence signal generation(16'b0000_1101_1001_0101)
	output wire [2:0] 	state		// state of FSM(finite state machine)
	);
	
	// wire
	wire [4:0] net;		// connecting seq[4:0] to led,
						// and output the last bit seq[0] to detector.

	// generating sequence signal
	sscg u_sscg(
		.clk   ( clk   ),
		.rst_n ( rst_n ),
		.load  ( load  ),
		.seq   ( seq   ),
		.Led   ( net   )
	);

	// detecting sequence signal and output the state
	ssd u_ssd(
		.clk     ( clk     ),
		.rst_n   ( rst_n   ),
		.seq_bit ( net[0]  ),
		.seq_jug ( seq_jug ),
		.state   ( state   )
	);

endmodule