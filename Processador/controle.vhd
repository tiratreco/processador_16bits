library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity controle is
port (
	CLK   : in std_logic;
	start : in std_logic;
	AMUX  : out std_logic;
	OPULA : out std_logic_vector(1 downto 0);
	SH    : out std_logic_vector(1 downto 0);
	MBR   : out std_logic;
	MAR   : out std_logic;
	RD    : out std_logic;
	enc   : out std_logic;
	barC  : out std_logic_vector(3 downto 0);
	barA  : out std_logic_vector(3 downto 0);
	barB  : out std_logic_vector(3 downto 0);
	wr    : out std_logic;
	z     : in std_logic;
	n     : in std_logic);
end controle;

architecture comportamento of controle is

signal contador : std_logic_vector (6 downto 0);
signal ciclo	: std_logic_vector (2 downto 0);
begin
process (CLK)
begin
if (start = '1') then
	contador <= "0000000";
	ciclo <= "000";
	--pc := "0000000000000000":
	AMUX <= '0'; OPULA <= "10"; SH <= "00"; MBR <= '0'; MAR <= '0'; RD <= '0'; ENC <= '1'; barC <= "0000"; barA <= "0101"; barB <= "0000"; wr <= '0';
else
if (contador = "0000000") then--0
	AMUX <= '0'; OPULA <= "00"; SH <= "00"; MBR <= '0'; MAR <= '1'; RD <= '1'; ENC <= '0'; barC <= "0000"; barA <= "0101"; barB <= "0000"; wr <= '0';
end if;
if (contador = "0000001") then--1
	AMUX <= '0'; OPULA <= "00"; SH <= "00"; MBR <= '0'; MAR <= '0'; RD <= '1'; ENC <= '1'; barC <= "0000"; barA <= "0000"; barB <= "0110"; wr <= '0';
end if;
if (contador = "0000010") then--2
	AMUX <= '1'; OPULA <= "10"; SH <= "00"; MBR <= '0'; MAR <= '0'; RD <= '0'; ENC <= '1'; barC <= "0011"; barA <= "0000"; barB <= "0000"; wr <= '0';
end if;
if (contador = "0000011") then--3
	AMUX <= '0'; OPULA <= "00"; SH <= "10"; MBR <= '0'; MAR <= '0'; RD <= '0'; ENC <= '1'; barC <= "0100"; barA <= "0011"; barB <= "0011"; wr <= '0';
end if;
if (contador = "0000100") then--4
	AMUX <= '0'; OPULA <= "10"; SH <= "10"; MBR <= '0'; MAR <= '0'; RD <= '0'; ENC <= '1'; barC <= "0100"; barA <= "0100"; barB <= "0101"; wr <= '0';
end if;
if (contador = "0000101") then--5
	AMUX <= '0'; OPULA <= "10"; SH <= "00"; MBR <= '0'; MAR <= '0'; RD <= '0'; ENC <= '0'; barC <= "0101"; barA <= "0100"; barB <= "0101"; wr <= '0';
end if;
if (contador = "0000110") then--6
	AMUX <= '0'; OPULA <= "00"; SH <= "00"; MBR <= '0'; MAR <= '1'; RD <= '1'; ENC <= '0'; barC <= "0000"; barA <= "0000"; barB <= "0011"; wr <= '0';
end if;	
if (contador = "0000111") then--7
	AMUX <= '0'; OPULA <= "00"; SH <= "00"; MBR <= '0'; MAR <= '0'; RD <= '1'; ENC <= '0'; barC <= "0000"; barA <= "0000"; barB <= "0000"; wr <= '0';
end if;
if (contador = "0001000") then--8
	AMUX <= '1'; OPULA <= "10"; SH <= "00"; MBR <= '0'; MAR <= '0'; RD <= '0'; ENC <= '1'; barC <= "0001"; barA <= "0000"; barB <= "0000"; wr <= '0';
