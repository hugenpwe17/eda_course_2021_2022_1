module h_adder1(
	input ain,
	input bin,
	
	output sout,
	output cout
	);
	
	// main code
	assign sout = ain ^ bin;
	assign cout = ain & bin;

endmodule
