ghdl -a ../src/selector.vhd ../src/tb_selector.vhd
ghdl -s ../src/selector.vhd ../src/tb_selector.vhd
ghdl -e tb_selector
ghdl -r tb_selector --vcd=tb_selector.vcd --stop-time=5000ns
gtkwave tb_selector.vcd &
