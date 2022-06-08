library ieee;
use ieee.std_logic_1164.all;

entity tb_encoder is
end entity tb_encoder;

architecture sim of tb_encoder is

       signal count : std_logic_vector(31 downto 0);
       signal lim_a : std_logic_vector(31 downto 0) := x"00000000";
       signal lim_b : std_logic_vector(31 downto 0) := x"0000000F";
       signal speed : std_logic_vector(31 downto 0) := x"0000F000";
       signal mode  : std_logic := '0';
       signal ena   : std_logic := '0';
       signal rst   : std_logic := '1';
       signal clk   : std_logic := '0';

begin
    dut : entity work.encoder(hierarchical)
    port map(
        count => count,
        lim_a => lim_a,
        lim_b => lim_b,
        speed => speed,
        mode  => mode,
        ena   => ena,
        rst   => rst,
        clk   => clk);

    clk <= not clk after 10 ns;
    rst <= '0' after 40 ns;
    ena <= '1' after 100 ns;
end architecture sim;
