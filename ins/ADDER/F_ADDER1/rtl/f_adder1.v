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
	h_adder1 U1(ain,bin,net[0],net[1]);
	h_adder1 U2(.ain(net[0]),.bin(cin),.sout(sout),.cout(net[2]));
	or		U3(cout,net[1],net[2]);
	
endmodule