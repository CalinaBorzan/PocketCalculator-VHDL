library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.numeric_std.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
entity divider is
	port(
	A,B:in std_logic_vector(7 downto 0);
	C:out std_logic_vector(7 downto 0);
	R: out std_logic_vector(7 downto 0)
	); 
	
end divider ; 

architecture arhi of divider is
signal sh0,sh1,sh2,sh3,sh4,sh5,sh6,sh7,cat,rest: std_logic_vector(0 to 15);	


begin	  
	sh7(8 to 15)<=B;	   
	sh7(0 to 7)<="00000000";
	sh6<=sh7+sh7; 
	sh5<=sh6+sh6;	
	sh4<=sh5+sh5; 
	sh3<=sh4+sh4;	
	sh2<=sh3+sh3;	
	sh1<=sh2+sh2; 
	sh0<=sh1+sh1; 	
	
	process(sh0,sh1,sh2,sh3,sh4,sh5,sh6,sh7,A,B)
	variable r,c:std_logic_vector(0 to 15);
	begin 
		r(8 to 15):=A;
		r(0 to 7):="00000000";
		c:="0000000000000000";
		
		if( sh0>"00" and r>=sh0) then
			r:=r-sh0;
			c:=c+128;
		else
		if( sh1>"00"and r>=sh1) then
			r:=r-sh1;
			c:=c+64;
		else
		if(sh2>"00"and r>=sh2) then 
			r:=r-sh2;
			c:=c+32; 
		else
		if(sh3>"00"and r>=sh3) then 
			r:=r-sh3;
			c:=c+16;
		else
		if(sh4>"00"and r>=sh4) then
			r:=r-sh4;
			c:=c+8;
		else
		if(sh5>"00"and r>=sh5) then
			r:=r-sh5;
			c:=c+4;
		else 
		if( sh6>"00"and r>=sh6) then
			r:=r-sh6;
			c:=c+2;	 
		else
		if( sh7>"00"and r>=sh7) then
			r:=r-sh7;
			c:=c+1;
		end if;
		end if;
		end if;
		end if;
		end if;
		end if;
		end if;
        end if;
		cat<=c;
		rest<=r;
	end process;
		 
	R<=rest(8 to 15);
	C<=cat(8 TO 15);	  
	
end arhi;