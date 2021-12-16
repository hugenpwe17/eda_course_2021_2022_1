module main (
    input clk,
    input rst_n,
    input a,

    output b,
    output sys_rst_n
);
    
system_ctrl_3 u_system_ctrl_3(
    .clk   ( clk   ),
    .rst_n ( rst_n ),
    .a     ( a     ),
    .b     ( b     ),
    .sys_rst_n  ( sys_rst_n  )
);



endmodule