
--Uk�ad: Pe�ny Sumator

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SumatorP is					-- Jednostka projektowa sumatora pe�nego
		Port(								--deklaracja port�w
			A, B : in std_logic;		-- Wej�cia 
			Ci  : in std_logic;		-- Wej�cia bitu przeniesienia
			S, C : out Std_logic		-- Wyj�cia S- suma C-carry
			);
			
end SumatorP;

architecture SumatorP_arch of SumatorP is		-- Architektura sumatora pe�nego

begin										--cia�o architektury

	S <= A xor B xor Ci;									-- obliczanie bitu sumy
	C <= (A and B) or (A and Ci) or (B and Ci);	-- obliczanie bitu przeniesienia 

end SumatorP_arch;

