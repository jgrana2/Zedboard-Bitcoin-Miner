-------------------------------------------------------------------------------
--
-- Title       : sha256_inner
-- Design      : bitcoinminer
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : sha256_inner.vhd
-- Generated   : Wed May 22 00:11:36 2013
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
--{entity {sha256_inner} architecture {sha256_inner}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

entity sha256_inner is
	port(
		 clk : in STD_LOGIC;
		 M2 : in UNSIGNED(511 downto 0);
		 midstate: in UNSIGNED(255 downto 0);
		 hash_out : out UNSIGNED(255 downto 0)
	     );
end sha256_inner;

--}} End of automatically maintained section

architecture sha256_inner of sha256_inner is

component block_decomposition
	port(
		clk : in STD_LOGIC;
		M_in : in UNSIGNED(511 downto 0);
		W1 : out UNSIGNED(31 downto 0);
		W2 : out UNSIGNED(31 downto 0);
		W3 : out UNSIGNED(31 downto 0);
		W4 : out UNSIGNED(31 downto 0);
		W5 : out UNSIGNED(31 downto 0);
		W6 : out UNSIGNED(31 downto 0);
		W7 : out UNSIGNED(31 downto 0);
		W8 : out UNSIGNED(31 downto 0);
		W9 : out UNSIGNED(31 downto 0);
		W10 : out UNSIGNED(31 downto 0);
		W11 : out UNSIGNED(31 downto 0);
		W12 : out UNSIGNED(31 downto 0);
		W13 : out UNSIGNED(31 downto 0);
		W14 : out UNSIGNED(31 downto 0);
		W15 : out UNSIGNED(31 downto 0);
		W16 : out UNSIGNED(31 downto 0);
		W17 : out UNSIGNED(31 downto 0);
		W18 : out UNSIGNED(31 downto 0);
		W19 : out UNSIGNED(31 downto 0);
		W20 : out UNSIGNED(31 downto 0);
		W21 : out UNSIGNED(31 downto 0);
		W22 : out UNSIGNED(31 downto 0);
		W23 : out UNSIGNED(31 downto 0);
		W24 : out UNSIGNED(31 downto 0);
		W25 : out UNSIGNED(31 downto 0);
		W26 : out UNSIGNED(31 downto 0);
		W27 : out UNSIGNED(31 downto 0);
		W28 : out UNSIGNED(31 downto 0);
		W29 : out UNSIGNED(31 downto 0);
		W30 : out UNSIGNED(31 downto 0);
		W31 : out UNSIGNED(31 downto 0);
		W32 : out UNSIGNED(31 downto 0);
		W33 : out UNSIGNED(31 downto 0);
		W34 : out UNSIGNED(31 downto 0);
		W35 : out UNSIGNED(31 downto 0);
		W36 : out UNSIGNED(31 downto 0);
		W37 : out UNSIGNED(31 downto 0);
		W38 : out UNSIGNED(31 downto 0);
		W39 : out UNSIGNED(31 downto 0);
		W40 : out UNSIGNED(31 downto 0);
		W41 : out UNSIGNED(31 downto 0);
		W42 : out UNSIGNED(31 downto 0);
		W43 : out UNSIGNED(31 downto 0);
		W44 : out UNSIGNED(31 downto 0);
		W45 : out UNSIGNED(31 downto 0);
		W46 : out UNSIGNED(31 downto 0);
		W47 : out UNSIGNED(31 downto 0);
		W48 : out UNSIGNED(31 downto 0);
		W49 : out UNSIGNED(31 downto 0);
		W50 : out UNSIGNED(31 downto 0);
		W51 : out UNSIGNED(31 downto 0);
		W52 : out UNSIGNED(31 downto 0);
		W53 : out UNSIGNED(31 downto 0);
		W54 : out UNSIGNED(31 downto 0);
		W55 : out UNSIGNED(31 downto 0);
		W56 : out UNSIGNED(31 downto 0);
		W57 : out UNSIGNED(31 downto 0);
		W58 : out UNSIGNED(31 downto 0);
		W59 : out UNSIGNED(31 downto 0);
		W60 : out UNSIGNED(31 downto 0);
		W61 : out UNSIGNED(31 downto 0);
		W62 : out UNSIGNED(31 downto 0);
		W63 : out UNSIGNED(31 downto 0);
		W64 : out UNSIGNED(31 downto 0)
		);
end component;

