-- implementation of hexadecimal seven segment decoder

library ieee;
use ieee.std_logic_1164.all;


entity AlvarezPajaro_hexadecimalDisplayDecoder is
    port(
        signal DIN : in std_logic_vector(3 downto 0);
        signal DOUT : out std_logic_vector(6 downto 0)
    );
end entity AlvarezPajaro_hexadecimalDisplayDecoder;


architecture behavior of AlvarezPajaro_hexadecimalDisplayDecoder is
    begin
        DOUT(0) <= (DIN(3) and (not DIN(2)) and DIN(1) and DIN(0)) or (DIN(3) and DIN(2) and (not DIN(1)) and DIN(0)) or ((not DIN(3)) and (not DIN(2)) and (not DIN(1)) and DIN(0)) or ((not DIN(3)) and DIN(2) and (not DIN(1)) and (not DIN(0)));
        DOUT(1) <= (DIN(3) and DIN(1) and DIN(0)) or (DIN(3) and DIN(2) and (not DIN(0))) or (DIN(2) and DIN(1) and (not DIN(0))) or ((not DIN(3)) and DIN(2) and (not DIN(1)) and DIN(0));
        DOUT(2) <= (DIN(3) and DIN(2) and DIN(1)) or (DIN(3) and DIN(2) and (not DIN(0))) or ((not DIN(3)) and (not DIN(2)) and DIN(1) and (not DIN(0)));
        DOUT(3) <= (DIN(2) and DIN(1) and DIN(0)) or ((not DIN(3)) and (not DIN(2)) and (not DIN(1)) and DIN(0)) or (DIN(3) and (not DIN(2)) and DIN(1) and (not DIN(0))) or ((not DIN(3)) and DIN(2) and (not DIN(1)) and (not DIN(0)));
        DOUT(4) <= ((not DIN(3)) and DIN(0)) or ((not DIN(3)) and DIN(2) and (not DIN(1))) or ((not DIN(2)) and (not DIN(1)) and DIN(0));
        DOUT(5) <= ((not DIN(3)) and (not DIN(2)) and DIN(1)) or ((not DIN(3)) and (not DIN(2)) and DIN(0)) or ((not DIN(3)) and DIN(1) and DIN(0)) or (DIN(3) and DIN(2) and (not DIN(1)) and DIN(0));
        DOUT(6) <= ((not DIN(3)) and (not DIN(2)) and (not DIN(1))) or ((not DIN(3)) and DIN(2) and DIN(1) and DIN(0)) or (DIN(3) and DIN(2) and (not DIN(1)) and (not DIN(0)));
end architecture behavior;