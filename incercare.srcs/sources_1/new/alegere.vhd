library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all; 
use ieee.std_logic_unsigned.all;

entity alegere is	
	
    port ( 
		   
           A : in std_logic_vector (7 downto 0);
           B: in std_logic_vector (7 downto 0);   
		   semn1, semn2: in std_logiC;
		   sel: in std_logic_vector(1 downto 0);
           rez : out std_logic_vector (7 downto 0);
           rez_inm: out std_logic_vector (15 downto 0);
           rest : out std_logic_vector (7 downto 0);
		   seg0,seg1,seg2,seg3: out std_logic_vector(3 downto 0);	  
		   semn_out: out std_logic
         
		   );
end alegere;

architecture arh of alegere is

component eight_bit_adder_substractor 		
	
	port( A,B: in std_logic_vector( 7 downto 0);
	SEL0: in std_logic;   
	S: out std_logic_vector( 7 downto 0);
	COUT : out std_logic);
	
end component; 	

component product 
	
    port (
        A, B: in  std_logic_vector (7 downto 0);
        P: out std_logic_vector (15 downto 0)
    );	 
	
end component; 

component divider			  
	
	port(
A,B :in std_logic_vector(7 downto 0);
	C: out std_logic_vector(7 downto 0);
	R: out std_logic_vector(7 downto 0)
	);
	
end component;	

component comparator 
	
	port (
	A, B :in std_logic_vector (7 downto 0);
	comparare :out std_logic
	); 
	
end component;

signal rez_adunare: std_logic_vector(7 downto 0);
signal rez_scadere: std_logic_vector(7 downto 0);
signal rez_inversare: std_logic_vector(7 downto 0);
signal rez_impartire: std_logic_vector(7 downto 0);
signal rez_inmultire: std_logic_vector(15 downto 0);
signal rez_rest: std_logic_vector(7 downto 0);
signal comparare: std_logic;
signal aux1,aux2,aux3: std_logic;



begin 
suma: eight_bit_adder_substractor 
	port map(
    A=>A ,
    B=>B,
    SEL0=>'0',
    S=>rez_adunare,
    Cout=>aux1
    );
	
diferenta: eight_bit_adder_substractor 
	port map(
    A=>A ,
    B=>B ,
    SEL0=>'1',
    S=>rez_scadere,
    Cout=>aux2
    );	
								 
   
inmultirea: product 
	port map(
    A=>A,
    B=>B,
    P=>rez_inmultire
    );
    
impartirea: divider
	port map (
    A=>A,
    B=>B,
    C=>rez_impartire,
    R=>rez_rest
    );
inversare: eight_bit_adder_substractor 
	port map(
    A=>B ,
    B=>A ,
    SEL0=>'1',
    S=>rez_inversare,
    Cout=>aux3
    );	  	
	
compara: comparator
port map
(A=>A,
B=>B,
comparare=>comparare);

  
process (A,B,sel,semn1,semn2) 

