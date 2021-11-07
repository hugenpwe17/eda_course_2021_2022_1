library verilog;
use verilog.vl_types.all;
entity seg_8_hex_led_vlg_check_tst is
    port(
        seg             : in     vl_logic_vector(7 downto 0);
        sampler_rx      : in     vl_logic
    );
end seg_8_hex_led_vlg_check_tst;
