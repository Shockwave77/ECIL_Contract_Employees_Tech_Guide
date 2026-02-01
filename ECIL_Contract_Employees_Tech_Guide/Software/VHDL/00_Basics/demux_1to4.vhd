----------------------------------------------------------------------------------
-- Company:      ECIL
-- Design Name:  Combinational Logic
-- Module Name:  Demux_1to4 - Behavioral
-- Project Name: 00_Basics
-- Target Devices: Generic FPGA
-- Tool Versions: Any VHDL-2008 compliant tool
-- Description: 
--    1-to-4 Demultiplexer.
--    Routes one input to one of 4 outputs based on select.
--    Demonstrates PROCESS with CASE statement.
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Demux_1to4 is
    Port ( 
        d_in : in  STD_LOGIC;
        sel  : in  STD_LOGIC_VECTOR(1 downto 0);
        y0   : out STD_LOGIC;
        y1   : out STD_LOGIC;
        y2   : out STD_LOGIC;
        y3   : out STD_LOGIC
    );
end Demux_1to4;

architecture Behavioral of Demux_1to4 is
begin

    -- Process for combinational logic
    -- Sensitivity list MUST include all inputs (d_in, sel)
    process(d_in, sel)
    begin
        -- Default assignments to prevent "latches".
        -- In combinational processes, always assign a default value first.
        y0 <= '0';
        y1 <= '0';
        y2 <= '0';
        y3 <= '0';

        case sel is
            when "00" => y0 <= d_in;
            when "01" => y1 <= d_in;
            when "10" => y2 <= d_in;
            when "11" => y3 <= d_in;
            when others => null; -- Do nothing for invalid states
        end case;
    end process;
    
end Behavioral;
