----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/02/2018 02:39:15 AM
-- Design Name: 
-- Module Name: disp_mux - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity disp_mux is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           in3 : in STD_LOGIC_VECTOR(6 downto 0);
           in2 : in STD_LOGIC_VECTOR(6 downto 0);
           in1 : in STD_LOGIC_VECTOR(6 downto 0);
           in0 : in STD_LOGIC_VECTOR(6 downto 0);
           an : out STD_LOGIC_VECTOR(3 downto 0);
           sseg : out STD_LOGIC_VECTOR(6 downto 0)
          );
end disp_mux;

architecture Behavioral of disp_mux is

    constant N : integer := 18;
    signal q_reg, q_next : unsigned(N-1 downto 0);
    signal sel : std_logic_vector(1 downto 0);
    signal sseq : std_logic_vector(6 downto 0); 

begin

    process(clk, reset)
    begin
        if reset = '1' then
            q_reg <= (others=> '0');
        elsif (clk'event and clk='1') then
            q_reg <= q_next;
        end if;
    end process;
    
    q_next <= q_reg + 1;
    
    sel <= std_logic_vector(q_reg(N-1 downto N-2));
    process(sel,in0,in1,in2,in3)
    begin
        case sel is
            when "00" =>
                an <= "1110";
                sseg <= in0;
            when "01" =>
                an <= "1101";
                sseg <= in1;
            when "10" =>  
                an <= "1011";
                sseg <= in2;
            when others =>
                an <= "0111";
                sseg <= in3;
            end case;
    end process;
end Behavioral;
