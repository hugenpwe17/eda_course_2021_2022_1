module main (
    input clk,
    input rst_n,
    input cnt_en,

    output cout,
    output wire [6:0] address,
    output [7:0] q
);

    counter64	counter64_inst (
	.aclr       ( !rst_n        ),
	.clk_en     ( cnt_en        ),
	.clock      ( clk           ),
	.cout       ( cout          ),
	.q          ( address       )
	);

    rom_sin	rom_sin_inst (
	.address    ( address   ),
	.clock      ( clk     ),
	.q          ( q         )
	);

endmodule