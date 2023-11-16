library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity yixuan_tang_jkff_tb is
--empty
end yixuan_tang_jkff_tb;

architecture tb of yixuan_tang_jkff_tb is
	component yixuan_tang_jkff
		port (clk	: in std_logic;
				J		: in std_logic;
				K	   : in std_logic;
				Q		: out std_logic
		);
	end component;
	
	signal clk_in, J_in, K_in, Q_out: std_logic;

begin
	DUT : yixuan_tang_jkff
		port map(clk_in, J_in, K_in, Q_out);
	
	clock_generation: process
		begin
		
		clk_in <= '1';
		wait for 5 ns;
		clk_in <= '0';
		wait for 5 ns;
		end process;
		
	Force: process
		begin
		J_in <= '0';
		K_in <= '0';
		wait for 10 ns;
		
		J_in <= '0';
		K_in <= '1';
		wait for 10 ns;
		
		J_in <= '1';
		K_in <= '0';
		wait for 10 ns;
		
		J_in <= '1';
		K_in <= '1';
		wait for 10 ns;
		end process;
end tb;

	