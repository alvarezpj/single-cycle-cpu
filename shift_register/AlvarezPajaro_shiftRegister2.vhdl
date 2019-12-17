-- Shift register

library ieee;
use ieee.std_logic_1164.all;


entity AlvarezPajaro_shiftRegister2 is 
    port(
        signal SHIFT, CLK : in std_logic;
        signal LOAD : in std_logic_vector(7 downto 0);
        signal Q : out std_logic_vector(31 downto 0)
    );
end entity AlvarezPajaro_shiftRegister2;


architecture behavior of AlvarezPajaro_shiftRegister2 is
    -- intermediate signal 
    signal data : std_logic_vector(31 downto 0) := (others => '0');

    begin

        proc0 : process(CLK)
            begin
                if rising_edge(CLK) then
                    data(7 downto 0) <= LOAD;
                end if;
        end process;

        proc1 : process(SHIFT)
            begin
                if SHIFT = '0' then  -- map SHIFT to a key
                    data(31 downto 8) <= data(23 downto 0);
                end if;
        end process;

        Q <= data;
end architecture behavior;