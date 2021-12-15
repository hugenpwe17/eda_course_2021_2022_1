module main (
    input sys_clk,          // system clock, default frequency = 50MHz
    input sys_rst_n,        // reset signal, 1 => none, 0 => set counter to 0

    input cnt_en,           // enable signal, 1 => start and keep counter, 0 => stop counter
    
    input cnt_mod_switch,   // switch signal, 0 => model_1, 1=> model_2
    
    output [3:0] single_digits,       // single digits detector signal
    output [3:0] ten_digits,          // ten digits detector signal
    output [3:0] hundred_digits,      // hundred digits detector signal

    output          cnt_clk,    // the clock of counter
    output [11:0]   num_bin,    // The value of the counter (binary)
    output [6:0]    SG0,        // nixie tube signal (sigle digits)
    output [6:0]    SG1,        // nixie tube signal (ten digits)
    output [6:0]    SG2         // nixie tube signal (hundred digits)
);
    
    cnt_mod_alt2#(
        .FREQ_DIV_COEFF_WIDTH ( 25 ),
        .FREQ_DIV_COEFF       ( 25'd4 ),
        .MODEL_WIDTH          ( 12 ),
        .MODEL_1              ( 12'b0000_0010_0011 ),
        .MODEL_2              ( 12'b0001_0100_1001 )
    )u_cnt_mod_alt2(
        .sys_clk        ( sys_clk        ),
        .sys_rst_n      ( sys_rst_n      ),

        .cnt_en         ( cnt_en         ),
        .cnt_mod_switch ( cnt_mod_switch ),

        .single_digits  ( single_digits  ),
        .ten_digits     ( ten_digits     ),
        .hundred_digits ( hundred_digits ),

        .cnt_clk        ( cnt_clk        ),
        .num_bin        ( num_bin        ),
        
        .SG0            ( SG0            ),
        .SG1            ( SG1            ),
        .SG2            ( SG2            )
    );

endmodule