begin  			
	
	
        if (sel="00" and semn1='1' and semn2='0' and comparare='1') then
            rez<=rez_scadere;
			rest<="00000000" ;
			rez_inm<="0000000000000000" ;
			seg0<=rez_scadere(3 downto 0);
			seg1<=rez_scadere(7 downto 4);
			seg2<="0000";
			seg3<="0000";  
			
			semn_out<='1';
        end if;	
		
		
        if (sel="00" and semn1='0' and semn2='1' and comparare='1') then
            rez<=rez_scadere;
			rest<="00000000" ;
			rez_inm<="0000000000000000" ;
			seg0<=rez_scadere(3 downto 0);
			seg1<=rez_scadere(7 downto 4);
			seg2<="0000";
			seg3<="0000";  
			
			semn_out<='0';
        end if;	 
		
		if (sel="00" and semn1='0' and semn2='1' and comparare='0') then
            rez<=rez_inversare;
			rest<="00000000" ;
			rez_inm<="0000000000000000" ;
			seg0<=rez_inversare(3 downto 0);
			seg1<=rez_inversare(7 downto 4);
			seg2<="0000";
			seg3<="0000";  
			
			semn_out<='1';
        end if;	
		
		
		if (sel="00" and semn1='1' and semn2='0' and comparare='0') then
            rez<=rez_inversare;
			rest<="00000000" ;
			rez_inm<="0000000000000000" ;
			seg0<=rez_inversare(3 downto 0);
			seg1<=rez_inversare(7 downto 4);
			seg2<="0000";
			seg3<="0000";  
				  
			semn_out<='0';
        end if;	   
		
		if (sel="00" and semn1='1' and semn2='1' ) then
            rez<=rez_adunare;
			rest<="00000000" ;
			rez_inm<="0000000000000000" ;
			seg0<=rez_adunare(3 downto 0);
			seg1<=rez_adunare(7 downto 4);
			seg2<="0000";
			seg3<="0000";  
			
			semn_out<='1';
        end if;
		
		if (sel="00" and semn1='0' and semn2='0' ) then
            rez<=rez_adunare;
			rest<="00000000" ;
			rez_inm<="0000000000000000" ;
			seg0<=rez_adunare(3 downto 0);
			seg1<=rez_adunare(7 downto 4);
			seg2<="0000";
			seg3<="0000";  
			
			semn_out<='0';
        end if;
		
		
        
        
		
		if (sel="01" and semn1='1' and semn2='0' ) then
            rez<=rez_adunare;
			rest<="00000000" ;
			rez_inm<="0000000000000000" ;
			seg0<=rez_adunare(3 downto 0);
			seg1<=rez_adunare(7 downto 4);
			seg2<="0000";
			seg3<="0000";  
			
			semn_out<='1';
        end if;	   
		
		if (sel="01" and semn1='0' and semn2='1' ) then
            rez<=rez_adunare;
			rest<="00000000" ;
			rez_inm<="0000000000000000" ;
			seg0<=rez_adunare(3 downto 0);
			seg1<=rez_adunare(7 downto 4);
			seg2<="0000";
			seg3<="0000";  
			
			semn_out<='0';
        end if;	
		
		if (sel="01" and semn1='1' and semn2='1' and comparare='1') then
            rez<=rez_inversare;
			rest<="00000000" ;
			rez_inm<="0000000000000000" ;
			seg0<=rez_inversare(3 downto 0);
			seg1<=rez_inversare(7 downto 4);
			seg2<="0000";
			seg3<="0000";  
				
			semn_out<='1';
        end if;	
		
		if (sel="01" and semn1='1' and semn2='1' and comparare='0') then
            rez<=rez_inversare;
			rest<="00000000" ;
			rez_inm<="0000000000000000" ;
			seg0<=rez_inversare(3 downto 0);
			seg1<=rez_inversare(7 downto 4);
			seg2<="0000";
			seg3<="0000";  
				
			semn_out<='0';
        end if;	
		
		
		
		if (sel="01" and semn1='0' and semn2='0' and comparare='1') then
            rez<=rez_scadere;
			rest<="00000000" ;
			rez_inm<="0000000000000000" ;
			seg0<=rez_scadere(3 downto 0);
			seg1<=rez_scadere(7 downto 4);
			seg2<="0000";
			seg3<="0000";  
			 
			semn_out<='0';
        end if;
		
		 if (sel="01" and semn1='0' and semn2='0' and comparare='0') then
            rez<=rez_inversare;
			rest<="00000000" ;
			rez_inm<="0000000000000000" ;
			seg0<=rez_inversare(3 downto 0);
			seg1<=rez_inversare(7 downto 4);
			seg2<="0000";
			seg3<="0000";  
				
			semn_out<='1';
        end if; 
		
        
        if (sel="10" and semn1='0' and semn2='0') then
            rez_inm<=rez_inmultire;
            rest<="00000000";
			rez<="00000000";
			seg0<=rez_inmultire(3 downto 0);
			seg1<=rez_inmultire(7 downto 4);
			seg2<=rez_inmultire(11 downto 8);
			seg3<=rez_inmultire(15 downto 12);
			
			semn_out<='0';
        end if;    
		
		if (sel="10" and semn1='1' and semn2='0') then
            rez_inm<=rez_inmultire;
            rest<="00000000"; 
			rez<="00000000";
			seg0<=rez_inmultire(3 downto 0);
			seg1<=rez_inmultire(7 downto 4);
			seg2<=rez_inmultire(11 downto 8);
			seg3<=rez_inmultire(15 downto 12);
			
			semn_out<='1' ;
        end if;    
		
		if (sel="10" and semn1='0' and semn2='1') then
            rez_inm<=rez_inmultire;
            rest<="00000000";
			rez<="00000000";
			seg0<=rez_inmultire(3 downto 0);
			seg1<=rez_inmultire(7 downto 4);
			seg2<=rez_inmultire(11 downto 8);
			seg3<=rez_inmultire(15 downto 12);
			
			semn_out<='1';
        end if; 
		
		if (sel="10" and semn1='1' and semn2='1') then
            rez_inm<=rez_inmultire;
            rest<="00000000"; 
			rez<="00000000";
			seg0<=rez_inmultire(3 downto 0);
			seg1<=rez_inmultire(7 downto 4);
			seg2<=rez_inmultire(11 downto 8);
			seg3<=rez_inmultire(15 downto 12);
			
			semn_out<='0';
        end if; 
        if (sel="11" and semn1='0' and semn2='0') then
            rez<=rez_impartire;	
			rest<=rez_rest;
			rez_inm<="0000000000000000" ;
			seg2<=rez_impartire(3 downto 0);
			seg3<=rez_impartire(7 downto 4);
			seg0<=rez_rest(3 downto 0);
			seg1<=rez_rest(7 downto 4);	
			
			semn_out<='0';
        end if;    
		
		if (sel="11" and semn1='1' and semn2='0') then
            rez<=rez_impartire;	
			rest<=rez_rest;	
			rez_inm<="0000000000000000" ;
			seg2<=rez_impartire(3 downto 0);
			seg3<=rez_impartire(7 downto 4);
			seg0<=rez_rest(3 downto 0);
			seg1<=rez_rest(7 downto 4);	
			
			semn_out<='1';
        end if;    
		
		if (sel="11" and semn1='0' and semn2='1') then
            rez<=rez_impartire;	
			rest<=rez_rest;	
			rez_inm<="0000000000000000" ;
			seg2<=rez_impartire(3 downto 0);
			seg3<=rez_impartire(7 downto 4);
			seg0<=rez_rest(3 downto 0);
			seg1<=rez_rest(7 downto 4);	
			
			semn_out<='1';
        end if; 
		
		if (sel="11" and semn1='1' and semn2='1') then
             rez<=rez_impartire;	
			rest<=rez_rest;	
			rez_inm<="0000000000000000" ;
			seg2<=rez_impartire(3 downto 0);
			seg3<=rez_impartire(7 downto 4);
			seg0<=rez_rest(3 downto 0);
			seg1<=rez_rest(7 downto 4);	
			semn_out<='0';
        end if;  
		
        
        
       
 end process;
 

 
end arh;