end if;
if (contador = "0001001") then--9
	AMUX <= '0'; OPULA <= "10"; SH <= "00"; MBR <= '1'; MAR <= '1'; RD <= '0'; ENC <= '0'; barC <= "0000"; barA <= "0001"; barB <= "0011"; wr <= '1';
end if;
if (contador = "0001010") then--10
	AMUX <= '0'; OPULA <= "00"; SH <= "00"; MBR <= '0'; MAR <= '0'; RD <= '0'; ENC <= '0'; barC <= "0000"; barA <= "0000"; barB <= "0000"; wr <= '1';
end if;
if (contador = "0001011") then--11
	AMUX <= '0'; OPULA <= "10"; SH <= "00"; MBR <= '0'; MAR <= '0'; RD <= '0'; ENC <= '0'; barC <= "0000"; barA <= "0100"; barB <= "0000"; wr <= '0';
end if;
if (contador = "0001100") then--12
	AMUX <= '0'; OPULA <= "10"; SH <= "00"; MBR <= '0'; MAR <= '1'; RD <= '1'; ENC <= '0'; barC <= "0000"; barA <= "0000"; barB <= "0011"; wr <= '0';
end if;
if (contador = "0001101") then--13
	AMUX <= '0'; OPULA <= "00"; SH <= "00"; MBR <= '0'; MAR <= '0'; RD <= '1'; ENC <= '0'; barC <= "0000"; barA <= "0101"; barB <= "0101"; wr <= '0';
end if;
if (contador = "0001110") then--14
	AMUX <= '1'; OPULA <= "00"; SH <= "00"; MBR <= '0'; MAR <= '0'; RD <= '0'; ENC <= '1'; barC <= "0001"; barA <= "0101"; barB <= "0001"; wr <= '0';
end if;
if (contador = "0001111") then--15
	AMUX <= '0'; OPULA <= "00"; SH <= "00"; MBR <= '0'; MAR <= '1'; RD <= '1'; ENC <= '0'; barC <= "0000"; barA <= "0101"; barB <= "0011"; wr <= '0';
end if;
if (contador = "0010000") then--16
	AMUX <= '0'; OPULA <= "00"; SH <= "00"; MBR <= '0'; MAR <= '0'; RD <= '1'; ENC <= '1'; barC <= "0001"; barA <= "0001"; barB <= "0110"; wr <= '0';
end if;
if (contador = "0010001") then--17
	AMUX <= '1'; OPULA <= "11"; SH <= "00"; MBR <= '0'; MAR <= '0'; RD <= '0'; ENC <= '1'; barC <= "1010"; barA <= "0000"; barB <= "0000"; wr <= '0';
end if;
if (contador = "0010010") then--18
	AMUX <= '0'; OPULA <= "00"; SH <= "00"; MBR <= '0'; MAR <= '0'; RD <= '0'; ENC <= '1'; barC <= "0001"; barA <= "0001"; barB <= "1010"; wr <= '0';
end if;
if (contador = "0010011") then--19
	AMUX <= '0'; OPULA <= "10"; SH <= "10"; MBR <= '0'; MAR <= '0'; RD <= '0'; ENC <= '1'; barC <= "0100"; barA <= "0100"; barB <= "0000"; wr <= '0';
end if;
if (contador = "0010100") then--20
	AMUX <= '0'; OPULA <= "10"; SH <= "00"; MBR <= '0'; MAR <= '0'; RD <= '0'; ENC <= '0'; barC <= "0000"; barA <= "0100"; barB <= "0000"; wr <= '0';
end if;
if (contador = "0010101") then--21
	AMUX <= '0'; OPULA <= "10"; SH <= "00"; MBR <= '0'; MAR <= '0'; RD <= '0'; ENC <= '0'; barC <= "0000"; barA <= "0001"; barB <= "0000"; wr <= '0';
