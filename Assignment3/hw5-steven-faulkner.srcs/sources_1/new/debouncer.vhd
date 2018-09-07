library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity debouncer is
  Port (  
    clk,reset: in std_logic;
    db_in: in std_logic;
    db_out: out std_logic
  );
end debouncer;

architecture Behavioral of debouncer is
    constant N: integer := 21; 
    signal q_reg, q_next: unsigned(N-1 downto 0);
    signal tick_20ms: std_logic;
    type state_type is (zero, wait_one_1, wait_one_2, wait_one_3, 
                        one, wait_zero_1, wait_zero_2,  wait_zero_3);
    signal state, state_next: state_type;
begin
    process(clk, reset)
    begin
        if (reset = '1') then
            q_reg <= (others => '0');
        elsif (rising_edge(clk)) then
            q_reg <= q_next;
        end if;
    end process;
    q_next <= q_reg + 1;
    tick_20ms <= '1' when q_reg = 0 else '0';      
    process(clk,reset)
    begin
        if(reset = '1') then
            state <= zero;
        elsif(rising_edge(clk)) then
            state <= state_next;
        end if;
    end process;
    
   
    process(state, db_in, tick_20ms)
    begin
        state_next <= state; 
        db_out <= '0'; 
        
        case state is
            when zero =>
                if db_in = '1' then
                    state_next <= wait_one_1;
                end if;
            when wait_one_1 =>
                db_out <= '1';
                if tick_20ms = '1' then
                    state_next <= wait_one_2;
                end if;
            when wait_one_2 =>
                db_out <= '1';
                if tick_20ms = '1' then
                    state_next <= wait_one_3;
                end if;
            when wait_one_3 =>
                db_out <= '1';
                if tick_20ms = '1' then
                    state_next <= one;
                end if;
            when one =>
                db_out <= '1';
                if db_in = '0' then
                    state_next <= wait_zero_1;
                end if;
            when wait_zero_1 =>
                if tick_20ms = '1' then
                    state_next <= wait_zero_2;
                end if;
            when wait_zero_2 =>
                if tick_20ms = '1' then
                    state_next <= wait_zero_3;
                end if; 
            when wait_zero_3 =>
                if tick_20ms = '1' then
                    state_next <= zero;
                end if; 
        end case;
    end process;
end Behavioral;