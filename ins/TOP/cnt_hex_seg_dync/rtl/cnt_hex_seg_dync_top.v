module cnt_hex_seg_dync_top (
    input clk,
    input rst_n,

    output [5:0] sel,
    output [7:0] seg
);
    //wire
    wire [23:0] net_num;

    // main
    cnt_hex#(
        .model   ( 16'h1314 ),
        .inc_time( 3_000_000  )
    )u_cnt_hex(
        .clk     ( clk   ),
        .rst_n   ( rst_n ),
        .num     ( net_num   )
    );
    
    cnt_seg_dync#(
        .stay_time ( 50_000 )
    )u_cnt_seg_dync(
        .clk   ( clk   ),
        .rst_n ( rst_n ),
        .num   ( net_num   ),
        .sel   ( sel   ),
        .seg   ( seg   )
    );



endmodule