end if;
if (contador = "0010110") then--22
	AMUX <= '0'; OPULA <= "01"; SH <= "00"; MBR <= '0'; MAR <= '0'; RD <= '0'; ENC <= '1'; barC <= "0000"; barA <= "0011"; barB <= "1000"; wr <= '0';
end if;
if (contador = "0010111") then--23
	AMUX <= '0'; OPULA <= "10"; SH <= "00"; MBR <= '0'; MAR <= '0'; RD <= '0'; ENC <= '0'; barC <= "0000"; barA <= "0001"; barB <= "0000"; wr <= '0';
end if;
if (contador = "0011000") then--24
	AMUX <= '0'; OPULA <= "00"; SH <= "00"; MBR <= '0'; MAR <= '0'; RD <= '0'; ENC <= '0'; barC <= "0000"; barA <= "0000"; barB <= "0000"; wr <= '0';
end if;
if (contador = "0011001") then--25
	AMUX <= '0'; OPULA <= "10"; SH <= "00"; MBR <= '0'; MAR <= '0'; RD <= '0'; ENC <= '0'; barC <= "0000"; barA <= "0100"; barB <= "0000"; wr <= '0';
end if;
if (contador = "0011010") then--26
	AMUX <= '0'; OPULA <= "01"; SH <= "00"; MBR <= '0'; MAR <= '0'; RD <= '0'; ENC <= '1'; barC <= "0000"; barA <= "0011"; barB <= "1000"; wr <= '0';
end if;
if (contador = "0011011") then--27
	AMUX <= '0'; OPULA <= "01"; SH <= "00"; MBR <= '0'; MAR <= '0'; RD <= '0'; ENC <= '1'; barC <= "0001"; barA <= "0011"; barB <= "1000"; wr <= '0';
end if;
if (contador = "0011100") then--28
	AMUX <= '0'; OPULA <= "00"; SH <= "10"; MBR <= '0'; MAR <= '0'; RD <= '0'; ENC <= '1'; barC <= "0100"; barA <= "0011"; barB <= "0011"; wr <= '0';
end if;
if (contador = "0011101") then--29
	AMUX <= '0'; OPULA <= "10"; SH <= "10"; MBR <= '0'; MAR <= '0'; RD <= '0'; ENC <= '1'; barC <= "0100"; barA <= "0100"; barB <= "0000"; wr <= '0';
end if;
if (contador = "0011110") then--30
	AMUX <= '0'; OPULA <= "10"; SH <= "00"; MBR <= '0'; MAR <= '0'; RD <= '0'; ENC <= '0'; barC <= "0000"; barA <= "0100"; barB <= "0000"; wr <= '0';
end if;
if (contador = "0011111") then--31
	AMUX <= '0'; OPULA <= "00"; SH <= "00"; MBR <= '0'; MAR <= '0'; RD <= '0'; ENC <= '1'; barC <= "1010"; barA <= "0011"; barB <= "0010"; wr <= '0';
end if;
if (contador = "0100000") then--32
	AMUX <= '0'; OPULA <= "10"; SH <= "00"; MBR <= '0'; MAR <= '1'; RD <= '1'; ENC <= '0'; barC <= "0000"; barA <= "0000"; barB <= "1010"; wr <= '0';
end if;
if (contador = "0100001") then--33
	AMUX <= '0'; OPULA <= "00"; SH <= "00"; MBR <= '0'; MAR <= '0'; RD <= '0'; ENC <= '1'; barC <= "1010"; barA <= "0011"; barB <= "0010"; wr <= '0';
end if;
if (contador = "0100010") then--34
	AMUX <= '0'; OPULA <= "10"; SH <= "00"; MBR <= '1'; MAR <= '1'; RD <= '0'; ENC <= '0'; barC <= "0000"; barA <= "0001"; barB <= "1010"; wr <= '1';
