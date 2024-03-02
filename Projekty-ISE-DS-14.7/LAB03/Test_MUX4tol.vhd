
-- Uk³ad: Tester Multipleksera

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY Test_MUX4tol IS
END Test_MUX4tol;												-- jednostka testuj¹ca (brak zadeklarowanych portów)
 
ARCHITECTURE Test_MUX4tol_arch OF Test_MUX4tol IS 	-- architektura jednostki testuj¹cej
 
    COMPONENT MUX4tol										-- deklaracja testowanego komponentu
    PORT(														-- opis portów komponentu
         X : IN  std_logic_vector(3 downto 0);		-- wejœcie danych (4-bitowe)
         A : IN  std_logic_vector(1 downto 0);		-- wejœcie adresowe (2-bitowe)
         Z : OUT  std_logic								-- wyjœcie (1-bitowe)
			);
			
    END COMPONENT;
    
   signal L : std_logic_vector(3 downto 0);			-- sygna³y wewnêtrzne jednostki testuj¹cej
   signal M : std_logic_vector(1 downto 0);
   signal N : std_logic;
 
BEGIN																-- cia³o architektury jednostki testuj¹cej

   uut: MUX4tol PORT MAP (									-- powi¹zane portów multipleksera z jednostk¹ testuj¹c¹
          X => L,
          A => M,
          Z => N
        );

   stim_proc: process										-- proces symulacji (wykonywany sekwencyjnie)
   begin		

     		L <= "0000"; M <= "00"; wait for 10 ns;									-- na wejœciach podane jest 0 adres 00 odpowiada preniesieniu sygna³u z pierwszego wejœcia
			L <= "0000"; M <= "01"; wait for 10 ns;									-- na wejœciach podane jest 0 adres 01 odpowiada preniesieniu sygna³u z drugiego wejœcia
			L <= "0000"; M <= "10"; wait for 10 ns;									-- na wejœciach podane jest 0 adres 10 odpowiada preniesieniu sygna³u z trzeciego wejœcia
			L <= "0000"; M <= "11"; wait for 10 ns;									-- na wejœciach podane jest 0 adres 11 odpowiada preniesieniu sygna³u z czwartego wejœcia
			L <= "0001"; M <= "00"; wait for 10 ns;									-- na wejœciach pierwsze podane jest 1 a na resztê 0 adres 00 odpowiada preniesieniu sygna³u z pierwszego wejœcia
			L <= "0001"; M <= "01"; wait for 10 ns;									-- itd.
			L <= "0001"; M <= "10"; wait for 10 ns;
			L <= "0001"; M <= "11"; wait for 10 ns;
			L <= "0010"; M <= "00"; wait for 10 ns;
			L <= "0010"; M <= "01"; wait for 10 ns;
			L <= "0010"; M <= "10"; wait for 10 ns;
			L <= "0010"; M <= "11"; wait for 10 ns;
			L <= "0011"; M <= "00"; wait for 10 ns;
			L <= "0011"; M <= "01"; wait for 10 ns;
			L <= "0011"; M <= "10"; wait for 10 ns;
			L <= "0011"; M <= "11"; wait for 10 ns;
			L <= "0011"; M <= "LH"; wait for 10 ns;
			assert false severity failure;		
   end process;

END;
