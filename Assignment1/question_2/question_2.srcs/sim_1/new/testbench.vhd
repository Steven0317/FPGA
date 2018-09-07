----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/27/2018 10:18:22 PM
-- Design Name: 
-- Module Name: testbench - Behavioral
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

entity tb is
end tb;

architecture testbench of tb is

    component bcd_2_bin
        Port(
            bcd_0 : in std_logic_vector(3 downto 0);
            bcd_1 : in std_logic_vector(3 downto 0);
            bin : out std_logic_vector(7 downto 0)
            );
    end component;
    
        signal bcd_0 : std_logic_vector(3 downto 0) :=(others => '0');
        signal bcd_1 : std_logic_vector(3 downto 0) := (others => '0');
        signal bin :std_logic_vector(7 downto 0);

    begin
    
        uut : bcd_2_bin 
            Port map(
                bcd_0 => bcd_0,
                bcd_1 => bcd_1,
                bin => bin
                );
                
                process
                
                begin
                
                bcd_0 <= "0000";
                bcd_1 <= "0000";
                wait for 200 ns;
                
                bcd_0 <= "0001";
                bcd_1 <= "0001";
                wait for 200 ns;
                
                bcd_0 <= "0010";
                bcd_1 <= "0010";
                wait for 200 ns;
                
                bcd_0 <= "0010";
                bcd_1 <= "0011";
                wait for 200 ns;
                
                bcd_0 <= "1010";
                bcd_1 <= "0101";
                wait for 200 ns;
                
                end process;
                
end testbench;
