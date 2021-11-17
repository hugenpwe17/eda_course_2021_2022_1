module clock_top (
    // clock
    input clk,
    // reset
    input rst_n,

    // control flag
    input set_mod,
    input set_alarm,

    // calibration module
    input time_add,
    input set_location,
    
    // output seg 
    output [5:0] sel,
    output [7:0] seg,

    //
    output wire [23:0] tm,
    output wire [7:0] hr_cal,
    output wire [7:0] mn_cal,
    output wire [7:0] sd_cal,
    output wire [7:0] hr,
    output wire [7:0] mn,
    output wire [7:0] sd,

    output wire [1:0] option_location
);
    // wire
    wire flag_1day;

    // register
    
    // initialization


    clock#(
        .cnt_max   ( 28'd50_000_000 )
    )u_clock(
        .clk       ( clk       ),
        .rst_n     ( rst_n     ),
        .set_mod   ( set_mod   ),
        .set_alarm ( set_alarm ),
        .time_add  ( time_add  ),
        .hr_cal    ( hr_cal    ),
        .mn_cal    ( mn_cal    ),
        .sd_cal    ( sd_cal    ),
        .hr        ( hr        ),
        .mn        ( mn        ),
        .sd        ( sd        )
    );

    time_calibration u_time_calibration(
        .clk          ( clk          ),    
        .time_add     ( time_add     ),
        .set_location ( set_location ),
        .set_mod      ( set_mod      ),
        .set_alarm    ( set_alarm    ),
        .hr           ( hr           ),
        .mn           ( mn           ),
        .sd           ( sd           ),
        .hr_cal       ( hr_cal       ),
        .mn_cal       ( mn_cal       ),
        .sd_cal       ( sd_cal       ),
        .option_location(option_location)
    );

    mux4 u_mux4(
        .clk       ( clk       ),
        .set_mod   ( set_mod   ),
        .set_alarm ( set_alarm ),
        .hr        ( hr        ),
        .mn        ( mn        ),
        .sd        ( sd        ),
        .hr1       ( hr_cal    ),
        .mn1       ( mn_cal    ),
        .sd1       ( sd_cal    ),
        .tm        ( tm        )
    );

    cnt_seg_dync#(
        .stay_time ( 16'd50_000 )
    )u_cnt_seg_dync(
        .clk   ( clk   ),
        .rst_n ( rst_n ),
        .num   ( tm    ),
        .sel   ( sel   ),
        .seg   ( seg   )
    );
 
endmodule