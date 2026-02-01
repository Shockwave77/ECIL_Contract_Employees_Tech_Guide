----------------------------------------------------------------------------------
-- Company:      ECIL
-- Design Name:  Combinational Logic
-- Module Name:  Encoder_Priority - Behavioral
-- Project Name: 00_Basics
-- Target Devices: Generic FPGA
-- Tool Versions: Any VHDL-2008 compliant tool
-- Description: 
--    4-to-2 Priority Encoder.
--    Encodes the highest priority active input into a binary code.
--    Input 3 has highest priority.
--    'valid' output indicates if any input is active.
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Encoder_Priority is
    Port ( 
        d     : in  STD_LOGIC_VECTOR(3 downto 0); -- Inputs
        y     : out STD_LOGIC_VECTOR(1 downto 0); -- Encoded Output
        valid : out STD_LOGIC                     -- Active Flag
    );
end Encoder_Priority;

architecture Behavioral of Encoder_Priority is
begin
    process(d)
    begin
        -- Default assignments
        y <= "00";
        valid <= '0';

        -- Priority Logic using IF...ELSIF
        -- The order of checking determines priority.
        if (d(3) = '1') then
            y <= "11";
            valid <= '1';
        elsif (d(2) = '1') then
            y <= "10";
            valid <= '1';
        elsif (d(1) = '1') then
            y <= "01";
            valid <= '1';
        elsif (d(0) = '1') then
            y <= "00";
            valid <= '1';
        end if;
    end process;
end Behavioral;
