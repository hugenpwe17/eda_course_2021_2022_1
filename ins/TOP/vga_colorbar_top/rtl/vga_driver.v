// 1280 * 720 @ 60Hz
module vga_driver (
    input pixel_clk,
    input rst_n,

    // 显示区域
    input pixel_data,       // 像素点数据

    output pixel_xpos,      // 像素点横坐标
    output pixel_ypos,       // 像素点纵坐标

    // RGB接口
    output video_en,
    output video_hs,        // 行同步信号
    output video_vs,        // 场同步信号
    output [2:0] video_rgb  // RGB颜色数据

    
);
    // Praameter define
    // 1280*720 分辨率时序参数
    parameter  H_SYNC   =  11'd40;   //行同步
    parameter  H_BACK   =  11'd220;  //行显示后沿
    parameter  H_DISP   =  11'd1280; //行有效数据
    parameter  H_FRONT  =  11'd110;  //行显示前沿
    parameter  H_TOTAL  =  11'd1650; //行扫描周期

    parameter  V_SYNC   =  11'd5;    //场同步
    parameter  V_BACK   =  11'd20;   //场显示后沿
    parameter  V_DISP   =  11'd720;  //场有效数据
    parameter  V_FRONT  =  11'd5;    //场显示前沿
    parameter  V_TOTAL  =  11'd750;  //场扫描周期

    // register define
    reg [10:0] cnt_h;
    reg [10:0] cnt_V;

    //-------------main----------------

    // 行计数器对像素时钟计数
    always @(posedge pixel_clk) begin
        if(!rst_n) begin
            cnt_h <= 11'b0;
        end
        else begin
            if(cnt_h = H_TOTAL - 1'b1) begin
                cnt_h <= 11'd0;
            end
            else begin
                cnt_h <= cnt_h + 1'b1;
            end
        end
    end

    // 场计数器对行计数
    always @(posedge pixel_clk) begin
        if(!rst_n) begin
            cnt_v <= 11'b0;
        end
        else begin
            if(cnt_h == H_TOTAL - 1'b1) begin
                if(cnt_v == V_TOTAL - 1'b1) begin
                    cnt_v <= 1'b0;
                end
                else begin
                    cnt_v <= cnt_v + 1'b1;
                end
            end
            else begin
                cnt_v <= cnt_v;
            end
        end
    end

endmodule