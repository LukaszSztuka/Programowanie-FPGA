
--Uk�ad: Tester Licznika

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
    

   --Wej�cia
   signal D : std_logic_vector(7 downto 0) := (others => '0');
   signal T : std_logic_vector(1 downto 0) := (others => '0');
   signal CLK : std_logic := '0';
   signal RESET : std_logic := '0';

 	--Wyj�cia
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
     
		--Przekr�cenie licznika
		RESET <= '1'; 		-- RESET = Wy��czony
		
			--inicjalizacja du�ej liczby
			T <= "11";
			D <= "11111110";  -- Wczytanie na wej�ciu liczby 254
			wait for CLK_period;
			
		--Zmiana trybu na zliczanie w g�r� 
		T <= "00"; 			-- Tryb pracy = Liczenie w g�r�
		wait for CLK_period*3;
		
		--TEST tryb�w
			--Przypisanie warto�ci do wej�cia
			RESET <= '1';   -- RESET = Wy�.
			T <= "11";		-- Tryb pracy = przepisanie wej�cia
			D <= "00001111";	-- Wej�cie = 15
			wait for CLK_period*2;
		
		--Liczenie w g�r�
		T <= "00";			-- Tryb pracy = liczenie w g�r�
		wait for CLK_period*2;
		
		--Liczenie w d�
		T <= "01";			-- Tryb pracy = liczenie w d�
		wait for CLK_period*2;
		
		--Zatrzymanie zliczania
		T <= "10";			-- Tryb pracy = zatrzymanie zliczania
		wait for CLK_period*2;
		
		--Inicjalizacja licznika
		T <= "11";			-- Tryb pracy = Inicjalizacja licznika
		D <= "00000001";  -- Warto�� podana na wej�cie "00000001"
		wait for CLK_period*2;
		
		--Test Resetu
		RESET <= '0';		-- RESET = W��.
		wait for CLK_period*2; 
		T <= "00";			-- Tryb pracy = liczenie w g�r�
		wait for CLK_period*2;
		
		
		


	assert false severity failure;
   end process;

END;
