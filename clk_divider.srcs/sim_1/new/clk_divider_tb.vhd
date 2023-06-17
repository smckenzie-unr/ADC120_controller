----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/14/2023 05:34:48 PM
-- Design Name: 
-- Module Name: clk_divider_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity clk_divider_tb is
end clk_divider_tb;

architecture Behavioral of clk_divider_tb is
     signal clock_in : std_logic := '0';
     signal areset_in : std_logic := '1';
     signal enable_in : std_logic := '1';
     signal clock_out : std_logic := '0';
begin
    UUT : entity work.clk_divider generic map(clk_divider => 1)
                                  port map(clk_in => clock_in,
                                           arstn_in => areset_in,
                                           enablen_in => enable_in,
                                           clk_out => clock_out);
    clock_in <= '1' after 5 ns when clock_in = '0' else
			    '0' after 5 ns when clock_in = '1';
	enable_in <= '0' after 50 ns,
	             '1' after 250 ns;
end Behavioral;
