
-- Uk³ad: Multiplekser

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX4tol is
	port(
		X : in std_logic_vector (3 downto 0);  -- wejœcie danych (4-bitowe)
		A : in std_logic_vector (1 downto 0);  -- wejœcie adresowe (2-bitowe)
		Z : out std_logic);							-- wyjœcie (1-bitowe)

end MUX4tol;

architecture MUX4tol_arch of MUX4tol is		-- architektura 

begin

	 Z <= X(0) when A = "00" else		--przypisanie wektora X elementu o indeksie 0
			X(1) when A = "01" else		--itd.
			X(2) when A = "10" else
			X(3) when A = "11" else
			'-';								-- wartoœæ domyœlna

end MUX4tol_arch;

