
-- Uk³ad: Tester Dekodera kodu greya

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY Test_GreyDeco IS
END Test_GreyDeco;												-- jednostka testuj¹ca (brak zadeklarowanych portów)
 
ARCHITECTURE Test_GreyDeco_arch OF Test_GreyDeco IS 	-- architektura jednostki testuj¹cej
 
    COMPONENT GreyDeco											-- deklaracja testowanego komponentu
    PORT(															-- opis portów komponentu
         X : IN  std_logic_vector(3 downto 0);			-- wejœcia (4 bitowe kod Greya)
         Y : OUT  std_logic_vector(15 downto 0)			-- wyjœcie (16 bitowe kod 1 z 16)
        );
    END COMPONENT;
    

   signal A : std_logic_vector(3 downto 0);				-- sygna³y wewnêtrzne jednostki testuj¹cej
   signal B : std_logic_vector(15 downto 0);

 
BEGIN																	-- cia³o architektury jednostki testuj¹cej
	
   uut: GreyDeco PORT MAP (									-- powi¹zane portów dekodera z jednostk¹ testuj¹c¹
          X => A,
          Y => B
        );
 
   stim_proc: process											-- proces symulacji (wykonywany sekwencyjnie)
   begin		
      
		A <= "0000"; wait for 10 ns;							-- przyk³adowe podanie na wejœcie wartoœci 
		A <= "0001"; wait for 10 ns;
		A <= "1111"; wait for 10 ns;
		A <= "0101"; wait for 10 ns;
		A <= "00HL"; wait for 10 ns;
     
	  assert false severity failure;							--zatrzymanie symulacji 
   end process;

END;
