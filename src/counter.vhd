library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter is
    port(
        count : out std_logic_vector(31 downto 0);
        rst : in std_logic;
        ena : in std_logic;
        dir : in std_logic;
        clk : in std_logic);
end entity counter;

architecture rtl of counter is

    type state_t is (countup, countdown);
    signal state : state_t;

    signal aux_count :std_logic_vector(31 downto 0);

begin

    state_machine : process(clk) is
    begin
        if rising_edge(clk) then
            if rst = '1' then 
                aux_count <= (others => '0');
                state <= countup;
            elsif ena = '1' then
                if dir = '0' then
                    state <= countdown;
                else
                    state <= countup;
                end if;

                case state is

                    when countup =>
                        if(aux_count = x"0000464f") then
                            aux_count <= (others => '0');
                        else
                            aux_count <= std_logic_vector(unsigned(aux_count) + 1);
                        end if;

                    when countdown =>
                        if(aux_count = x"00000000") then
                            aux_count <= x"0000464f";
                        else
                            aux_count <= std_logic_vector(unsigned(aux_count) - 1);
                        end if;

                end case;
            end if;
        end if;
    end process state_machine;

    count <= aux_count;

end architecture rtl;
