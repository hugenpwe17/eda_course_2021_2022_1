module half_adder (
    input   a_in,           // summand bit
    input   b_in,           // addend bit

    output  sum_out,        // sum bit
    output  carry_out       // carry bit
);
    
    assign sum_out      =   a_in ^ b_in;    // ^ := XOR
    assign carry_out    =   a_in & b_in;    // & := AND

endmodule