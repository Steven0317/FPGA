----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/27/2018 03:00:30 PM
-- Design Name: 
-- Module Name: q1-1 - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity gt2 is
    Port ( i0,i1 : in STD_LOGIC;
           gt : out STD_LOGIC
          );
end gt2;

architecture sop_arch of gt2 is
    
    signal p0,p1 : std_logic;

begin

    gt <= p0 or p1;
    
    p0 <= ((not i0) and (not i1)) or ((not i0) and i1) or ( i0 and i1);
    p1 <= i0 and (not i1);
end sop_arch;

