
--Uk³ad: TESTER Rejestru przesuwnego
 
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

 
ENTITY TEST_PIPO IS
END TEST_PIPO;
 
ARCHITECTURE TEST_PIPO_arch OF TEST_PIPO IS 
 
 
    COMPONENT PIPO
    PORT(
         X : IN  std_logic_vector(7 downto 0);
         RESET : IN  std_logic;
         CLK : IN  std_logic;
         Q : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Wejœcia
   signal X : std_logic_vector(7 downto 0) := (others => '0');
   signal RESET : std_logic := '0';
   signal CLK : std_logic := '0';

 	--Wyjœcia
   signal Q : std_logic_vector(7 downto 0);

   -- Definicja CLK_period
   constant CLK_period : time := 10 ns;
 
BEGIN

   uut: PIPO PORT MAP (
          X => X,
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
 

   -- Symulacja
   stim_proc: process
   begin		

		RESET <= '0'; wait for CLK_period*2;
		X <= "00011100"; wait for CLK_period*3;

		RESET <= '1'; wait for CLK_period*2;
		X <= "00011100"; wait for CLK_period*3;

		RESET <= '0'; wait for CLK_period*2;
		X <= "00001111"; wait for CLK_period*3;

		RESET <= '1'; wait for CLK_period*2;
		X <= "00001111"; wait for CLK_period*3;
				
		RESET <= '0'; wait for CLK_period*2;
		X <= "00000000"; wait for CLK_period*3;

		RESET <= '1'; wait for CLK_period*2;
		X <= "00000000"; wait for CLK_period*3;

	assert false severity failure;
   end process;

END;
