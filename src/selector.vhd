library ieee;
use ieee.std_logic_1164.all;

entity selector is
    port(
        output : out std_logic;
        mode   : in std_logic;
        ext    : in std_logic;
        ena    : in std_logic;
        rst    : in std_logic;
        clk    : in std_logic);
end entity selector;

architecture rtl of selector is

begin

    syncronic : process(clk) is
    begin
        if rising_edge(clk) then
            if rst = '1' then
                output <= '1';
            elsif ena = '1' then
                if mode = '0' then
                    output <= '1';
                else
                    output <= ext;
                end if;
            end if;
        end if;
    end process syncronic;

end architecture rtl;
