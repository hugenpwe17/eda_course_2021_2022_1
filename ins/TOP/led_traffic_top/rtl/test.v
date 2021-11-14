module led_traffic_top (
    input wire clk,
    input wire rst_n,

    // output wire [23:0] num
    output wire [5:0] sel,
    output wire [7:0] seg 
);
    // wire
    wire [23:0] net_num;
    //
    cnt_down#(
        .time_max  ( 8'h60 ),
        .div_coeff ( 32'd50_000_000 )
        // .div_coeff ( 24'd3_000_000 )
        // .div_coeff ( 24'd24 )
    )u_cnt_down(
        .clk      ( clk      ),
        .rst_n    ( rst_n    ),
        .num      ( net_num      )
    );

    cnt_seg_dync#(
        .stay_time ( 16'd50_000 )
        // .stay_time ( 16'd4 )
    )u_cnt_seg_dync(
        .clk   ( clk   ),
        .rst_n ( rst_n ),
        .num   ( net_num   ),
        .sel   ( sel   ),
        .seg   ( seg   )
    );


endmodule