----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:51:21 06/30/2018 
-- Design Name: 
-- Module Name:    MAIN_BLOCK - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MAIN_BLOCK is
    Port ( clock : in  STD_LOGIC;
			  reset : in  STD_LOGIC;
			  --instruction : in  STD_LOGIC_VECTOR(8 downto 0);
           result : out  STD_LOGIC_VECTOR(3 downto 0);
			  result_ready : out STD_LOGIC);
	 end MAIN_BLOCK;

architecture Behavioral of MAIN_BLOCK is

	component mult_block
    Port ( clock : in  STD_LOGIC;
           reset : in  STD_LOGIC;
			  mult_zero : in STD_LOGIC;
			  start : in STD_LOGIC;
			  set_base : in  STD_LOGIC;
			  reset_base : in  STD_LOGIC;
			  set_vezes : in  STD_LOGIC;
			  reset_vezes : in  STD_LOGIC;
			  set_result : in  STD_LOGIC;
			  reset_result : in  STD_LOGIC;
           base_value : in  STD_LOGIC_VECTOR(3 downto 0); 
           vezes_value : in  STD_LOGIC_VECTOR(3 downto 0);
           result : out  STD_LOGIC_VECTOR(3 downto 0);
           result_ready : out  STD_LOGIC);
	end component;

	component control_block
    Port (clock : in  STD_LOGIC;
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
			
         set_base_mult : out  STD_LOGIC; --base
         reset_base_mult : out  STD_LOGIC;
         set_vezes_mult : out  STD_LOGIC; --vezes
         reset_vezes_mult : out  STD_LOGIC;
         set_result_mult : out  STD_LOGIC; --result
         reset_result_mult : out  STD_LOGIC;
		   
		   set_base_pow : out  STD_LOGIC; --base
         reset_base_pow : out  STD_LOGIC;
         set_counter_pow : out  STD_LOGIC; --counter
         reset_counter_pow : out  STD_LOGIC;
         set_result_pow : out  STD_LOGIC; --result
         reset_result_pow : out  STD_LOGIC;
		   
         final_result : out  STD_LOGIC_VECTOR(3 downto 0);
         operation_ready : out  STD_LOGIC;
			send_mem_val : out STD_LOGIC);
	end component;

	component power_block
   Port ( clock : in  STD_LOGIC;
           reset : in  STD_LOGIC;
			  start : in  STD_LOGIC;
			  set_base : in  STD_LOGIC;
			  reset_base : in  STD_LOGIC;
			  set_counter : in  STD_LOGIC;
			  reset_counter : in  STD_LOGIC;
			  set_resultado : in  STD_LOGIC;
			  reset_resultado : in  STD_LOGIC;
			  mem_base : in std_logic_vector(3 downto 0);
			  mem_counter : in std_logic_vector(3 downto 0);
			  mult_result : in std_logic_vector(3 downto 0);
			  base_value : out std_logic_vector(3 downto 0);
			  result : out std_logic_vector(3 downto 0);
			  result_ready : out std_logic);
	end component;
	
	component memoria
    Port ( clock, reset, enviar :in STD_LOGIC;
		     valor : out  STD_LOGIC_VECTOR(8 downto 0);
           memoria_vazia : out  STD_LOGIC);
	end component;
	
	component mux
    Port ( a, b	: in  STD_LOGIC_VECTOR(3 downto 0);
           opt 	: in  STD_LOGIC;
           s 	: out  STD_LOGIC_VECTOR(3 downto 0));
	end component;
	
	component special_block
    Port (clock : in STD_LOGIC; 
	 instruction : in  STD_LOGIC_VECTOR(8 downto 0);
           a : out  STD_LOGIC_VECTOR(3 downto 0);
		   b : out  STD_LOGIC_VECTOR(3 downto 0);
			mult_zero : out STD_LOGIC);
	end component;
	
signal start_mult, start_pow, is_pow, mult_ready, pow_ready, send_mem_value, mem_empty, mult_zero : STD_LOGIC;
signal set_base_mult, set_vezes_mult, set_result_mult : STD_LOGIC;
signal reset_base_mult, reset_vezes_mult, reset_result_mult : STD_LOGIC;

signal set_base_pow, set_counter_pow, set_result_pow : STD_LOGIC;
signal reset_base_pow, reset_counter_pow, reset_result_pow : STD_LOGIC;

signal mult_result, pow_result, pow_base : STD_LOGIC_VECTOR(3 downto 0);

signal mux_mult_base_out, mux_mult_vezes_out, special_base, special_counter : STD_LOGIC_VECTOR(3 downto 0);

signal instruction_mem : STD_LOGIC_VECTOR(8 downto 0);

begin
	
	mux_mult_base : mux port map (instruction_mem(7 downto 4), pow_result, is_pow, mux_mult_base_out);
	mux_mult_vezes : mux port map (instruction_mem(3 downto 0), pow_base, is_pow, mux_mult_vezes_out);
	
	mem : memoria port map (clock, reset, send_mem_value, instruction_mem, mem_empty);
	
	spcl_case : special_block port map (clock, instruction_mem, special_base, special_counter, mult_zero);
	
	ctrl : control_block port map(clock, reset, instruction_mem, mem_empty, mult_result, mult_ready, pow_result, pow_ready, start_mult, start_pow, is_pow,
			 set_base_mult, reset_base_mult, set_vezes_mult, reset_vezes_mult, set_result_mult, reset_result_mult,
			 set_base_pow, reset_base_pow, set_counter_pow, reset_counter_pow, set_result_pow, reset_result_pow, result, result_ready, send_mem_value);
	
	mlt : mult_block port map (clock, reset, mult_zero, start_mult, set_base_mult, reset_base_mult, set_vezes_mult, reset_vezes_mult, set_result_mult, reset_result_mult,
			mux_mult_base_out, mux_mult_vezes_out, mult_result, mult_ready);
			
	pow : power_block port map(clock, reset, start_pow, set_base_pow, reset_base_pow, set_counter_pow, reset_counter_pow, set_result_pow, reset_result_pow,
			special_base, special_counter, mult_result, pow_base, pow_result, pow_ready);

	

end Behavioral;

