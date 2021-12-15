// module-alterable counter, which can be switched to 50 or 120
module cnt_mod_alt2 #(
    // Parameter
    parameter FREQ_DIV_COEFF_WIDTH = 28,        // frequency division coefficient's bit width
    parameter FREQ_DIV_COEFF = 28'd49_999_999,  // cnt_div : 1s

    parameter MODEL_WIDTH = 12,                 // model's bit width 
	parameter MODEL_1 = 12'b0000_0010_0011,     // model = 24
	parameter MODEL_2 = 12'b0001_0100_1001      // model = 150
    )(
    input sys_clk,          // system clock, default frequency = 50MHz
    input sys_rst_n,        // reset signal, 1 => none, 0 => set counter to 0

    input cnt_en,           // enable signal, 1 => start and keep counter, 0 => stop counter
    
    input cnt_mod_switch,   // switch signal, 0 => model_1, 1=> model_2
    
    output [3:0] single_digits,       // single digits detector signal
    output [3:0] ten_digits,          // ten digits detector signal
    output [3:0] hundred_digits,      // hundred digits detector signal

    output reg          cnt_clk,    // the clock of counter
    output reg [11:0]   num_bin,    // The value of the counter (binary)
    output reg [6:0]    SG0,        // nixie tube signal (sigle digits)
    output reg [6:0]    SG1,        // nixie tube signal (ten digits)
    output reg [6:0]    SG2         // nixie tube signal (hundred digits)
);  
    // register	
	reg [FREQ_DIV_COEFF_WIDTH-1:0] freq_div_cnt;    // counter for frequence diveder
    reg [11:0] model;                               // module register
    
	// 50MHZ system clock to 1HZ clock
	always@(posedge sys_clk)begin 
        if(!sys_rst_n) begin
            freq_div_cnt    <= 1'b0;
            freq_div_cnt    <= 1'b0;
        end
        else begin
            if(freq_div_cnt == FREQ_DIV_COEFF - 1'b1) begin
                freq_div_cnt    <= 1'b0;
                cnt_clk         <= 1'b1;
            end
            else begin
                freq_div_cnt    <= freq_div_cnt + 1'b1;
                cnt_clk         <= 1'b0;
            end
        end
    end		
	
	// Model switching
	always@(cnt_mod_switch) begin
        if(!cnt_mod_switch) begin
            model   <=  MODEL_1;
        end
		else begin
            model   <=  MODEL_2;
        end
    end
    
	// Split the number
    assign  single_digits   =   num_bin[3:0];
    assign  ten_digits      =   num_bin[7:4];
    assign  hundred_digits  =   num_bin[11:8];

	// BCD counter
	always@(posedge cnt_clk, negedge sys_rst_n)begin
        if(!sys_rst_n)
            num_bin <= 0;
        else if(cnt_en)begin
            if(num_bin < model)begin
                if(single_digits == 9)begin
                    if(ten_digits == 9) begin
                        num_bin <= num_bin + 8'h67;    // BCD hundred digits carry 
                    end
                    else begin
                        num_bin <= num_bin + 4'h7;     // BCD tens digits carry 
                    end 
                end
                else begin
                    num_bin <= num_bin + 1'b1;
                end
            end 
            else begin
                num_bin <= 1'b0;
            end
        end
        else begin 
            num_bin <= num_bin;    // default state: keep num_bin
        end
    end

    // 7-seg nuxie tube coder (BCD)
	always@(posedge cnt_clk)begin
        case(single_digits) // single digits
                0:SG0<=7'b100_0000; 1:SG0<=7'b111_1001;
                2:SG0<=7'b010_0100; 3:SG0<=7'b011_0000;
                4:SG0<=7'b001_1001; 5:SG0<=7'b001_0010;
                6:SG0<=7'b000_0010; 7:SG0<=7'b111_1000;
                8:SG0<=7'b000_0000; 9:SG0<=7'b001_0000;
                default:SG0=7'b111_1111;
        endcase
        case(ten_digits) // tens digits
                0:SG1<=7'b100_0000; 1:SG1<=7'b111_1001;
                2:SG1<=7'b010_0100; 3:SG1<=7'b011_0000;
                4:SG1<=7'b001_1001; 5:SG1<=7'b001_0010;
                6:SG1<=7'b000_0010; 7:SG1<=7'b111_1000;
                8:SG1<=7'b000_0000; 9:SG1<=7'b001_0000;
                default:SG1=7'b111_1111;
        endcase
        case(hundred_digits) // hundreds digits
                0:SG2<=7'b100_0000; 1:SG2<=7'b111_1001;
                2:SG2<=7'b010_0100; 3:SG2<=7'b011_0000;
                4:SG2<=7'b001_1001; 5:SG2<=7'b001_0010;
                6:SG2<=7'b000_0010; 7:SG2<=7'b111_1000;
                8:SG2<=7'b000_0000; 9:SG2<=7'b001_0000;
                default:SG2 = 7'b111_1111;
        endcase 
   end

endmodule