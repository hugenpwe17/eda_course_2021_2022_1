module system_ctrl_3 (
    input wire clk,
    input wire rst_n,

    input wire a,
    output reg b,

    output reg sys_rst_n
);

    

    always @(posedge clk, negedge rst_n) begin
        if(!rst_n) begin
            sys_rst_n <= 1'b0;
        end
        else begin
            sys_rst_n <= rst_n;
        end
    end

    always @(posedge clk, negedge sys_rst_n) begin
        if(!sys_rst_n) begin
            b <= 1'b0;
        end
        else begin
            b <= a;
        end
    end
    
endmodule