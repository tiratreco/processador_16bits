library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity memoria is
port(
CLK 	 : in std_logic;
start	 : in std_logic;
endereco : in std_logic_vector(11 downto 0);
wr		 : in std_logic;
rd	 	 : in std_logic;
saida	 : out std_logic_vector (15 downto 0);
entrada  : in std_logic_vector (15 downto 0));
end memoria;

architecture comportamento of memoria is
signal ender : integer range 0 to 9;
type memoriaa is array (integer range 0 to 9) of std_logic_vector(15 downto 0);
signal memo : memoriaa;

begin
	process (CLK)
	begin
	if(start = '1') then
		--PROGRAMA
		memo(0) <= "0000000000000111";--LODD(7)
		memo(1) <= "0010000000001000";--ADDD(8)
		memo(2) <= "0011000000000110";--SUBD(6)
		memo(3) <= "0001000000001001";--STOD(9)

		--DADOS
		memo(6) <= "0000010010001001";--(1161)
		memo(7) <= "0000100011110111";--(2295)
		memo(8) <= "0111000101001010";--(29002)
	end if;
	if(endereco = "000000000000")then
		ender <= 0;
	end if;
	if(endereco = "000000000001")then
		ender <= 1;
	end if;
	if(endereco = "000000000010")then
		ender <= 2;
	end if;
	if(endereco = "000000000011")then
		ender <= 3;
	end if;
	if(endereco = "000000000100")then
		ender <= 4;
	end if;
	if(endereco = "000000000101")then
		ender <= 5;
	end if;
	if(endereco = "000000000110")then
		ender <= 6;
	end if;
	if(endereco = "000000000111")then
		ender <= 7;
	end if;
	if(endereco = "000000001000")then
		ender <= 8;
	end if;
	if(endereco = "000000001001")then
		ender <= 9;
	end if;
	if(wr = '1')then
		memo(ender) <= entrada;
	end if;
	saida <= memo(ender);
	end process;
end architecture;
