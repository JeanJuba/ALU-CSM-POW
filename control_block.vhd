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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity control_block is
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


end control_block;

architecture Behavioral of control_block is
	type state_type is (READ_MEMORY, CHECK_MULT_VALUES, CHECK_POW_VALUES, INVERT_OPERATORS, POW, MULT, RESULT);
begin

	


end Behavioral;

