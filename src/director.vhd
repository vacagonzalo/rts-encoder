library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity director is
    port(
        dir   : out std_logic;
        count : in std_logic_vector(15 downto 0);
        left  : in std_logic_vector(15 downto 0);
        right : in std_logic_vector(15 downto 0);
        rst   : in std_logic;
        clk   : in std_logic);
end entity director;

architecture rtl of director is

    type state_t is (clockwise, counterclockwise);
    signal state : state_t;

begin

    state_machine : process(clk) is
    begin
        if rising_edge(clk) then
            if rst = '1' then
                state <= counterclockwise;
                dir <= '0';
            else
                case state is

                    when counterclockwise =>
                        dir <= '0';
                        if count = left then
                            state <= clockwise;
                            dir <= '1';
                        end if;

                    when clockwise =>
                        dir <= '1';
                        if count = right then
                            state <= counterclockwise;
                            dir <= '0';
                        end if;

                    end case;
            end if;
        end if;

    end process state_machine;

end architecture rtl;