end if;
if (contador = "0100011") then--35
	AMUX <= '0'; OPULA <= "10"; SH <= "00"; MBR <= '0'; MAR <= '0'; RD <= '0'; ENC <= '0'; barC <= "0000"; barA <= "0100"; barB <= "0000"; wr <= '0';
end if;
if (contador = "0100100") then--36
	AMUX <= '0'; OPULA <= "00"; SH <= "00"; MBR <= '0'; MAR <= '0'; RD <= '0'; ENC <= '1'; barC <= "1010"; barA <= "0011"; barB <= "0010"; wr <= '0';
end if;
if (contador = "0100101") then--37
	AMUX <= '0'; OPULA <= "10"; SH <= "00"; MBR <= '0'; MAR <= '1'; RD <= '1'; ENC <= '0'; barC <= "0000"; barA <= "0000"; barB <= "1010"; wr <= '0';
end if;
if (contador = "0100110") then--38
	AMUX <= '0'; OPULA <= "00"; SH <= "00"; MBR <= '0'; MAR <= '0'; RD <= '0'; ENC <= '1'; barC <= "1010"; barA <= "0011"; barB <= "0010"; wr <= '0';
end if;
if (contador = "0100111") then--39
	AMUX <= '0'; OPULA <= "10"; SH <= "00"; MBR <= '0'; MAR <= '1'; RD <= '1'; ENC <= '0'; barC <= "0000"; barA <= "0000"; barB <= "1010"; wr <= '0';
end if;
if (contador = "0101000") then--40
	AMUX <= '0'; OPULA <= "10"; SH <= "10"; MBR <= '0'; MAR <= '0'; RD <= '0'; ENC <= '1'; barC <= "0100"; barA <= "0100"; barB <= "0000"; wr <= '0';
end if;
if (contador = "0101001") then--41
	AMUX <= '0'; OPULA <= "10"; SH <= "00"; MBR <= '0'; MAR <= '0'; RD <= '0'; ENC <= '0'; barC <= "0000"; barA <= "0100"; barB <= "0000"; wr <= '0';
end if;
if (contador = "0101010") then--42
	AMUX <= '0'; OPULA <= "10"; SH <= "00"; MBR <= '0'; MAR <= '0'; RD <= '0'; ENC <= '0'; barC <= "0000"; barA <= "0001"; barB <= "0000"; wr <= '0';
end if;
if (contador = "0101011") then--43
	AMUX <= '0'; OPULA <= "00"; SH <= "00"; MBR <= '0'; MAR <= '0'; RD <= '0'; ENC <= '0'; barC <= "0000"; barA <= "0000"; barB <= "0000"; wr <= '0';
end if;
if (contador = "0101100") then--44
	AMUX <= '0'; OPULA <= "10"; SH <= "00"; MBR <= '0'; MAR <= '0'; RD <= '0'; ENC <= '0'; barC <= "0000"; barA <= "0001"; barB <= "0000"; wr <= '0';
end if;
if (contador = "0101101") then--45
	AMUX <= '0'; OPULA <= "01"; SH <= "00"; MBR <= '0'; MAR <= '0'; RD <= '0'; ENC <= '1'; barC <= "0000"; barA <= "0011"; barB <= "1000"; wr <= '0';
end if;
if (contador = "0101110") then--46
	AMUX <= '0'; OPULA <= "10"; SH <= "10"; MBR <= '0'; MAR <= '0'; RD <= '0'; ENC <= '1'; barC <= "0100"; barA <= "0100"; barB <= "0000"; wr <= '0';
end if;
if (contador = "0101111") then--47
	AMUX <= '0'; OPULA <= "00"; SH <= "00"; MBR <= '0'; MAR <= '0'; RD <= '0'; ENC <= '1'; barC <= "0010"; barA <= "0111"; barB <= "0010"; wr <= '0';
