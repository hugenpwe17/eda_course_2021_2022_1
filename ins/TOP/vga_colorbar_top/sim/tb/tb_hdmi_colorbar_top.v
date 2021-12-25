`timescale  1ns/1ns                     //定义仿真时间单位1ns和仿真时间精度为1ns

module  tb_vga_colorbar_top;              

//parameter  define
parameter  T = 20;                      //时钟周期为20ns

//reg define
reg          sys_clk;                   //时钟信号
reg          sys_rst_n;                 //复位信号

//wire define
wire         video_de;
wire         video_hs;
wire         video_vs;
wire  [5:0]  video_rgb;      

//*****************************************************
//**                    main code
//*****************************************************

//给输入信号初始值
initial begin
    sys_clk            = 1'b0;
    sys_rst_n          = 1'b0;     //复位
    #(T+1)  sys_rst_n  = 1'b1;     //在第21ns的时候复位信号信号拉高
end

//50Mhz的时钟，周期则为1/50Mhz=20ns,所以每10ns，电平取反一次
always #(T/2) sys_clk = ~sys_clk;

//例化VGA彩条顶层模块
    main u_main(
        .clk        ( sys_clk      ),
        .rst_n      ( sys_rst_n    ),

        .video_de   ( video_de ),
        .video_hs   ( video_hs ),
        .video_vs   ( video_vs ),
        .video_rgb  ( video_rgb)
    );


endmodule
