# eda_fpga
学习EDA设计时，在FPGA上跑的一些实例  

## eda软件 
quartus ii 13.1   
modelsim-altera 10.1d  

## fpga信息
开发板： 正点原子 新起点V2  
芯片: cyclone IV EP4CE10F17C8N  

## 文件格式  
doc: 说明文档和参考文档  
par: quartus ii生成的工程(project)文件  
rtl: 存放verilog代码文件  
sim: 存放仿真代码(testbench)文件和仿真结果  

# 文件夹说明
.
├── eda_2021_2022_1	// 2021-2022-1学期EDA课程设计
│   ├── 1_full_adder_4	// 4位全加器
│   ├── 2_counter_mod_2	// 双模计数器
│   ├── 3_sequence_generator_with_detector	// 序列发生器&序列检测器
│   ├── 4_traffic_led_crossroads	// 十字路口交通灯发生器
│   ├── 5_digitial_clock	// 数字时钟
│   └── 6_waveform_generator_with_monitor	// 波形发生器&显示驱动
└── ins	// 实例文件
    ├── ADDER	// 加法器
	├── COMP	// 常用部件
	├── COUNTER	// 计数器
	├── LED		// LED灯
	├── MULTIPLIER	// 乘法器
	├── TEST	// 测试
	└── TOP		// 综合项目顶层

# 管脚分配

## DE1-SOC

//PIN ASSIGNMENTS OF DE1-SOC BOARD
//2016-09-12 BY ZWB
To,		Location

### //系统时钟

CLOCK_50 ,		PIN_AF14
CLOCK2_50, 		PIN_AA16
CLOCK3_50 ,		PIN_Y26
CLOCK4_50 ,		PIN_K14 
HPS_CLOCK1_25, 		PIN_D25 
HPS_CLOCK2_25,		PIN_F25 

### //拨动开关

SW[0] ,		PIN_AB12 
SW[1] ,		PIN_AC12 
SW[2] ,		PIN_AF9 
SW[3] ,		PIN_AF10 
SW[4] ,		PIN_AD11 
SW[5] ,		PIN_AD12 
SW[6] ,		PIN_AE11 
SW[7] ,		PIN_AC9 
SW[8] ,		PIN_AD10 
SW[9] ,		PIN_AE12 

### //防抖按键开关

KEY[0] ,		PIN_AA14
KEY[1] ,		PIN_AA15
KEY[2] ,		PIN_W15
KEY[3] ,		PIN_Y16
//LED灯
LEDR[0] ,		PIN_V16
LEDR[1] ,		PIN_W16
LEDR[2] ,		PIN_V17
LEDR[3] ,		PIN_V18
LEDR[4] ,		PIN_W17
LEDR[5] ,		PIN_W19
LEDR[6] ,		PIN_Y19
LEDR[7] ,		PIN_W20
LEDR[8] ,		PIN_W21
LEDR[9] ,		PIN_Y21

### //七段数码管

HEX0[0] ,		PIN_AE26 
HEX0[1] ,		PIN_AE27 
HEX0[2] ,		PIN_AE28 
HEX0[3] ,		PIN_AG27 
HEX0[4] ,		PIN_AF28 
HEX0[5] ,		PIN_AG28 
HEX0[6] ,		PIN_AH28 
HEX1[0] ,		PIN_AJ29 
HEX1[1] ,		PIN_AH29 
HEX1[2] ,		PIN_AH30 
HEX1[3] ,		PIN_AG30 
HEX1[4] ,		PIN_AF29 
HEX1[5] ,		PIN_AF30 
HEX1[6] ,		PIN_AD27 
HEX2[0] ,		PIN_AB23 
HEX2[1] ,		PIN_AE29 
HEX2[2] ,		PIN_AD29 
HEX2[3] ,		PIN_AC28 
HEX2[4] ,		PIN_AD30 
HEX2[5] ,		PIN_AC29 
HEX2[6] ,		PIN_AC30 
HEX3[0] ,		PIN_AD26 
HEX3[1] ,		PIN_AC27 
HEX3[2] ,		PIN_AD25 
HEX3[3] , 		PIN_AC25
HEX3[4] ,		PIN_AB28
HEX3[5] ,		PIN_AB25 
HEX3[6] ,		PIN_AB22 
HEX4[0] ,		PIN_AA24
HEX4[1] ,		PIN_Y23
HEX4[2] ,		PIN_Y24 
HEX4[3] ,		PIN_W22
HEX4[4] ,		PIN_W24 
HEX4[5] ,		PIN_V23 
HEX4[6] ,		PIN_W25 
HEX5[0] ,		PIN_V25 
HEX5[1] ,		PIN_AA28
HEX5[2] ,		PIN_Y27 
HEX5[3] ,		PIN_AB27
HEX5[4] ,		PIN_AB26 
HEX5[5] ,		PIN_AA26 
HEX5[6] ,		PIN_AA25

