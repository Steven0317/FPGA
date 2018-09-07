

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity bin2bcd is
    Port ( num : in STD_LOGIC_VECTOR(7 downto 0);
           bcd_out : out STD_LOGIC_VECTOR(11 downto 0 )
          );
end bin2bcd;

architecture Behavioral of bin2bcd is

begin
    
    b2b : process(num)
        variable shift : unsigned(19 downto 0);
        
        alias digit is shift(7 downto 0 );
        alias ones is shift(11 downto 8);
        alias tens is shift(15 downto 12);
        alias huns is shift(19 downto 16);
        
        begin
        
        digit := unsigned(num);
        ones := X"0";
        tens := X"0";
        huns := X"0";
        

        for k in 1 to digit'Length loop
            if ones >= 5 then
                ones := ones + 3;
            end if;
            if tens >= 5 then
                tens := ones + 3;
            end if;
            if huns >= 5 then
                huns := ones + 3;
            end if;

            shift := shift_left(shift,1);
       end loop;
       
       
       bcd_out <= std_logic_vector(huns) & std_logic_vector(tens) 
                    & std_logic_vector(ones);
        end process;
end Behavioral;
