library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity counter_tb is
end counter_tb;

architecture tb of counter_tb is
	component yixuan_tang_counter
	Port (enable	:	in std_logic;
			reset		:	in std_logic;
			clk		:	in std_logic;
			count		:	out std_logic_vector(2 downto 0)
			);
	end component;
	--signal declaration
	signal enable_in, reset_in, clk_in : std_logic;
	signal count_out : std_logic_vector(2 downto 0);
	
	begin
	DUT: yixuan_tang_counter port map (enable_in, reset_in, clk_in, count_out);
	
	clock_process : process
	begin
		clk_in <= '0';
		wait for 10 ns;
		clk_in <= '1';
		wait for 10 ns;
	end process;
	
	sim_proc: process
	begin
		enable_in <= '1';
		reset_in <= '0';
		wait for 10 ns;
		enable_in <= '1';
		reset_in <= '1';
		wait for 150 ns;
		enable_in <= '0';
		reset_in <= '1';
		wait for 20 ns;
		enable_in <= '1';
		reset_in <= '1';
		wait for 20 ns;
	end process;
end tb;
		
		