## 新起点(new origin)开发板

//PIN ASSIGNMENTS OF New origin BOARD
//2021-12-12 BY OYXL
To,		Location
信号名	方向	管脚	端口说明
系统时钟（50Mhz）			
sys_clk	input	M2	系统时钟，频率：50Mhz 
系统复位（RESET）			
sys_rst_n	input	M1	系统复位，低电平有效 
4个按键			
key[0]	input	E16	按键KEY0
key[1]	input	E15	按键KEY1
key[2]	input	M15	按键KEY2
key[3]	input	M16	按键KEY3
4个LED灯			
led[0]	output	D11	LED0
led[1]	output	C11	LED1
led[2]	output	E10	LED2
led[3]	output	F9	LED3
触摸按键			
touch_key	input	F8	触摸按键
蜂鸣器			
beep	output	D12	蜂鸣器
EPCS(W25Q16)			
epcs_flash_data0	input	H2	EPCS SPI输入数据
epcs_flash_dclk	output	H1	EPCS SPI时钟
epcs_flash_sce	input	D2	EPCS SPI片选信号
epcs_flash_sdo	output	C1	EPCS SPI输出数据
6位数码管			
sel[0]	output	N16	第一个数码管位选信号
sel[1]	output	N15	第二个数码管位选信号
sel[2]	output	P16	第三个数码管位选信号
sel[3]	output	P15	第四个数码管位选信号
sel[4]	output	R16	第五个数码管位选信号
sel[5]	output	T15	第六个数码管位选信号
seg_led[0]	output	M11	数码管段选a
seg_led[1]	output	N12	数码管段选b
seg_led[2]	output	C9	数码管段选c
seg_led[3]	output	N13	数码管段选d
seg_led[4]	output	M10	数码管段选e
seg_led[5]	output	N11	数码管段选f
seg_led[6]	output	P11	数码管段选g
seg_led[7]	output	D9	数码管段选h
USB串口			
uart_rxd	input	N5	USB串口接收
uart_txd	output	M7	USB串口发送
HDMI接口			
tmds_data_p [0]	output	B11	TMDS 数据通道0（正极）
tmds_data_p [1]	output	B10	TMDS 数据通道1（正极）
tmds_data_p [2]	output	B9	TMDS 数据通道2（正极）
tmds_clk_p	output	B12	TMDS 时钟通道（正极）
hdmi_scl	output	E9	HDMI 输入接口 SCL
hdmi_sda	inout	E8	HDMI 输入接口 SDA
hdmi_in_hpd	output	D4	HDMI 输入接口热插拔信号
RGB TFT-LCD接口			
lcd_de	output	T2	RGB LCD数据使能
lcd_hs	output	T3	RGB LCD行同步
lcd_vs	output	P3	RGB LCD场同步
lcd_pclk	output	R3	RGB LCD像素时钟
lcd_bl	output	R1	RGB LCD背光控制
lcd_rst	output	L1	RGB LCD系统复位，低有效
lcd_rgb[0]	output	T6	RGB LCD蓝色
lcd_rgb[1]	output	R5	RGB LCD蓝色
lcd_rgb[2]	output	T5	RGB LCD蓝色
lcd_rgb[3]	output	R4	RGB LCD蓝色
lcd_rgb[4]	output	T4	RGB LCD蓝色
lcd_rgb[5]	output	T9	RGB LCD绿色
lcd_rgb[6]	output	R8	RGB LCD绿色
lcd_rgb[7]	output	T8	RGB LCD绿色
lcd_rgb[8]	output	R7	RGB LCD绿色
lcd_rgb[9]	output	T7	RGB LCD绿色
lcd_rgb[10]	output	R6	RGB LCD绿色
lcd_rgb[11]	output	R11	RGB LCD红色
lcd_rgb[12]	output	T11	RGB LCD红色
lcd_rgb[13]	output	R10	RGB LCD红色
lcd_rgb[14]	output	T10	RGB LCD红色
lcd_rgb[15]	output	R9	RGB LCD红色
红外遥控			
remote_in	input	L8	红外接收信号
单总线（DS18B20/DHT11）			
dq	inout	F10	单总线
IIC总线（EEPROM/环境光传感器/RTC实时时钟/音频配置）			
iic_scl	output	D8	IIC时钟信号线
iic_sda	inout	C8	IIC双向数据线
SDRAM			
sdram_clk	output	B14	SDRAM 芯片时钟
sdram_cke	output	F16	SDRAM 时钟有效
sdram_cs_n	output	K10	SDRAM 片选
sdram_ras_n	output	K11	SDRAM 行有效
sdram_cas_n	output	J12	SDRAM 列有效
sdram_we_n	output	J13	SDRAM 写有效
sdram_ba[0]	output	G11	SDRAM Bank地址
sdram_ba[1]	output	F13	SDRAM Bank地址
sdram_dqm[0]	output	J14	SDRAM 数据掩码
sdram_dqm[1]	output	G15	SDRAM 数据掩码
sdram_addr[0]	output	F11	SDRAM 行/列地址
sdram_addr[1]	output	E11	SDRAM 行/列地址
sdram_addr[2]	output	D14	SDRAM 行/列地址
sdram_addr[3]	output	C14	SDRAM 行/列地址
sdram_addr[4]	output	A14	SDRAM 行/列地址
sdram_addr[5]	output	A15	SDRAM 行/列地址
sdram_addr[6]	output	B16	SDRAM 行/列地址
sdram_addr[7]	output	C15	SDRAM 行/列地址
sdram_addr[8]	output	C16	SDRAM 行/列地址
sdram_addr[9]	output	D15	SDRAM 行/列地址
sdram_addr[10]	output	F14	SDRAM 行/列地址
sdram_addr[11]	output	D16	SDRAM 行/列地址
sdram_addr[12]	output	F15	SDRAM 行/列地址
sdram_data[0]	inout	P14	SDRAM 数据
sdram_data[1]	inout	M12	SDRAM 数据
sdram_data[2]	inout	N14	SDRAM 数据
sdram_data[3]	inout	L12	SDRAM 数据
sdram_data[4]	inout	L13	SDRAM 数据
sdram_data[5]	inout	L14	SDRAM 数据
sdram_data[6]	inout	L11	SDRAM 数据
sdram_data[7]	inout	K12	SDRAM 数据
sdram_data[8]	inout	G16	SDRAM 数据
sdram_data[9]	inout	J11	SDRAM 数据
sdram_data[10]	inout	J16	SDRAM 数据
sdram_data[11]	inout	J15	SDRAM 数据
sdram_data[12]	inout	K16	SDRAM 数据
sdram_data[13]	inout	K15	SDRAM 数据
sdram_data[14]	inout	L16	SDRAM 数据
sdram_data[15]	inout	L15	SDRAM 数据
摄像头接口（OV5640/OV7725）			
cam_pclk	input	R13	cmos 数据像素时钟
cam_vsync	input	P9	cmos 场同步信号
cam_href	input	M9	cmos 行同步信号
cam_rst_n	output	L9	cmos 复位信号，低电平有效
cam_pwdn/	output	R12	cmos 电源休眠模式选择信号/
cam_sgm_ctrl			cmos 时钟选择信号（0：使用引脚XCLK提供的时钟 1：使用摄像头自带的晶振提供时钟）
cam_scl	output	N9	cmos IIC时钟信号线
cam_sda	inout	L10	cmos IIC双向数据线
cam_data[0]	input	K9	cmos 数据
cam_data[1]	input	P8	cmos 数据
cam_data[2]	input	N8	cmos 数据
cam_data[3]	input	M8	cmos 数据
cam_data[4]	input	P6	cmos 数据
cam_data[5]	input	N6	cmos 数据
cam_data[6]	input	R14	cmos 数据
cam_data[7]	input	T14	cmos 数据
SD卡（SPI模式）			
sd_miso	input	K1	SD卡SPI串行输入数据
sd_clk	input	J2	SD卡SPI时钟
sd_cs	input	C2	SD卡SPI片选
sd_mosi	output	D1	SD卡SPI串行输出数据
SD卡（SDIO模式）			
sdio_sck	output	J2	SD卡SDIO时钟
sdio_cmd	inout	D1	SD卡SDIO命令
sdio_d0	inout	K1	SD卡SDIO数据
sdio_d1	inout	K2	SD卡SDIO数据
sdio_d2	inout	B1	SD卡SDIO数据
sdio_d3	inout	C2	SD卡SDIO数据
无线（NRF24L01）			
nrf_ce	output	J1	RX或TX模式选择
nrf_cs	output	G2	NRF SPI片选
nrf_sck	output	F2	NRF SPI时钟
nrf_mosi	output	F1	NRF SPI串行输出数据信号
nrf_miso	input	F3	NRF SPI串行输入数据信号
nrf_irq	input	G1	NRF 中断信号
ATK MODULE			
uart_rx	input	E6	接收端口
uart_tx	output	A8	发送端口
gbc_key	input	D5	按键端口
gbc_led	output	D3	led端口
