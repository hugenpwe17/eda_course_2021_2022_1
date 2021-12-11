module led_traffic_top (
    input wire clk,
    input wire rst_n,
    input wire flag_s,

    output wire [23:0] num,
    output wire [5:0] led,
    // output wire [5:0] sel,
    output wire [7:0] seg ,
    output wire [7:0] seg1
);

    led_traffic_control u_led_traffic_control(
        .clk    ( clk    ),
        .rst_n  ( rst_n  ),
        .flag_s ( !flag_s ),
        .num    ( num    ),
        .led    ( led    ),
        .seg    ( seg    ),
        .seg1   ( seg1   )
    );

endmodule