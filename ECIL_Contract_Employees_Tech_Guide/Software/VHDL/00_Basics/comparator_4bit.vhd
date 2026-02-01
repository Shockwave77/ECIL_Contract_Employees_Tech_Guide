----------------------------------------------------------------------------------
-- Company:      ECIL
-- Design Name:  Combinational Logic
-- Module Name:  Comparator_4bit - Behavioral
-- Project Name: 00_Basics
-- Target Devices: Generic FPGA
-- Tool Versions: Any VHDL-2008 compliant tool
-- Description: 
--    4-bit Magnitude Comparator.
--    Compares two 4-bit vectors (A and B).
--    Outputs: Greater Than, Less Than, Equal.
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL; -- Needed for comparison operators

entity Comparator_4bit is
    Port ( 
        a       : in  STD_LOGIC_VECTOR(3 downto 0);
        b       : in  STD_LOGIC_VECTOR(3 downto 0);
        greater : out STD_LOGIC;
        less    : out STD_LOGIC;
        equal   : out STD_LOGIC
    );
end Comparator_4bit;

architecture Behavioral of Comparator_4bit is
begin
    process(a, b)
    begin
        -- Initialize outputs
        greater <= '0';
        less    <= '0';
        equal   <= '0';

        if (unsigned(a) > unsigned(b)) then
            greater <= '1';
        elsif (unsigned(a) < unsigned(b)) then
            less <= '1';
        else
            equal <= '1';
        end if;
    end process;
end Behavioral;
