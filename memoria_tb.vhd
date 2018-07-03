--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:59:14 05/26/2018
-- Design Name:   
-- Module Name:   C:/Users/Usuario/Desktop/calc_media_arit/memoria_tb.vhd
-- Project Name:  calc_media_arit
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: memoria
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
 
ENTITY memoria_tb IS
END memoria_tb;
 
ARCHITECTURE behavior OF memoria_tb IS 
 
   --Inputs
   signal clock : std_logic;-- := '0';
	signal reset : std_logic := '0';

 	--Outputs
   signal valor : std_logic_vector(7 downto 0);
   signal vazia : std_logic;

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: entity work.memoria PORT MAP (
          clock => clock,
			 reset => reset,
          valor => valor,
          vazia => vazia
        ); 

   -- Clock process definitions
   clock_process :process
   begin
		clock <= '0';
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
   end process;  
	

END;
