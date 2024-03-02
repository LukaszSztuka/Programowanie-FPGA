
-- Uk�ad: Dekoder 1z4


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity BINtolof4 is									-- opis wej�� i wyj�� dekodera
	port(
		X : in std_logic_vector ( 1 downto 0);	-- wej�cie (kod binarny)
		Z : out std_logic_vector (3 downto 0)	-- wyj�cie (kod 1 z 4)
		);
		
end BINtolof4;

architecture BINtolof4_arch of BINtolof4 is 	-- architektura dekodera

begin

	 Z <= "0001" when X = "00" else	-- warunkowe przypisanie do sygna�u
			"0010" when X = "01" else
			"0100" when X = "10" else
			"1000" when X = "11" else
			"----"; 							--warto�� domy�lna
end BINtolof4_arch;

