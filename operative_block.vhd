library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity operative_block is
	Port(clock : in STD_LOGIC;
		  beginning : in STD_LOGIC;
		  memory_value_a: in STD_LOGIC_VECTOR(3 downto 0);
		  memory_value_counter: in STD_LOGIC_VECTOR(3 downto 0);
		  memory_value_pow: in STD_LOGIC_VECTOR(3 downto 0);
		  continue: in STD_LOGIC;
		  set_acumulator : in STD_LOGIC;
		  reset_acumulator : in STD_LOGIC;
		  set_counter : in STD_LOGIC;
		  reset_counter : in STD_LOGIC;
		  reset_pow : in STD_LOGIC;
		  reset_result : in STD_LOGIC;
		  pow_ready: out STD_LOGIC;
		  multiplication_ready: out STD_LOGIC;
		  result_ready : out STD_LOGIC;
		  result: out STD_LOGIC_VECTOR(3 downto 0)

	);
end operative_block;

architecture Behavioral of operative_block is

	component reg 
    Port (clock 	: in  STD_LOGIC;
			 set 	: in  STD_LOGIC;   --allow the register value to change
			 reset 	: in  STD_LOGIC;
			 input 	: in STD_LOGIC_VECTOR(3 downto 0 ); --the new value to be stored
			 stored 	: BUFFER  STD_LOGIC_VECTOR(3 downto 0)); --the stored value
	end component;

	component commutator 
		 Port (opt : in STD_LOGIC;
				  a : in  STD_LOGIC_VECTOR(3 downto 0);
				  b : in  STD_LOGIC_VECTOR(3 downto 0);
				  l : out  STD_LOGIC_VECTOR(3 downto 0);
				  r : out  STD_LOGIC_VECTOR(3 downto 0)); 
	end component;

	component comparator is
		 Port ( a, b : in  STD_LOGIC_VECTOR(3 downto 0);
				  s 	: out  STD_LOGIC);
	end component; 
	 
	component comparator_zero IS
	Port (
		input	: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		zero: OUT STD_LOGIC
	);
	end component;
	
	component logic_or is
    Port ( a : in  STD_LOGIC; 
           b : in  STD_LOGIC;
           s : out  STD_LOGIC);
	end component;
	
	component logic_not is
    Port ( a : in  STD_LOGIC;
           s : out  STD_LOGIC);
	end component;
	
	component logic_and is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           s : out  STD_LOGIC);
	end component;

	component subtractor is
    Port ( a : in  STD_LOGIC_VECTOR(3 downto 0);
           b : in  STD_LOGIC_VECTOR(3 downto 0);
           s : out  STD_LOGIC_VECTOR(3 downto 0));
	end component;
	
	component mux is
    Port ( a, b	: in  STD_LOGIC_VECTOR(3 downto 0);
           opt 	: in  STD_LOGIC;
           s 	: out  STD_LOGIC_VECTOR(3 downto 0));
	end component;
	
	component mux_result
    Port ( opt : in  STD_LOGIC;
           a : in  STD_LOGIC_VECTOR(3 downto 0);
           data : out  STD_LOGIC_VECTOR(3 downto 0);
           control : out  STD_LOGIC);
	end component;
	
	component adder
	port (a: in STD_LOGIC_VECTOR(3 downto 0);
			b: in STD_LOGIC_VECTOR(3 downto 0);
			s : out STD_LOGIC_VECTOR(3 downto 0));
	end component;
	
	signal comparator_counter_greater_than_a, comp_acum_zero_out, comparator_counter_zero_out, mux_result_ctrl,
	not_mux_result_ctrl_out, and_out, pow_result_ready, or_mult_pow_out, and_result_ready_out : STD_LOGIC;
	signal commutator_mult_left, commutator_mult_right, val_reg_acumulator, val_reg_counter, val_reg_result,
	mux_counter_out, mux_result_data, mult_subtractor_out, adder_result_out, mux_beginning_counter_out, mux_beginning_result_out: STD_LOGIC_VECTOR(3 downto 0); 
begin
	 
	comp_counter_greater_than_a : comparator port map (memory_value_a, memory_value_counter, comparator_counter_greater_than_a); --1 when counter > a else 0 
	commutator_mult : commutator port map (comparator_counter_greater_than_a, memory_value_a, memory_value_counter, commutator_mult_left, commutator_mult_right); --if comp_counter_greater_than_a sends 1 then it switches the order of the input
	reg_acumulator : reg port map (clock, set_acumulator, reset_acumulator, commutator_mult_left, val_reg_acumulator); --loads the acumulated value
	mux_counter: mux port map (commutator_mult_right, val_reg_acumulator, or_mult_pow_out, mux_counter_out);  --1 acumulator value 0 commutator value
	mux_beginning_counter :  mux port map (mult_subtractor_out, mux_counter_out, beginning, mux_beginning_counter_out);
	reg_counter : reg port map (clock, set_counter, reset_counter, mux_beginning_counter_out, val_reg_counter); --loads the value of the counter register
	comparator_acumulador_zero : comparator_zero port map (val_reg_acumulator, comp_acum_zero_out); --checks if the value of reg_acumulador is zero
	comparator_counter_zero : comparator_zero port map (val_reg_counter, comparator_counter_zero_out);    --checks if the value of reg_counter is zero
	or_zero : logic_or port map (comp_acum_zero_out, comparator_counter_zero_out, multiplication_ready);  --checks if either one of the mult comparators found zero
	mux_res : mux_result port map (comparator_counter_zero_out, val_reg_counter, mux_result_data, mux_result_ctrl); --if the counter reaches 0 then it sets the result register and lets the value pass
	mult_subtractor : subtractor port map (mux_result_data, "0001", mult_subtractor_out); --this output must go to the reg_counter
	not_mux_result_ctrl : logic_not port map (mux_result_ctrl, not_mux_result_ctrl_out);
	mux_beginning_result : mux port map (val_reg_result, val_reg_acumulator, beginning, mux_beginning_result_out );
	adder_result : adder port map (mux_beginning_result_out, "0001", adder_result_out);
	reg_result: reg port map (clock, not_mux_result_ctrl_out, reset_result, adder_result_out, val_reg_result);
	or_mult_pow_ready : logic_or port map (mux_result_ctrl, and_result_ready_out, or_mult_pow_out);
	and_result_ready : logic_and port map (mux_result_ctrl, '1', and_result_ready_out);
	
	pow_ready <= and_result_ready_out;
	result <= val_reg_result;
end Behavioral;

