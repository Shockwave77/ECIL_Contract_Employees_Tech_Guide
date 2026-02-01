----------------------------------------------------------------------------------
-- Company:      ECIL
-- Design Name:  Blinky LED
-- Module Name:  Blinky_LED - Behavioral
-- Project Name: 01_Stage1_Blinky
-- Target Devices: Generic FPGA
-- Tool Versions: Any VHDL-2008 compliant tool
-- Description: 
--    This module creates a blinking LED by dividing the system clock.
--    It demonstrates how to create a simple timer/counter.
--
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- We need purely integer arithmetic for the counter
use IEEE.NUMERIC_STD.ALL;

entity Blinky_LED is
    Generic (
        -- Assuming a 100 MHz clock standard on many boards.
        -- We want to toggle every 0.5 seconds (1 Hz blink).
        -- 100,000,000 cycles / 2 = 50,000,000 cycles for toggle.
        CLK_FREQ_Hz : integer := 100000000;
        BLINK_FREQ_Hz : integer := 1
    );
    Port ( 
        clk : in STD_LOGIC;
        rst : in STD_LOGIC;
        led : out STD_LOGIC
    );
end Blinky_LED;

architecture Behavioral of Blinky_LED is

    -- CONSTANT for the max count value
    constant MAX_COUNT : integer := (CLK_FREQ_Hz / (2 * BLINK_FREQ_Hz)) - 1;
    
    -- Signals
    -- 'integer range' is safe for synthesis; the tool will calculate bits needed.
    signal counter : integer range 0 to MAX_COUNT := 0;
    signal led_state : std_logic := '0';

begin

    -- Process to handle counting and toggling
    process(clk, rst)
    begin
        if (rst = '1') then
            counter <= 0;
            led_state <= '0';
        elsif rising_edge(clk) then
            if (counter = MAX_COUNT) then
                counter <= 0;
                -- Toggle the LED state
                led_state <= not led_state;
            else
                counter <= counter + 1;
            end if;
        end if;
    end process;

    -- Assign internal state to physical output
    led <= led_state;

end Behavioral;
