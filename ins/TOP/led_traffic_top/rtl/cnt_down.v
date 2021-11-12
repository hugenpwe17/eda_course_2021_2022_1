// count down 
module cnt_down #(
    parameter time_max = 8'h60,
    parameter div_coeff = 32'd50_000_000
) (
    input clk,
    input rst_n,

    output reg [23:0] num
);
    // register
    reg [31:0] cnt;
    reg flag_time;

    // 
    always @(posedge clk, negedge rst_n) begin
        if(!rst_n) begin
            cnt <= 1'b0;
            flag_time <= 1'b0;
        end
        else begin
            if(cnt == div_coeff) begin
                cnt <= 1'b0;
                flag_time <= 1'b1;
            end
            else begin
                cnt <= cnt + 1'b1;
                flag_time <= 1'b0;
            end
        end
    end

    always @(posedge clk, negedge rst_n) begin
        if(!rst_n) begin
            num <= time_max;
        end
        else begin
            if(flag_time) begin
                if(num == 1'b1) begin
                    num <= time_max;
                end
                else begin 
                    if(num[3:0] == 4'h0) begin
                        if(num[7:4] == 4'h0) begin
                            if(num[11:8] == 4'h0) begin
                                if(num[15:12] == 4'h0) begin
                                    if(num[19:16] == 4'h0) begin
                                        num <= num - 20'h66667;  
                                    end
                                    else begin
                                        num <= num - 16'h6667;
                                    end
                                end
                                else begin
                                    num <= num - 12'h667;
                                end
                            end
                            else begin
                                num <= num - 8'h67;
                            end
                        end
                        else begin
                            num <= num - 4'h7;
                        end
                    end
                    else begin
                        num <= num - 1'b1;
                    end
                end
            end
            else begin
                num <= num;
            end
        end
    end
endmodule