----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:47:35 06/30/2018 
-- Design Name: 
-- Module Name:    power_block - Behavioral 
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

entity power_block is
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
end power_block;

architecture Behavioral of power_block is
	component reg 
    Port (clock 	: in  STD_LOGIC;
			 set 	: in  STD_LOGIC;   --allow the register value to change
			 reset 	: in  STD_LOGIC;
			 input 	: in STD_LOGIC_VECTOR(3 downto 0 ); --the new value to be stored
			 stored 	: BUFFER  STD_LOGIC_VECTOR(3 downto 0)); --the stored value
	end component;
	
	component subtractor
    Port ( a : in  STD_LOGIC_VECTOR(3 downto 0);
           b : in  STD_LOGIC_VECTOR(3 downto 0);
           s : out  STD_LOGIC_VECTOR(3 downto 0));
	end component;
	
	component mux
    Port ( a, b	: in  STD_LOGIC_VECTOR(3 downto 0);
           opt 	: in  STD_LOGIC;
           s 	: out  STD_LOGIC_VECTOR(3 downto 0));
	end component;
	
	component comparator_zero 
	Port (
		input	: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		zero: OUT STD_LOGIC
	);
	end component;
	
	component logic_or
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           s : out  STD_LOGIC);
	end component;

signal base_val, counter_val, result_val, sub_val, mux_counter_out, mux_result_out, sub_counter_out : std_logic_vector(3 downto 0);
signal comp_zero_out, comp_counter_out, or_result_out : std_logic;
begin

	reg_expoente : reg port map (clock, set_base,      reset_base,      mem_base, base_val);
	reg_contador : reg port map (clock, set_counter,   reset_counter,   mux_counter_out, counter_val);
	reg_resultado : reg port map(clock, set_resultado, reset_resultado, mux_result_out, result_val);
	
	comp_counter : comparator_zero port map (mem_counter, comp_counter_out);
	
	subt_counter : subtractor port map (mem_counter, "0001", sub_counter_out);
	mux_counter : mux port map (sub_val, sub_counter_out, start, mux_counter_out);
	mux_result : mux port map (mult_result, mem_base, start, mux_result_out);
	
	comp_zero : comparator_zero port map (counter_val, comp_zero_out);
	subt : subtractor port map (counter_val, "0001", sub_val);
	
	or_result : logic_or port map (comp_zero_out, comp_counter_out, or_result_out); 
	
	base_value <= base_val;
	result <=  result_val;
	result_ready <= or_result_out;
	
end Behavioral;

