module alarm_set (
    input clk,

    input set_mod,
    input set_alarm,

    input time_add,
    input set_location,

    output reg [7:0] hr_alarm,
    output reg [7:0] mn_alarm,
    output reg [7:0] sd_alarm,

    output reg [1:0] alarm_location
);
    reg time_add_delay2;
    always @(posedge set_location) begin
        if(set_mod && set_alarm) begin
            if(alarm_location == 2'd3) begin
                alarm_location <= 1'b1;
            end
            else begin
                alarm_location <= alarm_location + 1'b1;
            end
        end
    end
    //
    always @(posedge clk) begin
        time_add_delay2 <= time_add;
    end
    //
    always @(posedge clk) begin
        if(time_add && !time_add_delay2) begin
        if(set_mod && set_alarm) begin
            if(alarm_location == 1) begin
                if(sd_alarm[3:0] == 4'H9) begin
                    if(sd_alarm[7:4] == 4'H5) begin
                        sd_alarm <= 8'h0;
                    end
                    else begin
                        sd_alarm <= sd_alarm + 8'h7;
                    end
                end
                else begin
                    sd_alarm <= sd_alarm + 8'h1;
                end
            end
            else if(alarm_location == 2) begin
                if(mn_alarm[3:0] == 4'H9) begin
                    if(mn_alarm[7:4] == 4'H5) begin
                        mn_alarm <= 8'h0;
                    end
                    else begin
                        mn_alarm <= mn_alarm + 8'h7;
                    end
                end
                else begin
                    mn_alarm <= mn_alarm + 8'h1;
                end
            end
            else if(alarm_location == 3) begin
                if(hr_alarm[3:0] == 4'H9) begin
                    hr_alarm <= hr_alarm + 4'h7;
                end
                else if(hr_alarm == 8'h23) begin
                    hr_alarm <= 8'h0;
                end
                else begin
                    hr_alarm <= hr_alarm + 1'b1;
                end
            end
        end
        end
    end

endmodule