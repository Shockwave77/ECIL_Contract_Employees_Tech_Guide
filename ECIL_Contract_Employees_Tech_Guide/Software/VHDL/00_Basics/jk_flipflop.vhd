----------------------------------------------------------------------------------
-- Company:      ECIL
-- Design Name:  Sequential Logic
-- Module Name:  JK_FlipFlop - Behavioral
-- Project Name: 00_Basics
-- Target Devices: Generic FPGA
-- Tool Versions: Any VHDL-2008 compliant tool
-- Description: 
--    JK Flip-Flop.
--    J=1, K=0 -> Set
--    J=0, K=1 -> Reset
--    J=1, K=1 -> Toggle
--    J=0, K=0 -> Hold
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity JK_FlipFlop is
    Port ( 
        clk : in  STD_LOGIC;
        rst : in  STD_LOGIC;
        j   : in  STD_LOGIC;
        k   : in  STD_LOGIC;
        q   : out STD_LOGIC
    );
end JK_FlipFlop;

architecture Behavioral of JK_FlipFlop is
    signal q_reg : std_logic := '0';
begin
    process(clk, rst)
    begin
        if (rst = '1') then
            q_reg <= '0';
        elsif rising_edge(clk) then
            if (j = '0' and k = '0') then
                q_reg <= q_reg;      -- Hold
            elsif (j = '0' and k = '1') then
                q_reg <= '0';        -- Reset
            elsif (j = '1' and k = '0') then
                q_reg <= '1';        -- Set
            elsif (j = '1' and k = '1') then
                q_reg <= not q_reg;  -- Toggle
            end if;
        end if;
    end process;

    q <= q_reg;
end Behavioral;
