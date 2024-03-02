
--Uk³ad: TESTER Serializera

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY TEST_Serializer IS
END TEST_Serializer;
 
ARCHITECTURE TEST_Serializer_arch OF TEST_Serializer IS 
 
    COMPONENT Serializer
    PORT(
         RESET : IN  std_logic;
         CLK : IN  std_logic;
         WE : IN  std_logic_vector(7 downto 0);
         WY : OUT  std_logic
        );
    END COMPONENT; 

   --Wejœcia
   signal RESET : std_logic := '0';
   signal CLK : std_logic := '0';
   signal WE : std_logic_vector(7 downto 0) := (others => '0');

 	--Wyjœcia
   signal WY : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Serializer PORT MAP (
          RESET => RESET,
          CLK => CLK,
          WE => WE,
          WY => WY
        );

   -- Definicja Zegara
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;

   -- Proces Symulacji
   stim_proc: process

	type tab8 is array (positive range <>) of std_logic_vector(7 downto 0);
	constant test : tab8 := ("11001100", "1010HLHL", "11110000");

	begin
		RESET <= '0';
		wait for CLK_period;
		RESET <= '1';
		
		for i in test'range loop
			WE <= test(i);
			wait for CLK_period*8;
		end loop;
		
		wait for CLK_period*8;
	
		WE <= "H010100H"; wait for CLK_period*3.5;
		RESET <= '0'; wait for CLK_period;
		RESET <= '1'; wait for CLK_period*20;
		
		assert false severity failure;
   end process;

END;
