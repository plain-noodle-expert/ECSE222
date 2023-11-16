library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity yixuan_tang_counter is
Port (enable	:	in std_logic;
		reset		:	in std_logic;
		clk		:	in std_logic;
		count		:	out std_logic_vector(2 downto 0));
end yixuan_tang_counter;

architecture counter of yixuan_tang_counter is

	signal counter_up : std_logic_vector(2 downto 0);
	
	begin
	process(clk)
		begin
		if(reset = '0') then
			counter_up <= o"0";
		elsif(rising_edge(clk)) then
			 if(enable = '1') then
				  counter_up <= std_logic_vector(unsigned(counter_up)+x"1");
			 end if;
		end if;
		end process;
			count <= counter_up;
end counter;