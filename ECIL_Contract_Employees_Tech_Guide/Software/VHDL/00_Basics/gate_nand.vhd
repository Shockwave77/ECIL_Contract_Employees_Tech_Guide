----------------------------------------------------------------------------------
-- Company:      ECIL
-- Design Name:  Fundamental Gates
-- Module Name:  Gate_NAND - Behavioral
-- Project Name: 00_Basics
-- Target Devices: Generic FPGA
-- Tool Versions: Any VHDL-2008 compliant tool
-- Description: 
--    Simple 2-input NAND gate.
--    Universal gate.
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Gate_NAND is
    Port ( 
        a : in  STD_LOGIC;
        b : in  STD_LOGIC;
        y : out STD_LOGIC
    );
end Gate_NAND;

architecture Behavioral of Gate_NAND is
begin
    y <= a nand b;
end Behavioral;
