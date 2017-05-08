-- ALU control

library ieee;
use ieee.std_logic_1164.all;


entity AlvarezPajaro_ALUcontrol is
    port(
        signal ALUOP : in std_logic_vector(1 downto 0);
        signal FUNCT : in std_logic_vector(5 downto 0);
        signal OPCODE : out std_logic_vector(3 downto 0)
    );
end entity AlvarezPajaro_ALUcontrol;


architecture behavior of AlvarezPajaro_ALUcontrol is 
    begin

        process(ALUOP, FUNCT)
            begin

                case ALUOP is
                    when "00" => -- addition
                        OPCODE <= "0001";

                    when "01" => -- subtraction
                        OPCODE <= "0010";

                    when "10" => -- set on less than
                        OPCODE <= "1101";

                    when "11" => -- determined by funct code
                        case FUNCT is
                            when "100000" => -- 20h
                                OPCODE <= "0001"; -- add

                            when "100010" => -- 22h
                                OPCODE <= "0010"; -- sub                                

                            when "011000" => -- 18h
                                OPCODE <= "0011"; -- mult

                            when "011010" => -- 1ah
                                OPCODE <= "0100"; -- div

                            when "100100" => -- 24h
                                OPCODE <= "0101"; -- and

                            when "100101" => -- 25h
                                OPCODE <= "0110"; -- or

                            when "100111" => -- 27h
                                OPCODE <= "0111"; -- nor

                            when "100110" => -- 26h
                                OPCODE <= "1000"; -- xor

                            when "000000" => -- 00h
                                OPCODE <= "1001"; -- sll

                            when "000010" => -- 02h
                                OPCODE <= "1010"; -- srl

                            when "000100" => -- 04h
                                OPCODE <= "1011"; -- rol

                            when "000110" => -- 06h
                                OPCODE <= "1100"; -- ror

                            when "101010" => --2ah
                                OPCODE <= "1101"; -- slt

                            when others => null;
                        end case;

                    when others => null;
                end case;
        end process;
end architecture behavior;