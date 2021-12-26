// Sequence Serial Code Generation

module sscg(
	input clk,		// clock , default is 50MHz
	input rst_n,	// reset signal
	input load,		// load signal
	
	output reg [15:0] seq,	// sequence serial code register
	output wire [4:0] Led 	// 5-bit LEDs
	);
	
	// PARAMETER DEFINE
	parameter [15:0] SEQ_PRE = 16'b0000_1101_1001_0101; // pre-programmed sequence codes
	// parameter [4:0] seq_dec = 5'b10110; // signal to be detected
	
	// Shift register
	always@(posedge clk, negedge rst_n) begin
		if(!rst_n) seq <= 0;
		else if(load) seq <= SEQ_PRE;
		else begin
			seq <= {seq[14:0],seq[15]};
		end
	end
		
	assign Led = seq[4:0]; // Represents the last five digits ([4:0]) of a sequence

endmodule