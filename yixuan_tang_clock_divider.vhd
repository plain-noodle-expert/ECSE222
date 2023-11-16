library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity yixuan_tang_clock_divider is

   Port (
       enable	:	in  std_logic;		-- active high
       reset   	:  	in  std_logic;		-- active low
       clk     	:  	in  std_logic;		
       en_out  	:  	out std_logic		-- divided enable output
   );

end yixuan_tang_clock_divider;



architecture down_counter of yixuan_tang_clock_divider is

	signal temp	:	std_logic;							-- current state
	signal counter	:	std_logic_vector (25 downto 0) := "10111110101111000001111111";	-- T is 50,000,000 times, downcount from 50,000,000

begin

	process(enable, reset, clk)

	begin

   	if (reset = '0') then
		
		temp 	<= 	'0';
		counter <= 	"10111110101111000001111111";
	
	elsif (RISING_EDGE(clk) AND enable = '1') then			-- activate divider
		
		if (counter = "00000000000000000000000000") then	-- output 1 as divided enable signal
			
			temp	<=	'1';
			counter	<=	"10111110101111000001111111";
	
		else
			
			temp	<=	'0';
			counter <= 	std_logic_vector(unsigned(counter)-1);
		
		end if;
			
	end if;

   	end process;

en_out <= temp;

end down_counter;