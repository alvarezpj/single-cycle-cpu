-- 128x8 instruction memory

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity AlvarezPajaro_128x8InstructionMemory is  
    port(
        signal CLK, MEMWRITE : in std_logic;
        signal RDADDRESS, WRADDRESS, WRDATA : in std_logic_vector(31 downto 0);
        signal INSTRUCTION : out std_logic_vector(31 downto 0)
    );
end entity AlvarezPajaro_128x8InstructionMemory;


architecture behavior of AlvarezPajaro_128x8InstructionMemory is
    type memory is array(127 downto 0) of std_logic_vector(7 downto 0);
    signal instructionMemory : memory;
    signal writeAddress, readAddress : natural range 0 to 127;
    
    begin

        writeMem : process(CLK, writeAddress, MEMWRITE, WRDATA)
            begin
                if rising_edge(CLK) and MEMWRITE = '1' then
                    case writeAddress is
                        when 0 =>
                            instructionMemory(0) <= WRDATA(31 downto 24);
                            instructionMemory(1) <= WRDATA(23 downto 16);
                            instructionMemory(2) <= WRDATA(15 downto 8);
                            instructionMemory(3) <= WRDATA(7 downto 0);

                        when 4 =>
                            instructionMemory(4) <= WRDATA(31 downto 24);
                            instructionMemory(5) <= WRDATA(23 downto 16);
                            instructionMemory(6) <= WRDATA(15 downto 8);
                            instructionMemory(7) <= WRDATA(7 downto 0);

                        when 8 =>
                            instructionMemory(8) <= WRDATA(31 downto 24);
                            instructionMemory(9) <= WRDATA(23 downto 16);
                            instructionMemory(10) <= WRDATA(15 downto 8);
                            instructionMemory(11) <= WRDATA(7 downto 0);

                        when 12 =>
                            instructionMemory(12) <= WRDATA(31 downto 24);
                            instructionMemory(13) <= WRDATA(23 downto 16);
                            instructionMemory(14) <= WRDATA(15 downto 8);
                            instructionMemory(15) <= WRDATA(7 downto 0);

                        when 16 =>
                            instructionMemory(16) <= WRDATA(31 downto 24);
                            instructionMemory(17) <= WRDATA(23 downto 16);
                            instructionMemory(18) <= WRDATA(15 downto 8);
                            instructionMemory(19) <= WRDATA(7 downto 0);

                        when 20 =>
                            instructionMemory(20) <= WRDATA(31 downto 24);
                            instructionMemory(21) <= WRDATA(23 downto 16);
                            instructionMemory(22) <= WRDATA(15 downto 8);
                            instructionMemory(23) <= WRDATA(7 downto 0);


                        when 24 =>
                            instructionMemory(24) <= WRDATA(31 downto 24);
                            instructionMemory(25) <= WRDATA(23 downto 16);
                            instructionMemory(26) <= WRDATA(15 downto 8);
                            instructionMemory(27) <= WRDATA(7 downto 0);

                        when 28 =>
                            instructionMemory(28) <= WRDATA(31 downto 24);
                            instructionMemory(29) <= WRDATA(23 downto 16);
                            instructionMemory(30) <= WRDATA(15 downto 8);
                            instructionMemory(31) <= WRDATA(7 downto 0);

                        when 32 =>
                            instructionMemory(32) <= WRDATA(31 downto 24);
                            instructionMemory(33) <= WRDATA(23 downto 16);
                            instructionMemory(34) <= WRDATA(15 downto 8);
                            instructionMemory(35) <= WRDATA(7 downto 0);

                        when 36 =>
                            instructionMemory(36) <= WRDATA(31 downto 24);
                            instructionMemory(37) <= WRDATA(23 downto 16);
                            instructionMemory(38) <= WRDATA(15 downto 8);
                            instructionMemory(39) <= WRDATA(7 downto 0);

                        when 40 =>
                            instructionMemory(40) <= WRDATA(31 downto 24);
                            instructionMemory(41) <= WRDATA(23 downto 16);
                            instructionMemory(42) <= WRDATA(15 downto 8);
                            instructionMemory(43) <= WRDATA(7 downto 0);

                        when 44 =>
                            instructionMemory(44) <= WRDATA(31 downto 24);
                            instructionMemory(45) <= WRDATA(23 downto 16);
                            instructionMemory(46) <= WRDATA(15 downto 8);
                            instructionMemory(47) <= WRDATA(7 downto 0);

                        when 48 =>
                            instructionMemory(48) <= WRDATA(31 downto 24);
                            instructionMemory(49) <= WRDATA(23 downto 16);
                            instructionMemory(50) <= WRDATA(15 downto 8);
                            instructionMemory(51) <= WRDATA(7 downto 0);

                        when 52 =>
                            instructionMemory(52) <= WRDATA(31 downto 24);
                            instructionMemory(53) <= WRDATA(23 downto 16);
                            instructionMemory(54) <= WRDATA(15 downto 8);
                            instructionMemory(55) <= WRDATA(7 downto 0);

                        when 56 =>
                            instructionMemory(56) <= WRDATA(31 downto 24);
                            instructionMemory(57) <= WRDATA(23 downto 16);
                            instructionMemory(58) <= WRDATA(15 downto 8);
                            instructionMemory(59) <= WRDATA(7 downto 0);

                        when 60 =>
                            instructionMemory(60) <= WRDATA(31 downto 24);
                            instructionMemory(61) <= WRDATA(23 downto 16);
                            instructionMemory(62) <= WRDATA(15 downto 8);
                            instructionMemory(63) <= WRDATA(7 downto 0);

                        when 64 =>
                            instructionMemory(64) <= WRDATA(31 downto 24);
                            instructionMemory(65) <= WRDATA(23 downto 16);
                            instructionMemory(66) <= WRDATA(15 downto 8);
                            instructionMemory(67) <= WRDATA(7 downto 0);

                        when 68 =>
                            instructionMemory(68) <= WRDATA(31 downto 24);
                            instructionMemory(69) <= WRDATA(23 downto 16);
                            instructionMemory(70) <= WRDATA(15 downto 8);
                            instructionMemory(71) <= WRDATA(7 downto 0);

                        when 72 =>
                            instructionMemory(72) <= WRDATA(31 downto 24);
                            instructionMemory(73) <= WRDATA(23 downto 16);
                            instructionMemory(74) <= WRDATA(15 downto 8);
                            instructionMemory(75) <= WRDATA(7 downto 0);

                        when 76 =>
                            instructionMemory(76) <= WRDATA(31 downto 24);
                            instructionMemory(77) <= WRDATA(23 downto 16);
                            instructionMemory(78) <= WRDATA(15 downto 8);
                            instructionMemory(79) <= WRDATA(7 downto 0);

                        when 80 =>
                            instructionMemory(80) <= WRDATA(31 downto 24);
                            instructionMemory(81) <= WRDATA(23 downto 16);
                            instructionMemory(82) <= WRDATA(15 downto 8);
                            instructionMemory(83) <= WRDATA(7 downto 0);

                        when 84 =>
                            instructionMemory(84) <= WRDATA(31 downto 24);
                            instructionMemory(85) <= WRDATA(23 downto 16);
                            instructionMemory(86) <= WRDATA(15 downto 8);
                            instructionMemory(87) <= WRDATA(7 downto 0);

                        when 88 =>
                            instructionMemory(88) <= WRDATA(31 downto 24);
                            instructionMemory(89) <= WRDATA(23 downto 16);
                            instructionMemory(90) <= WRDATA(15 downto 8);
                            instructionMemory(91) <= WRDATA(7 downto 0);

                        when 92 =>
                            instructionMemory(92) <= WRDATA(31 downto 24);
                            instructionMemory(93) <= WRDATA(23 downto 16);
                            instructionMemory(94) <= WRDATA(15 downto 8);
                            instructionMemory(95) <= WRDATA(7 downto 0);

                        when 96 =>
                            instructionMemory(96) <= WRDATA(31 downto 24);
                            instructionMemory(97) <= WRDATA(23 downto 16);
                            instructionMemory(98) <= WRDATA(15 downto 8);
                            instructionMemory(99) <= WRDATA(7 downto 0);

                        when 100 =>
                            instructionMemory(100) <= WRDATA(31 downto 24);
                            instructionMemory(101) <= WRDATA(23 downto 16);
                            instructionMemory(102) <= WRDATA(15 downto 8);
                            instructionMemory(103) <= WRDATA(7 downto 0);

                        when 104 =>
                            instructionMemory(104) <= WRDATA(31 downto 24);
                            instructionMemory(105) <= WRDATA(23 downto 16);
                            instructionMemory(106) <= WRDATA(15 downto 8);
                            instructionMemory(107) <= WRDATA(7 downto 0);

                        when 108 =>
                            instructionMemory(108) <= WRDATA(31 downto 24);
                            instructionMemory(109) <= WRDATA(23 downto 16);
                            instructionMemory(110) <= WRDATA(15 downto 8);
                            instructionMemory(111) <= WRDATA(7 downto 0);

                        when 112 =>
                            instructionMemory(112) <= WRDATA(31 downto 24);
                            instructionMemory(113) <= WRDATA(23 downto 16);
                            instructionMemory(114) <= WRDATA(15 downto 8);
                            instructionMemory(115) <= WRDATA(7 downto 0);

                        when 116 =>
                            instructionMemory(116) <= WRDATA(31 downto 24);
                            instructionMemory(117) <= WRDATA(23 downto 16);
                            instructionMemory(118) <= WRDATA(15 downto 8);
                            instructionMemory(119) <= WRDATA(7 downto 0);

                        when 120 =>
                            instructionMemory(120) <= WRDATA(31 downto 24);
                            instructionMemory(121) <= WRDATA(23 downto 16);
                            instructionMemory(122) <= WRDATA(15 downto 8);
                            instructionMemory(123) <= WRDATA(7 downto 0);

                        when 124 =>
                            instructionMemory(124) <= WRDATA(31 downto 24);
                            instructionMemory(125) <= WRDATA(23 downto 16);
                            instructionMemory(126) <= WRDATA(15 downto 8);
                            instructionMemory(127) <= WRDATA(7 downto 0);
                            
                        when others => null;
                    end case;
                end if;
        end process;

        readMem : process(CLK, readAddress)
            begin
                case readAddress is
                    when 0 =>
                        INSTRUCTION <= instructionMemory(0) & instructionMemory(1) & instructionMemory(2) & instructionMemory(3);

                    when 4 =>
                        INSTRUCTION <= instructionMemory(4) & instructionMemory(5) & instructionMemory(6) & instructionMemory(7);

                    when 8 =>
                        INSTRUCTION <= instructionMemory(8) & instructionMemory(9) & instructionMemory(10) & instructionMemory(11);

                    when 12 =>
                        INSTRUCTION <= instructionMemory(12) & instructionMemory(13) & instructionMemory(14) & instructionMemory(15);

                    when 16 =>
                        INSTRUCTION <= instructionMemory(16) & instructionMemory(17) & instructionMemory(18) & instructionMemory(19);

                    when 20 =>
                        INSTRUCTION <= instructionMemory(20) & instructionMemory(21) & instructionMemory(22) & instructionMemory(23);

                    when 24 =>
                        INSTRUCTION <= instructionMemory(24) & instructionMemory(25) & instructionMemory(26) & instructionMemory(27);

                    when 28 =>
                        INSTRUCTION <= instructionMemory(28) & instructionMemory(29) & instructionMemory(30) & instructionMemory(31);

                    when 32 =>
                        INSTRUCTION <= instructionMemory(32) & instructionMemory(33) & instructionMemory(34) & instructionMemory(35);

                    when 36 =>
                        INSTRUCTION <= instructionMemory(36) & instructionMemory(37) & instructionMemory(38) & instructionMemory(39);

                    when 40 =>
                        INSTRUCTION <= instructionMemory(40) & instructionMemory(41) & instructionMemory(42) & instructionMemory(43);

                    when 44 =>
                        INSTRUCTION <= instructionMemory(44) & instructionMemory(45) & instructionMemory(46) & instructionMemory(47);

                    when 48 =>
                        INSTRUCTION <= instructionMemory(48) & instructionMemory(49) & instructionMemory(50) & instructionMemory(51);

                    when 52 =>
                        INSTRUCTION <= instructionMemory(52) & instructionMemory(53) & instructionMemory(54) & instructionMemory(55);

                    when 56 =>
                        INSTRUCTION <= instructionMemory(56) & instructionMemory(57) & instructionMemory(58) & instructionMemory(59);

                    when 60 =>
                        INSTRUCTION <= instructionMemory(60) & instructionMemory(61) & instructionMemory(62) & instructionMemory(63);

                    when 64 =>
                        INSTRUCTION <= instructionMemory(64) & instructionMemory(65) & instructionMemory(66) & instructionMemory(67);

                    when 68 =>
                        INSTRUCTION <= instructionMemory(68) & instructionMemory(69) & instructionMemory(70) & instructionMemory(71);

                    when 72 =>
                        INSTRUCTION <= instructionMemory(72) & instructionMemory(73) & instructionMemory(74) & instructionMemory(75);

                    when 76 =>
                        INSTRUCTION <= instructionMemory(76) & instructionMemory(77) & instructionMemory(78) & instructionMemory(79);

                    when 80 =>
                        INSTRUCTION <= instructionMemory(80) & instructionMemory(81) & instructionMemory(82) & instructionMemory(83);

                    when 84 =>
                        INSTRUCTION <= instructionMemory(84) & instructionMemory(85) & instructionMemory(86) & instructionMemory(87);

                    when 88 =>
                        INSTRUCTION <= instructionMemory(88) & instructionMemory(89) & instructionMemory(90) & instructionMemory(91);
                        
                    when 92 =>
                        INSTRUCTION <= instructionMemory(92) & instructionMemory(93) & instructionMemory(94) & instructionMemory(95);

                    when 96 =>
                        INSTRUCTION <= instructionMemory(96) & instructionMemory(97) & instructionMemory(98) & instructionMemory(99);

                    when 100 =>
                        INSTRUCTION <= instructionMemory(100) & instructionMemory(101) & instructionMemory(102) & instructionMemory(103);

                    when 104 =>
                        INSTRUCTION <= instructionMemory(104) & instructionMemory(105) & instructionMemory(106) & instructionMemory(107);

                    when 108 =>
                        INSTRUCTION <= instructionMemory(108) & instructionMemory(109) & instructionMemory(110) & instructionMemory(111);

                    when 112 =>
                        INSTRUCTION <= instructionMemory(112) & instructionMemory(113) & instructionMemory(114) & instructionMemory(115);

                    when 116 =>
                        INSTRUCTION <= instructionMemory(116) & instructionMemory(117) & instructionMemory(118) & instructionMemory(119);

                    when 120 =>
                        INSTRUCTION <= instructionMemory(120) & instructionMemory(121) & instructionMemory(122) & instructionMemory(123);

                    when 124 =>
                        INSTRUCTION <= instructionMemory(124) & instructionMemory(125) & instructionMemory(126) & instructionMemory(127);

                    when others => null;
                end case;
        end process;

        writeAddress <= to_integer(unsigned(WRADDRESS(6 downto 0)));
        readAddress <= to_integer(unsigned(RDADDRESS(6 downto 0)));
end architecture behavior;