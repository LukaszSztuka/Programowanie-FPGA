
--Uk³ad: Tester Licznika

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;
 
ENTITY Tester_Licznik IS
END Tester_Licznik;
 
ARCHITECTURE behavior OF Tester_Licznik IS 
 
    
    COMPONENT Licznik
    PORT(
         D : IN  std_logic_vector(7 downto 0);
         Q : OUT  std_logic_vector(7 downto 0);
         T : IN  std_logic_vector(1 downto 0);
         CLK : IN  std_logic;
         RESET : IN  std_logic
        );
    END COMPONENT;
    

   --Wejœcia
   signal D : std_logic_vector(7 downto 0) := (others => '0');
   signal T : std_logic_vector(1 downto 0) := (others => '0');
   signal CLK : std_logic := '0';
   signal RESET : std_logic := '0';

 	--Wyjœcia
   signal Q : std_logic_vector(7 downto 0);

   -- Dzefinicja CLK_period
   constant CLK_period : time := 10 ns;
 
BEGIN
 
   uut: Licznik PORT MAP (
          D => D,
          Q => Q,
          T => T,
          CLK => CLK,
          RESET => RESET
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Symulacja
   stim_proc: process
   begin		
	
		RESET <= '0'; wait for CLK_period*2.3;
     
		--Przekrêcenie licznika
		RESET <= '1'; 		-- RESET = Wy³¹czony
		
			--inicjalizacja du¿ej liczby
			T <= "11";
			D <= "11111110";  -- Wczytanie na wejœciu liczby 254
			wait for CLK_period;
			
		--Zmiana trybu na zliczanie w górê 
		T <= "00"; 			-- Tryb pracy = Liczenie w górê
		wait for CLK_period*3;
		
		--TEST trybów
			--Przypisanie wartoœci do wejœcia
			RESET <= '1';   -- RESET = Wy³.
			T <= "11";		-- Tryb pracy = przepisanie wejœcia
			D <= "00001111";	-- Wejœcie = 15
			wait for CLK_period*2;
		
		--Liczenie w górê
		T <= "00";			-- Tryb pracy = liczenie w górê
		wait for CLK_period*2;
		
		--Liczenie w dó³
		T <= "01";			-- Tryb pracy = liczenie w dó³
		wait for CLK_period*2;
		
		--Zatrzymanie zliczania
		T <= "10";			-- Tryb pracy = zatrzymanie zliczania
		wait for CLK_period*2;
		
		--Inicjalizacja licznika
		T <= "11";			-- Tryb pracy = Inicjalizacja licznika
		D <= "00000001";  -- Wartoœæ podana na wejœcie "00000001"
		wait for CLK_period*2;
		
		--Test Resetu
		RESET <= '0';		-- RESET = W³¹.
		wait for CLK_period*2; 
		T <= "00";			-- Tryb pracy = liczenie w górê
		wait for CLK_period*2;
		
		
		


	assert false severity failure;
   end process;

END;
