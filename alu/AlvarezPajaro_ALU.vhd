-- ALU

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity AlvarezPajaro_ALU is
    port(
        signal OPCODE : in std_logic_vector(3 downto 0);
        signal SHAMT : in std_logic_vector(4 downto 0);
        signal X, Y : in std_logic_vector(31 downto 0);
        signal Z : out std_logic;
        signal R, LO, HI : out std_logic_vector(31 downto 0)
    );
end entity AlvarezPajaro_ALU;


architecture structure of AlvarezPajaro_ALU is
    -- intermediate signal

    begin

        operation : process(OPCODE, X, Y) -- may need to change
            -- variable declarations
            variable zeroflag : std_logic;
            variable result, quotient, remainder : std_logic_vector(31 downto 0);
            variable product : std_logic_vector(63 downto 0);

            begin
                case OPCODE is
                    when "0001" => -- addition 
                        result := std_logic_vector(signed(X) + signed(Y));
                        zeroflag := result(31);

                    when "0010" => -- subtraction 
                        result := std_logic_vector(signed(X) - signed(Y));
                        zeroflag := result(31);

                    when "0011" => -- multiplication
                        product := std_logic_vector(signed(X) * signed(Y));
                        zeroflag := product(63);
                        HI <= product(63 downto 32);
                        LO <= product(31 downto 0);

                    when "0100" => -- division
                        quotient := std_logic_vector(signed(X) / signed(Y));
                        remainder := std_logic_vector(signed(X) rem signed(Y));
                        zeroflag := quotient(31);
                        HI <= remainder;
                        LO <= quotient;

                    when "0101" => -- bitwise AND 
                        result := X and Y;
                        zeroflag := result(31);

                    when "0110" => -- bitwise OR 
                        result := X or Y;
                        zeroflag := result(31);

                    when "0111" => -- bitwise NOT (NOR) 
                        result := X nor Y;
                        zeroflag := result(31);

                    when "1000" =>-- bitwise XOR
                        result := X xor Y;
                        zeroflag := result(31);

                    when "1001" => -- shift left logical 
                        result := std_logic_vector(signed(Y) sll to_integer(unsigned(SHAMT)));
                        zeroflag := result(31);

                    when "1010" =>-- shift right logical 
                        result := std_logic_vector(signed(Y) srl to_integer(unsigned(SHAMT)));
                        zeroflag := result(31);

                    when "1011" => -- rotate left 
                        result := std_logic_vector(signed(Y) rol to_integer(unsigned(SHAMT)));
                        zeroflag := result(31);

                    when "1100" => -- rotate right 
                        result := std_logic_vector(signed(Y) ror to_integer(unsigned(SHAMT)));
                        zeroflag := result(31);

                    when "1101" => -- set on less than
                        if unsigned(X) < unsigned(Y) then
                            zeroflag := '1';
                        else 
                            zeroflag := '0';
                        end if;
                        
                    when others => null;
                end case;
                Z <= zeroflag;
                R <= result;
        end process;

end architecture structure;