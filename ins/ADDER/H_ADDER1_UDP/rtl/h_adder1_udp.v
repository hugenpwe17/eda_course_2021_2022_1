module h_adder1_udp(
	input ain,bin,cin,
	output sout,cout
	);
	
	//main code
	xor_udp U1(sout,ain,bin);
	and U2(cout,ain,bin);
	
endmodule
