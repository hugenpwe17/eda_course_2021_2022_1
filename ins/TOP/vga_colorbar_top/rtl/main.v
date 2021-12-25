module main (
    input wire          clk,
    input wire          rst_n,

    output wire         video_de,
    output wire         video_hs,
    output wire         video_vs,
    output wire [5:0]   video_rgb
);

    wire [10:0] pixel_xpos;
    wire [10:0] pixel_ypos;
    wire [5:0]  pixel_data;
    wire pixel_clk;

    pll_clk  u_pll_clk(
	.areset    (~rst_n),
	.inclk0    (clk),
	.c0        (pixel_clk)      //像素时钟
);

    vga_driver u_vga_driver(
        .pixel_clk      ( pixel_clk  ),
        .sys_rst_n      ( rst_n      ),

        .pixel_xpos     ( pixel_xpos ),
        .pixel_ypos     ( pixel_ypos ),
        .pixel_data     ( pixel_data ),

        .video_hs       ( video_hs   ),
        .video_vs       ( video_vs   ),
        .video_de       ( video_de   ),
        .video_rgb      ( video_rgb  )
);

    vga_display u_vga_display(
        .pixel_clk      ( pixel_clk  ),
        .sys_rst_n      ( rst_n      ),

        .pixel_xpos     ( pixel_xpos ),
        .pixel_ypos     ( pixel_ypos ),
        .pixel_data     ( pixel_data )
    );


endmodule