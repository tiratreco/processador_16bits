# processador_16bits
Um processador de 16 bits descrito em linguagem VHDL
Vários componentes podem ser aproveitados para outros projetos
ULA (16 BITS)
       00 - soma
       01 - and lógico
       10 - transparencia de A
       11 - not A
     
DESLOCADOR (16 BITS)
       00 - nao deslocar
       10 - deslocar à esquerda
       11 - deslocar à direita
      
DECODIFICADOR (4 BITS -> 16 BITS)
       exemplo: 0000 -> 0000000000000001
                0001 -> 0000000000000010
       
