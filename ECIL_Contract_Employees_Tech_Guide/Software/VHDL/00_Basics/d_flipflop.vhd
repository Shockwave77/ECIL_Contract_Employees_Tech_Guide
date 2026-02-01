----------------------------------------------------------------------------------
-- Company:      ECIL
-- Design Name:  Sequential Logic
-- Module Name:  D_FlipFlop - Behavioral
-- Project Name: 00_Basics
-- Target Devices: Generic FPGA
-- Tool Versions: Any VHDL-2008 compliant tool
-- Description: 
--    Positive Edge-Triggered D Flip-Flop.
--    Standard storage element in FPGAs.
--    Includes Asynchronous Reset.
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity D_FlipFlop is
    Port ( 
        clk : in  STD_LOGIC;
        rst : in  STD_LOGIC; -- Async Reset
        d   : in  STD_LOGIC;
        q   : out STD_LOGIC
    );
end D_FlipFlop;

architecture Behavioral of D_FlipFlop is
begin
    process(clk, rst)
    begin
        if (rst = '1') then
            q <= '0';
        elsif rising_edge(clk) then
            q <= d;
        end if;
    end process;
end Behavioral;
