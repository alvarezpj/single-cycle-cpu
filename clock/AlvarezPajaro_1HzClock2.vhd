-- slow clock

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity AlvarezPajaro_1HzClock2 is
    port(
	    signal CLK_50MHZ : in std_logic;
	    signal CLK_1HZ : out std_logic
    );
end entity AlvarezPajaro_1HzClock2;


architecture behavior of AlvarezPajaro_1HzClock2 is
    -- intermediate signals
    signal clk : std_logic := '0';
    signal counter : unsigned(27 downto 0) := (others => '0');

    begin
		process(CLK_50MHZ)
	    	begin
		    	if rising_edge(CLK_50MHZ) then
		        	if counter = X"17D7840" then    -- 25,000,000 in hex
                    	counter <= (others => '0');
		            	clk <= not clk;
		        	else 
			        	counter <= counter + "1";
		        	end if;
		    	end if;
		end process;

	CLK_1HZ <= clk;		
end architecture behavior;