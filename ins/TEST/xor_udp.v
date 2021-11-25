primitive xor_udp(
	output DOUT,
	
	input X1,
	input X2
);
	
	// main code
	table // X1 X2 : DOUT
	0 0 : 0;
	0 1 : 1;
	1 0 : 1;
	1 1 : 0;
	endtable
	
endprimitive