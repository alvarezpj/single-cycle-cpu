-- 32-bit 1:2 demultiplexer

library ieee;
use ieee.std_logic_1164.all;


entity AlvarezPajaro_32bit1to2Demultiplexer is
    port(
        signal SEL : in std_logic;
        signal I : in std_logic_vector(31 downto 0);
        signal A, B : out std_logic_vector(31 downto 0)
    );
end entity AlvarezPajaro_32bit1to2Demultiplexer;


architecture behavior of AlvarezPajaro_32bit1to2Demultiplexer is
    begin

        proc0 : process(SEL, I)
            begin
                case SEL is
                    when '0' => 
                        A <= I;

                    when '1' =>
                        B <= I;

                    when others => null;
                end case;
        end process;
end architecture behavior;