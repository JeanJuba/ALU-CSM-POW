----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:33:08 06/27/2018 
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
    Port ( clock : in  STD_LOGIC;
         reset : in  STD_LOGIC;
			instruction : in STD_LOGIC_VECTOR(8 downto 0);
			mem_empty : in STD_LOGIC;
			mult_result : in STD_LOGIC_VECTOR(3 downto 0);
         mult_ready : in  STD_LOGIC;
		   pow_result : in STD_LOGIC_VECTOR (3 downto 0);
         pow_ready : in  STD_LOGIC;
		   start_mult : out  STD_LOGIC;
		   start_pow : out STD_LOGIC;
			is_pow :out std_logic;
			
         set_base_mult : out  STD_LOGIC;
         reset_base_mult : out  STD_LOGIC;
         set_vezes_mult : out  STD_LOGIC;
         reset_vezes_mult : out  STD_LOGIC;
         set_result_mult : out  STD_LOGIC;
         reset_result_mult : out  STD_LOGIC;
		   
			set_base_pow : out  STD_LOGIC;
         reset_base_pow : out  STD_LOGIC;
         set_counter_pow : out  STD_LOGIC;
         reset_counter_pow : out  STD_LOGIC;
         set_result_pow : out  STD_LOGIC;
         reset_result_pow : out  STD_LOGIC;
		   
         final_result : out  STD_LOGIC_VECTOR(3 downto 0);
         operation_ready : out  STD_LOGIC;
			send_mem_val : out STD_LOGIC);
end control_block;

architecture Behavioral of control_block is
	type state_type is (START, REQUEST, CHECK_MEMORY, MULT_CONFIG, MULT, CHECK_MULT, POW_CONFIG, CONTINUE_POW, POW, RESULT_MULT, RESULT_POW);
	
	signal estado : state_type;
	
