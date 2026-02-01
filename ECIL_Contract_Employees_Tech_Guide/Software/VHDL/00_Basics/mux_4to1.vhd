----------------------------------------------------------------------------------
-- Company:      ECIL
-- Design Name:  Combinational Logic
-- Module Name:  Mux_4to1 - Behavioral
-- Project Name: 00_Basics
-- Target Devices: Generic FPGA
-- Tool Versions: Any VHDL-2008 compliant tool
-- Description: 
--    4-to-1 Multiplexer.
--    Demonstrates 'Selected Signal Assignment (WITH...SELECT)'.
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux_4to1 is
    Port ( 
        d0, d1, d2, d3 : in  STD_LOGIC;             -- 4 Inputs
        sel            : in  STD_LOGIC_VECTOR(1 downto 0); -- 2-bit Select
        y              : out STD_LOGIC              -- Output
    );
end Mux_4to1;

architecture Behavioral of Mux_4to1 is
begin
    -- SELECTED SIGNAL ASSIGNMENT
    -- Syntax: with SELECT_SIGNAL select TARGET <= ...
    -- Note: All possible values of 'sel' must be covered. 'others' covers unused cases.
    with sel select
        y <= d0 when "00",
             d1 when "01",
             d2 when "10",
             d3 when "11",
             '0' when others; -- Fail-safe/Default
end Behavioral;
