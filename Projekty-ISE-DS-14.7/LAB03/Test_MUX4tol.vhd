
-- Uk�ad: Tester Multipleksera

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY Test_MUX4tol IS
END Test_MUX4tol;												-- jednostka testuj�ca (brak zadeklarowanych port�w)
 
ARCHITECTURE Test_MUX4tol_arch OF Test_MUX4tol IS 	-- architektura jednostki testuj�cej
 
    COMPONENT MUX4tol										-- deklaracja testowanego komponentu
    PORT(														-- opis port�w komponentu
         X : IN  std_logic_vector(3 downto 0);		-- wej�cie danych (4-bitowe)
         A : IN  std_logic_vector(1 downto 0);		-- wej�cie adresowe (2-bitowe)
         Z : OUT  std_logic								-- wyj�cie (1-bitowe)
			);
			
    END COMPONENT;
    
   signal L : std_logic_vector(3 downto 0);			-- sygna�y wewn�trzne jednostki testuj�cej
   signal M : std_logic_vector(1 downto 0);
   signal N : std_logic;
 
BEGIN																-- cia�o architektury jednostki testuj�cej

   uut: MUX4tol PORT MAP (									-- powi�zane port�w multipleksera z jednostk� testuj�c�
          X => L,
          A => M,
          Z => N
        );

   stim_proc: process										-- proces symulacji (wykonywany sekwencyjnie)
   begin		

     		L <= "0000"; M <= "00"; wait for 10 ns;									-- na wej�ciach podane jest 0 adres 00 odpowiada preniesieniu sygna�u z pierwszego wej�cia
			L <= "0000"; M <= "01"; wait for 10 ns;									-- na wej�ciach podane jest 0 adres 01 odpowiada preniesieniu sygna�u z drugiego wej�cia
			L <= "0000"; M <= "10"; wait for 10 ns;									-- na wej�ciach podane jest 0 adres 10 odpowiada preniesieniu sygna�u z trzeciego wej�cia
			L <= "0000"; M <= "11"; wait for 10 ns;									-- na wej�ciach podane jest 0 adres 11 odpowiada preniesieniu sygna�u z czwartego wej�cia
			L <= "0001"; M <= "00"; wait for 10 ns;									-- na wej�ciach pierwsze podane jest 1 a na reszt� 0 adres 00 odpowiada preniesieniu sygna�u z pierwszego wej�cia
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
