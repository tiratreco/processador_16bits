library ieee;
use ieee.std_logic_1164.all;

entity banco is
port(   
    enc      : in std_logic;
    cod      : in std_logic_vector (3 downto 0);
    C        : in std_logic_vector (15 downto 0);
    barA     : in std_logic_vector (3 downto 0);
    barB     : in std_logic_vector (3 downto 0);
    CLK      : in std_logic;
    A        : out std_logic_vector (15 downto 0);
    B	     : out std_logic_vector (15 downto 0));
end banco;

architecture comportamento of banco is

signal pc, ac, sp, ir, tir, zero, um, menos, am, bm, rega, regb, regc, regd, rege, regf, decoLA, decoLB, decoE   : std_logic_vector (15 downto 0);

component decodificador is
port(
cod     : in std_logic_vector (3 downto 0);
decod   : out std_logic_vector (15 downto 0));
end component decodificador;

begin 

decodificacaoEscrita  : decodificador port map (cod, decoE);
decodificacaoLeituraA : decodificador port map (barA, decoLA);
decodificacaoLeituraB : decodificador port map (barB, decoLB);

process (CLK)
begin

--leitura do A
if   (decoLA(0)='1' AND rising_edge(CLK)) then
    A <= pc;
elsif   (decoLA(1)='1' AND rising_edge(CLK)) then
    A <= ac;
elsif   (decoLA(2)='1' AND rising_edge(CLK)) then
    A <= sp;
elsif   (decoLA(3)='1' AND rising_edge(CLK)) then
    A <= ir;
elsif   (decoLA(4)='1' AND rising_edge(CLK)) then
    A <= tir;
elsif   (decoLA(5)='1' AND rising_edge(CLK)) then
    A <= "0000000000000000";
elsif   (decoLA(6)='1' AND rising_edge(CLK)) then
    A <= "0000000000000001";
elsif   (decoLA(7)='1' AND rising_edge(CLK)) then
    A <= "1111111111111111";
elsif   (decoLA(8)='1' AND rising_edge(CLK)) then
    A <= "0000000000001111";
elsif   (decoLA(9)='1' AND rising_edge(CLK)) then
    A <= "0000000011111111";
elsif   (decoLA(10)='1' AND rising_edge(CLK)) then
    A <= rega;
elsif   (decoLA(11)='1' AND rising_edge(CLK)) then
    A <= regb;
elsif   (decoLA(12)='1' AND rising_edge(CLK)) then
    A <= regc;
elsif   (decoLA(13)='1' AND rising_edge(CLK)) then
    A <= regd;
elsif   (decoLA(14)='1' AND rising_edge(CLK)) then
    A <= rege;
elsif   (decoLA(15)='1' AND rising_edge(CLK)) then
    A <= regf;
end if; 

--verificacao do B
if   (decoLB(0)='1' AND rising_edge(CLK)) then
    B <= pc;
elsif   (decoLB(1)='1' AND rising_edge(CLK)) then
    B <= ac;
elsif   (decoLB(2)='1' AND rising_edge(CLK)) then
    B <= sp;
elsif   (decoLB(3)='1' AND rising_edge(CLK)) then
    B <= ir;
elsif   (decoLB(4)='1' AND rising_edge(CLK)) then
    B <= tir;
elsif   (decoLB(5)='1' AND rising_edge(CLK)) then
    B <= "0000000000000000";
elsif   (decoLB(6)='1' AND rising_edge(CLK)) then
    B <= "0000000000000001";
elsif   (decoLB(7)='1' AND rising_edge(CLK)) then
    B <= "1111111111111111";
elsif   (decoLB(8)='1' AND rising_edge(CLK)) then
    B <= "0000000011111111";
elsif   (decoLB(9)='1' AND rising_edge(CLK)) then
    B <= "0000111111111111";
elsif   (decoLB(10)='1' AND rising_edge(CLK)) then
    B <= rega;
elsif   (decoLB(11)='1' AND rising_edge(CLK)) then
    B <= regb;
elsif   (decoLB(12)='1' AND rising_edge(CLK)) then
    B <= regc;
elsif   (decoLB(13)='1' AND rising_edge(CLK)) then
    B <= regd;
elsif   (decoLB(14)='1' AND rising_edge(CLK)) then
    B <= rege;
elsif   (decoLB(15)='1' AND rising_edge(CLK)) then
    B <= regf;
end if; 

--verifica escrita
if   (decoE(0)='1' AND rising_edge(CLK) AND ENC = '1')  then
    pc <= C;
elsif   (decoE(1)='1' AND rising_edge(CLK) AND ENC = '1') then
    ac <= C;
elsif   (decoE(2)='1' AND rising_edge(CLK) AND ENC = '1') then
    sp <= C;
elsif   (decoE(3)='1' AND rising_edge(CLK) AND ENC = '1') then
    ir <= C;
elsif   (decoE(4)='1' AND rising_edge(CLK) AND ENC = '1') then
    tir <= C;
elsif   (decoE(5)='1' AND rising_edge(CLK) AND ENC = '1') then
    zero <= C;
elsif   (decoE(6)='1' AND rising_edge(CLK) AND ENC = '1') then
    um <= C;
elsif   (decoE(7)='1' AND rising_edge(CLK) AND ENC = '1') then
    menos <= C;
elsif   (decoE(8)='1' AND rising_edge(CLK) AND ENC = '1') then
    am <= C;
elsif   (decoE(9)='1' AND rising_edge(CLK) AND ENC = '1') then
    bm <= C;
elsif   (decoE(10)='1' AND rising_edge(CLK) AND ENC = '1') then
    rega <= C;
elsif   (decoE(11)='1' AND rising_edge(CLK) AND ENC = '1') then
    regb <= C;
elsif   (decoE(12)='1' AND rising_edge(CLK) AND ENC = '1') then
    regc <= C;
elsif   (decoE(13)='1' AND rising_edge(CLK) AND ENC = '1') then
    regd <= C;
elsif   (decoE(14)='1' AND rising_edge(CLK) AND ENC = '1') then
    rege <= C;
elsif   (decoE(15)='1' AND rising_edge(CLK) AND ENC = '1') then
    regf <= C;
end if;
end process;

end architecture;