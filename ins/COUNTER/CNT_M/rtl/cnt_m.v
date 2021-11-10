// arbitrary model counter
// input width = 4
// counter model = 16

module cnt_m #(
    // parameter
    parameter width = 4,
    parameter model = 16
) (
    input wire sys_clk,
    input wire sys_rst_n,
    output reg [width-1:0] cnt
);
    //
    always @(posedge sys_clk, negedge sys_rst_n) begin
        if(!sys_rst_n)
            cnt <= {width{1'd0}};
        else
            if(cnt == model - 1)
                cnt <= {width{1'd0}};
            else
                cnt <= cnt + 1;
    end
endmodule