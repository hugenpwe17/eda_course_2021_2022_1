module main (
    input 				clk,		// clock, default is 50MHz
    input 				rst_n,		// reset signal

    input 				W_ctrl,		// Wave control
	input 				A_ctrl,		// Amplitude control
	input 				P_ctrl,		// Phase control
	input 				F_ctrl,		// Frequency controls

    output  wire [5:0] 	sel,		// bit select signal
    output  wire [7:0] 	seg,			// segment select signal
    
    output  wire        vga_sync_h, // vga horizontal sync signal        
    output  wire        vga_sync_v, // vga vertical sync signal
    output  wire  [5:0]  vga_rgb,    // vga color data {2'd{red}, 2'd{green}, 2'd{blue}}

    output  wire        fengmingqi  // buzzer(beep) signal
);
    assign fengmingqi = 1'b0;

    wire [11:0] wave_out;

    main_dds u_main_dds(
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

    wire        ram_wr_en;
    wire [9:0]  ram_wr_addr;
    wire [11:0] ram_wr_data;

    //RAM闂佸憡鍔栭悷锕佸暞闂
	ram_wr u_ram_wr(
		.clk         ( clk         ),
		.rst_n       ( rst_n       ),
		.wave_out    ( wave_out    ),

		.ram_wr_en   ( ram_wr_en   ),
		.ram_wr_addr ( ram_wr_addr ),
		.ram_wr_data ( ram_wr_data )
	);


	ram2	ram2_inst (
		.data 		( ram_wr_data ),
		.rdaddress 	( ram_rd_addr ),
		.rdclock 	( clk         ),
		.rden 		( ram_rd_en   ),
		.wraddress 	( ram_wr_addr ),
		.wrclock 	( clk         ),
		.wren 		( ram_wr_en   ),
		.q 			( ram_rd_data )
	);

    wire        ram_rd_en;
    wire [9:0]  ram_rd_addr;
    wire [11:0] ram_rd_data;
    wire [5:0]  vga_wave;

	//RAM闁荤姴娲ㄧ划顖濆暞闂
    ram_rd u_ram_rd(
        .clk         ( clk         ),
        .rst_n       ( rst_n       ),

        .pixel_xpos  ( cnt_h       ),
        .pixel_ypos  ( cnt_v       ),

        .ram_rd_en   ( ram_rd_en   ),
        .ram_rd_addr ( ram_rd_addr ),
        .ram_rd_data ( ram_rd_data ),

        .vga_wave    ( vga_wave    )
    );

    wire        pixel_clk;
    wire [9:0]  cnt_h;
    wire [9:0]  cnt_v;
    wire 	[5:0]  vga_background;

    vga_driver u_vga_driver(
        .clk        ( clk        ),
        .pixel_clk  ( pixel_clk  ),

        .vga_wave   ( vga_wave   ),

        .cnt_h      ( cnt_h      ),
        .cnt_v      ( cnt_v      ),

        .vga_sync_h ( vga_sync_h ),
        .vga_sync_v ( vga_sync_v ),
        .vga_rgb    ( vga_rgb    )
    );

endmodule