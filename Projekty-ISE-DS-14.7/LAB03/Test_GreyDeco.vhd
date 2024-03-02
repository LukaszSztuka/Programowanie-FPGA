
-- Uk�ad: Tester Dekodera kodu greya

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY Test_GreyDeco IS
END Test_GreyDeco;												-- jednostka testuj�ca (brak zadeklarowanych port�w)
 
ARCHITECTURE Test_GreyDeco_arch OF Test_GreyDeco IS 	-- architektura jednostki testuj�cej
 
    COMPONENT GreyDeco											-- deklaracja testowanego komponentu
    PORT(															-- opis port�w komponentu
         X : IN  std_logic_vector(3 downto 0);			-- wej�cia (4 bitowe kod Greya)
         Y : OUT  std_logic_vector(15 downto 0)			-- wyj�cie (16 bitowe kod 1 z 16)
        );
    END COMPONENT;
    

   signal A : std_logic_vector(3 downto 0);				-- sygna�y wewn�trzne jednostki testuj�cej
   signal B : std_logic_vector(15 downto 0);

 
BEGIN																	-- cia�o architektury jednostki testuj�cej
	
   uut: GreyDeco PORT MAP (									-- powi�zane port�w dekodera z jednostk� testuj�c�
          X => A,
          Y => B
        );
 
   stim_proc: process											-- proces symulacji (wykonywany sekwencyjnie)
   begin		
      
		A <= "0000"; wait for 10 ns;							-- przyk�adowe podanie na wej�cie warto�ci 
		A <= "0001"; wait for 10 ns;
		A <= "1111"; wait for 10 ns;
		A <= "0101"; wait for 10 ns;
		A <= "00HL"; wait for 10 ns;
     
	  assert false severity failure;							--zatrzymanie symulacji 
   end process;

END;
