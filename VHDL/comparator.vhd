-------------------------------------------------------------------------------
--
-- Title       : comparator
-- Design      : bitcoinminer
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : comparator.vhd
-- Generated   : Fri May 24 13:51:17 2013
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {comparator} architecture {comparator}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

entity comparator is
	port(
		clk : in STD_LOGIC;
		hash_in : in UNSIGNED(255 downto 0);
		target : in UNSIGNED(255 downto 0);
		compare_to_target: in STD_logic;
		hit : out STD_LOGIC
		);
end comparator;

--}} End of automatically maintained section

architecture comparator of comparator is
begin

	process(clk)
	begin
		if (clk = '1' and clk'event) then
			if compare_to_target = '1' then
				if hash_in <= target then
					hit <= '1';		--You win!	
				else
					hit <= '0';	 	  
				end if;
			else
				hit <= '0';
			end if;
		end if;
	end process;
end comparator;

