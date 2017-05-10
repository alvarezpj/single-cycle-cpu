-- Shift register

library ieee;
use ieee.std_logic_1164.all;


entity AlvarezPajaro_shiftRegister3 is 
    port(
        signal SHIFT, WRDATA : in std_logic;
        signal LOAD : in std_logic_vector(7 downto 0);
        signal Q : out std_logic_vector(31 downto 0)
    );
end entity AlvarezPajaro_shiftRegister3;


architecture behavior of AlvarezPajaro_shiftRegister3 is
    -- intermediate signal 
    signal data : std_logic_vector(31 downto 0) := (others => '0');

    begin
        proc0 : process(SHIFT, WRDATA)
            begin
                if SHIFT = '0' then  -- map SHIFT to a key
                    data(31 downto 8) <= data(23 downto 0);
                end if;

                if WRDATA = '0' then  -- map LOAD to a key
                    Q <= data;
                end if;
        end process;

        data(7 downto 0) <= LOAD;
end architecture behavior;