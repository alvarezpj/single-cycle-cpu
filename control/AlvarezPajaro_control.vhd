-- main control unit

library ieee;
use ieee.std_logic_1164.all;


entity AlvarezPajaro_control is
    port(
        signal OPCODE : in std_logic_vector(5 downto 0);
        signal REGDST, ALUSRC, MEMTOREG, REGWRITE : out std_logic;
        signal MEMREAD, MEMWRITE, BRANCH, JUMP : out std_logic;
        signal ALUOP : out std_logic_vector(1 downto 0)  
    );
end entity AlvarezPajaro_control;


architecture behavior of AlvarezPajaro_control is
    begin
        
        process(OPCODE)
            begin
                case OPCODE is
                    when "000000" =>
                        REGDST <= '1';
                        ALUSRC <= '0';
                        MEMTOREG <= '0';
                        REGWRITE <= '1';
                        MEMREAD <= '0';
                        MEMWRITE <= '0';
                        BRANCH <= '0';
                        JUMP <= '0';
                        ALUOP <= "11";

                    when "100011" =>
                        REGDST <= '0';
                        ALUSRC <= '1';
                        MEMTOREG <= '1';
                        REGWRITE <= '1';
                        MEMREAD <= '1';
                        MEMWRITE <= '0';
                        BRANCH <= '0';
                        JUMP <= '0';
                        ALUOP <= "00";

                    when "101011" =>
                        REGDST <= '-';
                        ALUSRC <= '1';
                        MEMTOREG <= '-';
                        REGWRITE <= '0';
                        MEMREAD <= '0';
                        MEMWRITE <= '1';
                        BRANCH <= '0';
                        JUMP <= '0';
                        ALUOP <= "00";

                    when "000100" =>
                        REGDST <= '-';
                        ALUSRC <= '0';
                        MEMTOREG <= '-';
                        REGWRITE <= '0';
                        MEMREAD <= '0';
                        MEMWRITE <= '0';
                        BRANCH <= '1';
                        JUMP <= '0';
                        ALUOP <= "01";

                    when "000010" =>
                        REGDST <= '-';
                        ALUSRC <= '-';
                        MEMTOREG <= '-';
                        REGWRITE <= '0';
                        MEMREAD <= '0';
                        MEMWRITE <= '0';
                        BRANCH <= '0';
                        JUMP <= '1';
                        ALUOP <= "--";

                    when others => null;
                end case;
        end process;
end architecture behavior;