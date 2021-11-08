module f_adder1(
	input ain,
	input bin,
	input cin,
	
	output sout,
	output cout
	);
	
	// reg
	
	// wire
	wire [2:0] net;

	// main code
	h_adder1 u_h_adder1(
		.ain  ( ain    ),
		.bin  ( bin    ),
		.sout ( net[0] ),
		.cout ( net[1] )
	);

	h_adder1 u_h_adder2(
		.ain  ( net[0] ),
		.bin  ( cin    ),
		.sout ( sout   ),
		.cout ( net[2] )
	);

	or U3(
		cout,
		net[1],
		net[2]
	);
	
endmodule