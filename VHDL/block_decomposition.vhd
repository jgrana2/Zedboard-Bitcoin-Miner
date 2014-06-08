-------------------------------------------------------------------------------
--
-- Title       : block_decomposition
-- Design      : bitcoinminer
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : block_decomposition.vhd
-- Generated   : Tue May 21 19:20:59 2013
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
--{entity {block_decomposition} architecture {block_decomposition}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;
library work;
use work.functions_pkg.all;

entity block_decomposition is
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
end block_decomposition;

--}} End of automatically maintained section

architecture block_decomposition of block_decomposition is
signal sW1: UNSIGNED(31 downto 0);
signal sW2: UNSIGNED(31 downto 0);
signal sW3: UNSIGNED(31 downto 0);
signal sW4: UNSIGNED(31 downto 0);
signal sW5: UNSIGNED(31 downto 0);
signal sW6: UNSIGNED(31 downto 0);
signal sW7: UNSIGNED(31 downto 0);
signal sW8: UNSIGNED(31 downto 0);
signal sW9: UNSIGNED(31 downto 0);
signal sW10: UNSIGNED(31 downto 0);
signal sW11: UNSIGNED(31 downto 0);
signal sW12: UNSIGNED(31 downto 0);
signal sW13: UNSIGNED(31 downto 0);
signal sW14: UNSIGNED(31 downto 0);
signal sW15: UNSIGNED(31 downto 0);
signal sW16: UNSIGNED(31 downto 0);
signal sW17: UNSIGNED(31 downto 0);
signal sW18: UNSIGNED(31 downto 0);
signal sW19: UNSIGNED(31 downto 0);
signal sW20: UNSIGNED(31 downto 0);
signal sW21: UNSIGNED(31 downto 0);
signal sW22: UNSIGNED(31 downto 0);
signal sW23: UNSIGNED(31 downto 0);
signal sW24: UNSIGNED(31 downto 0);
signal sW25: UNSIGNED(31 downto 0);
signal sW26: UNSIGNED(31 downto 0);
signal sW27: UNSIGNED(31 downto 0);
signal sW28: UNSIGNED(31 downto 0);
signal sW29: UNSIGNED(31 downto 0);
signal sW30: UNSIGNED(31 downto 0);
signal sW31: UNSIGNED(31 downto 0);
signal sW32: UNSIGNED(31 downto 0);
signal sW33: UNSIGNED(31 downto 0);
signal sW34: UNSIGNED(31 downto 0);
signal sW35: UNSIGNED(31 downto 0);
signal sW36: UNSIGNED(31 downto 0);
signal sW37: UNSIGNED(31 downto 0);
signal sW38: UNSIGNED(31 downto 0);
signal sW39: UNSIGNED(31 downto 0);
signal sW40: UNSIGNED(31 downto 0);
signal sW41: UNSIGNED(31 downto 0);
signal sW42: UNSIGNED(31 downto 0);
signal sW43: UNSIGNED(31 downto 0);
signal sW44: UNSIGNED(31 downto 0);
signal sW45: UNSIGNED(31 downto 0);
signal sW46: UNSIGNED(31 downto 0);
signal sW47: UNSIGNED(31 downto 0);
signal sW48: UNSIGNED(31 downto 0);
signal sW49: UNSIGNED(31 downto 0);
signal sW50: UNSIGNED(31 downto 0);
signal sW51: UNSIGNED(31 downto 0);
signal sW52: UNSIGNED(31 downto 0);
signal sW53: UNSIGNED(31 downto 0);
signal sW54: UNSIGNED(31 downto 0);
signal sW55: UNSIGNED(31 downto 0);
signal sW56: UNSIGNED(31 downto 0);
signal sW57: UNSIGNED(31 downto 0);
signal sW58: UNSIGNED(31 downto 0);
signal sW59: UNSIGNED(31 downto 0);
signal sW60: UNSIGNED(31 downto 0);
signal sW61: UNSIGNED(31 downto 0);
signal sW62: UNSIGNED(31 downto 0);
signal sW63: UNSIGNED(31 downto 0);
signal sW64: UNSIGNED(31 downto 0);

