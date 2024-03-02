
--Uk³ad: TESTER Przerzutnika typu D

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY TEST_prze_D IS
END TEST_prze_D;
 
ARCHITECTURE TEST_prze_D_arch OF TEST_prze_D IS 
 
    COMPONENT przerzutnik_D			--opis architektury
    PORT(
         D 		: IN  std_logic;
         RESET : IN  std_logic;
         CLK	: IN  std_logic;
         Q		: OUT  std_logic
        );
    END COMPONENT;
 
   --przypisanie stanu wejœæ
   signal D : std_logic := '0';
   signal RESET : std_logic := '0';
   signal CLK : std_logic := '0';

 	--Wyjœcie
   signal Q : std_logic;

   -- Definicja CLK_period
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	
   uut: przerzutnik_D PORT MAP (
          D => D,
          RESET => RESET,
          CLK => CLK,
          Q => Q
        );
		  
   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;

	symulacja :process
	begin

	Reset <= '0';
	D		<= '1'; wait for CLK_period*2.7; -- test resetu
	
	Reset <= '1';wait for CLK_period*2.3; --wy³¹czenie resetu
	
	D <= '0';wait for CLK_period*1.6; -- zmiany we 
	D <= '1';wait for CLK_period*3.4; -- zmiany we
	Reset <= '0';wait for CLK_period*2.7; -- test resetu
	
	assert false severity failure;
end process symulacja;
END;
