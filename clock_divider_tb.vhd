library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity clock_divider_tb is
-- empty
end clock_divider_tb;

architecture tb of clock_divider_tb is

	component yixuan_tang_clock_divider
		Port (enable		:	in  std_logic;		-- active high
				 reset   	:  	in  std_logic;		-- active low
				 clk     	:  	in  std_logic;		
				 en_out  	:  	out std_logic		-- divided enable output
		);
	end component;

	signal enable_in, reset_in, clk_in : std_logic;
	signal en_out : std_logic;
	
	begin
	DUT: yixuan_tang_clock_divider port map(enable_in, reset_in, clk_in, en_out);
	
	clk_generatioin : process
	begin
		-- one clock period is 1/50,000,000 = 20 ns
		clk_in <= '0';
		wait for 10 ns;
		clk_in <= '1';
		wait for 10 ns;
	end process;
	
	assertion_enable : process
	begin
		enable_in <= '1';
		reset_in <= '1';
		wait for 2000000000 ns;
		--enable_in <= '1';
		--reset_in <= '0';
		--wait for 20 ns;
		--enable_in <= '0';
		--reset_in <= '1';
		--wait;
	end process;
end tb;