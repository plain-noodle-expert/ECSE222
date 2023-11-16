library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity yixuan_tang_jkff is
Port (clk	: in std_logic;
		J		: in std_logic;
		K		: in std_logic;
		Q		: out std_logic);
end yixuan_tang_jkff;

architecture jkff_bh of yixuan_tang_jkff is
   signal input:std_logic_vector(1 downto 0);
begin
   process(clk)
	variable Qn : std_logic;
      begin
         if RISING_EDGE(clk) then
            if (J='0' and K = '0') then
					Qn := Qn;
            elsif (J = '0' and K ='1') then
					Qn := '0';
				elsif (J = '1' and K = '0') then
					Qn := '1';
				elsif (J = '1' and K = '1') then
					Qn := not Qn;
            end if;
        end if;
      Q <= Qn;
   end process;
end jkff_bh;