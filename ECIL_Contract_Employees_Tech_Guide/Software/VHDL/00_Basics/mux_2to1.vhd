----------------------------------------------------------------------------------
-- Company:      ECIL
-- Design Name:  Combinational Logic
-- Module Name:  Mux_2to1 - Behavioral
-- Project Name: 00_Basics
-- Target Devices: Generic FPGA
-- Tool Versions: Any VHDL-2008 compliant tool
-- Description: 
--    2-to-1 Multiplexer.
--    Selects one of two inputs based on a select line.
--    Demonstrates 'Conditional Signal Assignment (WHEN...ELSE)'.
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux_2to1 is
    Port ( 
        d0  : in  STD_LOGIC; -- Input 0
        d1  : in  STD_LOGIC; -- Input 1
        sel : in  STD_LOGIC; -- Select line
        y   : out STD_LOGIC  -- Output
    );
end Mux_2to1;

architecture Behavioral of Mux_2to1 is
begin
    -- CONDITIONAL SIGNAL ASSIGNMENT
    -- Syntax: Target <= Value1 when Condition else Value2;
    -- Note: This is concurrent code (outside a process).
    y <= d1 when (sel = '1') else d0;
    
end Behavioral;
