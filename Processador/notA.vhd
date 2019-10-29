library ieee;
use ieee.std_logic_1164.all;

entity notA is
port(
A	: in std_logic_vector (15 downto 0);
C	: out std_logic_vector (15 downto 0));
end notA;

architecture comportamento of notA is

begin
C(0) <= not A(0);
C(1) <= not A(1);
C(2) <= not A(2);
C(3) <= not A(3);
C(4) <= not A(4);
C(5) <= not A(5);
C(6) <= not A(6);
C(7) <= not A(7);
C(8) <= not A(8);
C(9) <= not A(9);
C(10) <= not A(10);
C(11) <= not A(11);
C(12) <= not A(12);
C(13) <= not A(13);
C(14) <= not A(14);
C(15) <= not A(15);

end architecture comportamento;

