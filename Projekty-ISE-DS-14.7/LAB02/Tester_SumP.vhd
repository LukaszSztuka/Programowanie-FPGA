
--Uk³ad: Pe³ny Sumator

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY Tester_SumP IS
END Tester_SumP;
 
ARCHITECTURE Tester_SumP_arch OF Tester_SumP IS -- Jednostka testuj¹ca sumatora pe³nego
 
    COMPONENT SumatorP									--deklaracja testowanego komponentu
    PORT(													--deklaracja portów
         A : IN  std_logic;							
         B : IN  std_logic;
         Ci : IN  std_logic;
         S : OUT  std_logic;
         C : OUT  std_logic
        );
    END COMPONENT;
    

SIGNAL X, Y, Z, D, Di : std_logic ;					-- sygna³y wewnêtrzne jednostki testuj¹cej

 
BEGIN															-- cia³o architektury test bench
 

   uut: SumatorP PORT MAP (							-- powiazanie portów pó³sumatora z sygna³ami wew.
          A => X,
          B => Y,
          Ci => Di,
          S => Z,
          C => D
        );

   stim_proc: process									-- opis procesu symulacji
   begin		
		X <= '0'; Y <= '0'; Di <= '0'; wait for 10 ns;  -- przypisanie wartoœci i odczekanie 10ns 
		X <= '0'; Y <= '1'; Di <= '0'; wait for 10 ns;
		X <= '1'; Y <= '0'; Di <= '0'; wait for 10 ns;
		X <= '1'; Y <= '1'; Di <= '0'; wait for 10 ns;
		X <= '0'; Y <= '0'; Di <= '1'; wait for 10 ns;
		X <= '0'; Y <= '1'; Di <= '1'; wait for 10 ns;
		X <= '1'; Y <= '0'; Di <= '1'; wait for 10 ns;
		X <= '1'; Y <= '1'; Di <= '1'; wait for 10 ns;
      assert false severity failure;						--zatrzymanie symulacji
   end process;

END;
