
--Uk�ad: Rejestr przesuwny 

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PIPO is
	port(
		X		: in std_logic_vector (7 downto 0) ;	-- wej�cie danych 8-bitowe
		RESET	: in std_logic;								-- wej�cie zeruj�ce
		CLK	: in std_logic;								-- wej�cie sygna�u zegarowego
		Q		: out std_logic_vector (7 downto 0) 	-- wyj�cie danych 8-bitowe(stan wewn�trzny)
		);
	
end PIPO;

architecture PIPO_arch of PIPO is				-- architektura

begin

PIPO : process (CLK, RESET)						--proces z list� czu�o�ci
	begin
		if (RESET = '0' ) then						-- warunek asychroniczny	
			Q <= (others => '0');					-- mo�na te� zapisa�: Q <= "00000000";
		elsif (CLK'event and CLK = '1') then	-- warunek asychroniczny
			Q (7 downto 0) <= X (7 downto 0);	-- mo�na te� zapisa�: Q <= X;
		end if;
		
end process PIPO;

end PIPO_arch;

