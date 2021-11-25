module f_adder1 (
	input ain,
	input bin,
	input cin,

	output sout,
	output cout
);
	wire net_s;
	wire net_c1,net_c2;

	my_h_adder1 u1(ain,bin,net_s,net_c1);

	my_h_adder1 u2(net_s,cin,sout,net_c2);

	or u3(cout,net_c1,net_c2);

endmodule