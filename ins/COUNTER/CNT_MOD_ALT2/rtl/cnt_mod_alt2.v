// module-alterable counter, which can be switched to 50 or 120
module cnt_mod_alt2 (
    //clk鏃堕挓淇″彿锛宺st閲嶇疆淇″彿锛宔n浣胯兘淇″彿锛宻witch妯″垏鎹俊鍙
    input clk,
    input rst,
    input en,
    input switch,
    
    //output reg[6:0] SG0,SG1,SG2;
    output reg clk_div,
    output reg  [11:0]  num_bin,
    output reg [6:0] SG0,
    output reg [6:0] SG1,
    output reg [6:0] SG2
);
    //parameter
	parameter WIDTH = 25;
    //妯4
	parameter model_1 = 12'b0000_0010_0011;
    //妯50
	parameter model_2 = 12'b0001_0100_1001;
    
    //wire
	//gw涓綅锛宻w鍗佷綅锛宐w鐧句綅
	wire [3:0] gw,sw,bw;
	//clk_div鍒嗛鏃堕挓淇″彿锛宑nt鍒嗛璁℃暟瀵勫瓨鍣紝model妯℃暟瀵勫瓨鍣紝num_bin璁℃暟瀵勫瓨鍣
	reg [WIDTH-1:0] cnt;
    reg [11:0] model;
    
	// 50MHZ鍒嗛
	always@(posedge clk)begin 
        cnt = cnt + 1'b1;
        //if(cnt > 49_999_999)
        if(cnt > 4)begin
            clk_div = 1'b1;
            cnt = 1'b0;
        end
        else
            clk_div = 1'b0;
    end		
	// 闈欐€佹暟鐮佺璇戠爜
	always@(posedge clk_div)begin
        case(gw) // 涓綅
                0:SG0<=7'b100_0000; 1:SG0<=7'b111_1001;
                2:SG0<=7'b010_0100; 3:SG0<=7'b011_0000;
                4:SG0<=7'b001_1001; 5:SG0<=7'b001_0010;
                6:SG0<=7'b000_0010; 7:SG0<=7'b111_1000;
                8:SG0<=7'b000_0000; 9:SG0<=7'b001_0000; //7娈佃瘧鐮佸€
                default:SG0=7'b111_1111;
        endcase
        case(sw) // 鍗佷綅
                0:SG1<=7'b100_0000; 1:SG1<=7'b111_1001;
                2:SG1<=7'b010_0100; 3:SG1<=7'b011_0000;
                4:SG1<=7'b001_1001; 5:SG1<=7'b001_0010;
                6:SG1<=7'b000_0010; 7:SG1<=7'b111_1000;
                8:SG1<=7'b000_0000; 9:SG1<=7'b001_0000; //7娈佃瘧鐮佸€
                default:SG1=7'b111_1111;
        endcase
        case(bw) // 鐧句綅
                0:SG2<=7'b100_0000; 1:SG2<=7'b111_1001;
                2:SG2<=7'b010_0100; 3:SG2<=7'b011_0000;
                4:SG2<=7'b001_1001; 5:SG2<=7'b001_0010;
                6:SG2<=7'b000_0010; 7:SG2<=7'b111_1000;
                8:SG2<=7'b000_0000; 9:SG2<=7'b001_0000; //7娈佃瘧鐮佸€
                default:SG2 = 7'b111_1111;//7娈靛叡闃虫瀬娑堥殣涓FH
        endcase 
   end
	// 妯″垏鎹
	always@(switch)
		if(!switch)
			model = model_1;
		else
			model = model_2;
	
	assign gw = num_bin[3:0];
	assign sw = num_bin[7:4];
	assign bw = num_bin[11:8];
	// BCD璁℃暟
	always@(posedge clk_div, negedge rst)begin
        if(!rst)
            num_bin = 0;
        else if(en)begin
            if(num_bin < model)begin
                if(gw == 9)begin
                    num_bin = num_bin + 12'd7;
                    if(sw == 9)
                        num_bin = num_bin + 12'd96;
                end
                else 
                    num_bin = num_bin + 1'b1;
            end 
            else
                num_bin = 1'b0;
        end
    end

endmodule