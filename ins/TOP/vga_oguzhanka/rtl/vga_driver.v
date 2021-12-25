module vga_driver(
    input   wire        clk,        // system clock 50MHz
    output  reg         pixel_clk,  // pixel clock 25MHz

    output  reg [9:0]   cnt_h,      // horizontal counter
    output  reg [9:0]   cnt_v,      // vertical counnter
    
    output  wire        vga_sync_h, // vga horizontal sync signal        
    output  wire        vga_sync_v, // vga vertical sync signal

    output  reg [5:0]   vga_rgb    // vga color data {2'd{red}, 2'd{green}, 2'd{blue}}
);
	
    // TIMING DEFINE
    integer HORIZONTAL_VISIBLE_AREA = 10'd640;
    integer HORIZONTAL_FRONT_PORCH  = 10'd16;
    integer HORIZONTAL_SYNC_PULSE   = 10'd96;
    integer HORIZONTAL_BACK_PORCH   = 10'd48;
    integer HORIZONTAL_WHOLE_LINE   = 10'd800;

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
    localparam BLUE  = 6'b00_00_11;

    // REGISTER DEFINE
	reg p_hSync;        // horizontal sync
    reg p_vSync; 	    // vertical sync
	reg q;              // frequency division signal(temp)

    // WIRE DEFINE
	wire dispaly_region; // display region flag

    assign dispaly_region = (
        (cnt_h < HORIZONTAL_VISIBLE_AREA) 
    &&  (cnt_v < VERTICAL_VISIBLE_AREA)
    );

    initial begin
        cnt_h   = 1'b0;
        cnt_v   = 1'b0;
        vga_rgb = 6'd0;
    end

	always@(posedge clk) begin
		q <= ~q; 
		pixel_clk <= q;
	end
    
    // 96 sync, 48 bp, 640 display, 16 fp
	// 2  sync, 33 bp, 480 display, 10 fp

    always@(posedge pixel_clk) begin
		if(cnt_h === HORIZONTAL_WHOLE_LINE - 1'b1) begin
            cnt_h <= 1'b0;
        end else begin
            cnt_h <= cnt_h + 1'b1;
        end
	end
	
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
 
	assign vga_sync_v = !p_vSync; 
	assign vga_sync_h = !p_hSync;
	
	always @(posedge pixel_clk) begin
        if (dispaly_region)begin
            if (((cnt_h % 80 == 0&&(cnt_h != 0)))||((cnt_v % 80 == 0)&&(cnt_v != 0))) begin
                vga_rgb <= GREEN;
            end 
            else if ((cnt_h <= 10)&&(cnt_h % 2 == 0)&&(cnt_h != 0)) begin
                vga_rgb <= RED;
            end else if ((cnt_v <= 10)&&(cnt_v % 2 == 0)&&(cnt_v != 0)) begin
                vga_rgb <= BLUE;
            end else if ((cnt_h >= 629)&&(cnt_h % 2 == 1)&&(cnt_h != 639)) begin
                vga_rgb <= BLUE;
            end else if ((cnt_v >= 469)&&(cnt_v % 2 == 1)&&(cnt_v != 479)) begin
                vga_rgb <= RED;
            end
            else if (cnt_h == 0) begin          // left edge
                vga_rgb <= WHITE;
            end else if (cnt_h == 639) begin    // right edge
                vga_rgb <= WHITE;
            end else if (cnt_v == 0) begin      // top edge
                vga_rgb <= WHITE;
            end else if (cnt_v == 479) begin    // bottom edge
                vga_rgb <= WHITE;
            end
            else begin
                vga_rgb <= BLACK;   
            end
        end else begin
            vga_rgb <= BLACK;
        end
	end

endmodule
