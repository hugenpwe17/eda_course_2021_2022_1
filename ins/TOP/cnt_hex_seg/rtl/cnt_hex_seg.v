//
module cnt_hex_seg (
    input wire sys_clk,
    input wire sys_rst_n,
	 
	output reg  [5:0] sel,
    output wire [7:0] seg
);
    //
    wire clk;
    wire [3:0] cnt;
    //
    always @(posedge sys_clk, negedge sys_rst_n) begin
        if(!sys_rst_n)
            sel <= 6'b111111;
        else
            sel <= 6'b000000;
    end
    clk_div #(
        .feq_ori    ( 50_000_000),
        .feq_out    ( 1         )
    ) u_clk_div(
        .clk        ( sys_clk   ),
        .rst_n      ( sys_rst_n ),
        .clk_div    ( clk       )
    );
    cnt_m u_cnt_m(
        .sys_clk   ( clk        ),
        .sys_rst_n ( sys_rst_n  ),
        .cnt       ( cnt        )
    );
    seg_8_hex_led u_seg_8_hex_led(
        .cnt4      ( cnt        ),
        .seg       ( seg        )
    );

endmodule