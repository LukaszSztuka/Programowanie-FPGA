
--Uk³ad: Sumator 4-bitowy
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Sumator4B is									-- Jednostka projektowa sumatora 4-bitowego
	port(													--deklaracja portów
		A1, A0 : in std_logic;						-- Wejœcia dla liczby A
		B1, B0 : in std_logic;						-- Wejœcia dla liczby B
		C1, C0 : in std_logic;						-- Wejœcia dla liczby C
		D1, D0 : in std_logic;						-- Wejœcia dla liczby D
		S2, S1, S0 : out std_logic					-- Wyjœcia = Wynik
		);
end Sumator2B;

architecture Sumator4B_arch of Sumator4B is	-- Architektura sumatora 2-bitowego

	component Sumator is								-- deklaracja komponentu Pó³sumatora
		port(
			A, B : in std_logic;
			S, C : out std_logic
			);
	end component Sumator;

	component SumatorP is 							--deklaracja komponentu Sumatora pe³nego
		port (
			A, B, Ci : in std_logic;
			S, C :out std_logic
			);
	end component SumatorP;

	signal C0 : std_logic;							--sygna³ wewnêtrzny C0

begin														--cia³o architektury 

	blok1: Sumator port map (A => A0, B => B0, S => S0, C => C0);					--po³¹czenia Pó³sumatora
	blok2: SumatorP port map (A => A1, B => B1, S => S1, C => S2, Ci => C0);	--po³¹czenia Sumatora pe³nego 
	
end Sumator4B_arch;


