-------------------------------------------------------------------------------
--
-- Title       : padding
-- Design      : bitcoinminer
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : padding.vhd
-- Generated   : Tue Sep 10 12:25:06 2013
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
--{entity {padding} architecture {padding}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

entity padding is
	 port(
		 clk : in STD_LOGIC;
		 data_in : in UNSIGNED(127 downto 0);
		 M2 : out UNSIGNED(511 downto 0)
	     );
end padding;

--}} End of automatically maintained section

architecture padding of padding is
begin
	process(clk)
	begin
		if (clk = '1' and clk'event) then
			M2 <= data_in & x"800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000280";
		end if;
	end process;
end padding;
