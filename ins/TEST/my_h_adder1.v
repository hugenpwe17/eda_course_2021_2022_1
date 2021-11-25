module my_h_adder1 (
	input ain,
	input bin,

	output sout,
	output cout
);

	and_udp u1(cout, ain, bin);

	xor_udp u2(sout, ain, bin);

endmodule