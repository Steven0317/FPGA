----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/27/2018 08:58:23 PM
-- Design Name: 
-- Module Name: bcd_2_bin - bcd_arch
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
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity bcd_2_bin is
    Port ( bcd_0 : in STD_LOGIC_VECTOR(3 downto 0);
           bcd_1 : in STD_LOGIC_VECTOR(3 downto 0);
           bin : out STD_LOGIC_VECTOR(7 downto 0)
           );
end bcd_2_bin;

architecture bcd_arch of bcd_2_bin is

begin

    bin <= (bcd_0 * "1010") + (bcd_1 * "01");

end bcd_arch;
