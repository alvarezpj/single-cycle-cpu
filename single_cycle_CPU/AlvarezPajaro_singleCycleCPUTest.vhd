-- single cycle CPU

library ieee;
library cs343;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use cs343.AlvarezPajaro_singleCycle.all;


entity AlvarezPajaro_singleCycleCPUTest is  
    port(
        signal CLK, RESET, WREN, START, WRDST, SHIFT, WRDATA, OS : in std_logic;  -- set RESET to a key
        signal WRADDRESS : in std_logic_vector(6 downto 0);
        signal LOAD : in std_logic_vector(7 downto 0);
        signal CLKS : out std_logic;
        signal SSD : out std_logic_vector(55 downto 0)
    );
end entity AlvarezPajaro_singleCycleCPUTest;


architecture structure of AlvarezPajaro_singleCycleCPUTest is
    -- control intermediate signals
    signal registerDestination, aluSource, memoryToRegister, registerWrite, jumpRegister : std_logic;
    signal memoryRead, memoryWrite, branch, jump, zeroFlag, branchControl, jumpAndLink : std_logic;
    signal aluOperation : std_logic_vector(1 downto 0);
    signal operationCode : std_logic_vector(3 downto 0);
    -- other signals
    signal writeInstructionMemory, writeDataMemory, clockSignal : std_logic;
    signal temporal2, destination : std_logic_vector(4 downto 0);
    signal instruction, readData1, readData2, aluResult, offset, instructionAddress, nextInstruction : std_logic_vector(31 downto 0); 
    signal loadInstruction, loadData, dataOut, operand, toRegisterFile, branchOffset, loadMemory : std_logic_vector(31 downto 0);
    signal nextSequentialInstruction, branchAddress, source2, jumpAddress, lower, high, returnValue : std_logic_vector(31 downto 0);
    signal temporalAddress1, temporalAddress2, temporal3, writeAddress, writeReadAddress, displayData : std_logic_vector(31 downto 0);
    signal temporal : signed(31 downto 0);


    begin
        -- component instantiation
        clock : AlvarezPajaro_1HzClock2
            port map(CLK_50MHZ => CLK, CLK_1HZ => clockSignal);

        shiftRegister : AlvarezPajaro_shiftRegister2
            port map(SHIFT => SHIFT, CLK => clockSignal, LOAD => LOAD, Q => loadMemory);

        pc : AlvarezPajaro_programCounter
            port map(CLK => clockSignal, RESET => RESET, A => nextInstruction, PC => instructionAddress);

        instructionMemory : AlvarezPajaro_128x8InstructionMemory
            port map(CLK => clockSignal, MEMWRITE => writeInstructionMemory, RDADDRESS => instructionAddress, WRADDRESS => writeAddress, WRDATA => loadInstruction, INSTRUCTION => instruction);

        mux1 : AlvarezPajaro_5bit2to1Multiplexer
            port map(SEL => registerDestination, A => instruction(20 downto 16), B => instruction(15 downto 11), O => temporal2);

        registerFile : AlvarezPajaro_3PortRegisterFile3
            port map(REGWR => registerWrite, CLK => clockSignal, RD => destination, RS => instruction(25 downto 21), RT => instruction(20 downto 16), WRDATA => toRegisterFile, LO => lower, HI => high, RDATA1 => readData1, RDATA2 => readData2, RV => returnValue);

        mux2 : AlvarezPajaro_32bit2to1Multiplexer
            port map(SEL => aluSource, A => readData2, B => operand, O => source2);

        alu : AlvarezPajaro_ALU
            port map(OPCODE => operationCode, SHAMT => instruction(10 downto 6), X => readData1, Y => source2, Z => zeroFlag, R => aluResult, LO => lower, HI => high);

        dataMemory : AlvarezPajaro_256x8DataMemory
            port map(CLK => clockSignal, MEMREAD => memoryRead, MEMWRITE => writeDataMemory, ADDRESS => writeReadAddress, WRDATA => loadData, DATAOUT => dataOut);

        -- to register file
        mux3 : AlvarezPajaro_32bit2to1Multiplexer
            port map(SEL => memoryToRegister, A => aluResult, B => dataOut, O => temporal3);

        control : AlvarezPajaro_control
            port map(OPCODE => instruction(31 downto 26), REGDST => registerDestination, ALUSRC => aluSource, MEMTOREG => memoryToRegister, REGWRITE => registerWrite, MEMREAD => memoryRead, MEMWRITE => memoryWrite, BRANCH => branch, JUMP => jump, JPLINK => jumpAndLink, JUMPRST => jumpRegister, ALUOP => aluOperation);

        aluControl : AlvarezPajaro_ALUcontrol
            port map(ALUOP => aluOperation, FUNCT => instruction(5 downto 0), OPCODE => operationCode);

        adder1 : AlvarezPajaro_32bitCarrylookaheadAdderSubtractor
            port map(OP => '0', X => instructionAddress, Y => offset, COUT => open, N => open, O => open, Z => open, R => nextSequentialInstruction);

        adder2 : AlvarezPajaro_32bitCarrylookaheadAdderSubtractor
            port map(OP => '0', X => nextSequentialInstruction, Y => branchOffset, COUT => open, N => open, O => open, Z => open, R => branchAddress);

        mux4 : AlvarezPajaro_32bit2to1Multiplexer
            port map(SEL => branchControl, A => nextSequentialInstruction, B => branchAddress, O => temporalAddress1);

        mux5 : AlvarezPajaro_32bit2to1Multiplexer
            port map(SEL => jump, A => temporalAddress1, B => jumpAddress, O => temporalAddress2);

        mux6 : AlvarezPajaro_32bit2to1Multiplexer
            port map(SEL => jumpRegister, A => temporalAddress2, B => readData1, O => nextInstruction);

        mux7 : AlvarezPajaro_5bit2to1Multiplexer
            port map(SEL => jumpAndLink, A => temporal2, B => "11111", O => destination);

        mux8 : AlvarezPajaro_32bit2to1Multiplexer
            port map(SEL => jumpAndLink, A => temporal3, B => nextSequentialInstruction, O => toRegisterFile);

        -- seven segment display decoders
        mux9 : AlvarezPajaro_32bit2to1Multiplexer
            port map(SEL => OS, A => returnValue, B => instruction, O => displayData);

        decoder1 : AlvarezPajaro_hexadecimalDisplayDecoder
            port map(DIN => displayData(3 downto 0), DOUT => SSD(6 downto 0));

        decoder2 : AlvarezPajaro_hexadecimalDisplayDecoder
            port map(DIN => displayData(7 downto 4), DOUT => SSD(13 downto 7));

        decoder3 : AlvarezPajaro_hexadecimalDisplayDecoder
            port map(DIN => displayData(11 downto 8), DOUT => SSD(20 downto 14));

        decoder4 : AlvarezPajaro_hexadecimalDisplayDecoder
            port map(DIN => displayData(15 downto 12), DOUT => SSD(27 downto 21));

        decoder5 : AlvarezPajaro_hexadecimalDisplayDecoder
            port map(DIN => displayData(19 downto 16), DOUT => SSD(34 downto 28));

        decoder6 : AlvarezPajaro_hexadecimalDisplayDecoder
            port map(DIN => displayData(23 downto 20), DOUT => SSD(41 downto 35));

        decoder7 : AlvarezPajaro_hexadecimalDisplayDecoder
            port map(DIN => displayData(27 downto 24), DOUT => SSD(48 downto 42));

        decoder8 : AlvarezPajaro_hexadecimalDisplayDecoder
            port map(DIN => displayData(31 downto 28), DOUT => SSD(55 downto 49));


        proc0 : process(START, WRDST, LOAD, WRADDRESS, aluResult)
            begin
                if START = '0' then 
                    offset <= X"00000000";
                    writeAddress <= std_logic_vector(resize(unsigned(WRADDRESS), 32));
                    writeReadAddress <= std_logic_vector(resize(unsigned(WRADDRESS), 32));
                    loadData <= loadMemory;
                    loadInstruction <= loadMemory;
                    if WRDST = '0' then  -- load data to instruction memory
                        writeInstructionMemory <= WREN;
                        writeDataMemory <= '0';
                    elsif WRDST = '1' then  -- load data to data memory
                        writeInstructionMemory <= '0';
                        writeDataMemory <= WREN;
                    end if;
                elsif START = '1' then   -- start execution
                    offset <= X"00000004";
                    writeDataMemory <= memoryWrite;
                    loadData <= readData2;
                    writeReadAddress <= aluResult;
                    writeInstructionMemory <= '0';
                end if;
        end process;

        temporal <= resize(signed(instruction(15 downto 0)), 32);
        operand <= std_logic_vector(temporal);
        branchOffset <= std_logic_vector(shift_left(temporal, 2));
        branchControl <= branch and zeroFlag;
        jumpAddress <= nextSequentialInstruction(31 downto 28) & instruction(25 downto 0) & "00";
        CLKS <= clockSignal;
end architecture structure;