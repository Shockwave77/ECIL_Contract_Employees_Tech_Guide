----------------------------------------------------------------------------------
-- Company:      ECIL
-- Design Name:  Fundamental Gates
-- Module Name:  Gate_OR - Behavioral
-- Project Name: 00_Basics
-- Target Devices: Generic FPGA
-- Tool Versions: Any VHDL-2008 compliant tool
-- Description: 
--    Simple 2-input OR gate.
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Gate_OR is
    Port ( 
        a : in  STD_LOGIC;
        b : in  STD_LOGIC;
        y : out STD_LOGIC
    );
end Gate_OR;

architecture Behavioral of Gate_OR is
begin
    y <= a or b;
end Behavioral;
