----------------------------------------------------------------------------------
-- Company:      ECIL
-- Design Name:  Sequential Logic
-- Module Name:  SR_Latch - Behavioral
-- Project Name: 00_Basics
-- Target Devices: Generic FPGA
-- Tool Versions: Any VHDL-2008 compliant tool
-- Description: 
--    Basic SR Latch (Set-Reset).
--    Level-sensitive storage element.
--    NOTE: Avoid latches in FPGA designs unless intentional.
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SR_Latch is
    Port ( 
        s : in  STD_LOGIC; -- Set
        r : in  STD_LOGIC; -- Reset
        q : out STD_LOGIC;
        qb: out STD_LOGIC  -- Q bar (inverted)
    );
end SR_Latch;

architecture Behavioral of SR_Latch is
    signal q_internal : std_logic;
    signal qb_internal: std_logic;
begin
    -- Structural loop characteristic of a latch
    q_internal  <= r nor qb_internal;
    qb_internal <= s nor q_internal;

    q  <= q_internal;
    qb <= qb_internal;
end Behavioral;
