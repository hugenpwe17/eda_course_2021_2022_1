library verilog;
use verilog.vl_types.all;
entity cnt_m_vlg_sample_tst is
    port(
        sys_clk         : in     vl_logic;
        sys_rst_n       : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end cnt_m_vlg_sample_tst;
