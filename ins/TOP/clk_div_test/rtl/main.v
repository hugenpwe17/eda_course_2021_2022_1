//
module main (
    input clk,
    input rst_n,
    output clk_div
);

	clk_div#(
		.feq_ori ( 50_000_000 		),
		.feq_out ( 1000 		)
	)u_clk_div(
		.clk     ( clk     	),
		.rst_n   ( rst_n   	),
		.clk_div ( clk_div  )
	);

endmodule