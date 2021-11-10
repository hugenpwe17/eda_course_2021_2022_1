//
module main (
    input clk,
    input rst_n,
    output clk_div
);

	clk_div#(
		.feq_ori ( 5 		),
		.feq_out ( 5 		)
	)u_clk_div(
		.clk     ( clk     	),
		.rst_n   ( rst_n   	),
		.clk_div ( clk_div  )
	);

endmodule