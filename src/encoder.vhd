library ieee;
use ieee.std_logic_1164.all;

entity encoder is
    port(
        count : out std_logic_vector(15 downto 0);
        left  : in std_logic_vector(15 downto 0);
        right : in std_logic_vector(15 downto 0);
        speed : in std_logic_vector(15 downto 0);
        mode  : in std_logic;
        ena   : in std_logic;
        rst   : in std_logic;
        clk   : in std_logic);
end entity encoder;

architecture hierarchical of encoder is

    signal wire_count : std_logic_vector(15 downto 0);
    signal wire_ena : std_logic;
    signal wire_ext : std_logic;
    signal wire_dir : std_logic;

begin

    count <= wire_count;

    prescaler01 : entity work.prescaler(rtl)
    port map(
        output => wire_ena,
        div    => speed,
        ena    => ena,
        rst    => rst,
        clk    => clk);

    director01 : entity work.director(rtl)
    port map(
        dir   => wire_ext,
        count => wire_count,
        left  => left,
        right => right,
        ena   => ena,
        rst   => rst,
        clk   => clk);

    selector01 : entity work.selector(rtl)
    port map(
        output => wire_dir,
        mode   => mode,
        ext    => wire_ext,
        ena    => ena,
        rst    => rst,
        clk    => clk);

    counter01 : entity work.counter(rtl)
    port map(
        count  => wire_count,
        rst => rst,
        ena => wire_ena,
        dir => wire_dir,
        clk => clk);

end architecture hierarchical;
        
