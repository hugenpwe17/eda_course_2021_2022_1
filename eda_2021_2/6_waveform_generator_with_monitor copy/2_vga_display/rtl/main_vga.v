module main_vga (
    input   wire        clk,        // system clock 50MHz
    output  wire        pixel_clk,  // pixel clock 25MHz
    
    output  wire        vga_sync_h, // vga horizontal sync signal        
    output  wire        vga_sync_v, // vga vertical sync signal
    
    output  wire [5:0]  vga_rgb,    // vga color data {2'd{red}, 2'd{green}, 2'd{blue}}

    output  reg         fengmingqi  // buzzer(beep) signal
);
    
    initial begin
        fengmingqi = 1'b0;  // turn off the buzzer(beep)
    end

    vga_driver u_vga_driver(
        .clk            (   clk           ),
        .pixel_clk      (   pixel_clk     ),

        .vga_sync_h     (   vga_sync_h    ),
        .vga_sync_v     (   vga_sync_v    ),

        .vga_rgb        (   vga_rgb       )   
    );

endmodule