end if;
if (contador = "0110000") then--48
	AMUX <= '0'; OPULA <= "10"; SH <= "00"; MBR <= '1'; MAR <= '1'; RD <= '0'; ENC <= '0'; barC <= "0000"; barA <= "0000"; barB <= "0010"; wr <= '1';
end if;
if (contador = "0110001") then--49
	AMUX <= '0'; OPULA <= "01"; SH <= "00"; MBR <= '0'; MAR <= '0'; RD <= '0'; ENC <= '1'; barC <= "0000"; barA <= "0011"; barB <= "1000"; wr <= '1';
end if;
if (contador = "0110010") then--50
	AMUX <= '0'; OPULA <= "10"; SH <= "10"; MBR <= '0'; MAR <= '0'; RD <= '0'; ENC <= '1'; barC <= "0100"; barA <= "0100"; barB <= "0000"; wr <= '0';
end if;
if (contador = "0110011") then--51
	AMUX <= '0'; OPULA <= "10"; SH <= "10"; MBR <= '0'; MAR <= '0'; RD <= '0'; ENC <= '1'; barC <= "0100"; barA <= "0100"; barB <= "0000"; wr <= '0';
end if;
if (contador = "0110100") then--52
	AMUX <= '0'; OPULA <= "10"; SH <= "00"; MBR <= '0'; MAR <= '0'; RD <= '0'; ENC <= '0'; barC <= "0000"; barA <= "0100"; barB <= "0000"; wr <= '0';
end if;
if (contador = "0110101") then--53
	AMUX <= '0'; OPULA <= "10"; SH <= "00"; MBR <= '0'; MAR <= '1'; RD <= '1'; ENC <= '0'; barC <= "0000"; barA <= "0000"; barB <= "0001"; wr <= '0';
end if;
if (contador = "0110110") then--54
	AMUX <= '0'; OPULA <= "00"; SH <= "00"; MBR <= '0'; MAR <= '0'; RD <= '1'; ENC <= '1'; barC <= "0010"; barA <= "0111"; barB <= "0010"; wr <= '0';
end if;
if (contador = "0110111") then--55
	AMUX <= '0'; OPULA <= "10"; SH <= "00"; MBR <= '0'; MAR <= '1'; RD <= '0'; ENC <= '0'; barC <= "0000"; barA <= "0000"; barB <= "0010"; wr <= '1';
end if;
if (contador = "0111000") then--56
	AMUX <= '0'; OPULA <= "00"; SH <= "00"; MBR <= '0'; MAR <= '1'; RD <= '1'; ENC <= '1'; barC <= "0010"; barA <= "0110"; barB <= "0010"; wr <= '0';
end if;
if (contador = "0111001") then--57
	AMUX <= '0'; OPULA <= "10"; SH <= "00"; MBR <= '0'; MAR <= '0'; RD <= '1'; ENC <= '0'; barC <= "0000"; barA <= "0000"; barB <= "0000"; wr <= '0';
end if;
if (contador = "0111010") then--58
	AMUX <= '0'; OPULA <= "10"; SH <= "00"; MBR <= '0'; MAR <= '1'; RD <= '0'; ENC <= '0'; barC <= "0000"; barA <= "0000"; barB <= "0001"; wr <= '1';
end if;
if (contador = "0111011") then--59
	AMUX <= '0'; OPULA <= "10"; SH <= "00"; MBR <= '0'; MAR <= '0'; RD <= '0'; ENC <= '0'; barC <= "0000"; barA <= "0100"; barB <= "0000"; wr <= '0';
end if;
if (contador = "0111100") then--60
	AMUX <= '0'; OPULA <= "00"; SH <= "00"; MBR <= '0'; MAR <= '0'; RD <= '0'; ENC <= '1'; barC <= "0010"; barA <= "0111"; barB <= "0010"; wr <= '0';
