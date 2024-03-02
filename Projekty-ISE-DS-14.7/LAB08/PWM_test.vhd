
--Uk³ad: PWM test

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
ENTITY PWM_tb IS
END PWM_tb;
 
ARCHITECTURE behavior OF PWM_tb IS
 
    COMPONENT PWM
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         nr_w : IN  std_logic;
         adres : IN  std_logic_vector(1 downto 0);
         data_out : IN  std_logic_vector(7 downto 0);
         data_in : OUT  std_logic_vector(7 downto 0);
         PWM_out : OUT  std_logic
        );
    END COMPONENT;
    

   -- Wejœcia
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal nr_w : std_logic := '0';
   signal adres : std_logic_vector(1 downto 0) := (others => '0');
   signal data_out : std_logic_vector(7 downto 0) := (others => '0');

 	-- Wyjœcia
   signal data_in : std_logic_vector(7 downto 0);
   signal PWM_out : std_logic;

   -- Okres czasu taktu zegara
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PWM PORT MAP (
          clk => clk,
          reset => reset,
          nr_w => nr_w,
          adres => adres,
          data_out => data_out,
          data_in => data_in,
          PWM_out => PWM_out
        );

   -- Clk_process
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Symulacja
   stim_proc: process
   begin		
      reset <= '0';						-- Wartoœci pocz¹tkowe
		nr_w <= '0';
		data_out <= (others => '0');
		adres <= (others => '0');
		wait for 3*clk_period;
		reset <= '1';				-- wy³¹czenie resetu
		wait for 3*clk_period;
		
		nr_w <= '1';				-- sczytywanie danych 
		
		adres <= "10";				--okres 3
		data_out <= "00000011";
		wait for 3*clk_period;

		adres <= "01";				--wype³nienie 1
		data_out <= "00000001";
		wait for 3*clk_period;
		
		adres <= "11";				--start
		data_out <= "10000000";
		wait for 10*clk_period;
		
		adres <= "10";				-- okres 3 
		data_out <= "00000011";
		wait for 3*clk_period;
		
		adres <= "01";				-- wype³nienie 2
		data_out <= "00000010";
		wait for 3*clk_period;
		
		adres <= "11";				-- start
		data_out <= "10000000";
		wait for 10*clk_period;
		
		adres <= "10";				--okres 5
		data_out <= "00000101";
		wait for 3*clk_period;

		adres <= "01";				--wype³nienie 3
		data_out <= "00000011";
		wait for 3*clk_period;
		
		adres <= "11";				--start
		data_out <= "10000000";
		wait for 10*clk_period;
		
		adres <= "10";				--okres 7
		data_out <= "00000111";
		wait for 3*clk_period;

		adres <= "01";				--wype³nienie 3
		data_out <= "00000011";
		wait for 3*clk_period;
		
		adres <= "11";				--start
		data_out <= "10000000";
		wait for 10*clk_period;
		
		
		nr_w <= '0';				-- wysy³anie danych na data_in

		
		adres <= "11";				-- start 0
		data_out <= "00100000";
		wait for 10*clk_period;
		
			adres <= "10";				--okres 5
		data_out <= "00000011";
		wait for 3*clk_period;

		adres <= "01";				--wype³nienie 1
		data_out <= "00000001";
		wait for 3*clk_period;
		
		adres <= "11";				--start
		data_out <= "10000000";
		wait for 10*clk_period;
		
		
		assert false severity failure;
   end process;

END;
