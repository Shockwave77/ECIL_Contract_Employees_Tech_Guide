----------------------------------------------------------------------------------
-- Company:      ECIL
-- Design Name:  Advanced Concepts
-- Module Name:  Shift_Reg_SISO - Behavioral
-- Project Name: 00_Basics
-- Target Devices: Generic FPGA
-- Tool Versions: Any VHDL-2008 compliant tool
-- Description: 
--    Serial-In Serial-Out (SISO) Shift Register (4-bit).
--    Shifts data one bit to the right on each clock edge.
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Shift_Reg_SISO is
    Port ( 
        clk  : in  STD_LOGIC;
        rst  : in  STD_LOGIC;
        si   : in  STD_LOGIC; -- Serial Input
        so   : out STD_LOGIC  -- Serial Output
    );
end Shift_Reg_SISO;

architecture Behavioral of Shift_Reg_SISO is
    signal reg : std_logic_vector(3 downto 0);
begin
    process(clk, rst)
    begin
        if (rst = '1') then
            reg <= (others => '0');
        elsif rising_edge(clk) then
            -- Shift Right:
            -- MSB gets new input 'si'
            -- LSB is shifted out
            reg <= si & reg(3 downto 1);
        end if;
    end process;

    so <= reg(0); -- LSB is the output
end Behavioral;
