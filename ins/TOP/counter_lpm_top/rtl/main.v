module main (
    input aclr,
    input clock,
    input [3:0] data,
    input cnt_en,
    input sload,
    
    output cout,
    output [3:0] q
);
    
    counter	counter_inst (
	.aclr       ( aclr   ),
	.clock      ( clock  ),
	.cnt_en     ( cnt_en ),
	.data       ( data   ),
	.sload      ( sload  ),
	.cout       ( cout   ),
	.q          ( q      )
	);

endmodule