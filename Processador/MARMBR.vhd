library ieee;
use ieee.std_logic_1164.all;

entity MARMBR is
port(
CLK	  : in std_logic;
B 	  : in std_logic_vector (11 downto 0);
MAR	  : in std_logic;
saidaMAR  : out std_logic_vector (11 downto 0);
C	  : in std_logic_vector (15 downto 0);
MBR	  : in std_logic;
memo	  : in std_logic_vector (15 downto 0);
rd	  : in std_logic;
memoOut	  : out std_logic_vector (15 downto 0);
toMux	  : out std_logic_vector (15 downto 0));
end entity;

architecture comportamento of MARMBR is 
signal  regMBR : std_logic_vector (15 downto 0);
signal  regMAR : std_logic_vector (11 downto 0);
begin
process (CLK)
begin
if (MAR='1' AND rising_edge(CLK)) then  
	regMAR <= B;
end if;
if (MBR='1' AND rising_edge(CLK) AND rd='0') then
	regMBR <= C;
end if;
if (rd='1' AND rising_edge(CLK) AND MBR='0') then
	regMBR <= memo;
end if;
end process;

toMux <= regMBR;
saidaMAR <= regMAR;
memoOut <=regMBR;

end architecture;