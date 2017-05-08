-- package declaration for adders and subtractors. This package contains half adder,
-- full adder, 4-bit full adder, 4-bit subtractor and 8-bit adder-subtractor

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


package AlvarezPajaro_AdderSubtractor is
    -- is_overflow function definition
    function is_overflow(constant minuend, subtrahend : integer) return std_logic;

    function is_overflow2(constant addend1, addend2 : integer) return std_logic;

    function is_overflow3(constant minuend, subtrahend : integer) return std_logic;


    -- not gate component declaration
    component AlvarezPajaro_not
        port(
            signal INPUTBIT : in std_logic;
            signal OUTPUTBIT : out std_logic
        );
    end component AlvarezPajaro_not;


    -- half adder component declaration
    component AlvarezPajaro_halfAdder
        port(
            signal IN1, IN2 : in std_logic;
            signal SUM, CARRYOUT : out std_logic 
        );
    end component AlvarezPajaro_halfAdder;


    -- full adder component declaration
    component AlvarezPajaro_fullAdder
        port(
            signal INPUT1, INPUT2, CARRYIN : in std_logic;
            signal SUM, CARRYOUT : out std_logic
        );
    end component AlvarezPajaro_fullAdder;

    component AlvarezPajaro_fullAdder2
        port(
            signal INPUT1, INPUT2, CARRYIN : in std_logic;
            signal SUM, CARRYOUT : out std_logic
        );
    end component AlvarezPajaro_fullAdder2;

    component AlvarezPajaro_fullAdder3
        port(
            signal X, Y, Cin : in std_logic;
            signal S, Cout : out std_logic 
        );
    end component AlvarezPajaro_fullAdder3;

    component AlvarezPajaro_fullAdderGP
        port(
            signal X, Y, C : in std_logic; 
            signal S, G, P : out std_logic
        );
    end component AlvarezPajaro_fullAdderGP;

    -- half subtractor
    component AlvarezPajaro_halfSubtractor is
        port(
            signal X, Y : in std_logic;
            signal D, BOUT : out std_logic
        );
    end component AlvarezPajaro_halfSubtractor;

    -- full subtractor
    component AlvarezPajaro_fullSubtractor is
        port(
            X, Y, BIN : in std_logic;
            D, BOUT : out std_logic
        );
    end component AlvarezPajaro_fullSubtractor;

    -- 4-bit carry-lookahead unit component declaration 
    component AlvarezPajaro_4bitCarryLookaheadUnit
        port(
            signal Cin : in std_logic;
            signal G, P : in std_logic_vector(3 downto 0);
            signal Cout : out std_logic_vector(3 downto 0);
            signal GT, PG : out std_logic
        );
    end component AlvarezPajaro_4bitCarryLookaheadUnit;


    -- 4-bit adder component declaration
    component AlvarezPajaro_4bitAdder
        port(
            signal NIBBLE1, NIBBLE2 : in std_logic_vector(3 downto 0);
            signal CARRYIN : in std_logic;
            signal SUM : out std_logic_vector(3 downto 0);
            signal CARRYOUT : out std_logic 
        );
    end component AlvarezPajaro_4bitAdder;

    component AlvarezPajaro_4bitRippleCarryAdder
        port(
            signal X, Y : in std_logic_vector(3 downto 0);
            signal Cin : in std_logic;
            signal S : out std_logic_vector(3 downto 0);
            signal Cout, O, N, Z : out std_logic
        );
    end component AlvarezPajaro_4bitRippleCarryAdder;

    component AlvarezPajaro_4bitCarryLookaheadAdder
        port(
            signal X, Y : in std_logic_vector(3 downto 0);
            signal Cin : in std_logic;
            signal S : out std_logic_vector(3 downto 0);
            signal Cout, O, N, Z, G, P : out std_logic
        );
    end component AlvarezPajaro_4bitCarryLookaheadAdder;   

    -- 8-bit adder
    component AlvarezPajaro_8bitAdder is
        port(
            signal CIN : in std_logic;
            signal A, B : in unsigned(7 downto 0);
            signal OVERFLOW : out std_logic;
            signal SUM : out unsigned(7 downto 0)
        );
    end component AlvarezPajaro_8bitAdder;

    -- 4-bit subtractor component declaration
    component AlvarezPajaro_4bitSubtractor
        port(
            signal NIBBLE1, NIBBLE2 : in std_logic_vector(3 downto 0);
            signal CARRYIN : in std_logic;
            signal DIFFERENCE : out std_logic_vector(3 downto 0);
            signal O, N, Z : out std_logic 
        );
    end component AlvarezPajaro_4bitSubtractor;


    -- 8-bit adder-subtractor component declaration
    component AlvarezPajaro_8bitAdderSubtractor
        port(
            signal BYTE1, BYTE2 : in std_logic_vector(7 downto 0);
            signal OPERATION : in std_logic;
            signal RESULT : out std_logic_vector(7 downto 0);
            signal CARRYOUT, O, N, Z : out std_logic
        );
    end component AlvarezPajaro_8bitAdderSubtractor; 

    component AlvarezPajaro_8bitAdderSubtractor2
        port(
            signal X, Y : in std_logic_vector(7 downto 0);
            signal OP, EN : in std_logic;
            signal RESULT : out std_logic_vector(7 downto 0);
            signal Cout, O, N, Z : out std_logic
        );
    end component AlvarezPajaro_8bitAdderSubtractor2;

    component AlvarezPajaro_8bitAdderSubtractor3 is
        port(
            signal OP : in std_logic;
            signal A, B : in signed(7 downto 0);
            signal OVERFLOW : out std_logic;
            signal R : out signed(7 downto 0)
        );
    end component AlvarezPajaro_8bitAdderSubtractor3;

    component AlvarezPajaro_8bitCarryLookaheadAdderSubtractor
        port (
            signal X, Y : in std_logic_vector(7 downto 0);
            signal OP : in std_logic;
            signal RESULT : out std_logic_vector(7 downto 0);
            signal O, G, P : out std_logic
        );
    end component AlvarezPajaro_8bitCarryLookaheadAdderSubtractor;

    component AlvarezPajaro_8bitCarryLookaheadUnit is
        port(
            signal G, P : in std_logic_vector(7 downto 0);
            signal Cin : in std_logic;
            signal Cout : out std_logic_vector(7 downto 0);
            signal GT, PT : out std_logic
        );
    end component AlvarezPajaro_8bitCarryLookaheadUnit;

    -- 32-bit carry-lookahead adder/subtractor
    component AlvarezPajaro_32bitCarrylookaheadAdderSubtractor is
        port(
            signal OP : in std_logic;
            signal X, Y : in std_logic_vector(31 downto 0);
            signal COUT, N, O, Z : out std_logic;
            signal R : out std_logic_vector(31 downto 0)
        );
    end component AlvarezPajaro_32bitCarrylookaheadAdderSubtractor;

    -- multipliers
    component AlvarezPajaro_4bitArrayMultiplier is
        port(
            signal A, B : in std_logic_vector(3 downto 0);
            signal P : out std_logic_vector(7 downto 0)
        );  
    end component AlvarezPajaro_4bitArrayMultiplier;

    component AlvarezPajaro_8bitArrayMultiplier is
        port(
            signal X, Y : in std_logic_vector(7 downto 0);
            signal P : out std_logic_vector(15 downto 0)
        );
    end component AlvarezPajaro_8bitArrayMultiplier;

    component AlvarezPajaro_8bitMultiplier is
        port(
            signal X, Y : in std_logic_vector(7 downto 0);
            signal P : out std_logic_vector(15 downto 0)
        );
    end component AlvarezPajaro_8bitMultiplier;

    -- 8-bit tree adder
    component AlvarezPajaro_8bitTreeAdder is
        port(
            signal CIN : in std_logic_vector(6 downto 0);
            signal X : in std_logic_vector(7 downto 0);
            signal S : out std_logic;
            signal COUT : out std_logic_vector(6 downto 0)
        );
    end component AlvarezPajaro_8bitTreeAdder;

    -- division cells
    component AlvarezPajaro_divisionCell1 is
        port(
            signal M, S, BIN, CS : in std_logic;
            signal BOUT, O, CSO : out std_logic
     );
    end component AlvarezPajaro_divisionCell1;

    component AlvarezPajaro_divisionCell2 is
        port(
            signal M, S, CS : in std_logic;
            signal BOUT, O, CSO : out std_logic
        );
    end component AlvarezPajaro_divisionCell2;

    -- 4-bit divider
    component AlvarezPajaro_4bitDivider is
        port(
            signal M, N : in std_logic_vector(3 downto 0);
            signal Q, R : out std_logic_vector(3 downto 0)
        );
    end component AlvarezPajaro_4bitDivider;

end package AlvarezPajaro_AdderSubtractor;


package body AlvarezPajaro_AdderSubtractor is
    function is_overflow(constant minuend, subtrahend : integer) return std_logic is
        begin
            if((minuend - subtrahend) < -8) then
                return '1';
            elsif((minuend - subtrahend) > 7) then
                return '1';
            else 
                return '0';
            end if;
    end function;


    function is_overflow2(constant addend1, addend2 : integer) return std_logic is
        begin
            if((addend1 + addend2) < -128) then
                return '1';
            elsif((addend1 + addend2) > 127) then
                return '1';
            else 
                return '0';
            end if;
    end function;


    function is_overflow3(constant minuend, subtrahend : integer) return std_logic is
        begin
            if((minuend - subtrahend) < -128) then
                return '1';
            elsif((minuend - subtrahend) > 127) then
                return '1';
            else 
                return '0';
            end if;
    end function;
end package body AlvarezPajaro_AdderSubtractor;