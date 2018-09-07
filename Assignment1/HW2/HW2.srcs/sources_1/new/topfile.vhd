----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/02/2018 02:18:47 AM
-- Design Name: 
-- Module Name: topfile - Behavioral
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

entity topfile is
    Port ( clk : in STD_LOGIC;
           btnU : in STD_LOGIC;
           sw : in STD_LOGIC_VECTOR(15 downto 0);
           an : out STD_LOGIC_VECTOR(3 DOWNTO 0);
           seg : out STD_LOGIC_VECTOR( 6 DOWNTO 0)
          );
end topfile;

architecture Behavioral of topfile is
    signal sum : std_logic_vector(7 downto 0);
    signal bin1: std_logic_vector(7 downto 0);
    signal bin2: std_logic_vector(7 downto 0);
    signal led0: std_logic_vector(6 downto 0);
    signal led1: std_logic_vector(6 downto 0);
    signal led2: std_logic_vector(6 downto 0);
    signal led3: std_logic_vector(6 downto 0);
    signal op :  std_logic_vector(11 downto 0);

begin
    
    input_i1 : entity work.bcd2bin
        port map( A => sw(7 downto 4), B => sw(3 downto 0), bin_out => bin1);
    
    input_i2 : entity work.bcd2bin
        port map( A =>sw(15 downto 12), B => sw(11 downto 8), bin_out => bin2);
        
    adder : entity work.AU
        port map( i1 => bin1, i2 => bin2, output => sum,  btn => btnU);
    
    back2bcd : entity work.bin2bcd
        port map( num => sum, bcd_out => op); 
    
    sseg0 : entity work.hex2seg
        port map( hex => op( 3 downto 0), sseg => led0);
    
    sseg1 : entity work.hex2seg
        port map( hex => op(7 downto 4), sseg => led1);
     
    sseg2 : entity work.hex2seg
        port map( hex => op(11 downto 8), sseg =>led2);
     
    sseg3 : entity work.hex2seg
        port map( hex => X"0", sseg => led3);
    
    display : entity work.disp_mux
        port map( clk => clk, reset => '0', in0 => led0, in1 => led1, in2 => led2, in3 => led3, an => an, sseg => seg);
end Behavioral;
