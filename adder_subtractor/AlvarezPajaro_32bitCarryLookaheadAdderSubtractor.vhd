-- 32-bit carry-lookahead adder/subtractor

library ieee;
library cs343;
use ieee.std_logic_1164.all;
use cs343.AlvarezPajaro_AdderSubtractor.AlvarezPajaro_fullAdderGP;


entity AlvarezPajaro_32bitCarrylookaheadAdderSubtractor is
    port(
        signal OP : in std_logic;
        signal X, Y : in std_logic_vector(31 downto 0);
        signal COUT, N, O, Z : out std_logic;
        signal R : out std_logic_vector(31 downto 0)
    );
end entity AlvarezPajaro_32bitCarrylookaheadAdderSubtractor;


architecture structure of AlvarezPajaro_32bitCarrylookaheadAdderSubtractor is
    -- intermediate signals
    signal operand, temp, gnerate, propagate, carry, result : std_logic_vector(31 downto 0);
    
    begin
        -- component instantiation
        adder0 : AlvarezPajaro_fullAdderGP
            port map(X => X(0), Y => operand(0), C => OP, S => result(0), G => gnerate(0), P => propagate(0));

        adder1 : AlvarezPajaro_fullAdderGP
            port map(X => X(1), Y => operand(1), C => carry(0), S => result(1), G => gnerate(1), P => propagate(1));

        adder2 : AlvarezPajaro_fullAdderGP
            port map(X => X(2), Y => operand(2), C => carry(1), S => result(2), G => gnerate(2), P => propagate(2));

        adder3 : AlvarezPajaro_fullAdderGP
            port map(X => X(3), Y => operand(3), C => carry(2), S => result(3), G => gnerate(3), P => propagate(3));

        adder4 : AlvarezPajaro_fullAdderGP
            port map(X => X(4), Y => operand(4), C => carry(3), S => result(4), G => gnerate(4), P => propagate(4));

        adder5 : AlvarezPajaro_fullAdderGP
            port map(X => X(5), Y => operand(5), C => carry(4), S => result(5), G => gnerate(5), P => propagate(5));

        adder6 : AlvarezPajaro_fullAdderGP
            port map(X => X(6), Y => operand(6), C => carry(5), S => result(6), G => gnerate(6), P => propagate(6));

        adder7 : AlvarezPajaro_fullAdderGP
            port map(X => X(7), Y => operand(7), C => carry(6), S => result(7), G => gnerate(7), P => propagate(7));

        adder8 : AlvarezPajaro_fullAdderGP
            port map(X => X(8), Y => operand(8), C => carry(7), S => result(8), G => gnerate(8), P => propagate(8));

        adder9 : AlvarezPajaro_fullAdderGP
            port map(X => X(9), Y => operand(9), C => carry(8), S => result(9), G => gnerate(9), P => propagate(9));

        adder10 : AlvarezPajaro_fullAdderGP
            port map(X => X(10), Y => operand(10), C => carry(9), S => result(10), G => gnerate(10), P => propagate(10));

        adder11 : AlvarezPajaro_fullAdderGP
            port map(X => X(11), Y => operand(11), C => carry(10), S => result(11), G => gnerate(11), P => propagate(11));

        adder12 : AlvarezPajaro_fullAdderGP
            port map(X => X(12), Y => operand(12), C => carry(11), S => result(12), G => gnerate(12), P => propagate(12));

        adder13 : AlvarezPajaro_fullAdderGP
            port map(X => X(13), Y => operand(13), C => carry(12), S => result(13), G => gnerate(13), P => propagate(13));

        adder14 : AlvarezPajaro_fullAdderGP
            port map(X => X(14), Y => operand(14), C => carry(13), S => result(14), G => gnerate(14), P => propagate(14));

        adder15 : AlvarezPajaro_fullAdderGP
            port map(X => X(15), Y => operand(15), C => carry(14), S => result(15), G => gnerate(15), P => propagate(15));

        adder16 : AlvarezPajaro_fullAdderGP
            port map(X => X(16), Y => operand(16), C => carry(15), S => result(16), G => gnerate(16), P => propagate(16));

        adder17 : AlvarezPajaro_fullAdderGP
            port map(X => X(17), Y => operand(17), C => carry(16), S => result(17), G => gnerate(17), P => propagate(17));

        adder18 : AlvarezPajaro_fullAdderGP
            port map(X => X(18), Y => operand(18), C => carry(17), S => result(18), G => gnerate(18), P => propagate(18));

        adder19 : AlvarezPajaro_fullAdderGP
            port map(X => X(19), Y => operand(19), C => carry(18), S => result(19), G => gnerate(19), P => propagate(19));

        adder20 : AlvarezPajaro_fullAdderGP
            port map(X => X(20), Y => operand(20), C => carry(19), S => result(20), G => gnerate(20), P => propagate(20));

        adder21 : AlvarezPajaro_fullAdderGP
            port map(X => X(21), Y => operand(21), C => carry(20), S => result(21), G => gnerate(21), P => propagate(21));

        adder22 : AlvarezPajaro_fullAdderGP
            port map(X => X(22), Y => operand(22), C => carry(21), S => result(22), G => gnerate(22), P => propagate(22));

        adder23 : AlvarezPajaro_fullAdderGP
            port map(X => X(23), Y => operand(23), C => carry(22), S => result(23), G => gnerate(23), P => propagate(23));

        adder24 : AlvarezPajaro_fullAdderGP
            port map(X => X(24), Y => operand(24), C => carry(23), S => result(24), G => gnerate(24), P => propagate(24));

        adder25 : AlvarezPajaro_fullAdderGP
            port map(X => X(25), Y => operand(25), C => carry(24), S => result(25), G => gnerate(25), P => propagate(25));

        adder26 : AlvarezPajaro_fullAdderGP
            port map(X => X(26), Y => operand(26), C => carry(25), S => result(26), G => gnerate(26), P => propagate(26));

        adder27 : AlvarezPajaro_fullAdderGP
            port map(X => X(27), Y => operand(27), C => carry(26), S => result(27), G => gnerate(27), P => propagate(27));

        adder28 : AlvarezPajaro_fullAdderGP
            port map(X => X(28), Y => operand(28), C => carry(27), S => result(28), G => gnerate(28), P => propagate(28));

        adder29 : AlvarezPajaro_fullAdderGP
            port map(X => X(29), Y => operand(29), C => carry(28), S => result(29), G => gnerate(29), P => propagate(29));

        adder30 : AlvarezPajaro_fullAdderGP
            port map(X => X(30), Y => operand(30), C => carry(29), S => result(30), G => gnerate(30), P => propagate(30));

        adder31 : AlvarezPajaro_fullAdderGP
            port map(X => X(31), Y => operand(31), C => carry(30), S => result(31), G => gnerate(31), P => propagate(31));

        -- complement input Y for subtraction
        temp <= (others => OP);
        operand <= Y xor temp;

        -- compute carries
        carry(0) <= gnerate(0) or (propagate(0) and OP);
        carry(1) <= gnerate(1) or (propagate(1) and carry(0));
        carry(2) <= gnerate(2) or (propagate(2) and carry(1));
        carry(3) <= gnerate(3) or (propagate(3) and carry(2));
        carry(4) <= gnerate(4) or (propagate(4) and carry(3));
        carry(5) <= gnerate(5) or (propagate(5) and carry(4));
        carry(6) <= gnerate(6) or (propagate(6) and carry(5));
        carry(7) <= gnerate(7) or (propagate(7) and carry(6));
        carry(8) <= gnerate(8) or (propagate(8) and carry(7));
        carry(9) <= gnerate(9) or (propagate(9) and carry(8));
        carry(10) <= gnerate(10) or (propagate(10) and carry(9));
        carry(11) <= gnerate(11) or (propagate(11) and carry(10));
        carry(12) <= gnerate(12) or (propagate(12) and carry(11));
        carry(13) <= gnerate(13) or (propagate(13) and carry(12));
        carry(14) <= gnerate(14) or (propagate(14) and carry(13));
        carry(15) <= gnerate(15) or (propagate(15) and carry(14));
        carry(16) <= gnerate(16) or (propagate(16) and carry(15));
        carry(17) <= gnerate(17) or (propagate(17) and carry(16));
        carry(18) <= gnerate(18) or (propagate(18) and carry(17));
        carry(19) <= gnerate(19) or (propagate(19) and carry(18));
        carry(20) <= gnerate(20) or (propagate(20) and carry(19));
        carry(21) <= gnerate(21) or (propagate(21) and carry(20));
        carry(22) <= gnerate(22) or (propagate(22) and carry(21));
        carry(23) <= gnerate(23) or (propagate(23) and carry(22));
        carry(24) <= gnerate(24) or (propagate(24) and carry(23));
        carry(25) <= gnerate(25) or (propagate(25) and carry(24));
        carry(26) <= gnerate(26) or (propagate(26) and carry(25));
        carry(27) <= gnerate(27) or (propagate(27) and carry(26));
        carry(28) <= gnerate(28) or (propagate(28) and carry(27));
        carry(29) <= gnerate(29) or (propagate(29) and carry(28));
        carry(30) <= gnerate(30) or (propagate(30) and carry(29));
        carry(31) <= gnerate(31) or (propagate(31) and carry(30));
    
        COUT <= carry(31);
        N <= result(31);
        O <= carry(30) xor carry(31);
        Z <= not (result(0) or result(1) or result(2) or result(3) or result(4) or result(5) or result(6) or result(7) or result(8) or result(9) or result(10) or result(11) or result(12) or result(13) or result(14) or result(15) or result(16) or result(17) or result(18) or result(19) or result(20) or result(21) or result(22) or result(23) or result(24) or result(25) or result(26) or result(27) or result(28) or result(29) or result(30) or result(31));
        R <= result;     
end architecture structure;