component hash_computation
	port(
		clk : in STD_LOGIC;
		H1_in : in UNSIGNED(31 downto 0);
		H2_in : in UNSIGNED(31 downto 0);
		H3_in : in UNSIGNED(31 downto 0);
		H4_in : in UNSIGNED(31 downto 0);
		H5_in : in UNSIGNED(31 downto 0);
		H6_in : in UNSIGNED(31 downto 0);
		H7_in : in UNSIGNED(31 downto 0);
		H8_in : in UNSIGNED(31 downto 0);
		W1 : in UNSIGNED(31 downto 0);
		W2 : in UNSIGNED(31 downto 0);
		W3 : in UNSIGNED(31 downto 0);
		W4 : in UNSIGNED(31 downto 0);
		W5 : in UNSIGNED(31 downto 0);
		W6 : in UNSIGNED(31 downto 0);
		W7 : in UNSIGNED(31 downto 0);
		W8 : in UNSIGNED(31 downto 0);
		W9 : in UNSIGNED(31 downto 0);
		W10 : in UNSIGNED(31 downto 0);
		W11 : in UNSIGNED(31 downto 0);
		W12 : in UNSIGNED(31 downto 0);
		W13 : in UNSIGNED(31 downto 0);
		W14 : in UNSIGNED(31 downto 0);
		W15 : in UNSIGNED(31 downto 0);
		W16 : in UNSIGNED(31 downto 0);
		W17 : in UNSIGNED(31 downto 0);
		W18 : in UNSIGNED(31 downto 0);
		W19 : in UNSIGNED(31 downto 0);
		W20 : in UNSIGNED(31 downto 0);
		W21 : in UNSIGNED(31 downto 0);
		W22 : in UNSIGNED(31 downto 0);
		W23 : in UNSIGNED(31 downto 0);
		W24 : in UNSIGNED(31 downto 0);
		W25 : in UNSIGNED(31 downto 0);
		W26 : in UNSIGNED(31 downto 0);
		W27 : in UNSIGNED(31 downto 0);
		W28 : in UNSIGNED(31 downto 0);
		W29 : in UNSIGNED(31 downto 0);
		W30 : in UNSIGNED(31 downto 0);
		W31 : in UNSIGNED(31 downto 0);
		W32 : in UNSIGNED(31 downto 0);
		W33 : in UNSIGNED(31 downto 0);
		W34 : in UNSIGNED(31 downto 0);
		W35 : in UNSIGNED(31 downto 0);
		W36 : in UNSIGNED(31 downto 0);
		W37 : in UNSIGNED(31 downto 0);
		W38 : in UNSIGNED(31 downto 0);
		W39 : in UNSIGNED(31 downto 0);
		W40 : in UNSIGNED(31 downto 0);
		W41 : in UNSIGNED(31 downto 0);
		W42 : in UNSIGNED(31 downto 0);
		W43 : in UNSIGNED(31 downto 0);
		W44 : in UNSIGNED(31 downto 0);
		W45 : in UNSIGNED(31 downto 0);
		W46 : in UNSIGNED(31 downto 0);
		W47 : in UNSIGNED(31 downto 0);
		W48 : in UNSIGNED(31 downto 0);
		W49 : in UNSIGNED(31 downto 0);
		W50 : in UNSIGNED(31 downto 0);
		W51 : in UNSIGNED(31 downto 0);
		W52 : in UNSIGNED(31 downto 0);
		W53 : in UNSIGNED(31 downto 0);
		W54 : in UNSIGNED(31 downto 0);
		W55 : in UNSIGNED(31 downto 0);
		W56 : in UNSIGNED(31 downto 0);
		W57 : in UNSIGNED(31 downto 0);
		W58 : in UNSIGNED(31 downto 0);
		W59 : in UNSIGNED(31 downto 0);
		W60 : in UNSIGNED(31 downto 0);
		W61 : in UNSIGNED(31 downto 0);
		W62 : in UNSIGNED(31 downto 0);
		W63 : in UNSIGNED(31 downto 0);
		W64 : in UNSIGNED(31 downto 0);
		H1_out : out UNSIGNED(31 downto 0);
		H2_out : out UNSIGNED(31 downto 0);
		H3_out : out UNSIGNED(31 downto 0);
		H4_out : out UNSIGNED(31 downto 0);
		H5_out : out UNSIGNED(31 downto 0);
		H6_out : out UNSIGNED(31 downto 0);
		H7_out : out UNSIGNED(31 downto 0);
		H8_out : out UNSIGNED(31 downto 0)
	    );
end component;

type W_block is array (63 downto 0) of unsigned(31 downto 0); 
signal W : W_block;

type hash is array (0 to 7) of unsigned(31 downto 0);
signal midstate_s : hash;
signal hc1_out: hash; 
begin
	midstate_s(0) <= midstate(255 downto 224);
	midstate_s(1) <= midstate(223 downto 192);
	midstate_s(2) <= midstate(191 downto 160);
	midstate_s(3) <= midstate(159 downto 128);
	midstate_s(4) <= midstate(127 downto 96);
	midstate_s(5) <= midstate(95 downto 64);
	midstate_s(6) <= midstate(63 downto 32);
	midstate_s(7) <= midstate(31 downto 0);
	block_decomposition1: block_decomposition port map(clk, M2, W(0), W(1), W(2), W(3), W(4), W(5), W(6), W(7), W(8), W(9), W(10), W(11), W(12), W(13), W(14), W(15), W(16), W(17), W(18), W(19), W(20), W(21), W(22), W(23), W(24), W(25), W(26), W(27), W(28), W(29), W(30), W(31), W(32), W(33), W(34), W(35), W(36), W(37), W(38), W(39), W(40), W(41), W(42), W(43), W(44), W(45), W(46), W(47), W(48), W(49), W(50), W(51), W(52), W(53), W(54), W(55), W(56), W(57), W(58), W(59), W(60), W(61), W(62), W(63));
	hash_computation1: hash_computation port map(clk, midstate_s(0), midstate_s(1), midstate_s(2), midstate_s(3), midstate_s(4), midstate_s(5), midstate_s(6), midstate_s(7), W(0), W(1), W(2), W(3), W(4), W(5), W(6), W(7), W(8), W(9), W(10), W(11), W(12), W(13), W(14), W(15), W(16), W(17), W(18), W(19), W(20), W(21), W(22), W(23), W(24), W(25), W(26), W(27), W(28), W(29), W(30), W(31), W(32), W(33), W(34), W(35), W(36), W(37), W(38), W(39), W(40), W(41), W(42), W(43), W(44), W(45), W(46), W(47), W(48), W(49), W(50), W(51), W(52), W(53), W(54), W(55), W(56), W(57), W(58), W(59), W(60), W(61), W(62), W(63), hc1_out(0), hc1_out(1), hc1_out(2), hc1_out(3), hc1_out(4), hc1_out(5), hc1_out(6), hc1_out(7)); 
	hash_out <= hc1_out(0) & hc1_out(1) & hc1_out(2) & hc1_out(3) & hc1_out(4) & hc1_out(5) & hc1_out(6) & hc1_out(7);
end sha256_inner;
