-- package declaration for single cycle CPU functional units

library ieee;
use ieee.std_logic_1164.all;


package AlvarezPajaro_singleCycle is
    -- clock
    component AlvarezPajaro_1HzClock2 is
        port(
	        signal CLK_50MHZ : in std_logic;
	        signal CLK_1HZ : out std_logic
        );
    end component AlvarezPajaro_1HzClock2;    

    -- program counter
    component AlvarezPajaro_programCounter is
        port(
            signal CLK, RESET : in std_logic;
            signal A : in std_logic_vector(31 downto 0);
            signal PC : inout std_logic_vector(31 downto 0)
        );
    end component AlvarezPajaro_programCounter;    

    -- shift register
    component AlvarezPajaro_shiftRegister2 is 
        port(
            signal SHIFT, CLK : in std_logic;
            signal LOAD : in std_logic_vector(7 downto 0);
            signal Q : out std_logic_vector(31 downto 0)
        );
    end component AlvarezPajaro_shiftRegister2;

    -- instruction memory
    component AlvarezPajaro_128x8InstructionMemory is  
        port(
            signal CLK, MEMWRITE : in std_logic;
            signal RDADDRESS, WRADDRESS, WRDATA : in std_logic_vector(31 downto 0);
            signal INSTRUCTION : out std_logic_vector(31 downto 0)
        );
    end component AlvarezPajaro_128x8InstructionMemory;

    -- data memory
    component AlvarezPajaro_256x8DataMemory is  
        port(
            signal CLK, MEMREAD, MEMWRITE : in std_logic;
            signal RDADDRESS, WRADDRESS, WRDATA : in std_logic_vector(31 downto 0);
            signal DATAOUT : out std_logic_vector(31 downto 0)
        );
    end component AlvarezPajaro_256x8DataMemory;

    -- register file
    component AlvarezPajaro_3PortRegisterFile3 is
        port(
            signal REGWR, CLK : in std_logic;
            signal RD, RS, RT : in std_logic_vector(4 downto 0);
            signal WRDATA, RA, LO, HI : in std_logic_vector(31 downto 0);
            signal RDATA1, RDATA2 : out std_logic_vector(31 downto 0)
        );
    end component AlvarezPajaro_3PortRegisterFile3;

    -- adder/subtractor
    component AlvarezPajaro_32bitCarrylookaheadAdderSubtractor is
        port(
            signal OP : in std_logic;
            signal X, Y : in std_logic_vector(31 downto 0);
            signal COUT, N, O, Z : out std_logic;
            signal R : out std_logic_vector(31 downto 0)
        );
    end component AlvarezPajaro_32bitCarrylookaheadAdderSubtractor;

    -- arithmetic-logical unit
    component AlvarezPajaro_ALU is
        port(
            signal OPCODE : in std_logic_vector(3 downto 0);
            signal SHAMT : in std_logic_vector(4 downto 0);
            signal X, Y : in std_logic_vector(31 downto 0);
            signal Z : out std_logic;
            signal R, LO, HI : out std_logic_vector(31 downto 0)
        );
    end component AlvarezPajaro_ALU;

    -- main control unit
    component AlvarezPajaro_control is
        port(
            signal OPCODE : in std_logic_vector(5 downto 0);
            signal REGDST, ALUSRC, MEMTOREG, REGWRITE, MEMREAD : out std_logic;
            signal MEMWRITE, BRANCH, JUMP, JPLINK, JUMPRST : out std_logic;
            signal ALUOP : out std_logic_vector(1 downto 0)
        );
    end component AlvarezPajaro_control;

    -- ALU control unit
    component AlvarezPajaro_ALUcontrol is
        port(
            signal ALUOP : in std_logic_vector(1 downto 0);
            signal FUNCT : in std_logic_vector(5 downto 0);
            signal OPCODE : out std_logic_vector(3 downto 0)
        );
    end component AlvarezPajaro_ALUcontrol;

    -- 32bit wide 2:1 multiplexer
    component AlvarezPajaro_32bit2to1Multiplexer is
        port(
            signal SEL : in std_logic;
            signal A, B : in std_logic_vector(31 downto 0);
            signal O : out std_logic_vector(31 downto 0)
        );
    end component AlvarezPajaro_32bit2to1Multiplexer;

    -- 5bit wide 2:1 multiplexer
    component AlvarezPajaro_5bit2to1Multiplexer is
        port(
            signal SEL : in std_logic;
            signal A, B : in std_logic_vector(4 downto 0);
            signal O : out std_logic_vector(4 downto 0)
        );
    end component AlvarezPajaro_5bit2to1Multiplexer;

    -- 3bit wide 1:2 demultiplexer
    component AlvarezPajaro_32bit1to2Demultiplexer is
        port(
            signal SEL : in std_logic;
            signal I : in std_logic_vector(31 downto 0);
            signal A, B : out std_logic_vector(31 downto 0)
        );
    end component AlvarezPajaro_32bit1to2Demultiplexer;

    -- hexadecimal display decoder
    component AlvarezPajaro_hexadecimalDisplayDecoder is
        port(
            signal DIN : in std_logic_vector(3 downto 0);
            signal DOUT : out std_logic_vector(6 downto 0)
        );
    end component AlvarezPajaro_hexadecimalDisplayDecoder;

    -- single cycle CPU
    component AlvarezPajaro_singleCycleCPU is  
        port(
            signal CLK, RESET, WREN, START, SHIFT, WRDST : in std_logic;  -- set RESET to a key
            signal WRADDRESS : in std_logic_vector(6 downto 0);
            signal LOAD : in std_logic_vector(31 downto 0);
            signal SSD : out std_logic_vector(55 downto 0)
        );
    end component AlvarezPajaro_singleCycleCPU;
end package AlvarezPajaro_singleCycle;