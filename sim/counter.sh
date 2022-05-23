ghdl -a ../src/counter.vhd ../src/tb_counter.vhd
ghdl -s ../src/counter.vhd ../src/tb_counter.vhd
ghdl -e tb_counter
ghdl -r tb_counter --vcd=tb_counter.vcd --stop-time=5000ns
gtkwave tb_counter.vcd
