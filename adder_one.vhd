LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

entity adder_one is
port (a: in STD_LOGIC_VECTOR(7 downto 0);
		s : out STD_LOGIC_VECTOR(7 downto 0));
end adder_one;

architecture behavior of adder_one is 
begin
	s <= a + "00000001";
end behavior;