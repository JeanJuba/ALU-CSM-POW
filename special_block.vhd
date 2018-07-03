----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:07:56 07/02/2018 
-- Design Name: 
-- Module Name:    special_block - Behavioral 
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

entity special_block is
    Port ( clock : in STD_LOGIC;
			  instruction : in  STD_LOGIC_VECTOR(8 downto 0);
           a : out  STD_LOGIC_VECTOR(3 downto 0);
			  b : out  STD_LOGIC_VECTOR(3 downto 0);
			  mult_zero : out STD_LOGIC);
end special_block;

architecture Behavioral of special_block is

begin
	
	process(clock)
	begin
		if instruction(8) = '1' then --POWER
			if instruction(7 downto 4) = "0000" then
					a <= "0000";
					b <= "0001";
			elsif instruction(3 downto 0) = "0000" then
					a <= "0001";
					b <= "0001";
			else
					a <= instruction(7 downto 4);
					b <= instruction(3 downto 0);
					
			end if;
		
		else --MULTIPLICATION
				if instruction(7 downto 4) = "0000" or instruction(3 downto 0) = "0000" then
					a <= "0000";
					b <= "0000";
				else
					a <= instruction(7 downto 4);
					b <= instruction(3 downto 0);
				end if;
		
		end if;
	end process;

end Behavioral;

