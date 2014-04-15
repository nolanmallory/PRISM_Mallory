-------------------------------------------------------------------------------
--
-- Title       : ALU
-- Design      : ALU
-- Author      : Nolan Mallory
-- Company     : usafa
--
-------------------------------------------------------------------------------
--
-- File        : ALU.vhd
-- Generated   : Fri Mar 30 11:16:54 2007
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.20
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {ALU} architecture {ALU}}

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ALU is
	 port(
		 OpSel : in STD_LOGIC_VECTOR(2 downto 0);
		 Data : in STD_LOGIC_VECTOR(3 downto 0);
		 Accumulator : in STD_LOGIC_VECTOR(3 downto 0);
		 Result : out STD_LOGIC_VECTOR(3 downto 0)
	     );
end ALU;

--}} End of automatically maintained section

architecture ALU of ALU is	   

signal AccumulatorSignal: Std_logic_vector( 3 downto 0);

begin
AccumulatorSignal <= Accumulator;			
-- fill in details to create result as a function of Data and Accumulator, based on OpSel.
 -- e.g : Build a multiplexer choosing between the eight ALU operations.  Either use a case statement (and thus a process)
 --       or a conditional signal assignment statement ( x <= Y when <condition> else . . .)
 -- ALU Operations are defined as:
 -- OpSel : Function
--  0     : AND
--  1     : NEG (2s complement)
--  2     : NOT (invert)
--  3     : ROR
--  4     : OR
--  5     : IN
--  6     : ADD
--  7     : LD
aluswitch: process (Accumulator, Data, OpSel)


        begin
			case OpSel is 
			 when "000" => 
                Result <= Accumulator and Data;  --AND
            when "001" => 
                Result <= not(Accumulator)+ "0001"; --NEG
            when "010" => 
                Result <= not Accumulator;  --NOT
            when "011" => 
					 Result(3) <= AccumulatorSignal(0);
                Result(2) <= AccumulatorSignal(3);--ROR
					 Result(1) <= AccumulatorSignal(2);
					 Result(0) <= AccumulatorSignal(1);
            when "100" => 
                Result <= Accumulator or Data; --OR              
            when "101" => 
                Result <= Data;  --IN
            when "110" => 
                Result <= Accumulator + Data;  --ADD     
            when others =>
                Result <= Data;
        end case;       
		end process;

end ALU;

