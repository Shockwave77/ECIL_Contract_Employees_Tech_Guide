----------------------------------------------------------------------------------
-- Company:      ECIL
-- Design Name:  Combinational Logic
-- Module Name:  Half_Adder - Behavioral
-- Project Name: 00_Basics
-- Target Devices: Generic FPGA
-- Tool Versions: Any VHDL-2008 compliant tool
-- Description: 
--    A Half Adder adds two single bits and produces a Sum and a Carry.
--    It does NOT handle a carry input (that's what a Full Adder is for).
--
--    Truth Table:
--    A B | Sum Carry
--    0 0 |  0    0
--    0 1 |  1    0
--    1 0 |  1    0
--    1 1 |  0    1
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Half_Adder is
    Port ( 
        a     : in  STD_LOGIC;
        b     : in  STD_LOGIC;
        sum   : out STD_LOGIC;
        carry : out STD_LOGIC
    );
end Half_Adder;

architecture Behavioral of Half_Adder is
begin
    -- Concurrent signal assignments
    -- These occur in parallel.
    sum   <= a xor b;  -- Sum is 1 if inputs are different
    carry <= a and b;  -- Carry is 1 if both inputs are 1
end Behavioral;
