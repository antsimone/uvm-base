# Generated by vmake version 10.7c

# Define path to each library
LIB_MTIUVM = /software/mentor/questa10.7c/questasim/linux_x86_64/../uvm-1.1d
LIB_SV_STD = /software/mentor/questa10.7c/questasim/linux_x86_64/../sv_std
LIB_WORK = work

# Define path to each design unit
MTIUVM__uvm_pkg = $(LIB_MTIUVM)/_lib.qdb
SV_STD__std = $(LIB_SV_STD)/_lib.qdb
WORK__top = $(LIB_WORK)/_lib.qdb
WORK__my_pkg = $(LIB_WORK)/_lib.qdb
WORK__dut_if = $(LIB_WORK)/_lib.qdb
WORK__dut = $(LIB_WORK)/_lib.qdb
WORK__adder = $(LIB_WORK)/_lib.qdb
VCOM = vcom
VLOG = vlog
VOPT = vopt
SCCOM = sccom

whole_library : $(LIB_WORK)/_lib.qdb

$(LIB_WORK)/_lib.qdb : ../src/add/adder.sv \
		$(SV_STD__std) ../src/dut.sv \
		$(SV_STD__std) ../src/dut_if.sv \
		$(SV_STD__std) ../tb/my_pkg.sv ../tb//add/my_packet_i.svh \
		 ../tb//common/my_sequence.svh ../tb//common/my_sequencer.svh \
		 ../tb//common/my_driver.svh ../tb//common/my_monitor.svh \
		 ../tb//common/my_agent.svh ../tb//common/my_packet_o.svh \
		 ../tb//common/my_driver_o.svh ../tb//common/my_monitor_o.svh \
		 ../tb//common/my_agent_o.svh ../tb//add/my_predictor.svh \
		 ../tb//common/my_comparator.svh ../tb//common/my_scoreboard.svh \
		 ../tb//common/my_env.svh ../tb//common/my_test.svh \
		$(SV_STD__std) \
		$(MTIUVM__uvm_pkg) ../tb/top.sv \
		$(SV_STD__std) \
		$(MTIUVM__uvm_pkg) \
		$(WORK__my_pkg)
	$(VLOG) -sv ../src/add/adder.sv
	$(VLOG) -sv ../src/dut.sv
	$(VLOG) -sv ../src/dut_if.sv
	$(VLOG) -sv +incdir+../tb//common +incdir+../tb//add \
		 ../tb/my_pkg.sv
	$(VLOG) -sv ../tb/top.sv
