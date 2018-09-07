----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/04/2018 05:57:26 PM
-- Design Name: 
-- Module Name: bcd2bin - Behavioral
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


entity bcd2bin is
 Port(A : in std_logic_vector(3 downto 0);
      B : in std_logic_vector(3 downto 0);
      bin_out : out std_logic_vector(7 downto 0) := (others => '0')
       );
end bcd2bin;

architecture Behavioral of bcd2bin is

begin
    bin_out <= (B *"01") + (A * "1010");
end Behavioral;
