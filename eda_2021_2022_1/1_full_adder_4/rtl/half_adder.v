// 1-bit half adder

module half_adder (
    input   a_in,           // augend
    input   b_in,           // addend

    output  sum_out,        // sum
    output  carry_out       // carry output
);
    
    assign sum_out      =   a_in ^ b_in;    // ^ := XOR
    assign carry_out    =   a_in & b_in;    // & := AND

endmodule