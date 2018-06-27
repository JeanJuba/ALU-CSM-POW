----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:25:04 06/19/2018 
-- Design Name: 
-- Module Name:    mux_result - Behavioral 
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

entity mux_result is
    Port ( opt : in  STD_LOGIC;
           a : in  STD_LOGIC_VECTOR(3 downto 0);
           data : out  STD_LOGIC_VECTOR(3 downto 0);
           control : out  STD_LOGIC);
end mux_result;

architecture Behavioral of mux_result is

begin
	
	data <= a when opt = '0' else "0000";
	control <= opt;

end Behavioral;

