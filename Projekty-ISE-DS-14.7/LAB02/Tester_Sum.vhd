
--Uk�ad: P�sumator

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 

 
ENTITY Tester_Sum IS						-- Jednostka testuj�ca p�sumatora
END Tester_Sum;
 
ARCHITECTURE Tester_Sum_arch OF Tester_Sum IS 
 
  
 
    COMPONENT sumator					--deklaracja testowanego komponentu
    PORT(									--deklaracja port�w
			A: IN  std_logic;
         B : IN  std_logic;
         S : OUT  std_logic;
         C : OUT  std_logic
        );
    END COMPONENT;
 
		SIGNAL X, Y, Z, D : std_logic ;-- sygna�y wewn�trzne jednostki testuj�cej
 
BEGIN											-- cia�o architektury test bench
 

   uut: sumator PORT MAP (				-- powiazanie port�w p�sumatora z sygna�ami wew.
          A => X,
          B => Y,
          S => Z,
          C => D
        );



   stim_proc: process					-- opis procesu symulacji 
   begin		
		X <= '0'; Y <= '0'; wait for 10 ns;	-- przypisanie warto�ci i odczekanie 10ns 
		X <= '0'; Y <= '1'; wait for 10 ns;
		X <= '1'; Y <= '0'; wait for 10 ns;
		X <= '1'; Y <= '1'; wait for 10 ns;
      assert false severity failure;		--zatrzymanie symulacji 
   end process;

END;

