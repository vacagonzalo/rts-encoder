ghdl -a ../src/prescaler.vhd ../src/tb_prescaler.vhd
ghdl -s ../src/prescaler.vhd ../src/tb_prescaler.vhd
ghdl -e tb_prescaler
ghdl -r tb_prescaler --vcd=tb_prescaler.vcd --stop-time=5000ns
gtkwave tb_prescaler.vcd &
