----------------------------------------------------------------------------------
-- Company:      ECIL
-- Design Name:  Advanced Concepts
-- Module Name:  Param_Counter - Behavioral
-- Project Name: 00_Basics
-- Target Devices: Generic FPGA
-- Tool Versions: Any VHDL-2008 compliant tool
-- Description: 
--    N-bit Counter using GENERIC.
--    Demonstrates reusability by parameterizing bit-width.
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Param_Counter is
    Generic (
        WIDTH : integer := 8 -- Default 8-bit
    );
    Port ( 
        clk   : in  STD_LOGIC;
        rst   : in  STD_LOGIC;
        en    : in  STD_LOGIC;
        count : out STD_LOGIC_VECTOR(WIDTH-1 downto 0)
    );
end Param_Counter;

architecture Behavioral of Param_Counter is
    signal internal_count : unsigned(WIDTH-1 downto 0);
begin
    process(clk, rst)
    begin
        if (rst = '1') then
            internal_count <= (others => '0');
        elsif rising_edge(clk) then
            if (en = '1') then
                internal_count <= internal_count + 1;
            end if;
        end if;
    end process;

    count <= std_logic_vector(internal_count);
end Behavioral;