begin

	process (clock, reset)
	begin
		
		if reset = '1' then
			estado <= START;
		elsif clock'Event and clock = '1' then
			
			case (estado) is
			
			when START =>
				estado <= REQUEST;
				
			when REQUEST =>
				estado <= CHECK_MEMORY;
				
				
			when CHECK_MEMORY =>
			if mem_empty = '0' then
				if instruction(8) = '0' then
					estado <= MULT_CONFIG;
				else
					estado <= POW_CONFIG;
				end if;
			else
				estado <= START;
			end if;
				
			when MULT_CONFIG =>
				estado <= MULT;
				
			when MULT =>
				estado <= CHECK_MULT;
				
			when CHECK_MULT =>
				if mult_ready = '1' and instruction(8) = '0' then
					estado <= RESULT_MULT;
				elsif  mult_ready = '1' and instruction(8) = '1' then
					estado <= CONTINUE_POW;
				else
					estado <= MULT;
				end if;
				
			when RESULT_MULT =>
				estado <= START;
				
			when POW_CONFIG =>
				estado <= POW;
				
			when POW =>
				if pow_ready = '1' then
					estado <= RESULT_POW;
				else
					estado <= MULT_CONFIG;
				end if;
		
			when CONTINUE_POW =>
				if pow_ready = '1' then
					estado <= RESULT_POW;
				else
					estado <= MULT_CONFIG;
				end if;
			
			when RESULT_POW =>
				estado <= START;
		
			end case;
		
		
		end if;
	
	
	end process;
	
	process (estado)
	begin 
		
		case (estado) is
			
		
		when START =>
			send_mem_val <= '0';
			start_mult <= '0'; 
			set_base_mult <= '0';
         reset_base_mult <= '1';
         set_vezes_mult <= '0';
         reset_vezes_mult <= '1';
         set_result_mult <= '0';
         reset_result_mult <= '1';
			
			start_pow <= '0';
			set_base_pow <= '0';
         reset_base_pow <= '1';
         set_counter_pow <= '0';
         reset_counter_pow <= '1';
         set_result_pow <= '0';
         reset_result_pow <= '1';
			
         final_result <= "0000";
         operation_ready <= '0';
			is_pow <= '0';
		
		when REQUEST =>
			send_mem_val <= '1';
			start_mult <= '0';
			set_base_mult <= '0';
			reset_base_mult <= '0';
         set_vezes_mult <= '0';
         reset_vezes_mult <= '0';
         set_result_mult <= '0';
         reset_result_mult <= '0';
         final_result <= "0000";
         operation_ready <= '0';
			
			set_base_pow <= '0';
         reset_base_pow <= '0';
         set_counter_pow <= '0';
         reset_counter_pow <= '0';
         set_result_pow <= '0';
			
			
		when CHECK_MEMORY =>
			send_mem_val <= '0';
			start_mult <= '0';
			set_base_mult <= '0';
			reset_base_mult <= '0';
         set_vezes_mult <= '0';
         reset_vezes_mult <= '0';
         set_result_mult <= '0';
         reset_result_mult <= '0';
         final_result <= "0000";
         operation_ready <= '0';
			
			set_base_pow <= '0';
         reset_base_pow <= '0';
         set_counter_pow <= '0';
         reset_counter_pow <= '0';
         set_result_pow <= '0';
		
		when MULT_CONFIG =>
			start_pow <= '0';
			start_mult <= '1'; --configuração inicial
			set_base_mult <= '1';
			reset_base_mult <= '0';
			set_vezes_mult <= '1';
			reset_vezes_mult <= '0';
			set_result_mult <= '0';
			reset_result_mult <= '1';
			final_result <= "0000";
			operation_ready <= '0';
			set_counter_pow <= '0';
			
			set_base_pow <= '0';
         reset_base_pow <= '0';
         set_counter_pow <= '0';
         reset_counter_pow <= '0';
         set_result_pow <= '0';
         reset_result_pow <= '0';
		
		when MULT =>
			start_mult <= '0';
			set_base_mult <= '1';
			reset_base_mult <= '0';
         set_vezes_mult <= '1';
         reset_vezes_mult <= '0';
         set_result_mult <= '1';
         reset_result_mult <= '0';
         final_result <= "0000";
         operation_ready <= '0';
			
			set_base_pow <= '0';
         reset_base_pow <= '0';
         set_counter_pow <= '0';
         reset_counter_pow <= '0';
         set_result_pow <= '0';
         reset_result_pow <= '0';
			
		when CHECK_MULT => 
			start_mult <= '0';
			set_base_mult <= '0';
			reset_base_mult <= '0';
         set_vezes_mult <= '0';
         reset_vezes_mult <= '0';
         set_result_mult <= '0';
         reset_result_mult <= '0';
         final_result <= "0000";
         operation_ready <= '0';
			
			set_base_pow <= '0';
         reset_base_pow <= '0';
         set_counter_pow <= '0';
         reset_counter_pow <= '0';
         set_result_pow <= '0';
         reset_result_pow <= '0';
			
		when RESULT_MULT =>
		   start_mult <= '0';
		   set_base_mult <= '0';
         reset_base_mult <= '0';
         set_vezes_mult <= '0';
         reset_vezes_mult <= '0';
         set_result_mult <= '0';
         reset_result_mult <= '0';
         final_result <= mult_result;
         operation_ready <= '1';
		
		
		when POW_CONFIG =>
			start_pow <= '1'; --configuração inicial
			set_base_pow <= '1';
         reset_base_pow <= '0';
         set_counter_pow <= '1';
         reset_counter_pow <= '0';
         set_result_pow <= '1';
         reset_result_pow <= '0';
			is_pow <= '1';
			final_result <= "0000";
         operation_ready <= '0';
			
			start_mult <= '0';
		   set_base_mult <= '0';
         reset_base_mult <= '0';
         set_vezes_mult <= '0';
         reset_vezes_mult <= '0';
         set_result_mult <= '0';
         reset_result_mult <= '0';
			
		
		when CONTINUE_POW =>
			start_pow <= '0';
			set_base_pow <= '1';
         reset_base_pow <= '0';
         set_counter_pow <= '1';
         reset_counter_pow <= '0';
         set_result_pow <= '1';
         reset_result_pow <= '0';
			is_pow <= '1';
			final_result <= "0000";
         operation_ready <= '0';
			
			start_mult <= '0';
		   set_base_mult <= '0';
         reset_base_mult <= '0';
         set_vezes_mult <= '0';
         reset_vezes_mult <= '0';
         set_result_mult <= '0';
         reset_result_mult <= '0';
			
		when POW =>
			start_pow <= '1';
			set_base_pow <= '1';
         reset_base_pow <= '0';
         set_counter_pow <= '1';
         reset_counter_pow <= '0';
         set_result_pow <= '1';
         reset_result_pow <= '0';
			is_pow <= '1';
			final_result <= "0000";
         operation_ready <= '0';
			
			start_mult <= '0';
		   set_base_mult <= '0';
         reset_base_mult <= '0';
         set_vezes_mult <= '0';
         reset_vezes_mult <= '0';
         set_result_mult <= '0';
         reset_result_mult <= '0';
			
			
		when RESULT_POW =>
			start_pow <= '0';
			set_base_pow <= '0';
         reset_base_pow <= '0';
         set_counter_pow <= '0';
         reset_counter_pow <= '0';
         set_result_pow <= '0';
         reset_result_pow <= '0';
         final_result <= pow_result;
         operation_ready <= '1';
		
		end case;
	
	end process;

end Behavioral;

