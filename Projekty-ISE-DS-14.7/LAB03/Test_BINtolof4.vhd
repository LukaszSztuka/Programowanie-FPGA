
-- Uk�ad: Tester Dekodera 1z4

  LIBRARY ieee;
  USE ieee.std_logic_1164.ALL;
  USE ieee.numeric_std.ALL;

  ENTITY Test_BINtolof4 IS
  END Test_BINtolof4;			-- jednostka testuj�ca (brak zadeklarowanych port�w)

  ARCHITECTURE Test_BINtolof4_arch OF Test_BINtolof4 IS 	-- architektura jednostki testuj�cej
 
          COMPONENT BINtolof4									-- deklaracja testowanego komponentu
          PORT(													-- opis port�w komponentu
                 
                  X : IN std_logic_vector(1 downto 0);       -- wej�cia (kod binarny)
                  Z : OUT std_logic_vector(3 downto 0)		 -- wyj�cia (kod 1 z 4))
                  );
          END COMPONENT;

          SIGNAL A :  std_logic_vector(1 downto 0);			-- sygna�y wewn�trzne jednostki testuj�cej
          SIGNAL B :  std_logic_vector(3 downto 0);

  BEGIN																		-- cia�o architektury jednostki testuj�cej 

          uut: BINtolof4 PORT MAP(									-- powi�zane port�w dekodera z jednostk� testuj�c� 	
                  X => A,
                  Z => B
          );
  
     Symulacja : PROCESS												-- proces symulacji (wykonywany sekwencyjnie)
     BEGIN

			A <= "00"; wait for 10 ns;									-- podanie na wej�cie dekodera sygna�u 00 i odczekanie 10ns
			A <= "01"; wait for 10 ns;
			A <= "10"; wait for 10 ns;
			A <= "11"; wait for 10 ns;
			A <= "HL"; wait for 10 ns;
			assert false severity failure;							--zatrzymanie symulacji 
        
     END PROCESS Symulacja;
 
  END;
