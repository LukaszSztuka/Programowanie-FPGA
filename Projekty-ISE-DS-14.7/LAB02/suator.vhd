
--Uk�ad: P�sumator

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Sumator is						-- Jednostka projektowa p�sumatora
	port(									--deklaracja port�w
		A, B : in std_logic;			-- Wej�cia
		S, C : out std_logic			-- Wyj�cia
		);
end Sumator;

architecture Sumator_arch of Sumator is	-- Architektura p�sumatora

begin										--cia�o architektury

	S <= A xor B;		-- obliczanie sumy
	C <= A and B;		-- obliczanie bitu przeniesienia

end Sumator_arch;

