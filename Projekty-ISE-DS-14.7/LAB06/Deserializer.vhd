
--Uk³ad: Deserializer

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity Deserializer is
	port (
		RESET : in std_logic;
		CLK 	: in std_logic;
		WE		: in std_logic;
		WY		: out std_logic_vector (7 downto 0)
		);
end Deserializer;

architecture Deserializer_arch of Deserializer is

signal stanLicz : std_logic_vector (2 downto 0);-- pamiêæ wew. licznika 
signal enable : std_logic;
signal rejestr : std_logic_vector (7 downto 0);

begin


	--Licznik odliczaj¹cy d³ugoœæ s³owa 
	licznik : process (CLK, RESET)					--process z list¹ czu³oœci
	begin
		if (RESET = '0') then							--sygna³ zerowania aktywny
			stanLicz <= (others => '0');				--zeruj pamiêæ licznika
			elsif (CLK'event and CLK = '1')			--zbocze narastaj¹ce CLK
				then	stanLicz <= stanLicz + 1;
		end if;
	end process licznik; 

	--Komparator
	komparator : process (stanLicz)
	begin
		if (stanLicz = "111") then	enable <= '1';
		else enable <= '0';
		end if;
	end process komparator;
	
	--Rejestr przesuwny 	sIsO : process (CLK, RESET)
	begin
		if (RESET = '0' ) then							
			rejestr <= (others => '0');					
		elsif (CLK'event and CLK = '1' ) then	
			if enable = '1' then 
			rejestr <= WE;
		else
			rejestr <= rejestr (6 downto 0) & '1';
			end if;
		end if;
	end process;
				
	WY <= rejestr(7);
	
	
end Deserializer_arch;

