module  vga_display(
    input                pixel_clk,
    input                sys_rst_n,
    
    input        [9:0]  pixel_xpos,  //像素点横坐标
    input        [9:0]  pixel_ypos,  //像素点纵坐标
    output  reg  [5:0]   pixel_data   //像素点数据
);

//parameter define
parameter  H_DISP = 10'd640;                       //分辨率——行
parameter  V_DISP = 10'd480;                        //分辨率——列

localparam WHITE  = 6'b11_11_11;  //RGB222 白色
localparam BLACK  = 6'b00_00_00;  //RGB222 黑色
localparam RED    = 6'b11_00_00;  //RGB222 红色
localparam GREEN  = 6'b00_11_00;  //RGB222 绿色
localparam Green  = 6'b00_01_00;  //RGB222 淡绿色
localparam BLUE   = 6'b00_00_11;  //RGB222 蓝色

// wire
wire display_region;    // 显示区域信号
wire edge_region;       // 边框区域像素信号
wire axis_region;			//	坐标轴区域信号
wire grid_region;			// 网格区域信号
    
//*****************************************************
//**                    main code
//*****************************************************

// 显示区域
assign display_region = ((pixel_xpos >= 140 - 1) && (pixel_xpos <= 1280 - 140) && (pixel_ypos >= 48) && (pixel_ypos <= 624)) ? 1'b1 : 1'b0;
// 边框区域
assign edge_region = ((pixel_xpos == 140 - 1) || (pixel_xpos == 1280 - 140) || (pixel_ypos == 48) || (pixel_ypos == 624)) ? 1'b1 : 1'b0;
// 坐标轴区域
assign axis_region = ((pixel_xpos == 640) || (pixel_ypos == 336)) ? 1'b1 : 1'b0;
// 网格区域
assign grid_region = ((((( pixel_xpos / 64 ) * 64 - pixel_xpos) == 0) && (pixel_ypos[0])) || ((((pixel_ypos / 32) * 32 - pixel_ypos) == 0) && (pixel_xpos[0]))) ? 1'b1 : 1'b0;

// //根据当前像素点坐标指定当前像素点颜色数据，在屏幕上显示彩条
// always @(posedge pixel_clk ) begin
//     if (!sys_rst_n) begin
//         pixel_data <= WHITE;
//     end else begin
//         if(display_region) begin
//             if(edge_region) begin
//                 pixel_data <= GREEN;
//             end else if(grid_region) begin
//                 pixel_data <= Green;
//             end else begin
//                 pixel_data <= BLACK;
//             end
//         end else begin
//             pixel_data <= BLACK;
//         end
//     end  
// end

// assign test_region = (
//                         (pixel_xpos == 0) ||    // left edge
//                         (pixel_ypos == 0) ||    // top edge
//                         (pixel_xpos == 639) ||  // right edge
//                         (pixel_ypos == 479)     // bottom edge 
//                         );

assign  test_region = ((pixel_xpos % 80 == 0) || (pixel_ypos % 80 ==0));

assign  test_region2 = ((pixel_xpos % 80 == 79) || (pixel_ypos % 80 == 79));

always @(posedge pixel_clk ) begin
    if(test_region) begin
        pixel_data <= BLUE;
    end else if(test_region2) begin
        pixel_data <= RED;
    end else begin
        pixel_data <= BLACK;
    end
end

endmodule