
-- Uk³ad: Tester Dekodera 1z4

  LIBRARY ieee;
  USE ieee.std_logic_1164.ALL;
  USE ieee.numeric_std.ALL;

  ENTITY Test_BINtolof4 IS
  END Test_BINtolof4;			-- jednostka testuj¹ca (brak zadeklarowanych portów)

  ARCHITECTURE Test_BINtolof4_arch OF Test_BINtolof4 IS 	-- architektura jednostki testuj¹cej
 
          COMPONENT BINtolof4									-- deklaracja testowanego komponentu
          PORT(													-- opis portów komponentu
                 
                  X : IN std_logic_vector(1 downto 0);       -- wejœcia (kod binarny)
                  Z : OUT std_logic_vector(3 downto 0)		 -- wyjœcia (kod 1 z 4))
                  );
          END COMPONENT;

          SIGNAL A :  std_logic_vector(1 downto 0);			-- sygna³y wewnêtrzne jednostki testuj¹cej
          SIGNAL B :  std_logic_vector(3 downto 0);

  BEGIN																		-- cia³o architektury jednostki testuj¹cej 

          uut: BINtolof4 PORT MAP(									-- powi¹zane portów dekodera z jednostk¹ testuj¹c¹ 	
                  X => A,
                  Z => B
          );
  
     Symulacja : PROCESS												-- proces symulacji (wykonywany sekwencyjnie)
     BEGIN

			A <= "00"; wait for 10 ns;									-- podanie na wejœcie dekodera sygna³u 00 i odczekanie 10ns
			A <= "01"; wait for 10 ns;
			A <= "10"; wait for 10 ns;
			A <= "11"; wait for 10 ns;
			A <= "HL"; wait for 10 ns;
			assert false severity failure;							--zatrzymanie symulacji 
        
     END PROCESS Symulacja;
 
  END;
