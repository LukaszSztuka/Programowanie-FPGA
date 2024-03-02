--Autor: £ukasz Sztuka
--Nr. Indeksu: 243168
--Tytu³ projektu: Automat z napojami
--Termin zajêæ: CZ-13:30
--Data oddania: 30.01.2020r.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;
 
ENTITY test IS
END test;
 
ARCHITECTURE behavior OF test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT uut
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         Vzl : IN  std_logic;
         IIzl : IN  std_logic;
         Izl : IN  std_logic;
         RodzajNap : IN  std_logic_vector(2 downto 0);
         IloscCuk : IN  std_logic_vector(1 downto 0);
         RVzl : OUT  std_logic;
         RIIzl : OUT  std_logic;
         RIzl : OUT  std_logic;
         Nap : OUT  std_logic_vector(2 downto 0);
         Cuk : OUT  std_logic_vector(1 downto 0)
        );
    END COMPONENT;
    

   --Wejœcia
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal Vzl : std_logic := '0';
   signal IIzl : std_logic := '0';
   signal Izl : std_logic := '0';
   signal RodzajNap : std_logic_vector(2 downto 0) := (others => '0');
   signal IloscCuk : std_logic_vector(1 downto 0) := (others => '0');

 	--Wyjœcia
   signal RVzl : std_logic;
   signal RIIzl : std_logic;
   signal RIzl : std_logic;
   signal Nap : std_logic_vector(2 downto 0);
   signal Cuk : std_logic_vector(1 downto 0);

   -- Definicja okresu zegara
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut2: uut PORT MAP (
          clk => clk,
          reset => reset,
          Vzl => Vzl,
          IIzl => IIzl,
          Izl => Izl,
          RodzajNap => RodzajNap,
          IloscCuk => IloscCuk,
          RVzl => RVzl,
          RIIzl => RIIzl,
          RIzl => RIzl,
          Nap => Nap,
          Cuk => Cuk
        );

   -- Zegar
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Symulacja
   stim_proc: process	
	begin

		RESET <= '1'; wait for clk_period; --reset uk³adu
		RESET <= '0'; wait for clk_period;
		RESET <= '1'; wait for clk_period;
		
		Izl <= '1'; wait for clk_period;		--wrzucono 8z³
		Izl <= '0'; wait for clk_period;			
		IIzl <= '1'; wait for clk_period;
		IIzl <= '0'; wait for clk_period;	
		Vzl <= '1'; wait for clk_period;
		Vzl <= '0'; wait for clk_period;
		
		RodzajNap <= "100"; 							-- wybrano napój oraz iloœæ cukru za 4z³
		IloscCuk <= "01"; wait for clk_period;
		RodzajNap <= "000"; 
		IloscCuk <= "00"; wait for clk_period*5;
------------------------------------------------------------------------------------
		
		Izl <= '1'; wait for clk_period;		--wrzucono 10z³
		Izl <= '0'; wait for clk_period;			
		IIzl <= '1'; wait for clk_period;
		IIzl <= '0'; wait for clk_period;	
		Vzl <= '1'; wait for clk_period;
		Vzl <= '0'; wait for clk_period;
		Izl <= '1'; wait for clk_period;		
		Izl <= '0'; wait for clk_period;
		Izl <= '1'; wait for clk_period;		
		Izl <= '0'; wait for clk_period;
		
		RodzajNap <= "010"; 						-- wybrano napój oraz iloœæ cukru za 4z³
		IloscCuk <= "11"; wait for clk_period;
		RodzajNap <= "000"; 
		IloscCuk <= "00"; wait for clk_period*5;
--------------------------------------------------------------------------------------		
		Izl <= '1'; wait for clk_period;		--wrzucono 1z³
		Izl <= '0'; wait for clk_period;	
		
		RodzajNap <= "001"; 						-- wybrano napój i cuk za 5z³ 
		IloscCuk <= "11"; wait for clk_period;
		RodzajNap <= "000"; 
		IloscCuk <= "00"; wait for clk_period*5;
---------------------------------------------------------------------------------------		
		Izl <= '1'; wait for clk_period;		--wrzucono 3z³
		Izl <= '0'; wait for clk_period;			
		IIzl <= '1'; wait for clk_period;
		IIzl <= '0'; wait for clk_period;
		
		RodzajNap <= "001"; 						-- wybrano napój i cuk za 5z³ 
		IloscCuk <= "11"; wait for clk_period*0.5;
		RESET <= '0'; wait for clk_period; 
		
		RodzajNap <= "000"; 
		IloscCuk <= "00";
		RESET <= '1'; wait for clk_period*3;
		


		
	assert false severity failure;
   end process;

END;
