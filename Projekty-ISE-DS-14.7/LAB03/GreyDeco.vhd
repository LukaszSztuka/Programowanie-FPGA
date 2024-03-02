
-- Uk³ad: Dekoder kodu greya

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity GreyDeco is									-- opis wejœæ i wyjœæ dekodera
	port(
		X : in std_logic_vector (3 downto 0);	-- wejœcie (4 bitowe kod greya)
		Y : out std_logic_vector (15 downto 0)	-- wyjœcie (16 bitowe kod 1 z 16)
		);
end GreyDeco;

architecture GrayDeco_arch of GreyDeco is		--architektura 

begin

	 Y <= "0000000000000001" when X = "0000" else		-- warunkowe przypisanie do sygna³u (sygnal w kodzie greya przypisywany jest odpowiadaj¹cemu mu sygna³owi w kodzie 1 z 16)
			"0000000000000010" when X = "0001" else
			"0000000000000100" when X = "0010" else
			"0000000000001000" when X = "0011" else
			"0000000000010000" when X = "0100" else
			"0000000000100000" when X = "0101" else
			"0000000001000000" when X = "0110" else
			"0000000010000000" when X = "0111" else
			"0000000100000000" when X = "1111" else 
			"0000001000000000" when X = "1110" else
			"0000010000000000" when X = "1101" else
			"0000100000000000" when X = "1100" else
			"0001000000000000" when X = "1011" else
			"0010000000000000" when X = "1010" else
			"0100000000000000" when X = "1001" else
			"1000000000000000" when X = "1000" else
			"----------------";

end GrayDeco_arch;

