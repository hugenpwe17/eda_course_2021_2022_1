// breath led by PWM
module breath_led (
    input clk,
    input rst_n,

    output led
);
    // register
    reg [15:0] cnt;
    reg [15:0] cnt_th;
    reg inc_dec_flag;

    // main code
    // counter
    always @(posedge clk, negedge rst_n) begin
        if(!rst_n)
            cnt <= 1'b0;
        else if(cnt == 16'd50_000)
            cnt <= 1'b0;
        else
            cnt <= cnt + 1'b1;
    end
    //
    always @(posedge clk, negedge rst_n) begin
        if(!rst_n) begin
            cnt_th <= 1'b0;
            inc_dec_flag <= 1'b1;
        end
        else begin
            if(cnt == 16'd50_000) begin
                if(inc_dec_flag == 1'b1) begin
                    if(cnt_th == 16'd50_000) begin
                        inc_dec_flag <= 1'b0;
                    end
                    else begin
                       cnt_th <= cnt_th + 16'd25; 
                    end
                end
                else begin
                    if(cnt_th == 1'b0) begin
                        inc_dec_flag <= 1'b1;
                    end
                    else begin
                        cnt_th <= cnt_th - 16'd25;
                    end
                end
            end
            else begin
                // nothing
            end
        end
    end
	 // 
    assign led = (cnt > cnt_th) ? 1'b1:1'b0;
endmodule