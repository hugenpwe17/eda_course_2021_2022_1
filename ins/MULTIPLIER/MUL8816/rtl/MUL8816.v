module MUL8816 (
    input [7:0] multiplier ,
    input [7:0] multiplicand,

    output [15:0] out
);
    assign out = multiplicand * multiplier;
endmodule