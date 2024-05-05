library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all; 
use ieee.std_logic_unsigned.all;

entity product is  
	
    port (
        A, B: in  std_logic_vector (7 downto 0);
        P: out std_logic_vector (15 downto 0)
    );	 
	
end entity product;

architecture arh of product is  

	component eight_bit_adder_substractor 		
	
	port( A,B: in std_logic_vector( 7 downto 0);
	SEL0: in std_logic;   
	S: out std_logic_vector( 7 downto 0);
	COUT : out std_logic);
	
end component; 

signal P2, P3, P4, P5, P6,P7,P8:  std_logic_vector (7 downto 0); 
signal B0, B1, B2, B3, B4, B5, B6:  std_logic_vector (7 downto 0); 

begin

     P2 <= (A(7) and B(1), A(6) and B(1), A(5) and B(1), A(4) and B(1), A(3) and B(1), A(2) and B(1), A(1) and B(1), A(0) and B(1)); 
    P3 <= (A(7) and B(2), A(6) and B(2), A(5) and B(2), A(4) and B(2), A(3) and B(2), A(2) and B(2), A(1) and B(2), A(0) and B(2));
    P4 <= (A(7) and B(3), A(6) and B(3), A(5) and B(3), A(4) and B(3), A(3) and B(3), A(2) and B(3), A(1) and B(3), A(0) and B(3));	
	P5 <= (A(7) and B(4), A(6) and B(4), A(5) and B(4), A(4) and B(4), A(3) and B(4), A(2) and B(4), A(1) and B(4), A(0) and B(4));
	P6 <= (A(7) and B(5), A(6) and B(5), A(5) and B(5), A(4) and B(5), A(3) and B(5), A(2) and B(5), A(1) and B(5), A(0) and B(5));
	P7 <= (A(7) and B(6), A(6) and B(6), A(5) and B(6), A(4) and B(6), A(3) and B(6), A(2) and B(6), A(1) and B(6), A(0) and B(6)); 
	P8 <= (A(7) and B(7), A(6) and B(7), A(5) and B(7), A(4) and B(7), A(3) and B(7), A(2) and B(7), A(1) and B(7), A(0) and B(7));
    B0 <=  ('0', A(7) and B(0), A(6) and B(0), A(5) and B(0), A(4) and B(0), A(3) and B(0), A(2) and B(0), A(1) and B(0));


ad1: 
   	eight_bit_adder_substractor  
        port map (
            A => P2,
            B => B0,
            SEL0 => '0',
            COUT => B1(7), 
            S(7) => B1(6), 
            S(6) => B1(5), 
            S(5) => B1(4),
			S(4) => B1(3),
			S(3) => B1(2),
			S(2) => B1(1),
			S(1) => B1(0),
            S(0) => P(1)
        );
ad2: 
    eight_bit_adder_substractor  
        port map (
            A => P3,
            B => B1,
            SEL0 => '0',
            COUT => B2(7), 
            S(7) => B2(6), 
            S(6) => B2(5), 
            S(5) => B2(4),
			S(4) => B2(3),
			S(3) => B2(2),
			S(2) => B2(1),
			S(1) => B2(0),
            S(0) => P(2)
        );
ad3: 
    eight_bit_adder_substractor  
        port map (
            A =>P4,
            B => B2,
            SEL0 => '0',
            COUT => B3(7), 
            S(7) => B3(6), 
            S(6) => B3(5), 
            S(5) => B3(4),
			S(4) => B3(3),
			S(3) => B3(2),
			S(2) => B3(1),
			S(1) => B3(0),
            S(0) => P(3)
        );	

ad4: 
	eight_bit_adder_substractor  
        port map (
            A => P5,
            B => B3,
            SEL0 => '0',
            COUT => B4(7), 
            S(7) => B4(6), 
            S(6) => B4(5), 
            S(5) => B4(4),
			S(4) => B4(3),
			S(3) => B4(2),
			S(2) => B4(1),
			S(1) => B4(0),
            S(0) => P(4)
        );
		
ad5: 
    eight_bit_adder_substractor 
        port map (
            A => P6,
            B => B4,
            SEL0 => '0',
            COUT => B5(7), 
            S(7) => B5(6), 
            S(6) => B5(5), 
            S(5) => B5(4),
			S(4) => B5(3),
			S(3) => B5(2),
			S(2) => B5(1),
			S(1) => B5(0),
            S(0) => P(5)
        ); 
		
ad6: 
    eight_bit_adder_substractor  
        port map (
            A => P6,
            B => B5,
            SEL0 => '0',
            COUT => B6(7), 
            S(7) => B6(6), 
            S(6) => B6(5), 
            S(5) => B6(4),
			S(4) => B6(3),
			S(3) => B6(2),
			S(2) => B6(1),
			S(1) => B6(0),
            S(0) => P(6)
        ); 
		
ad7: 
    eight_bit_adder_substractor  
         port map (
            A => P8,
            B => B6,
            SEL0 => '0',
            COUT => P(15),
            S => P(14 downto 7)
        );
    P(0) <= A(0) and B(0); 
	
end arh;