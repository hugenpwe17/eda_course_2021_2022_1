// timing

module clock #(
    parameter           cnt_max = 28'd50_000_000
) (
    input               clk,
    input               rst_n,

    input               set_mod,
    input               set_alarm,

    input               time_add,

    input       [7:0]   hr_cal,
    input       [7:0]   mn_cal,
    input       [7:0]   sd_cal,

    output reg  [7:0]   hr,
    output reg  [7:0]   mn,
    output reg  [7:0]   sd
);
    // REGISTER DEFINE
    reg [27:0]  cnt;
    reg         flag_1s;

    // 1s coutner flag
    always @(posedge clk, negedge rst_n) begin
        if(!rst_n) begin
            cnt <= 1'b0;
            flag_1s <= 1'b0;
        end
        else begin
            if(cnt == cnt_max) begin
                cnt <= 1'b0;
                flag_1s <= 1'b1;
            end
            else begin
                cnt <= cnt + 1'b1;
                flag_1s <= 1'b0;
            end
        end
    end

    // clock
    always @(posedge clk) begin
        if(!set_mod) begin
            if(!rst_n) begin
                hr <= 1'b0;
                mn <= 1'b0;
                sd <= 1'b0;
            end
            else begin
                if(flag_1s) begin
                    if(sd[3:0] == 4'h9) begin
                        if(sd[7:4] == 4'h5) begin
                            if(mn[3:0] == 4'h9) begin
                                if(mn[7:4] == 4'h5) begin
                                    if(hr[3:0] == 4'h9) begin
                                        sd <= 1'b0;
                                        mn <= 1'b0;
                                        hr <= hr + 4'h7; 
                                    end
                                    else begin
                                        if(hr == 8'h23) begin
                                            sd <= 1'b0;
                                            mn <= 1'b0;
                                            hr <= 1'b0;
                                        end
                                        else begin
                                            sd <= 1'b0;
                                            mn <= 1'b0;
                                            hr <= hr + 4'h1; 
                                        end
                                    end
                                end
                                else begin
                                    sd <= 1'b0;
                                    mn <= mn + 4'h7;
                                end
                            end
                            else begin
                                sd <= 1'b0;
                                mn <= mn + 4'h1;
                            end
                        end
                        else begin
                            sd <= sd + 4'h7;
                        end
                    end
                    else begin
                        sd <= sd + 4'h1;
                    end
                end
                else begin
                    hr <= hr;
                    mn <= mn;
                    sd <= sd;
                end
            end
        end
        else if(time_add /*set_mod && !set_alarm*/) begin
            hr <= hr_cal;
            mn <= mn_cal;
            sd <= sd_cal;
        end
    end
endmodule