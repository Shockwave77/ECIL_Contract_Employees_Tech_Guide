----------------------------------------------------------------------------------
-- Company:      ECIL
-- Design Name:  Fundamental Gates
-- Module Name:  Gate_AND - Behavioral
-- Project Name: 00_Basics
-- Target Devices: Generic FPGA
-- Tool Versions: Any VHDL-2008 compliant tool
-- Description: 
--    Simple 2-input AND gate.
--    Demonstrates basic STD_LOGIC usage and dataflow architecture.
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Gate_AND is
    Port ( 
        a : in  STD_LOGIC;
        b : in  STD_LOGIC;
        y : out STD_LOGIC
    );
end Gate_AND;

architecture Behavioral of Gate_AND is
begin
    -- Dataflow style: Constant assignment
    y <= a and b;
end Behavioral;
