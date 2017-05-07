-- 3-port register file

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity AlvarezPajaro_3PortRegisterFile3 is
    port(
        signal REGWR, CLK : in std_logic;
        signal RD, RS, RT : in std_logic_vector(4 downto 0);
        signal WRDATA, RA, LO, HI : in std_logic_vector(31 downto 0);
        signal RDATA1, RDATA2 : out std_logic_vector(31 downto 0)
    );
end entity AlvarezPajaro_3PortRegisterFile3;


architecture behavior of AlvarezPajaro_3PortRegisterFile3 is
    type registerFile is array(31 downto 0) of std_logic_vector(31 downto 0);
    signal r : registerFile; 
    signal readRegister1, readRegister2, writeRegister : natural range 0 to 31;

    begin

        writeReg : process(CLK, writeRegister, REGWR)
            begin
                if rising_edge(CLK) and REGWR = '1' then
                    case writeRegister is
                        when 1 =>
                            r(1) <= WRDATA;
                        when 2 =>
                            r(2) <= WRDATA;
                        when 3 =>
                            r(3) <= WRDATA;
                        when 4 =>
                            r(4) <= WRDATA;
                        when 5 =>
                            r(5) <= WRDATA;
                        when 6 =>
                            r(6) <= WRDATA;
                        when 7 =>
                            r(7) <= WRDATA;
                        when 8 =>
                            r(8) <= WRDATA;
                        when 9 =>
                            r(9) <= WRDATA;
                        when 10 =>
                            r(10) <= WRDATA;
                        when 11 =>
                            r(11) <= WRDATA;
                        when 12 =>
                            r(12) <= WRDATA;
                        when 13 =>
                            r(13) <= WRDATA;
                        when 14 =>
                            r(14) <= WRDATA;
                        when 15 =>
                            r(15) <= WRDATA;
                        when 16 =>
                            r(16) <= WRDATA;
                        when 17 =>
                            r(17) <= WRDATA;
                        when 18 =>
                            r(18) <= WRDATA;
                        when 19 =>
                            r(19) <= WRDATA;
                        when 20 =>
                            r(20) <= WRDATA;
                        when 21 =>
                            r(21) <= WRDATA;
                        when 22 =>
                            r(22) <= WRDATA;
                        when 23 =>
                            r(23) <= WRDATA;
                        when 24 =>
                            r(24) <= WRDATA;
                        when 25 =>
                            r(25) <= WRDATA;
                        when 26 =>
                            r(26) <= WRDATA;
                        when 28 =>
                            r(28) <= WRDATA;
                        when others => null;
                    end case;
                    r(29) <= RA;
                    r(30) <= LO;
                    r(31) <= HI;
                end if;
        end process;

        readReg1 : process(CLK, readRegister1)
            begin
                case readRegister1 is
                    when 0 =>
                        RDATA1 <= r(0);
                    when 1 =>
                        RDATA1 <= r(1);
                    when 2 =>
                        RDATA1 <= r(2);
                    when 3 =>
                        RDATA1 <= r(3);
                    when 4 =>
                        RDATA1 <= r(4);
                    when 5 =>
                        RDATA1 <= r(5);
                    when 6 =>
                        RDATA1 <= r(6);
                    when 7 =>
                        RDATA1 <= r(7);
                    when 8 =>
                        RDATA1 <= r(8);
                    when 9 =>
                        RDATA1 <= r(9);
                    when 10 =>
                        RDATA1 <= r(10);
                    when 11 =>
                        RDATA1 <= r(11);
                    when 12 =>
                        RDATA1 <= r(12);
                    when 13 =>
                        RDATA1 <= r(13);
                    when 14 =>
                        RDATA1 <= r(14);
                    when 15 =>
                        RDATA1 <= r(15);
                    when 16 =>
                        RDATA1 <= r(16);
                    when 17 =>
                        RDATA1 <= r(17);
                    when 18 =>
                        RDATA1 <= r(18);
                    when 19 =>
                        RDATA1 <= r(19);
                    when 20 =>
                        RDATA1 <= r(20);
                    when 21 =>
                        RDATA1 <= r(21);
                    when 22 =>
                        RDATA1 <= r(22);
                    when 23 =>
                        RDATA1 <= r(23);
                    when 24 =>
                        RDATA1 <= r(24);
                    when 25 =>
                        RDATA1 <= r(25);
                    when 26 =>
                        RDATA1 <= r(26);
                    when 27 =>
                        RDATA1 <= r(27);
                    when 28 =>
                        RDATA1 <= r(28);
                    when 29 =>
                        RDATA1 <= r(29);
                    when 30 =>
                        RDATA1 <= r(30);
                    when 31 =>
                        RDATA1 <= r(31);
                    when others => null;
                end case;
        end process;

        readReg2 : process(CLK, readRegister2)
            begin
                case readRegister2 is
                    when 0 =>
                        RDATA2 <= r(0);
                    when 1 =>
                        RDATA2 <= r(1);
                    when 2 =>
                        RDATA2 <= r(2);
                    when 3 =>
                        RDATA2 <= r(3);
                    when 4 =>
                        RDATA2 <= r(4);
                    when 5 =>
                        RDATA2 <= r(5);
                    when 6 =>
                        RDATA2 <= r(6);
                    when 7 =>
                        RDATA2 <= r(7);
                    when 8 =>
                        RDATA2 <= r(8);
                    when 9 =>
                        RDATA2 <= r(9);
                    when 10 =>
                        RDATA2 <= r(10);
                    when 11 =>
                        RDATA2 <= r(11);
                    when 12 =>
                        RDATA2 <= r(12);
                    when 13 =>
                        RDATA2 <= r(13);
                    when 14 =>
                        RDATA2 <= r(14);
                    when 15 =>
                        RDATA2 <= r(15);
                    when 16 =>
                        RDATA2 <= r(16);
                    when 17 =>
                        RDATA2 <= r(17);
                    when 18 =>
                        RDATA2 <= r(18);
                    when 19 =>
                        RDATA2 <= r(19);
                    when 20 =>
                        RDATA2 <= r(20);
                    when 21 =>
                        RDATA2 <= r(21);
                    when 22 =>
                        RDATA2 <= r(22);
                    when 23 =>
                        RDATA2 <= r(23);
                    when 24 =>
                        RDATA2 <= r(24);
                    when 25 =>
                        RDATA2 <= r(25);
                    when 26 =>
                        RDATA2 <= r(26);
                    when 27 =>
                        RDATA2 <= r(27);
                    when 28 =>
                        RDATA2 <= r(28);
                    when 29 =>
                        RDATA2 <= r(29);
                    when 30 =>
                        RDATA2 <= r(30);
                    when 31 =>
                        RDATA2 <= r(31);
                    when others => null;
                end case;
        end process;

        r(0) <= X"00000000";
        r(27) <= X"000000FC";
        readRegister1 <= to_integer(unsigned(RS));
        readRegister2 <= to_integer(unsigned(RT));
        writeRegister <= to_integer(unsigned(RD));
end architecture behavior;