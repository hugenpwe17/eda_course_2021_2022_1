// for reporting punctually(from 59:56 to 00:00)

module timebar (
    input               clk,
    input               rst_n,

    input               set_mod,
    input               set_alarm,

    input       [7:0]   mn,
    input       [7:0]   sd,

    output reg  [3:0]   led
);
    always @(posedge clk, negedge rst_n) begin
        if(!rst_n) begin
            led <= 1'b0;
        end
        else begin
            if(mn == 8'h59 && sd >= 8'h56) begin
                led <= 4'b1111;
            end
            else begin
                led <= 1'b0; 
            end
        end
    end
    
endmodule