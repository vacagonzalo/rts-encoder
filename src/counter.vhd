library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter is
    port(
        count : out std_logic_vector(15 downto 0);
        rst : in std_logic;
        ena : in std_logic;
        dir : in std_logic;
        clk : in std_logic);
end entity counter;

architecture rtl of counter is

    signal aux_count :std_logic_vector(15 downto 0);

begin
    process(clk) is
    begin
        if (rst = '1') then aux_count <=  (others => '0');
        elsif (ena = '1') then
            if rising_edge(clk) then
                if (dir = '1') then -- count up
                    if(aux_count = x"464f") then
                        aux_count <= (others => '0');
                    else
                        aux_count <= std_logic_vector(unsigned(aux_count) + 1);
                    end if;
                else -- count down
                    if(aux_count = x"0000") then
                        aux_count <= x"464f";
                    else
                        aux_count <= std_logic_vector(unsigned(aux_count) - 1);
                    end if;
                end if;
            end if;
        end if;
    end process;
    count <= aux_count;
end architecture ;

