library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

entity display is

	port(
	clk:in std_logic;
	
	rez0,rez1,rez2,rez3 : in std_logic_vector(3 downto 0);
	anozi:out std_logic_vector(3 downto 0);	  
	catod:out std_logic_vector(6 downto 0)); 
    
end display;    

architecture arh of display is


signal LED_BCD: STD_LOGIC_VECTOR (3 downto 0);	
signal refresh_counter: STD_LOGIC_VECTOR (19 downto 0);-- creating 10.5ms refresh period 
signal selector: std_logic_vector(1 downto 0);

begin

process(LED_BCD)
begin
    case LED_BCD is
    when "0000" => catod <= "0000001"; -- "0"     
    when "0001" => catod <= "1001111"; -- "1" 
    when "0010" => catod <= "0010010"; -- "2" 
    when "0011" => catod <= "0000110"; -- "3" 
    when "0100" => catod <= "1001100"; -- "4" 
    when "0101" => catod <= "0100100"; -- "5" 
    when "0110" => catod <= "0100000"; -- "6" 
    when "0111" => catod <= "0001111"; -- "7" 
    when "1000" => catod <= "0000000"; -- "8"     
    when "1001" => catod <= "0000100"; -- "9" 
    when "1010" => catod <= "0001000"; -- A
    when "1011" => catod <= "1100000"; -- b
    when "1100" => catod <= "0110001"; -- C
    when "1101" => catod <= "1000010"; -- d
    when "1110" => catod <= "0110000"; -- E
    when "1111" => catod <= "0111000"; -- F
    when others=> catod <="1111111";
    end case;
end process;				


process(clk)
begin 
    if(rising_edge(clk)) then
        refresh_counter <= refresh_counter + 1;
    end if;
end process;	  

 selector <= refresh_counter(19 downto 18);

process(selector)
begin
    case selector is
    when "00" =>
        Anozi <= "0111";    
        LED_BCD <= rez3;
		
    when "01" =>
        Anozi <= "1011"; 
        LED_BCD <= rez2;
        
    when "10" =>
        Anozi <= "1101"; 
        LED_BCD <= rez1;
     
    when "11" =>
        Anozi <= "1110"; 
        LED_BCD <= rez0;
          
	when others => LED_BCD<="0000";
    end case;
end process;


end arh;