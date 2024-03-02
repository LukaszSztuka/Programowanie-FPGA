
--Uk³ad: Tester Sumatora 2-bitowego

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 

ENTITY Tester_Sum2B IS
END Tester_Sum2B;
 
ARCHITECTURE Tester_Sum2B_arch OF Tester_Sum2B IS	-- Jednostka testuj¹ca sumatora 2-bitowego 
  
    COMPONENT Sumator2B										--deklaracja testowanego komponentu
    PORT(														--deklaracja portów
         A1 : IN  std_logic;
         A0 : IN  std_logic;
         B1 : IN  std_logic;
         B0 : IN  std_logic;
         S2 : OUT  std_logic;
         S1 : OUT  std_logic;
         S0 : OUT  std_logic
        );
    END COMPONENT;
    

SIGNAL X1, X0, Y1, Y0, Z2, Z1, Z0 : std_logic ;		-- sygna³y wewnêtrzne jednostki testuj¹cej

 
BEGIN																-- cia³o architektury test bench
 
   uut: Sumator2B PORT MAP (								-- powiazanie portów pó³sumatora z sygna³ami wew.
          A1 => X1,
          A0 => X0,
          B1 => Y1,
          B0 => Y0,
          S2 => Z2,
          S1 => Z1,
          S0 => Z0
        );
 
 
   stim_proc: process										-- opis procesu symulacji
   begin															-- przypisanie wartoœci i odczekanie 10ns
		X1 <= '1'; X0 <= '1'; Y1 <= '1'; Y0 <= '1'; wait for 10 ns;  -- 3+3=6
		X1 <= '0'; X0 <= '1'; Y1 <= '1'; Y0 <= '0'; wait for 10 ns;  -- 1+2=3
		X1 <= '1'; X0 <= '0'; Y1 <= '1'; Y0 <= '1'; wait for 10 ns;  -- 2+3=5
      assert false severity failure;										--zatrzymanie symulacji
   end process;

END;
