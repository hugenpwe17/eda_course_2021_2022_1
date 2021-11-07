library verilog;
use verilog.vl_types.all;
entity cnt_m_vlg_check_tst is
    port(
        cnt             : in     vl_logic_vector(3 downto 0);
        sampler_rx      : in     vl_logic
    );
end cnt_m_vlg_check_tst;
