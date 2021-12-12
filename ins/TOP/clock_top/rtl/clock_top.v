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
    // output [5:0] sel,
    output [7:0] hr0,
    output [7:0] hr1,
    output [7:0] mn0,
    output [7:0] mn1,
    output [7:0] sd0,
    output [7:0] sd1,

    //
    output wire [23:0] tm,
    output wire [7:0] hr_cal,
    output wire [7:0] mn_cal,
    output wire [7:0] sd_cal,
    output wire [7:0] hr,
    output wire [7:0] mn,
    output wire [7:0] sd,
    output wire [7:0] hr_alarm,
    output wire [7:0] mn_alarm,
    output wire [7:0] sd_alarm,

    output wire [1:0] option_location,
    output wire [1:0] alarm_location,

    output wire [3:0] led,
    output wire [3:0] led_alarm
);
    // wire
    wire flag_1day;

    // register
    
    // initialization


    clock#(
        // .cnt_max   ( 28'd50_000_000 )
        .cnt_max   ( 28'd5 )
    )u_clock(
        .clk       ( clk       ),
        .rst_n     ( rst_n     ),
        .set_mod   ( set_mod   ),
        .set_alarm ( set_alarm ),
        .time_add  ( !time_add  ),
        .hr_cal    ( hr_cal    ),
        .mn_cal    ( mn_cal    ),
        .sd_cal    ( sd_cal    ),
        .hr        ( hr        ),
        .mn        ( mn        ),
        .sd        ( sd        )
    );

    time_calibration u_time_calibration(
        .clk          ( clk          ),    
        .time_add     ( !time_add     ),
        .set_location ( !set_location ),
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
        .hr2       ( hr_alarm  ),
        .mn2       ( mn_alarm  ),
        .tm        ( tm        )
    );

    timebar u_timebar(
        .clk       ( clk       ),
        .rst_n     ( rst_n     ),
        .set_mod   ( set_mod   ),
        .set_alarm ( set_alarm ),
        .mn        ( mn        ),
        .sd        ( sd        ),
        .led       ( led       )
    );

    alarm_set u_alarm_set(
        .clk          ( clk          ),
        .set_mod      ( set_mod      ),
        .set_alarm    ( set_alarm    ),
        .time_add     ( !time_add     ),
        .set_location ( !set_location ),
        .hr_alarm     ( hr_alarm     ),
        .mn_alarm     ( mn_alarm     ),
        .sd_alarm     ( sd_alarm     ),
        .alarm_location  ( alarm_location  )
    );

    alarm u_alarm(
        .clk      ( clk      ),
        .hr       ( hr       ),
        .mn       ( mn       ),
        .hr_alarm ( hr_alarm ),
        .mn_alarm ( mn_alarm ),
        .led_alarm  ( led_alarm  )
    );

    


    /*cnt_seg_dync#(
        .stay_time ( 16'd50_000 )
    )u_cnt_seg_dync(
        .clk   ( clk   ),
        .rst_n ( rst_n ),
        .num   ( tm    ),
        .sel   ( sel   ),
        .seg   ( seg   )
    );*/

    cnt_seg_static u_cnt_seg_static0(
        .cnt4 ( tm[3:0] ),
        .seg  ( sd0  )
    );
    cnt_seg_static u_cnt_seg_static1(
        .cnt4 ( tm[7:4] ),
        .seg  ( sd1  )
    );
    cnt_seg_static u_cnt_seg_static2(
        .cnt4 ( tm[11:8] ),
        .seg  ( mn0  )
    );
    cnt_seg_static u_cnt_seg_static3(
        .cnt4 ( tm[15:12] ),
        .seg  ( mn1  )
    );
    cnt_seg_static u_cnt_seg_static4(
        .cnt4 ( tm[19:16] ),
        .seg  ( hr0  )
    );
    cnt_seg_static u_cnt_seg_static5(
        .cnt4 ( tm[23:20] ),
        .seg  ( hr1  )
    );

 
endmodule