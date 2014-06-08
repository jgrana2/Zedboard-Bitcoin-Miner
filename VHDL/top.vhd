library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity top is
	port(
		clk : in STD_LOGIC;
		enable : in STD_LOGIC;
		reset : in STD_LOGIC;
		data0: in UNSIGNED(31 downto 0);
		data1: in UNSIGNED(31 downto 0);
		data2: in UNSIGNED(31 downto 0);
		midstate0: in UNSIGNED(31 downto 0);
		midstate1: in UNSIGNED(31 downto 0);
		midstate2: in UNSIGNED(31 downto 0);
		midstate3: in UNSIGNED(31 downto 0);
		midstate4: in UNSIGNED(31 downto 0);
		midstate5: in UNSIGNED(31 downto 0);
		midstate6: in UNSIGNED(31 downto 0);
		midstate7: in UNSIGNED(31 downto 0);
		target0: in UNSIGNED(31 downto 0);
		target1: in UNSIGNED(31 downto 0);
		target2: in UNSIGNED(31 downto 0);
		target3: in UNSIGNED(31 downto 0);
		target4: in UNSIGNED(31 downto 0);
		target5: in UNSIGNED(31 downto 0);
		target6: in UNSIGNED(31 downto 0);
		target7: in UNSIGNED(31 downto 0);
		hit : out STD_LOGIC;
		hash0: out UNSIGNED(31 downto 0);
		hash1: out UNSIGNED(31 downto 0);
		hash2: out UNSIGNED(31 downto 0);
		hash3: out UNSIGNED(31 downto 0);
		hash4: out UNSIGNED(31 downto 0);
		hash5: out UNSIGNED(31 downto 0);
		hash6: out UNSIGNED(31 downto 0);
		hash7: out UNSIGNED(31 downto 0);
		compare_to_target: out STD_logic;
		overflow: out STD_logic;
		fail: out STD_LOGIC;
		success: out STD_LOGIC;
		nonce_out : out UNSIGNED (31 downto 0)
		);
end top;

architecture top of top is

component padding
	port(
		 clk : in STD_LOGIC;
		 data_in : in UNSIGNED(127 downto 0);
		 M2 : out UNSIGNED(511 downto 0)
	     );
end component;  

component comparator
	port(
		clk : in STD_LOGIC;
		hash_in : in UNSIGNED(255 downto 0);
		target : in UNSIGNED(255 downto 0);
		compare_to_target: in STD_logic;
		hit : out STD_LOGIC
		);
end component;

component sha256_inner
  port(
		 clk : in STD_LOGIC;
		 M2 : in UNSIGNED(511 downto 0);
		 midstate: in UNSIGNED(255 downto 0);
		 hash_out : out UNSIGNED(255 downto 0)
	     );
end component;
component sha256_outer
  	port(
		clk : in STD_LOGIC;
		data : in UNSIGNED(255 downto 0);
		hash_out : out UNSIGNED(255 downto 0)
		);
end component;
component increaser
   port(
		clk : in STD_LOGIC;
		reset : in STD_LOGIC;
		enable: in STD_LOGIC;
		nonce_out : out UNSIGNED(31 downto 0);
		overflow: out STD_LOGIC
		);
end component;

component control_unit
	port(
		clk: in STD_LOGIC;
		enable: in STD_LOGIC;
		hit: in STD_LOGIC;
		overflow: in STD_LOGIC;
		reset: in STD_LOGIC;
		compare_to_target: out STD_LOGIC;
		fail: out STD_LOGIC;
		increment_nonce: out STD_LOGIC;
		success: out STD_LOGIC
		);
end component;

---- Signal declarations used on the diagram ----

signal inner_sha_out_s, hash_out_s, midstate_s, target_s: UNSIGNED (255 downto 0);
signal data_s : UNSIGNED (127 downto 0);
signal m2_s: UNSIGNED (511 downto 0);
signal hit_s,overflow_s,compare_to_target_s,increment_nonce_s : std_logic;
signal nonce_out_s: UNSIGNED(31 downto 0);

begin

----  Component instantiations  ----

control_unit1: control_unit port map(clk, enable, hit_s, overflow_s, reset, compare_to_target_s, fail, increment_nonce_s, success);
padding1: padding port map(clk, data_s, m2_s);
sha256_inner1 : sha256_inner port map(clk, m2_s, midstate_s, inner_sha_out_s);
sha256_outer1 : sha256_outer port map(clk, inner_sha_out_s, hash_out_s);
comparator1 : comparator port map(clk, hash_out_s, target_s, compare_to_target_s, hit_s);
increaser1 : increaser port map(clk, reset, increment_nonce_s, nonce_out_s, overflow_s);

---- Terminal assignment ----

data_s <=  data0 & data1 & data2 & nonce_out_s;
target_s <= target0 & target1 & target2 & target3 & target4 & target5 & target6 & target7;
midstate_s <= midstate0 & midstate1 & midstate2 & midstate3 & midstate4 & midstate5 & midstate6 & midstate7;

-- Output\buffer terminals

hash0 <= hash_out_s(255 downto 224);
hash1 <= hash_out_s(223 downto 192);
hash2 <= hash_out_s(191 downto 160);
hash3 <= hash_out_s(159 downto 128);
hash4 <= hash_out_s(127 downto 96);
hash5 <= hash_out_s(95 downto 64);
hash6 <= hash_out_s(63 downto 32);
hash7 <= hash_out_s(31 downto 0);
nonce_out <= nonce_out_s;
hit <= hit_s;
compare_to_target <= compare_to_target_s;
overflow <= overflow_s;
end top;
