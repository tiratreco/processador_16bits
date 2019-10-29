library ieee;
use ieee.std_logic_1164.all;

entity processador is
port(
	CLK 	: in std_logic;
	start   : in std_logic;
	memoMAR	: out std_logic_vector (11 downto 0);
	memoIn	: in std_logic_vector (15 downto 0);
	memoOut	: out std_logic_vector (15 downto 0);
	memoRD	: out std_logic;
	memoWR	: out std_logic);	
end entity;

architecture comportamento of processador is

signal zero, negativo : std_logic;
signal barA, barB, barC : std_logic_vector (3 downto 0);
signal AMUX, MBR, MAR, rd, enc : std_logic;
signal OPULA, SH : std_logic_vector (1 downto 0);

component operativa is 
port (
	AMUX		: in std_logic;			     --controle do multiplexador
	OPULA		: in std_logic_vector (1 downto 0);  --controle de operacao da ULA
	SH		: in std_logic_vector (1 downto 0);  --controle do deslocador
	MBR		: in std_logic;                      --habilita escrita no MBR vindo do C
	MAR		: in std_logic;                      --habilita escrita no MAR vindo de B
	MEM		: in std_logic_vector (15 downto 0); --vem da memoria e é guardado em MBR
	rd		: in std_logic;                      --habilita escrita no MBR vindo da memoria
	enc		: in std_logic;			     --Habilita escrita nos registradores
	barC		: in std_logic_vector (3 downto 0);  --determina qual dos regs vai escrever
	barA		: in std_logic_vector (3 downto 0);  --leitura de reg p/ A
	barB		: in std_logic_vector (3 downto 0);  --leitura de reg p/ B
	CLK		: in std_logic;
	memoOUTMAR	: out std_logic_vector (11 downto 0); -- saida do MAR p/ memoria
	memoOUTMBR	: out std_logic_vector (15 downto 0);
	z		: out std_logic; 			 --sinal de saida da ULA (zero)
	n		: out std_logic);			 --sinal de saida da ULA (negativo)
end component operativa;

component controle is
port (
	CLK   : in std_logic;
	start : in std_logic;
	AMUX  : out std_logic;
	OPULA : out std_logic_vector(1 downto 0);
	SH    : out std_logic_vector(1 downto 0);
	MBR   : out std_logic;
	MAR   : out std_logic;
	rd    : out std_logic;
	enc   : out std_logic;
	barC  : out std_logic_vector(3 downto 0);
	barA  : out std_logic_vector(3 downto 0);
	barB  : out std_logic_vector(3 downto 0);
	wr	  : out std_logic;
	z     : in std_logic;
	n     : in std_logic);
end component controle;

begin
parteControle : controle port map (CLK, start, AMUX, OPULA, SH, MBR, MAR, rd, enc, barC, barA, barB, memoWR, zero , negativo);
memoRD <= rd; 
parteOperativa : operativa port map (AMUX,  OPULA, SH, MBR, MAR, memoIn, rd, enc, barC, barA, barB, CLK, memoMAR, memoOut, zero , negativo);

end architecture;