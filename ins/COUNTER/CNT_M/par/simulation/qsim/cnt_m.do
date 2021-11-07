onerror {exit -code 1}
vlib work
vlog -work work cnt_m.vo
vlog -work work Waveform.vwf.vt
vsim -novopt -c -t 1ps -L cycloneive_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.cnt_m_vlg_vec_tst -voptargs="+acc"
vcd file -direction cnt_m.msim.vcd
vcd add -internal cnt_m_vlg_vec_tst/*
vcd add -internal cnt_m_vlg_vec_tst/i1/*
run -all
quit -f
