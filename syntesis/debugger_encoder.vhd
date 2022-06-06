library ieee;
use ieee.std_logic_1164.all;

entity debugger_encoder is
    port(
        clk : in std_logic
    );
end entity debugger_encoder;

architecture debugger of debugger_encoder is

component encoder
    port(
        count : out std_logic_vector(15 downto 0);
        left  : in std_logic_vector(15 downto 0);
        right : in std_logic_vector(15 downto 0);
        speed : in std_logic_vector(15 downto 0);
        mode  : in std_logic;
        ena   : in std_logic;
        rst   : in std_logic;
        clk   : in std_logic
    );
end component;

COMPONENT vio_0
  PORT (
    clk : IN STD_LOGIC;
    probe_in0 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    probe_out0 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    probe_out1 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    probe_out2 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    probe_out3 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    probe_out4 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    probe_out5 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
  );
END COMPONENT;
  
  signal wire_count : std_logic_vector(15 downto 0);
  signal wire_left  : std_logic_vector(15 downto 0);
  signal wire_right : std_logic_vector(15 downto 0);
  signal wire_speed : std_logic_vector(15 downto 0);
  
  signal wire_mode : std_logic_vector(0 downto 0);
  signal wire_ena  : std_logic_vector(0 downto 0);
  signal wire_rst  : std_logic_vector(0 downto 0);
  
  
begin

    probe : vio_0
    port map(
        clk => clk,
        probe_in0 => wire_count,
        probe_out0 => wire_left,
        probe_out1 => wire_right,
        probe_out2 => wire_speed,
        probe_out3 => wire_mode,
        probe_out4 => wire_ena,
        probe_out5 => wire_rst
    );
    
    dut : encoder
    port map(
        count => wire_count,
        left  => wire_left,
        right => wire_right,
        speed => wire_speed,
        mode  => wire_mode(0),
        ena   => wire_ena(0),
        rst   => wire_rst(0),
        clk   => clk
    );

end architecture debugger;
