----------------------------------------------------------------------------------
-- Company:      ECIL
-- Design Name:  Sequential Logic
-- Module Name:  Register_8bit - Behavioral
-- Project Name: 00_Basics
-- Target Devices: Generic FPGA
-- Tool Versions: Any VHDL-2008 compliant tool
-- Description: 
--    8-bit Parallel Load Register.
--    Stores an 8-bit byte on clock edge when Load Enable is High.
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Register_8bit is
    Port ( 
        clk  : in  STD_LOGIC;
        rst  : in  STD_LOGIC;
        load : in  STD_LOGIC; -- Load Enable
        d    : in  STD_LOGIC_VECTOR(7 downto 0);
        q    : out STD_LOGIC_VECTOR(7 downto 0)
    );
end Register_8bit;

architecture Behavioral of Register_8bit is
begin
    process(clk, rst)
    begin
        if (rst = '1') then
            q <= (others => '0');
        elsif rising_edge(clk) then
            if (load = '1') then
                q <= d;
            end if;
        end if;
    end process;
end Behavioral;
