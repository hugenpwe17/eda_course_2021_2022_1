module ram_rd(
    input                   clk,            //时钟信号
    input                   rst_n,          //复位信号，低电平有效
    input   wire    [9:0]   pixel_xpos,
    input   wire    [9:0]   pixel_ypos,
                                    
    //RAM读端口操作                         
    output                  ram_rd_en,      //ram读使能
    output  reg     [9:0]   ram_rd_addr,    //ram读地址     
    input           [11:0]  ram_rd_data,    //ram读数据

    output reg              vga_wave
);

reg  [5:0]  rd_cnt;                 //读控制计数器

// //rd_cnt计数范围在0~31,ram_rd_en为高电平
// assign ram_rd_en = ((rd_cnt>=6'd0) && (rd_cnt<=6'd31) && rst_n) ? 1'b1 : 1'b0;
assign ram_rd_en = 1'b1; 

always @(posedge clk) begin
    ram_rd_addr <= pixel_xpos;
end

always @(posedge clk) begin
    if(ram_rd_data[11:4] == (256 - (pixel_ypos - 112 + 4))) begin
        vga_wave <= 1'b1;
    end
    else begin
        vga_wave <= 1'b0;
    end
end

endmodule