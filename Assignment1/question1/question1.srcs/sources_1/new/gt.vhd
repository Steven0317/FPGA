----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/27/2018 04:09:15 PM
-- Design Name: 
-- Module Name: gt - struc_arch
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

entity gt is
    Port( 
       a,b:in  std_logic_vector(1 downto 0);
        agtb : out std_logic
        );
end gt;

architecture struc_arch of gt is

    signal e0,e1 : std_logic;
    
begin
    
        eq_bit0 : entity  work.gt2(sop_arch)
            port map(
                        i0 => a(0),
                        i1 => b(0),
                        gt  => e0
                     );
        eq_bit1 : entity work.gt2(sop_arch)     
            port map(
                         i0 => a(1),
                         i1 => b(1),
                         gt  => e1
                     );
                     
           agtb <=  e0 or e1;
 end struc_arch;