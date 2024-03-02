
--Uk³ad: Pe³ny Sumator

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SumatorP is					-- Jednostka projektowa sumatora pe³nego
		Port(								--deklaracja portów
			A, B : in std_logic;		-- Wejœcia 
			Ci  : in std_logic;		-- Wejœcia bitu przeniesienia
			S, C : out Std_logic		-- Wyjœcia S- suma C-carry
			);
			
end SumatorP;

architecture SumatorP_arch of SumatorP is		-- Architektura sumatora pe³nego

begin										--cia³o architektury

	S <= A xor B xor Ci;									-- obliczanie bitu sumy
	C <= (A and B) or (A and Ci) or (B and Ci);	-- obliczanie bitu przeniesienia 

end SumatorP_arch;

