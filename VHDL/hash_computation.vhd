-------------------------------------------------------------------------------
--
-- Title       : hash_computation
-- Design      : bitcoinminer
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : hash_computation.vhd
-- Generated   : Tue May 21 21:19:14 2013
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
--{entity {hash_computation} architecture {hash_computation}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;
library work;
use work.functions_pkg.all;

entity hash_computation is
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
end hash_computation;

--}} End of automatically maintained section

architecture hash_computation of hash_computation is

type k_array is array(integer range 0 to 63) of unsigned(31 downto 0);
constant K : k_array := (
X"428a2f98", X"71374491", X"b5c0fbcf", X"e9b5dba5", X"3956c25b", X"59f111f1", X"923f82a4", X"ab1c5ed5",
X"d807aa98", X"12835b01", X"243185be", X"550c7dc3", X"72be5d74", X"80deb1fe", X"9bdc06a7", X"c19bf174",
X"e49b69c1", X"efbe4786", X"0fc19dc6", X"240ca1cc", X"2de92c6f", X"4a7484aa", X"5cb0a9dc", X"76f988da",
X"983e5152", X"a831c66d", X"b00327c8", X"bf597fc7", X"c6e00bf3", X"d5a79147", X"06ca6351", X"14292967",
X"27b70a85", X"2e1b2138", X"4d2c6dfc", X"53380d13", X"650a7354", X"766a0abb", X"81c2c92e", X"92722c85",
X"a2bfe8a1", X"a81a664b", X"c24b8b70", X"c76c51a3", X"d192e819", X"d6990624", X"f40e3585", X"106aa070",
X"19a4c116", X"1e376c08", X"2748774c", X"34b0bcb5", X"391c0cb3", X"4ed8aa4a", X"5b9cca4f", X"682e6ff3",
X"748f82ee", X"78a5636f", X"84c87814", X"8cc70208", X"90befffa", X"a4506ceb", X"bef9a3f7", X"c67178f2"
	); 


type subproduct is array (64 downto 0) of unsigned(31 downto 0); 
type hash is array (7 downto 0) of unsigned(31 downto 0);
type clk_delay2 is array (1 downto 0) of unsigned(31 downto 0);	   --2 cycle delay to synchronize the pipeline results
signal a, b, c, d, e, f, g, h, W: subproduct;
signal hashes : hash;
signal H2_temp, H3_temp, H4_temp, H6_temp, H7_temp, H8_temp, H3_delay, H7_delay: unsigned(31 downto 0);
signal H4_delay, H8_delay: clk_delay2;



begin

W(0) <= W1;
W(1) <= W2;
W(2) <= W3;
W(3) <= W4;
W(4) <= W5;
W(5) <= W6;
W(6) <= W7;
W(7) <= W8;
W(8) <= W9;
W(9) <= W10;
W(10) <= W11;
W(11) <= W12;
W(12) <= W13;
W(13) <= W14;
W(14) <= W15;
W(15) <= W16;
W(16) <= W17;
W(17) <= W18;
W(18) <= W19;
W(19) <= W20;
W(20) <= W21;
W(21) <= W22;
W(22) <= W23;
W(23) <= W24;
W(24) <= W25;
W(25) <= W26;
W(26) <= W27;
W(27) <= W28;
W(28) <= W29;
W(29) <= W30;
W(30) <= W31;
W(31) <= W32;
W(32) <= W33;
W(33) <= W34;
W(34) <= W35;
W(35) <= W36;
W(36) <= W37;
W(37) <= W38;
W(38) <= W39;
W(39) <= W40;
W(40) <= W41;
W(41) <= W42;
W(42) <= W43;
W(43) <= W44;
W(44) <= W45;
W(45) <= W46;
W(46) <= W47;
W(47) <= W48;
W(48) <= W49;
W(49) <= W50;
W(50) <= W51;
W(51) <= W52;
W(52) <= W53;
W(53) <= W54;
W(54) <= W55;
W(55) <= W56;
W(56) <= W57;
W(57) <= W58;
W(58) <= W59;
W(59) <= W60;
W(60) <= W61;
W(61) <= W62;
W(62) <= W63;
W(63) <= W64;
 
a(0) <= H1_in;
b(0) <= H2_in;
c(0) <= H3_in;
d(0) <= H4_in;
e(0) <= H5_in;
f(0) <= H6_in;
g(0) <= H7_in;
h(0) <= H8_in;
		
	-- T1(0) <= H8_in + e1(H5_in) + ch(H5_in, H6_in, H7_in) + K(0) + W(0);
--	 T2(0) <= e0(H1_in) + maj(H1_in,H2_in,H3_in);
--	 h(1) <= H7_in;
--	 g(1) <= H6_in;
--	 f(1) <= H5_in;
--	 e(1) <= H4_in + T1(0);
--	 d(1) <= H3_in;
--	 c(1) <= H2_in;
--	 b(1) <= H1_in;
--	 a(1) <= T1(0) + T2(0);
	 
	 rounds: for i in 0 to 63 generate
	 begin
	 	process(clk)
		 variable T1, T2 : subproduct;
	 	begin
		if (clk = '1' and clk'event) then 
			 T1(i) := h(i)+ e1(e(i)) + ch(e(i), f(i), g(i)) + K(i) + W(i);
			 T2(i) := e0(a(i)) + maj(a(i),b(i),c(i));
			 h(i+1) <= g(i);
			 g(i+1) <= f(i);
			 f(i+1) <= e(i);
			 e(i+1) <= d(i) + T1(i);
			 d(i+1) <= c(i);
			 c(i+1) <= b(i);
			 b(i+1) <= a(i);
			 a(i+1) <= T1(i) + T2(i);
		end if;
		end process;
	 end generate rounds;
	 
	 process(clk)
	 begin
		 if (clk = '1' and clk'event) then 
			 
			H1_out <= H1_in + a(64);
			H2_out <= H2_in + b(64);
			H3_out <= H3_in + c(64);
			H4_out <= H4_in + d(64);	--?
			H5_out <= H5_in + e(64);
			H6_out <= H6_in + f(64);
			H7_out <= H7_in + g(64);
			H8_out <= H8_in + h(64);	--?
			
			--H1_out <= H1_in + a(64);
--			H2_temp <= H2_in + b(64);
--			H3_temp <= H3_in + c(64);
--			H4_temp <= H4_in + d(64);	--?
--			H5_out <= H5_in + e(64);
--			H6_temp <= H6_in + f(64);
--			H7_temp <= H7_in + g(64);
--			H8_temp <= H8_in + h(64);	--?
--			
--			H3_delay <= H3_temp;
--			H4_delay <= H4_delay(H4_delay'high-1 downto 0) & H4_temp;
--			H7_delay <= H7_temp;
--			H8_delay <= H8_delay(H8_delay'high-1 downto 0) & H8_temp;
--  			
--			H2_out <= H2_temp;
--			H3_out <= H3_delay;
--			H4_out <= H4_delay(H4_delay'high);
--			H6_out <= H6_temp;
--			H7_out <= H7_delay;
--			H8_out <= H8_delay(H8_delay'high);
			end if;
	end process;
   	 

   
   
   
end hash_computation;
