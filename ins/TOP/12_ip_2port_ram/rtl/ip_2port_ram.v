//****************************************Copyright (c)***********************************//
//原子哥在线教学平台：www.yuanzige.com
//技术支持：www.openedv.com
//淘宝店铺：http://openedv.taobao.com 
//关注微信公众平台微信号："正点原子"，免费获取ZYNQ & FPGA & STM32 & LINUX资料。
//版权所有，盗版必究。
//Copyright(C) 正点原子 2018-2028
//All rights reserved                                  
//----------------------------------------------------------------------------------------
// File name:           ip_2port_ram
// Last modified Date:  2021/8/7 9:20:14
// Last Version:        V1.0
// Descriptions:        IP核之双端口RAM实验
//----------------------------------------------------------------------------------------
// Created by:          正点原子
// Created date:        2021/8/7 9:20:14
// Version:             V1.0
// Descriptions:        The original version
//
//----------------------------------------------------------------------------------------
//****************************************************************************************//

module ip_2port_ram(
    input               sys_clk        ,  //系统时钟
    input               sys_rst_n         //系统复位，低电平有效
    );

//wire define
wire             clk_50m ;
wire             clk_25m ;
wire             locked  ;
wire             rst_n   ;
   
wire             ram_wr_en  ; //ram写使能
wire    [4:0]    ram_wr_addr; //ram写地址
wire    [7:0]    ram_wr_data; //ram写数据
wire             ram_rd_en  ; //ram读使能
wire    [4:0]    ram_rd_addr; //ram读地址
wire    [7:0]    ram_rd_data; //ram读数据 
   
//*****************************************************
//**                    main code
//*****************************************************

assign rst_n = sys_rst_n & locked;

//锁相环模块
pll_clk u_pll_clk(
    .areset   (~sys_rst_n),
    .inclk0   (sys_clk),
    .c0       (clk_50m),
    .c1       (clk_25m),
    .locked   (locked)
    );

//RAM写模块
ram_wr u_ram_wr(
    .clk           (clk_50m),
    .rst_n         (rst_n),
      
    .ram_wr_en     (ram_wr_en  ),
    .ram_wr_addr   (ram_wr_addr),
    .ram_wr_data   (ram_wr_data)
    );

//简单双端口RAM    
ram_2port   ram_2port_inst (
    .data         (ram_wr_data),
    .rdaddress    (ram_rd_addr ),
    .rdclock      (clk_25m ),
    .rden         (ram_rd_en ),
    .wraddress    (ram_wr_addr),
    .wrclock      (clk_50m ),
    .wren         (ram_wr_en ),  
    .q            (ram_rd_data )
    );

//RAM读模块    
ram_rd u_ram_rd(
    .clk           (clk_25m),
    .rst_n         (rst_n),
                 
    .ram_rd_en     (ram_rd_en  ),
    .ram_rd_addr   (ram_rd_addr),
    .ram_rd_data   (ram_rd_data)
    );    

endmodule
