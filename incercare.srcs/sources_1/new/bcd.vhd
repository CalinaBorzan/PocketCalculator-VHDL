library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

entity bcd is
port (
        clk_100mhz,reset : in std_logic;
        rez0,rez1,rez2,rez3 : in std_logic_vector(3 downto 0);  --BCD input	
		anod : out STD_LOGIC_VECTOR (3 downto 0);-- cei 4 anozi
        SEGMENT70: out std_logic_vector(6 downto 0)  -- 7 bit decoded output.
    );
end bcd;

architecture arh of bcd is

signal LED_BCD: STD_LOGIC_VECTOR (3 downto 0);-- valoarea afisata a anodului dupa selectia anodului pe rand care va fi luat din vectorul total, num_total 
signal refresh: STD_LOGIC_VECTOR (19 downto 0);-- pt basys 3 sa afiseze bine, trebuie frecventa de 100hz, acesta e contorul
signal selectie: std_logic_vector(1 downto 0);


begin
	
process (LED_BCD)
BEGIN

 case  LED_BCD is
    when "0000"=> SEGMENT70 <="1111110";  -- '0'
    when "0001"=> SEGMENT70 <="0110000";  -- '1'
    when "0010"=> SEGMENT70 <="1101101";  -- '2'
    when "0011"=> SEGMENT70 <="1111001";  -- '3'
    when "0100"=> SEGMENT70 <="0110011";  -- '4'
    when "0101"=> SEGMENT70 <="1011011";  -- '5'
    when "0110"=> SEGMENT70 <="1011111";  -- '6'
    when "0111"=> SEGMENT70 <="1110000";  -- '7'
    when "1000"=> SEGMENT70 <="1111111";  -- '8'
    when "1001"=> SEGMENT70 <="1111011";  -- '9'
    when "1010"=> SEGMENT70 <="1110111";  -- 'A'
    when "1011"=> SEGMENT70 <="0011111";  -- 'b'
	when "1100"=> SEGMENT70 <="1001110";  -- 'C'
	when "1101"=> SEGMENT70 <="0111101";  -- 'D'
	when "1110"=> SEGMENT70 <="1001111";  -- 'E'
	when "1111"=> SEGMENT70 <="1000111";  -- 'F'
    when others=> SEGMENT70 <="0000000";
 end case;		 
 
end process;

process(clk_100mhz,reset) -- divizor de frecventa de la 100Mgh la 100Hz, ca sa fie observabil de om
begin 
    if(reset='1') then
        refresh <= (others => '0'); -- daca e reset, se incepe de la inceput
    elsif(rising_edge(clk_100mhz)) then --clock de la placa 100Mhz
        refresh <= refresh + 1; -- numar pe 20 de biti pentru a obtine frecventa de refresh pentru a se vedea afisorul
    end if;-- pt basys 3 trebuie frecventa de 100hz pt afisor sa fie vizibil
end process;


selectie <= refresh(19 downto 18); -- iau primele 2 valori din vectorul de refrsh, ca sa selectez pe rand fiecare anod la frecventa mai mica pe rand
process(selectie)
begin
    case selectie is -- selectez anodul
    when "00" => -- primul anod activat 
        anod <= "0111"; -- activez pe primul, ceilalti sunt dezactivazti
        LED_BCD <= rez3; --se va afisa  valoarea stocata special pt primul anod
    when "01" => -- randul anodului 2
        anod <= "1011"; -- il activez, ceilalti se inchid 
        LED_BCD <= rez2;-- valoare stocata special pt anodul 2
    when "10" => -- anodul 3 
        anod <= "1101"; -- se activeaza, ceilalti sunt inchisi
        LED_BCD <= rez1;-- valoarea stocata pentru anodul 3
    when "11" => -- anodul 4 activ
        anod <= "1110"; -- acelasi prinipiu
        LED_BCD <= rez0;   
	when others=> anod<="0000";
    end case;
end process;




end arh;