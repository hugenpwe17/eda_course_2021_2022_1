// Sequence signal generation and detectation test
// The sequence generator: 16'b0000_1101_1001_0101;
// Sequence detector: 5'b10110;

module SS_TEST(
	input clk,
	input rst_n,
	input load,
	
	output seq_jug,
	output wire [15:0] seq,
	output wire [2:0] state
	);
	
	// wire
	wire [4:0] net;

	// main code

	sscg u_sscg(
		.clk   ( !clk   ),
		.rst_n ( rst_n ),
		.load  ( !load  ),
		.seq   ( seq   ),
		.Led   ( net   )
	);

	ssd u_ssd(
    .clk     ( !clk     ),
    .rst_n   ( rst_n   ),
    .seq_bit ( net[0]  ),
    .seq_jug ( seq_jug ),
    .state   ( state   )
	);

endmodule