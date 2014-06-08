-------------------------------------------------------------------------------
--
-- Title       : increaser
-- Design      : bitcoinminer
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : increaser.vhd
-- Generated   : Sat May 25 19:31:42 2013
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
--{entity {increaser} architecture {increaser}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

entity increaser is
	 port(
		 clk : in STD_LOGIC;
		 reset : in STD_LOGIC;
		 enable: in STD_LOGIC;
		 nonce_out : out UNSIGNED(31 downto 0);
		 overflow: out STD_LOGIC
	     );
end increaser;

--}} End of automatically maintained section

architecture increaser of increaser is
signal count: UNSIGNED(31 downto 0);
begin
	
	process(clk)
	begin	
		if (clk = '1' and clk'event) then
			if (reset = '1') then
				count <= x"00000000"; --Nonce starts at 0
				overflow <= '0';
			elsif (enable = '1') then
				count <= count + 1;
				if count = x"FFFFFFFE" then
					overflow <= '1';
				else
					overflow <= '0';
				end if;
			end if;	
		end if;	
	end process;
	
	nonce_out <= count;

end increaser;
