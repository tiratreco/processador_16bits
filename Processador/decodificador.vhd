library ieee;
use ieee.std_logic_1164.all;

entity decodificador is
port(
cod	: in std_logic_vector (3 downto 0);
decod	: out std_logic_vector (15 downto 0));
end decodificador;

architecture comportamento of decodificador is
begin

process (cod)
begin
if (cod="0000") then
	decod  <= "0000000000000001";
elsif (cod="0001") then
	decod  <= "0000000000000010";
elsif (cod="0010") then
	decod  <= "0000000000000100";
elsif (cod="0011") then
	decod  <= "0000000000001000";
elsif (cod="0100") then
	decod  <= "0000000000010000";
elsif (cod="0101") then
	decod  <= "0000000000100000";
elsif (cod="0110") then
	decod  <= "0000000001000000";
elsif (cod="0111") then
	decod  <= "0000000010000000";
elsif (cod="1000") then
	decod  <= "0000000100000000";
elsif (cod="1001") then
	decod  <= "0000001000000000";
elsif (cod="1010") then
	decod  <= "0000010000000000";
elsif (cod="1011") then
	decod  <= "0000100000000000";
elsif (cod="1100") then
	decod  <= "0001000000000000";
elsif (cod="1101") then
	decod  <= "0010000000000000";
elsif (cod="1110") then
	decod  <= "0100000000000000";
elsif (cod="1111") then
	decod  <= "1000000000000000";
end if;
end process;
end architecture;

