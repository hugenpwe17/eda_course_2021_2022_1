library verilog;
use verilog.vl_types.all;
entity SS_TEST_vlg_check_tst is
    port(
        seq             : in     vl_logic_vector(15 downto 0);
        seq_jug         : in     vl_logic;
        state           : in     vl_logic_vector(3 downto 0);
        sampler_rx      : in     vl_logic
    );
end SS_TEST_vlg_check_tst;
