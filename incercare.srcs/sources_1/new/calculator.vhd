library ieee;   

use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all; 
use ieee.std_logic_unsigned.all;

entity Calculator is	
	
    port ( 
           A : in std_logic_vector (7 downto 0);
           B: in std_logic_vector (7 downto 0); 
		   sel : in std_logic_vector (1 downto 0); 
		   semn1,semn2: in std_logic;
		   semn_out: out std_logic;
           clk: in std_logic;
		   anod : out STD_LOGIC_VECTOR (3 downto 0);
		   catod: out std_logic_vector(6 downto 0)  
		   
		   );
end Calculator;	   


architecture arh of Calculator is	 
	

  component alegere	
	
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
end component;	  

component display 

        port(
	clk:in std_logic;
	rez0,rez1,rez2,rez3 : in std_logic_vector(3 downto 0);
	anozi:out std_logic_vector(3 downto 0);	  
	catod:out std_logic_vector(6 downto 0)); 
   
end component;

 
signal SIG0,SIG1,SIG2,SIG3: std_logic_vector(3 downto 0);  -- 7 bit decoded input. 
signal rez,rest: std_logic_vector(7 downto 0);
signal rez_inm: std_logic_vector(15 downto 0);

begin 
	

   operatie1: alegere

port map(
	
    A=>A ,
    B=>B,
	semn1=>semn1,
	semn2=>semn2,
    sel=>sel,
    rez=>rez,
    rez_inm=>rez_inm,
	rest=>rest,
	seg0=>SIG0,
	seg1=>SIG1,
	seg2=>SIG2,
	seg3=>SIG3,
	semn_out=>semn_out
    );	  
    
	

afisare: display
port map
(
clk=>clk,

	  rez0=>SIG0,
	  rez1=>SIG1,
	  rez2=>SIG2,
	  rez3=>SIG3,
	  anozi=>anod,
	  catod=>catod
     
    );

 
end arh;