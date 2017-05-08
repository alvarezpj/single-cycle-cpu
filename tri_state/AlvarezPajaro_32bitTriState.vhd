-- implementation of 32-bit tristate 

library ieee;
use ieee.std_logic_1164.all;


entity AlvarezPajaro_32bitTriState is
    port(
        signal C : in std_logic;
        signal X : in std_logic_vector(31 downto 0);
        signal O : out std_logic_vector(31 downto 0)
    );
end entity AlvarezPajaro_32bitTriState;


architecture behavior of AlvarezPajaro_32bitTriState is
    begin
        -- explicit process
        process(C, X)
            begin   
                case C is
                    when '1' => O <= X;
                    when others => O <= (others => 'Z');
                end case;
        end process;
end architecture;