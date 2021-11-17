// 整点报时
module timebar(
    // ports
    input clk,
    input rst_n,

    input [7:0] hr,
    input [7:0] mn,
    input [7:0] sd,

    output reg led
);
    always @(posedge clk, negedge rst_n) begin
        if(!rst_n) begin
            led <= 1'b0;
        end
        else begin
            if(mn == 8'h59 && sd >= 8'h56) begin
                led <= ~led;
            end
            else begin
                led <= 1'b0; 
            end
        end
    end
endmodule