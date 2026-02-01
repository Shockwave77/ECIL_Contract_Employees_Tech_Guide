----------------------------------------------------------------------------------
-- Company:      ECIL
-- Design Name:  Combinational Logic
-- Module Name:  Tri_State_Buffer - Behavioral
-- Project Name: 00_Basics
-- Target Devices: Generic FPGA
-- Tool Versions: Any VHDL-2008 compliant tool
-- Description: 
--    Tri-state Buffer.
--    Demonstrates High-Impedance ('Z') state.
--    Used for bidirectional buses or disabling outputs.
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Tri_State_Buffer is
    Port ( 
        data_in  : in  STD_LOGIC;
        enable   : in  STD_LOGIC; -- Active High Enable
        data_out : out STD_LOGIC
    );
end Tri_State_Buffer;

architecture Behavioral of Tri_State_Buffer is
begin
    -- When enable is '1', drive data.
    -- When enable is '0', go to High Impedance (Z).
    data_out <= data_in when (enable = '1') else 'Z';
end Behavioral;
