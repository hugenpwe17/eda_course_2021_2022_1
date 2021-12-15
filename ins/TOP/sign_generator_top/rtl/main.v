module main (
    input clk,
    input rst_n,

    input W_ctrl,	// Wave control
	input A_ctrl,	// Amplitude control
	input P_ctrl,	// Phase control
	input F_ctrl,	// Frequency controls
 
	output wire [11:0] wave_out,

	// // static seg pin
	// output wire [7:0] A_seg0,
	// output wire [7:0] A_seg1,

	// output wire [7:0] F_seg0,
	// output wire [7:0] F_seg1,

	// output wire [7:0] W_seg0,
	// output wire [7:0] W_seg1

	// dynamic seg pin 
	output wire [5:0] sel,
    output wire [7:0] seg,

	output wire              ram_wr_en  , //ram写使能
	output wire    [9:0]     ram_wr_addr, //ram写地址
	output wire    [11:0]    ram_wr_data, //ram写数据
	output wire              ram_rd_en  , //ram读使能
	output wire    [9:0]     ram_rd_addr, //ram读地址
	output wire    [11:0]    ram_rd_data, //ram读数据 

	output       tmds_clk_p,    // TMDS 时钟通道
    output       tmds_clk_n,
    output [2:0] tmds_data_p,   // TMDS 数据通道
    output [2:0] tmds_data_n

);

	//wire define
	wire          pixel_clk;
	wire          pixel_clk_5x;
	wire          clk_locked;

	wire  [10:0]  pixel_xpos_w;
	wire  [10:0]  pixel_ypos_w;
	wire  [23:0]  pixel_data_w;

	wire          video_hs;
	wire          video_vs;
	wire          video_de;
	wire  [23:0]  video_rgb;

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

	//RAM写模块
	ram_wr u_ram_wr(
		.clk         ( clk         ),
		.rst_n       ( rst_n       ),
		.wave_out    ( wave_out    ),

		.ram_wr_en   ( ram_wr_en   ),
		.ram_wr_addr ( ram_wr_addr ),
		.ram_wr_data  ( ram_wr_data  )
	);


	ram2	ram2_inst (
		.data 		( ram_wr_data ),
		.rdaddress 	( ram_rd_addr ),
		.rdclock 	( clk ),
		.rden 		( ram_rd_en ),
		.wraddress 	( ram_wr_addr ),
		.wrclock 	( clk ),
		.wren 		( ram_wr_en ),
		.q 			( ram_rd_data )
	);

	//RAM读模块    
	ram_rd u_ram_rd(
		.clk         ( clk         ),
		.rst_n       ( rst_n       ),

		.pixel_xpos  ( pixel_xpos_w  ),
		.pixel_ypos  ( pixel_ypos_w  ),

		.ram_rd_en   ( ram_rd_en   ),
		.ram_rd_addr ( ram_rd_addr ),
		.ram_rd_data ( ram_rd_data ),
		
		.pixel_flag  ( pixel_flag  )
	);

	//例化PLL IP核
	pll_clk  u_pll_clk(
		.areset    (!rst_n),
		.inclk0    (clk),
		.c0        (pixel_clk),      //像素时钟
		.c1        (pixel_clk_5x),   //5倍像素时钟
		.locked    (clk_locked)
	);

	//例化视频显示驱动模块
	video_driver u_video_driver(
		.pixel_clk      (pixel_clk),
		.sys_rst_n      (rst_n),

		.video_hs       (video_hs),
		.video_vs       (video_vs),
		.video_de       (video_de),
		.video_rgb      (video_rgb),

		.pixel_xpos     (pixel_xpos_w),
		.pixel_ypos     (pixel_ypos_w),
		.pixel_data     (pixel_data_w)
	);

	//例化视频显示模块
	video_display  u_video_display(
		.pixel_clk      (pixel_clk),
		.sys_rst_n      (rst_n),

		.pixel_flag  ( pixel_flag  ),

		.pixel_xpos     (pixel_xpos_w),
		.pixel_ypos     (pixel_ypos_w),
		.pixel_data     (pixel_data_w)
	);

	//例化HDMI驱动模块
	dvi_transmitter_top u_rgb2dvi_0(
		.pclk           (pixel_clk),
		.pclk_x5        (pixel_clk_5x),
		.reset_n        (rst_n & clk_locked),
					
		.video_din      (video_rgb),
		.video_hsync    (video_hs), 
		.video_vsync    (video_vs),
		.video_de       (video_de),
					
		.tmds_clk_p     (tmds_clk_p),
		.tmds_clk_n     (tmds_clk_n),
		.tmds_data_p    (tmds_data_p),
		.tmds_data_n    (tmds_data_n)
	);


endmodule