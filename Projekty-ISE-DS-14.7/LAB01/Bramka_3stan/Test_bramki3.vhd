
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 

 
ENTITY Test_bramki3 IS
END Test_bramki3;
 
ARCHITECTURE behavior OF Test_bramki3 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Bramka_3stanAND
    PORT(
         A : IN  std_logic;
         B : IN  std_logic;
         C : IN  std_logic;
         D : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic := '0';
   signal B : std_logic := '0';
   signal C : std_logic := '0';

 	--Outputs
   signal D : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Bramka_3stanAND PORT MAP (
          A => A,
          B => B,
          C => C,
          D => D
        );



   -- Stimulus process
   stim_proc: process
   begin		
     A <= '0'; B <= '0'; C <= '0'; wait for 10 ns ;
     A <= '0'; B <= '0'; C <= '1'; wait for 10 ns ;
	  A <= '0'; B <= '1'; C <= '0'; wait for 10 ns ;
     A <= '0'; B <= '1'; C <= '1'; wait for 10 ns ;
     A <= '1'; B <= '0'; C <= '0'; wait for 10 ns ;
     A <= '1'; B <= '0'; C <= '1'; wait for 10 ns ;
     A <= '1'; B <= '1'; C <= '0'; wait for 10 ns ;
	  A <= '1'; B <= '1'; C <= '1'; wait for 10 ns ;
      wait;
   end process;

END;
