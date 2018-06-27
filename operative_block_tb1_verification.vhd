LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY operative_block_tb1_verification IS
END operative_block_tb1_verification;
 
ARCHITECTURE behavior OF operative_block_tb1_verification IS 

    

   --Inputs
   signal clock : std_logic := '0';
	signal beginning : std_logic := '0';
   signal memory_value_a : std_logic_vector(3 downto 0) := (others => '0');
   signal memory_value_counter : std_logic_vector(3 downto 0) := (others => '0');
   signal memory_value_pow : std_logic_vector(3 downto 0) := (others => '0');
   signal continue : std_logic := '0';
   signal set_acumulator : std_logic := '0';
   signal reset_acumulator : std_logic := '0';
   signal set_counter : std_logic := '0';
   signal reset_counter : std_logic := '0';
   signal reset_pow : std_logic := '0';
   signal reset_result : std_logic := '0';

 	--Outputs
   signal pow_ready : std_logic;
   signal multiplication_ready : std_logic;
   signal result_ready : std_logic;
   signal result : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clock_period : time := 50 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: entity work.operative_block PORT MAP (
          clock => clock,
			 beginning => beginning,
          memory_value_a => memory_value_a,
          memory_value_counter => memory_value_counter,
          memory_value_pow => memory_value_pow,
          continue => continue,
          set_acumulator => set_acumulator,
          reset_acumulator => reset_acumulator,
          set_counter => set_counter,
          reset_counter => reset_counter,
          reset_pow => reset_pow,
          reset_result => reset_result,
          pow_ready => pow_ready,
          multiplication_ready => multiplication_ready,
          result_ready => result_ready,
          result => result
        );

   -- Clock process definitions
   clock_process :process
   begin
		clock <= '0';
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
   end process;
	
	beginning <= '1', '0' after 50 ns;
	set_acumulator <= '1';
	reset_acumulator <= '1', '0' after 5 ns;
	set_counter <= '1';
	reset_counter <= '1','0' after 5 ns;
	reset_result <= '1', '0' after 5 ns;
	--memory_value_a <= "0000";
	--memory_value_counter <= "0000";
	memory_value_a <= "0010";
	memory_value_counter <= "0011";

END;
