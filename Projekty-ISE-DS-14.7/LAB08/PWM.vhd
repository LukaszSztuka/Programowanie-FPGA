
--Uk³ad: PWM

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity PWM is
	port(
		clk, reset	:	in 	std_logic;							-- sygna³ zegarowy oraz reset
		nr_w			: 	in 	std_logic;							-- numery wejœcia
		adres			:	in		std_logic_vector(1 downto 0);	-- sygna³ adresowania
		data_out		:	in		std_logic_vector(7 downto 0);	-- sygna³ z procesora
		data_in		:	out 	std_logic_vector(7 downto 0); -- sygna³ do procesora
		PWM_out		:	out	std_logic							-- wyjœcie PWM
	);
end PWM;

architecture PWM_arch of PWM is

signal OKRES	: 	std_logic_vector(7 downto 0);
signal WYPELN	:	std_logic_vector(7 downto 0);
signal start	:	std_logic;
signal LICZ		:	std_logic_vector(7 downto 0);

begin
	praca:	process(reset, clk)
	begin
		if(reset = '0') then
			data_in <= "00000000";
			start  <= '0'; 
			WYPELN <= "00000000";
			OKRES	 <= "00000000";
		elsif(clk'event and clk='1' and reset = '1') then
			if(nr_w = '0') then
				if(adres = "01") then
					data_in <= WYPELN;
				elsif(adres = "10") then
					data_in <= OKRES;
				elsif(adres = "11") then
					data_in <= start & "0000000";
				else
					data_in <= "00000000";
				end if;
			end if;
		else
			case adres is
				when "01" =>
					WYPELN <= data_out;
				when "10" =>
					OKRES <= data_out;
				when others =>
					start <= data_out(7);
			end case;
		end if;
	end process praca;
	
	zliczanie: process(reset, clk)
	begin
		if(reset = '0') then
			LICZ <= "00000000";
		elsif(clk'event and clk = '1') then
			if(start = '1') then
				if (LICZ = (OKRES - "01")) then
					LICZ <= "00000000";
				else
					LICZ <= LICZ + "01";
				end if;
			else
				LICZ <= "00000000";
			end if;
		end if;
	end process zliczanie;
	
	PWM: process(clk, reset, LICZ, WYPELN, start)
	begin
		if(reset = '0') then
			PWM_out <= '0';
		else
			if(start = '1') and (LICZ < WYPELN) then
				PWM_out <= '1';
			else
				PWM_out <= '0';
			end if;
		end if;
	end process PWM;

end PWM_arch;