end if;
if (contador = "0111101") then--61
	AMUX <= '0'; OPULA <= "10"; SH <= "00"; MBR <= '1'; MAR <= '1'; RD <= '0'; ENC <= '0'; barC <= "0000"; barA <= "0001"; barB <= "0010"; wr <= '1';
end if;
if (contador = "0111110") then--62
	AMUX <= '0'; OPULA <= "00"; SH <= "00"; MBR <= '0'; MAR <= '1'; RD <= '1'; ENC <= '1'; barC <= "0010"; barA <= "0110"; barB <= "0010"; wr <= '0';
end if;
if (contador = "0111111") then--63
	AMUX <= '0'; OPULA <= "10"; SH <= "00"; MBR <= '0'; MAR <= '0'; RD <= '1'; ENC <= '0'; barC <= "0000"; barA <= "0000"; barB <= "0000"; wr <= '0';
end if;
if (contador = "1000000") then--64
	AMUX <= '1'; OPULA <= "10"; SH <= "00"; MBR <= '0'; MAR <= '0'; RD <= '0'; ENC <= '1'; barC <= "0001"; barA <= "0000"; barB <= "0000"; wr <= '0';
end if;
if (contador = "1000001") then--65
	AMUX <= '0'; OPULA <= "10"; SH <= "10"; MBR <= '0'; MAR <= '0'; RD <= '0'; ENC <= '1'; barC <= "0100"; barA <= "0100"; barB <= "0000"; wr <= '0';
end if;
if (contador = "1000010") then--66
	AMUX <= '0'; OPULA <= "10"; SH <= "00"; MBR <= '0'; MAR <= '0'; RD <= '0'; ENC <= '0'; barC <= "0000"; barA <= "0100"; barB <= "0000"; wr <= '0';
end if;
if (contador = "1000011") then--67
	AMUX <= '0'; OPULA <= "00"; SH <= "00"; MBR <= '0'; MAR <= '1'; RD <= '1'; ENC <= '1'; barC <= "0010"; barA <= "0110"; barB <= "0010"; wr <= '0';
end if;
if (contador = "1000100") then--68
	AMUX <= '0'; OPULA <= "10"; SH <= "00"; MBR <= '0'; MAR <= '0'; RD <= '1'; ENC <= '0'; barC <= "0000"; barA <= "0000"; barB <= "0000"; wr <= '0';
end if;
if (contador = "1000101") then--69
	AMUX <= '1'; OPULA <= "10"; SH <= "00"; MBR <= '0'; MAR <= '0'; RD <= '0'; ENC <= '1'; barC <= "0000"; barA <= "0000"; barB <= "0000"; wr <= '0';
end if;
if (contador = "1000110") then--70
	AMUX <= '0'; OPULA <= "10"; SH <= "00"; MBR <= '0'; MAR <= '0'; RD <= '0'; ENC <= '1'; barC <= "1010"; barA <= "0001"; barB <= "0000"; wr <= '0';
end if;
if (contador = "1000111") then--71
	AMUX <= '0'; OPULA <= "10"; SH <= "00"; MBR <= '0'; MAR <= '0'; RD <= '0'; ENC <= '1'; barC <= "0001"; barA <= "0010"; barB <= "0000"; wr <= '0';
end if;
if (contador = "1001000") then--72
	AMUX <= '0'; OPULA <= "10"; SH <= "00"; MBR <= '0'; MAR <= '0'; RD <= '0'; ENC <= '1'; barC <= "0010"; barA <= "1010"; barB <= "0000"; wr <= '0';
end if;
if (contador = "1001001") then--73
	AMUX <= '0'; OPULA <= "10"; SH <= "00"; MBR <= '0'; MAR <= '0'; RD <= '0'; ENC <= '0'; barC <= "0000"; barA <= "0100"; barB <= "0000"; wr <= '0';
end if;
if (contador = "1001010") then--74
	AMUX <= '0'; OPULA <= "01"; SH <= "00"; MBR <= '0'; MAR <= '0'; RD <= '0'; ENC <= '1'; barC <= "1010"; barA <= "0011"; barB <= "1001"; wr <= '0';
