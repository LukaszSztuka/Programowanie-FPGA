
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity Bramka_3stanAND is
	port(
		A,B,C : in std_logic;
		D : out std_logic
		);

end Bramka_3stanAND;

architecture Bramka_test_arch of Bramka_3stanAND is

begin

	D <= A or B or C; 

end architecture Bramka_test_arch;

