----------------------------------------------------------------------------------
-- Company:      ECIL
-- Design Name:  Sequential Logic
-- Module Name:  D_Latch - Behavioral
-- Project Name: 00_Basics
-- Target Devices: Generic FPGA
-- Tool Versions: Any VHDL-2008 compliant tool
-- Description: 
--    Transparent D-Latch.
--    Output follows Input when Enable is High.
--    Holds Value when Enable is Low.
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity D_Latch is
    Port ( 
        d   : in  STD_LOGIC;
        en  : in  STD_LOGIC;
        q   : out STD_LOGIC
    );
end D_Latch;

architecture Behavioral of D_Latch is
begin
    -- Process with sensitivity list creates a latch if 
    -- not all paths assign a value (incomplete assignment).
    process(d, en)
    begin
        if (en = '1') then
            q <= d;
        end if;
        -- Implicit 'else': keep previous value (Latch behavior)
    end process;
end Behavioral;
