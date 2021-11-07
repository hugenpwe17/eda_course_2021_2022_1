library verilog;
use verilog.vl_types.all;
entity main is
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        clk_div         : out    vl_logic
    );
end main;
