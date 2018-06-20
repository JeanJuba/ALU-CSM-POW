LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

entity adder is
port (a: in STD_LOGIC_VECTOR(7 downto 0);
		s : out STD_LOGIC_VECTOR(7 downto 0));
end adder;

architecture behavior of adder is 
begin
	s <= a + "00000001";
end behavior;