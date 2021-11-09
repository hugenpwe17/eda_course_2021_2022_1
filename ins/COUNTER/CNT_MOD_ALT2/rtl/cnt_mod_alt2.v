// module-alterable counter, which can be switched to 50 or 120
module cnt_mod_alt2 (
    //clk閺冨爼鎸撴穱鈥冲娇閿涘st闁插秶鐤嗘穱鈥冲娇閿涘當n娴ｈ儻鍏樻穱鈥冲娇閿涘witch濡€冲瀼閹诡澀淇婇崣
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
    //濡
	parameter model_1 = 12'b0000_0010_0011;
    //濡0
	parameter model_2 = 12'b0001_0100_1001;
    
    //wire
	//gw娑擃亙缍呴敍瀹粀閸椾椒缍呴敍瀹恮閻у彞缍
	wire [3:0] gw,sw,bw;
	//clk_div閸掑棝顣堕弮鍫曟寭娣団€冲娇閿涘畱nt閸掑棝顣剁拋鈩冩殶鐎靛嫬鐡ㄩ崳顭掔礉model濡剝鏆熺€靛嫬鐡ㄩ崳顭掔礉num_bin鐠佲剝鏆熺€靛嫬鐡ㄩ崳
	reg [WIDTH-1:0] cnt;
    reg [11:0] model;
    
	// 50MHZ閸掑棝顣
	always@(posedge clk)begin 
        cnt = cnt + 1'b1;
        if(cnt > 24'd49999999)begin
        //if(cnt > 4)begin
            clk_div = 1'b1;
            cnt = 1'b0;
        end
        else
            clk_div = 1'b0;
    end		
	// 闂堟瑦鈧焦鏆熼惍浣侯吀鐠囨垹鐖
	always@(posedge clk_div)begin
        case(gw) // 娑擃亙缍
                0:SG0<=7'b100_0000; 1:SG0<=7'b111_1001;
                2:SG0<=7'b010_0100; 3:SG0<=7'b011_0000;
                4:SG0<=7'b001_1001; 5:SG0<=7'b001_0010;
                6:SG0<=7'b000_0010; 7:SG0<=7'b111_1000;
                8:SG0<=7'b000_0000; 9:SG0<=7'b001_0000; //7濞堜絻鐦ч惍浣糕偓
                default:SG0=7'b111_1111;
        endcase
        case(sw) // 閸椾椒缍
                0:SG1<=7'b100_0000; 1:SG1<=7'b111_1001;
                2:SG1<=7'b010_0100; 3:SG1<=7'b011_0000;
                4:SG1<=7'b001_1001; 5:SG1<=7'b001_0010;
                6:SG1<=7'b000_0010; 7:SG1<=7'b111_1000;
                8:SG1<=7'b000_0000; 9:SG1<=7'b001_0000; //7濞堜絻鐦ч惍浣糕偓
                default:SG1=7'b111_1111;
        endcase
        case(bw) // 閻у彞缍
                0:SG2<=7'b100_0000; 1:SG2<=7'b111_1001;
                2:SG2<=7'b010_0100; 3:SG2<=7'b011_0000;
                4:SG2<=7'b001_1001; 5:SG2<=7'b001_0010;
                6:SG2<=7'b000_0010; 7:SG2<=7'b111_1000;
                8:SG2<=7'b000_0000; 9:SG2<=7'b001_0000; //7濞堜絻鐦ч惍浣糕偓
                default:SG2 = 7'b111_1111;//7濞堥潧鍙￠梼铏€☉鍫ユ娑揊H
        endcase 
   end
	// 濡€冲瀼閹
	always@(switch)
		if(!switch)
			model = model_1;
		else
			model = model_2;
	
	assign gw = num_bin[3:0];
	assign sw = num_bin[7:4];
	assign bw = num_bin[11:8];
	// BCD鐠佲剝鏆
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