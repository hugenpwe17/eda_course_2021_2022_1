// 8_SEG_HEX_LED(common anode, dynamic)

module cnt_seg_dync #(
    // stat time = stay_time * 20ns
    parameter stay_time = 16'd50_000
) (
    input clk,
    input rst_n,

    input [23:0] num,

    output reg [5:0] sel,
    output reg [7:0] seg
);

    // register
    reg [15:0] cnt;
    reg flag_stay;
    reg [2:0] cnt_sel;
    reg [3:0] num_bit;
    
    // flag generator
    always @(posedge clk, negedge rst_n) begin
        if(!rst_n) begin
            cnt <= 1'b0;
            flag_stay <= 1'b0;
        end
        else begin
            if(cnt == stay_time) begin
                cnt <= 1'b0;
                flag_stay <= 1'b1;
            end
            else begin
                cnt <= cnt + 1'b1;
                flag_stay <= 1'b0;
            end
        end
    end
    // bit switch (1ms)
    always @(posedge clk, negedge rst_n) begin
        if(!rst_n) begin
            cnt_sel <= 1'b0;
        end
        else begin
            if(flag_stay) begin
                if(cnt_sel == 3'd5) begin
                    cnt_sel <= 3'b0;
                end
                else begin
                    cnt_sel <= cnt_sel + 1'b1;
                end
            end
            else begin
                cnt_sel <= cnt_sel;
            end
        end
    end
    always @(posedge clk, negedge rst_n) begin
        if(!rst_n) begin
            sel <= 6'b111111;
            num_bit <= 1'b0;
        end
        else begin
            case(cnt_sel)
                3'd0: begin
                    sel <= 6'b111110;
                    num_bit <= num[3:0];
                end
                3'd1: begin
                    sel <= 6'b111101;
                    num_bit <= num[7:4];
                end
                3'd2: begin
                    sel <= 6'b111011;
                    num_bit <= num[11:8];
                end
                3'd3: begin
                    sel <= 6'b110111;
                    num_bit <= num[15:12];
                end
                3'd4: begin
                    sel <= 6'b101111;
                    num_bit <= num[19:16];
                end
                3'd5: begin
                    sel <= 6'b011111;
                    num_bit <= num[23:20];
                end
                default: begin
                    sel <= 6'b111111;
                    num_bit <= 1'b0;
                end
            endcase
        end
    end

    // bcd to seg
    always @(posedge clk, negedge rst_n) begin
        if(!rst_n) begin
            seg <= 8'b1100_0000;
        end
        else begin
            case(num_bit)
                4'H0: seg = 8'b1100_0000; 4'H1: seg = 8'b1111_1001;
                4'H2: seg = 8'b1010_0100; 4'H3: seg = 8'b1011_0000;
                4'H4: seg = 8'b1001_1001; 4'H5: seg = 8'b1001_0010;
                4'H6: seg = 8'b1000_0010; 4'H7: seg = 8'b1111_1000;
                4'H8: seg = 8'b1000_0000; 4'H9: seg = 8'b1001_0000;
                default: seg = 8'b1111_1111;
            endcase
        end   
    end

endmodule