// module-alterable counter, which can be switched to 50 or 120
module cnt_mod_alt2 (
    input clk,
    input rst,
    input en,
    input switch,
    
    // SG0,SG1,SG2 is nixie tube, respectively shows single, tens, hundreds digits;
    output reg clk_div,
    output reg  [11:0]  num_bin,
    output reg [6:0] SG0,
    output reg [6:0] SG1,
    output reg [6:0] SG2
);
    //parameter
    // count depth
	parameter WIDTH = 25;
    // model = 24
	parameter model_1 = 12'b0000_0010_0011;
    // model = 150
	parameter model_2 = 12'b0001_0100_1001;
    
    // wire
	// single, tens and hundreds digits
	wire [3:0] gw,sw,bw;
	// counter for frequence diveder
	reg [WIDTH-1:0] cnt;
    // model switcher flag
    reg [11:0] model;
    
	// 50MHZ system clock to 1HZ clock
	always@(posedge clk)begin 
        cnt = cnt + 1'b1;
        // if(cnt > 24'd49_999_999)begin
        // 4 for test 
        if(cnt > 4)begin
            clk_div = 1'b1;
            cnt = 1'b0;
        end
        else
            clk_div = 1'b0;
    end		
	// 7-seg nuxie tube coder
	always@(posedge clk_div)begin
        case(gw) // single digits
                0:SG0<=7'b100_0000; 1:SG0<=7'b111_1001;
                2:SG0<=7'b010_0100; 3:SG0<=7'b011_0000;
                4:SG0<=7'b001_1001; 5:SG0<=7'b001_0010;
                6:SG0<=7'b000_0010; 7:SG0<=7'b111_1000;
                8:SG0<=7'b000_0000; 9:SG0<=7'b001_0000;
                default:SG0=7'b111_1111;
        endcase
        case(sw) // tens digits
                0:SG1<=7'b100_0000; 1:SG1<=7'b111_1001;
                2:SG1<=7'b010_0100; 3:SG1<=7'b011_0000;
                4:SG1<=7'b001_1001; 5:SG1<=7'b001_0010;
                6:SG1<=7'b000_0010; 7:SG1<=7'b111_1000;
                8:SG1<=7'b000_0000; 9:SG1<=7'b001_0000;
                default:SG1=7'b111_1111;
        endcase
        case(bw) // hundreds digits
                0:SG2<=7'b100_0000; 1:SG2<=7'b111_1001;
                2:SG2<=7'b010_0100; 3:SG2<=7'b011_0000;
                4:SG2<=7'b001_1001; 5:SG2<=7'b001_0010;
                6:SG2<=7'b000_0010; 7:SG2<=7'b111_1000;
                8:SG2<=7'b000_0000; 9:SG2<=7'b001_0000;
                default:SG2 = 7'b111_1111;
        endcase 
   end
	// mdoel switcher
	always@(switch)
		if(!switch)
			model = model_1;
		else
			model = model_2;
	// 
	assign gw = num_bin[3:0];
	assign sw = num_bin[7:4];
	assign bw = num_bin[11:8];
	// BCD counter
	always@(posedge clk_div, negedge rst)begin
        if(!rst)
            num_bin <= 0;
        else if(en)begin
            if(num_bin < model)begin
                if(gw == 9)begin
                    if(sw == 9)
                        // BCD hundred digits carry
                        num_bin <= num_bin + 8'h67;
                    else 
                        // BCD tens digits carry 
                        num_bin <= num_bin + 4'h7;
                end
                else 
                    num_bin <= num_bin + 1'b1;
            end 
            else
                num_bin <= 1'b0;
        end
        else begin
            // off state: reserve num
            num_bin <= num_bin;
        end
    end

endmodule