module decoder38 (
    input [2:0] data_in,
    input [2:0] en_in,

    output reg [7:0] data_out
);

    always @(*) begin
        if(en_in[0] || en_in[1] || !en_in[2]) begin
            data_out = 8'b1111_1111;
        end
        else begin
            case(data_in)
                3'b000: data_out = 8'b1111_1110;
                3'b001: data_out = 8'b1111_1101;
                3'b010: data_out = 8'b1111_1011;
                3'b011: data_out = 8'b1111_0111;
                3'b100: data_out = 8'b1110_1111;
                3'b101: data_out = 8'b1101_1111;
                3'b110: data_out = 8'b1011_1111;
                3'b111: data_out = 8'b0111_1111;
            endcase
		end
    end
    
endmodule