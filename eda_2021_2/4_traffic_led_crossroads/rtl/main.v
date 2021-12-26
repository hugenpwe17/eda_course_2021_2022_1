// top module

module main (
    input   wire        clk,    // clock, default is 50Mhz
    input   wire        rst_n,  // reset signal
    input   wire        flag_s, // the signal of country road vehicles waiting

    output  wire [23:0] num,    // 6-bit time signal(BCD CODE)
    output  wire [5:0]  led,    // traffic light signals on main roads and country roads,
                                // led = {MR(主红)、MY(主黄)、MG(主绿)、CR(乡红)、CY(乡黄)、CG(乡绿)}
    
    // // dynamic display
    // output wire [5:0] sel,   // bit select
    // output wire [7:0] seg,   // segment select

    // static display
    output  wire [7:0]  seg,    // segment select of low-bit
    output  wire [7:0]  seg1    // segment select of high-bit
);

    led_traffic_control#(
        .div_coeff  ( 32'd2;    )
    )u_led_traffic_control(
        .clk        ( clk       ),
        .rst_n      ( rst_n     ),
        .flag_s     ( !flag_s   ),

        .num        ( num       ),
        .led        ( led       ),

        .seg        ( seg       ),
        .seg1       ( seg1      )
    );

endmodule