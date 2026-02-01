----------------------------------------------------------------------------------
-- Company:      ECIL
-- Design Name:  Traffic Light Controller
-- Module Name:  Traffic_Light_Controller - Behavioral
-- Project Name: 03_Stage3_Traffic_Light
-- Target Devices: Generic FPGA
-- Tool Versions: Any VHDL-2008 compliant tool
-- Description: 
--    A robust Traffic Light Controller for a 4-way intersection (North, East, South, West).
--    Implements a Finite State Machine (FSM) to manage safe light transitions.
--    Constraint: Only ONE road is Green at a time.
--
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Traffic_Light_Controller is
    Generic (
        CLK_FREQ_Hz   : integer := 100000000; -- System Clock Frequency (100 MHz)
        GREEN_TIME_S  : integer := 5;         -- Duration for Green Light (seconds)
        YELLOW_TIME_S : integer := 2          -- Duration for Yellow Light (seconds)
    );
    Port ( 
        clk : in  STD_LOGIC;
        rst : in  STD_LOGIC;
        
        -- Traffic Lights (2 bits each: 00=Off, 01=Red, 10=Yellow, 11=Green)
        -- Alternatively, we can use 3 separate bits per road: R, Y, G.
        -- Let's use 3 separate bits to be explicit and control individual LEDs.
        -- Format: (2)=Red, (1)=Yellow, (0)=Green
        north_light : out STD_LOGIC_VECTOR (2 downto 0);
        east_light  : out STD_LOGIC_VECTOR (2 downto 0);
        south_light : out STD_LOGIC_VECTOR (2 downto 0);
        west_light  : out STD_LOGIC_VECTOR (2 downto 0)
    );
end Traffic_Light_Controller;

architecture Behavioral of Traffic_Light_Controller is

    -- Traffic Light Constants for Readability
    constant LIGHT_RED    : std_logic_vector(2 downto 0) := "100";
    constant LIGHT_YELLOW : std_logic_vector(2 downto 0) := "010";
    constant LIGHT_GREEN  : std_logic_vector(2 downto 0) := "001";

    -- Timer Constants
    constant GREEN_CYCLES  : integer := CLK_FREQ_Hz * GREEN_TIME_S;
    constant YELLOW_CYCLES : integer := CLK_FREQ_Hz * YELLOW_TIME_S;

    -- State Definition
    -- We cycle: North -> East -> South -> West
    type t_State is (
        N_GO, N_YEL,  -- North Cycle
        E_GO, E_YEL,  -- East Cycle
        S_GO, S_YEL,  -- South Cycle
        W_GO, W_YEL   -- West Cycle
    );
    
    signal current_state, next_state : t_State;

    -- Timer Signals
    signal timer_counter : integer range 0 to GREEN_CYCLES; -- Max range needed
    signal timer_done    : std_logic;
    signal reset_timer   : std_logic; -- Flag to reset timer on state change

begin

    --------------------------------------------------------------------------
    -- 1. STATE REGISTER PROCESS
    -- Moves the FSM to the next state on clock edge.
    --------------------------------------------------------------------------
    process(clk, rst)
    begin
        if (rst = '1') then
            current_state <= N_GO;
        elsif rising_edge(clk) then
            current_state <= next_state;
        end if;
    end process;

    --------------------------------------------------------------------------
    -- 2. TIMER PROCESS
    -- Handles the counting for Green and Yellow durations.
    --------------------------------------------------------------------------
    process(clk, rst)
    begin
        if (rst = '1') then
            timer_counter <= 0;
            timer_done <= '0';
        elsif rising_edge(clk) then
            if (reset_timer = '1') then
                timer_counter <= 0;
                timer_done <= '0';
            else
                -- Check based on current state what the limit is
                case current_state is
                    when N_GO | E_GO | S_GO | W_GO =>
                        if (timer_counter >= GREEN_CYCLES - 1) then
                            timer_done <= '1';
                        else
                            timer_counter <= timer_counter + 1;
                            timer_done <= '0';
                        end if;
                    when others => -- All Yellow states
                        if (timer_counter >= YELLOW_CYCLES - 1) then
                            timer_done <= '1';
                        else
                            timer_counter <= timer_counter + 1;
                            timer_done <= '0';
                        end if;
                end case;
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------
    -- 3. NEXT STATE LOGIC
    -- Combinational logic to decide the next state based on inputs (timer).
    --------------------------------------------------------------------------
    process(current_state, timer_done)
    begin
        -- Default to stay in current state
        next_state <= current_state;
        reset_timer <= '0'; -- Default: let timer run

        case current_state is
            
            -- NORTH CYCLE
            when N_GO =>
                if (timer_done = '1') then
                    next_state <= N_YEL;
                    reset_timer <= '1'; -- Reset timer for next state
                end if;
            when N_YEL =>
                if (timer_done = '1') then
                    next_state <= E_GO;
                    reset_timer <= '1';
                end if;

            -- EAST CYCLE
            when E_GO =>
                if (timer_done = '1') then
                    next_state <= E_YEL;
                    reset_timer <= '1';
                end if;
            when E_YEL =>
                if (timer_done = '1') then
                    next_state <= S_GO;
                    reset_timer <= '1';
                end if;

            -- SOUTH CYCLE
            when S_GO =>
                if (timer_done = '1') then
                    next_state <= S_YEL;
                    reset_timer <= '1';
                end if;
            when S_YEL =>
                if (timer_done = '1') then
                    next_state <= W_GO;
                    reset_timer <= '1';
                end if;

            -- WEST CYCLE
            when W_GO =>
                if (timer_done = '1') then
                    next_state <= W_YEL;
                    reset_timer <= '1';
                end if;
            when W_YEL =>
                if (timer_done = '1') then
                    next_state <= N_GO; -- Loop back to North
                    reset_timer <= '1';
                end if;

        end case;
    end process;

    --------------------------------------------------------------------------
    -- 4. OUTPUT LOGIC
    -- Combinational logic to set the light outputs based on state.
    --------------------------------------------------------------------------
    process(current_state)
    begin
        -- Default: ALL RED for safety
        north_light <= LIGHT_RED;
        east_light  <= LIGHT_RED;
        south_light <= LIGHT_RED;
        west_light  <= LIGHT_RED;

        case current_state is
            when N_GO  => north_light <= LIGHT_GREEN;
            when N_YEL => north_light <= LIGHT_YELLOW;
            
            when E_GO  => east_light  <= LIGHT_GREEN;
            when E_YEL => east_light  <= LIGHT_YELLOW;
            
            when S_GO  => south_light <= LIGHT_GREEN;
            when S_YEL => south_light <= LIGHT_YELLOW;
            
            when W_GO  => west_light  <= LIGHT_GREEN;
            when W_YEL => west_light  <= LIGHT_YELLOW;
        end case;
    end process;

end Behavioral;
