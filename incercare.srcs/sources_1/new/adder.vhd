library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all; 
use ieee.std_logic_unsigned.all;

entity ADDER_1 is
	 port(
		 X1 : in std_logic;
		 X2 : in std_logic; 
		 SEL0: in std_logic;
		 
		 COUT : out std_logic;
		 S : out std_logic
	     );
end ADDER_1;



architecture s1 of ADDER_1 is  	 
begin
	
 	 
	
	
		
	S<= X1 xor X2 xor SEL0;
	COUT<= (X1 AND X2) OR (X1 AND SEL0) OR (SEL0 AND X2);	
	
	
	

end s1;	  


library IEEE,WORK, STD;	 
use STD.STANDARD.all;
use IEEE.STD_LOGIC_1164.all;


entity eight_bit_adder_substractor is		
	
	port( A,B: in std_logic_vector( 7 downto 0);
	SEL0: in std_logic;   
	S: out std_logic_vector( 7 downto 0);
	COUT : out std_logic);
	
end eight_bit_adder_substractor; 

arChitecture s2 of eight_bit_adder_substractor is
component ADDER_1
	 port(
		 X1 : in std_logic;
		 X2 : in std_logic; 
		 SEL0: in std_logic;
		 
		 COUT : out std_logic;
		 S : out std_logic
	     );
	
	
end component;	  	



signal co1,co2,co3,co4,co5,co6,co7,co8: std_logic;	
signal B1: std_logic_vector(7 downto 0)	;

begin  
	process(A,B,SEL0)
	variable aux:std_logic_vector( 7 downto 0);
	begin		

		if(SEL0='1') then
			aux:=not(B);
		else  
			aux:=B;
			
		end if;	
	B1<=aux;
	end process;
		
	
	dut1: ADDER_1 port map(A(0),B1(0),SEL0,co1,S(0));
	dut2: ADDER_1 port map(A(1),B1(1),co1,co2,S(1));	 
	dut3: ADDER_1 port map(A(2),B1(2),co2,co3,S(2));	   
	dut4: ADDER_1 port map(A(3),B1(3),co3,co4,S(3));	
	dut5: ADDER_1 port map(A(4),B1(4),co4,co5,S(4));
	dut6: ADDER_1 port map(A(5),B1(5),co5,co6,S(5));	 
	dut7: ADDER_1 port map(A(6),B1(6),co6,co7,S(6));	
	dut8: ADDER_1 port map(A(7),B1(7),co7,COUT,S(7));	
	
end s2;