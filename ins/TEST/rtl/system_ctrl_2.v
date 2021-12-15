// 异步复位同步释放（by特权同学）
module system_ctrl_2
//==================<端口>==================================================
(
//globel clock ----------------------------------
input  wire                 clk                 , //时钟，50Mhz
input  wire                 rst_n               , //复位，低电平有效
//user interface --------------------------------
input  wire                 a                   , //输入信号
output reg                  b                     //输出信号
);

//==========================================================================
//==    异步复位的同步化设计
//==========================================================================
reg        sys_rst_n_r;
reg        sys_rst_n;

always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        sys_rst_n_r <= 0;
        sys_rst_n   <= 0;
    end
    else begin
        sys_rst_n_r <= 1;
        sys_rst_n   <= sys_rst_n_r;
    end
end

always @(posedge clk or negedge sys_rst_n) begin
    if(!sys_rst_n)
        b <= 0;
    else
        b <= a;
end



endmodule