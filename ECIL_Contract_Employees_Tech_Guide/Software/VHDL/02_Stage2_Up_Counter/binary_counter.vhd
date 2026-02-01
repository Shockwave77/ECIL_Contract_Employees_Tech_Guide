----------------------------------------------------------------------------------
-- Company:      ECIL
-- Design Name:  Up Counter
-- Module Name:  Binary_Counter - Behavioral
-- Project Name: 02_Stage2_Up_Counter
-- Target Devices: Generic FPGA
-- Tool Versions: Any VHDL-2008 compliant tool
-- Description: 
--    A simple 4-bit binary up-counter.
--    Introduces 'unsigned' type from NUMERIC_STD for arithmetic.
--
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- NUMERIC_STD is the preferred standard for arithmetic (add/sub)
use IEEE.NUMERIC_STD.ALL;

entity Binary_Counter is
    Port ( 
        clk : in  STD_LOGIC;
        rst : in  STD_LOGIC;
        -- 4-bit output (range 0 to 15)
        count_out : out STD_LOGIC_VECTOR (3 downto 0)
    );
end Binary_Counter;

architecture Behavioral of Binary_Counter is

    -- Internal signal using 'unsigned' type for math.
    -- 'unsigned' behaves like a binary number.
    signal counter_internal : unsigned (3 downto 0) := (others => '0');

begin

    process(clk, rst)
    begin
        -- Asynchronous Reset
        if (rst = '1') then
            -- Reset to 0 ("0000")
            counter_internal <= (others => '0');
        elsif rising_edge(clk) then
            -- Simple addition.
            -- This will automatically wrap around from "1111" (15) to "0000" (0).
            counter_internal <= counter_internal + 1;
        end if;
    end process;

    -- Type Casting:
    -- Convert 'unsigned' internal signal to 'std_logic_vector' for output.
    count_out <= std_logic_vector(counter_internal);

end Behavioral;
