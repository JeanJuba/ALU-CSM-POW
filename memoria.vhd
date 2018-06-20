library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity memory is
    Port ( clock, reset, enviar :in STD_LOGIC;
		     valor : out  STD_LOGIC_VECTOR(7 downto 0));
end memory;

architecture Behavioral of memory is
	
	type ROM is array (0 to 4) of STD_LOGIC_VECTOR(8 downto 0); --Read only memory
								  --2^3		     2x3 			0^4			4^0				3x8
	constant mem : ROM := ("100100011", "000100011", "100000100", "101000000", "000111000");
	signal mem_value : STD_LOGIC_VECTOR(7 downto 0);
	
begin
	process(clock, reset)
		variable counter : integer := 0;
	begin
	
		if reset = '1' then
			 counter := 0;
		elsif rising_edge(clock) and enviar = '1' then 
			 mem_value <= mem(counter);	
		    counter := counter + 1; --increases counter by one			 
		end if;

	end process;
	
	valor <= mem_value; 			--sends the memory value read to the output

end Behavioral;