begin
process(clk)
begin
	if (clk = '1' and clk'event) then
	sW16 <= M_in(31 downto 0);
	sW15 <= M_in(63 downto 32);
	sW14 <= M_in(95 downto 64);
	sW13 <= M_in(127 downto 96);
	sW12 <= M_in(159 downto 128);
	sW11 <= M_in(191 downto 160);
	sW10 <= M_in(223 downto 192);
	sW9 <= M_in(255 downto 224);
	sW8 <= M_in(287 downto 256);
	sW7 <= M_in(319 downto 288);
	sW6 <= M_in(351 downto 320);
	sW5 <= M_in(383 downto 352);
	sW4 <= M_in(415 downto 384);
	sW3 <= M_in(447 downto 416);
	sW2 <= M_in(479 downto 448);
	sW1 <= M_in(511 downto 480);
	sW17 <= s1(sW15)+sW10+s0(SW2)+sW1;
	sW18 <= s1(sW16)+sW11+s0(SW3)+sW2;
	sW19 <= s1(sW17)+sW12+s0(SW4)+sW3;
	sW20 <= s1(sW18)+sW13+s0(SW5)+sW4;
	sW21 <= s1(sW19)+sW14+s0(SW6)+sW5;
	sW22 <= s1(sW20)+sW15+s0(SW7)+sW6;
	sW23 <= s1(sW21)+sW16+s0(SW8)+sW7;
	sW24 <= s1(sW22)+sW17+s0(SW9)+sW8;
	sW25 <= s1(sW23)+sW18+s0(SW10)+sW9;
	sW26 <= s1(sW24)+sW19+s0(SW11)+sW10;
	sW27 <= s1(sW25)+sW20+s0(SW12)+sW11;
	sW28 <= s1(sW26)+sW21+s0(SW13)+sW12;
	sW29 <= s1(sW27)+sW22+s0(SW14)+sW13;
	sW30 <= s1(sW28)+sW23+s0(SW15)+sW14;
	sW31 <= s1(sW29)+sW24+s0(SW16)+sW15;
	sW32 <= s1(sW30)+sW25+s0(SW17)+sW16;
	sW33 <= s1(sW31)+sW26+s0(SW18)+sW17;
	sW34 <= s1(sW32)+sW27+s0(SW19)+sW18;
	sW35 <= s1(sW33)+sW28+s0(SW20)+sW19;
	sW36 <= s1(sW34)+sW29+s0(SW21)+sW20;
	sW37 <= s1(sW35)+sW30+s0(SW22)+sW21;
	sW38 <= s1(sW36)+sW31+s0(SW23)+sW22;
	sW39 <= s1(sW37)+sW32+s0(SW24)+sW23;
	sW40 <= s1(sW38)+sW33+s0(SW25)+sW24;
	sW41 <= s1(sW39)+sW34+s0(SW26)+sW25;
	sW42 <= s1(sW40)+sW35+s0(SW27)+sW26;
	sW43 <= s1(sW41)+sW36+s0(SW28)+sW27;
	sW44 <= s1(sW42)+sW37+s0(SW29)+sW28;
	sW45 <= s1(sW43)+sW38+s0(SW30)+sW29;
	sW46 <= s1(sW44)+sW39+s0(SW31)+sW30;
	sW47 <= s1(sW45)+sW40+s0(SW32)+sW31;
	sW48 <= s1(sW46)+sW41+s0(SW33)+sW32;
	sW49 <= s1(sW47)+sW42+s0(SW34)+sW33;
	sW50 <= s1(sW48)+sW43+s0(SW35)+sW34;
	sW51 <= s1(sW49)+sW44+s0(SW36)+sW35;
	sW52 <= s1(sW50)+sW45+s0(SW37)+sW36;
	sW53 <= s1(sW51)+sW46+s0(SW38)+sW37;
	sW54 <= s1(sW52)+sW47+s0(SW39)+sW38;
	sW55 <= s1(sW53)+sW48+s0(SW40)+sW39;
	sW56 <= s1(sW54)+sW49+s0(SW41)+sW40;
	sW57 <= s1(sW55)+sW50+s0(SW42)+sW41;
	sW58 <= s1(sW56)+sW51+s0(SW43)+sW42;
	sW59 <= s1(sW57)+sW52+s0(SW44)+sW43;
	sW60 <= s1(sW58)+sW53+s0(SW45)+sW44;
	sW61 <= s1(sW59)+sW54+s0(SW46)+sW45;
	sW62 <= s1(sW60)+sW55+s0(SW47)+sW46;
	sW63 <= s1(sW61)+sW56+s0(SW48)+sW47;
	sW64 <= s1(sW62)+sW57+s0(SW49)+sW48;
	
	W1 <= sW1;
	W2 <= sW2;
	W3 <= sW3;
	W4 <= sW4;
	W5 <= sW5;
	W6 <= sW6;
	W7 <= sW7;
	W8 <= sW8;
	W9 <= sW9;
	W10 <= sW10;
	W11 <= sW11;
	W12 <= sW12;
	W13 <= sW13;
	W14 <= sW14;
	W15 <= sW15;
	W16 <= sW16;
	W17 <= sW17;
	W18 <= sW18;
	W19 <= sW19;
	W20 <= sW20;
	W21 <= sW21;
	W22 <= sW22;
	W23 <= sW23;
	W24 <= sW24;
	W25 <= sW25;
	W26 <= sW26;
	W27 <= sW27;
	W28 <= sW28;
	W29 <= sW29;
	W30 <= sW30;
	W31 <= sW31;
	W32 <= sW32;
	W33 <= sW33;
	W34 <= sW34;
	W35 <= sW35;
	W36 <= sW36;
	W37 <= sW37;
	W38 <= sW38;
	W39 <= sW39;
	W40 <= sW40;
	W41 <= sW41;
	W42 <= sW42;
	W43 <= sW43;
	W44 <= sW44;
	W45 <= sW45;
	W46 <= sW46;
	W47 <= sW47;
	W48 <= sW48;
	W49 <= sW49;
	W50 <= sW50;
	W51 <= sW51;
	W52 <= sW52;
	W53 <= sW53;
	W54 <= sW54;
	W55 <= sW55;
	W56 <= sW56;
	W57 <= sW57;
	W58 <= sW58;
	W59 <= sW59;
	W60 <= sW60;
	W61 <= sW61;
	W62 <= sW62;
	W63 <= sW63;
	W64 <= sW64;
	end if;
end process;
end block_decomposition;
