module f_adder16 (
	input [15:0] ain,
	input [15:0] bin,
	input cin,

	output [15:0] sout,
	output cout
);
	// wire
    wire [14:0] net;

	f_adder1 u_f_adder0(
		.ain  ( ain[0]  ),
		.bin  ( bin[0]  ),
		.cin  ( cin     ),
		.sout ( sout[0] ),
		.cout ( net[0]  )
	);

	f_adder1 u_f_adder1(
		.ain  ( ain[1]  ),
		.bin  ( bin[1]  ),
		.cin  ( net[0]  ),
		.sout ( sout[1] ),
		.cout ( net[1]  )
	);

	f_adder1 u_f_adder2(
		.ain  ( ain[2]  ),
		.bin  ( bin[2]  ),
		.cin  ( net[1]  ),
		.sout ( sout[2] ),
		.cout ( net[2]  )
	);

	f_adder1 u_f_adder3(
		.ain  ( ain[3]  ),
		.bin  ( bin[3]  ),
		.cin  ( net[2]  ),
		.sout ( sout[3] ),
		.cout ( net[3]  )
	);

	f_adder1 u_f_adder4(
		.ain  ( ain[4]  ),
		.bin  ( bin[4]  ),
		.cin  ( net[3]  ),
		.sout ( sout[4] ),
		.cout ( net[4]  )
	);

	f_adder1 u_f_adder5(
		.ain  ( ain[5]  ),
		.bin  ( bin[5]  ),
		.cin  ( net[4]  ),
		.sout ( sout[5] ),
		.cout ( net[5]  )
	);

	f_adder1 u_f_adder6(
		.ain  ( ain[6]  ),
		.bin  ( bin[6]  ),
		.cin  ( net[5]  ),
		.sout ( sout[6] ),
		.cout ( net[6]  )
	);

	f_adder1 u_f_adder7(
		.ain  ( ain[7]  ),
		.bin  ( bin[7]  ),
		.cin  ( net[6]  ),
		.sout ( sout[7] ),
		.cout ( net[7]  )
	);

	f_adder1 u_f_adder8(
		.ain  ( ain[8]  ),
		.bin  ( bin[8]  ),
		.cin  ( net[7]  ),
		.sout ( sout[8] ),
		.cout ( net[8]  )
	);

	f_adder1 u_f_adder9(
		.ain  ( ain[9]  ),
		.bin  ( bin[9]  ),
		.cin  ( net[8]  ),
		.sout ( sout[9] ),
		.cout ( net[9]  )
	);

	f_adder1 u_f_adder10(
		.ain  ( ain[10]  ),
		.bin  ( bin[10]  ),
		.cin  ( net[9]  ),
		.sout ( sout[10] ),
		.cout ( net[10]  )
	);

	f_adder1 u_f_adder11(
		.ain  ( ain[11]  ),
		.bin  ( bin[11]  ),
		.cin  ( net[10]  ),
		.sout ( sout[11] ),
		.cout ( net[11]  )
	);

	f_adder1 u_f_adder12(
		.ain  ( ain[12]  ),
		.bin  ( bin[12]  ),
		.cin  ( net[11]  ),
		.sout ( sout[12] ),
		.cout ( net[12]  )
	);

	f_adder1 u_f_adder13(
		.ain  ( ain[13]  ),
		.bin  ( bin[13]  ),
		.cin  ( net[12]  ),
		.sout ( sout[13] ),
		.cout ( net[13]  )
	);

	f_adder1 u_f_adder14(
		.ain  ( ain[14]  ),
		.bin  ( bin[14]  ),
		.cin  ( net[13]  ),
		.sout ( sout[14] ),
		.cout ( net[14]  )
	);

	f_adder1 u_f_adder15(
		.ain  ( ain[15]  ),
		.bin  ( bin[15]  ),
		.cin  ( net[14]  ),
		.sout ( sout[15] ),
		.cout ( cout  )
	);

endmodule