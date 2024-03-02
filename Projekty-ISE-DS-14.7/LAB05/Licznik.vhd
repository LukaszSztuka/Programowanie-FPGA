
--Uk�ad: Licznik

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity Licznik is

	port (
		D		: in std_logic_vector (7 downto 0);			--wej�cie danych
		Q		: out std_logic_vector (7 downto 0);		--wyj�cie licznika
		T		: in std_logic_vector (1 downto 0);			--wej�cie steruj�ce
		CLK	: in std_logic;									--wej�cie zegarowe
		RESET : in std_logic 									--wej�cie zeruj�ce
		);
		
end Licznik;

architecture Licznik_arch of Licznik is

signal rejestr : std_logic_vector (7 downto 0);			--sygna� wewn�trzny: pami��

begin
	licznik : process (CLK, RESET)					--process z list� czu�o�ci
	begin
		if (RESET = '0') then							--sygna� zerowania aktywny
			rejestr <= (others => '0');				--zeruj pami��
		elsif (CLK'event and CLK = '1') then		--zbocze narastaj�ce CLK
			if T = "00" then								--tryb inkrementacji
				rejestr <= rejestr + 1;
			elsif T = "01" then							--tryb dekrementacji
				rejestr <= rejestr - 1;
			elsif T = "11" then							--tryb inicjalizacji z wej�cia D
				rejestr <= D;
			end if;											--bez zmian dla T = "10"
		end if;
	end process licznik;
	
	Q <= rejestr;											--przepisz sygna� wew. na wyj�cie Q

end Licznik_arch;

