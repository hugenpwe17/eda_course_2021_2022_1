module vga_driver(
    input   wire        clk,        // system clock 50MHz
    output  reg         pixel_clk,  // pixel clock 25MHz

    input   wire        vga_wave,
    
    output  reg [9:0]   cnt_h,
    output  reg [9:0]   cnt_v,
    
    output  wire        vga_sync_h, // vga horizontal sync signal        
    output  wire        vga_sync_v, // vga vertical sync signal

    output  reg [5:0]   vga_rgb     // vga color data {2'd{red}, 2'd{green}, 2'd{blue}}
);
	
    // TIMING DEFINE
    // 96 sync, 48 bp, 640 display, 16 fp
    integer HORIZONTAL_VISIBLE_AREA = 10'd640;
    integer HORIZONTAL_FRONT_PORCH  = 10'd16;
    integer HORIZONTAL_SYNC_PULSE   = 10'd96;
    integer HORIZONTAL_BACK_PORCH   = 10'd48;
    integer HORIZONTAL_WHOLE_LINE   = 10'd800;
    // 2  sync, 33 bp, 480 display, 10 fp
    integer VERTICAL_VISIBLE_AREA = 10'd480;
    integer VERTICAL_FRONT_PORCH  = 10'd10;
    integer VERTICAL_SYNC_PULSE   = 10'd2;
    integer VERTICAL_BACK_PORCH   = 10'd33;
    integer VERTICAL_WHOLE_LINE   = 10'd525;

    // COLOR DEFINE
    localparam WHITE = 6'b11_11_11;
    localparam BLACK = 6'b00_00_00;
    localparam RED   = 6'b11_00_00;
    localparam GREEN = 6'b00_11_00;
    localparam Green = 6'b00_01_00;
    localparam BLUE  = 6'b00_00_11;

    // clk (50MHz) to pixel_clk(25MHz of 640 * 480 @ 60Hz)
    reg p_clk;  // frequency division signal(temp)

	always@(posedge clk) begin
		p_clk <= ~p_clk; 
		pixel_clk <= p_clk;
	end
    
    // screen horizontal sweep
    always@(posedge pixel_clk) begin
		if(cnt_h === HORIZONTAL_WHOLE_LINE - 1'b1) begin
            cnt_h <= 1'b0;
        end else begin
            cnt_h <= cnt_h + 1'b1;
        end
	end

	// screen vertical sweep
	always@(posedge pixel_clk) begin
		if(cnt_h === HORIZONTAL_WHOLE_LINE - 1'b1) begin
			if(cnt_v === VERTICAL_WHOLE_LINE - 1'b1) begin
                cnt_v <= 1'b0;
            end else begin
                cnt_v <= cnt_v + 1'b1;    
            end
		end else begin
            cnt_v <= cnt_v;
        end
	end

    // generate screen sync signal
    reg p_hSync;    // horizontal sync define
    reg p_vSync;    // vertical sync define

	always@(posedge pixel_clk)
	begin
		p_hSync <= (
            (cnt_h >= HORIZONTAL_VISIBLE_AREA + HORIZONTAL_FRONT_PORCH)
        &&  (cnt_h < HORIZONTAL_VISIBLE_AREA + HORIZONTAL_FRONT_PORCH + HORIZONTAL_SYNC_PULSE)
        ); 
		p_vSync <= (
            (cnt_v >= VERTICAL_VISIBLE_AREA + VERTICAL_FRONT_PORCH) 
        &&  (cnt_v < VERTICAL_VISIBLE_AREA + VERTICAL_FRONT_PORCH + VERTICAL_SYNC_PULSE)
        ); 
	end
    // polarity of horizontal/vertical sync pulse is negative
	assign vga_sync_v = !p_vSync;
	assign vga_sync_h = !p_hSync;
	
    // vga's visible region
	wire dispaly_region; // display region flag

    assign dispaly_region = (
        (cnt_h < HORIZONTAL_VISIBLE_AREA) 
    &&  (cnt_v < VERTICAL_VISIBLE_AREA)
    );

    // waveform region
    wire waveform_region; // waveform region flag

    assign waveform_region = (
        ((cnt_h >= 64) && (cnt_h < 576))
    &&  ((cnt_v >= 112) && (cnt_v < 368))
    );

    // waveform edge 
    wire waveform_edge_region; // waveform region edge

    assign waveform_edge_region = (
        (cnt_h == 64)
    ||  (cnt_h == 575)
    ||  (cnt_v == 112)
    ||  (cnt_v == 367)
    );

    // waveform grid
    wire waveform_grid_region;

    assign waveform_grid_region = (
        (((cnt_h - 64) % 64 == 0) && (cnt_v[0]))
    ||  (((cnt_v - 112) % 64 == 0) && (cnt_h[0]))
    );

    // display settings
	always @(posedge pixel_clk) begin
        if (dispaly_region)begin
            // edge
            if (cnt_h == 0) begin               // left edge
                vga_rgb <= WHITE;
            end else if (cnt_h == 639) begin    // right edge
                vga_rgb <= WHITE;
            end else if (cnt_v == 0) begin      // top edge
                vga_rgb <= WHITE;
            end else if (cnt_v == 479) begin    // bottom edge
                vga_rgb <= WHITE;
            end
            
            else if (waveform_region) begin
                if (waveform_edge_region) begin
                    vga_rgb <= WHITE;
                end else if (vga_wave) begin
                    vga_rgb <= RED;
                end else if (waveform_grid_region) begin
                    vga_rgb <= Green;
                end
                else begin
                    vga_rgb <= BLACK;
                end
            end

            // // edge grid
            // else if ((cnt_h <= 10)&&(cnt_h % 2 == 0)&&(cnt_h != 0)) begin
            //     vga_rgb <= RED;
            // end else if ((cnt_v <= 10)&&(cnt_v % 2 == 0)&&(cnt_v != 0)) begin
            //     vga_rgb <= BLUE;
            // end else if ((cnt_h >= 629)&&(cnt_h % 2 == 1)&&(cnt_h != 639)) begin
            //     vga_rgb <= BLUE;
            // end else if ((cnt_v >= 469)&&(cnt_v % 2 == 1)&&(cnt_v != 479)) begin
            //     vga_rgb <= RED;
            // end
            
            // // grid
            // else if (((cnt_h % 80 == 0&&(cnt_h != 0)))||((cnt_v % 80 == 0)&&(cnt_v != 0))) begin
            //     vga_rgb <= GREEN;
            // end else if (((cnt_h % 80 == 79&&(cnt_h != 639)))||((cnt_v % 80 == 79)&&(cnt_v != 479))) begin
            //     vga_rgb <= BLUE;
            // end 

            // // colorbar
            // if ((cnt_h >= 128 * 0) && (cnt_h < 128 * 1)) begin
            //     vga_rgb <= BLACK;
            // end else if ((cnt_h >= 128 * 1) && (cnt_h < 128 * 2)) begin
            //     vga_rgb <= WHITE;
            // end else if ((cnt_h >= 128 * 2) && (cnt_h < 128 * 3)) begin
            //     vga_rgb <= RED;
            // end else if ((cnt_h >= 128 * 3) && (cnt_h < 128 * 4)) begin
            //     vga_rgb <= GREEN;
            // end else if ((cnt_h >= 128 * 4) && (cnt_h < 128 * 5)) begin
            //     vga_rgb <= BLUE;
            // end
            
			else begin
                vga_rgb <= BLACK;   
            end
        end else begin
            vga_rgb <= BLACK;
        end
	end

endmodule
