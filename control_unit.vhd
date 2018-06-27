LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY control_unit IS
PORT (Reset, clock, result_ready : IN STD_LOGIC;
instruction : IN STD_LOGIC(8 DOWNTO 0);
set_a, set_counter, set_pow, begining, result_ready : OUT STD_LOGIC);
END control_unit;

ARCHITECTURE behaviour OF control_unit IS
	TYPE state_type IS (READ_MEMORY, CHECK_VALUES, INVERT_OPERATORS, RESULT, MULTIPLICATION, POW);
	SIGNAL state: state_type;
BEGIN
	-- Logica de proximo estado (e registrador de estado)
	PROCESS (clock, Reset, instruction)
	BEGIN
		IF(Reset = '1') THEN
			state <= READ_MEMORY;
		ELSIF (clock'EVENT AND clock = '1') THEN
			CASE state IS
		WHEN READ_MEMORY =>
                result_ready <= '0';
			begining <= '1';
                    IF (instruction (8) = 0) THEN
                        --multiplication
                        memory_value_a <= instruction(7 downto 4);  --downto?
                        memory_value_counter <= instruction(3 downto 0);
                        --memory_value_pow <= '0';          --already reseted
                        set_a <= '1';
                        set_counter <= '1';
                        state <= CHECK_VALUES;
                    ELSE
                        --pow
                        memory_value_a <= instruction(7 downto 4);  --downto?
                        --memory_value_counter <= '0';
                        memory_value_pow <= instruction(3 downto 0);
                        set_a <= '1';
                        set_pow <= '1';
                        continue <= '1';
                        state <= POW;
					END IF;
				--WHEN CHECK_VALUES =>
                  --  if (ready = 1) THEN
                    --    set_a <= '1';
                      --  set_counter <= '1';
                        --state <= READ_MEMORY;
                    --END IF;
                WHEN MULTIPLICATION =>
		    begining <= '0';
                    set_counter <= '1';
                    set_a <= '0';
                    IF (multiplication_ready = '1') THEN
                        continue <= '1';
                        state <= POW;
                    END IF;
                WHEN POW =>
						  begining <= '0';
                    set_counter <= '0';
                    set_a <= '0';
                    set_pow <= '0';
                    IF (pow_ready = '1') THEN
                        state <= RESULT;
                    ELSE
                        continue <= '0';
                        state <= MULTIPLICATION;
                    END IF;
				--WHEN INVERT_OPERATORS =>
					--load_a <= '0';
					--load_b <= '0';
					--result_ready <= '0';
					--IF (result_ready = '1') THEN
						--state <= INVERT_OPERATORS;
					--ELSE
						--result_ready <= '1';
						--state <= RESULT;
					--end if;
				WHEN RESULT =>
					state <= READ_MEMORY;
					set_a <= '0';
					set_counter <= '0';
                    set_pow <= '0';
					result_ready <= '1';
					reset <= '1';
			END CASE;
		END IF;
	END PROCESS;
END behaviour;
