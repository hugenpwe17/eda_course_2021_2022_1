module main (
    input [2:0] data_in,
    input [2:0] en_in,

    output wire [7:0] data_out
);
    

    decoder38 u_decoder38(
        .data_in ( data_in ),
        .en_in   ( en_in   ),
        .data_out  ( data_out  )
    );

endmodule