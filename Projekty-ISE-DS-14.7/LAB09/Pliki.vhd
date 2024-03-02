
--Uk³ad: Operacje na plikach
library IEEE;
use std.textio.all;					--biblioteka obs³ugi plików
use ieee.std_logic_textio.all;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;



entity Pliki is
	port(
			a : in std_logic_vector (7 downto 0);		--liczba a
			b : in std_logic_vector (7 downto 0);		--liczba b
			c : out std_logic_vector (7 downto 0);		--wynik c
			reset, clk : in std_logic
	);
end Pliki;

architecture Pliki_arch of Pliki is

begin

komb : process(clk, reset)
	begin
		if reset = '0' then
			c <= (others => '0');
		elsif (clk'event and clk = '1') then
			c <= a and b;								-- iloczyn liczb a i b 
		end if;
	end process komb;

end Pliki_arch;









