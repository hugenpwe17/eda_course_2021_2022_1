module signal_generator_control (
    input clk,
    input rst_n,

    input W_ctrl,	// Wave control
	input A_ctrl,	// Amplitude control
	input P_ctrl,	// Phase control
	input F_ctrl,	// Frequency control
 
    output reg [11:0] wave_out,

	// // static seg pin
	// output reg [7:0] W_seg0,
	// output reg [7:0] W_seg1

	// output reg [7:0] A_seg0,
	// output reg [7:0] A_seg1,

	// output reg [7:0] F_seg0,
	// output reg [7:0] F_seg1,

	// dynamic seg pin 
	output wire [5:0] sel,
    output wire [7:0] seg
);

	initial begin
		Wave		<= 0;
		Amplitude	<= 1;
		Phase		<= 0;
		Frequency	<= 1;
	end
	
	reg [1:0] r_W; // Wave switch signal edge detection register
	reg [1:0] r_A; // Amplitude switch signal edge detection register
	reg [1:0] r_P; // Phase switch signal edge detection register
	reg [1:0] r_F; // Frequency switch signal edge detection register

	reg [1:0] Wave = 2'd0; // WaveForm switch signal(1-Sin, 2-Sawtooth, 3-Square)
	reg [3:0] Amplitude = 4'd1; // Amplitude switch signal(1-50x Amplitude per switch)
	reg [8:0] Phase = 9'd0; // Phase switch signal(ahead 360*(256/8)=45 degree per switch)
	reg [5:0] Frequency = 6'd1; // Frequency switch signal(1-50x Frequency per switch)

	reg [8:0] Address = 9'd0; // Address of wave data
	
	wire [7:0] wave_Sin;	
	wire [7:0] wave_Sawtooth;	
	wire [7:0] wave_Square;	

	// Wave switch signal edge detecting
	always @(posedge clk) begin
		r_W <= {r_W[0], W_ctrl};
	end
	// Amplitude switch signal edge detecting
	always @(posedge clk) begin
		r_A <= {r_A[0], A_ctrl};
	end
	// Phase switch signal edge detecting
	always @(posedge clk) begin
		r_P <= {r_P[0], P_ctrl};
	end
	// Frequency switch signal edge detecting
	always @(posedge clk) begin
		r_F <= {r_F[0], F_ctrl};
	end

	// WaveForm switch
	always @(posedge clk, negedge rst_n) begin
		if(!rst_n) begin
			Wave <= 2'b0;
		end
		else begin
			if(r_W == 2'b01) begin
				if(Wave == 2'd2) begin
					Wave <= 1'b0;
				end
				else begin
					Wave <= Wave + 1'b1;
				end
			end
			else begin
				Wave <= Wave;
			end
		end
	end
	// Amplitude switch
	always @(posedge clk, negedge rst_n) begin
		if(!rst_n) begin
			Amplitude <= 1'b1;
		end
		else begin
			if(r_A == 2'b01) begin
				if(Amplitude == 4'd15) begin
					Amplitude <= 1'b1;
				end
				else begin
					Amplitude <= Amplitude + 1'b1;
				end
			end
			else begin
				Amplitude <= Amplitude;
			end
		end
	end
	// Frequency switch
	always @(posedge clk, negedge rst_n) begin
		if(!rst_n) begin
			Frequency <= 1'b1;
		end
		else begin
			if(r_F == 2'b01) begin
				if(Frequency == 6'd50) begin
					Frequency <= 1'b1;
				end
				else begin
					Frequency <= Frequency + 1'b1;
				end
			end
			else begin
				Frequency <= Frequency;
			end
		end
	end	
	// Phase and Adress control
	always @(posedge clk, negedge rst_n) begin
		if(!rst_n) begin
			Phase <= 9'd0;
			Address <= 9'd0;
		end
		else begin
			if(r_P == 2'b01) begin
				if(Phase == 9'd448) begin
					Phase <= 9'd0;
				end
				else begin
					Phase <= Phase + 64;
					Address <= Phase;
				end
			end
			else begin
				Phase <= Phase;
				Address <= Address + Frequency;
			end
		end
	end

	// Output Wave
	always @(posedge clk) begin
		case (Wave)
			2'b00: wave_out <= wave_Sin * Amplitude;
			2'b01: wave_out <= wave_Sawtooth * Amplitude;
			2'b10: wave_out <= wave_Square * Amplitude;
			default: wave_out <= 12'd0; 
		endcase
	end

	// Rom_Sin
	rom_sin	rom_sin_inst (
	.address ( Address ),
	.clock ( clk ),
	.q ( wave_Sin )
	);
	// Rom_Sawtooth
	rom_sawtooth	rom_sawtooth_inst (
	.address ( Address ),
	.clock ( clk ),
	.q ( wave_Sawtooth )
	);
	// Rom_Square
	rom_square	rom_square_inst (
	.address ( Address ),
	.clock ( clk ),
	.q ( wave_Square )
	);

	// // ---------static seg--------------
	// cnt_seg_static u_cnt_seg_static1(
	// 	.cnt4 ( Amplitude ),
	// 	.seg  ( A_seg0  )
	// );
	// cnt_seg_static u_cnt_seg_static2(
	// 	.cnt4 ( 4'b0    ),
	// 	.seg  ( A_seg1  )
	// );

	// cnt_seg_static u_cnt_seg_static3(
	// 	.cnt4 ( Frequency[3:0]    ),
	// 	.seg  ( F_seg0  )
	// );
	// cnt_seg_static u_cnt_seg_static4(
	// 	.cnt4 ( {1'b0, 1'b0, Frequency[5:4]}    ),
	// 	.seg  ( F_seg1  )
	// );

	// cnt_seg_static u_cnt_seg_static5(
	// 	.cnt4 ( {1'b0, 1'b0, Wave}    ),
	// 	.seg  ( W_seg0  )
	// );
	// cnt_seg_static u_cnt_seg_static6(
	// 	.cnt4 ( 4'b0    ),
	// 	.seg  ( W_seg1  )
	// );

	// ---------dynamic seg-------------
	cnt_seg_dync#(
		.stay_time ( 16'd50_000 )
	)u_cnt_seg_dync(
		.clk   ( clk   ),
		.rst_n ( rst_n ),
		.num   ({{6'b0, Wave}, {4'b0, Amplitude}, {2'b0, Frequency[5:0]}}),
		.sel   ( sel   ),
		.seg   ( seg   )
	);

endmodule