-- implementation of full adder with generate and propagate outputs

library ieee;
use ieee.std_logic_1164.all;


entity AlvarezPajaro_fullAdderGP is
    port(
        signal X, Y, C : in std_logic; 
        signal S, G, P : out std_logic
    );
end entity AlvarezPajaro_fullAdderGP;


architecture behavior of AlvarezPajaro_fullAdderGP is
    begin
        S <= (X xor Y) xor C;
        G <= X and Y;
        P <= X or Y;
end architecture behavior;