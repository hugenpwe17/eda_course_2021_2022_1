module full_adder (
    input   a_in,           // summend bit
    input   b_in,           // addend bit
    input   c_in,           // carry_in bit

    output  sum_out,        // sum bit
    output  carry_out       // carry bit
);

    wire            wire_sum;           // wire_sum = a_in + b_in
    wire    [1:0]   wire_carry_out;     

    half_adder u_half_adder_1(
        .a_in       ( a_in              ),
        .b_in       ( b_in              ),
        .sum_out    ( wire_sum          ),
        .carry_out  ( wire_carry_out[0] )
    );

    half_adder u_half_adder_2(
        .a_in       ( wire_sum          ),
        .b_in       ( c_in              ),
        .sum_out    ( sum_out           ),
        .carry_out  ( wire_carry_out[1] )
    );

    or u_or(
        carry_out,
        wire_carry_out[1],
        wire_carry_out[0]
    );
endmodule