end if;
if (contador = "1001011") then--75
	AMUX <= '0'; OPULA <= "00"; SH <= "00"; MBR <= '0'; MAR <= '0'; RD <= '0'; ENC <= '1'; barC <= "0010"; barA <= "0010"; barB <= "1010"; wr <= '0';
end if;
if (contador = "1001100") then--76
	AMUX <= '0'; OPULA <= "01"; SH <= "00"; MBR <= '0'; MAR <= '0'; RD <= '0'; ENC <= '1'; barC <= "1010"; barA <= "0011"; barB <= "1001"; wr <= '0';
end if;
if (contador = "1001101") then--77
	AMUX <= '0'; OPULA <= "11"; SH <= "00"; MBR <= '0'; MAR <= '0'; RD <= '0'; ENC <= '1'; barC <= "1010"; barA <= "1010"; barB <= "0000"; wr <= '0';
end if;
if (contador = "1001110") then--78
	AMUX <= '0'; OPULA <= "00"; SH <= "00"; MBR <= '0'; MAR <= '0'; RD <= '0'; ENC <= '1'; barC <= "1010"; barA <= "1010"; barB <= "0110"; wr <= '0';
end if;
end if;

if (rising_edge(CLK)) then
	ciclo <= ciclo + '1';
end if;

--saltos:
--2 ciclos
if (ciclo = "001")then
	if (contador = "0001110") then--14
		contador <= "0000000";
		ciclo <= "000";
	end if;
	if (contador = "0010010") then--18
		contador <= "0000000";
		ciclo <= "000";
	end if;
	if(contador = "0010000") then--16
		contador <= contador + '1';
		ciclo <= "000";
	end if;
	if (contador = "0000101" AND n = '1') then--5
		contador <= "0001001";
		ciclo <= "000";
	end if;
