module f_adder1_test (
    input ain,
    input bin,
    input cin,

    output sout,
    output cout,
    output [3:0] led
);

    f_adder1 u_f_adder1(
        .ain  ( !ain  ),
        .bin  ( !bin  ),
        .cin  ( !cin  ),
        .sout ( sout  ),
        .cout ( cout  )
    );
    // {led[3], led[2], led[1], led[0]}
    assign led = {sout, 1'b0, 1'b0, cout};

endmodule