library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_counter is
end entity tb_counter;

architecture sim of tb_counter is
    -- outputs
    signal count : std_logic_vector(31 downto 0);

    -- inputs
    signal rst : std_logic := '1';
    signal ena : std_logic := '0';
    signal dir : std_logic := '0';
    signal clk : std_logic := '0';
begin
    dut : entity work.counter(rtl)
    port map(
        count  => count,
        rst => rst,
        ena => ena,
        dir => dir,
        clk => clk);

    clk <= not clk after 10 ns;
    rst <= '0' after 30 ns;
    ena <= '1' after 70 ns;
    dir <= '1' after 500 ns;

end architecture sim;
