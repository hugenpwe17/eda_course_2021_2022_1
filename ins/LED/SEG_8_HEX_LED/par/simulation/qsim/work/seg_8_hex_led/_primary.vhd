library verilog;
use verilog.vl_types.all;
entity seg_8_hex_led is
    port(
        cnt4            : in     vl_logic_vector(3 downto 0);
        seg             : out    vl_logic_vector(7 downto 0)
    );
end seg_8_hex_led;
