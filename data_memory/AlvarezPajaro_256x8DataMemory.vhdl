-- 256x8 data memory

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity AlvarezPajaro_256x8DataMemory is  
    port(
        signal CLK, MEMREAD, MEMWRITE : in std_logic;
        signal ADDRESS, WRDATA : in std_logic_vector(31 downto 0);
        signal DATAOUT : out std_logic_vector(31 downto 0)
    );
end entity AlvarezPajaro_256x8DataMemory;


architecture behavior of AlvarezPajaro_256x8DataMemory is
    type memory is array(255 downto 0) of std_logic_vector(7 downto 0);
    signal dataMemory : memory;
    
    begin

        writeMem : process(CLK, ADDRESS, MEMWRITE, WRDATA)
            begin
                if rising_edge(CLK) and MEMWRITE = '1' then
                    case ADDRESS(7 downto 0) is
                        when X"00" =>
                            dataMemory(0) <= WRDATA(31 downto 24);
                            dataMemory(1) <= WRDATA(23 downto 16);
                            dataMemory(2) <= WRDATA(15 downto 8);
                            dataMemory(3) <= WRDATA(7 downto 0);

                        when X"04" =>
                            dataMemory(4) <= WRDATA(31 downto 24);
                            dataMemory(5) <= WRDATA(23 downto 16);
                            dataMemory(6) <= WRDATA(15 downto 8);
                            dataMemory(7) <= WRDATA(7 downto 0);

                        when X"08" =>
                            dataMemory(8) <= WRDATA(31 downto 24);
                            dataMemory(9) <= WRDATA(23 downto 16);
                            dataMemory(10) <= WRDATA(15 downto 8);
                            dataMemory(11) <= WRDATA(7 downto 0);

                        when X"0C" =>
                            dataMemory(12) <= WRDATA(31 downto 24);
                            dataMemory(13) <= WRDATA(23 downto 16);
                            dataMemory(14) <= WRDATA(15 downto 8);
                            dataMemory(15) <= WRDATA(7 downto 0);

                        when X"10" =>
                            dataMemory(16) <= WRDATA(31 downto 24);
                            dataMemory(17) <= WRDATA(23 downto 16);
                            dataMemory(18) <= WRDATA(15 downto 8);
                            dataMemory(19) <= WRDATA(7 downto 0);

                        when X"14" =>
                            dataMemory(20) <= WRDATA(31 downto 24);
                            dataMemory(21) <= WRDATA(23 downto 16);
                            dataMemory(22) <= WRDATA(15 downto 8);
                            dataMemory(23) <= WRDATA(7 downto 0);


                        when X"18" =>
                            dataMemory(24) <= WRDATA(31 downto 24);
                            dataMemory(25) <= WRDATA(23 downto 16);
                            dataMemory(26) <= WRDATA(15 downto 8);
                            dataMemory(27) <= WRDATA(7 downto 0);

                        when X"1C" =>
                            dataMemory(28) <= WRDATA(31 downto 24);
                            dataMemory(29) <= WRDATA(23 downto 16);
                            dataMemory(30) <= WRDATA(15 downto 8);
                            dataMemory(31) <= WRDATA(7 downto 0);

                        when X"20" =>
                            dataMemory(32) <= WRDATA(31 downto 24);
                            dataMemory(33) <= WRDATA(23 downto 16);
                            dataMemory(34) <= WRDATA(15 downto 8);
                            dataMemory(35) <= WRDATA(7 downto 0);

                        when X"24" =>
                            dataMemory(36) <= WRDATA(31 downto 24);
                            dataMemory(37) <= WRDATA(23 downto 16);
                            dataMemory(38) <= WRDATA(15 downto 8);
                            dataMemory(39) <= WRDATA(7 downto 0);

                        when X"28" =>
                            dataMemory(40) <= WRDATA(31 downto 24);
                            dataMemory(41) <= WRDATA(23 downto 16);
                            dataMemory(42) <= WRDATA(15 downto 8);
                            dataMemory(43) <= WRDATA(7 downto 0);

                        when X"2C" =>
                            dataMemory(44) <= WRDATA(31 downto 24);
                            dataMemory(45) <= WRDATA(23 downto 16);
                            dataMemory(46) <= WRDATA(15 downto 8);
                            dataMemory(47) <= WRDATA(7 downto 0);

                        when X"30" =>
                            dataMemory(48) <= WRDATA(31 downto 24);
                            dataMemory(49) <= WRDATA(23 downto 16);
                            dataMemory(50) <= WRDATA(15 downto 8);
                            dataMemory(51) <= WRDATA(7 downto 0);

                        when X"34" =>
                            dataMemory(52) <= WRDATA(31 downto 24);
                            dataMemory(53) <= WRDATA(23 downto 16);
                            dataMemory(54) <= WRDATA(15 downto 8);
                            dataMemory(55) <= WRDATA(7 downto 0);

                        when X"38" =>
                            dataMemory(56) <= WRDATA(31 downto 24);
                            dataMemory(57) <= WRDATA(23 downto 16);
                            dataMemory(58) <= WRDATA(15 downto 8);
                            dataMemory(59) <= WRDATA(7 downto 0);

                        when X"3C" =>
                            dataMemory(60) <= WRDATA(31 downto 24);
                            dataMemory(61) <= WRDATA(23 downto 16);
                            dataMemory(62) <= WRDATA(15 downto 8);
                            dataMemory(63) <= WRDATA(7 downto 0);

                        when X"40" =>
                            dataMemory(64) <= WRDATA(31 downto 24);
                            dataMemory(65) <= WRDATA(23 downto 16);
                            dataMemory(66) <= WRDATA(15 downto 8);
                            dataMemory(67) <= WRDATA(7 downto 0);

                        when X"44" =>
                            dataMemory(68) <= WRDATA(31 downto 24);
                            dataMemory(69) <= WRDATA(23 downto 16);
                            dataMemory(70) <= WRDATA(15 downto 8);
                            dataMemory(71) <= WRDATA(7 downto 0);

                        when X"48" =>
                            dataMemory(72) <= WRDATA(31 downto 24);
                            dataMemory(73) <= WRDATA(23 downto 16);
                            dataMemory(74) <= WRDATA(15 downto 8);
                            dataMemory(75) <= WRDATA(7 downto 0);

                        when X"4C" =>
                            dataMemory(76) <= WRDATA(31 downto 24);
                            dataMemory(77) <= WRDATA(23 downto 16);
                            dataMemory(78) <= WRDATA(15 downto 8);
                            dataMemory(79) <= WRDATA(7 downto 0);

                        when X"50" =>
                            dataMemory(80) <= WRDATA(31 downto 24);
                            dataMemory(81) <= WRDATA(23 downto 16);
                            dataMemory(82) <= WRDATA(15 downto 8);
                            dataMemory(83) <= WRDATA(7 downto 0);

                        when X"54" =>
                            dataMemory(84) <= WRDATA(31 downto 24);
                            dataMemory(85) <= WRDATA(23 downto 16);
                            dataMemory(86) <= WRDATA(15 downto 8);
                            dataMemory(87) <= WRDATA(7 downto 0);

                        when X"58" =>
                            dataMemory(88) <= WRDATA(31 downto 24);
                            dataMemory(89) <= WRDATA(23 downto 16);
                            dataMemory(90) <= WRDATA(15 downto 8);
                            dataMemory(91) <= WRDATA(7 downto 0);

                        when X"5C" =>
                            dataMemory(92) <= WRDATA(31 downto 24);
                            dataMemory(93) <= WRDATA(23 downto 16);
                            dataMemory(94) <= WRDATA(15 downto 8);
                            dataMemory(95) <= WRDATA(7 downto 0);

                        when X"60" =>
                            dataMemory(96) <= WRDATA(31 downto 24);
                            dataMemory(97) <= WRDATA(23 downto 16);
                            dataMemory(98) <= WRDATA(15 downto 8);
                            dataMemory(99) <= WRDATA(7 downto 0);

                        when X"64" =>
                            dataMemory(100) <= WRDATA(31 downto 24);
                            dataMemory(101) <= WRDATA(23 downto 16);
                            dataMemory(102) <= WRDATA(15 downto 8);
                            dataMemory(103) <= WRDATA(7 downto 0);

                        when X"68" =>
                            dataMemory(104) <= WRDATA(31 downto 24);
                            dataMemory(105) <= WRDATA(23 downto 16);
                            dataMemory(106) <= WRDATA(15 downto 8);
                            dataMemory(107) <= WRDATA(7 downto 0);

                        when X"6C" =>
                            dataMemory(108) <= WRDATA(31 downto 24);
                            dataMemory(109) <= WRDATA(23 downto 16);
                            dataMemory(110) <= WRDATA(15 downto 8);
                            dataMemory(111) <= WRDATA(7 downto 0);

                        when X"70" =>
                            dataMemory(112) <= WRDATA(31 downto 24);
                            dataMemory(113) <= WRDATA(23 downto 16);
                            dataMemory(114) <= WRDATA(15 downto 8);
                            dataMemory(115) <= WRDATA(7 downto 0);

                        when X"74" =>
                            dataMemory(116) <= WRDATA(31 downto 24);
                            dataMemory(117) <= WRDATA(23 downto 16);
                            dataMemory(118) <= WRDATA(15 downto 8);
                            dataMemory(119) <= WRDATA(7 downto 0);

                        when X"78" =>
                            dataMemory(120) <= WRDATA(31 downto 24);
                            dataMemory(121) <= WRDATA(23 downto 16);
                            dataMemory(122) <= WRDATA(15 downto 8);
                            dataMemory(123) <= WRDATA(7 downto 0);

                        when X"7C" =>
                            dataMemory(124) <= WRDATA(31 downto 24);
                            dataMemory(125) <= WRDATA(23 downto 16);
                            dataMemory(126) <= WRDATA(15 downto 8);
                            dataMemory(127) <= WRDATA(7 downto 0);

                        when X"80" =>
                            dataMemory(128) <= WRDATA(31 downto 24);
                            dataMemory(129) <= WRDATA(23 downto 16);
                            dataMemory(130) <= WRDATA(15 downto 8);
                            dataMemory(131) <= WRDATA(7 downto 0);

                        when X"84" =>
                            dataMemory(132) <= WRDATA(31 downto 24);
                            dataMemory(133) <= WRDATA(23 downto 16);
                            dataMemory(134) <= WRDATA(15 downto 8);
                            dataMemory(135) <= WRDATA(7 downto 0);

                        when X"88" =>
                            dataMemory(136) <= WRDATA(31 downto 24);
                            dataMemory(137) <= WRDATA(23 downto 16);
                            dataMemory(138) <= WRDATA(15 downto 8);
                            dataMemory(139) <= WRDATA(7 downto 0);

                        when X"8C" =>
                            dataMemory(140) <= WRDATA(31 downto 24);
                            dataMemory(141) <= WRDATA(23 downto 16);
                            dataMemory(142) <= WRDATA(15 downto 8);
                            dataMemory(143) <= WRDATA(7 downto 0);

                        when X"90" =>
                            dataMemory(144) <= WRDATA(31 downto 24);
                            dataMemory(145) <= WRDATA(23 downto 16);
                            dataMemory(146) <= WRDATA(15 downto 8);
                            dataMemory(147) <= WRDATA(7 downto 0);

                        when X"94" =>
                            dataMemory(148) <= WRDATA(31 downto 24);
                            dataMemory(149) <= WRDATA(23 downto 16);
                            dataMemory(150) <= WRDATA(15 downto 8);
                            dataMemory(151) <= WRDATA(7 downto 0);

                        when X"98" =>
                            dataMemory(152) <= WRDATA(31 downto 24);
                            dataMemory(153) <= WRDATA(23 downto 16);
                            dataMemory(154) <= WRDATA(15 downto 8);
                            dataMemory(155) <= WRDATA(7 downto 0);

                        when X"9C" =>
                            dataMemory(156) <= WRDATA(31 downto 24);
                            dataMemory(157) <= WRDATA(23 downto 16);
                            dataMemory(158) <= WRDATA(15 downto 8);
                            dataMemory(159) <= WRDATA(7 downto 0);

                        when X"A0" =>
                            dataMemory(160) <= WRDATA(31 downto 24);
                            dataMemory(161) <= WRDATA(23 downto 16);
                            dataMemory(162) <= WRDATA(15 downto 8);
                            dataMemory(163) <= WRDATA(7 downto 0);

                        when X"A4" =>
                            dataMemory(164) <= WRDATA(31 downto 24);
                            dataMemory(165) <= WRDATA(23 downto 16);
                            dataMemory(166) <= WRDATA(15 downto 8);
                            dataMemory(167) <= WRDATA(7 downto 0);

                        when X"A8" =>
                            dataMemory(168) <= WRDATA(31 downto 24);
                            dataMemory(169) <= WRDATA(23 downto 16);
                            dataMemory(170) <= WRDATA(15 downto 8);
                            dataMemory(171) <= WRDATA(7 downto 0);

                        when X"AC" =>
                            dataMemory(172) <= WRDATA(31 downto 24);
                            dataMemory(173) <= WRDATA(23 downto 16);
                            dataMemory(174) <= WRDATA(15 downto 8);
                            dataMemory(175) <= WRDATA(7 downto 0);

                        when X"B0" =>
                            dataMemory(176) <= WRDATA(31 downto 24);
                            dataMemory(177) <= WRDATA(23 downto 16);
                            dataMemory(178) <= WRDATA(15 downto 8);
                            dataMemory(179) <= WRDATA(7 downto 0);

                        when X"B4" =>
                            dataMemory(180) <= WRDATA(31 downto 24);
                            dataMemory(181) <= WRDATA(23 downto 16);
                            dataMemory(182) <= WRDATA(15 downto 8);
                            dataMemory(183) <= WRDATA(7 downto 0);

                        when X"B8" =>
                            dataMemory(184) <= WRDATA(31 downto 24);
                            dataMemory(185) <= WRDATA(23 downto 16);
                            dataMemory(186) <= WRDATA(15 downto 8);
                            dataMemory(187) <= WRDATA(7 downto 0);

                        when X"BC" =>
                            dataMemory(188) <= WRDATA(31 downto 24);
                            dataMemory(189) <= WRDATA(23 downto 16);
                            dataMemory(190) <= WRDATA(15 downto 8);
                            dataMemory(191) <= WRDATA(7 downto 0);

                        when X"C0" =>
                            dataMemory(192) <= WRDATA(31 downto 24);
                            dataMemory(193) <= WRDATA(23 downto 16);
                            dataMemory(194) <= WRDATA(15 downto 8);
                            dataMemory(195) <= WRDATA(7 downto 0);

                        when X"C4" =>
                            dataMemory(196) <= WRDATA(31 downto 24);
                            dataMemory(197) <= WRDATA(23 downto 16);
                            dataMemory(198) <= WRDATA(15 downto 8);
                            dataMemory(199) <= WRDATA(7 downto 0);

                        when X"C8" =>
                            dataMemory(200) <= WRDATA(31 downto 24);
                            dataMemory(201) <= WRDATA(23 downto 16);
                            dataMemory(202) <= WRDATA(15 downto 8);
                            dataMemory(203) <= WRDATA(7 downto 0);

                        when X"CC" =>
                            dataMemory(204) <= WRDATA(31 downto 24);
                            dataMemory(205) <= WRDATA(23 downto 16);
                            dataMemory(206) <= WRDATA(15 downto 8);
                            dataMemory(207) <= WRDATA(7 downto 0);

                        when X"D0" =>
                            dataMemory(208) <= WRDATA(31 downto 24);
                            dataMemory(209) <= WRDATA(23 downto 16);
                            dataMemory(210) <= WRDATA(15 downto 8);
                            dataMemory(211) <= WRDATA(7 downto 0);

                        when X"D4" =>
                            dataMemory(212) <= WRDATA(31 downto 24);
                            dataMemory(213) <= WRDATA(23 downto 16);
                            dataMemory(214) <= WRDATA(15 downto 8);
                            dataMemory(215) <= WRDATA(7 downto 0);

                        when X"D8" =>
                            dataMemory(216) <= WRDATA(31 downto 24);
                            dataMemory(217) <= WRDATA(23 downto 16);
                            dataMemory(218) <= WRDATA(15 downto 8);
                            dataMemory(219) <= WRDATA(7 downto 0);
                            
                        when X"DC" =>
                            dataMemory(220) <= WRDATA(31 downto 24);
                            dataMemory(221) <= WRDATA(23 downto 16);
                            dataMemory(222) <= WRDATA(15 downto 8);
                            dataMemory(223) <= WRDATA(7 downto 0);

                        when X"E0" =>
                            dataMemory(224) <= WRDATA(31 downto 24);
                            dataMemory(225) <= WRDATA(23 downto 16);
                            dataMemory(226) <= WRDATA(15 downto 8);
                            dataMemory(227) <= WRDATA(7 downto 0);

                        when X"E4" =>
                            dataMemory(228) <= WRDATA(31 downto 24);
                            dataMemory(229) <= WRDATA(23 downto 16);
                            dataMemory(230) <= WRDATA(15 downto 8);
                            dataMemory(231) <= WRDATA(7 downto 0);

                        when X"E8" =>
                            dataMemory(232) <= WRDATA(31 downto 24);
                            dataMemory(233) <= WRDATA(23 downto 16);
                            dataMemory(234) <= WRDATA(15 downto 8);
                            dataMemory(235) <= WRDATA(7 downto 0);

                        when X"EC" =>
                            dataMemory(236) <= WRDATA(31 downto 24);
                            dataMemory(237) <= WRDATA(23 downto 16);
                            dataMemory(238) <= WRDATA(15 downto 8);
                            dataMemory(239) <= WRDATA(7 downto 0);

                        when X"F0" =>
                            dataMemory(240) <= WRDATA(31 downto 24);
                            dataMemory(241) <= WRDATA(23 downto 16);
                            dataMemory(242) <= WRDATA(15 downto 8);
                            dataMemory(243) <= WRDATA(7 downto 0);

                        when X"F4" =>
                            dataMemory(244) <= WRDATA(31 downto 24);
                            dataMemory(245) <= WRDATA(23 downto 16);
                            dataMemory(246) <= WRDATA(15 downto 8);
                            dataMemory(247) <= WRDATA(7 downto 0);

                        when X"F8" =>
                            dataMemory(248) <= WRDATA(31 downto 24);
                            dataMemory(249) <= WRDATA(23 downto 16);
                            dataMemory(250) <= WRDATA(15 downto 8);
                            dataMemory(251) <= WRDATA(7 downto 0);

                        when X"FC" =>
                            dataMemory(252) <= WRDATA(31 downto 24);
                            dataMemory(253) <= WRDATA(23 downto 16);
                            dataMemory(254) <= WRDATA(15 downto 8);
                            dataMemory(255) <= WRDATA(7 downto 0);
                            
                        when others => null;
                    end case;
                end if;
        end process;

        readMem : process(CLK, ADDRESS, MEMREAD)
            begin
                if MEMREAD = '1' then
                    case ADDRESS(7 downto 0) is
                        when X"00" =>
                            DATAOUT <= dataMemory(0) & dataMemory(1) & dataMemory(2) & dataMemory(3);

                        when X"04" =>
                            DATAOUT <= dataMemory(4) & dataMemory(5) & dataMemory(6) & dataMemory(7);

                        when X"08" =>
                            DATAOUT <= dataMemory(8) & dataMemory(9) & dataMemory(10) & dataMemory(11);

                        when X"0C" =>
                            DATAOUT <= dataMemory(12) & dataMemory(13) & dataMemory(14) & dataMemory(15);

                        when X"10" =>
                            DATAOUT <= dataMemory(16) & dataMemory(17) & dataMemory(18) & dataMemory(19);

                        when X"14" =>
                            DATAOUT <= dataMemory(20) & dataMemory(21) & dataMemory(22) & dataMemory(23);

                        when X"18" =>
                            DATAOUT <= dataMemory(24) & dataMemory(25) & dataMemory(26) & dataMemory(27);

                        when X"1C" =>
                            DATAOUT <= dataMemory(28) & dataMemory(29) & dataMemory(30) & dataMemory(31);

                        when X"20" =>
                            DATAOUT <= dataMemory(32) & dataMemory(33) & dataMemory(34) & dataMemory(35);

                        when X"24" =>
                            DATAOUT <= dataMemory(36) & dataMemory(37) & dataMemory(38) & dataMemory(39);

                        when X"28" =>
                            DATAOUT <= dataMemory(40) & dataMemory(41) & dataMemory(42) & dataMemory(43);

                        when X"2C" =>
                            DATAOUT <= dataMemory(44) & dataMemory(45) & dataMemory(46) & dataMemory(47);

                        when X"30" =>
                            DATAOUT <= dataMemory(48) & dataMemory(49) & dataMemory(50) & dataMemory(51);

                        when X"34" =>
                            DATAOUT <= dataMemory(52) & dataMemory(53) & dataMemory(54) & dataMemory(55);

                        when X"38" =>
                            DATAOUT <= dataMemory(56) & dataMemory(57) & dataMemory(58) & dataMemory(59);

                        when X"3C" =>
                            DATAOUT <= dataMemory(60) & dataMemory(61) & dataMemory(62) & dataMemory(63);

                        when X"40" =>
                            DATAOUT <= dataMemory(64) & dataMemory(65) & dataMemory(66) & dataMemory(67);

                        when X"44" =>
                            DATAOUT <= dataMemory(68) & dataMemory(69) & dataMemory(70) & dataMemory(71);

                        when X"48" =>
                            DATAOUT <= dataMemory(72) & dataMemory(73) & dataMemory(74) & dataMemory(75);

                        when X"4C" =>
                            DATAOUT <= dataMemory(76) & dataMemory(77) & dataMemory(78) & dataMemory(79);

                        when X"50" =>
                            DATAOUT <= dataMemory(80) & dataMemory(81) & dataMemory(82) & dataMemory(83);

                        when X"54" =>
                            DATAOUT <= dataMemory(84) & dataMemory(85) & dataMemory(86) & dataMemory(87);

                        when X"58" =>
                            DATAOUT <= dataMemory(88) & dataMemory(89) & dataMemory(90) & dataMemory(91);
                            
                        when X"5C" =>
                            DATAOUT <= dataMemory(92) & dataMemory(93) & dataMemory(94) & dataMemory(95);

                        when X"60" =>
                            DATAOUT <= dataMemory(96) & dataMemory(97) & dataMemory(98) & dataMemory(99);

                        when X"64" =>
                            DATAOUT <= dataMemory(100) & dataMemory(101) & dataMemory(102) & dataMemory(103);

                        when X"68" =>
                            DATAOUT <= dataMemory(104) & dataMemory(105) & dataMemory(106) & dataMemory(107);

                        when X"6C" =>
                            DATAOUT <= dataMemory(108) & dataMemory(109) & dataMemory(110) & dataMemory(111);

                        when X"70" =>
                            DATAOUT <= dataMemory(112) & dataMemory(113) & dataMemory(114) & dataMemory(115);

                        when X"74" =>
                            DATAOUT <= dataMemory(116) & dataMemory(117) & dataMemory(118) & dataMemory(119);

                        when X"78" =>
                            DATAOUT <= dataMemory(120) & dataMemory(121) & dataMemory(122) & dataMemory(123);

                        when X"7C" =>
                            DATAOUT <= dataMemory(124) & dataMemory(125) & dataMemory(126) & dataMemory(127);

                        when X"80" =>
                            DATAOUT <= dataMemory(128) & dataMemory(129) & dataMemory(130) & dataMemory(131);

                        when X"84" =>
                            DATAOUT <= dataMemory(132) & dataMemory(133) & dataMemory(134) & dataMemory(135);

                        when X"88" =>
                            DATAOUT <= dataMemory(136) & dataMemory(137) & dataMemory(138) & dataMemory(139);

                        when X"8C" =>
                            DATAOUT <= dataMemory(140) & dataMemory(141) & dataMemory(142) & dataMemory(143);

                        when X"90" =>
                            DATAOUT <= dataMemory(144) & dataMemory(145) & dataMemory(146) & dataMemory(147);

                        when X"94" =>
                            DATAOUT <= dataMemory(148) & dataMemory(149) & dataMemory(150) & dataMemory(151);

                        when X"98" =>
                            DATAOUT <= dataMemory(152) & dataMemory(153) & dataMemory(154) & dataMemory(155);

                        when X"9C" =>
                            DATAOUT <= dataMemory(156) & dataMemory(157) & dataMemory(158) & dataMemory(159);

                        when X"A0" =>
                            DATAOUT <= dataMemory(160) & dataMemory(161) & dataMemory(162) & dataMemory(163);

                        when X"A4" =>
                            DATAOUT <= dataMemory(164) & dataMemory(165) & dataMemory(166) & dataMemory(167);

                        when X"A8" =>
                            DATAOUT <= dataMemory(168) & dataMemory(169) & dataMemory(170) & dataMemory(171);

                        when X"AC" =>
                            DATAOUT <= dataMemory(172) & dataMemory(173) & dataMemory(174) & dataMemory(175);

                        when X"B0" =>
                            DATAOUT <= dataMemory(176) & dataMemory(177) & dataMemory(178) & dataMemory(179);

                        when X"B4" =>
                            DATAOUT <= dataMemory(180) & dataMemory(181) & dataMemory(182) & dataMemory(183);

                        when X"B8" =>
                            DATAOUT <= dataMemory(184) & dataMemory(185) & dataMemory(186) & dataMemory(187);

                        when X"BC" =>
                            DATAOUT <= dataMemory(188) & dataMemory(189) & dataMemory(190) & dataMemory(191);

                        when X"C0" =>
                            DATAOUT <= dataMemory(192) & dataMemory(193) & dataMemory(194) & dataMemory(195);

                        when X"C4" =>
                            DATAOUT <= dataMemory(196) & dataMemory(197) & dataMemory(198) & dataMemory(199);

                        when X"C8" =>
                            DATAOUT <= dataMemory(200) & dataMemory(201) & dataMemory(202) & dataMemory(203);

                        when X"CC" =>
                            DATAOUT <= dataMemory(204) & dataMemory(205) & dataMemory(206) & dataMemory(207);

                        when X"D0" =>
                            DATAOUT <= dataMemory(208) & dataMemory(209) & dataMemory(210) & dataMemory(211);

                        when X"D4" =>
                            DATAOUT <= dataMemory(212) & dataMemory(213) & dataMemory(214) & dataMemory(215);

                        when X"D8" =>
                            DATAOUT <= dataMemory(216) & dataMemory(217) & dataMemory(218) & dataMemory(219);
                            
                        when X"DC" =>
                            DATAOUT <= dataMemory(220) & dataMemory(221) & dataMemory(222) & dataMemory(223);

                        when X"E0" =>
                            DATAOUT <= dataMemory(224) & dataMemory(225) & dataMemory(226) & dataMemory(227);

                        when X"E4" =>
                            DATAOUT <= dataMemory(228) & dataMemory(229) & dataMemory(230) & dataMemory(231);

                        when X"E8" =>
                            DATAOUT <= dataMemory(232) & dataMemory(233) & dataMemory(234) & dataMemory(235);

                        when X"EC" =>
                            DATAOUT <= dataMemory(236) & dataMemory(237) & dataMemory(238) & dataMemory(239);

                        when X"F0" =>
                            DATAOUT <= dataMemory(240) & dataMemory(241) & dataMemory(242) & dataMemory(243);

                        when X"F4" =>
                            DATAOUT <= dataMemory(244) & dataMemory(245) & dataMemory(246) & dataMemory(247);

                        when X"F8" =>
                            DATAOUT <= dataMemory(248) & dataMemory(249) & dataMemory(250) & dataMemory(251);

                        when X"FC" =>
                            DATAOUT <= dataMemory(252) & dataMemory(253) & dataMemory(254) & dataMemory(255);
                        when others => null;
                    end case;
                end if;
        end process;
        
end architecture behavior;