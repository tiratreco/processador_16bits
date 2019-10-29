library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity contador is
port (
	CLK     : in std_logic;
	iniciar : in std_logic;
	fim   	: out std_logic);
end contador;

architecture comportamento of contador is
signal contador : std_logic_vector (3 downto 0);
begin
process (CLK)
begin
if(iniciar = '1') then
	contador <= "0000";
end if;
if(rising_edge(CLK)) then
	contador <= contador + '1';
	fim <= '0';
end if;
if (contador = "0100") then
	fim <= '1';
	contador <= "0000";
end if;
end process;
end architecture;