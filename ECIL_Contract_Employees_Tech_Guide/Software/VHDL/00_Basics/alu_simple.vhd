----------------------------------------------------------------------------------
-- Company:      ECIL
-- Design Name:  Combinational Logic
-- Module Name:  ALU_Simple - Behavioral
-- Project Name: 00_Basics
-- Target Devices: Generic FPGA
-- Tool Versions: Any VHDL-2008 compliant tool
-- Description: 
--    A minimal Arithmetic Logic Unit (ALU).
--    Operations: ADD, SUB, AND, OR based on 2-bit opcode.
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ALU_Simple is
    Port ( 
        a      : in  STD_LOGIC_VECTOR(3 downto 0);
        b      : in  STD_LOGIC_VECTOR(3 downto 0);
        opcode : in  STD_LOGIC_VECTOR(1 downto 0);
        result : out STD_LOGIC_VECTOR(3 downto 0)
    );
end ALU_Simple;

architecture Behavioral of ALU_Simple is
begin
    process(a, b, opcode)
    begin
        case opcode is
            when "00" => -- ADD
                result <= std_logic_vector(unsigned(a) + unsigned(b));
            when "01" => -- SUB
                result <= std_logic_vector(unsigned(a) - unsigned(b));
            when "10" => -- AND
                result <= a and b;
            when "11" => -- OR
                result <= a or b;
            when others =>
                result <= (others => '0');
        end case;
    end process;
end Behavioral;
