----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:21:52 06/19/2018 
-- Design Name: 
-- Module Name:    control_block - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity block_control is
	port(clock : in STD_LOGIC;
		  set_a: out STD_LOGIC;
		  reset_a: out STD_LOGIC;
		  set_counter: out STD_LOGIC;
		  reset_counter: out STD_LOGIC;
		  set_result: out STD_LOGIC;
		  reset_result: out STD_LOGIC;
		  set_pow: out STD_LOGIC;
		  reset_pow: out STD_LOGIC
	);


end block_control;

architecture Behavioral of block_control is
	type state_type is (READ_MEMORY, POW, MULT, RESULT);

	signal state : state_type;
begin

process(clock, reset)
begin

	case (state) is
	
		when READ_MEMORY =>
	
		when POW =>
		
		when MULT =>
		
		when RESULT =>
		
		end case;

end process;


process(state)
begin

	case(state) is
	
		when READ_MEMORY =>
		
		
		when POW =>
		
		
		when MULT =>
		
		
		when RESULT =>
		
		
		end case;


end process;

	


end Behavioral;

