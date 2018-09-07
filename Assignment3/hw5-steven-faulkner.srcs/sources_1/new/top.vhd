library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity top is
  Port (btnC, clk, btnU, btnR, btnL, btnD: in std_logic;
        sw: in std_logic_vector(3 downto 0);
        led: out std_logic_vector(15 downto 0);
        an  : out std_logic_vector(3 downto 0);
        seg : out std_logic_vector(6 downto 0)
  
  );
end top;

architecture arch of top is
    signal btnU_db, btnR_db, btnD_db, btnC_db, btnL_db : std_logic;
    signal bin_out1, sseg0, sseg1, sseg2, sseg3, outp : std_logic_vector(7 downto 0);
    signal hex0, hex1, hex2, hex3: std_logic_vector (3 downto 0);
begin

     dbU : entity work.debouncer
        port map(clk => clk, reset => '0', db_in => btnU, db_out => btnU_db);
     dbR : entity work.debouncer
        port map(clk => clk, reset => '0', db_in => btnR, db_out => btnR_db);
     dbD : entity work.debouncer
        port map(clk => clk, reset => '0', db_in => btnD, db_out => btnD_db);
     dbC : entity work.debouncer
        port map(clk => clk, reset => '0', db_in => btnC, db_out => btnC_db);
     dbL : entity work.debouncer
        port map(clk => clk, reset => '0', db_in => btnL, db_out => btnL_db);

     bcd : entity work.bcd2bin
        port map(inputB => sw(3 downto 0), inputA => x"0", bin_out => bin_out1);
       
     lock : entity work.d_lock
        port map(my_btnC => btnC_db, 
                 clk => clk, 
                 my_btnU => btnU_db, 
                 my_btnR => btnR_db, 
                 my_btnL => btnL_db, 
                 my_btnD => btnD_db,
                 my_sw => bin_out1(3 downto 0),
                 hex0 => hex0,
                 hex1 => hex1,
                 hex2 => hex2, 
                 hex3 => hex3,
                 my_led => led);
                 
     sseg_1 : entity work.hex_to_sseg
        port map(hex => hex0, dp => '1', sseg => sseg0);
                             
     sseg_2 : entity work.hex_to_sseg
        port map(hex => hex1, dp => '1', sseg => sseg1);
                             
     sseg_3 : entity work.hex_to_sseg
        port map(hex => hex2, dp => '0', sseg => sseg2);
                     
     sseg_4 : entity work.hex_to_sseg
        port map(hex => hex3, dp => '1', sseg => sseg3);
     
     disp : entity work.disp_mux
        port map(clk => clk, an => an, in0 => sseg0, in1 => sseg1, in2 => sseg2, in3 => sseg3, reset => btnC, sseg => outp);
                             
     seg <= outp(6 downto 0); 

end arch;
