
--Uk³ad: Automat

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity AUTO is
	port( CLK, RESET		: in std_logic;		-- wejœcia: zegarowe i reset
			KASA				: in std_logic;		-- wejœcie - stan funduszy
			postep			: out std_logic);		--wyjœcie
end AUTO;

architecture AUTO_arch of AUTO is
type STANY is (fajrant, transit, pod_cegle,cegla);		-- deklaracja typu wyliczeniowego
signal stan, stan_nast : STANY;								-- sygna³y: stan i stan_nast typu STANY
signal zapas :std_logic_vector(3 downto 0);				-- sygna³y: zapas (iloœæ cegie³ w magazynie)

begin

reg:process(clk, reset)
begin
		if (reset='1')then						-- funkcja resetuj¹ca
				stan<= fajrant;
		elsif(CLK'event and CLK='1') then	--przypisanie stanu nastêpnego na stan aktualny 
				stan<=stan_nast;
		end if;
end process;

komb:process(stan,KASA,zapas)
begin
	stan_nast <= stan;								-- pozwala unikn¹æ wieloktotnego
	case stan is										-- pisania else stan_nast <= "po staremu";
		
		when cegla =>
			if (KASA = '1') then
				stan_nast <= pod_cegle;
			elsif (KASA = '0') then
				stan_nast <= fajrant;
			end if;
		
		when fajrant =>
			if (KASA = '1') then
				if (zapas = "0000") then
					stan_nast <= transit;
				else
					stan_nast <= pod_cegle;
				end if;
			end if;
		
		when transit =>
			if (KASA = '1') then
				stan_nast <= pod_cegle;
			elsif (KASA = '0') then
				stan_nast <= fajrant;
			end if;
		
		when pod_cegle =>
			if (KASA = '1') then
				if (zapas /= "0000") then
					stan_nast <= cegla;
				elsif (zapas = "0000") then
					stan_nast <= transit;
				end if;
			elsif (KASA = '0') then
				stan_nast <= fajrant;
			end if;		
	
	end case;
end process komb;

licznik:process(CLK,RESET)
begin
	if RESET = '1' then									-- reset stanu cagie³ na magazynie
		zapas <= "0000";
	elsif (CLK'event and CLK='1') then				-- zliczanie cegie³ w dó³
		if (stan=pod_cegle and zapas /="0000") then
			zapas<= zapas-1;
		elsif(stan=transit)then							-- odnowienie iloœci cegie³ w mag.
			zapas <= "1111";
		end if;
	end if;
end process licznik;

postep <= '1' when stan = cegla else '0';

end AUTO_arch;
