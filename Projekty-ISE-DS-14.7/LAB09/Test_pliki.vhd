
--Uk³ad: Operacje na plikach Test
library IEEE;
use std.textio.all;
use ieee.std_logic_textio.all;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

ENTITY Test_pliki IS
END Test_pliki;
 
ARCHITECTURE behavior OF Test_pliki IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Pliki
    PORT(
         a : IN  std_logic_vector(7 downto 0);
         b : IN  std_logic_vector(7 downto 0);
         c : OUT  std_logic_vector(7 downto 0);
         reset : IN  std_logic;
         clk : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(7 downto 0) := (others => '0');
   signal b : std_logic_vector(7 downto 0) := (others => '0');
   signal reset : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal c : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;			-- sta³a okreœlaj¹ca d³ugoœæ okresu
	constant p_10 : time := clk_period/10;			--	sta³a równa 1/10 d³ugoœci okresu
	
	shared variable odczyt : boolean := False;	--	zmienna wspó³dzielona
	shared variable header : boolean := True;		--	zmienna wspó³dzielona
	signal strobe : std_logic; 						--	sygna³ strobuj¹cy do synchronizacji zapisywania
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Pliki PORT MAP (
          a => a,
          b => b,
          c => c,
          reset => reset,
          clk => clk
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;

   -- Procaes Symulacji
   Symulacja: process
   begin		
		reset <= '0'; wait for clk_period*1.8;
		reset <= '1';
		for i in 1 to 4 loop
			odczyt := True;
			wait for clk_period;
		end loop;
		assert false severity failure;
   end process;
	
	odczytaj : process(clk)											-- wczytywanie wartoœci z pliku WE.txt
	file plik_we : text is in "WE.txt";
	variable linia_we : line;
	variable slowo : std_logic_vector(7 downto 0);
	begin
		if odczyt then
			readline(plik_we, linia_we);							--przypisanie wartoœci z pierwszego wersu do zmiennej a
			read(linia_we, slowo);
			a <= slowo;
			readline(plik_we, linia_we);							--przypisanie wartoœci z drugiego wersu do zmiennej b
			read(linia_we, slowo);
			b <= slowo;
			odczyt := false;
		end if;
	end process odczytaj;
	
	strobe <= transport clk after p_10;							--opóŸnienie
	
	zapisz: process(reset, strobe)								--proces zapisywania wyników
		function conv_to_char(sig : std_logic) return character is
		begin
			case sig is 
				when '1' => return '1';
				when '0' => return '0';
				when others => return 'X';
			end case;
		end function conv_to_char;
		
		function conv_to_string(inp : std_logic_vector; length : integer) return string is 
		variable s :string (1 to length);
		begin
		for i in 0 to (length-1) loop 
			s(length-i) := conv_to_char(inp(i));
		end loop;
		return s;
	end function;
	
	file plik_wy : text open write_mode is out "WY.txt";			--zapisywanie w pliku WY.txt
	variable linia_wy : line;
	variable str : string(1 to 26);
	
	begin														--struktura pliku wyjœciowego
		if header then
			str := "a       b        c        ";
			write(linia_wy, str);
			writeline(plik_wy, linia_wy);
			header := False;
		end if;
		if (reset = '1' and strobe'event and strobe = '1') then
			str:= (others => ' ');
			str(1 to 8) := conv_to_string(a,8);
			str(9):= '|';
			str(10 to 17) := conv_to_string(b,8);
			str(18):= '|';
			str(19 to 26) := conv_to_string(c,8);
			write(linia_wy, str);
			writeline(plik_wy, linia_wy);
		end if;
	end process zapisz;

END;
