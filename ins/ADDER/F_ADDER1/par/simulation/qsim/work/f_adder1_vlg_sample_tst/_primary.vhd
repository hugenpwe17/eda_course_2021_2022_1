library verilog;
use verilog.vl_types.all;
entity f_adder1_vlg_sample_tst is
    port(
        ain             : in     vl_logic;
        bin             : in     vl_logic;
        cin             : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end f_adder1_vlg_sample_tst;
