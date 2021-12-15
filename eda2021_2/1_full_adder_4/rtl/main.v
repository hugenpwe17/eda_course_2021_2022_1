module main (
    input   [3:0]   a_in,
    input   [3:0]   b_in,
    input           c_in,

    output  [3:0]   sum_out,
    output          carry_out
);
    
    full_adder_4 u_full_adder_4(
        .a_in      ( a_in[3:0] 	),
        .b_in      ( b_in[3:0] 	),
        .c_in      ( c_in      	),

        .sum_out   ( sum_out[3:0]),
        .carry_out ( carry_out 	)
    );

endmodule