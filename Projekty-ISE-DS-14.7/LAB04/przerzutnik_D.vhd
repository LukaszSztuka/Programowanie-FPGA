
--Uk�ad: Przerzutnik typu D

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity przerzutnik_D is

	port(
		D		: in std_logic;	-- wej�cie danych
		RESET	: in std_logic;	-- wej�cie resetuj�ce (asynchroniczne)
		CLK	: in std_logic;	-- wej�cie sygna�u zegarowego
		Q		: out std_logic		-- wyj�cie danych (stan wewn�trzny)
		);
		
end przerzutnik_D;

architecture przerzutnik_D_arch of przerzutnik_D is

begin

przerzutnik_D : process(clk, reset)				-- proces z list� czu�o�ci
	begin
		if (RESET = '0') then						-- sprawdzanie RESET (asynchronicznie)
			Q <= '0';									-- zerowanie przerzutnika
		elsif (CLK'event and CLK = '1') then	-- czy zbocze narastajace? 
			Q <= D;										-- przepisanie stanu wej�cia na wyj�cie 
			
		end if;
	end process przerzutnik_D;
end przerzutnik_D_arch;