end if;
--3 ciclos
if (ciclo = "010") then
	if (contador = "0000010" AND n = '1') then--2
		contador <= "0011100";
		ciclo <= "000";
	end if;
	if (contador = "0000011" AND n = '1') then--3
		contador <= "0010011";
		ciclo <= "000";
	end if;
	if (contador = "0000100" AND n = '1') then--4
		contador <= "0001011";
		ciclo <= "000";
	end if;
	if (contador = "0001000") then--8
		contador <= "0000000";
		ciclo <= "000";
	end if;
	if (contador = "0001010") then--10
		contador <= "0000000";
		ciclo <= "000";
	end if;
	if (contador = "0001011" AND n = '1') then--11
		contador <= "0001111";
		ciclo <= "000";
	end if;
	if (contador = "0010011" AND n = '1') then--19
		contador <= "0011001";
		ciclo <= "000";
	end if;
	if (contador = "0010100" AND n = '1') then--20
		contador <= "0010111";
		ciclo <= "000";
	end if;
	if (contador = "0010101" AND n = '1') then--21
		contador <= "0000000";
		ciclo <= "000";
	end if;
	if (contador = "0010110") then--22
		contador <= "0000000";
		ciclo <= "000";
	end if;
	if (contador = "0010111" AND z = '1') then--23
		contador <= "0010110";
		ciclo <= "000";
	end if;
	if (contador = "0011000") then--24
		contador <= "0000000";
		ciclo <= "000";
	end if;
	if (contador = "0011001" AND n = '1') then--25
		contador <= "0011011";
		ciclo <= "000";
	end if;
	if (contador = "0011010") then--26
		contador <= "0000000";
		ciclo <= "000";
	end if;
	if (contador = "0011011") then--27
		contador <= "0000000";
		ciclo <= "000";
	end if;
	if (contador = "0011100" AND n = '1') then--28
		contador <= "0101000";
		ciclo <= "000";
	end if;
	if (contador = "0011101" AND n = '1') then--29
		contador <= "0100011";
		ciclo <= "000";
	end if;
	if (contador = "0011110" AND n = '1') then--30
		contador <= "0101011";
		ciclo <= "000";
	end if;
	if (contador = "0100000") then--32
		contador <= "0000111";
		ciclo <= "000";
	end if;
	if (contador = "0100010") then--34
		contador <= "0001010";
		ciclo <= "000";
	end if;
	if (contador = "0100011" AND n = '1') then--35
		contador <= "0100110";
		ciclo <= "000";
	end if;
	if (contador = "0100101") then--37
		contador <= "0001101";
		ciclo <= "000";
	end if;
	if (contador = "0100111") then--39
		contador <= "0010000";
		ciclo <= "000";
	end if;
	if (contador = "0101000" AND n = '1') then--40
		contador <= "0100111";
		ciclo <= "000";
	end if;
	if (contador = "0101001" AND n = '1') then--41
		contador <= "0101100";
		ciclo <= "000";
	end if;
	if (contador = "0100110" AND n = '1') then--42
		contador <= "0010110";
		ciclo <= "000";
	end if;
	if (contador = "0100111") then--43
		contador <= "0000000";
		ciclo <= "000";
	end if;
	if (contador = "0101000" AND z = '1') then--44
		contador <= "0000000";
		ciclo <= "000";
	end if;
	if (contador = "0101001") then--45
		contador <= "0000000";
		ciclo <= "000";
	end if;
	if (contador = "0101010" AND n = '1') then--46
		contador <= "0110010";
		ciclo <= "000";
	end if;
	if (contador = "0110001") then--49
		contador <= "0000000";
		ciclo <= "000";
	end if;
	if (contador = "0110010" AND n = '1') then--50
		contador <= "1000001";
		ciclo <= "000";
	end if;
	if (contador = "0110011" AND n = '1') then--51
		contador <= "0111011";
		ciclo <= "000";
	end if;
	if (contador = "0110100" AND n = '1') then--52
		contador <= "0111000";
		ciclo <= "000";
	end if;
	if (contador = "0110111") then--55
		contador <= "0001010";
		ciclo <= "000";
	end if;
	if (contador = "0111010") then--58
		contador <= "0001010";
		ciclo <= "000";
	end if;
	if (contador = "0111011" AND n = '1') then--59
		contador <= "0111011";
		ciclo <= "000";
	end if;
	if (contador = "0111101") then--61
		contador <= "0001010";
		ciclo <= "000";
	end if;
	if (contador = "1000000") then--64
		contador <= "0000000";
		ciclo <= "000";
	end if;
	if (contador = "1000001" AND n = '1') then--65
		contador <= "1001001";
		ciclo <= "000";
	end if;
	if (contador = "1000010" AND n = '1') then--66
		contador <= "1000110";
		ciclo <= "000";
	end if;
	if (contador = "1000101") then--69
		contador <= "0000000";
		ciclo <= "000";
	end if;
	if (contador = "1001000") then--72
		contador <= "0000000";
		ciclo <= "000";
	end if;
	if (contador = "1001001" AND n = '1') then--73
		contador <= "1001100";
		ciclo <= "000";
	end if;
	if (contador = "1001011") then--75
		contador <= "0000000";
		ciclo <= "000";
	end if;
	if (contador = "1001110") then--78
		contador <= "1001011";
		ciclo <= "000";
	end if;
	
	if(ciclo = "010" and rising_edge(CLK)) then
		contador <= contador + '1';
		ciclo <= "000";
	end if;
end if;
--if (ciclo = "000") then
--	AMUX <= '0'; OPULA <= "00"; SH <= "00"; MBR <= '0'; MAR <= '0'; RD <= '0'; ENC <= '0'; barC <= "0000"; barA <= "0000"; barB <= "0000"; wr <= '0';
--end if;
end process;
end architecture;
