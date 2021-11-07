// Sequence signal generation and detectation test
module SS_TEST(
	input clk,
	input rst_n,
	input load,
	
	output seq_jug,
	output wire [15:0] seq,
	output wire [3:0] state );
	
	// wire
	wire [4:0] net;
	// reg
	// main code
	SSCG U1(.clk(clk), .rst_n(rst_n), .load(load), .seq(seq), .Led(net));
	SSD U2(.clk(clk), .rst_n(rst_n), .seq_bit(net[0]), .seq_jug(seq_jug), .state(state));
	
endmodule