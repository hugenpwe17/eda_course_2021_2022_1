// 4-bit full adder
module full_adder_4 (
    input   [3:0]   a_in,   // augend
    input   [3:0]   b_in,   // addend
    input           c_in,   // carry input

    output  [3:0]   sum_out,    // sum
    output          carry_out   // carry output
);

    wire [2:0] wire_carry_out;  // wire for connecting low-bit carry output and high-bit carry input

    // bit 0
    full_adder u_full_adder_0(
        .a_in       ( a_in[0]           ),
        .b_in       ( b_in[0]           ),
        .c_in       ( c_in              ),

        .sum_out    ( sum_out[0]        ),
        .carry_out  ( wire_carry_out[0] )
    );

    // bit 1
    full_adder u_full_adder_1(
        .a_in       ( a_in[1]           ),
        .b_in       ( b_in[1]           ),
        .c_in       ( wire_carry_out[0] ),

        .sum_out    ( sum_out[1]        ),
        .carry_out  ( wire_carry_out[1] )
    );

    // bit 2
    full_adder u_full_adder_2(
        .a_in       ( a_in[2]           ),
        .b_in       ( b_in[2]           ),
        .c_in       ( wire_carry_out[1] ),

        .sum_out    ( sum_out[2]        ),
        .carry_out  ( wire_carry_out[2] )
    );

    // bit 3
    full_adder u_full_adder_3(
        .a_in       ( a_in[3]           ),
        .b_in       ( b_in[3]           ),
        .c_in       ( wire_carry_out[2] ),

        .sum_out    ( sum_out[3]        ),
        .carry_out  ( carry_out         )
    );
   
endmodule