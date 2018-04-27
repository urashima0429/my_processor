transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vlog -vlog01compat -work work +incdir+. {processor_p3_7_1200mv_100c_slow.vo}

vlog -vlog01compat -work work +incdir+/export/home/016/a0169654/SIMPLE/processor_p3/simulation/modelsim {/export/home/016/a0169654/SIMPLE/processor_p3/simulation/modelsim/processor_p3_test1.vt}

vsim -t 1ps +transport_int_delays +transport_path_delays -L altera_ver -L cycloneive_ver -L gate_work -L work -voptargs="+acc"  teat1

add wave *
view structure
view signals
run -all
