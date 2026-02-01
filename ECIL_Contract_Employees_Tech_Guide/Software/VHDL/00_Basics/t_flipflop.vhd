----------------------------------------------------------------------------------
-- Company:      ECIL
-- Design Name:  Sequential Logic
-- Module Name:  T_FlipFlop - Behavioral
-- Project Name: 00_Basics
-- Target Devices: Generic FPGA
-- Tool Versions: Any VHDL-2008 compliant tool
-- Description: 
--    Toggle Flip-Flop.
--    T=1 -> Toggle state.
--    T=0 -> Hold state.
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity T_FlipFlop is
    Port ( 
        clk : in  STD_LOGIC;
        rst : in  STD_LOGIC;
        t   : in  STD_LOGIC;
        q   : out STD_LOGIC
    );
end T_FlipFlop;

architecture Behavioral of T_FlipFlop is
    signal q_reg : std_logic := '0';
begin
    process(clk, rst)
    begin
        if (rst = '1') then
            q_reg <= '0';
        elsif rising_edge(clk) then
            if (t = '1') then
                q_reg <= not q_reg;
            end if;
            -- if t='0', q_reg holds value
        end if;
    end process;
    
    q <= q_reg;
end Behavioral;
