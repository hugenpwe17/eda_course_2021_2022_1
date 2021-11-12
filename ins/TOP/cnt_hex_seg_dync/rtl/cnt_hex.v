module cnt_hex #(
    // paremeter
        // parameter model = 12'b1001_1001_1001;
    parameter model = 8'h24,
    // inc time = inc_time * 20ns
    parameter inc_time = 24'd5_000_000
        //parameter inc_time = 3'd4;
) (
    input clk,
    input rst_n,

    output reg [23:0] num
);
    
    // register
    reg [23:0] cnt;
    reg flag_inc_time;
    
    // 0.1s counter 
    always @(posedge clk, negedge rst_n) begin
        if(!rst_n)
            cnt <= 1'b0;
        else begin
            if(cnt == inc_time) begin
                cnt <= 1'b0;
                flag_inc_time <= 1'b1;
            end
            else begin
                cnt <= cnt + 1'b1;
                flag_inc_time <= 1'b0;
            end
        end
    end
    // ++
    always @(posedge clk, negedge rst_n) begin
        if(!rst_n) begin
            num <= 1'b0;
        end
        else begin
            if(flag_inc_time) begin
                if(num == model - 1'b1) begin
                    num <= 1'd0;
                end
                else begin
                    if(num[3:0] == 4'h9) begin
                        if(num[7:4] == 4'h9) begin
                            if(num[11:8] == 4'h9) begin
                                if(num[15:12] == 4'h9) begin
                                    if(num[19:16] == 4'h9) begin
                                        num <= num + 20'h66667;  
                                    end
                                    else begin
                                        num <= num + 16'h6667;
                                    end
                                end
                                else begin
                                    num <= num + 12'h667;
                                end
                            end
                            else begin
                                num <= num + 8'h67;
                            end
                        end
                        else begin
                            num <= num + 4'h7;
                        end
                    end
                    else begin
                        num <= num + 1'b1;
                    end
                end
            end
            else begin
               num <= num; 
            end
        end
    end


endmodule