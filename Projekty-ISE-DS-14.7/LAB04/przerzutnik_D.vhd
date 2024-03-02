
--Uk³ad: Przerzutnik typu D

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity przerzutnik_D is

	port(
		D		: in std_logic;	-- wejœcie danych
		RESET	: in std_logic;	-- wejœcie resetuj¹ce (asynchroniczne)
		CLK	: in std_logic;	-- wejœcie sygna³u zegarowego
		Q		: out std_logic		-- wyjœcie danych (stan wewnêtrzny)
		);
		
end przerzutnik_D;

architecture przerzutnik_D_arch of przerzutnik_D is

begin

przerzutnik_D : process(clk, reset)				-- proces z list¹ czu³oœci
	begin
		if (RESET = '0') then						-- sprawdzanie RESET (asynchronicznie)
			Q <= '0';									-- zerowanie przerzutnika
		elsif (CLK'event and CLK = '1') then	-- czy zbocze narastajace? 
			Q <= D;										-- przepisanie stanu wejœcia na wyjœcie 
			
		end if;
	end process przerzutnik_D;
end przerzutnik_D_arch;

