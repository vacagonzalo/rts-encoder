library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_director is
end entity tb_director;

architecture sim of tb_director is
    -- outputs
    signal dir : std_logic;

    -- inputs
    signal count : std_logic_vector(15 downto 0) := x"0000";
    signal left  : std_logic_vector(15 downto 0) := x"4640";
    signal right : std_logic_vector(15 downto 0) := x"000F";
    signal ena   : std_logic := '1';
    signal rst   : std_logic := '1';
    signal clk   : std_logic := '0';

begin
    dut : entity work.director(rtl)
    port map(
        dir   => dir,
        count => count,
        left  => left,
        right => right,
        ena => ena,
        rst   => rst,
        clk   => clk);

    clk <= not clk after 10 ns;
    rst <= '0' after 30 ns;
    count <= x"4640" after 50 ns; 
end architecture sim;
