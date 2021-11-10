// system clock frequence divider
// system clock : 50MHZ
// output clock frequence: 5HZ (error! in fact ,it's double)

module clk_div #(
    // system clock frequence(HZ)
    parameter feq_ori = 50_000_000,
    // ferquence(HZ) of clock to be output
    parameter feq_out = 5
) (
    // input signal：original clock
    input clk,
    // input signal：reset 
    input rst_n,
    // output signal：output clock 
    output clk_div
);
	// parameter
    // full cycle counter
    parameter full_times = (feq_ori / feq_out) - 1;
    // half cycle conter
    parameter semi_times = (feq_ori / feq_out)/2 - 1;
    // register length
    parameter width = 32;

    // register
    reg tmp_clk;
    reg [width-1:0] cnt, tmp_in;

    // main counter
    // counter
    always @(*) begin
        if(cnt == full_times)
            tmp_in = {width{1'b0}};
        else
            tmp_in = cnt + 1;
    end
    //
    always @(posedge clk, negedge rst_n) begin
        if(!rst_n)
            cnt <= {width{1'b0}};
        else
            cnt <= tmp_in;
    end 
    //
    always @(posedge clk, negedge rst_n) begin
        if(!rst_n)
            tmp_clk <= 1'b0;
        else if(cnt == semi_times)
            tmp_clk <= ~tmp_clk;
    end
    //
    assign clk_div = tmp_clk;
    
endmodule