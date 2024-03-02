
--Uk³ad: Licznik

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity Licznik is

	port (
		D		: in std_logic_vector (7 downto 0);			--wejœcie danych
		Q		: out std_logic_vector (7 downto 0);		--wyjœcie licznika
		T		: in std_logic_vector (1 downto 0);			--wejœcie steruj¹ce
		CLK	: in std_logic;									--wejœcie zegarowe
		RESET : in std_logic 									--wejœcie zeruj¹ce
		);
		
end Licznik;

architecture Licznik_arch of Licznik is

signal rejestr : std_logic_vector (7 downto 0);			--sygna³ wewnêtrzny: pamiêæ

begin
	licznik : process (CLK, RESET)					--process z list¹ czu³oœci
	begin
		if (RESET = '0') then							--sygna³ zerowania aktywny
			rejestr <= (others => '0');				--zeruj pamiêæ
		elsif (CLK'event and CLK = '1') then		--zbocze narastaj¹ce CLK
			if T = "00" then								--tryb inkrementacji
				rejestr <= rejestr + 1;
			elsif T = "01" then							--tryb dekrementacji
				rejestr <= rejestr - 1;
			elsif T = "11" then							--tryb inicjalizacji z wejœcia D
				rejestr <= D;
			end if;											--bez zmian dla T = "10"
		end if;
	end process licznik;
	
	Q <= rejestr;											--przepisz sygna³ wew. na wyjœcie Q

end Licznik_arch;

