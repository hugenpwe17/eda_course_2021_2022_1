//
module cnt_hex_seg (
    input wire sys_clk,
    input wire sys_rst_n,
	 
	output wire sel,
    output wire [7:0] seg
);
    //
    wire clk;
    wire [3:0] cnt;
    //
	assign sel = 1'd0;
	 
    sys_clk_div U1(sys_clk,sys_rst_n,clk);
    cnt_m U2(clk, sys_rst_n, cnt);
    seg_8_hex_led U3(cnt,seg);
endmodule