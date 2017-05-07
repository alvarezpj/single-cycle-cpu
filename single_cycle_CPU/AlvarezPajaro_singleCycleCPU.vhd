-- single cycle CPU

library ieee;
library cs343;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use cs343.AlvarezPajaro_singleCycle.all;


entity AlvarezPajaro_singleCycleCPU is  
    port(
        signal CLK, RESET, WREN, START, SHIFT, WRDST : in std_logic;  -- set RESET to a key
        signal WRADDRESS : in std_logic_vector(6 downto 0);
        signal LOAD : in std_logic_vector(31 downto 0);
        signal CLKS : out std_logic;
        signal SSD : out std_logic_vector(55 downto 0)
    );
end entity AlvarezPajaro_singleCycleCPU;


architecture structure of AlvarezPajaro_singleCycleCPU is
    -- control intermediate signals
    signal registerDestination, aluSource, memoryToRegister, registerWrite, memoryRead : std_logic;
    signal memoryWrite, branch, jump, writeIMemory, writeDMemory, zeroFlag, branchControl : std_logic;
    signal aluOperation : std_logic_vector(1 downto 0);
    signal operationCode : std_logic_vector(3 downto 0);
    -- other signals
    signal destination : std_logic_vector(4 downto 0);
    signal instruction, readData1, readData2, aluResult, offset, instructionAddress, nextInstruction : std_logic_vector(31 downto 0); 
    signal loadInstruction, loadData, loadMemory, dataOut, operand, toRegisterFile, branchOffset : std_logic_vector(31 downto 0);
    signal nextSequentialInstruction, branchAddress, source2, jumpAddress, temporalAddress1, lower, high : std_logic_vector(31 downto 0);
    signal temporal  : signed(31 downto 0);
    signal writeAddress : std_logic_vector(31 downto 0) := X"00000000";

    begin
        -- component instantiation
        pc : AlvarezPajaro_programCounter
            port map(CLK => CLK, RESET => RESET, A => nextInstruction, PC => instructionAddress);

        instructionMemory : AlvarezPajaro_128x8InstructionMemory
            port map(CLK => CLK, MEMWRITE => WREN, RDADDRESS => instructionAddress, WRADDRESS => writeAddress, WRDATA => LOAD, INSTRUCTION => instruction);

        mux1 : AlvarezPajaro_5bit2to1Multiplexer
            port map(SEL => registerDestination, A => instruction(20 downto 16), B => instruction(15 downto 11), O => destination);

        registerFile : AlvarezPajaro_3PortRegisterFile3
            port map(REGWR => registerWrite, CLK => CLK, RD => destination, RS => instruction(25 downto 21), RT => instruction(20 downto 16), WRDATA => toRegisterFile, RA => , LO => lower, HI => high, RDATA1 => readData1, RDATA2 => readData2);

        mux2 : AlvarezPajaro_32bit2to1Multiplexer
            port map(SEL => aluSource, A => readData2, B => operand, O => source2);

        alu : AlvarezPajaro_ALU
            port map(OPCODE => operationCode, SHAMT => instruction(10 downto 6), X => readData1, Y => source2, Z => zeroFlag, R => aluResult, LO => lower, HI => high);

        dataMemory : AlvarezPajaro_256x8DataMemory
            port map(CLK => CLK, MEMREAD => memoryRead, MEMWRITE => , RDADDRESS => aluResult, WRADDRESS => , WRDATA => readData2, DATAOUT => dataOut);

        -- to register file
        mux3 : AlvarezPajaro_32bit2to1Multiplexer
            port map(SEL => memoryToRegister, A => aluResult, B => dataOut, O => toRegisterFile);

        control : AlvarezPajaro_control
            port map(OPCODE => instruction(31 downto 26), REGDST => registerDestination, ALUSRC => aluSource, MEMTOREG => memoryToRegister, REGWRITE => registerWrite, MEMREAD => memoryRead, MEMWRITE => memoryWrite, BRANCH => branch, JUMP => jump, ALUOP => aluOperation)

        aluControl : AlvarezPajaro_ALUcontrol
            port map(ALUOP => aluOperation, FUNCT => instruction(5 downto 0), OPCODE => operationCode);

        adder1 : AlvarezPajaro_32bitCarrylookaheadAdderSubtractor
            port map(OP => '0', X => instructionAddress, Y => offset, COUT => open, N => open, O => open, Z => open, R => nextSequentialInstruction);

        adder2 : AlvarezPajaro_32bitCarrylookaheadAdderSubtractor
            port map(OP => '0', X => nextSequentialInstruction, Y => branchOffset, COUT => open, N => open, O => open, Z => open, R => branchAddress);

        mux4 : AlvarezPajaro_32bit2to1Multiplexer
            port map(SEL => branchControl, A => nextSequentialInstruction, B => branchAddress, O => temporalAddress1);

        mux5 : AlvarezPajaro_32bit2to1Multiplexer
            port map(SEL => jump, A => temporalAddress1, B => jumpAddress, O => nextInstruction);
   
        -- seven segment display decoders

        decoder1 : AlvarezPajaro_hexadecimalDisplayDecoder
            port map(DIN => instruction(3 downto 0), DOUT => SSD(6 downto 0));

        decoder2 : AlvarezPajaro_hexadecimalDisplayDecoder
            port map(DIN => instruction(7 downto 4), DOUT => SSD(13 downto 7));

        decoder3 : AlvarezPajaro_hexadecimalDisplayDecoder
            port map(DIN => instruction(11 downto 8), DOUT => SSD(20 downto 14));

        decoder4 : AlvarezPajaro_hexadecimalDisplayDecoder
            port map(DIN => instruction(15 downto 12), DOUT => SSD(27 downto 21));

        decoder5 : AlvarezPajaro_hexadecimalDisplayDecoder
            port map(DIN => instruction(19 downto 16), DOUT => SSD(34 downto 28));

        decoder6 : AlvarezPajaro_hexadecimalDisplayDecoder
            port map(DIN => instruction(23 downto 20), DOUT => SSD(41 downto 35));

        decoder7 : AlvarezPajaro_hexadecimalDisplayDecoder
            port map(DIN => instruction(27 downto 24), DOUT => SSD(48 downto 42));

        decoder8 : AlvarezPajaro_hexadecimalDisplayDecoder
            port map(DIN => instruction(31 downto 28), DOUT => SSD(55 downto 49));


        writeAddress(6 downto 0) <= WRADDRESS;
        temporal <= resize(signed(instruction(15 downto 0)), 32)
        operand <= std_logic_vector(temporal);
        branchOffset <= std_logic_vector(shift_left(temporal, 2));
        branchControl <= branch and zeroFlag;
        jumpAddress <= nextSequentialInstruction(31 downto 28) & instruction(25 downto 0) & "00";
end architecture structure;