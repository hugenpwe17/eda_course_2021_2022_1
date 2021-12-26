// top module

module clock_top (
    input               clk,            // clock, default is 50MHz
    input               rst_n,          // reset signal

    // control signal
    input               set_mod,        // sets the clock state
                                        // 0 => timing, 1 => adjusting
    input               set_alarm,      // sets the adjusting state
                                        // 0 => time calibration, 1 => alarm setting
    // calibration signal
    input               time_add,       // posedge detection, add 1 in selected location
    input               set_location,   // posedge detection, cycle selection in the order of {seconds, minutes, hours}
                                        // default location is seconds
    // // dynamic display
    // output [5:0] sel,
    // output [7:0] seg, 

    // static display
    output [7:0]        hr0,            // low-bits of hours bit
    output [7:0]        hr1,            // high-bits of hours bit
    output [7:0]        mn0,            // low-bits of minutes bit
    output [7:0]        mn1,            // high-bits of minutes bit
    output [7:0]        sd0,            // low-bits of seconds bit
    output [7:0]        sd1,            // high-bits of seconds bit

    // timing signal
    output wire [23:0]  tm,             // time signal (= {hr1, hr0, mn1, mn0, sd1, sd0})
    output wire [7:0]   hr_cal,         // hours bit in time calibration
    output wire [7:0]   mn_cal,         // minutes bit in time calibration    
    output wire [7:0]   sd_cal,         // seconds bit in time calibration
    output wire [7:0]   hr,             // hours bit in timing
    output wire [7:0]   mn,             // minutes bit in timing
    output wire [7:0]   sd,             // seconds bit in timing
    output wire [7:0]   hr_alarm,       // hours bit in alarm setting
    output wire [7:0]   mn_alarm,       // minutes bit in alarm setting 
    output wire [7:0]   sd_alarm,       // seconds bit in alarm setting

    output wire [1:0]   option_location,// selected location(0 = seconds, 1 = minutes, 2 = hours) in time calibration
    output wire [1:0]   alarm_location, // selected location(0 = seconds, 1 = minutes, 2 = hours) in alarm setting

    output wire [3:0]   led,            // leds for reporting punctually
    output wire [3:0]   led_alarm       // leds for alarm clock
);
    // timing module
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
    
    // time calibration 
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

    // segment selection (timing or time calibration)
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

    // reporting punctually
    timebar u_timebar(
        .clk       ( clk       ),
        .rst_n     ( rst_n     ),
        .set_mod   ( set_mod   ),
        .set_alarm ( set_alarm ),
        .mn        ( mn        ),
        .sd        ( sd        ),
        .led       ( led       )
    );

    // alarm setting
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

    // alarm
    alarm u_alarm(
        .clk      ( clk      ),
        .hr       ( hr       ),
        .mn       ( mn       ),
        .hr_alarm ( hr_alarm ),
        .mn_alarm ( mn_alarm ),
        .led_alarm  ( led_alarm  )
    );

    // // dynamic display
    // cnt_seg_dync#(
    //     .stay_time ( 16'd50_000 )
    // )u_cnt_seg_dync(
    //     .clk   ( clk   ),
    //     .rst_n ( rst_n ),
    //     .num   ( tm    ),
    //     .sel   ( sel   ),
    //     .seg   ( seg   )
    // );

    // static display
    cnt_seg_static u_cnt_seg_static0(   // low-bits of seconds bit
        .cnt4 ( tm[3:0] ),
        .seg  ( sd0  )
    );
    cnt_seg_static u_cnt_seg_static1(   // high-bits of seconds bit
        .cnt4 ( tm[7:4] ),
        .seg  ( sd1  )
    );
    cnt_seg_static u_cnt_seg_static2(   // low-bits of minutes bit
        .cnt4 ( tm[11:8] ),
        .seg  ( mn0  )
    );
    cnt_seg_static u_cnt_seg_static3(   // high-bits of minutes bit
        .cnt4 ( tm[15:12] ),
        .seg  ( mn1  )
    );
    cnt_seg_static u_cnt_seg_static4(   // low-bits of hours bit
        .cnt4 ( tm[19:16] ),
        .seg  ( hr0  )
    );
    cnt_seg_static u_cnt_seg_static5(   // high-bits of hours bit
        .cnt4 ( tm[23:20] ),
        .seg  ( hr1  )
    );

endmodule