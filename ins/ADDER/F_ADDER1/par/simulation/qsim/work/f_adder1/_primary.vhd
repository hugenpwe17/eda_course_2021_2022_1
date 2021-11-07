library verilog;
use verilog.vl_types.all;
entity f_adder1 is
    port(
        ain             : in     vl_logic;
        bin             : in     vl_logic;
        cin             : in     vl_logic;
        sout            : out    vl_logic;
        cout            : out    vl_logic
    );
end f_adder1;
