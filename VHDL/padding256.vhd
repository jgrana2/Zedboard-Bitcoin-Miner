-------------------------------------------------------------------------------
--
-- Title       : padding256
-- Design      : bitcoinminer
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : padding256.vhd
-- Generated   : Tue May 21 18:07:09 2013
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
--{entity {padding256} architecture {padding256}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

entity padding256 is
	port(
		data : in UNSIGNED(255 downto 0);
		M1 : out UNSIGNED(511 downto 0)
		);
end padding256;

--}} End of automatically maintained section

architecture padding256 of padding256 is
signal k: UNSIGNED(190 downto 0) := "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"; --191 zeros. k = 512 - 64 - 1 - 256.
signal data_size: UNSIGNED(63 downto 0) := x"0000000000000100";	  --256 bits 
begin
	
			M1 <= data & '1' & k & data_size;
	
end padding256;
