

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity bcd2bin is
    Port ( inputA : in std_logic_vector(3 downto 0);
           inputB : in std_logic_vector(3 downto 0);
           bin_out : out std_logic_vector(7 downto 0 ) := (others => '0')
          );
end bcd2bin;

architecture Behavioral of bcd2bin is

begin
    bin_out <= (inputA * "1010") + (inputB * "10");

end Behavioral;
