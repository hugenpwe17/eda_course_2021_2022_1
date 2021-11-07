// Sequence Signal Detector
module ssd(
	input clk,
	input rst_n,
	input seq_bit,
	
	output seq_jug,
	output reg [2:0] state	);
	
	//wire
	
	//reg
	//reg [2:0] state;
	
	// parameter
	// parameter [15:0] seq_pre =  16'b0000_1101_1001_0101;
	// parameter [4:0] seq_dec = 5'b10110;
	
	// Sequence state coding
	parameter idle = 3'b000, s1 = 3'b001, s2 = 3'b010,
				s3 = 3'b011, s4 = 3'b100, s5 = 3'b101; 
	
	
	// State machine implementation
	always@(posedge clk, negedge rst_n)begin
		if(~rst_n) state <= idle;
		else begin
			case(state)
				idle: begin
					if(seq_bit == 1) state <= s1;
					else state <= idle;
				end
				s1:begin
					if(seq_bit == 0) state <= s2;
					else state <= s1;
				end
				s2:begin
					if(seq_bit == 1) state <= s3;
					else state <= idle;
				end
				s3:begin
					if(seq_bit == 1) state <= s4;
					else state <= s2;
				end
				s4:begin
					if(seq_bit == 0) state <= s5;
					else state <= idle;
				end
				s5:begin
					if(seq_bit == 0) state <= idle;
					else state <= s3;
				end
				default: state <= idle;
			endcase
		end
	end
	assign seq_jug = (state == s5) ? 1:0;

endmodule