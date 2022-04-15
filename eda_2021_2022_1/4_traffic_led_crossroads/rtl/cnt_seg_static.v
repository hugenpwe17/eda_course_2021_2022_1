// 8_SEG_HEX_LED(common anode)

module cnt_seg_static(
	input wire [3:0] cnt4,	// 4-bit binary code input
	output reg [7:0] seg	// 1-bit hex static segment code output
);
	initial seg = 8'b1111_1111;	// default => Blanking
	
	always @(cnt4) begin
		case (cnt4)
			4'H0: seg = 8'b1100_0000; 4'H1: seg = 8'b1111_1001;
			4'H2: seg = 8'b1010_0100; 4'H3: seg = 8'b1011_0000;
			4'H4: seg = 8'b1001_1001; 4'H5: seg = 8'b1001_0010;
			4'H6: seg = 8'b1000_0010; 4'H7: seg = 8'b1111_1000;
			4'H8: seg = 8'b1000_0000; 4'H9: seg = 8'b1001_0000;
			4'HA: seg = 8'b1000_1000; 4'HB: seg = 8'b1000_0011;
			4'HC: seg = 8'b1100_0110; 4'HD: seg = 8'b1010_0001;
			4'HE: seg = 8'b1000_0110; 4'HF: seg = 8'b1000_1110;
			default: seg = 8'b1111_1111;
		endcase
	end
	
endmodule