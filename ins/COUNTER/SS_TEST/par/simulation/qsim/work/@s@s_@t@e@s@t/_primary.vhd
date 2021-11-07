library verilog;
use verilog.vl_types.all;
entity SS_TEST is
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        load            : in     vl_logic;
        seq_jug         : out    vl_logic;
        seq             : out    vl_logic_vector(15 downto 0);
        state           : out    vl_logic_vector(3 downto 0)
    );
end SS_TEST;
