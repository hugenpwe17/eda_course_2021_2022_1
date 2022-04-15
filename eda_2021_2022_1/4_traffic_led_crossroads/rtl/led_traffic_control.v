module led_traffic_control #(
    // PARAMETER DEFINE
    parameter div_coeff = 32'd50_000_000;   // frequency division coefficient
    )(
    input wire          clk,    // clock, default is 50Mhz
    input wire          rst_n,  // reset signal
    input wire          flag_s, // the signal of country road vehicles waiting

    output reg [23:0]   num,    // 6-bit time signal(BCD CODE)
    output reg [5:0]    led,    // traffic light signals on main roads and country roads,
                                // led = {MR(主红)、MY(主黄)、MG(主绿)、CR(乡红)、CY(乡黄)、CG(乡绿)}

    // // dynamic display
    // output wire [5:0] sel,   // bit select
    // output wire [7:0] seg,   // segment select

    // static display
    output  wire [7:0]  seg,    // segment select of low-bit
    output  wire [7:0]  seg1    // segment select of high-bit
);
    // PARAMETER DEFINE
    // fsm state define
    parameter   MGCR = 2'd00, MYCR = 2'd01,
                MRCG = 2'd10, MRCY = 2'd11; 

    // REGISTER DEFINE
    reg [1:0] state;    // state of fsm
    reg [31:0] cnt;     // frequency division counter
    reg flag_time;      // Divided signal

    // frequency division
    always @(posedge clk, negedge rst_n) begin
        if(!rst_n) begin
            cnt <= 1'b0;
            flag_time <= 1'b0;
        end else begin
            if(cnt == div_coeff) begin
                cnt <= 1'b0;
                flag_time <= 1'b1;
            end else begin
                cnt <= cnt + 1'b1;
                flag_time <= 1'b0;
            end
        end
    end

    // taffic light fsm
    always @(posedge clk, negedge rst_n) begin
        if(!rst_n) begin
            state <= MGCR;
            num <= 8'h60;
            led <= 6'b000000;
        end else begin
            case (state)
                MGCR: begin
                    led <= 6'b001100;
                    if(flag_time) begin
                        if(num == 1'b1) begin
                            if(!flag_s == 1'b1) begin
                                state <= MYCR;
                                num <= 4'h4;
                            end else begin
                                state <= MGCR;
                                num <= 8'h60;
                            end
                        end else begin 
                            if(num[3:0] == 4'h0) begin
                                if(num[7:4] == 4'h0) begin
                                    if(num[11:8] == 4'h0) begin
                                        if(num[15:12] == 4'h0) begin
                                            if(num[19:16] == 4'h0) begin
                                                num = num - 20'h66667;  
                                            end else begin
                                                num = num - 16'h6667;
                                            end
                                        end else begin
                                            num = num - 12'h667;
                                        end
                                    end else begin
                                        num = num - 8'h67;
                                    end
                                end else begin
                                    num = num - 4'h7;
                                end
                            end else begin
                                num = num - 1'b1;
                            end
                        end
                    end else begin
                        state <= state;
                    end
                end 
                MYCR: begin
                    led <= 6'b010100;
                    if(flag_time) begin
                        if(num == 1'b1) begin
                            state <= MRCG;
                            num <= 8'h20;
                        end else begin 
                            if(num[3:0] == 4'h0) begin
                                if(num[7:4] == 4'h0) begin
                                    if(num[11:8] == 4'h0) begin
                                        if(num[15:12] == 4'h0) begin
                                            if(num[19:16] == 4'h0) begin
                                                num = num - 20'h66667;  
                                            end else begin
                                                num = num - 16'h6667;
                                            end
                                        end else begin
                                            num = num - 12'h667;
                                        end
                                    end else begin
                                        num = num - 8'h67;
                                    end
                                end else begin
                                    num = num - 4'h7;
                                end
                            end else begin
                                num = num - 1'b1;
                            end
                        end
                    end else begin
                        state <= state;
                    end
                end 
                MRCG: begin
                    led <= 6'b100001;
                    if(flag_s)begin
                        state <= MRCY;
                        num <= 4'h4;
                    end else begin
                        if(flag_time) begin
                            if(num == 1'b1) begin
                                state <= MRCY;
                                num <= 4'h4;
                            end else begin 
                                if(num[3:0] == 4'h0) begin
                                    if(num[7:4] == 4'h0) begin
                                        if(num[11:8] == 4'h0) begin
                                            if(num[15:12] == 4'h0) begin
                                                if(num[19:16] == 4'h0) begin
                                                    num = num - 20'h66667;  
                                                end else begin
                                                    num = num - 16'h6667;
                                                end
                                            end else begin
                                                num = num - 12'h667;
                                            end
                                        end else begin
                                            num = num - 8'h67;
                                        end
                                    end else begin
                                        num = num - 4'h7;
                                    end
                                end else begin
                                    num = num - 1'b1;
                                end
                            end
                        end else begin
                            state <= state;
                        end
                    end   
                end 
                MRCY: begin
                    led <= 6'b100010;
                    if(flag_time) begin
                        if(num == 1'b1) begin
                            state <= MGCR;
                            num <= 8'h60;
                        end else begin 
                            if(num[3:0] == 4'h0) begin
                                if(num[7:4] == 4'h0) begin
                                    if(num[11:8] == 4'h0) begin
                                        if(num[15:12] == 4'h0) begin
                                            if(num[19:16] == 4'h0) begin
                                                num = num - 20'h66667;  
                                            end else begin
                                                num = num - 16'h6667;
                                            end
                                        end else begin
                                            num = num - 12'h667;
                                        end
                                    end else begin
                                        num = num - 8'h67;
                                    end
                                end else begin
                                    num = num - 4'h7;
                                end
                            end else begin
                                num = num - 1'b1;
                            end
                        end
                    end else begin
                        state <= state;
                    end
                end 
                default: begin
                    state <= MGCR;
                end
            endcase
        end
    end

    // // dynamic display
	//  cnt_seg_dync#(
    //     .stay_time ( 16'd50_000 )
    //     // .stay_time ( 16'd1 )
    // )u_cnt_seg_dync(
    //     .clk   ( clk   ),
    //     .rst_n ( rst_n ),
    //     .num   ( num   ),
    //     .sel   ( sel   ),
    //     .seg   ( seg   )
    // );

    // static display: low-bit
    cnt_seg_static u_cnt_seg_static(
        .cnt4 ( num[3:0] ),
        .seg  ( seg  )
    );
    // static display: high-bit
    cnt_seg_static u_cnt_seg_static1(
        .cnt4 ( num[7:4] ),
        .seg  ( seg1  )
    );

endmodule
