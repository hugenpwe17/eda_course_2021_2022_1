// 异步复位的同步化设计（by Crazybingo）
module system_ctrl_1
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
reg        sys_rst_n;

always @(posedge clk) begin
    if(!rst_n)
        sys_rst_n <= 0;
    else
        sys_rst_n <= rst_n;
end

always @(posedge clk or negedge sys_rst_n) begin
    if(!sys_rst_n)
        b <= 0;
    else
        b <= a;
end



endmodule