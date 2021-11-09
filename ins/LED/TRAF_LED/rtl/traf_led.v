// traffic lights at the intersection of main road and country road
module traf_led (
    input clk,
    input rst_n,
    input req_sgn,

    output reg [5:0] led // MR,MY,MG;CR,CY,CG
);
    // parameter
    parameter width = 32;
    parameter idle = 2'd00, s1 = 2'd01,
                s2 = 2'd10, s3 = 2'd11;

    // register
    reg [1:0] state;
    reg [width-1:0] cnt;

    // main code
    always @(posedge clk, negedge rst_n) begin
        if (!rst_n)
            cnt <= {width{1'd0}};
        else begin
            cnt <= cnt + 1'd1;
        end
        
    end

    always @(posedge clk, negedge rst_n) begin
        if(!rst_n)
            state <= idle;
        else begin
            case (state)
                // state 0: MGCR
                idle: begin
                    led <= 6'b001_100;
                    if(cnt == 32'd3_000_000_000) begin
                        cnt <= {width{1'd0}};
                        if(req_sgn == 1)
                            state <= s1;
                        else
                            state <= state;
                    end
                    else
                        state <= state;
                end
                // state 1: MYCR
                s1: begin
                    led <= 6'b010_100;
                    if(cnt == 32'd200_000_000) begin
                        cnt <= 32'd0;
                        state <= s2;
                    end
                    else
                        state <= state;
                end
                // state 2:MRCG
                s2: begin
                    led <= 6'b100_001;
                    if(req_sgn == 1'd0)
                        state <= s3;
                    else begin
                        if(cnt == 32'd1_000_000_000) begin
                            cnt <= 32'd0;
                            state <= s3;
                        end
                        else begin
                            if(req_sgn == 1'd0)
                                state <= s3;
                            else 
                                state <= state;
                        end
                    end
                end
                // state 3: MRCY
                s3: begin
                    led <= 6'b100_010;
                    if(cnt == 32'd200_000_000) begin
                        cnt <= 32'd0;
                        state <= s2;
                    end
                    else
                        state <= state;
                end
                default: state <= idle;
            endcase
        end

    end
endmodule