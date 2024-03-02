
--Uk³ad: Pó³sumator

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Sumator is						-- Jednostka projektowa pó³sumatora
	port(									--deklaracja portów
		A, B : in std_logic;			-- Wejœcia
		S, C : out std_logic			-- Wyjœcia
		);
end Sumator;

architecture Sumator_arch of Sumator is	-- Architektura pó³sumatora

begin										--cia³o architektury

	S <= A xor B;		-- obliczanie sumy
	C <= A and B;		-- obliczanie bitu przeniesienia

end Sumator_arch;

