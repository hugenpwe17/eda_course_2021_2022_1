module text (
	input [15:0] ain,
	input [15:0] bin,
	input cin,

	output [15:0] sout,
	output cout
);

f_adder16 u_f_adder16(
    .ain  ( ain  ),
    .bin  ( bin  ),
    .cin  ( cin  ),
    .sout ( sout ),
    .cout  ( cout  )
);


endmodule