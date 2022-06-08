library ieee;
use ieee.std_logic_1164.all;

entity encoder is
    port(
        count : out std_logic_vector(31 downto 0);
        lim_a  : in std_logic_vector(31 downto 0);
        lim_b : in std_logic_vector(31 downto 0);
        speed : in std_logic_vector(31 downto 0);
        mode  : in std_logic;
        ena   : in std_logic;
        rst   : in std_logic;
        clk   : in std_logic);
end entity encoder;

architecture hierarchical of encoder is

    signal wire_output : std_logic_vector(31 downto 0);
    signal wire_prescaler_counter : std_logic;
    signal wire_director_selector : std_logic;
    signal wire_selector_counter : std_logic;

begin

    count <= wire_output;

    prescaler01 : entity work.prescaler(rtl)
    port map(
        output => wire_prescaler_counter,
        div    => speed,
        ena    => ena,
        rst    => rst,
        clk    => clk);

    director01 : entity work.director(rtl)
    port map(
        dir   => wire_director_selector,
        count => wire_output,
        lim_a => lim_a,
        lim_b => lim_b,
        ena   => ena,
        rst   => rst,
        clk   => clk);

    selector01 : entity work.selector(rtl)
    port map(
        output => wire_selector_counter,
        mode   => mode,
        ext    => wire_director_selector,
        ena    => ena,
        rst    => rst,
        clk    => clk);

    counter01 : entity work.counter(rtl)
    port map(
        count  => wire_output,
        rst => rst,
        ena => wire_prescaler_counter,
        dir => wire_selector_counter,
        clk => clk);

end architecture hierarchical;
        
