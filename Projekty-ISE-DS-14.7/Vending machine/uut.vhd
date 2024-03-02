--Autor: �ukasz Sztuka
--Nr. Indeksu: 243168
--Tytu� projektu: Automat z napojami
--Termin zaj��: CZ-13:30
--Data oddania: 30.01.2020r.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity uut is
	port(
		clk, reset			: in std_logic;										-- wej�cia zegara i reset
		Vzl, IIzl, Izl		: in std_logic := '0';								-- wej�cia z czujnik�w wrzucenia monety 5z�, 2z�, 1z�
		RodzajNap			: in std_logic_vector (2 downto 0); 			-- wej�cie przycisk�w wyboru napoju
		IloscCuk 			: in std_logic_vector (1 downto 0);				-- wej�cie przycisk�w wyboru ilo�ci cukru
		RVzl, RIIzl, RIzl	: out std_logic := '0';								-- wyj�cie steruj�ce wyrzucaniem reszty w monetach 5z�, 2z�, 1z�
		Nap		 			: out std_logic_vector (2 downto 0) := "000";-- wyj�cie steruj�ce systemem wydawania napoj�w
		Cuk		 			: out std_logic_vector (1 downto 0) := "00"	-- wyj�cie steruj�ce systemem wydawania cukru
	);
end uut;

architecture Behavioral of uut is

signal SALDO	: 	integer :=0;						--sygna� wewn�trzny zawieraj�cy warto�� salda w z�
signal CENAN	:	integer :=0;						--sygna� wewn�trzny zawieraj�cy cene wybranego napoju
signal CENAC	:	integer :=0;						--sygna� wewn�trzny zawieraj�cy cene wybranej ilo�ci cukru	
signal CENA		:	integer :=0; 						--cena ostateczna				
signal RESZTA	:	integer :=0;						--sygna� wewn�trzny zawieraj�cy warto�� reszty w z�
begin

ZliczSal: process(reset, Vzl, IIzl, Izl, CENA)	-- proces zliczania salda (warto�� monet wrzuconych do automatu)
	begin
		if(reset = '0') then
			SALDO  <= 0;
		elsif(CENA'event and CENA = 0) then -- wyzerowanie stanu salda kiedy reszta zostanie wydana
			SALDO <= 0;			
		else			
			if(Vzl'event and Vzl='1') then	-- wykryto monete 5 z� 
				SALDO <= SALDO + 5;				-- doldanie 5z� do salda
			elsif(IIzl'event and IIzl='1') then	-- analogicznie dla 2z� i 1z�
				SALDO <= SALDO + 2;
			elsif(Izl'event and Izl='1') then	
				SALDO <= SALDO + 1;			
			end if;				
		end if;
	end process ZliczSal;	
	
	ZliczCeneN: process(reset, RodzajNap)			-- proces zliczania ceny za nap�j
	begin
	if(reset = '0') then
		CENAN <= 0;		
	else
		if(RodzajNap'event and RodzajNap = "001") then			--kawa 2z�
			CENAN <= CENAN + 2;
		elsif(RodzajNap'event and RodzajNap = "010") then		--herbata 1z�
			CENAN <= CENAN + 1;
		elsif(RodzajNap'event and RodzajNap = "100") then		--cola 3z�
			CENAN <= CENAN + 3;
		else
			CENAN <= 0;					
		end if;
	end if;
	end process ZliczCeneN;	
	
	ZliczCeneC: process(reset, IloscCuk)		-- proces zliczania ceny za cukier
	begin
	if(reset = '0') then
		CENAC <= 0;
	else
		if(IloscCuk'event and IloscCuk = "11") then				-- trzy �y�eczki 3z�
			CENAC <= CENAC + 3;
		elsif(IloscCuk'event and IloscCuk = "10") then			-- dwie �y�eczki 2z�
			CENAC <= CENAC + 2;
		elsif(IloscCuk'event and IloscCuk = "01") then			-- jedna �y�eczka 1z�
			CENAC <= CENAC + 1;
		else
			CENAC <= 0;														-- bez cukru
		end if;
	end if;
	end process ZliczCeneC;
	
CENA <= CENAC+CENAN;									-- ostateczne obliczenie ceny 
	
	Porownanie: process
	begin	
	
   wait on CENA;
	if(reset = '0') then
		RESZTA <= 0;	
	else
		if (SALDO < CENA ) then 					-- je�li saldo jest za ma�e wrzucone monety s� wydawane jako reszta
			RESZTA <= SALDO;		
		else
			RESZTA <= SALDO-CENA;
			Nap <= RodzajNap;
			Cuk <= IloscCuk;
			wait for 10 ns;							-- po wydaniu napoju wyzerowanie warto�ci wyj��
			Nap <= "000";
			Cuk <= "00";
			if(RESZTA = 1) then						-- wydawanie reszty
				RIzl <= '1'; wait for 10 ns; RIzl <= '0'; 				
				RESZTA <= 0; 
			elsif(RESZTA = 2) then
				RIIzl <= '1'; wait for 10 ns; RIIzl <= '0';
				RESZTA <= 0; 
			elsif(RESZTA = 3) then
				RIzl <= '1'; wait for 10 ns; RIzl <= '0';
				RIIzl <= '1'; wait for 10 ns; RIIzl <= '0';
				RESZTA <= 0;
			elsif(RESZTA = 4) then
				RIIzl <= '1'; wait for 10 ns; RIIzl <= '0'; wait for 10 ns;
				RIIzl <= '1'; wait for 10 ns; RIIzl <= '0';
				RESZTA <= 0;
			elsif(RESZTA = 5) then
				RVzl <= '1'; wait for 10 ns; RVzl <= '0';
				RESZTA <= 0;
			elsif(RESZTA = 6) then
				RIzl <= '1'; wait for 10 ns; RIzl <= '0';
				RVzl <= '1'; wait for 10 ns; RVzl <= '0';
				RESZTA <= 0;
			elsif(RESZTA = 7) then
				RIIzl <= '1'; wait for 10 ns; RIIzl <= '0';
				RVzl <= '1'; wait for 10 ns; RVzl <= '0';
				RESZTA <= 0;
			elsif(RESZTA = 8) then
				RVzl <= '1'; wait for 10 ns; RVzl <= '0';
				RIIzl <= '1'; wait for 10 ns; RIIzl <= '0';
				RIzl <= '1'; wait for 10 ns; RIzl <= '0';
				RESZTA <= 0;
			elsif(RESZTA = 9) then
				RVzl <= '1'; wait for 10 ns; RVzl <= '0';
				RIIzl <= '1'; wait for 10 ns; RIIzl <= '0';
				RIIzl <= '1'; wait for 10 ns; RIIzl <= '0';
				RESZTA <= 0;
			elsif(RESZTA = 10) then
				RVzl <= '1'; wait for 10 ns; RVzl <= '0'; wait for 10 ns;
				RVzl <= '1'; wait for 10 ns; RVzl <= '0';	
				RESZTA <= 0;		
			end if;			
		end if;
	end if;
end process Porownanie;

end Behavioral;

