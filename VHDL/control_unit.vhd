-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : bitcoinminer
-- Author      : Jose
-- Company     : G
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\Jose\bitcoinminer\compile\control_unit.vhd
-- Generated   : 09/12/13 15:32:07
-- From        : c:\My_Designs\Jose\bitcoinminer\src\control_unit.asf
-- By          : FSM2VHDL ver. 5.0.7.2
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity control_unit is 
	port (
		clk: in STD_LOGIC;
		enable: in STD_LOGIC;
		hit: in STD_LOGIC;
		overflow: in STD_LOGIC;
		reset: in STD_LOGIC;
		compare_to_target: out STD_LOGIC;
		fail: out STD_LOGIC;
		increment_nonce: out STD_LOGIC;
		success: out STD_LOGIC);
end control_unit;

architecture control_unit_arch of control_unit is

-- diagram signals declarations
signal delay_counter_Sreg0: INTEGER range 0 to 132;

-- BINARY ENCODED state machine: Sreg0
attribute enum_encoding: string;
type Sreg0_type is (
    S2, S3, S4, S5, S7, S8, D1_DS1, D2_DS2
);
attribute enum_encoding of Sreg0_type: type is
	"000 " &		-- S2
	"001 " &		-- S3
	"010 " &		-- S4
	"011 " &		-- S5
	"100 " &		-- S7
	"101 " &		-- S8
	"110 " &		-- D1_DS1
	"111" ; 		-- D2_DS2

signal Sreg0: Sreg0_type;

begin


----------------------------------------------------------------------
-- Machine: Sreg0
----------------------------------------------------------------------
Sreg0_machine: process (clk)
begin
	if clk'event and clk = '1' then
		if reset='1' then	
			Sreg0 <= S2;
			-- Set default values for outputs, signals and variables
			-- ...
			compare_to_target <= '0';
			increment_nonce <= '0';
			fail <= '0';
			success <= '0';
		else
			if enable = '1' then
				-- Set default values for outputs, signals and variables
				-- ...
				case Sreg0 is
					when S2 =>
						compare_to_target <= '0';
						increment_nonce <= '0';
						fail <= '0';
						success <= '0';
						Sreg0 <= D1_DS1;
						delay_counter_Sreg0 <= 132 - 1;
					when S3 =>
						compare_to_target <= '1';
						increment_nonce <= '0';
						Sreg0 <= D2_DS2;
						delay_counter_Sreg0 <= 2 - 1;
					when S4 =>
						increment_nonce <= '0';
						compare_to_target <= '0';
						Sreg0 <= S5;
					when S5 =>
						success <= '1';
					when S7 =>
						increment_nonce <= '1';
						compare_to_target <= '0';
						if overflow = '0' then	
							Sreg0 <= S2;
						elsif overflow = '1' then	
							Sreg0 <= S8;
						end if;
					when S8 =>
						fail <= '1';
						increment_nonce <= '0';
					when D1_DS1 =>
						if delay_counter_Sreg0 = 0 then	
							Sreg0 <= S3;
						else
							Sreg0 <= D1_DS1;
							if delay_counter_Sreg0 /= 0 then delay_counter_Sreg0 <= delay_counter_Sreg0 - 1;
							end if;
						end if;
					when D2_DS2 =>
						if (delay_counter_Sreg0 = 0) and (hit = '0') then	
							Sreg0 <= S7;
						elsif (delay_counter_Sreg0 = 0) and (hit = '1') then	
							Sreg0 <= S4;
						else
							Sreg0 <= D2_DS2;
							if delay_counter_Sreg0 /= 0 then delay_counter_Sreg0 <= delay_counter_Sreg0 - 1;
							end if;
						end if;
--vhdl_cover_off
					when others =>
						null;
--vhdl_cover_on
				end case;
			end if;
		end if;
	end if;
end process;

end control_unit_arch;
