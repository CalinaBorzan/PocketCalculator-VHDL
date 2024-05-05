library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity comparator is
	
	port (
	A, B :in std_logic_vector (7 downto 0);
	comparare :out std_logic
	); 
	
end comparator;

architecture arh of comparator is

begin
	
process(A,B) 

begin	
	
	if(A>=B)	then
		comparare <= '1';
	else	 
		comparare <= '0';
	 
	  
end if;	

end process;

end arh;