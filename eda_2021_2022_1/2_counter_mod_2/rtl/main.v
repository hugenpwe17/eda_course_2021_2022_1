module main (
    input           sys_clk,          // system clock, default frequency = 50MHz
    input           sys_rst_n,        // reset signal

    input           cnt_en,           // enable signal
    
    input           cnt_mod_switch,   // switch signal
    
    output [3:0]    single_digits,    // single digits detector signal
    output [3:0]    ten_digits,       // ten digits detector signal
    output [3:0]    hundred_digits,   // hundred digits detector signal

    output          cnt_clk,          // the clock of counter
    output [11:0]   num_bin,          // The value of the counter (binary)
    output [6:0]    SG0,              // nixie tube signal (sigle digits)
    output [6:0]    SG1,              // nixie tube signal (ten digits)
    output [6:0]    SG2               // nixie tube signal (hundred digits)
);
    
    cnt_mod_alt2#(
        .FREQ_DIV_COEFF_WIDTH ( 25                 ),   // set frequency division coefficient width [24:0]
        .FREQ_DIV_COEFF       ( 25'd4              ),   // set frequency division coefficient is 4
        .MODEL_WIDTH          ( 12                 ),   // set models width [11:0]
        .MODEL_1              ( 12'b0000_0010_0011 ),   // set model_1 is 24(BCD CODE)
        .MODEL_2              ( 12'b0001_0100_1001 )    // set model_2 is 150(BCD CODE)
    )u_cnt_mod_alt2(
        .sys_clk              ( sys_clk            ),
        .sys_rst_n            ( sys_rst_n          ),   // 1 => none, 0 => set counter to 0

        .cnt_en               ( cnt_en             ),   // 1 => start and keep counter, 0 => stop counter
        .cnt_mod_switch       ( cnt_mod_switch     ),   // 0 => model_1, 1=> model_2

        .single_digits        ( single_digits      ),
        .ten_digits           ( ten_digits         ),
        .hundred_digits       ( hundred_digits     ),

        .cnt_clk              ( cnt_clk            ),
        .num_bin              ( num_bin            ),
        
        .SG0                  ( SG0                ),
        .SG1                  ( SG1                ),
        .SG2                  ( SG2                )
    );

endmodule