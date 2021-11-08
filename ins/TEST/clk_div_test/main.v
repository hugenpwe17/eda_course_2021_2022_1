// 
module main (
    input clk,
    input rst_n,
    output clk_div
);

clk_div #(
    .feq_ori(10),
    .feq_out(3)
) U1(
    .clk(clk),
    .rst_n(rst_n),
    .clk_div(clk_div)
);

endmodule