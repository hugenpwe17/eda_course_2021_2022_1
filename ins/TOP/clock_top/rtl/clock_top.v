module clock_top (
    input clk,
    input rst_n,

    output wire [7:0] hr0,
    output wire [7:0] hr1,
    output wire [7:0] mn0,
    output wire [7:0] mn1,
    output wire [7:0] sd0,
    output wire [7:0] sd1
);
    // wire
    wire [7:0] hr;
    wire [7:0] mn;
    wire [7:0] sd;

clock#(
    .cnt_max ( 28'd10_000 )
)u_clock(
    .clk   ( clk   ),
    .rst_n ( rst_n ),
    .hr    ( hr    ),
    .mn    ( mn    ),
    .sd    ( sd    )
);

cnt_seg_static u_cnt_seg_static(
    .cnt4 ( sd[3:0] ),
    .seg  ( sd0  )
);

cnt_seg_static u_cnt_seg_static1(
    .cnt4 ( sd[7:4] ),
    .seg  ( sd1  )
);

cnt_seg_static u_cnt_seg_static2(
    .cnt4 ( mn[3:0] ),
    .seg  ( mn0  )
);

cnt_seg_static u_cnt_seg_static3(
    .cnt4 ( mn[7:4] ),
    .seg  ( mn1  )
);

cnt_seg_static u_cnt_seg_static4(
    .cnt4 ( hr[3:0] ),
    .seg  ( hr0  )
);

cnt_seg_static u_cnt_seg_static5(
    .cnt4 ( hr[7:4] ),
    .seg  ( hr1  )
);

endmodule