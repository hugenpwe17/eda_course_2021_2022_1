// mux 4(for selection display signal)

module mux4 (
    input               clk,
        
    input               set_mod,
    input               set_alarm,

    input       [7:0]   hr,
    input       [7:0]   mn,
    input       [7:0]   sd,

    input       [7:0]   hr1,
    input       [7:0]   mn1,
    input       [7:0]   sd1,

    input       [7:0]   hr2,
    input       [7:0]   mn2,

    output reg  [23:0]  tm
);
    always @(posedge clk) begin
        if(!set_mod) begin
            tm <= {hr,mn,sd};
        end
        else begin
            if(!set_alarm) begin
                tm <= {hr1,mn1,sd1};
            end
            else begin
                tm <= {hr2,mn2,8'b0};
            end
        end
    end

endmodule