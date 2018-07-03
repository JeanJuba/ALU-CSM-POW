--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:21:43 06/30/2018
-- Design Name:   
-- Module Name:   C:/Users/Usuario/Desktop/ALTERNATIVE_MULT_POW/main_tb.vhd
-- Project Name:  ALTERNATIVE_MULT_POW
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: MAIN_BLOCK
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY main_tb IS
END main_tb;
 
ARCHITECTURE behavior OF main_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
     

   --Inputs
   signal clock : std_logic := '0';
   signal reset : std_logic := '0';
   --signal instruction : std_logic_vector(8 downto 0) := (others => '0');

 	--Outputs
   signal result : std_logic_vector(3 downto 0);
   signal result_ready : std_logic;

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: entity work.MAIN_BLOCK PORT MAP (
          clock => clock,
          reset => reset,
          --instruction => instruction,
          result => result,
          result_ready => result_ready
        );

   -- Clock process definitions
   clock_process :process
   begin
		clock <= '0';
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
   end process;
 
	reset <= '0';
	--instruction <= "001010011";--"000100011";-- , ;

END;
