file delete -force -- work

set DEPTH ..
set SRC ${DEPTH}/src
set TB ${DEPTH}/tb/

vlog -sv ${SRC}/add/adder.sv

# compile dut wrapper
vlog -sv ${SRC}/dut_if.sv
vlog -sv ${SRC}/dut.sv

# compile TB
vlog -sv +incdir+${TB}/common +incdir+${TB}/add ${TB}/my_pkg.sv
vlog -sv ${TB}/top.sv

vsim +UVM_TESTNAME=my_test -GDATA_WIDTH_I=32 -GDATA_WIDTH_O=32 top
run -all