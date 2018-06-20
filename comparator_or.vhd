LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY comparator_or IS
	PORT (
		a, b: IN STD_LOGIC;
		s: OUT STD_LOGIC
	);
END comparator_or;

ARCHITECTURE Behavioral OF comparator_or IS
BEGIN

	s <= a or b;
	
END Behavioral;