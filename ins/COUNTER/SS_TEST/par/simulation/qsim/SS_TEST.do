onerror {exit -code 1}
vlib work
vlog -work work SS_TEST.vo
vlog -work work Waveform2.vwf.vt
vsim -novopt -c -t 1ps -L cycloneiv_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.SS_TEST_vlg_vec_tst -voptargs="+acc"
vcd file -direction SS_TEST.msim.vcd
vcd add -internal SS_TEST_vlg_vec_tst/*
vcd add -internal SS_TEST_vlg_vec_tst/i1/*
run -all
quit -f
