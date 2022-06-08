library ieee;
use ieee.std_logic_1164.all;

entity tb_prescaler is
end entity tb_prescaler;

architecture sim of tb_prescaler is
    -- outputs
    signal output : std_logic;

    -- inputs
    signal div : std_logic_vector(31 downto 0) := x"00010000";
    signal ena : std_logic := '0';
    signal rst : std_logic := '1';
    signal clk : std_logic := '0';

begin
    dut : entity work.prescaler(rtl)
    port map(
        output => output,
        div    => div,
        ena    => ena,
        rst    => rst,
        clk    => clk);

    clk <= not clk after 10 ns;
    rst <= '0' after 30 ns;
    ena <= '1' after 60 ns;

end architecture sim;
