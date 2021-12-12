module alarm (
    input clk,

    input [7:0] hr,
    input [7:0] mn,
    input [7:0] hr_alarm,
    input [7:0] mn_alarm,

    output reg [3:0] led_alarm
);
    //
    always @(posedge clk) begin
        if(hr == hr_alarm && mn == mn_alarm) begin
            led_alarm <= 4'b1111;
        end
        else begin
            led_alarm <= 1'b0;
        end
    end

endmodule