----------------------------------------------------------------------------------
-- Company:      ECIL
-- Design Name:  Combinational Logic
-- Module Name:  Full_Adder - Structural
-- Project Name: 00_Basics
-- Target Devices: Generic FPGA
-- Tool Versions: Any VHDL-2008 compliant tool
-- Description: 
--    A Full Adder adds two bits plus a Carry Input.
--    This implementation demonstrates STRUCTURAL VHDL.
--    Instead of writing equations, we connect two Half Adders.
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Full_Adder is
    Port ( 
        a    : in  STD_LOGIC;
        b    : in  STD_LOGIC;
        cin  : in  STD_LOGIC;
        sum  : out STD_LOGIC;
        cout : out STD_LOGIC
    );
end Full_Adder;

architecture Structural of Full_Adder is

    -- 1. COMPONENT DECLARATION
    --    We must declare the component we want to use (like a function prototype).
    component Half_Adder
        Port ( 
            a     : in  STD_LOGIC;
            b     : in  STD_LOGIC;
            sum   : out STD_LOGIC;
            carry : out STD_LOGIC
        );
    end component;

    -- 2. INTERNAL SIGNALS
    --     wires to connect the components together.
    signal s1, c1, c2 : STD_LOGIC;

begin

    -- 3. INSTANTIATION
    --    Create instances of the Half_Adder.
    --    Map the ports: (Component Port => Local Signal)
    
    -- First Half Adder: Adds A and B
    HA1: Half_Adder port map (
        a     => a,
        b     => b,
        sum   => s1,  -- Intermediate sum
        carry => c1   -- Intermediate carry from A+B
    );

    -- Second Half Adder: Adds Intermediate Sum and Cin
    HA2: Half_Adder port map (
        a     => s1,
        b     => cin,
        sum   => sum, -- Final Sum
        carry => c2   -- Carry from (A+B) + Cin
    );

    -- Final Carry Logic
    -- Pass carry if either stage generated a carry
    cout <= c1 or c2;

end Structural;
