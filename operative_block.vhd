library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity block_operative is
	Port(clock : in STD_LOGIC;
		  memory_value_a: in STD_LOGIC_VECTOR(3 downto 0);
		  memory_value_counter: in STD_LOGIC_VECTOR(3 downto 0);
		  memory_value_pow: in STD_LOGIC_VECTOR(3 downto 0);
		  continue: in STD_LOGIC;
		  set_acumulador : in STD_LOGIC;
		  reset_acumulador : in STD_LOGIC;
		  set_counter : in STD_LOGIC;
		  reset_counter : in STD_LOGIC;
		  reset_pow : in STD_LOGIC;
		  reset_result : in STD_LOGIC;
		  pow_ready: out STD_LOGIC;
		  multiplication_ready: out STD_LOGIC;
		  result_ready : out STD_LOGIC;
		  result: out STD_LOGIC_LOGIC(7 downto 0)

	);
end operative_block;

architecture Behavioral of block_operative is

	component reg 
    Port (clock 	: in  STD_LOGIC;
			 set 	: in  STD_LOGIC;   --allow the register value to change
			 reset 	: in  STD_LOGIC;
			 input 	: in STD_LOGIC_VECTOR(7 downto 0 ); --the new value to be stored
			 stored 	: BUFFER  STD_LOGIC_VECTOR(7 downto 0)); --the stored value
	end component;

	component commutator 
		 Port (opt : in STD_LOGIC;
				  a : in  STD_LOGIC_VECTOR(3 downto 0);
				  b : in  STD_LOGIC_VECTOR(3 downto 0);
				  l : out  STD_LOGIC_VECTOR(3 downto 0);
				  r : out  STD_LOGIC_VECTOR(3 downto 0));
	end component;

	component comparator is
		 Port ( a, b : in  STD_LOGIC_VECTOR(7 downto 0);
				  s 	: out  STD_LOGIC);
	end component; 
	
	component comparator_zero IS
	Port (
		input	: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
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
    Port ( a : in  STD_LOGIC_VECTOR(7 downto 0);
           b : in  STD_LOGIC_VECTOR(7 downto 0);
           s : out  STD_LOGIC_VECTOR(7 downto 0));
	end component;
	
	component mux is
    Port ( a, b	: in  STD_LOGIC_VECTOR(7 downto 0);
           opt 	: in  STD_LOGIC;
           s 	: out  STD_LOGIC_VECTOR(7 downto 0));
	end component;
	
	signal comp_counter_gr_than_a  : STD_LOGIC;
	signal com_mult_left, com_mult_right, val_reg_acumulador : STD_LOGIC_VECTOR(3 downto 0); 
begin
	
	comp_counter_greater_than_a : comparator port map (memory_value_a, memory_value_counter, comp_counter_gr_than_a);
	commutator_mult : commutator port map (comp_counter_gr_than_a, memory_value_a, memory_value_counter, com_mult_left, com_mult_right);
	reg_acumulador : reg port map (clock, set_acumulador, reset_acumulador, com_mult_left, val_reg_acumulador);
	
end Behavioral;

