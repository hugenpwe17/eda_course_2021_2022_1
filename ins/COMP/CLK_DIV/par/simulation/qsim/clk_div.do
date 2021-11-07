onerror {exit -code 1}
vlib work
vlog -work work clk_div.vo
vlog -work work Waveform.vwf.vt
vsim -novopt -c -t 1ps -L cycloneiv_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.clk_div_vlg_vec_tst -voptargs="+acc"
vcd file -direction clk_div.msim.vcd
vcd add -internal clk_div_vlg_vec_tst/*
vcd add -internal clk_div_vlg_vec_tst/i1/*
run -all
quit -f
