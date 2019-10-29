library ieee;
use ieee.std_logic_1164.all;

entity operativa is 
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
end entity;

architecture comportamento of operativa is

component ULA is 
port(
A	: in std_logic_vector (15 downto 0);
B	: in std_logic_vector (15 downto 0);
op	: in std_logic_vector (1 downto 0); --indica operacao a ser feita
C	: buffer std_logic_vector (15 downto 0);
z	: out std_logic; -- sinal de saida indica se o resultado eh zero
n 	: out std_logic); -- sinal de saida indica se o resultado eh negativo
end component ULA;

component mux is
port(
A	: in std_logic_vector (15 downto 0);
MBR	: in std_logic_vector (15 downto 0);
s	: in std_logic;
CLK	: in std_logic;
C	: out std_logic_vector (15 downto 0));
end component mux;

component deslocador is
port(
	A	: in std_logic_vector (15 downto 0); --numero a ser deslocado
	des	: in std_logic; --deslocar? 0=nao 1=sim
	dir	: in std_logic; --direcao do deslocamento: 0=esquerda 1=direita
	C	: out std_logic_vector (15 downto 0)); --saida, deslocada ou nao
end component deslocador;

component banco is
port(   
    enc      : in std_logic;
    cod      : in std_logic_vector (3 downto 0);
    C        : in std_logic_vector (15 downto 0);
    barA     : in std_logic_vector (3 downto 0);
    barB     : in std_logic_vector (3 downto 0);
    CLK      : in std_logic;
    A        : out std_logic_vector (15 downto 0);
    B	     : out std_logic_vector (15 downto 0));
end component banco;

component MARMBR is
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
end component MARMBR;

signal A, B, C, regMAR, MBRToMux, muxToUla, ulaToDesl  : std_logic_vector (15 downto 0);

begin
bancoDeRegistradores : banco port map (enc , barC , C , barA , barB , CLK , A , B);
muxA : mux port map (A, MBRToMux, AMUX, CLK, muxToUla);
operacaoULA : ULA port map (muxToUla, B, OPULA, ulaToDesl, z, n); 
deslocar : deslocador port map (ulaToDesl, SH(1), SH(0), C);
regMARMBR : MARMBR port map (CLK, B(11 downto 0), MAR, memoOUTMAR, C, MBR, MEM, rd, memoOUTMBR, MBRToMux); 
end architecture;

