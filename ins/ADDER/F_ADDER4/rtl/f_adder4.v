module f_adder4 (
    input [3:0] ain,
    input [3:0] bin,
    input cin,

    output [3:0] sout,
    output cout
);
    // wire
    wire [2:0] net;

    // main code
    f_adder1 u_f_adder1_1(
        .ain  ( ain[0] ),
        .bin  ( bin[0] ),
        .cin  ( cin    ),
        .sout ( sout[0] ),
        .cout ( net[0]  )
    );

    f_adder1 u_f_adder1_2(
        .ain  ( ain[1] ),
        .bin  ( bin[1] ),
        .cin  ( net[0]  ),
        .sout ( sout[1] ),
        .cout ( net[1]  )
    );

    f_adder1 u_f_adder1_3(
        .ain  ( ain[2] ),
        .bin  ( bin[2] ),
        .cin  ( net[1]  ),
        .sout ( sout[2] ),
        .cout ( net[2]  )
    );

    f_adder1 u_f_adder1_4(
        .ain  ( ain[3] ),
        .bin  ( bin[3] ),
        .cin  ( net[2]  ),
        .sout ( sout[3] ),
        .cout ( cout    )
    );

endmodule