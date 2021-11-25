// time calibration
module time_calibration(
    // ports
    input clk,

    input time_add,
    
    input set_location,
    
    input set_mod,
    input set_alarm,

    input [7:0] hr,
    input [7:0] mn,
    input [7:0] sd,

    output reg [7:0] hr_cal,
    output reg [7:0] mn_cal,
    output reg [7:0] sd_cal,

    output reg [1:0] option_location

);

    // register
    reg time_add_delay;
    // set the location where the modification is required
    always @(posedge set_location) begin
        if(set_mod && !set_alarm) begin
            if(option_location == 2'd3) begin
                option_location <= 1'b1;
            end
            else begin
                option_location <= option_location + 1'b1;
            end
        end
    end
    //
    always @(posedge clk) begin
        time_add_delay <= time_add;
    end
    // time calibration
    always @(posedge clk) begin
        if(time_add && !time_add_delay) begin
        if(set_mod && !set_alarm) begin
            if(option_location == 1) begin
                if(sd_cal[3:0] == 4'H9) begin
                    if(sd_cal[7:4] == 4'H5) begin
                        sd_cal <= 8'h0;
                    end
                    else begin
                        sd_cal <= sd_cal + 8'h7;
                    end
                end
                else begin
                    sd_cal <= sd_cal + 8'h1;
                end
            end
            else if(option_location == 2) begin
                if(mn_cal[3:0] == 4'H9) begin
                    if(mn_cal[7:4] == 4'H5) begin
                        mn_cal <= 8'h0;
                    end
                    else begin
                        mn_cal <= mn_cal + 8'h7;
                    end
                end
                else begin
                    mn_cal <= mn_cal + 8'h1;
                end
            end
            else if(option_location == 3) begin
                if(hr_cal[3:0] == 4'H9) begin
                    hr_cal <= hr_cal + 4'h7;
                end
                else if(hr_cal == 8'h23) begin
                    hr_cal <= 8'h0;
                end
                else begin
                    hr_cal <= hr_cal + 1'b1;
                end
            end
        end
        end
        else if(!set_mod) begin
            hr_cal <= hr;
            mn_cal <= mn;
            sd_cal <= sd;
        end
    end

endmodule