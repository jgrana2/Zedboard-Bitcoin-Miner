library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package functions_pkg is
	function ch(x,y,z: UNSIGNED) return UNSIGNED;
	function maj(x,y,z: UNSIGNED) return UNSIGNED;
	function e0(d: UNSIGNED) return UNSIGNED;
	function e1(d: UNSIGNED) return UNSIGNED;
	function s0(d: UNSIGNED) return UNSIGNED;
	function s1(d: UNSIGNED) return UNSIGNED;
end functions_pkg;

package body functions_pkg is

	function ch(x,y,z: UNSIGNED) return UNSIGNED is
    variable q: UNSIGNED (31 downto 0);
    begin
		q := (x and y) xor (not(x) and z);
    return q;
   end ch;
   
   function maj(x,y,z: UNSIGNED) return UNSIGNED is
    variable q: UNSIGNED (31 downto 0);
    begin
		q := (x and y) xor (x and z) xor (y and z);
    return q;
   end maj;

   function e0(d: UNSIGNED) return UNSIGNED is
    variable q: UNSIGNED (31 downto 0);
    begin
		q := (d(1 downto 0) & d(31 downto 2)) xor (d(12 downto 0) & d(31 downto 13)) xor (d(21 downto 0) & d(31 downto 22));
    return q;
   end e0;
   
   function e1(d: UNSIGNED) return UNSIGNED is
    variable q: UNSIGNED (31 downto 0);
    begin
		q := (d(5 downto 0) & d(31 downto 6)) xor (d(10 downto 0) & d(31 downto 11)) xor (d(24 downto 0) & d(31 downto 25));
    return q;
   end e1;
   
   function s0(d: UNSIGNED) return UNSIGNED is
    variable q: UNSIGNED (31 downto 0);
    begin
		q(31 downto 29) := d(6 downto 4) xor d(17 downto 15);
		q(28 downto 0) := (d(3 downto 0) & d(31 downto 7)) xor (d(14 downto 0) & d(31 downto 18)) xor d(31 downto 3);
    return q;
   end s0;
   
   function s1(d: UNSIGNED) return UNSIGNED is
    variable q: UNSIGNED (31 downto 0);
    begin
		q(31 downto 22) := d(16 downto 7) xor d(18 downto 9);
		q(21 downto 0) := (d(6 downto 0) & d(31 downto 17)) xor (d(8 downto 0) & d(31 downto 19)) xor d(31 downto 10);
    return q;
   end s1;
   
end functions_pkg;