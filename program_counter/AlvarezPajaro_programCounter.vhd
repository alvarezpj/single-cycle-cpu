-- 32-bit program counter (PC)

library ieee;
library cs343;
use ieee.std_logic_1164.all;


entity AlvarezPajaro_programCounter is
    port(
        signal CLK, RESET : in std_logic;
        signal A : in std_logic_vector(31 downto 0);
        signal PC : inout std_logic_vector(31 downto 0)
    );
end entity AlvarezPajaro_programCounter;


architecture structure of AlvarezPajaro_programCounter is
    -- intermediate signal
    signal instructionAddress : std_logic_vector(31 downto 0) := X"00000000";
    
    begin

        proc0 : process(CLK, RESET)
            begin
                if falling_edge(CLK) then
                    instructionAddress <= A;
                end if;

                if RESET = '0' then
                    instructionAddress <= X"00000000";
                end if;
        end process;

        PC <= instructionAddress;
end architecture structure;