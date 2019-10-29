library ieee;
use ieee.std_logic_1164.all;

entity arquitetura is
port(
	ligar 	: in std_logic;
	CLK		: in std_logic);
end entity;

architecture comportamento of arquitetura is

component processador is
port(
	CLK		: in std_logic;
	start   : in std_logic;
	memoMAR	: out std_logic_vector (11 downto 0);
	memoIn	: in std_logic_vector (15 downto 0);
	memoOut	: out std_logic_vector (15 downto 0);
	memoRD	: out std_logic;
	memoWR	: out std_logic);	
end component processador;

component memoria is
port(
CLK 	 : in std_logic;
start	 : in std_logic;
endereco : in std_logic_vector(11 downto 0);
wr		 : in std_logic;
rd	 	 : in std_logic;
saida	 : out std_logic_vector (15 downto 0);
entrada  : in std_logic_vector (15 downto 0));
end component memoria;

signal wr,rd		   : std_logic;
signal memoMAR         : std_logic_vector(11 downto 0);
signal memoIn, memoOut : std_logic_vector(15 downto 0);

begin
processa : processador port map(CLK, ligar, memoMAR, memoIn, memoOut, rd, wr);
memorias : memoria port map (CLK, ligar, memoMAR, wr, rd, memoIn, memoOut);
end architecture;
