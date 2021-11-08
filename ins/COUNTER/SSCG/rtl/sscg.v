// Sequence Serial Code Generation
module sscg(
	input clk,
	input rst_n,
	input load,
	
	output reg [15:0] seq,
	output wire [4:0] Led 
	);
	
	// wire
	// reg
	// parameter
	parameter [15:0] seq_pre =  16'b0000_1101_1001_0101;
	// parameter [4:0] seq_dec = 5'b10110;
	
	// Shift register
	always@(posedge clk, negedge rst_n) begin
		if(!rst_n) seq <= 0;
		else if(load) seq <= seq_pre;
		else begin
			seq <= {seq[14:0],seq[15]};
		end
	end
		
	assign Led = seq[4:0];

endmodule