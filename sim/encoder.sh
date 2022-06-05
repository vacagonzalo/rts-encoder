ghdl -a ../src/counter.vhd ../src/director.vhd ../src/prescaler.vhd ../src/selector.vhd ../src/encoder.vhd ../src/tb_encoder.vhd
ghdl -s ../src/encoder.vhd ../src/tb_encoder.vhd
ghdl -e tb_encoder
ghdl -r tb_encoder --vcd=tb_encoder.vcd --stop-time=60000000ns
gtkwave tb_encoder.vcd &
