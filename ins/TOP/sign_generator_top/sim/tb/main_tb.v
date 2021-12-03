`timescale 1ns/1ns
module main_tb;

reg clk;
reg rst_n;
reg cnt_en;

wire cout;
wire [6:0] address;
wire [7:0] q;

initial begin
    clk <= 1'b0;
    rst_n <= 1'b0;
    cnt_en <= 1'b0;

    #100 rst_n <=1'b1;
    #10 cnt_en <=1'b1;
end

always #10 clk = ~clk;

main u_main(
    .clk     ( clk     ),
    .rst_n   ( rst_n   ),
    .cnt_en  ( cnt_en  ),
    .cout    ( cout    ),
    .address ( address ),
    .q       ( q       )
);

endmodule