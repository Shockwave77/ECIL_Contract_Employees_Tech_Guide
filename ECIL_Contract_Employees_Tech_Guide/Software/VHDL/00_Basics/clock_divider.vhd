----------------------------------------------------------------------------------
-- Company:      ECIL
-- Design Name:  Advanced Concepts
-- Module Name:  Clock_Divider - Behavioral
-- Project Name: 00_Basics
-- Target Devices: Generic FPGA
-- Tool Versions: Any VHDL-2008 compliant tool
-- Description: 
--    Generic Clock Divider.
--    Input: High Frequency Clock (e.g., 100 MHz)
--    Output: Slower Clock Enable Pulse or 50% Duty Cycle Clock.
--    This example toggles the output to create a 50% duty cycle slow clock.
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Clock_Divider is
    Generic (
        DIVISOR : integer := 50000000 -- Default: Divide by 50M (1Hz out for 50MHz in)
    );
    Port ( 
        clk_in  : in  STD_LOGIC;
        rst     : in  STD_LOGIC;
        clk_out : out STD_LOGIC
    );
end Clock_Divider;

architecture Behavioral of Clock_Divider is
    signal count : integer range 0 to DIVISOR/2 - 1 := 0;
    signal temp_clk : std_logic := '0';
begin
    process(clk_in, rst)
    begin
        if (rst = '1') then
            count <= 0;
            temp_clk <= '0';
        elsif rising_edge(clk_in) then
            if (count = DIVISOR/2 - 1) then
                count <= 0;
                temp_clk <= not temp_clk;
            else
                count <= count + 1;
            end if;
        end if;
    end process;
    
    clk_out <= temp_clk;
end Behavioral;
