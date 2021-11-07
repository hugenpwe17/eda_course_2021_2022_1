library verilog;
use verilog.vl_types.all;
entity seg_8_hex_led_vlg_sample_tst is
    port(
        cnt4            : in     vl_logic_vector(3 downto 0);
        sampler_tx      : out    vl_logic
    );
end seg_8_hex_led_vlg_sample_tst;
