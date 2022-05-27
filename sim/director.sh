ghdl -a ../src/director.vhd ../src/tb_director.vhd
ghdl -s ../src/director.vhd ../src/tb_director.vhd
ghdl -e tb_director
ghdl -r tb_director --vcd=tb_director.vcd --stop-time=5000ns
gtkwave tb_director.vcd &
