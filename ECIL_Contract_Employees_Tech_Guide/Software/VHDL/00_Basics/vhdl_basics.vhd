----------------------------------------------------------------------------------
-- Company:      ECIL
-- Design Name:  VHDL Basics
-- Module Name:  VHDL_Basics - Behavioral
-- Project Name: 00_Basics
-- Target Devices: Generic FPGA
-- Tool Versions: Any VHDL-2008 compliant tool
-- Description: 
--    This file introduces the fundamental building blocks of VHDL.
--    It covers Libraries, Entity, Architecture, Signals vs Variables,
--    and the basic Process block structure for sequential logic.
--
--    TARGET AUDIENCE: Absolute Beginners
--
----------------------------------------------------------------------------------

-- 1. LIBRARIES
--    Libraries are collections of pre-compiled code.
--    'IEEE' is the standard library for VHDL.
library IEEE;
--    'std_logic_1164' defines the standard multi-valued logic system (std_logic).
--    It allows signals to have values like '0', '1', 'Z' (High Impedance), 'X' (Unknown), etc.
use IEEE.STD_LOGIC_1164.ALL;

-- 2. ENTITY
--    The Entity describes the EXTERNAL interface of the module (Input/Output pins).
--    Think of this as the "black box" view of your chip.
entity VHDL_Basics is
    Port ( 
        -- 'clk' is a standard name for the system clock input.
        -- 'in' specifies the direction (Input). 
        -- 'std_logic' is the type (a single bit).
        clk     : in  STD_LOGIC;  
        
        -- 'rst' is a standard name for reset.
        rst     : in  STD_LOGIC;

        -- 'data_in' is an 8-bit input vector (bus).
        -- (7 downto 0) means bit 7 is the Most Significant Bit (MSB).
        data_in : in  STD_LOGIC_VECTOR (7 downto 0);

        -- 'data_out' is an 8-bit output vector.
        data_out: out STD_LOGIC_VECTOR (7 downto 0)
    );
end VHDL_Basics;

-- 3. ARCHITECTURE
--    The Architecture describes the INTERNAL behavior or structure of the module.
--    'Behavioral' is a common name when describing WHAT the circuit does (algorithm).
architecture Behavioral of VHDL_Basics is

    -- 4. SIGNALS
    --    Signals are internal wires used to connect different parts of logic.
    --    They hold their value until a new assignment occurs.
    signal internal_data : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');

begin

    ------------------------------------------------------------------------------
    -- 5. CONCURRENT ASSIGNMENTS
    --    These happen continuously and in parallel.
    --    Whenever 'internal_data' changes, 'data_out' is updated immediately.
    ------------------------------------------------------------------------------
    data_out <= internal_data;

    ------------------------------------------------------------------------------
    -- 6. PROCESS BLOCK
    --    A Process is a sequential block of code that runs when one of the signals
    --    in its "sensitivity list" (the part in brackets) changes.
    --    Here, the process wakes up on 'clk' or 'rst' changes.
    ------------------------------------------------------------------------------
    Sync_Process : process(clk, rst)
    begin
        -- 7. ASYNCHRONOUS RESET
        --    If 'rst' is high ('1'), reset everything immediately.
        --    It doesn't wait for the clock edge.
        if (rst = '1') then
            internal_data <= (others => '0'); -- Set all bits to 0
            
        -- 8. SYNCHRONOUS LOGIC (RISING_EDGE)
        --    If reset is not active, we check for the rising edge of the clock.
        --    This is how Flip-Flops are inferred. Logic happens only on the transition from 0 to 1.
        elsif rising_edge(clk) then
            
            -- Simple signal assignment:
            -- Transfer input to internal signal on every clock cycle.
            internal_data <= data_in;
            
        end if;
    end process;

end Behavioral;
