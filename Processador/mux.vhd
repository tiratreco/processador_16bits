library ieee;
use ieee.std_logic_1164.all;

entity mux is
port(
A	: in std_logic_vector (15 downto 0);
MBR	: in std_logic_vector (15 downto 0);
s	: in std_logic;
CLK	: in std_logic;
C	: out std_logic_vector (15 downto 0));
end mux;

architecture comportamento of mux is
begin
process (s, CLK)
begin
if (S='0') then
	C <= A;
else
	C <= MBR;
end if;
end process;
end architecture;
