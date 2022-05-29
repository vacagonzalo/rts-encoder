library ieee;
use ieee.std_logic_1164.all;

entity tb_selector is
end entity tb_selector;

architecture sim of tb_selector is

    -- outputs
    signal output : std_logic;

    -- inputs
    signal mode : std_logic := '0';
    signal ext  : std_logic := '0';
    signal ena  : std_logic := '0';
    signal rst  : std_logic := '1';
    signal clk  : std_logic := '0';

begin

    dut : entity work.selector(rtl)
    port map(
        output => output,
        mode   => mode,
        ext    => ext,
        ena    => ena,
        rst    => rst,
        clk    => clk);

    clk  <= not clk after 10 ns;
    rst  <= '0' after 30 ns;
    ena  <= '1' after 50 ns;
    mode <= '1' after 100 ns;
    ext  <= '1' after 150 ns;

end architecture sim;
