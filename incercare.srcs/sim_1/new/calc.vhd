----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.05.2023 01:05:26
-- Design Name: 
-- Module Name: calc - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity calc is
--  Port ( );
end calc;

architecture Behavioral of calc is
component Calculator is	
	
    port ( 
           A : in std_logic_vector (7 downto 0);
           B : in std_logic_vector (7 downto 0); 
		   sel : in std_logic_vector (1 downto 0); 
		   semn1,semn2: in std_logic;
		   semn_out: out std_logic;
           clk: in std_logic;
		   anod : out STD_LOGIC_VECTOR (3 downto 0);
		   SEGMENT70: out std_logic_vector(6 downto 0)  
		   
		   );
end component Calculator;
signal A,B:std_logic_vector(7 downto 0):="00000000";
signal sel:std_logic_vector(1 downto 0):="00";
signal semn1,semn2,semn_out,clk:std_logic;
signal anod:std_logic_vector(3 downto 0);
signal SEGMENT70:std_logic_vector(6 downto 0);
begin
l1:Calculator port map(A=>A,B=>B,sel=>sel,semn1=>semn1,semn2=>semn2,semn_out=>semn_out,clk=>clk,anod=>anod,SEGMENT70=>SEGMENT70);
process
begin
clk<='1';
wait for 20 ns;
clk<='0';
wait for 20 ns;
end process;
process
begin
A<="00001001";
B<="00100000";
sel<="00";
semn1<='0';
semn2<='0';
wait for 20 ns;
end process;
end Behavioral;
