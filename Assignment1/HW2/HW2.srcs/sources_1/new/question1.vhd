----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/30/2018 01:34:01 PM
-- Design Name: 
-- Module Name: AU - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity AU is
    Port ( btn : in STD_LOGIC;
           i1 : in STD_LOGIC_VECTOR(7 downto 0);
           i2 : in STD_LOGIC_VECTOR(7 downto 0);
           output : out STD_LOGIC_VECTOR(7 downto 0)
          );
end AU;

architecture Behavioral of AU is
  begin
    process(i1,i2,btn)
        begin   
              if(btn = '1') then
                    output <= i1 + i2;
              else
                    if (i1 < i2) then
                        output <=  (others => '0');
                    else
                        output <= i1 - i2;
                    end if;
              end if;
        end process;
              
end Behavioral;
