----------------------------------------------------------------------------------
-- Company:      ECIL
-- Design Name:  Combinational Logic
-- Module Name:  Decoder_2to4 - Behavioral
-- Project Name: 00_Basics
-- Target Devices: Generic FPGA
-- Tool Versions: Any VHDL-2008 compliant tool
-- Description: 
--    Binary Decoder.
--    Activates one of 4 outputs based on binary input.
--    Commonly used for address decoding.
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Decoder_2to4 is
    Port ( 
        a : in  STD_LOGIC_VECTOR(1 downto 0); -- Address Input
        y : out STD_LOGIC_VECTOR(3 downto 0)  -- Decoded Output
    );
end Decoder_2to4;

architecture Behavioral of Decoder_2to4 is
begin
    process(a)
    begin
        case a is
            when "00"   => y <= "0001";
            when "01"   => y <= "0010";
            when "10"   => y <= "0100";
            when "11"   => y <= "1000";
            when others => y <= "0000";
        end case;
    end process;
end Behavioral;
