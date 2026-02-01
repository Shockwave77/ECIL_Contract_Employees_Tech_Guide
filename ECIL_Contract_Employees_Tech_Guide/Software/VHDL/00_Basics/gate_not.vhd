----------------------------------------------------------------------------------
-- Company:      ECIL
-- Design Name:  Fundamental Gates
-- Module Name:  Gate_NOT - Behavioral
-- Project Name: 00_Basics
-- Target Devices: Generic FPGA
-- Tool Versions: Any VHDL-2008 compliant tool
-- Description: 
--    Inverter (NOT gate).
--    Demonstrates unary operator.
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Gate_NOT is
    Port ( 
        a : in  STD_LOGIC;
        y : out STD_LOGIC
    );
end Gate_NOT;

architecture Behavioral of Gate_NOT is
begin
    y <= not a;
end Behavioral;
