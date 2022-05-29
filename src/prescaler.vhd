library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity prescaler is
    port(
        output : out std_logic;
        div : in std_logic_vector(15 downto 0);
        ena : in std_logic;
        rst : in std_logic;
        clk : in std_logic);
end entity prescaler;

architecture rtl of prescaler is

    signal counter : std_logic_vector(15 downto 0);
    signal aux     : std_logic;

begin

    syncronic : process(clk) is
    begin
        if rising_edge(clk) then
            if rst = '1' then
                counter <= (others => '0');
                aux <= '0';
            elsif ena = '1' then
                if counter = div then
                    counter <= (others => '0');
                    aux <= not aux;
                else
                    counter <= std_logic_vector(unsigned(counter) + 1);
                end if;
            end if;
        end if;
    end process syncronic;

    output <= aux;

end architecture rtl;
